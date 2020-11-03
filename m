Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF80A2A4B56
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Nov 2020 17:26:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728046AbgKCQ0V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Nov 2020 11:26:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726212AbgKCQ0U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Nov 2020 11:26:20 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B870AC0613D1
        for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2020 08:26:20 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id n15so16474711otl.8
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2020 08:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AUwE9Rysw1nQCYcg+XE2XA62F+xkLhn1VmBT0V3THV0=;
        b=Q9bY4D8l+m7nmefBKpOmlCB8Nu6/VT3gTZ0CN+qvHXPYZtOjEifl3iNd+MhJ27Y+Xx
         9him88J4ok1SYgqz/DKI6Kro8JmvGA5Dc6lVmKRAIz3w7CcxGFH7AjFVv8aKWhCnZOwZ
         uUrQ4mMfM/qGGTTwxufNgetRnvER8/AxCTuc5lh9g7+TtEoJlLpzl+HkM8qGFl3wphWU
         W8k6jJx4JrIUZb/M+QT7NuT3JdGwKBHsB4NPmt1tqfJPe5uiVPMndV7nSwHyKetwGfkk
         lXdCGAGiMT7vs26Y0g9pBCraWWiXGLAcUjS6kejb2X3E2+NxwT+HOtUQvRmogdY1VSBW
         GnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AUwE9Rysw1nQCYcg+XE2XA62F+xkLhn1VmBT0V3THV0=;
        b=VY1gdu8Lfy6XEURaHW5tBXlOlgse2xSGIYFsKWWadFK+ZItPUkUwYl99PdXoNhP5Hc
         ULoPKYUGI1/6EbrZPj5Su8svjmclHzwz6YVPvR+WYV5F38fCCp6uJHc1B8/A7RgS4Jal
         KO96BmnHlmfnP8HxfF5hEVgMLM+/W4B4aQRH6SMs4yCYeMu8/HqAxLEF87T+xulnLG5s
         T6iufKee/HrYlgpL2uYE8EzN+AJoDVTQMgiLlVxpkAU3H35afa3REa5thlahdRAQRvSj
         6C/MVqYCjvPDsNOPMyIyDzPVsbTpYX6AQHkyyj/9/iw8WgQJka+sBK5esi3uzLr0kq7w
         iEwA==
X-Gm-Message-State: AOAM531L8Q/PO7N46CnWUZuHx4fNTnLKqZdyNWHpR6fzI2MABO5VtGkM
        BiX6lOJi/kSDjsFKKPgBX2Bnew==
X-Google-Smtp-Source: ABdhPJxZL9kMeoA6m7/GwIoujaBpWXDJ5FAQNwuWiO+6snPsyt5gkY8V2BzjUIOXlM5MugE3FLt4uw==
X-Received: by 2002:a05:6830:2401:: with SMTP id j1mr9244756ots.235.1604420779988;
        Tue, 03 Nov 2020 08:26:19 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 72sm2532704otd.11.2020.11.03.08.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 08:26:18 -0800 (PST)
Date:   Tue, 3 Nov 2020 10:26:16 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Jeevan Shriram <jshriram@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add SDX55 pincontrol driver
Message-ID: <20201103162616.GN3151@builder.lan>
References: <20201103055801.472736-1-vkoul@kernel.org>
 <20201103055801.472736-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201103055801.472736-2-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon 02 Nov 23:58 CST 2020, Vinod Koul wrote:

> From: Jeevan Shriram <jshriram@codeaurora.org>
> 
> Add initial Qualcomm SDX55 pinctrl driver to support pin configuration
> with pinctrl framewor for SDX55 SoC.
> 
> Signed-off-by: Jeevan Shriram <jshriram@codeaurora.org>
> [ported from downstream and tidy up]
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

No changes since v1? ;)

