Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3F10712D24
	for <lists+linux-gpio@lfdr.de>; Fri, 26 May 2023 21:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242160AbjEZTRd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 May 2023 15:17:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237561AbjEZTRa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 May 2023 15:17:30 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F50E187
        for <linux-gpio@vger.kernel.org>; Fri, 26 May 2023 12:17:19 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f3a166f8e9so1518867e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 26 May 2023 12:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685128637; x=1687720637;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yiFYKUOejrlm9mqEeNkHHunaW/129BYJ0ikXkuCAk/k=;
        b=uUWH5dN+KDTzsQPlIN8EA9EXBvb5cpsu/cEf9ltFzn2DTlGrBM1pEgGpBXrLpxz0j7
         w92Ap0MQepKw4AhSEVpxH1YgLhpTms6o8GRRzi0UszBfxQVP/hc5WZNZwtv8I9ig8oJi
         JygnE/buALMhVuTOpfkzVE0k/iWfcdAgAbvsQWJHxe17XhRAhZeK2oCTXGFJ4InUyJEh
         qDQfbhCjcJktMGK7BJvxBVz+hLVqKJMFWNa6zLoL9gahqi9Nk2IpvHzPAkP5GJkgKKY+
         yI8+Db3AXVXhK+OnjlJgQ/DDtiOtGEa/Os15s8lv8tZ4aV8uAM+qX7mG6FhLeA83B4Ot
         SKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685128637; x=1687720637;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yiFYKUOejrlm9mqEeNkHHunaW/129BYJ0ikXkuCAk/k=;
        b=fJ23m7Ib4+SpuaYXFFfCW1A5UPILHCG4Ia5dpUMU/seNpQeJF+6DMYhvm88dgP0IdT
         rNJjYisQaYoQmQnJJAt+xEd6oXpzlzfDI5UQiz+fNd4xDBXnX+UqWSO0tk/fClNKl26k
         hmXdxKI9syEZppvpi9rGsuu3wdM34Xmt/tp2aea/f3DRlDTvvjpjnYQNz5w+aTxQbIaj
         RNOglbmcJcJdfS3Aw9Kk++Pvr1rIlrYeC0Hn6kXJPFH0uupoPTeYYRnW5KZqXKcZZcbA
         ckA19G8xhcRUdzDVqPq3cVSxiRSTKXtFopdwwFjy+SsKbCNEo/cgNQCgljfAuNAGtxge
         oqqQ==
X-Gm-Message-State: AC+VfDwLCt7Zoqw1zr/pvATBwYnFHaW0Kh9lQat/JJzdB979uWDfs/2I
        Y0M03qKzKSuOtmkLRQcQBqFkqg==
X-Google-Smtp-Source: ACHHUZ5tmMboTWbxulXH7cuouSze/Jd2QjmMvwkey+HHfQE/b4gH9ADxv2V6thBZeiUQM92YBMz5XA==
X-Received: by 2002:a05:6512:4015:b0:4f0:74:61a0 with SMTP id br21-20020a056512401500b004f0007461a0mr35678lfb.0.1685128637338;
        Fri, 26 May 2023 12:17:17 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id j28-20020ac2551c000000b004f37a53dd84sm735671lfk.233.2023.05.26.12.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 12:17:16 -0700 (PDT)
Message-ID: <21a5642c-e6e5-9323-7db1-383a18616ac0@linaro.org>
Date:   Fri, 26 May 2023 21:17:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 2/8] clk: qcom: Add Global Clock controller (GCC)
 driver for IPQ5018
Content-Language: en-US
To:     Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, ulf.hansson@linaro.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230510134121.1232286-1-quic_srichara@quicinc.com>
 <20230510134121.1232286-3-quic_srichara@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230510134121.1232286-3-quic_srichara@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 10.05.2023 15:41, Sricharan Ramabadhran wrote:
> Add support for the global clock controller found on IPQ5018
> based devices.
> 
> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Co-developed-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---
>  [v4] Fixed to use ARRAY_SIZE() wherever parent_data was used
>       Changed GPL v2 to GPL as per comments
> 
>  drivers/clk/qcom/Kconfig       |   10 +-
>  drivers/clk/qcom/Makefile      |    1 +
>  drivers/clk/qcom/gcc-ipq5018.c | 3731 ++++++++++++++++++++++++++++++++
>  3 files changed, 3740 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/clk/qcom/gcc-ipq5018.c
> 
[...]

