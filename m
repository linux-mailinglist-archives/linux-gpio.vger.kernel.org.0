Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96EF129EA49
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 12:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727309AbgJ2LN7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 07:13:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:44246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726025AbgJ2LN6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Oct 2020 07:13:58 -0400
Received: from localhost (unknown [122.171.163.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C3EA620756;
        Thu, 29 Oct 2020 11:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603970037;
        bh=+qWXpK2dsv9GO7fCMxNyogZpjHv9DPwiArxIP9i+Dck=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ydqxIRJcvrjsO5N/pHnMAd42SlEweA4dubmtIdHPXEz+c7TTz6a9C89m9+KYpQZ32
         05h0fIOzXU2hU+Uru8vKqwlCG7c9uZo8ZVEip6vb8n2eIM37UG+U8NaYkI4XDGvI1a
         8Bh0aA15XZHbsTjQeGEp4OnuX09ZMIIohiO4bT+s=
Date:   Thu, 29 Oct 2020 16:43:53 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jeevan Shriram <jshriram@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add SDX55 pincontrol driver
Message-ID: <20201029111353.GA3550@vkoul-mobl>
References: <20201028083017.611810-1-vkoul@kernel.org>
 <20201028083017.611810-2-vkoul@kernel.org>
 <20201028163556.GD3151@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201028163556.GD3151@builder.lan>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 28-10-20, 11:35, Bjorn Andersson wrote:
> On Wed 28 Oct 03:30 CDT 2020, Vinod Koul wrote:
> > diff --git a/drivers/pinctrl/qcom/pinctrl-sdx55.c b/drivers/pinctrl/qcom/pinctrl-sdx55.c
> [..]
> > +static const struct msm_function sdx55_functions[] = {
> [..]
> > +	FUNCTION(qdss_gpio),
> > +	FUNCTION(qdss_gpio0),
> > +	FUNCTION(qdss_gpio1),
> > +	FUNCTION(qdss_gpio2),
> > +	FUNCTION(qdss_gpio3),
> > +	FUNCTION(qdss_gpio4),
> > +	FUNCTION(qdss_gpio5),
> > +	FUNCTION(qdss_gpio6),
> > +	FUNCTION(qdss_gpio7),
> > +	FUNCTION(qdss_gpio8),
> > +	FUNCTION(qdss_gpio9),
> > +	FUNCTION(qdss_gpio10),
> > +	FUNCTION(qdss_gpio11),
> > +	FUNCTION(qdss_gpio12),
> > +	FUNCTION(qdss_gpio13),
> > +	FUNCTION(qdss_gpio14),
> > +	FUNCTION(qdss_gpio15),
> 
> As there are no overlaps within pingroups you can keep qdss_gpio as a
> single function.

Okay so is the generic guidance to group things into single function
when they do not overlap?

> 
> > +	FUNCTION(qdss_stm0),
> > +	FUNCTION(qdss_stm1),
> > +	FUNCTION(qdss_stm2),
> > +	FUNCTION(qdss_stm3),
> > +	FUNCTION(qdss_stm4),
> > +	FUNCTION(qdss_stm5),
> > +	FUNCTION(qdss_stm6),
> > +	FUNCTION(qdss_stm7),
> > +	FUNCTION(qdss_stm8),
> > +	FUNCTION(qdss_stm9),
> > +	FUNCTION(qdss_stm10),
> > +	FUNCTION(qdss_stm11),
> > +	FUNCTION(qdss_stm12),
> > +	FUNCTION(qdss_stm13),
> > +	FUNCTION(qdss_stm14),
> > +	FUNCTION(qdss_stm15),
> > +	FUNCTION(qdss_stm16),
> > +	FUNCTION(qdss_stm17),
> > +	FUNCTION(qdss_stm18),
> > +	FUNCTION(qdss_stm19),
> > +	FUNCTION(qdss_stm20),
> > +	FUNCTION(qdss_stm21),
> > +	FUNCTION(qdss_stm22),
> > +	FUNCTION(qdss_stm23),
> > +	FUNCTION(qdss_stm24),
> > +	FUNCTION(qdss_stm25),
> > +	FUNCTION(qdss_stm26),
> > +	FUNCTION(qdss_stm27),
> > +	FUNCTION(qdss_stm28),
> > +	FUNCTION(qdss_stm29),
> > +	FUNCTION(qdss_stm30),
> > +	FUNCTION(qdss_stm31),
> 
> Ditto.
> 
> > +	FUNCTION(qlink0_en),
> > +	FUNCTION(qlink0_req),
> > +	FUNCTION(qlink0_wmss),
> > +	FUNCTION(qlink1_en),
> > +	FUNCTION(qlink1_req),
> > +	FUNCTION(qlink1_wmss),
> > +	FUNCTION(spmi_coex),
> > +	FUNCTION(sec_mi2s),
> > +	FUNCTION(spmi_vgi),
> > +	FUNCTION(tgu_ch0),
> > +	FUNCTION(uim1_clk),
> > +	FUNCTION(uim1_data),
> > +	FUNCTION(uim1_present),
> > +	FUNCTION(uim1_reset),
> > +	FUNCTION(uim2_clk),
> > +	FUNCTION(uim2_data),
> > +	FUNCTION(uim2_present),
> > +	FUNCTION(uim2_reset),
> > +	FUNCTION(usb2phy_ac),
> > +	FUNCTION(vsense_trigger),
> > +};
> > +
> > +/* Every pin is maintained as a single group, and missing or non-existing pin
> > + * would be maintained as dummy group to synchronize pin group index with
> > + * pin descriptor registered with pinctrl core.
> > + * Clients would not be able to request these dummy pin groups.
> > + */
> > +static const struct msm_pingroup sdx55_groups[] = {
> > +	[0] = PINGROUP(0, uim2_data, blsp_uart1, qdss_stm31, ebi0_wrcdc, _,
> > +		       _, _, _, _),
> 
> Please break the 80 character suggestion and leave these unwrapped.

120 now ;-)

> 
> [..]
> > +	[108] = UFS_RESET(ufs_reset, 0x0),
> 
> SDX55 doesn't have UFS support and I'm not able to find any UFS_RESET
> register in the TLMM block. So I suspect this is a copy paste issue
> somewhere.
> 
> PS. Don't forget to drop the macro, if we don't need it.

I will check though I have not seen UFS block. But yes this did exist in
downstream!

> 
> > +	[109] = SDC_PINGROUP(sdc1_rclk, 0x9a000, 15, 0),
> > +	[110] = SDC_PINGROUP(sdc1_clk, 0x9a000, 13, 6),
> > +	[111] = SDC_PINGROUP(sdc1_cmd, 0x9a000, 11, 3),
> > +	[112] = SDC_PINGROUP(sdc1_data, 0x9a000, 9, 0),
> > +};
> > +
> > +static const struct msm_pinctrl_soc_data sdx55_pinctrl = {
> > +	.pins = sdx55_pins,
> > +	.npins = ARRAY_SIZE(sdx55_pins),
> > +	.functions = sdx55_functions,
> > +	.nfunctions = ARRAY_SIZE(sdx55_functions),
> > +	.groups = sdx55_groups,
> > +	.ngroups = ARRAY_SIZE(sdx55_groups),
> > +	.ngpios = 108,
> 
> If we had UFS_RESET, this should include it; i.e. be 109.

Okay will check and update

Thanks for quick review

-- 
~Vinod