>  drivers/pinctrl/qcom/Kconfig         |    9 +
>  drivers/pinctrl/qcom/Makefile        |    1 +
>  drivers/pinctrl/qcom/pinctrl-sdx55.c | 1018 ++++++++++++++++++++++++++
>  3 files changed, 1028 insertions(+)
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-sdx55.c
[..]
> diff --git a/drivers/pinctrl/qcom/pinctrl-sdx55.c b/drivers/pinctrl/qcom/pinctrl-sdx55.c
[..]
> +static const struct msm_pingroup sdx55_groups[] = {
> +	[0] = PINGROUP(0, uim2_data, blsp_uart1, qdss_stm, ebi0_wrcdc, _, _, _, _, _),
> +	[1] = PINGROUP(1, uim2_present, blsp_uart1, qdss_stm, _, _, _, _, _, _),
> +	[2] = PINGROUP(2, uim2_reset, blsp_uart1, blsp_i2c1, qdss_stm, ebi0_wrcdc, _, _, _, _),
> +	[3] = PINGROUP(3, uim2_clk, blsp_uart1, blsp_i2c1, qdss_stm, _, _, _, _, _),
> +	[4] = PINGROUP(4, blsp_spi2, blsp_uart2, _, qdss_stm, qdss_gpio, _, _, _, _),
> +	[5] = PINGROUP(5, blsp_spi2, blsp_uart2, _, qdss_stm, qdss_gpio, _, _, _, _),
> +	[6] = PINGROUP(6, blsp_spi2, blsp_uart2, blsp_i2c2, char_exec, _, qdss_stm, qdss_gpio, _, _),
> +	[7] = PINGROUP(7, blsp_spi2, blsp_uart2, blsp_i2c2, char_exec, _, qdss_stm, qdss_gpio, _, _),
> +	[8] = PINGROUP(8, pri_mi2s, blsp_spi3, blsp_uart3, ext_dbg, ldo_en, _, _, _, _),
> +	[9] = PINGROUP(9, pri_mi2s, blsp_spi3, blsp_uart3, ext_dbg, _, _, _, _, _),
> +	[10] = PINGROUP(10, pri_mi2s, blsp_spi3, blsp_uart3, blsp_i2c3, ext_dbg, _, _, _, _),
> +	[11] = PINGROUP(11, pri_mi2s, blsp_spi3, blsp_uart3, blsp_i2c3, ext_dbg, gcc_gp3, _, _, _),
> +	[12] = PINGROUP(12, pri_mi2s, _, qdss_stm, qdss_gpio, _, _, _, _, _),
> +	[13] = PINGROUP(13, pri_mi2s, _, qdss_stm, qdss_gpio, _, _, _, _, _),
> +	[14] = PINGROUP(14, pri_mi2s, emac_gcc1, _, _, qdss_stm, qdss_gpio, bimc_dte0, native_tsens, vsense_trigger),
> +	[15] = PINGROUP(15, pri_mi2s, emac_gcc0, _, _, qdss_stm, qdss_gpio, bimc_dte1, _, _),
> +	[16] = PINGROUP(16, sec_mi2s, blsp_spi4, blsp_uart4, qdss_cti, qdss_cti, _, _, qdss_stm, qdss_gpio),
> +	[17] = PINGROUP(17, sec_mi2s, blsp_spi4, blsp_uart4, qdss_cti, qdss_cti, _, qdss_stm, qdss_gpio, _),
> +	[18] = PINGROUP(18, sec_mi2s, blsp_spi4, blsp_uart4, blsp_i2c4, gcc_gp1, qdss_stm, qdss_gpio, _, _),
> +	[19] = PINGROUP(19, sec_mi2s, blsp_spi4, blsp_uart4, blsp_i2c4, jitter_bist, gcc_gp2, _, qdss_stm, qdss_gpio),
> +	[20] = PINGROUP(20, sec_mi2s, ebi2_a, blsp_uart1, blsp_uart4, qdss_stm, _, _, _, _),
> +	[21] = PINGROUP(21, sec_mi2s, ebi2_lcd, blsp_uart1, blsp_uart4, _, qdss_stm, _, _, _),
> +	[22] = PINGROUP(22, sec_mi2s, ebi2_lcd, blsp_uart1, qdss_cti, qdss_cti, blsp_uart4, pll_bist, _, qdss_stm),
> +	[23] = PINGROUP(23, sec_mi2s, ebi2_lcd, qdss_cti, qdss_cti, blsp_uart1, blsp_uart4, qdss_stm, _, _),
> +	[24] = PINGROUP(24, adsp_ext, _, _, _, _, _, _, _, _),
> +	[25] = PINGROUP(25, adsp_ext, _, _, _, _, _, _, _, _),
> +	[26] = PINGROUP(26, _, _, _, native_char, _, _, _, _, _),
> +	[27] = PINGROUP(27, _, _, _, _, _, _, _, _, _),
> +	[28] = PINGROUP(28, qlink0_wmss, _, native_char3, _, _, _, _, _, _),
> +	[29] = PINGROUP(29, _, _, _, native_char2, native_tsense, _, _, _, _),
> +	[30] = PINGROUP(30, _, _, _, _, _, _, _, _, _),
> +	[31] = PINGROUP(31, nav_gpio, _, _, _, _, _, _, _, _),
> +	[32] = PINGROUP(32, nav_gpio, pll_ref, _, _, _, _, _, _, _),
> +	[33] = PINGROUP(33, _, pa_indicator, native_char0, _, _, _, _, _, _),
> +	[34] = PINGROUP(34, qlink0_en, _, _, _, _, _, _, _, _),
> +	[35] = PINGROUP(35, qlink0_req, pll_test, _, _, _, _, _, _, _),
> +	[36] = PINGROUP(36, _, _, cri_trng, dbg_out, _, _, _, _, _),
> +	[37] = PINGROUP(37, _, _, _, _, _, _, _, _, _),
> +	[38] = PINGROUP(38, _, _, prng_rosc, _, _, _, _, _, _),
> +	[39] = PINGROUP(39, _, _, _, _, _, _, _, _, _),
> +	[40] = PINGROUP(40, _, _, cri_trng0, _, _, _, _, _, _),
> +	[41] = PINGROUP(41, _, _, cri_trng1, _, _, _, _, _, _),
> +	[42] = PINGROUP(42, _, qdss_gpio, native_char1, _, _, _, _, _, _),
> +	[43] = PINGROUP(43, _, _, _, _, _, _, _, _, _),
> +	[44] = PINGROUP(44, coex_uart, spmi_coex, _, qdss_stm, _, _, _, _, _),
> +	[45] = PINGROUP(45, coex_uart, spmi_coex, qdss_stm, ddr_pxi0, _, _, _, _, _),
> +	[46] = PINGROUP(46, m_voc, ddr_bist, ddr_pxi0, _, _, _, _, _, _),
> +	[47] = PINGROUP(47, ddr_bist, _, _, _, _, _, _, _, _),
> +	[48] = PINGROUP(48, m_voc, ddr_bist, _, _, _, _, _, _, _),
> +	[49] = PINGROUP(49, m_voc, ddr_bist, _, _, _, _, _, _, _),
> +	[50] = PINGROUP(50, _, _, _, _, _, _, _, _, _),
> +	[51] = PINGROUP(51, _, _, _, _, _, _, _, _, _),
> +	[52] = PINGROUP(52, blsp_spi2, blsp_spi1, blsp_spi3, blsp_spi4, _, _, qdss_stm, _, _),
> +	[53] = PINGROUP(53, pci_e, _, _, qdss_stm, _, _, _, _, _),
> +	[54] = PINGROUP(54, qdss_cti, qdss_cti, _, _, _, _, _, _, _),
> +	[55] = PINGROUP(55, qdss_cti, qdss_cti, tgu_ch0, _, _, _, _, _, _),
> +	[56] = PINGROUP(56, pcie_clkreq, _, qdss_stm, _, _, _, _, _, _),
> +	[57] = PINGROUP(57, _, qdss_stm, _, _, _, _, _, _, _),
> +	[58] = PINGROUP(58, _, _, _, _, _, _, _, _, _),
> +	[59] = PINGROUP(59, qdss_cti, m_voc, bimc_dte0, _, _, _, _, _, _),
> +	[60] = PINGROUP(60, qdss_cti, _, m_voc, _, _, _, _, _, _),
> +	[61] = PINGROUP(61, mgpi_clk, qdss_stm, qdss_gpio, bimc_dte1, _, _, _, _, _),
> +	[62] = PINGROUP(62, i2s_mclk, audio_ref, blsp_spi1, blsp_spi2, blsp_spi3, blsp_spi4, ldo_update, qdss_stm, _),
> +	[63] = PINGROUP(63, blsp_uart2, _, qdss_stm, qdss_gpio, atest, _, _, _, _),
> +	[64] = PINGROUP(64, blsp_uart2, qdss_stm, qdss_gpio, atest, _, _, _, _, _),
> +	[65] = PINGROUP(65, blsp_uart2, blsp_i2c2, _, qdss_stm, qdss_gpio, atest, _, _, _),
> +	[66] = PINGROUP(66, blsp_uart2, blsp_i2c2, qdss_stm, qdss_gpio, atest, _, _, _, _),
> +	[67] = PINGROUP(67, uim1_data, atest, _, _, _, _, _, _, _),
> +	[68] = PINGROUP(68, uim1_present, _, _, _, _, _, _, _, _),
> +	[69] = PINGROUP(69, uim1_reset, _, _, _, _, _, _, _, _),
> +	[70] = PINGROUP(70, uim1_clk, _, _, _, _, _, _, _, _),
> +	[71] = PINGROUP(71, mgpi_clk, blsp_spi1, blsp_spi2, blsp_spi3, blsp_spi4, _, _, _, _),
> +	[72] = PINGROUP(72, qlink1_en, _, _, _, _, _, _, _, _),
> +	[73] = PINGROUP(73, qlink1_req, _, _, _, _, _, _, _, _),
> +	[74] = PINGROUP(74, qlink1_wmss, _, _, _, _, _, _, _, _),
> +	[75] = PINGROUP(75, coex_uart2, _, _, _, _, _, _, _, _),
> +	[76] = PINGROUP(76, coex_uart2, nav_gpio, _, _, _, _, _, _, _),
> +	[77] = PINGROUP(77, _, _, _, _, _, _, _, _, _),
> +	[78] = PINGROUP(78, spmi_vgi, blsp_i2c4, _, _, _, _, _, _, _),
> +	[79] = PINGROUP(79, spmi_vgi, blsp_i2c4, _, _, _, _, _, _, _),
> +	[80] = PINGROUP(80, _, blsp_spi1, _, _, _, _, _, _, _),
> +	[81] = PINGROUP(81, _, blsp_spi1, _, gcc_plltest, _, _, _, _, _),
> +	[82] = PINGROUP(82, _, blsp_spi1, _, blsp_i2c1, gcc_plltest, _, _, _, _),
> +	[83] = PINGROUP(83, _, blsp_spi1, _, blsp_i2c1, _, _, _, _, _),
> +	[84] = PINGROUP(84, _, _, _, _, _, _, _, _, _),
> +	[85] = PINGROUP(85, _, _, _, _, _, _, _, _, _),
> +	[86] = PINGROUP(86, _, _, _, _, _, _, _, _, _),
> +	[87] = PINGROUP(87, _, _, _, _, _, _, _, _, _),
> +	[88] = PINGROUP(88, _, _, _, _, _, _, _, _, _),
> +	[89] = PINGROUP(89, _, _, _, _, _, _, _, _, _),
> +	[90] = PINGROUP(90, _, _, _, _, _, _, _, _, _),
> +	[91] = PINGROUP(91, _, _, _, _, _, _, _, _, _),
> +	[92] = PINGROUP(92, _, _, _, _, _, _, _, _, _),
> +	[93] = PINGROUP(93, _, _, usb2phy_ac, _, _, _, _, _, _),
> +	[94] = PINGROUP(94, qdss_cti, qdss_cti, _, _, _, _, _, _, _),
> +	[95] = PINGROUP(95, qdss_cti, qdss_cti, emac_pps1, _, _, _, _, _, _),
> +	[96] = PINGROUP(96, _, _, _, _, _, _, _, _, _),
> +	[97] = PINGROUP(97, _, _, _, _, _, _, _, _, _),
> +	[98] = PINGROUP(98, _, _, _, _, _, _, _, _, _),
> +	[99] = PINGROUP(99, _, _, _, _, _, _, _, _, _),
> +	[100] = PINGROUP(100, _, _, _, _, _, _, _, _, _),
> +	[101] = PINGROUP(101, _, _, _, _, _, _, _, _, _),
> +	[102] = PINGROUP(102, _, _, _, _, _, _, _, _, _),
> +	[103] = PINGROUP(103, _, _, _, _, _, _, _, _, _),
> +	[104] = PINGROUP(104, _, _, _, _, _, _, _, _, _),
> +	[105] = PINGROUP(105, _, _, _, _, _, _, _, _, _),
> +	[106] = PINGROUP(106, emac_pps0, _, _, _, _, _, _, _, _),
> +	[107] = PINGROUP(107, _, _, _, _, _, _, _, _, _),
> +	[109] = SDC_PINGROUP(sdc1_rclk, 0x9a000, 15, 0),
> +	[110] = SDC_PINGROUP(sdc1_clk, 0x9a000, 13, 6),
> +	[111] = SDC_PINGROUP(sdc1_cmd, 0x9a000, 11, 3),
> +	[112] = SDC_PINGROUP(sdc1_data, 0x9a000, 9, 0),
> +};

Looks better, and ngpios is good.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks,
Bjorn
