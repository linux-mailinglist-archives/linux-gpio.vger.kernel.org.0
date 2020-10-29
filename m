Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9573C29EE11
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 15:21:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbgJ2OVf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 10:21:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbgJ2OUL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Oct 2020 10:20:11 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F47EC0613D3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 07:20:11 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id j21so2339674ota.13
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 07:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pE36nmfKCnsKpAZPVaNXR7cA+FjGaWm58O/lID5CHBg=;
        b=dgXWPdG7OHhZ/9q5wSEL2GR0eP0apXyicy1uTbs9L8zrqsk+rJQV0pqThAnWZUufe2
         QqJH3q3iSYdjz7eYi2Ci/ycHKiz418H9K90OhrBlUymFMeZYR/GPE4IfOSRuwHbnY/XA
         WWd1tFeZ/NT3bB89cDgfpoHPPVUgd58sNGLSinPyhKS428GLTMz9DQG2SpQIru3eT1TM
         Lrj7ACJuT0lZfm3REmDvPA3w60p6cSVfec/rImVBJKRF64ZpKeh+eGKAXTIiETV+ry4z
         A1JdWIEsdI2u8+tlnKZS1muiH4pIr3NVTOQLGYEW4mW+6X6+uZ86alW5+/WchxjSmFy6
         ax1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pE36nmfKCnsKpAZPVaNXR7cA+FjGaWm58O/lID5CHBg=;
        b=hi6DZaNrOmbHK7U2QxgjUOp6t2+eN8MjM6fwSTqR4HcVFarqFpH5PnvRIn1kHBvstG
         bSjlrmSfCxTduLjq1DGhGJeUXvalFY/RnjvkSskyaLjj0RDXgEH/MuhfPpUUIpHBZQwC
         onD7KyGrJ9mYL8V2cFo+JRTA54VY+j3sX4qFHXVwmT/dcdOpvELRWlPazZxV1azfkPHL
         tAHI+pFPe+Q2ErfuFetWQLwnvwkEMcGtVPT111psNTQ6Xtd8UJ1/XFeQy5RUR/Nl/Hd3
         bxX9kKwhPKlduGnWw24VS7wSzp9QqE7HAah2FI8ynx4iaQqjjxqioT6qTZ8eksr3vTK+
         BFCQ==
X-Gm-Message-State: AOAM531BYMjNvX0jyiatz1CLH6a3HD+WkIpRAco6e+mni6voiS+IL1pc
        Hnbbs4ms2NqMTgzPzlJa5IkLRw==
X-Google-Smtp-Source: ABdhPJz+jDbt9HxVC8yigRGbCacjLxvrpguWaPk+NajhzjAhJsDG5UIAC1ki397dKFs0h3C6avC8HA==
X-Received: by 2002:a9d:7419:: with SMTP id n25mr3447311otk.183.1603981210414;
        Thu, 29 Oct 2020 07:20:10 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m6sm638016otm.76.2020.10.29.07.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 07:20:09 -0700 (PDT)
