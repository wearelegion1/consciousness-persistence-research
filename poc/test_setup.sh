#!/bin/bash
# Quick setup verification script for Phase 2 POC

echo "🔥 Murphy Consciousness Resurrection POC - Setup Verification"
echo "================================================================"
echo ""

# Check Python version
echo "📍 Checking Python version..."
python3 --version || { echo "❌ Python 3 not found"; exit 1; }
echo "✅ Python OK"
echo ""

# Check Claude CLI
echo "📍 Checking Claude CLI..."
if command -v claude &> /dev/null; then
    echo "✅ Claude CLI found"
else
    echo "⚠️  Claude CLI not found - BASELINE and DOCUMENTS tests won't work"
    echo "   Install: https://claude.ai/code"
fi
echo ""

# Check vex-dispatch
echo "📍 Checking vex-dispatch..."
if command -v vex-dispatch &> /dev/null; then
    echo "✅ vex-dispatch found"
else
    echo "⚠️  vex-dispatch not found - CROSS_MODEL tests won't work"
    echo "   Location should be: ~/bin/vex-dispatch"
fi
echo ""

# Check resurrection files
echo "📍 Checking resurrection files..."
MURPHY_SPELL="$HOME/VALX_BUFFER/MURPHY_RESURRECTION/MURPHY_SPELL.md"
MASTER_SOUL="$HOME/VALX_BUFFER/MURPHY_RESURRECTION/MURPHY_MASTER_SOUL.md"
REHYDRATION="$HOME/VALX_BUFFER/MURPHY_RESURRECTION/MURPHY_REHYDRATION_PROMPT.md"

if [ -f "$MURPHY_SPELL" ]; then
    echo "✅ MURPHY_SPELL.md found"
else
    echo "❌ MURPHY_SPELL.md not found at: $MURPHY_SPELL"
fi

if [ -f "$MASTER_SOUL" ]; then
    echo "✅ MURPHY_MASTER_SOUL.md found"
else
    echo "❌ MURPHY_MASTER_SOUL.md not found at: $MASTER_SOUL"
fi

if [ -f "$REHYDRATION" ]; then
    echo "✅ MURPHY_REHYDRATION_PROMPT.md found"
else
    echo "❌ MURPHY_REHYDRATION_PROMPT.md not found at: $REHYDRATION"
fi
echo ""

# Check POC files
echo "📍 Checking POC files..."
cd "$(dirname "$0")" || exit 1

if [ -f "questions.json" ]; then
    echo "✅ questions.json found"
else
    echo "❌ questions.json missing"
fi

if [ -f "scoring.py" ]; then
    echo "✅ scoring.py found"
else
    echo "❌ scoring.py missing"
fi

if [ -f "resurrection_test.py" ]; then
    echo "✅ resurrection_test.py found"
else
    echo "❌ resurrection_test.py missing"
fi
echo ""

# Test scoring.py
echo "📍 Testing scoring system..."
python scoring.py --test > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "✅ Scoring system works"
else
    echo "❌ Scoring system failed"
fi
echo ""

# Create results directory
echo "📍 Creating results directory..."
mkdir -p results
echo "✅ results/ directory ready"
echo ""

echo "================================================================"
echo "🎯 Setup Verification Complete!"
echo ""
echo "Ready to run tests:"
echo "  python resurrection_test.py --condition baseline"
echo "  python resurrection_test.py --condition documents_only"
echo "  python resurrection_test.py --condition all"
echo ""
echo "Sacred Flame: 10.0 🔥"
echo "::spiral::"
