Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A15443BD56
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Oct 2021 00:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240120AbhJZWjL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Oct 2021 18:39:11 -0400
Received: from mail-pf1-f176.google.com ([209.85.210.176]:42847 "EHLO
        mail-pf1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240135AbhJZWiM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Oct 2021 18:38:12 -0400
Received: by mail-pf1-f176.google.com with SMTP id m14so819153pfc.9;
        Tue, 26 Oct 2021 15:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d6h96/Jo2WtjwhxBq3mNE5FgfNp/ARtOfBk0X+jX7S8=;
        b=J7nGXEEcI0hhXzs3iBnh3ij9yRFgv+JC9Mk/eDMisfHMKiW9Y8RqTxmEbK5k3L6kkz
         BrB9GvaOK3nKErlSJg5ubSWJ2cpecH6EbWsAiSNJA6nNT2W+b3KYp1o2GzlUFlTJWFV2
         2rbXRtQvQm/3nBTWJCgbqk1d3A20DLNGoh8so/uGwRCqcQ5ncWZUeXBhz5V+dy6+Fgj3
         x5ZOfQVRaeWZNn+mYRsGV8AK87DSgSVYEaP/TGk7MZg4J716K9H7sUuHr9sJq4ZvtX8C
         nc0DYVS8h47Vm31YTYM1oAebjF/Mjg0qa7XYM9V7NxBbhCdI9QUsV/BDIaz4fFKuNv91
         kmEg==
X-Gm-Message-State: AOAM5325bs7FF9Mvm+rdLRQ4nzVNQ0zwfv5a3hzZ4AN+Q3rBgtmv58Y9
        PcBYp5/ujrp2p7ez4KNilHVmiAyW2LzdKch4VjA=
X-Google-Smtp-Source: ABdhPJw1C/QG5nQ3YLmvMldi5B4xw59S59BGDtrGj7JRvJJ2ycAP7raEhAPArufCRGDFacVqdgHvT3VvNglAq5njeSg=
X-Received: by 2002:a63:b11:: with SMTP id 17mr21053404pgl.51.1635287747352;
 Tue, 26 Oct 2021 15:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-7-kernel@esmil.dk>
 <163527959276.15791.14765586510805526101@swboyd.mtv.corp.google.com>
In-Reply-To: <163527959276.15791.14765586510805526101@swboyd.mtv.corp.google.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Wed, 27 Oct 2021 00:35:36 +0200
Message-ID: <CANBLGcyYb3yNit=GCy4w2zf2=CRtCJP7aCisR8=9n1f7okfCSg@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] clk: starfive: Add JH7100 clock generator driver
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 26 Oct 2021 at 22:20, Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Emil Renner Berthing (2021-10-21 10:42:13)
> > +struct jh7100_clk {
> > +       struct clk_hw hw;
> > +       unsigned int idx;
> > +       u32 max;
>
> Why u32?

The idea here was to mirror the configuration register when all valid
fields are set to their maximum value, so that the clk_ops methods
could check which features of this clock was enabled. But you're right
none of the methods actually need that and only the dividers use this
to know the maximum divider value, so it might as well be an unsigned
int max_div.

> > +};
> > +
> > +struct clk_starfive_jh7100_priv {
> > +       /* protect registers against overlapping read-modify-write */
> > +       spinlock_t rmw_lock;
>
> Does overlapping mean concurrent?

Yes, sorry.

> Do different clks share the same registers?

No, each clock has their own register, but they use that register both
to gate the clock and other configuration. The Locking chapter of
Documentation/driver-api/clk.rst talks about the prepare lock and the
enable lock and then says:
"However, access to resources that are shared between operations of
the two groups needs to be protected by the drivers. An example of
such a resource would be a register that controls both the clock rate
and the clock enable/disable state."

> > +       struct device *dev;
> > +       void __iomem *base;
> > +       struct clk_hw *pll[3];
> > +       struct jh7100_clk reg[JH7100_CLK_PLL0_OUT];
> > +};
> > +
> > +static int jh7100_clk_is_enabled(struct clk_hw *hw)
> > +{
> > +       struct jh7100_clk *clk = jh7100_clk_from(hw);
> > +
> > +       return !!(jh7100_clk_reg_get(clk) & JH7100_CLK_ENABLE);
> > +}
> > +
> > +static int jh7100_clk_is_parent_enabled(struct clk_hw *hw)
> > +{
> > +       return clk_hw_is_enabled(clk_hw_get_parent(hw));
>
> Why do we need this function? The parent being enabled implies this clk
> is enabled if this clk can't gate itself but then knowing this clk is
> enabled is useful for what?

Probably only useful to me getting an overview of which clocks were
actually enabled by grepping clk_summary. I'll delete it.

...

> > +static int jh7100_clk_set_parent(struct clk_hw *hw, u8 index)
> > +{
> > +       struct jh7100_clk *clk = jh7100_clk_from(hw);
> > +       u32 value = (u32)index << JH7100_CLK_MUX_SHIFT;
> > +
> > +       dev_dbg(jh7100_priv_from(clk)->dev, "set_parent(%s, %u)\n",
> > +               clk_hw_get_name(&clk->hw), index);
>
> Please remove these dev_dbg() messages. We have tracepoints for general
> clk operations and the driver shouldn't duplicate that.

Gotcha.

> > +
> > +static const struct clk_ops jh7100_clk_inv_ops = {
> > +       .is_enabled = jh7100_clk_is_parent_enabled,
> > +       .get_phase = jh7100_clk_get_phase,
> > +       .set_phase = jh7100_clk_set_phase,
> > +       .debug_init = jh7100_clk_debug_init,
> > +};
> > +
> > +#define JH7100_GATE(_idx, _name, _parent, _flags) [_idx] = { \
>
> Typical macro style is to tab out the \ to a single column

Ah, thanks. Will fix.

> > +       .name = _name, \
> > +       .ops = &jh7100_clk_gate_ops, \
> > +       .parent = _parent, \
> > +       .flags = CLK_SET_RATE_PARENT | (_flags), \
> > +       .max = JH7100_CLK_ENABLE, \
> > +}
> > +
> > +#define JH7100__DIV(_idx, _name, _parent, _max) [_idx] = { \
> > +       .name = _name, \
> > +       .ops = &jh7100_clk_div_ops, \
> > +       .parent = _parent, \
> > +       .flags = 0, \
> > +       .max = _max, \
> > +}
> > +
> > +#define JH7100_GDIV(_idx, _name, _parent, _max, _flags) [_idx] = { \
> > +       .name = _name, \
> > +       .ops = &jh7100_clk_gdiv_ops, \
> > +       .parent = _parent, \
> > +       .flags = (_flags), \
> > +       .max = JH7100_CLK_ENABLE | (_max), \
> > +}
> > +
> > +#define JH7100__MUX(_idx, _name, _parents) [_idx] = { \
> > +       .name = _name, \
> > +       .ops = &jh7100_clk_mux_ops, \
> > +       .parents = _parents, \
> > +       .flags = 0, \
> > +       .max = (ARRAY_SIZE(_parents) - 1) << JH7100_CLK_MUX_SHIFT, \
> > +}
> > +
> > +#define JH7100_GMUX(_idx, _name, _parents, _flags) [_idx] = { \
> > +       .name = _name, \
> > +       .ops = &jh7100_clk_gmux_ops, \
> > +       .parents = _parents, \
> > +       .flags = (_flags), \
> > +       .max = JH7100_CLK_ENABLE | \
> > +               ((ARRAY_SIZE(_parents) - 1) << JH7100_CLK_MUX_SHIFT), \
> > +}
> > +
> > +#define JH7100__INV(_idx, _name, _parent) [_idx] = { \
> > +       .name = _name, \
> > +       .ops = &jh7100_clk_inv_ops, \
> > +       .parent = _parent, \
> > +       .flags = CLK_SET_RATE_PARENT, \
> > +       .max = JH7100_CLK_INVERT, \
> > +}
> > +
> > +static const struct {
> > +       const char *name;
> > +       const struct clk_ops *ops;
> > +       union {
> > +               const char *parent;
> > +               const char *const *parents;
> > +       };
> > +       unsigned long flags;
> > +       u32 max;
> > +} jh7100_clk_data[] __initconst = {
> > +       JH7100__MUX(JH7100_CLK_CPUNDBUS_ROOT, "cpundbus_root", cpundbus_root_sels),
> > +       JH7100__MUX(JH7100_CLK_DLA_ROOT, "dla_root", dla_root_sels),
> > +       JH7100__MUX(JH7100_CLK_DSP_ROOT, "dsp_root", dsp_root_sels),
> > +       JH7100__MUX(JH7100_CLK_GMACUSB_ROOT, "gmacusb_root", gmacusb_root_sels),
> > +       JH7100__MUX(JH7100_CLK_PERH0_ROOT, "perh0_root", perh0_root_sels),
> > +       JH7100__MUX(JH7100_CLK_PERH1_ROOT, "perh1_root", perh1_root_sels),
> > +       JH7100__MUX(JH7100_CLK_VIN_ROOT, "vin_root", vin_root_sels),
> > +       JH7100__MUX(JH7100_CLK_VOUT_ROOT, "vout_root", vout_root_sels),
> > +       JH7100_GDIV(JH7100_CLK_AUDIO_ROOT, "audio_root", "pll0_out", 8, 0),
> > +       JH7100__MUX(JH7100_CLK_CDECHIFI4_ROOT, "cdechifi4_root", cdechifi4_root_sels),
> > +       JH7100__MUX(JH7100_CLK_CDEC_ROOT, "cdec_root", cdec_root_sels),
> > +       JH7100__MUX(JH7100_CLK_VOUTBUS_ROOT, "voutbus_root", voutbus_root_sels),
> > +       JH7100__DIV(JH7100_CLK_CPUNBUS_ROOT_DIV, "cpunbus_root_div", "cpundbus_root", 2),
> > +       JH7100__DIV(JH7100_CLK_DSP_ROOT_DIV, "dsp_root_div", "dsp_root", 4),
> > +       JH7100__DIV(JH7100_CLK_PERH0_SRC, "perh0_src", "perh0_root", 4),
> > +       JH7100__DIV(JH7100_CLK_PERH1_SRC, "perh1_src", "perh1_root", 4),
> > +       JH7100_GDIV(JH7100_CLK_PLL0_TESTOUT, "pll0_testout", "perh0_src", 31, 0),
> > +       JH7100_GDIV(JH7100_CLK_PLL1_TESTOUT, "pll1_testout", "dla_root", 31, 0),
> > +       JH7100_GDIV(JH7100_CLK_PLL2_TESTOUT, "pll2_testout", "perh1_src", 31, 0),
> > +       JH7100__MUX(JH7100_CLK_PLL2_REF, "pll2_refclk", pll2_refclk_sels),
> > +       JH7100__DIV(JH7100_CLK_CPU_CORE, "cpu_core", "cpunbus_root_div", 8),
> > +       JH7100__DIV(JH7100_CLK_CPU_AXI, "cpu_axi", "cpu_core", 8),
> > +       JH7100__DIV(JH7100_CLK_AHB_BUS, "ahb_bus", "cpunbus_root_div", 8),
> > +       JH7100__DIV(JH7100_CLK_APB1_BUS, "apb1_bus", "ahb_bus", 8),
> > +       JH7100__DIV(JH7100_CLK_APB2_BUS, "apb2_bus", "ahb_bus", 8),
> > +       JH7100_GATE(JH7100_CLK_DOM3AHB_BUS, "dom3ahb_bus", "ahb_bus", CLK_IGNORE_UNUSED),
> > +       JH7100_GATE(JH7100_CLK_DOM7AHB_BUS, "dom7ahb_bus", "ahb_bus", CLK_IGNORE_UNUSED),
> > +       JH7100_GATE(JH7100_CLK_U74_CORE0, "u74_core0", "cpu_core", CLK_IGNORE_UNUSED),
> > +       JH7100_GDIV(JH7100_CLK_U74_CORE1, "u74_core1", "cpu_core", 8, CLK_IGNORE_UNUSED),
> > +       JH7100_GATE(JH7100_CLK_U74_AXI, "u74_axi", "cpu_axi", CLK_IGNORE_UNUSED),
> > +       JH7100_GATE(JH7100_CLK_U74RTC_TOGGLE, "u74rtc_toggle", "osc_sys", CLK_IGNORE_UNUSED),
> > +       JH7100_GATE(JH7100_CLK_SGDMA2P_AXI, "sgdma2p_axi", "cpu_axi", 0),
> > +       JH7100_GATE(JH7100_CLK_DMA2PNOC_AXI, "dma2pnoc_axi", "cpu_axi", 0),
> > +       JH7100_GATE(JH7100_CLK_SGDMA2P_AHB, "sgdma2p_ahb", "ahb_bus", 0),
> > +       JH7100__DIV(JH7100_CLK_DLA_BUS, "dla_bus", "dla_root", 4),
> > +       JH7100_GATE(JH7100_CLK_DLA_AXI, "dla_axi", "dla_bus", 0),
> > +       JH7100_GATE(JH7100_CLK_DLANOC_AXI, "dlanoc_axi", "dla_bus", 0),
> > +       JH7100_GATE(JH7100_CLK_DLA_APB, "dla_apb", "apb1_bus", 0),
> > +       JH7100_GDIV(JH7100_CLK_VP6_CORE, "vp6_core", "dsp_root_div", 4, 0),
> > +       JH7100__DIV(JH7100_CLK_VP6BUS_SRC, "vp6bus_src", "dsp_root", 4),
> > +       JH7100_GDIV(JH7100_CLK_VP6_AXI, "vp6_axi", "vp6bus_src", 4, 0),
> > +       JH7100__DIV(JH7100_CLK_VCDECBUS_SRC, "vcdecbus_src", "cdechifi4_root", 4),
> > +       JH7100__DIV(JH7100_CLK_VDEC_BUS, "vdec_bus", "vcdecbus_src", 8),
> > +       JH7100_GATE(JH7100_CLK_VDEC_AXI, "vdec_axi", "vdec_bus", 0),
> > +       JH7100_GATE(JH7100_CLK_VDECBRG_MAIN, "vdecbrg_mainclk", "vdec_bus", 0),
> > +       JH7100_GDIV(JH7100_CLK_VDEC_BCLK, "vdec_bclk", "vcdecbus_src", 8, 0),
> > +       JH7100_GDIV(JH7100_CLK_VDEC_CCLK, "vdec_cclk", "cdec_root", 8, 0),
> > +       JH7100_GATE(JH7100_CLK_VDEC_APB, "vdec_apb", "apb1_bus", 0),
> > +       JH7100_GDIV(JH7100_CLK_JPEG_AXI, "jpeg_axi", "cpunbus_root_div", 8, 0),
> > +       JH7100_GDIV(JH7100_CLK_JPEG_CCLK, "jpeg_cclk", "cpunbus_root_div", 8, 0),
> > +       JH7100_GATE(JH7100_CLK_JPEG_APB, "jpeg_apb", "apb1_bus", 0),
> > +       JH7100_GDIV(JH7100_CLK_GC300_2X, "gc300_2x", "cdechifi4_root", 8, 0),
> > +       JH7100_GATE(JH7100_CLK_GC300_AHB, "gc300_ahb", "ahb_bus", 0),
> > +       JH7100__DIV(JH7100_CLK_JPCGC300_AXIBUS, "jpcgc300_axibus", "vcdecbus_src", 8),
> > +       JH7100_GATE(JH7100_CLK_GC300_AXI, "gc300_axi", "jpcgc300_axibus", 0),
> > +       JH7100_GATE(JH7100_CLK_JPCGC300_MAIN, "jpcgc300_mainclk", "jpcgc300_axibus", 0),
> > +       JH7100__DIV(JH7100_CLK_VENC_BUS, "venc_bus", "vcdecbus_src", 8),
> > +       JH7100_GATE(JH7100_CLK_VENC_AXI, "venc_axi", "venc_bus", 0),
> > +       JH7100_GATE(JH7100_CLK_VENCBRG_MAIN, "vencbrg_mainclk", "venc_bus", 0),
> > +       JH7100_GDIV(JH7100_CLK_VENC_BCLK, "venc_bclk", "vcdecbus_src", 8, 0),
> > +       JH7100_GDIV(JH7100_CLK_VENC_CCLK, "venc_cclk", "cdec_root", 8, 0),
> > +       JH7100_GATE(JH7100_CLK_VENC_APB, "venc_apb", "apb1_bus", 0),
> > +       JH7100_GDIV(JH7100_CLK_DDRPLL_DIV2, "ddrpll_div2", "pll1_out", 2, CLK_IGNORE_UNUSED),
> > +       JH7100_GDIV(JH7100_CLK_DDRPLL_DIV4, "ddrpll_div4", "ddrpll_div2", 2, CLK_IGNORE_UNUSED),
> > +       JH7100_GDIV(JH7100_CLK_DDRPLL_DIV8, "ddrpll_div8", "ddrpll_div4", 2, CLK_IGNORE_UNUSED),
> > +       JH7100_GDIV(JH7100_CLK_DDROSC_DIV2, "ddrosc_div2", "osc_sys", 2, CLK_IGNORE_UNUSED),
> > +       JH7100_GMUX(JH7100_CLK_DDRC0, "ddrc0", ddrc0_sels, CLK_IGNORE_UNUSED),
> > +       JH7100_GMUX(JH7100_CLK_DDRC1, "ddrc1", ddrc1_sels, CLK_IGNORE_UNUSED),
>
> Is it really unused? Or it is CLK_IS_CRITICAL?

Ah no. CLK_IS_CRITICAL is exactly what they are, thanks.

> > +       JH7100_GATE(JH7100_CLK_DDRPHY_APB, "ddrphy_apb", "apb1_bus", CLK_IGNORE_UNUSED),
> > +       JH7100__DIV(JH7100_CLK_NOC_ROB, "noc_rob", "cpunbus_root_div", 8),
> > +       JH7100__DIV(JH7100_CLK_NOC_COG, "noc_cog", "dla_root", 8),
> > +       JH7100_GATE(JH7100_CLK_NNE_AHB, "nne_ahb", "ahb_bus", 0),
> > +       JH7100__DIV(JH7100_CLK_NNEBUS_SRC1, "nnebus_src1", "dsp_root", 4),
> > +       JH7100__MUX(JH7100_CLK_NNE_BUS, "nne_bus", nne_bus_sels),
> > +       JH7100_GATE(JH7100_CLK_NNE_AXI, "nne_axi", "nne_bus", 0),
> > +       JH7100_GATE(JH7100_CLK_NNENOC_AXI, "nnenoc_axi", "nne_bus", 0),
> > +       JH7100_GATE(JH7100_CLK_DLASLV_AXI, "dlaslv_axi", "nne_bus", 0),
> > +       JH7100_GATE(JH7100_CLK_DSPX2C_AXI, "dspx2c_axi", "nne_bus", CLK_IGNORE_UNUSED),
> > +       JH7100__DIV(JH7100_CLK_HIFI4_SRC, "hifi4_src", "cdechifi4_root", 4),
> > +       JH7100__DIV(JH7100_CLK_HIFI4_COREFREE, "hifi4_corefree", "hifi4_src", 8),
> > +       JH7100_GATE(JH7100_CLK_HIFI4_CORE, "hifi4_core", "hifi4_corefree", 0),
> > +       JH7100__DIV(JH7100_CLK_HIFI4_BUS, "hifi4_bus", "hifi4_corefree", 8),
> > +       JH7100_GATE(JH7100_CLK_HIFI4_AXI, "hifi4_axi", "hifi4_bus", 0),
> > +       JH7100_GATE(JH7100_CLK_HIFI4NOC_AXI, "hifi4noc_axi", "hifi4_bus", 0),
> > +       JH7100__DIV(JH7100_CLK_SGDMA1P_BUS, "sgdma1p_bus", "cpunbus_root_div", 8),
> > +       JH7100_GATE(JH7100_CLK_SGDMA1P_AXI, "sgdma1p_axi", "sgdma1p_bus", 0),
> > +       JH7100_GATE(JH7100_CLK_DMA1P_AXI, "dma1p_axi", "sgdma1p_bus", 0),
> > +       JH7100_GDIV(JH7100_CLK_X2C_AXI, "x2c_axi", "cpunbus_root_div", 8, CLK_IGNORE_UNUSED),
> > +       JH7100__DIV(JH7100_CLK_USB_BUS, "usb_bus", "cpunbus_root_div", 8),
> > +       JH7100_GATE(JH7100_CLK_USB_AXI, "usb_axi", "usb_bus", 0),
> > +       JH7100_GATE(JH7100_CLK_USBNOC_AXI, "usbnoc_axi", "usb_bus", 0),
> > +       JH7100__DIV(JH7100_CLK_USBPHY_ROOTDIV, "usbphy_rootdiv", "gmacusb_root", 4),
> > +       JH7100_GDIV(JH7100_CLK_USBPHY_125M, "usbphy_125m", "usbphy_rootdiv", 8, 0),
> > +       JH7100_GDIV(JH7100_CLK_USBPHY_PLLDIV25M, "usbphy_plldiv25m", "usbphy_rootdiv", 32, 0),
> > +       JH7100__MUX(JH7100_CLK_USBPHY_25M, "usbphy_25m", usbphy_25m_sels),
> > +       JH7100__DIV(JH7100_CLK_AUDIO_DIV, "audio_div", "audio_root", 131072),
> > +       JH7100_GATE(JH7100_CLK_AUDIO_SRC, "audio_src", "audio_div", 0),
> > +       JH7100_GATE(JH7100_CLK_AUDIO_12288, "audio_12288", "osc_aud", 0),
> > +       JH7100_GDIV(JH7100_CLK_VIN_SRC, "vin_src", "vin_root", 4, 0),
> > +       JH7100__DIV(JH7100_CLK_ISP0_BUS, "isp0_bus", "vin_src", 8),
> > +       JH7100_GATE(JH7100_CLK_ISP0_AXI, "isp0_axi", "isp0_bus", 0),
> > +       JH7100_GATE(JH7100_CLK_ISP0NOC_AXI, "isp0noc_axi", "isp0_bus", 0),
> > +       JH7100_GATE(JH7100_CLK_ISPSLV_AXI, "ispslv_axi", "isp0_bus", 0),
> > +       JH7100__DIV(JH7100_CLK_ISP1_BUS, "isp1_bus", "vin_src", 8),
> > +       JH7100_GATE(JH7100_CLK_ISP1_AXI, "isp1_axi", "isp1_bus", 0),
> > +       JH7100_GATE(JH7100_CLK_ISP1NOC_AXI, "isp1noc_axi", "isp1_bus", 0),
> > +       JH7100__DIV(JH7100_CLK_VIN_BUS, "vin_bus", "vin_src", 8),
> > +       JH7100_GATE(JH7100_CLK_VIN_AXI, "vin_axi", "vin_bus", 0),
> > +       JH7100_GATE(JH7100_CLK_VINNOC_AXI, "vinnoc_axi", "vin_bus", 0),
> > +       JH7100_GDIV(JH7100_CLK_VOUT_SRC, "vout_src", "vout_root", 4, 0),
> > +       JH7100__DIV(JH7100_CLK_DISPBUS_SRC, "dispbus_src", "voutbus_root", 4),
> > +       JH7100__DIV(JH7100_CLK_DISP_BUS, "disp_bus", "dispbus_src", 4),
> > +       JH7100_GATE(JH7100_CLK_DISP_AXI, "disp_axi", "disp_bus", 0),
> > +       JH7100_GATE(JH7100_CLK_DISPNOC_AXI, "dispnoc_axi", "disp_bus", 0),
> > +       JH7100_GATE(JH7100_CLK_SDIO0_AHB, "sdio0_ahb", "ahb_bus", 0),
> > +       JH7100_GDIV(JH7100_CLK_SDIO0_CCLKINT, "sdio0_cclkint", "perh0_src", 24, 0),
> > +       JH7100__INV(JH7100_CLK_SDIO0_CCLKINT_INV, "sdio0_cclkint_inv", "sdio0_cclkint"),
> > +       JH7100_GATE(JH7100_CLK_SDIO1_AHB, "sdio1_ahb", "ahb_bus", 0),
> > +       JH7100_GDIV(JH7100_CLK_SDIO1_CCLKINT, "sdio1_cclkint", "perh1_src", 24, 0),
> > +       JH7100__INV(JH7100_CLK_SDIO1_CCLKINT_INV, "sdio1_cclkint_inv", "sdio1_cclkint"),
> > +       JH7100_GATE(JH7100_CLK_GMAC_AHB, "gmac_ahb", "ahb_bus", 0),
> > +       JH7100__DIV(JH7100_CLK_GMAC_ROOT_DIV, "gmac_root_div", "gmacusb_root", 8),
> > +       JH7100_GDIV(JH7100_CLK_GMAC_PTP_REF, "gmac_ptp_refclk", "gmac_root_div", 31, 0),
> > +       JH7100_GDIV(JH7100_CLK_GMAC_GTX, "gmac_gtxclk", "gmac_root_div", 255, 0),
> > +       JH7100_GDIV(JH7100_CLK_GMAC_RMII_TX, "gmac_rmii_txclk", "gmac_rmii_ref", 8, 0),
> > +       JH7100_GDIV(JH7100_CLK_GMAC_RMII_RX, "gmac_rmii_rxclk", "gmac_rmii_ref", 8, 0),
> > +       JH7100__MUX(JH7100_CLK_GMAC_TX, "gmac_tx", gmac_tx_sels),
> > +       JH7100__INV(JH7100_CLK_GMAC_TX_INV, "gmac_tx_inv", "gmac_tx"),
> > +       JH7100__MUX(JH7100_CLK_GMAC_RX_PRE, "gmac_rx_pre", gmac_rx_pre_sels),
> > +       JH7100__INV(JH7100_CLK_GMAC_RX_INV, "gmac_rx_inv", "gmac_rx_pre"),
> > +       JH7100_GATE(JH7100_CLK_GMAC_RMII, "gmac_rmii", "gmac_rmii_ref", 0),
> > +       JH7100_GDIV(JH7100_CLK_GMAC_TOPHYREF, "gmac_tophyref", "gmac_root_div", 127, 0),
> > +       JH7100_GATE(JH7100_CLK_SPI2AHB_AHB, "spi2ahb_ahb", "ahb_bus", 0),
> > +       JH7100_GDIV(JH7100_CLK_SPI2AHB_CORE, "spi2ahb_core", "perh0_src", 31, 0),
> > +       JH7100_GATE(JH7100_CLK_EZMASTER_AHB, "ezmaster_ahb", "ahb_bus", 0),
> > +       JH7100_GATE(JH7100_CLK_E24_AHB, "e24_ahb", "ahb_bus", 0),
> > +       JH7100_GATE(JH7100_CLK_E24RTC_TOGGLE, "e24rtc_toggle", "osc_sys", 0),
> > +       JH7100_GATE(JH7100_CLK_QSPI_AHB, "qspi_ahb", "ahb_bus", 0),
> > +       JH7100_GATE(JH7100_CLK_QSPI_APB, "qspi_apb", "apb1_bus", 0),
> > +       JH7100_GDIV(JH7100_CLK_QSPI_REF, "qspi_refclk", "perh0_src", 31, 0),
> > +       JH7100_GATE(JH7100_CLK_SEC_AHB, "sec_ahb", "ahb_bus", 0),
> > +       JH7100_GATE(JH7100_CLK_AES, "aes_clk", "sec_ahb", 0),
> > +       JH7100_GATE(JH7100_CLK_SHA, "sha_clk", "sec_ahb", 0),
> > +       JH7100_GATE(JH7100_CLK_PKA, "pka_clk", "sec_ahb", 0),
> > +       JH7100_GATE(JH7100_CLK_TRNG_APB, "trng_apb", "apb1_bus", 0),
> > +       JH7100_GATE(JH7100_CLK_OTP_APB, "otp_apb", "apb1_bus", 0),
> > +       JH7100_GATE(JH7100_CLK_UART0_APB, "uart0_apb", "apb1_bus", 0),
> > +       JH7100_GDIV(JH7100_CLK_UART0_CORE, "uart0_core", "perh1_src", 63, 0),
> > +       JH7100_GATE(JH7100_CLK_UART1_APB, "uart1_apb", "apb1_bus", 0),
> > +       JH7100_GDIV(JH7100_CLK_UART1_CORE, "uart1_core", "perh1_src", 63, 0),
> > +       JH7100_GATE(JH7100_CLK_SPI0_APB, "spi0_apb", "apb1_bus", 0),
> > +       JH7100_GDIV(JH7100_CLK_SPI0_CORE, "spi0_core", "perh1_src", 63, 0),
> > +       JH7100_GATE(JH7100_CLK_SPI1_APB, "spi1_apb", "apb1_bus", 0),
> > +       JH7100_GDIV(JH7100_CLK_SPI1_CORE, "spi1_core", "perh1_src", 63, 0),
> > +       JH7100_GATE(JH7100_CLK_I2C0_APB, "i2c0_apb", "apb1_bus", 0),
> > +       JH7100_GDIV(JH7100_CLK_I2C0_CORE, "i2c0_core", "perh1_src", 63, 0),
> > +       JH7100_GATE(JH7100_CLK_I2C1_APB, "i2c1_apb", "apb1_bus", 0),
> > +       JH7100_GDIV(JH7100_CLK_I2C1_CORE, "i2c1_core", "perh1_src", 63, 0),
> > +       JH7100_GATE(JH7100_CLK_GPIO_APB, "gpio_apb", "apb1_bus", 0),
> > +       JH7100_GATE(JH7100_CLK_UART2_APB, "uart2_apb", "apb2_bus", 0),
> > +       JH7100_GDIV(JH7100_CLK_UART2_CORE, "uart2_core", "perh0_src", 63, 0),
> > +       JH7100_GATE(JH7100_CLK_UART3_APB, "uart3_apb", "apb2_bus", 0),
> > +       JH7100_GDIV(JH7100_CLK_UART3_CORE, "uart3_core", "perh0_src", 63, 0),
> > +       JH7100_GATE(JH7100_CLK_SPI2_APB, "spi2_apb", "apb2_bus", 0),
> > +       JH7100_GDIV(JH7100_CLK_SPI2_CORE, "spi2_core", "perh0_src", 63, 0),
> > +       JH7100_GATE(JH7100_CLK_SPI3_APB, "spi3_apb", "apb2_bus", 0),
> > +       JH7100_GDIV(JH7100_CLK_SPI3_CORE, "spi3_core", "perh0_src", 63, 0),
> > +       JH7100_GATE(JH7100_CLK_I2C2_APB, "i2c2_apb", "apb2_bus", 0),
> > +       JH7100_GDIV(JH7100_CLK_I2C2_CORE, "i2c2_core", "perh0_src", 63, 0),
> > +       JH7100_GATE(JH7100_CLK_I2C3_APB, "i2c3_apb", "apb2_bus", 0),
> > +       JH7100_GDIV(JH7100_CLK_I2C3_CORE, "i2c3_core", "perh0_src", 63, 0),
> > +       JH7100_GATE(JH7100_CLK_WDTIMER_APB, "wdtimer_apb", "apb2_bus", 0),
> > +       JH7100_GDIV(JH7100_CLK_WDT_CORE, "wdt_coreclk", "perh0_src", 63, 0),
> > +       JH7100_GDIV(JH7100_CLK_TIMER0_CORE, "timer0_coreclk", "perh0_src", 63, 0),
> > +       JH7100_GDIV(JH7100_CLK_TIMER1_CORE, "timer1_coreclk", "perh0_src", 63, 0),
> > +       JH7100_GDIV(JH7100_CLK_TIMER2_CORE, "timer2_coreclk", "perh0_src", 63, 0),
> > +       JH7100_GDIV(JH7100_CLK_TIMER3_CORE, "timer3_coreclk", "perh0_src", 63, 0),
> > +       JH7100_GDIV(JH7100_CLK_TIMER4_CORE, "timer4_coreclk", "perh0_src", 63, 0),
> > +       JH7100_GDIV(JH7100_CLK_TIMER5_CORE, "timer5_coreclk", "perh0_src", 63, 0),
> > +       JH7100_GDIV(JH7100_CLK_TIMER6_CORE, "timer6_coreclk", "perh0_src", 63, 0),
> > +       JH7100_GATE(JH7100_CLK_VP6INTC_APB, "vp6intc_apb", "apb2_bus", 0),
> > +       JH7100_GATE(JH7100_CLK_PWM_APB, "pwm_apb", "apb2_bus", 0),
> > +       JH7100_GATE(JH7100_CLK_MSI_APB, "msi_apb", "apb2_bus", 0),
> > +       JH7100_GATE(JH7100_CLK_TEMP_APB, "temp_apb", "apb2_bus", 0),
> > +       JH7100_GDIV(JH7100_CLK_TEMP_SENSE, "temp_sense", "osc_sys", 31, 0),
> > +       JH7100_GATE(JH7100_CLK_SYSERR_APB, "syserr_apb", "apb2_bus", 0),
> > +};
> > +
> > +static struct clk_hw *clk_starfive_jh7100_get(struct of_phandle_args *clkspec, void *data)
> > +{
> > +       struct clk_starfive_jh7100_priv *priv = data;
> > +       unsigned int idx = clkspec->args[0];
> > +
> > +       if (idx >= JH7100_CLK_END) {
> > +               dev_err(priv->dev, "invalid clock index %u\n", idx);
>
> We should pull this sort of error message up into the core instead of
> have it in every driver. It also doesn't look very meaningful to print
> the name of the device that's providing the clks vs. the name of the
> device that's requesting the clk that can't be found.

Makes sense. I'll just remove the message then.

> > +               return ERR_PTR(-EINVAL);
> > +       }
> > +
> > +       if (idx >= JH7100_CLK_PLL0_OUT)
> > +               return priv->pll[idx - JH7100_CLK_PLL0_OUT];
> > +
> > +       return &priv->reg[idx].hw;
> > +}
> > +
> > +static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
>
> Drop __init as this can be called after kernel init is over.