> +struct clk_rcg2 lpass_axim_clk_src = {
> +	.cmd_rcgr = 0x2E028,
Please use lowercase hex for non-macro-defines, all throughout the file.

[...]

> +static struct clk_rcg2 system_noc_bfdcd_clk_src = {
Drop clocks that are managed in RPM, they will conflict.

Konrad
> +	.cmd_rcgr = 0x26004,
> +	.freq_tbl = ftbl_system_noc_bfdcd_clk_src,
> +	.hid_width = 5,
> +	.parent_map = gcc_xo_gpll0_gpll2_gpll0_out_main_div2_map,
> +	.clkr.hw.init = &(struct clk_init_data) {
> +		.name = "system_noc_bfdcd_clk_src",
> +		.parent_data = gcc_xo_gpll0_gpll2_gpll0_out_main_div2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll2_gpll0_out_main_div2),
> +		.ops = &clk_rcg2_ops,
> +	},
> +};
> +
> +static struct clk_fixed_factor system_noc_clk_src = {
> +	.mult = 1,
> +	.div = 1,
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "system_noc_clk_src",
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&system_noc_bfdcd_clk_src.clkr.hw
> +		},
> +		.num_parents = 1,
> +		.ops = &clk_fixed_factor_ops,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_rcg2 ubi0_axi_clk_src = {
> +	.cmd_rcgr = 0x68088,
> +	.freq_tbl = ftbl_apss_axi_clk_src,
> +	.hid_width = 5,
> +	.parent_map = gcc_xo_gpll0_gpll2_map,
> +	.clkr.hw.init = &(struct clk_init_data) {
> +		.name = "ubi0_axi_clk_src",
> +		.parent_data = gcc_xo_gpll0_gpll2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll2),
> +		.ops = &clk_rcg2_ops,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_ubi0_core_clk_src[] = {
> +	F(850000000, P_UBI32_PLL, 1, 0, 0),
> +	F(1000000000, P_UBI32_PLL, 1, 0, 0),
> +};
> +
> +static struct clk_rcg2 ubi0_core_clk_src = {
> +	.cmd_rcgr = 0x68100,
> +	.freq_tbl = ftbl_ubi0_core_clk_src,
> +	.hid_width = 5,
> +	.parent_map = gcc_xo_ubi32_gpll0_map,
> +	.clkr.hw.init = &(struct clk_init_data) {
> +		.name = "ubi0_core_clk_src",
> +		.parent_data = gcc_xo_ubi32_gpll0,
> +		.num_parents = ARRAY_SIZE(gcc_xo_ubi32_gpll0),
> +		.ops = &clk_rcg2_ops,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_rcg2 usb0_aux_clk_src = {
> +	.cmd_rcgr = 0x3e05c,
> +	.freq_tbl = ftbl_pcie0_aux_clk_src,
> +	.mnd_width = 16,
> +	.hid_width = 5,
> +	.parent_map = gcc_xo_gpll0_core_pi_sleep_clk_map,
> +	.clkr.hw.init = &(struct clk_init_data) {
> +		.name = "usb0_aux_clk_src",
> +		.parent_data = gcc_xo_gpll0_core_pi_sleep_clk,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_core_pi_sleep_clk),
> +		.ops = &clk_rcg2_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_usb0_lfps_clk_src[] = {
> +	F(25000000, P_GPLL0, 16, 1, 2),
> +	{ }
> +};
> +
> +static struct clk_rcg2 usb0_lfps_clk_src = {
> +	.cmd_rcgr = 0x3e090,
> +	.freq_tbl = ftbl_usb0_lfps_clk_src,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = gcc_xo_gpll0_map,
> +	.clkr.hw.init = &(struct clk_init_data) {
> +		.name = "usb0_lfps_clk_src",
> +		.parent_data = gcc_xo_gpll0,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
> +		.ops = &clk_rcg2_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 usb0_master_clk_src = {
> +	.cmd_rcgr = 0x3e00c,
> +	.freq_tbl = ftbl_gp_clk_src,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = gcc_xo_gpll0_out_main_div2_gpll0_map,
> +	.clkr.hw.init = &(struct clk_init_data) {
> +		.name = "usb0_master_clk_src",
> +		.parent_data = gcc_xo_gpll0_out_main_div2_gpll0,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_out_main_div2_gpll0),
> +		.ops = &clk_rcg2_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_usb0_mock_utmi_clk_src[] = {
> +	F(60000000, P_GPLL4, 10, 1, 2),
> +	{ }
> +};
> +
> +static struct clk_rcg2 usb0_mock_utmi_clk_src = {
> +	.cmd_rcgr = 0x3e020,
> +	.freq_tbl = ftbl_usb0_mock_utmi_clk_src,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = gcc_xo_gpll4_gpll0_gpll0_out_main_div2_map2,
> +	.clkr.hw.init = &(struct clk_init_data) {
> +		.name = "usb0_mock_utmi_clk_src",
> +		.parent_data = gcc_xo_gpll4_gpll0_gpll0_out_main_div2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll4_gpll0_gpll0_out_main_div2),
> +		.ops = &clk_rcg2_ops,
> +	},
> +};
> +
> +static struct clk_regmap_mux usb0_pipe_clk_src = {
> +	.reg = 0x3e048,
> +	.shift = 8,
> +	.width = 2,
> +	.parent_map = gcc_usb3phy_0_cc_pipe_clk_xo_map,
> +	.clkr = {
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "usb0_pipe_clk_src",
> +			.parent_data = gcc_usb3phy_0_cc_pipe_clk_xo,
> +			.num_parents = ARRAY_SIZE(gcc_usb3phy_0_cc_pipe_clk_xo),
> +			.ops = &clk_regmap_mux_closest_ops,
> +			.flags = CLK_SET_RATE_PARENT,
> +		},
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_q6_axi_clk_src[] = {
> +	F(400000000, P_GPLL0, 2, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 q6_axi_clk_src = {
> +	.cmd_rcgr = 0x59120,
> +	.freq_tbl = ftbl_q6_axi_clk_src,
> +	.hid_width = 5,
> +	.parent_map = gcc_xo_gpll0_gpll2_gpll4_map,
> +	.clkr.hw.init = &(struct clk_init_data) {
> +		.name = "q6_axi_clk_src",
> +		.parent_data = gcc_xo_gpll0_gpll2_gpll4,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll2_gpll4),
> +		.ops = &clk_rcg2_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_wcss_ahb_clk_src[] = {
> +	F(133333333, P_GPLL0, 6, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 wcss_ahb_clk_src = {
> +	.cmd_rcgr = 0x59020,
> +	.freq_tbl = ftbl_wcss_ahb_clk_src,
> +	.hid_width = 5,
> +	.parent_map = gcc_xo_gpll0_map,
> +	.clkr.hw.init = &(struct clk_init_data) {
> +		.name = "wcss_ahb_clk_src",
> +		.parent_data = gcc_xo_gpll0,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
> +		.ops = &clk_rcg2_ops,
> +	},
> +};
> +
> +static struct clk_branch gcc_sleep_clk_src = {
> +	.halt_reg = 0x30000,
> +	.clkr = {
> +		.enable_reg = 0x30000,
> +		.enable_mask = BIT(1),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_sleep_clk_src",
> +			.parent_data = gcc_sleep_clk_data,
> +			.num_parents = ARRAY_SIZE(gcc_sleep_clk_data),
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_xo_clk_src = {
> +	.halt_reg = 0x30018,
> +	.clkr = {
> +		.enable_reg = 0x30018,
> +		.enable_mask = BIT(1),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_xo_clk_src",
> +			.parent_data = gcc_xo_data,
> +			.num_parents = ARRAY_SIZE(gcc_xo_data),
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_xo_clk = {
> +	.halt_reg = 0x30030,
> +	.clkr = {
> +		.enable_reg = 0x30030,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_xo_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&gcc_xo_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_adss_pwm_clk = {
> +	.halt_reg = 0x1f020,
> +	.clkr = {
> +		.enable_reg = 0x1f020,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_adss_pwm_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&adss_pwm_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_blsp1_ahb_clk = {
> +	.halt_reg = 0x01008,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x0b004,
> +		.enable_mask = BIT(10),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_blsp1_ahb_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcnoc_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_blsp1_qup1_i2c_apps_clk = {
> +	.halt_reg = 0x02008,
> +	.clkr = {
> +		.enable_reg = 0x02008,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_blsp1_qup1_i2c_apps_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&blsp1_qup1_i2c_apps_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_blsp1_qup1_spi_apps_clk = {
> +	.halt_reg = 0x02004,
> +	.clkr = {
> +		.enable_reg = 0x02004,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_blsp1_qup1_spi_apps_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&blsp1_qup1_spi_apps_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_blsp1_qup2_i2c_apps_clk = {
> +	.halt_reg = 0x03010,
> +	.clkr = {
> +		.enable_reg = 0x03010,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_blsp1_qup2_i2c_apps_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&blsp1_qup2_i2c_apps_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_blsp1_qup2_spi_apps_clk = {
> +	.halt_reg = 0x0300c,
> +	.clkr = {
> +		.enable_reg = 0x0300c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_blsp1_qup2_spi_apps_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&blsp1_qup2_spi_apps_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_blsp1_qup3_i2c_apps_clk = {
> +	.halt_reg = 0x04010,
> +	.clkr = {
> +		.enable_reg = 0x04010,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_blsp1_qup3_i2c_apps_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&blsp1_qup3_i2c_apps_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_blsp1_qup3_spi_apps_clk = {
> +	.halt_reg = 0x0400c,
> +	.clkr = {
> +		.enable_reg = 0x0400c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_blsp1_qup3_spi_apps_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&blsp1_qup3_spi_apps_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_blsp1_uart1_apps_clk = {
> +	.halt_reg = 0x0203c,
> +	.clkr = {
> +		.enable_reg = 0x0203c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_blsp1_uart1_apps_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&blsp1_uart1_apps_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_blsp1_uart2_apps_clk = {
> +	.halt_reg = 0x0302c,
> +	.clkr = {
> +		.enable_reg = 0x0302c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_blsp1_uart2_apps_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&blsp1_uart2_apps_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_btss_lpo_clk = {
> +	.halt_reg = 0x1c004,
> +	.clkr = {
> +		.enable_reg = 0x1c004,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_btss_lpo_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_cmn_blk_ahb_clk = {
> +	.halt_reg = 0x56308,
> +	.clkr = {
> +		.enable_reg = 0x56308,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_cmn_blk_ahb_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcnoc_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_cmn_blk_sys_clk = {
> +	.halt_reg = 0x5630c,
> +	.clkr = {
> +		.enable_reg = 0x5630c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_cmn_blk_sys_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&gcc_xo_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_crypto_ahb_clk = {
> +	.halt_reg = 0x16024,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x0b004,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_crypto_ahb_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcnoc_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_crypto_axi_clk = {
> +	.halt_reg = 0x16020,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x0b004,
> +		.enable_mask = BIT(1),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_crypto_axi_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcnoc_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_crypto_clk = {
> +	.halt_reg = 0x1601c,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x0b004,
> +		.enable_mask = BIT(2),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_crypto_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&crypto_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_dcc_clk = {
> +	.halt_reg = 0x77004,
> +	.clkr = {
> +		.enable_reg = 0x77004,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_dcc_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcnoc_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_gephy_rx_clk = {
> +	.halt_reg = 0x56010,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.clkr = {
> +		.enable_reg = 0x56010,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_gephy_rx_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&gmac0_rx_div_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_branch2_ops,
> +			.flags = CLK_SET_RATE_PARENT,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_gephy_tx_clk = {
> +	.halt_reg = 0x56014,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.clkr = {
> +		.enable_reg = 0x56014,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_gephy_tx_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&gmac0_tx_div_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_branch2_ops,
> +			.flags = CLK_SET_RATE_PARENT,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_gmac0_cfg_clk = {
> +	.halt_reg = 0x68304,
> +	.clkr = {
> +		.enable_reg = 0x68304,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_gmac0_cfg_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&gmac_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_gmac0_ptp_clk = {
> +	.halt_reg = 0x68300,
> +	.clkr = {
> +		.enable_reg = 0x68300,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_gmac0_ptp_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&gmac_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_gmac0_rx_clk = {
> +	.halt_reg = 0x68240,
> +	.clkr = {
> +		.enable_reg = 0x68240,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_gmac0_rx_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&gmac0_rx_div_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_branch2_ops,
> +			.flags = CLK_SET_RATE_PARENT,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_gmac0_sys_clk = {
> +	.halt_reg = 0x68190,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.halt_bit = 31,
> +	.clkr = {
> +		.enable_reg = 0x683190,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_gmac0_sys_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&gmac_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_gmac0_tx_clk = {
> +	.halt_reg = 0x68244,
> +	.clkr = {
> +		.enable_reg = 0x68244,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_gmac0_tx_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&gmac0_tx_div_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_branch2_ops,
> +			.flags = CLK_SET_RATE_PARENT,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_gmac1_cfg_clk = {
> +	.halt_reg = 0x68324,
> +	.clkr = {
> +		.enable_reg = 0x68324,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_gmac1_cfg_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&gmac_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_gmac1_ptp_clk = {
> +	.halt_reg = 0x68320,
> +	.clkr = {
> +		.enable_reg = 0x68320,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_gmac1_ptp_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&gmac_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_gmac1_rx_clk = {
> +	.halt_reg = 0x68248,
> +	.clkr = {
> +		.enable_reg = 0x68248,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_gmac1_rx_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&gmac1_rx_div_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_branch2_ops,
> +			.flags = CLK_SET_RATE_PARENT,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_gmac1_sys_clk = {
> +	.halt_reg = 0x68310,
> +	.clkr = {
> +		.enable_reg = 0x68310,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_gmac1_sys_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&gmac_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_gmac1_tx_clk = {
> +	.halt_reg = 0x6824c,
> +	.clkr = {
> +		.enable_reg = 0x6824c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_gmac1_tx_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&gmac1_tx_div_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_branch2_ops,
> +			.flags = CLK_SET_RATE_PARENT,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_gp1_clk = {
> +	.halt_reg = 0x08000,
> +	.clkr = {
> +		.enable_reg = 0x08000,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_gp1_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&gp1_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_gp2_clk = {
> +	.halt_reg = 0x09000,
> +	.clkr = {
> +		.enable_reg = 0x09000,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_gp2_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&gp2_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_gp3_clk = {
> +	.halt_reg = 0x0a000,
> +	.clkr = {
> +		.enable_reg = 0x0a000,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_gp3_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&gp3_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_lpass_core_axim_clk = {
> +	.halt_reg = 0x2E048,
> +	.halt_check = BRANCH_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x2E048,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_lpass_core_axim_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&lpass_axim_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_lpass_sway_clk = {
> +	.halt_reg = 0x2E04C,
> +	.clkr = {
> +		.enable_reg = 0x2E04C,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_lpass_sway_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&lpass_sway_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_mdio0_ahb_clk = {
> +	.halt_reg = 0x58004,
> +	.clkr = {
> +		.enable_reg = 0x58004,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_mdioi0_ahb_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcnoc_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_mdio1_ahb_clk = {
> +	.halt_reg = 0x58014,
> +	.clkr = {
> +		.enable_reg = 0x58014,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_mdio1_ahb_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcnoc_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_pcie0_ahb_clk = {
> +	.halt_reg = 0x75010,
> +	.clkr = {
> +		.enable_reg = 0x75010,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_pcie0_ahb_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcnoc_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_pcie0_aux_clk = {
> +	.halt_reg = 0x75014,
> +	.clkr = {
> +		.enable_reg = 0x75014,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_pcie0_aux_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcie0_aux_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_pcie0_axi_m_clk = {
> +	.halt_reg = 0x75008,
> +	.clkr = {
> +		.enable_reg = 0x75008,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_pcie0_axi_m_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcie0_axi_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_pcie0_axi_s_bridge_clk = {
> +	.halt_reg = 0x75048,
> +	.clkr = {
> +		.enable_reg = 0x75048,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_pcie0_axi_s_bridge_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcie0_axi_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_pcie0_axi_s_clk = {
> +	.halt_reg = 0x7500c,
> +	.clkr = {
> +		.enable_reg = 0x7500c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_pcie0_axi_s_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcie0_axi_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_pcie0_pipe_clk = {
> +	.halt_reg = 0x75018,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.halt_bit = 31,
> +	.clkr = {
> +		.enable_reg = 0x75018,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_pcie0_pipe_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcie0_pipe_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_pcie1_ahb_clk = {
> +	.halt_reg = 0x76010,
> +	.clkr = {
> +		.enable_reg = 0x76010,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_pcie1_ahb_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcnoc_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_pcie1_aux_clk = {
> +	.halt_reg = 0x76014,
> +	.clkr = {
> +		.enable_reg = 0x76014,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_pcie1_aux_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcie1_aux_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_pcie1_axi_m_clk = {
> +	.halt_reg = 0x76008,
> +	.clkr = {
> +		.enable_reg = 0x76008,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_pcie1_axi_m_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcie1_axi_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_pcie1_axi_s_bridge_clk = {
> +	.halt_reg = 0x76048,
> +	.clkr = {
> +		.enable_reg = 0x76048,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_pcie1_axi_s_bridge_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcie1_axi_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_pcie1_axi_s_clk = {
> +	.halt_reg = 0x7600c,
> +	.clkr = {
> +		.enable_reg = 0x7600c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_pcie1_axi_s_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcie1_axi_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_pcie1_pipe_clk = {
> +	.halt_reg = 8,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.halt_bit = 31,
> +	.clkr = {
> +		.enable_reg = 0x76018,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_pcie1_pipe_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcie1_pipe_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_prng_ahb_clk = {
> +	.halt_reg = 0x13004,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x0b004,
> +		.enable_mask = BIT(8),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_prng_ahb_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcnoc_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_q6_ahb_clk = {
> +	.halt_reg = 0x59138,
> +	.clkr = {
> +		.enable_reg = 0x59138,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_q6_ahb_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&wcss_ahb_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_q6_ahb_s_clk = {
> +	.halt_reg = 0x5914C,
> +	.clkr = {
> +		.enable_reg = 0x5914C,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_q6_ahb_s_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&wcss_ahb_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_q6_axim_clk = {
> +	.halt_reg = 0x5913C,
> +	.clkr = {
> +		.enable_reg = 0x5913C,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_q6_axim_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&q6_axi_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_q6_axim2_clk = {
> +	.halt_reg = 0x59150,
> +	.clkr = {
> +		.enable_reg = 0x59150,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_q6_axim2_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&q6_axi_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_q6_axis_clk = {
> +	.halt_reg = 0x59154,
> +	.clkr = {
> +		.enable_reg = 0x59154,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_q6_axis_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&system_noc_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_q6_tsctr_1to2_clk = {
> +	.halt_reg = 0x59148,
> +	.clkr = {
> +		.enable_reg = 0x59148,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_q6_tsctr_1to2_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&qdss_tsctr_div2_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_q6ss_atbm_clk = {
> +	.halt_reg = 0x59144,
> +	.clkr = {
> +		.enable_reg = 0x59144,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_q6ss_atbm_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&qdss_at_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_q6ss_pclkdbg_clk = {
> +	.halt_reg = 0x59140,
> +	.clkr = {
> +		.enable_reg = 0x59140,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_q6ss_pclkdbg_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&qdss_dap_sync_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_q6ss_trig_clk = {
> +	.halt_reg = 0x59128,
> +	.clkr = {
> +		.enable_reg = 0x59128,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_q6ss_trig_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&qdss_dap_sync_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_qdss_at_clk = {
> +	.halt_reg = 0x29024,
> +	.clkr = {
> +		.enable_reg = 0x29024,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_qdss_at_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&qdss_at_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_qdss_dap_clk = {
> +	.halt_reg = 0x29084,
> +	.clkr = {
> +		.enable_reg = 0x29084,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_qdss_dap_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&qdss_tsctr_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_qdss_cfg_ahb_clk = {
> +	.halt_reg = 0x29008,
> +	.clkr = {
> +		.enable_reg = 0x29008,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_qdss_cfg_ahb_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcnoc_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_qdss_dap_ahb_clk = {
> +	.halt_reg = 0x29004,
> +	.clkr = {
> +		.enable_reg = 0x29004,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_qdss_dap_ahb_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcnoc_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_qdss_etr_usb_clk = {
> +	.halt_reg = 0x29028,
> +	.clkr = {
> +		.enable_reg = 0x29028,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_qdss_etr_usb_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&system_noc_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_qdss_eud_at_clk = {
> +	.halt_reg = 0x29020,
> +	.clkr = {
> +		.enable_reg = 0x29020,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_qdss_eud_at_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&eud_at_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_qdss_stm_clk = {
> +	.halt_reg = 0x29044,
> +	.clkr = {
> +		.enable_reg = 0x29044,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_qdss_stm_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&qdss_stm_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_qdss_traceclkin_clk = {
> +	.halt_reg = 0x29060,
> +	.clkr = {
> +		.enable_reg = 0x29060,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_qdss_traceclkin_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&qdss_traceclkin_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_qdss_tsctr_div8_clk = {
> +	.halt_reg = 0x2908c,
> +	.clkr = {
> +		.enable_reg = 0x2908c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_qdss_tsctr_div8_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&qdss_tsctr_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_qpic_ahb_clk = {
> +	.halt_reg = 0x57024,
> +	.clkr = {
> +		.enable_reg = 0x57024,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_qpic_ahb_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcnoc_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_qpic_clk = {
> +	.halt_reg = 0x57020,
> +	.clkr = {
> +		.enable_reg = 0x57020,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_qpic_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcnoc_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_qpic_io_macro_clk = {
> +	.halt_reg = 0x5701c,
> +	.clkr = {
> +		.enable_reg = 0x5701c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_qpic_io_macro_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&qpic_io_macro_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_sdcc1_ahb_clk = {
> +	.halt_reg = 0x4201c,
> +	.clkr = {
> +		.enable_reg = 0x4201c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_sdcc1_ahb_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcnoc_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_sdcc1_apps_clk = {
> +	.halt_reg = 0x42018,
> +	.clkr = {
> +		.enable_reg = 0x42018,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_sdcc1_apps_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&sdcc1_apps_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_snoc_gmac0_ahb_clk = {
> +	.halt_reg = 0x260a0,
> +	.clkr = {
> +		.enable_reg = 0x260a0,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_snoc_gmac0_ahb_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&gmac_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_snoc_gmac0_axi_clk = {
> +	.halt_reg = 0x26084,
> +	.clkr = {
> +		.enable_reg = 0x26084,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_snoc_gmac0_axi_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&gmac_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_snoc_gmac1_ahb_clk = {
> +	.halt_reg = 0x260a4,
> +	.clkr = {
> +		.enable_reg = 0x260a4,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_snoc_gmac1_ahb_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&gmac_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_snoc_gmac1_axi_clk = {
> +	.halt_reg = 0x26088,
> +	.clkr = {
> +		.enable_reg = 0x26088,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_snoc_gmac1_axi_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&gmac_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_snoc_lpass_axim_clk = {
> +	.halt_reg = 0x26074,
> +	.clkr = {
> +		.enable_reg = 0x26074,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_snoc_lpass_axim_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&lpass_axim_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_snoc_lpass_sway_clk = {
> +	.halt_reg = 0x26078,
> +	.clkr = {
> +		.enable_reg = 0x26078,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_snoc_lpass_sway_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&lpass_sway_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_snoc_ubi0_axi_clk = {
> +	.halt_reg = 0x26094,
> +	.clkr = {
> +		.enable_reg = 0x26094,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_snoc_ubi0_axi_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&ubi0_axi_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_sys_noc_pcie0_axi_clk = {
> +	.halt_reg = 0x26048,
> +	.clkr = {
> +		.enable_reg = 0x26048,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_sys_noc_pcie0_axi_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcie0_axi_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_sys_noc_pcie1_axi_clk = {
> +	.halt_reg = 0x2604c,
> +	.clkr = {
> +		.enable_reg = 0x2604c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_sys_noc_pcie1_axi_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcie1_axi_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_sys_noc_qdss_stm_axi_clk = {
> +	.halt_reg = 0x26024,
> +	.clkr = {
> +		.enable_reg = 0x26024,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_sys_noc_qdss_stm_axi_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&qdss_stm_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_sys_noc_usb0_axi_clk = {
> +	.halt_reg = 0x26040,
> +	.clkr = {
> +		.enable_reg = 0x26040,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_sys_noc_usb0_axi_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&usb0_master_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_sys_noc_wcss_ahb_clk = {
> +	.halt_reg = 0x26034,
> +	.clkr = {
> +		.enable_reg = 0x26034,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_sys_noc_wcss_ahb_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&wcss_ahb_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_ubi0_axi_clk = {
> +	.halt_reg = 0x68200,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.clkr = {
> +		.enable_reg = 0x68200,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_ubi0_axi_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&ubi0_axi_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_ubi0_cfg_clk = {
> +	.halt_reg = 0x68160,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.clkr = {
> +		.enable_reg = 0x68160,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_ubi0_cfg_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcnoc_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_ubi0_dbg_clk = {
> +	.halt_reg = 0x68214,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.clkr = {
> +		.enable_reg = 0x68214,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_ubi0_dbg_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&qdss_tsctr_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_ubi0_core_clk = {
> +	.halt_reg = 0x68210,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.clkr = {
> +		.enable_reg = 0x68210,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_ubi0_core_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&ubi0_core_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_ubi0_nc_axi_clk = {
> +	.halt_reg = 0x68204,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.clkr = {
> +		.enable_reg = 0x68204,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_ubi0_nc_axi_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&system_noc_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_ubi0_utcm_clk = {
> +	.halt_reg = 0x68208,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.clkr = {
> +		.enable_reg = 0x68208,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_ubi0_utcm_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&system_noc_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_uniphy_ahb_clk = {
> +	.halt_reg = 0x56108,
> +	.clkr = {
> +		.enable_reg = 0x56108,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_uniphy_ahb_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcnoc_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_uniphy_rx_clk = {
> +	.halt_reg = 0x56110,
> +	.clkr = {
> +		.enable_reg = 0x56110,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_uniphy_rx_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&gmac1_rx_div_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_branch2_ops,
> +			.flags = CLK_SET_RATE_PARENT,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_uniphy_tx_clk = {
> +	.halt_reg = 0x56114,
> +	.clkr = {
> +		.enable_reg = 0x56114,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_uniphy_tx_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&gmac1_tx_div_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_branch2_ops,
> +			.flags = CLK_SET_RATE_PARENT,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_uniphy_sys_clk = {
> +	.halt_reg = 0x5610C,
> +	.clkr = {
> +		.enable_reg = 0x5610C,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_uniphy_sys_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&gcc_xo_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_usb0_aux_clk = {
> +	.halt_reg = 0x3e044,
> +	.clkr = {
> +		.enable_reg = 0x3e044,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_usb0_aux_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&usb0_aux_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_usb0_eud_at_clk = {
> +	.halt_reg = 0x3e04c,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x3e04c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_usb0_eud_at_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&eud_at_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_usb0_lfps_clk = {
> +	.halt_reg = 0x3e050,
> +	.clkr = {
> +		.enable_reg = 0x3e050,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_usb0_lfps_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&usb0_lfps_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_usb0_master_clk = {
> +	.halt_reg = 0x3e000,
> +	.clkr = {
> +		.enable_reg = 0x3e000,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_usb0_master_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&usb0_master_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_usb0_mock_utmi_clk = {
> +	.halt_reg = 0x3e008,
> +	.clkr = {
> +		.enable_reg = 0x3e008,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_usb0_mock_utmi_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&usb0_mock_utmi_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_usb0_phy_cfg_ahb_clk = {
> +	.halt_reg = 0x3e080,
> +	.clkr = {
> +		.enable_reg = 0x3e080,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_usb0_phy_cfg_ahb_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcnoc_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_usb0_sleep_clk = {
> +	.halt_reg = 0x3e004,
> +	.clkr = {
> +		.enable_reg = 0x3e004,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_usb0_sleep_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&gcc_sleep_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_usb0_pipe_clk = {
> +	.halt_reg = 0x3e040,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.clkr = {
> +		.enable_reg = 0x3e040,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_usb0_pipe_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&usb0_pipe_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_wcss_acmt_clk = {
> +	.halt_reg = 0x59064,
> +	.clkr = {
> +		.enable_reg = 0x59064,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_wcss_acmt_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&wcss_ahb_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_wcss_ahb_s_clk = {
> +	.halt_reg = 0x59034,
> +	.clkr = {
> +		.enable_reg = 0x59034,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_wcss_ahb_s_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&wcss_ahb_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_wcss_axi_m_clk = {
> +	.halt_reg = 0x5903C,
> +	.clkr = {
> +		.enable_reg = 0x5903C,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_wcss_axi_m_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&system_noc_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_wcss_axi_s_clk = {
> +	.halt_reg = 0x59068,
> +	.clkr = {
> +		.enable_reg = 0x59068,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_wi_s_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&system_noc_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_wcss_dbg_ifc_apb_bdg_clk = {
> +	.halt_reg = 0x59050,
> +	.clkr = {
> +		.enable_reg = 0x59050,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_wcss_dbg_ifc_apb_bdg_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&qdss_dap_sync_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_wcss_dbg_ifc_apb_clk = {
> +	.halt_reg = 0x59040,
> +	.clkr = {
> +		.enable_reg = 0x59040,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_wcss_dbg_ifc_apb_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&qdss_dap_sync_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_wcss_dbg_ifc_atb_bdg_clk = {
> +	.halt_reg = 0x59054,
> +	.clkr = {
> +		.enable_reg = 0x59054,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_wcss_dbg_ifc_atb_bdg_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&qdss_at_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_wcss_dbg_ifc_atb_clk = {
> +	.halt_reg = 0x59044,
> +	.clkr = {
> +		.enable_reg = 0x59044,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_wcss_dbg_ifc_atb_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&qdss_at_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_wcss_dbg_ifc_dapbus_bdg_clk = {
> +	.halt_reg = 0x59060,
> +	.clkr = {
> +		.enable_reg = 0x59060,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_wcss_dbg_ifc_dapbus_bdg_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&qdss_dap_sync_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_wcss_dbg_ifc_dapbus_clk = {
> +	.halt_reg = 0x5905C,
> +	.clkr = {
> +		.enable_reg = 0x5905C,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_wcss_dbg_ifc_dapbus_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&qdss_dap_sync_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_wcss_dbg_ifc_nts_bdg_clk = {
> +	.halt_reg = 0x59058,
> +	.clkr = {
> +		.enable_reg = 0x59058,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_wcss_dbg_ifc_nts_bdg_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&qdss_tsctr_div2_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_wcss_dbg_ifc_nts_clk = {
> +	.halt_reg = 0x59048,
> +	.clkr = {
> +		.enable_reg = 0x59048,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_wcss_dbg_ifc_nts_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&qdss_tsctr_div2_clk_src.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_wcss_ecahb_clk = {
> +	.halt_reg = 0x59038,
> +	.clkr = {
> +		.enable_reg = 0x59038,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_wcss_ecahb_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&wcss_ahb_clk_src.clkr.hw
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_hw *gcc_ipq5018_hws[] = {
> +	&gpll0_out_main_div2.hw,
> +	&pcnoc_clk_src.hw,
> +	&system_noc_clk_src.hw,
> +	&qdss_dap_sync_clk_src.hw,
> +	&qdss_tsctr_div2_clk_src.hw,
> +	&eud_at_clk_src.hw,
> +};
> +
> +static const struct alpha_pll_config ubi32_pll_config = {
> +	.l = 0x29,
> +	.alpha = 0xAAAAAAAA,
> +	.alpha_hi = 0xAA,
> +	.config_ctl_val = 0x4001075b,
> +	.main_output_mask = BIT(0),
> +	.aux_output_mask = BIT(1),
> +	.alpha_en_mask = BIT(24),
> +	.vco_val = 0x1,
> +	.vco_mask = GENMASK(21, 20),
> +	.test_ctl_val = 0x0,
> +	.test_ctl_hi_val = 0x0,
> +};
> +
> +static struct clk_regmap *gcc_ipq5018_clks[] = {
> +	[GPLL0_MAIN] = &gpll0_main.clkr,
> +	[GPLL0] = &gpll0.clkr,
> +	[GPLL2_MAIN] = &gpll2_main.clkr,
> +	[GPLL2] = &gpll2.clkr,
> +	[GPLL4_MAIN] = &gpll4_main.clkr,
> +	[GPLL4] = &gpll4.clkr,
> +	[UBI32_PLL_MAIN] = &ubi32_pll_main.clkr,
> +	[UBI32_PLL] = &ubi32_pll.clkr,
> +	[ADSS_PWM_CLK_SRC] = &adss_pwm_clk_src.clkr,
> +	[BLSP1_QUP1_I2C_APPS_CLK_SRC] = &blsp1_qup1_i2c_apps_clk_src.clkr,
> +	[BLSP1_QUP1_SPI_APPS_CLK_SRC] = &blsp1_qup1_spi_apps_clk_src.clkr,
> +	[BLSP1_QUP2_I2C_APPS_CLK_SRC] = &blsp1_qup2_i2c_apps_clk_src.clkr,
> +	[BLSP1_QUP2_SPI_APPS_CLK_SRC] = &blsp1_qup2_spi_apps_clk_src.clkr,
> +	[BLSP1_QUP3_I2C_APPS_CLK_SRC] = &blsp1_qup3_i2c_apps_clk_src.clkr,
> +	[BLSP1_QUP3_SPI_APPS_CLK_SRC] = &blsp1_qup3_spi_apps_clk_src.clkr,
> +	[BLSP1_UART1_APPS_CLK_SRC] = &blsp1_uart1_apps_clk_src.clkr,
> +	[BLSP1_UART2_APPS_CLK_SRC] = &blsp1_uart2_apps_clk_src.clkr,
> +	[CRYPTO_CLK_SRC] = &crypto_clk_src.clkr,
> +	[GCC_ADSS_PWM_CLK] = &gcc_adss_pwm_clk.clkr,
> +	[GCC_BLSP1_AHB_CLK] = &gcc_blsp1_ahb_clk.clkr,
> +	[GCC_BLSP1_QUP1_I2C_APPS_CLK] = &gcc_blsp1_qup1_i2c_apps_clk.clkr,
> +	[GCC_BLSP1_QUP1_SPI_APPS_CLK] = &gcc_blsp1_qup1_spi_apps_clk.clkr,
> +	[GCC_BLSP1_QUP2_I2C_APPS_CLK] = &gcc_blsp1_qup2_i2c_apps_clk.clkr,
> +	[GCC_BLSP1_QUP2_SPI_APPS_CLK] = &gcc_blsp1_qup2_spi_apps_clk.clkr,
> +	[GCC_BLSP1_QUP3_I2C_APPS_CLK] = &gcc_blsp1_qup3_i2c_apps_clk.clkr,
> +	[GCC_BLSP1_QUP3_SPI_APPS_CLK] = &gcc_blsp1_qup3_spi_apps_clk.clkr,
> +	[GCC_BLSP1_UART1_APPS_CLK] = &gcc_blsp1_uart1_apps_clk.clkr,
> +	[GCC_BLSP1_UART2_APPS_CLK] = &gcc_blsp1_uart2_apps_clk.clkr,
> +	[GCC_BTSS_LPO_CLK] = &gcc_btss_lpo_clk.clkr,
> +	[GCC_CMN_BLK_AHB_CLK] = &gcc_cmn_blk_ahb_clk.clkr,
> +	[GCC_CMN_BLK_SYS_CLK] = &gcc_cmn_blk_sys_clk.clkr,
> +	[GCC_CRYPTO_AHB_CLK] = &gcc_crypto_ahb_clk.clkr,
> +	[GCC_CRYPTO_AXI_CLK] = &gcc_crypto_axi_clk.clkr,
> +	[GCC_CRYPTO_CLK] = &gcc_crypto_clk.clkr,
> +	[GCC_DCC_CLK] = &gcc_dcc_clk.clkr,
> +	[GCC_GEPHY_RX_CLK] = &gcc_gephy_rx_clk.clkr,
> +	[GCC_GEPHY_TX_CLK] = &gcc_gephy_tx_clk.clkr,
> +	[GCC_GMAC0_CFG_CLK] = &gcc_gmac0_cfg_clk.clkr,
> +	[GCC_GMAC0_PTP_CLK] = &gcc_gmac0_ptp_clk.clkr,
> +	[GCC_GMAC0_RX_CLK] = &gcc_gmac0_rx_clk.clkr,
> +	[GCC_GMAC0_SYS_CLK] = &gcc_gmac0_sys_clk.clkr,
> +	[GCC_GMAC0_TX_CLK] = &gcc_gmac0_tx_clk.clkr,
> +	[GCC_GMAC1_CFG_CLK] = &gcc_gmac1_cfg_clk.clkr,
> +	[GCC_GMAC1_PTP_CLK] = &gcc_gmac1_ptp_clk.clkr,
> +	[GCC_GMAC1_RX_CLK] = &gcc_gmac1_rx_clk.clkr,
> +	[GCC_GMAC1_SYS_CLK] = &gcc_gmac1_sys_clk.clkr,
> +	[GCC_GMAC1_TX_CLK] = &gcc_gmac1_tx_clk.clkr,
> +	[GCC_GP1_CLK] = &gcc_gp1_clk.clkr,
> +	[GCC_GP2_CLK] = &gcc_gp2_clk.clkr,
> +	[GCC_GP3_CLK] = &gcc_gp3_clk.clkr,
> +	[GCC_LPASS_CORE_AXIM_CLK] = &gcc_lpass_core_axim_clk.clkr,
> +	[GCC_LPASS_SWAY_CLK] = &gcc_lpass_sway_clk.clkr,
> +	[GCC_MDIO0_AHB_CLK] = &gcc_mdio0_ahb_clk.clkr,
> +	[GCC_MDIO1_AHB_CLK] = &gcc_mdio1_ahb_clk.clkr,
> +	[GCC_PCIE0_AHB_CLK] = &gcc_pcie0_ahb_clk.clkr,
> +	[GCC_PCIE0_AUX_CLK] = &gcc_pcie0_aux_clk.clkr,
> +	[GCC_PCIE0_AXI_M_CLK] = &gcc_pcie0_axi_m_clk.clkr,
> +	[GCC_PCIE0_AXI_S_BRIDGE_CLK] = &gcc_pcie0_axi_s_bridge_clk.clkr,
> +	[GCC_PCIE0_AXI_S_CLK] = &gcc_pcie0_axi_s_clk.clkr,
> +	[GCC_PCIE1_AHB_CLK] = &gcc_pcie1_ahb_clk.clkr,
> +	[GCC_PCIE1_AUX_CLK] = &gcc_pcie1_aux_clk.clkr,
> +	[GCC_PCIE1_AXI_M_CLK] = &gcc_pcie1_axi_m_clk.clkr,
> +	[GCC_PCIE1_AXI_S_BRIDGE_CLK] = &gcc_pcie1_axi_s_bridge_clk.clkr,
> +	[GCC_PCIE1_AXI_S_CLK] = &gcc_pcie1_axi_s_clk.clkr,
> +	[GCC_PRNG_AHB_CLK] = &gcc_prng_ahb_clk.clkr,
> +	[GCC_Q6_AXIM_CLK] = &gcc_q6_axim_clk.clkr,
> +	[GCC_Q6_AXIM2_CLK] = &gcc_q6_axim2_clk.clkr,
> +	[GCC_Q6_AXIS_CLK] = &gcc_q6_axis_clk.clkr,
> +	[GCC_Q6_AHB_CLK] = &gcc_q6_ahb_clk.clkr,
> +	[GCC_Q6_AHB_S_CLK] = &gcc_q6_ahb_s_clk.clkr,
> +	[GCC_Q6_TSCTR_1TO2_CLK] = &gcc_q6_tsctr_1to2_clk.clkr,
> +	[GCC_Q6SS_ATBM_CLK] = &gcc_q6ss_atbm_clk.clkr,
> +	[GCC_Q6SS_PCLKDBG_CLK] = &gcc_q6ss_pclkdbg_clk.clkr,
> +	[GCC_Q6SS_TRIG_CLK] = &gcc_q6ss_trig_clk.clkr,
> +	[GCC_QDSS_AT_CLK] = &gcc_qdss_at_clk.clkr,
> +	[GCC_QDSS_CFG_AHB_CLK] = &gcc_qdss_cfg_ahb_clk.clkr,
> +	[GCC_QDSS_DAP_AHB_CLK] = &gcc_qdss_dap_ahb_clk.clkr,
> +	[GCC_QDSS_DAP_CLK] = &gcc_qdss_dap_clk.clkr,
> +	[GCC_QDSS_ETR_USB_CLK] = &gcc_qdss_etr_usb_clk.clkr,
> +	[GCC_QDSS_EUD_AT_CLK] = &gcc_qdss_eud_at_clk.clkr,
> +	[GCC_QDSS_STM_CLK] = &gcc_qdss_stm_clk.clkr,
> +	[GCC_QDSS_TRACECLKIN_CLK] = &gcc_qdss_traceclkin_clk.clkr,
> +	[GCC_QDSS_TSCTR_DIV8_CLK] = &gcc_qdss_tsctr_div8_clk.clkr,
> +	[GCC_QPIC_AHB_CLK] = &gcc_qpic_ahb_clk.clkr,
> +	[GCC_QPIC_CLK] = &gcc_qpic_clk.clkr,
> +	[GCC_QPIC_IO_MACRO_CLK] = &gcc_qpic_io_macro_clk.clkr,
> +	[GCC_SDCC1_AHB_CLK] = &gcc_sdcc1_ahb_clk.clkr,
> +	[GCC_SDCC1_APPS_CLK] = &gcc_sdcc1_apps_clk.clkr,
> +	[GCC_SLEEP_CLK_SRC] = &gcc_sleep_clk_src.clkr,
> +	[GCC_SNOC_GMAC0_AHB_CLK] = &gcc_snoc_gmac0_ahb_clk.clkr,
> +	[GCC_SNOC_GMAC0_AXI_CLK] = &gcc_snoc_gmac0_axi_clk.clkr,
> +	[GCC_SNOC_GMAC1_AHB_CLK] = &gcc_snoc_gmac1_ahb_clk.clkr,
> +	[GCC_SNOC_GMAC1_AXI_CLK] = &gcc_snoc_gmac1_axi_clk.clkr,
> +	[GCC_SNOC_LPASS_AXIM_CLK] = &gcc_snoc_lpass_axim_clk.clkr,
> +	[GCC_SNOC_LPASS_SWAY_CLK] = &gcc_snoc_lpass_sway_clk.clkr,
> +	[GCC_SNOC_UBI0_AXI_CLK] = &gcc_snoc_ubi0_axi_clk.clkr,
> +	[GCC_SYS_NOC_PCIE0_AXI_CLK] = &gcc_sys_noc_pcie0_axi_clk.clkr,
> +	[GCC_SYS_NOC_PCIE1_AXI_CLK] = &gcc_sys_noc_pcie1_axi_clk.clkr,
> +	[GCC_SYS_NOC_QDSS_STM_AXI_CLK] = &gcc_sys_noc_qdss_stm_axi_clk.clkr,
> +	[GCC_SYS_NOC_USB0_AXI_CLK] = &gcc_sys_noc_usb0_axi_clk.clkr,
> +	[GCC_SYS_NOC_WCSS_AHB_CLK] = &gcc_sys_noc_wcss_ahb_clk.clkr,
> +	[GCC_UBI0_AXI_CLK] = &gcc_ubi0_axi_clk.clkr,
> +	[GCC_UBI0_CFG_CLK] = &gcc_ubi0_cfg_clk.clkr,
> +	[GCC_UBI0_CORE_CLK] = &gcc_ubi0_core_clk.clkr,
> +	[GCC_UBI0_DBG_CLK] = &gcc_ubi0_dbg_clk.clkr,
> +	[GCC_UBI0_NC_AXI_CLK] = &gcc_ubi0_nc_axi_clk.clkr,
> +	[GCC_UBI0_UTCM_CLK] = &gcc_ubi0_utcm_clk.clkr,
> +	[GCC_UNIPHY_AHB_CLK] = &gcc_uniphy_ahb_clk.clkr,
> +	[GCC_UNIPHY_RX_CLK] = &gcc_uniphy_rx_clk.clkr,
> +	[GCC_UNIPHY_SYS_CLK] = &gcc_uniphy_sys_clk.clkr,
> +	[GCC_UNIPHY_TX_CLK] = &gcc_uniphy_tx_clk.clkr,
> +	[GCC_USB0_AUX_CLK] = &gcc_usb0_aux_clk.clkr,
> +	[GCC_USB0_EUD_AT_CLK] = &gcc_usb0_eud_at_clk.clkr,
> +	[GCC_USB0_LFPS_CLK] = &gcc_usb0_lfps_clk.clkr,
> +	[GCC_USB0_MASTER_CLK] = &gcc_usb0_master_clk.clkr,
> +	[GCC_USB0_MOCK_UTMI_CLK] = &gcc_usb0_mock_utmi_clk.clkr,
> +	[GCC_USB0_PHY_CFG_AHB_CLK] = &gcc_usb0_phy_cfg_ahb_clk.clkr,
> +	[GCC_USB0_SLEEP_CLK] = &gcc_usb0_sleep_clk.clkr,
> +	[GCC_WCSS_ACMT_CLK] = &gcc_wcss_acmt_clk.clkr,
> +	[GCC_WCSS_AHB_S_CLK] = &gcc_wcss_ahb_s_clk.clkr,
> +	[GCC_WCSS_AXI_M_CLK] = &gcc_wcss_axi_m_clk.clkr,
> +	[GCC_WCSS_AXI_S_CLK] = &gcc_wcss_axi_s_clk.clkr,
> +	[GCC_WCSS_DBG_IFC_APB_BDG_CLK] = &gcc_wcss_dbg_ifc_apb_bdg_clk.clkr,
> +	[GCC_WCSS_DBG_IFC_APB_CLK] = &gcc_wcss_dbg_ifc_apb_clk.clkr,
> +	[GCC_WCSS_DBG_IFC_ATB_BDG_CLK] = &gcc_wcss_dbg_ifc_atb_bdg_clk.clkr,
> +	[GCC_WCSS_DBG_IFC_ATB_CLK] = &gcc_wcss_dbg_ifc_atb_clk.clkr,
> +	[GCC_WCSS_DBG_IFC_DAPBUS_BDG_CLK] = &gcc_wcss_dbg_ifc_dapbus_bdg_clk.clkr,
> +	[GCC_WCSS_DBG_IFC_DAPBUS_CLK] = &gcc_wcss_dbg_ifc_dapbus_clk.clkr,
> +	[GCC_WCSS_DBG_IFC_NTS_BDG_CLK] = &gcc_wcss_dbg_ifc_nts_bdg_clk.clkr,
> +	[GCC_WCSS_DBG_IFC_NTS_CLK] = &gcc_wcss_dbg_ifc_nts_clk.clkr,
> +	[GCC_WCSS_ECAHB_CLK] = &gcc_wcss_ecahb_clk.clkr,
> +	[GCC_XO_CLK] = &gcc_xo_clk.clkr,
> +	[GCC_XO_CLK_SRC] = &gcc_xo_clk_src.clkr,
> +	[GMAC0_RX_CLK_SRC] = &gmac0_rx_clk_src.clkr,
> +	[GMAC0_RX_DIV_CLK_SRC] = &gmac0_rx_div_clk_src.clkr,
> +	[GMAC0_TX_CLK_SRC] = &gmac0_tx_clk_src.clkr,
> +	[GMAC0_TX_DIV_CLK_SRC] = &gmac0_tx_div_clk_src.clkr,
> +	[GMAC1_RX_CLK_SRC] = &gmac1_rx_clk_src.clkr,
> +	[GMAC1_RX_DIV_CLK_SRC] = &gmac1_rx_div_clk_src.clkr,
> +	[GMAC1_TX_CLK_SRC] = &gmac1_tx_clk_src.clkr,
> +	[GMAC1_TX_DIV_CLK_SRC] = &gmac1_tx_div_clk_src.clkr,
> +	[GMAC_CLK_SRC] = &gmac_clk_src.clkr,
> +	[GP1_CLK_SRC] = &gp1_clk_src.clkr,
> +	[GP2_CLK_SRC] = &gp2_clk_src.clkr,
> +	[GP3_CLK_SRC] = &gp3_clk_src.clkr,
> +	[LPASS_AXIM_CLK_SRC] = &lpass_axim_clk_src.clkr,
> +	[LPASS_SWAY_CLK_SRC] = &lpass_sway_clk_src.clkr,
> +	[PCIE0_AUX_CLK_SRC] = &pcie0_aux_clk_src.clkr,
> +	[PCIE0_AXI_CLK_SRC] = &pcie0_axi_clk_src.clkr,
> +	[PCIE1_AUX_CLK_SRC] = &pcie1_aux_clk_src.clkr,
> +	[PCIE1_AXI_CLK_SRC] = &pcie1_axi_clk_src.clkr,
> +	[PCNOC_BFDCD_CLK_SRC] = &pcnoc_bfdcd_clk_src.clkr,
> +	[Q6_AXI_CLK_SRC] = &q6_axi_clk_src.clkr,
> +	[QDSS_AT_CLK_SRC] = &qdss_at_clk_src.clkr,
> +	[QDSS_STM_CLK_SRC] = &qdss_stm_clk_src.clkr,
> +	[QDSS_TSCTR_CLK_SRC] = &qdss_tsctr_clk_src.clkr,
> +	[QDSS_TRACECLKIN_CLK_SRC] = &qdss_traceclkin_clk_src.clkr,
> +	[QPIC_IO_MACRO_CLK_SRC] = &qpic_io_macro_clk_src.clkr,
> +	[SDCC1_APPS_CLK_SRC] = &sdcc1_apps_clk_src.clkr,
> +	[SYSTEM_NOC_BFDCD_CLK_SRC] = &system_noc_bfdcd_clk_src.clkr,
> +	[UBI0_AXI_CLK_SRC] = &ubi0_axi_clk_src.clkr,
> +	[UBI0_CORE_CLK_SRC] = &ubi0_core_clk_src.clkr,
> +	[USB0_AUX_CLK_SRC] = &usb0_aux_clk_src.clkr,
> +	[USB0_LFPS_CLK_SRC] = &usb0_lfps_clk_src.clkr,
> +	[USB0_MASTER_CLK_SRC] = &usb0_master_clk_src.clkr,
> +	[USB0_MOCK_UTMI_CLK_SRC] = &usb0_mock_utmi_clk_src.clkr,
> +	[WCSS_AHB_CLK_SRC] = &wcss_ahb_clk_src.clkr,
> +	[PCIE0_PIPE_CLK_SRC] = &pcie0_pipe_clk_src.clkr,
> +	[PCIE1_PIPE_CLK_SRC] = &pcie1_pipe_clk_src.clkr,
> +	[GCC_PCIE0_PIPE_CLK] = &gcc_pcie0_pipe_clk.clkr,
> +	[GCC_PCIE1_PIPE_CLK] = &gcc_pcie1_pipe_clk.clkr,
> +	[USB0_PIPE_CLK_SRC] = &usb0_pipe_clk_src.clkr,
> +	[GCC_USB0_PIPE_CLK] = &gcc_usb0_pipe_clk.clkr,
> +};
> +
> +static const struct qcom_reset_map gcc_ipq5018_resets[] = {
> +	[GCC_APC0_VOLTAGE_DROOP_DETECTOR_BCR] = { 0x78000, 0 },
> +	[GCC_BLSP1_BCR] = { 0x01000, 0 },
> +	[GCC_BLSP1_QUP1_BCR] = { 0x02000, 0 },
> +	[GCC_BLSP1_QUP2_BCR] = { 0x03008, 0 },
> +	[GCC_BLSP1_QUP3_BCR] = { 0x04008, 0 },
> +	[GCC_BLSP1_UART1_BCR] = { 0x02038, 0 },
> +	[GCC_BLSP1_UART2_BCR] = { 0x03028, 0 },
> +	[GCC_BOOT_ROM_BCR] = { 0x13008, 0 },
> +	[GCC_BTSS_BCR] = { 0x1c000, 0 },
> +	[GCC_CMN_BLK_BCR] = { 0x56300, 0 },
> +	[GCC_CMN_LDO_BCR] = { 0x33000, 0 },
> +	[GCC_CE_BCR] = { 0x33014, 0 },
> +	[GCC_CRYPTO_BCR] = { 0x16000, 0 },
> +	[GCC_DCC_BCR] = { 0x77000, 0 },
> +	[GCC_DCD_BCR] = { 0x2a000, 0 },
> +	[GCC_DDRSS_BCR] = { 0x1e000, 0 },
> +	[GCC_EDPD_BCR] = { 0x3a000, 0 },
> +	[GCC_GEPHY_BCR] = { 0x56000, 0 },
> +	[GCC_GEPHY_MDC_SW_ARES] = { 0x56004, 0 },
> +	[GCC_GEPHY_DSP_HW_ARES] = { 0x56004, 1 },
> +	[GCC_GEPHY_RX_ARES] = { 0x56004, 2 },
> +	[GCC_GEPHY_TX_ARES] = { 0x56004, 3 },
> +	[GCC_GMAC0_BCR] = { 0x19000, 0 },
> +	[GCC_GMAC0_CFG_ARES] = { 0x68428, 0 },
> +	[GCC_GMAC0_SYS_ARES] = { 0x68428, 1 },
> +	[GCC_GMAC1_BCR] = { 0x19100, 0 },
> +	[GCC_GMAC1_CFG_ARES] = { 0x68438, 0 },
> +	[GCC_GMAC1_SYS_ARES] = { 0x68438, 1 },
> +	[GCC_IMEM_BCR] = { 0x0e000, 0 },
> +	[GCC_LPASS_BCR] = { 0x2e000, 0 },
> +	[GCC_MDIO0_BCR] = { 0x58000, 0 },
> +	[GCC_MDIO1_BCR] = { 0x58010, 0 },
> +	[GCC_MPM_BCR] = { 0x2c000, 0 },
> +	[GCC_PCIE0_BCR] = { 0x75004, 0 },
> +	[GCC_PCIE0_LINK_DOWN_BCR] = { 0x750a8, 0 },
> +	[GCC_PCIE0_PHY_BCR] = { 0x75038, 0 },
> +	[GCC_PCIE0PHY_PHY_BCR] = { 0x7503c, 0 },
> +	[GCC_PCIE0_PIPE_ARES] = { 0x75040, 0 },
> +	[GCC_PCIE0_SLEEP_ARES] = { 0x75040, 1 },
> +	[GCC_PCIE0_CORE_STICKY_ARES] = { 0x75040, 2 },
> +	[GCC_PCIE0_AXI_MASTER_ARES] = { 0x75040, 3 },
> +	[GCC_PCIE0_AXI_SLAVE_ARES] = { 0x75040, 4 },
> +	[GCC_PCIE0_AHB_ARES] = { 0x75040, 5 },
> +	[GCC_PCIE0_AXI_MASTER_STICKY_ARES] = { 0x75040, 6 },
> +	[GCC_PCIE0_AXI_SLAVE_STICKY_ARES] = { 0x75040, 7 },
> +	[GCC_PCIE1_BCR] = { 0x76004, 0 },
> +	[GCC_PCIE1_LINK_DOWN_BCR] = { 0x76044, 0 },
> +	[GCC_PCIE1_PHY_BCR] = { 0x76038, 0 },
> +	[GCC_PCIE1PHY_PHY_BCR] = { 0x7603c, 0 },
> +	[GCC_PCIE1_PIPE_ARES] = { 0x76040, 0 },
> +	[GCC_PCIE1_SLEEP_ARES] = { 0x76040, 1 },
> +	[GCC_PCIE1_CORE_STICKY_ARES] = { 0x76040, 2 },
> +	[GCC_PCIE1_AXI_MASTER_ARES] = { 0x76040, 3 },
> +	[GCC_PCIE1_AXI_SLAVE_ARES] = { 0x76040, 4 },
> +	[GCC_PCIE1_AHB_ARES] = { 0x76040, 5 },
> +	[GCC_PCIE1_AXI_MASTER_STICKY_ARES] = { 0x76040, 6 },
> +	[GCC_PCIE1_AXI_SLAVE_STICKY_ARES] = { 0x76040, 7 },
> +	[GCC_PCNOC_BCR] = { 0x27018, 0 },
> +	[GCC_PCNOC_BUS_TIMEOUT0_BCR] = { 0x48000, 0 },
> +	[GCC_PCNOC_BUS_TIMEOUT1_BCR] = { 0x48008, 0 },
> +	[GCC_PCNOC_BUS_TIMEOUT2_BCR] = { 0x48010, 0 },
> +	[GCC_PCNOC_BUS_TIMEOUT3_BCR] = { 0x48018, 0 },
> +	[GCC_PCNOC_BUS_TIMEOUT4_BCR] = { 0x48020, 0 },
> +	[GCC_PCNOC_BUS_TIMEOUT5_BCR] = { 0x48028, 0 },
> +	[GCC_PCNOC_BUS_TIMEOUT6_BCR] = { 0x48030, 0 },
> +	[GCC_PCNOC_BUS_TIMEOUT7_BCR] = { 0x48038, 0 },
> +	[GCC_PCNOC_BUS_TIMEOUT8_BCR] = { 0x48040, 0 },
> +	[GCC_PCNOC_BUS_TIMEOUT9_BCR] = { 0x48048, 0 },
> +	[GCC_PCNOC_BUS_TIMEOUT10_BCR] = { 0x48050, 0 },
> +	[GCC_PCNOC_BUS_TIMEOUT11_BCR] = { 0x48058, 0 },
> +	[GCC_PRNG_BCR] = { 0x13000, 0 },
> +	[GCC_Q6SS_DBG_ARES] = { 0x59110, 0 },
> +	[GCC_Q6_AHB_S_ARES] = { 0x59110, 1 },
> +	[GCC_Q6_AHB_ARES] = { 0x59110, 2 },
> +	[GCC_Q6_AXIM2_ARES] = { 0x59110, 3 },
> +	[GCC_Q6_AXIM_ARES] = { 0x59110, 4 },
> +	[GCC_Q6_AXIS_ARES] = { 0x59158, 0 },
> +	[GCC_QDSS_BCR] = { 0x29000, 0 },
> +	[GCC_QPIC_BCR] = { 0x57018, 0 },
> +	[GCC_QUSB2_0_PHY_BCR] = { 0x41030, 0 },
> +	[GCC_SDCC1_BCR] = { 0x42000, 0 },
> +	[GCC_SEC_CTRL_BCR] = { 0x1a000, 0 },
> +	[GCC_SPDM_BCR] = { 0x2f000, 0 },
> +	[GCC_SYSTEM_NOC_BCR] = { 0x26000, 0 },
> +	[GCC_TCSR_BCR] = { 0x28000, 0 },
> +	[GCC_TLMM_BCR] = { 0x34000, 0 },
> +	[GCC_UBI0_AXI_ARES] = { 0x680},
> +	[GCC_UBI0_AHB_ARES] = { 0x68010, 1 },
> +	[GCC_UBI0_NC_AXI_ARES] = { 0x68010, 2 },
> +	[GCC_UBI0_DBG_ARES] = { 0x68010, 3 },
> +	[GCC_UBI0_UTCM_ARES] = { 0x68010, 6 },
> +	[GCC_UBI0_CORE_ARES] = { 0x68010, 7 },
> +	[GCC_UBI32_BCR] = { 0x19064, 0 },
> +	[GCC_UNIPHY_BCR] = { 0x56100, 0 },
> +	[GCC_UNIPHY_AHB_ARES] = { 0x56104, 0 },
> +	[GCC_UNIPHY_SYS_ARES] = { 0x56104, 1 },
> +	[GCC_UNIPHY_RX_ARES] = { 0x56104, 4 },
> +	[GCC_UNIPHY_TX_ARES] = { 0x56104, 5 },
> +	[GCC_UNIPHY_SOFT_RESET] = {0x56104, 0 },
> +	[GCC_USB0_BCR] = { 0x3e070, 0 },
> +	[GCC_USB0_PHY_BCR] = { 0x3e034, 0 },
> +	[GCC_WCSS_BCR] = { 0x18000, 0 },
> +	[GCC_WCSS_DBG_ARES] = { 0x59008, 0 },
> +	[GCC_WCSS_ECAHB_ARES] = { 0x59008, 1 },
> +	[GCC_WCSS_ACMT_ARES] = { 0x59008, 2 },
> +	[GCC_WCSS_DBG_BDG_ARES] = { 0x59008, 3 },
> +	[GCC_WCSS_AHB_S_ARES] = { 0x59008, 4 },
> +	[GCC_WCSS_AXI_M_ARES] = { 0x59008, 5 },
> +	[GCC_WCSS_AXI_S_ARES] = { 0x59008, 6 },
> +	[GCC_WCSS_Q6_BCR] = { 0x18004, 0 },
> +	[GCC_WCSSAON_RESET] = { 0x59010, 0},
> +	[GCC_GEPHY_MISC_ARES] = { 0x56004, 0 },
> +};
> +
> +static const struct of_device_id gcc_ipq5018_match_table[] = {
> +	{ .compatible = "qcom,gcc-ipq5018" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, gcc_ipq5018_match_table);
> +
> +static const struct regmap_config gcc_ipq5018_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.max_register = 0x7fffc,
> +	.fast_io = true,
> +};
> +
> +static const struct qcom_cc_desc gcc_ipq5018_desc = {
> +	.config = &gcc_ipq5018_regmap_config,
> +	.clks = gcc_ipq5018_clks,
> +	.num_clks = ARRAY_SIZE(gcc_ipq5018_clks),
> +	.resets = gcc_ipq5018_resets,
> +	.num_resets = ARRAY_SIZE(gcc_ipq5018_resets),
> +	.clk_hws = gcc_ipq5018_hws,
> +	.num_clk_hws = ARRAY_SIZE(gcc_ipq5018_hws),
> +};
> +
> +static int gcc_ipq5018_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +	struct qcom_cc_desc ipq5018_desc = gcc_ipq5018_desc;
> +
> +	regmap = qcom_cc_map(pdev, &ipq5018_desc);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	clk_alpha_pll_configure(&ubi32_pll_main, regmap, &ubi32_pll_config);
> +
> +	return qcom_cc_really_probe(pdev, &ipq5018_desc, regmap);
> +}
> +
> +static struct platform_driver gcc_ipq5018_driver = {
> +	.probe = gcc_ipq5018_probe,
> +	.driver = {
> +		.name = "qcom,gcc-ipq5018",
> +		.of_match_table = gcc_ipq5018_match_table,
> +	},
> +};
> +
> +static int __init gcc_ipq5018_init(void)
> +{
> +	return platform_driver_register(&gcc_ipq5018_driver);
> +}
> +core_initcall(gcc_ipq5018_init);
> +
> +static void __exit gcc_ipq5018_exit(void)
> +{
> +	platform_driver_unregister(&gcc_ipq5018_driver);
> +}
> +module_exit(gcc_ipq5018_exit);
> +
> +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. GCC IPQ5018 Driver");
> +MODULE_LICENSE("GPL");
