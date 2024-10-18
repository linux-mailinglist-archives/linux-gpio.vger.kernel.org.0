Return-Path: <linux-gpio+bounces-11648-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF6D9A42FA
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 17:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06F9BB2617D
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 15:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5942A202F7C;
	Fri, 18 Oct 2024 15:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="uOeco2E+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F59E2022C2;
	Fri, 18 Oct 2024 15:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729266780; cv=none; b=eVb+/LUnDu/vmR5tzaU9S8sTxi/grQ4TRBxiMcM0kq1FwZ1wVJQDfmF6DcR32B3M6/KNQ55bgNoF6e5PsMfEHFdTMf0kWVJc07ZvzxtfOxv3ZF90KhzW9ihW1cMb9vlaeNyVkmjVjLtrVweB1SXilfj3w48q+ridr2dW3KzyvOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729266780; c=relaxed/simple;
	bh=3tVGhZmM4IAADEsD1ADbBCV0Mbp+DcvUonyXzbkqadg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mhWAtH4SGOocGKYl2vJBCS+Z/QKdMcHdZJHEiXoonCXGIXP9wj0HYQ7Kb2U2rMfl1DpmMiNg3HNJYI+MkJ0cmYcJ1iMPR5gGTNX49FC48Czy+jMl2IeflxlR2ys92VonYdO/xjLLNjsUHQShBDJy2598+3eC3YtQ8enPeKsTr1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=uOeco2E+; arc=none smtp.client-ip=80.12.242.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 1pGStsci8jsSz1pGStrPkf; Fri, 18 Oct 2024 17:51:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1729266706;
	bh=sLry7svattCS2VIxhjFRtmY/ODP4U3928+bO0Nd9eYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=uOeco2E+QH4CUOS8p/vIaRqUOczATdzDubY7N5PrkqLWeK9FoeOCS0jI7RuPQ3Y5D
	 3YfzV6/FErDr7/dbA5F2BJ6vqX45v5gyOcZGlrV6VyLBHxPyCQGqbeMwlOxw3m6K3f
	 t5mmM/VsgjSBUP9QQO+FZJpDTKriCETUqSd1chgQeQW5wVhE00QQNrlGguWBk3Hfp1
	 i7IZjPWy/1NdxdHEanezhBD9QHbF7IYUtoWXHEqUlJXFt0RKy0flT1BQaIt3LOf4b5
	 nqn1qGcVuM774czTuDqgoSi9BEYAMF4LS7vtnzx1+8nMJL0aeFGeQoF4p0mWkONrgt
	 5F+gWqjnPSOEQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 18 Oct 2024 17:51:46 +0200
X-ME-IP: 90.11.132.44
Message-ID: <3e1b23e9-d5a3-4b3d-973c-546b994e3ae2@wanadoo.fr>
Date: Fri, 18 Oct 2024 17:51:44 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] pinctrl: meson: Add driver support for Amlogic A4
 SoCs
To: xianwei.zhao@amlogic.com, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
 <20241018-a4_pinctrl-v3-2-e76fd1cf01d7@amlogic.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241018-a4_pinctrl-v3-2-e76fd1cf01d7@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 18/10/2024 à 10:10, Xianwei Zhao via B4 Relay a écrit :
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add a new pinctrl driver for Amlogic A4 SoCs which share
> the same register layout as the previous Amlogic S4.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   drivers/pinctrl/meson/Kconfig              |    6 +
>   drivers/pinctrl/meson/Makefile             |    1 +
>   drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 1253 ++++++++++++++++++++++++++++
>   3 files changed, 1260 insertions(+)

Hi,

a few nitpicks below.

...

