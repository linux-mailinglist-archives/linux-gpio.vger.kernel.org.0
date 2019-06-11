Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31EF93D1F0
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2019 18:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405473AbfFKQMd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 12:12:33 -0400
Received: from ns.iliad.fr ([212.27.33.1]:34698 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405466AbfFKQMd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jun 2019 12:12:33 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 9C92620975;
        Tue, 11 Jun 2019 18:12:30 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 8405B2077F;
        Tue, 11 Jun 2019 18:12:30 +0200 (CEST)
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        gpio <linux-gpio@vger.kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: How to write "modern" pinctrl DT node
Message-ID: <18ab4b1c-e74e-410a-a504-f524e46c42ac@free.fr>
Date:   Tue, 11 Jun 2019 18:12:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Tue Jun 11 18:12:30 2019 +0200 (CEST)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

I'm working with a device (TSIF0) which apparently drives 4 pins:
(Or maybe 5... it seems gpio40 might be associated with TSIF0 as well.)

https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/msm8998-pinctrl.dtsi?h=LE.UM.1.3.r3.25#n2258

I'll copy the downstream DT nodes here for discussion:

		tsif0_signals_active: tsif0_signals_active {
			tsif1_clk {
				pins = "gpio89"; /* TSIF0 CLK */
				function = "tsif1_clk";
			};
			tsif1_en {
				pins = "gpio90"; /* TSIF0 Enable */
				function = "tsif1_en";
			};
			tsif1_data {
				pins = "gpio91"; /* TSIF0 DATA */
				function = "tsif1_data";
			};
			signals_cfg {
				pins = "gpio89", "gpio90", "gpio91";
				drive_strength = <2>;	/* 2 mA */
				bias-pull-down;		/* pull down */
			};
		};

		/* sync signal is only used if configured to mode-2 */
		tsif0_sync_active: tsif0_sync_active {
			tsif1_sync {
				pins = "gpio9";	/* TSIF0 SYNC */
				function = "tsif1_sync";
				drive_strength = <2>;	/* 2 mA */
				bias-pull-down;		/* pull down */
			};
		};


Can I rewrite the first node as:

	tsif0_default {
		pins = "gpio89", "gpio90", "gpio91"; /* clk, enable, data */
		function = "is_this_just_a_label?"; /* Can I just leave it out? */
		drive-strength = <2>;
		bias-pull-down;
	}

Is this enough information to configure the 3 pins? Probably not...
There must be some information hard-coded in drivers/pinctrl/qcom/pinctrl-msm8998.c

Can I merge pin 9 in the above node, since it has the same
"hardware properties" (drive_strength and bias_direction) ?


Looking at relevant parts of drivers/pinctrl/qcom/pinctrl-msm8998.c

	PINCTRL_PIN(89, "GPIO_89"),
	PINCTRL_PIN(90, "GPIO_90"),
	PINCTRL_PIN(91, "GPIO_91"),

DECLARE_MSM_GPIO_PINS(89);
DECLARE_MSM_GPIO_PINS(90);
DECLARE_MSM_GPIO_PINS(91);

static const char * const tsif1_clk_groups[] = {
	"gpio89",
};
static const char * const phase_flag10_groups[] = {
	"gpio89",
};
static const char * const tsif1_en_groups[] = {
	"gpio90",
};
static const char * const mdp_vsync0_groups[] = {
	"gpio90",
};
static const char * const mdp_vsync1_groups[] = {
	"gpio90",
};
static const char * const mdp_vsync2_groups[] = {
	"gpio90",
};
static const char * const mdp_vsync3_groups[] = {
	"gpio90",
};
static const char * const blsp1_spi_groups[] = {
	"gpio90",
};
static const char * const tgu_ch0_groups[] = {
	"gpio90",
};
static const char * const qdss_cti1_b_groups[] = {
	"gpio90", "gpio91",
};
static const char * const tsif1_data_groups[] = {
	"gpio91",
};
static const char * const sdc4_cmd_groups[] = {
	"gpio91",
};
static const char * const tgu_ch1_groups[] = {
	"gpio91",
};
static const char * const phase_flag1_groups[] = {
	"gpio91",
};

	PINGROUP(89, EAST, tsif1_clk, phase_flag10, NA, NA, NA, NA, NA, NA, NA),
	PINGROUP(90, EAST, tsif1_en, mdp_vsync0, mdp_vsync1, mdp_vsync2, mdp_vsync3, blsp1_spi, tgu_ch0, qdss_cti1_b, NA),
	PINGROUP(91, EAST, tsif1_data, sdc4_cmd, tgu_ch1, phase_flag1, qdss_cti1_b, NA, NA, NA, NA),

(It seems to me there is some redundancy in this driver?)

These last 3 lines seem to summarize how each pin is muxed?
I.e. it's used as one function, exclusively?
So a proper driver should be unloadable, to let other drivers
claim the shared pins?

Regards.