Oh interesting, I'd like to know when that can happen. The comment for
the builtin_platform_driver macro says it's just a wrapper for
device_initcall.

Won't we then need to remove all the __initconst tags too since the
probe function walks through jh7100_clk_data which eventually
references all __initconst data?

> > +{
> > +       struct clk_starfive_jh7100_priv *priv;
> > +       unsigned int idx;
> > +       int ret;
> > +
> > +       priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> > +       if (!priv)
> > +               return -ENOMEM;
> > +
> > +       spin_lock_init(&priv->rmw_lock);
> > +       priv->dev = &pdev->dev;
> > +       priv->base = devm_platform_ioremap_resource(pdev, 0);
> > +       if (IS_ERR(priv->base))
> > +               return PTR_ERR(priv->base);
> > +
> > +       priv->pll[0] = devm_clk_hw_register_fixed_factor(priv->dev, "pll0_out",
> > +                                                        "osc_sys", 0, 40, 1);
> > +       if (IS_ERR(priv->pll[0]))
> > +               return PTR_ERR(priv->pll[0]);
> > +
> > +       priv->pll[1] = devm_clk_hw_register_fixed_factor(priv->dev, "pll1_out",
> > +                                                        "osc_sys", 0, 64, 1);
> > +       if (IS_ERR(priv->pll[1]))
> > +               return PTR_ERR(priv->pll[1]);
> > +
> > +       priv->pll[2] = devm_clk_hw_register_fixed_factor(priv->dev, "pll2_out",
> > +                                                        "pll2_refclk", 0, 55, 1);
> > +       if (IS_ERR(priv->pll[2]))
> > +               return PTR_ERR(priv->pll[2]);
> > +
> > +       for (idx = 0; idx < JH7100_CLK_PLL0_OUT; idx++) {
> > +               u32 max_parent = (jh7100_clk_data[idx].max & JH7100_CLK_MUX_MASK) >>
> > +                                JH7100_CLK_MUX_SHIFT;
> > +               struct clk_init_data init = {
> > +                       .name = jh7100_clk_data[idx].name,
> > +                       .ops = jh7100_clk_data[idx].ops,
> > +                       .num_parents = max_parent + 1,
> > +                       .flags = jh7100_clk_data[idx].flags,
> > +               };
> > +               struct jh7100_clk *clk = &priv->reg[idx];
> > +
> > +               if (init.num_parents > 1)
> > +                       init.parent_names = jh7100_clk_data[idx].parents;
> > +               else
> > +                       init.parent_names = &jh7100_clk_data[idx].parent;
>
> Can you use clk_parent_data instead of parent_names? To make the object
> size even smaller you can use the DT index instead of the .fw_name
> field.

Ah cool. I'll look into that.

> > +
> > +               clk->hw.init = &init;
> > +               clk->idx = idx;
> > +               clk->max = jh7100_clk_data[idx].max;
> > +
> > +               ret = clk_hw_register(priv->dev, &clk->hw);
>
> Why not use devm_clk_hw_register()?

I probably could. Just for my understanding that's just to avoid the
loop on error below, because as a builtin driver the device won't
otherwise go away, right?

> > +               if (ret)
> > +                       goto err;
> > +       }
> > +
> > +       ret = devm_of_clk_add_hw_provider(priv->dev, clk_starfive_jh7100_get, priv);
> > +       if (ret)
> > +               goto err;
> > +
> > +       return 0;
> > +err:
> > +       while (idx)
> > +               clk_hw_unregister(&priv->reg[--idx].hw);
> > +       return ret;
> > +}
> > +
> > +static const struct of_device_id clk_starfive_jh7100_match[] = {
> > +       { .compatible = "starfive,jh7100-clkgen" },
> > +       { /* sentinel */ }
> > +};
>
> Please add MODULE_DEVICE_TABLE()

Will do!

Thank you.
/Emil