> +
> +static struct meson_pmx_group a4_periphs_groups[] = {

I think that struct meson_pmx_group could be const.
(same for a4_aobus_groups above)

> +	/* func0 as GPIO */
> +	GPIO_GROUP(GPIOE_0),
> +	GPIO_GROUP(GPIOE_1),
> +

...

> +static struct meson_pmx_func a4_periphs_functions[] = {

I think that struct meson_pmx_func could be const.
(a4_aobus_functions above as well)

> +	FUNCTION(gpio_periphs),
> +	FUNCTION(uart_a),
> +	FUNCTION(uart_b),
> +	FUNCTION(uart_d),
> +	FUNCTION(uart_e),
> +	FUNCTION(i2c0),
> +	FUNCTION(i2c1),
> +	FUNCTION(i2c2),
> +	FUNCTION(i2c3),
> +	FUNCTION(pwm_a),
> +	FUNCTION(pwm_b),
> +	FUNCTION(pwm_c),
> +	FUNCTION(pwm_d),
> +	FUNCTION(pwm_e),
> +	FUNCTION(pwm_f),
> +	FUNCTION(pwm_g),
> +	FUNCTION(pwm_h),
> +	FUNCTION(remote_out),
> +	FUNCTION(remote_in),
> +	FUNCTION(dcon_led),
> +	FUNCTION(spinf),
> +	FUNCTION(lcd),
> +	FUNCTION(jtag_1),
> +	FUNCTION(gen_clk),
> +	FUNCTION(clk12_24),
> +	FUNCTION(emmc),
> +	FUNCTION(nand),
> +	FUNCTION(spi_a),
> +	FUNCTION(spi_b),
> +	FUNCTION(pdm),
> +	FUNCTION(sdio),
> +	FUNCTION(eth),
> +	FUNCTION(mic_mute),
> +	FUNCTION(mclk),
> +	FUNCTION(tdm),
> +	FUNCTION(spdif_in),
> +	FUNCTION(spdif_out)
> +};
> +
> +static struct meson_bank a4_periphs_banks[] = {

I think that both struct meson_bank could be const.

> +	/* name  first  last  irq  pullen  pull  dir  out  in */
> +	BANK_DS("E",  GPIOE_0,  GPIOE_1,  14,  15,
> +		0x43,  0, 0x44,  0, 0x42,  0, 0x41,  0, 0x40,  0, 0x47,  0),
> +	BANK_DS("D",  GPIOD_0, GPIOD_15,  16, 31,
> +		0x33,  0, 0x34,  0, 0x32,  0, 0x31,  0, 0x30,  0, 0x37,  0),
> +	BANK_DS("B",  GPIOB_0, GPIOB_13, 0, 13,
> +		0x63,  0, 0x64,  0, 0x62,  0, 0x61,  0, 0x60,  0, 0x67,  0),
> +	BANK_DS("X",  GPIOX_0, GPIOX_17, 55, 72,
> +		0x13,  0, 0x14,  0, 0x12,  0, 0x11,  0, 0x10,  0, 0x17,  0),
> +	BANK_DS("T",  GPIOT_0, GPIOT_22, 32, 54,
> +		0x23,  0, 0x24,  0, 0x22,  0, 0x21,  0, 0x20,  0, 0x27,  0),
> +};
> +
> +static struct meson_bank a4_aobus_banks[] = {
> +	BANK_DS("AO", GPIOAO_0, GPIOAO_6,  0,  6,
> +		0x3,   0,  0x4,  0,   0x2,  0,  0x1,  0,  0x0,  0,  0x7, 0),
> +	BANK_DS("TEST_N", GPIO_TEST_N,    GPIO_TEST_N,   7, 7,
> +		0x13,  0,  0x14,  0,  0x12, 0,  0x11,  0, 0x10, 0, 0x17, 0),
> +};
> +
> +static struct meson_pmx_bank a4_periphs_pmx_banks[] = {

I think that both struct meson_pmx_bank could be const.

> +	/* name  first  lask  reg  offset */
> +	BANK_PMX("E",  GPIOE_0,  GPIOE_1, 0x12,  0),
> +	BANK_PMX("D",  GPIOD_0, GPIOD_15, 0x10,  0),
> +	BANK_PMX("B",  GPIOB_0, GPIOB_13, 0x00,  0),
> +	BANK_PMX("X",  GPIOX_0, GPIOX_17, 0x03,  0),
> +	BANK_PMX("T",  GPIOT_0, GPIOT_22, 0x0b,  0),
> +};
> +
> +static struct meson_pmx_bank a4_aobus_pmx_banks[] = {
> +	BANK_PMX("AO", GPIOAO_0, GPIOAO_6, 0x00,  0),
> +	BANK_PMX("TEST_N", GPIO_TEST_N, GPIO_TEST_N, 0x0,  28),
> +};
> +
> +static struct meson_axg_pmx_data a4_periphs_pmx_banks_data = {

I think that both struct meson_axg_pmx_data could be const.

> +	.pmx_banks	= a4_periphs_pmx_banks,
> +	.num_pmx_banks	= ARRAY_SIZE(a4_periphs_pmx_banks),
> +};
> +
> +static struct meson_axg_pmx_data a4_aobus_pmx_banks_data = {
> +	.pmx_banks	= a4_aobus_pmx_banks,
> +	.num_pmx_banks	= ARRAY_SIZE(a4_aobus_pmx_banks),
> +};
> +
> +static struct meson_pinctrl_data a4_periphs_pinctrl_data = {

I think that both struct meson_pinctrl_data could be const.

> +	.name		= "periphs-banks",
> +	.pins		= a4_periphs_pins,
> +	.groups		= a4_periphs_groups,
> +	.funcs		= a4_periphs_functions,
> +	.banks		= a4_periphs_banks,
> +	.num_pins	= ARRAY_SIZE(a4_periphs_pins),
> +	.num_groups	= ARRAY_SIZE(a4_periphs_groups),
> +	.num_funcs	= ARRAY_SIZE(a4_periphs_functions),
> +	.num_banks	= ARRAY_SIZE(a4_periphs_banks),
> +	.pmx_ops	= &meson_axg_pmx_ops,
> +	.pmx_data	= &a4_periphs_pmx_banks_data,
> +	.parse_dt	= &meson_a1_parse_dt_extra,
> +};
> +
> +static struct meson_pinctrl_data a4_aobus_pinctrl_data = {
> +	.name		= "aobus-banks",
> +	.pins		= a4_aobus_pins,
> +	.groups		= a4_aobus_groups,
> +	.funcs		= a4_aobus_functions,
> +	.banks		= a4_aobus_banks,
> +	.num_pins	= ARRAY_SIZE(a4_aobus_pins),
> +	.num_groups	= ARRAY_SIZE(a4_aobus_groups),
> +	.num_funcs	= ARRAY_SIZE(a4_aobus_functions),
> +	.num_banks	= ARRAY_SIZE(a4_aobus_banks),
> +	.pmx_ops	= &meson_axg_pmx_ops,
> +	.pmx_data	= &a4_aobus_pmx_banks_data,
> +	.parse_dt	= &meson_a1_parse_dt_extra,
> +};
> +
> +static const struct of_device_id a4_pinctrl_dt_match[] = {
> +	{
> +		.compatible = "amlogic,a4-periphs-pinctrl",
> +		.data = &a4_periphs_pinctrl_data,
> +	},
> +	{
> +		.compatible = "amlogic,a4-aobus-pinctrl",
> +		.data = &a4_aobus_pinctrl_data,
> +	},
> +	{ },

Usually, there is no extra "," after a terinator item.

> +};
> +MODULE_DEVICE_TABLE(of, a4_pinctrl_dt_match);
> +
> +static struct platform_driver a4_pinctrl_driver = {
> +	.probe  = meson_pinctrl_probe,
> +	.driver = {
> +		.name	= "amlogic-a4-pinctrl",
> +		.of_match_table = a4_pinctrl_dt_match,
> +	},
> +};

...

CJ