Date:   Thu, 29 Oct 2020 09:20:08 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add sc7280 pinctrl driver
Message-ID: <20201029142008.GE3151@builder.lan>
References: <1602831532-24818-1-git-send-email-rnayak@codeaurora.org>
 <1602831532-24818-2-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602831532-24818-2-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri 16 Oct 01:58 CDT 2020, Rajendra Nayak wrote:
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
[..]
> +static const struct msm_function sc7280_functions[] = {
[..]
> +	FUNCTION(phase_flag0),
> +	FUNCTION(phase_flag1),
> +	FUNCTION(phase_flag10),
> +	FUNCTION(phase_flag11),
> +	FUNCTION(phase_flag12),
> +	FUNCTION(phase_flag13),
> +	FUNCTION(phase_flag14),
> +	FUNCTION(phase_flag15),
> +	FUNCTION(phase_flag16),
> +	FUNCTION(phase_flag17),
> +	FUNCTION(phase_flag18),
> +	FUNCTION(phase_flag19),
> +	FUNCTION(phase_flag2),
> +	FUNCTION(phase_flag20),
> +	FUNCTION(phase_flag21),
> +	FUNCTION(phase_flag22),
> +	FUNCTION(phase_flag23),
> +	FUNCTION(phase_flag24),
> +	FUNCTION(phase_flag25),
> +	FUNCTION(phase_flag26),
> +	FUNCTION(phase_flag27),
> +	FUNCTION(phase_flag28),
> +	FUNCTION(phase_flag29),
> +	FUNCTION(phase_flag3),
> +	FUNCTION(phase_flag30),
> +	FUNCTION(phase_flag31),
> +	FUNCTION(phase_flag4),
> +	FUNCTION(phase_flag5),
> +	FUNCTION(phase_flag6),
> +	FUNCTION(phase_flag7),
> +	FUNCTION(phase_flag8),
> +	FUNCTION(phase_flag9),

I prefer when we squash these into a single function.

> +	FUNCTION(pll_bist),
> +	FUNCTION(pll_bypassnl),
> +	FUNCTION(pll_clk),
> +	FUNCTION(pll_reset),
> +	FUNCTION(pri_mi2s),
> +	FUNCTION(prng_rosc),
> +	FUNCTION(qdss_cti),
> +	FUNCTION(qdss_gpio),
> +	FUNCTION(qdss_gpio0),
> +	FUNCTION(qdss_gpio1),
> +	FUNCTION(qdss_gpio10),
> +	FUNCTION(qdss_gpio11),
> +	FUNCTION(qdss_gpio12),
> +	FUNCTION(qdss_gpio13),
> +	FUNCTION(qdss_gpio14),
> +	FUNCTION(qdss_gpio15),
> +	FUNCTION(qdss_gpio2),
> +	FUNCTION(qdss_gpio3),
> +	FUNCTION(qdss_gpio4),
> +	FUNCTION(qdss_gpio5),
> +	FUNCTION(qdss_gpio6),
> +	FUNCTION(qdss_gpio7),
> +	FUNCTION(qdss_gpio8),
> +	FUNCTION(qdss_gpio9),

Ditto.

> +	FUNCTION(qlink0_enable),
> +	FUNCTION(qlink0_request),
> +	FUNCTION(qlink0_wmss),
> +	FUNCTION(qlink1_enable),
> +	FUNCTION(qlink1_request),
> +	FUNCTION(qlink1_wmss),
> +	FUNCTION(qspi_clk),
> +	FUNCTION(qspi_cs),
> +	FUNCTION(qspi_data),
> +	FUNCTION(qup00),
> +	FUNCTION(qup01),
> +	FUNCTION(qup02),
> +	FUNCTION(qup03),
> +	FUNCTION(qup04),
> +	FUNCTION(qup05),
> +	FUNCTION(qup06),
> +	FUNCTION(qup07),
> +	FUNCTION(qup10),
> +	FUNCTION(qup11),
> +	FUNCTION(qup12),
> +	FUNCTION(qup13),
> +	FUNCTION(qup14),
> +	FUNCTION(qup15),
> +	FUNCTION(qup16),
> +	FUNCTION(qup17),
> +	FUNCTION(sdc40),
> +	FUNCTION(sdc41),
> +	FUNCTION(sdc42),
> +	FUNCTION(sdc43),
> +	FUNCTION(sdc4_clk),
> +	FUNCTION(sdc4_cmd),
> +	FUNCTION(sd_write),
> +	FUNCTION(sec_mi2s),
> +	FUNCTION(tb_trig),
> +	FUNCTION(tgu_ch0),
> +	FUNCTION(tgu_ch1),
> +	FUNCTION(tsense_pwm1),
> +	FUNCTION(tsense_pwm2),
> +	FUNCTION(uim0_clk),
> +	FUNCTION(uim0_data),
> +	FUNCTION(uim0_present),
> +	FUNCTION(uim0_reset),
> +	FUNCTION(uim1_clk),
> +	FUNCTION(uim1_data),
> +	FUNCTION(uim1_present),
> +	FUNCTION(uim1_reset),
> +	FUNCTION(usb2phy_ac),
> +	FUNCTION(usb_phy),
> +	FUNCTION(vfr_0),
> +	FUNCTION(vfr_1),
> +	FUNCTION(vsense_trigger),
> +};
> +
> +/* Every pin is maintained as a single group, and missing or non-existing pin
> + * would be maintained as dummy group to synchronize pin group index with
> + * pin descriptor registered with pinctrl core.
> + * Clients would not be able to request these dummy pin groups.
> + */
> +static const struct msm_pingroup sc7280_groups[] = {
[..]
> +	[174] = PINGROUP(174, qdss_gpio15, _, _, _, _, _, _, _, _),
> +	[175] = SDC_QDSD_PINGROUP(sdc1_rclk, 0x1b3000, 15, 0),
> +	[176] = SDC_QDSD_PINGROUP(sdc1_clk, 0x1b3000, 13, 6),
> +	[177] = SDC_QDSD_PINGROUP(sdc1_cmd, 0x1b3000, 11, 3),
> +	[178] = SDC_QDSD_PINGROUP(sdc1_data, 0x1b3000, 9, 0),
> +	[179] = SDC_QDSD_PINGROUP(sdc2_clk, 0x1b4000, 14, 6),
> +	[180] = SDC_QDSD_PINGROUP(sdc2_cmd, 0x1b4000, 11, 3),
> +	[181] = SDC_QDSD_PINGROUP(sdc2_data, 0x1b4000, 9, 0),
> +	[182] = UFS_RESET(ufs_reset, 0x1be000),

Rather than fiddling ufs reset using pinconf we expose it as a gp(i)o
pin upstream. So please move this to be the 175th item in the list and
bump ngpios to 176 below.

> +};
> +
> +static const struct msm_pinctrl_soc_data sc7280_pinctrl = {
> +	.pins = sc7280_pins,
> +	.npins = ARRAY_SIZE(sc7280_pins),
> +	.functions = sc7280_functions,
> +	.nfunctions = ARRAY_SIZE(sc7280_functions),
> +	.groups = sc7280_groups,
> +	.ngroups = ARRAY_SIZE(sc7280_groups),
> +	.ngpios = 175,
> +};
> +

Apart from that it looks good.

Regards,
Bjorn
