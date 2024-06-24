Return-Path: <linux-gpio+bounces-7659-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BBC91591C
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 23:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CC041C22501
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 21:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2CA1A0AF2;
	Mon, 24 Jun 2024 21:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vXEP8cIh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1947A1A0AE1
	for <linux-gpio@vger.kernel.org>; Mon, 24 Jun 2024 21:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719264980; cv=none; b=cUOJvAI7ThzstyYL/sISptivS6+O8nNqqAOFI1T8F6VexS+RL4knwmgQj0VCgI90tjDOVgJhLcWLeRBHo5Etun+eeIiHYpD+eRwMElqgzDG5VuHU1eDQj43lHXrbzMAXLveZRTYZbqn5Hy4x7k46hjcpekXF2EV6KRCm9TgeE+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719264980; c=relaxed/simple;
	bh=gr0fn3ly5YlCf0sPq6whIbS+AGRd0PdQpxgdyN33ZbA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sS5Dr2GU+56+aeaDB5mugOODyeqbHrcaWqw7YhTN/dJLrC551sT++aVc/JFW09a6RQSVI1RaKe+H7uiUTgsmveaVBABch2R1JpdSEO2oepXz0nEfs2p80k065ACMxyD+oHU9s767tPRX5rR1yQqy686an6b0HAPD62lfD5KHhfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vXEP8cIh; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-48f43733194so918544137.2
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jun 2024 14:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719264978; x=1719869778; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xKq29T9GzFzk14rirSzhrbJdI0z6ZTXvSPHWL0fuZH0=;
        b=vXEP8cIhZsqBTAvNIONAcrJGLtv9pK5vVFhV7T61YlHEcZTLiEZ7M5lxSqLyw2PvBf
         rdUZKJWdreL6kGjmOh9FQVRlvwzDMA8iRHOyaY2Z86sZhju+/wAGx3Nzj5yxd85Mwgs5
         kSqcpe3rhYknMbF1+FQjh4N7wF3BhDmc3qUPvZqXjoU683ovuvbwo7YaywE9jR94xSof
         fGuQCCdO2REUCr5RJSmIqNKoEtbhIl5ppLKdlMJ3cYoCCVP0pkvmJ4XcDgoEq3nL263T
         KFPlUfGldRGyQDhegxWPftmmFnRbjkoVouyV/BZZ3SBpr5XJrYb18k8ksWQSf2IrkwAh
         vE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719264978; x=1719869778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKq29T9GzFzk14rirSzhrbJdI0z6ZTXvSPHWL0fuZH0=;
        b=STN9SSkYkIrC4mR26XtVpI+Kj32I62ht7eZE8UZfVDiZZKzqfoVURlBW61GRq4/1Bh
         xsFTTiB5rWQtZGWvkhsLNS0l18HH64Bt1NnktahHqTAFYynd1ZXpWMpDT8prNlAVlDPE
         Huj9aU+D/+mOK5zGVhXJ7cd17TdDkMZ8RvSV9Z84JW24pstOyiVG0kIJ9sCQQO1AMEeG
         T6Ds2NoFVMJXH320KoIS3Pevnt051sKQ/hGIa3PPBD+QRN87MBWtrcPqGYbnbdq9Ldys
         Y/216bKr/y7zLQ7pPq8sduTSVz3TDdgzpS+YNuUKOQ25B3Dyv/mY9Ev10ZXPC1JfwmET
         WbPA==
X-Forwarded-Encrypted: i=1; AJvYcCWCrz6UrMnG8CeBI2jgMkchc2CMU52oekXoex089vlHYKJsV0nYI8EfPHDzIuzmeDwxTqNHiBN2UKoSJG/wVYGTlmp0vcBKT+W2NQ==
X-Gm-Message-State: AOJu0Yw6YPum55NclcZU6yei8VBiovLGirXHr4oFwf2laaUB80TeO0rF
	YDug0lVA9Q3xivOvAW6Jh3KxayL5+8SL0VsrpzcTsby47XJ7TMdoIG9cT5KXG01nhlNx1mEom1J
	sEibE8SkFo+icNJv7DL3Iig2bfmrrKxI8/+Wgvg==
X-Google-Smtp-Source: AGHT+IHDbAm/AEof88fnWBqJ3pSHQTc4fkKO/4dtiaiSTKiB81NDfTn/ep2HTRXzpz93dGP4RpuBdkpiEmJm3pqGyQ0=
X-Received: by 2002:a05:6102:2276:b0:48f:392a:f891 with SMTP id
 ada2fe7eead31-48f4c0dcd51mr5580751137.21.1719264977853; Mon, 24 Jun 2024
 14:36:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240612-sm4250-lpi-v4-0-a0342e47e21b@linaro.org> <20240612-sm4250-lpi-v4-2-a0342e47e21b@linaro.org>
In-Reply-To: <20240612-sm4250-lpi-v4-2-a0342e47e21b@linaro.org>
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 24 Jun 2024 22:36:07 +0100
Message-ID: <CANgGJDqJZ-qUB4XOTEhRQrzim_-ecf6evbM=zz4SiEKMSBObzQ@mail.gmail.com>
Subject: Re: [PATCH v2 v4 2/2] pinctrl: qcom: Introduce SM4250 LPI pinctrl driver
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Srini,

On Sat, 22 Jun 2024 at 17:49, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> Add support for the pin controller block on SM4250 Low Power Island.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/pinctrl/qcom/Kconfig                    |   9 +
>  drivers/pinctrl/qcom/Makefile                   |   1 +
>  drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c | 236 ++++++++++++++++++++++++
>  3 files changed, 246 insertions(+)
>
> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
> index 24619e80b2cc..dd9bbe8f3e11 100644
> --- a/drivers/pinctrl/qcom/Kconfig
> +++ b/drivers/pinctrl/qcom/Kconfig
> @@ -68,6 +68,15 @@ config PINCTRL_SC7280_LPASS_LPI
>           Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
>           (Low Power Island) found on the Qualcomm Technologies Inc SC7280 platform.
>
> +config PINCTRL_SM4250_LPASS_LPI
> +       tristate "Qualcomm Technologies Inc SM4250 LPASS LPI pin controller driver"
> +       depends on ARM64 || COMPILE_TEST
> +       depends on PINCTRL_LPASS_LPI
> +       help
> +         This is the pinctrl, pinmux, pinconf and gpiolib driver for the
> +         Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
> +         (Low Power Island) found on the Qualcomm Technologies Inc SM4250 platform.
> +
>  config PINCTRL_SM6115_LPASS_LPI
>         tristate "Qualcomm Technologies Inc SM6115 LPASS LPI pin controller driver"
>         depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
> index e2e76071d268..eb04297b6388 100644
> --- a/drivers/pinctrl/qcom/Makefile
> +++ b/drivers/pinctrl/qcom/Makefile
> @@ -43,6 +43,7 @@ obj-$(CONFIG_PINCTRL_SDM845) += pinctrl-sdm845.o
>  obj-$(CONFIG_PINCTRL_SDX55) += pinctrl-sdx55.o
>  obj-$(CONFIG_PINCTRL_SDX65) += pinctrl-sdx65.o
>  obj-$(CONFIG_PINCTRL_SDX75) += pinctrl-sdx75.o
> +obj-$(CONFIG_PINCTRL_SM4250_LPASS_LPI) += pinctrl-sm4250-lpass-lpi.o
>  obj-$(CONFIG_PINCTRL_SM4450) += pinctrl-sm4450.o
>  obj-$(CONFIG_PINCTRL_SM6115) += pinctrl-sm6115.o
>  obj-$(CONFIG_PINCTRL_SM6115_LPASS_LPI) += pinctrl-sm6115-lpass-lpi.o
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c
> new file mode 100644
> index 000000000000..2d2c636a3e20
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c
> @@ -0,0 +1,236 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2016-2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2020, 2023 Linaro Ltd.
> + */
> +
> +#include <linux/gpio/driver.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#include "pinctrl-lpass-lpi.h"
> +
> +enum lpass_lpi_functions {
> +       LPI_MUX_dmic01_clk,
> +       LPI_MUX_dmic01_data,
> +       LPI_MUX_dmic23_clk,
> +       LPI_MUX_dmic23_data,
> +       LPI_MUX_dmic4_clk,
> +       LPI_MUX_dmic4_data,
> +       LPI_MUX_ext_mclk0_a,
> +       LPI_MUX_ext_mclk0_b,
> +       LPI_MUX_ext_mclk1_a,
> +       LPI_MUX_ext_mclk1_b,
> +       LPI_MUX_ext_mclk1_c,
> +       LPI_MUX_i2s1_clk,
> +       LPI_MUX_i2s1_data,
> +       LPI_MUX_i2s1_ws,
> +       LPI_MUX_i2s2_clk,
> +       LPI_MUX_i2s2_data,
> +       LPI_MUX_i2s2_ws,
> +       LPI_MUX_i2s3_clk,
> +       LPI_MUX_i2s3_data,
> +       LPI_MUX_i2s3_ws,
> +       LPI_MUX_qup_io_00,
> +       LPI_MUX_qup_io_01,
> +       LPI_MUX_qup_io_05,
> +       LPI_MUX_qup_io_10,
> +       LPI_MUX_qup_io_11,
> +       LPI_MUX_qup_io_25,
> +       LPI_MUX_qup_io_21,
> +       LPI_MUX_qup_io_26,
> +       LPI_MUX_qup_io_31,
> +       LPI_MUX_qup_io_36,
> +       LPI_MUX_qua_mi2s_data,
> +       LPI_MUX_qua_mi2s_sclk,
> +       LPI_MUX_qua_mi2s_ws,
> +       LPI_MUX_slim_clk,
> +       LPI_MUX_slim_data,
> +       LPI_MUX_sync_out,
> +       LPI_MUX_swr_rx_clk,
> +       LPI_MUX_swr_rx_data,
> +       LPI_MUX_swr_tx_clk,
> +       LPI_MUX_swr_tx_data,
> +       LPI_MUX_swr_wsa_clk,
> +       LPI_MUX_swr_wsa_data,
> +       LPI_MUX_gpio,
> +       LPI_MUX__,
> +};
> +
> +static const struct pinctrl_pin_desc sm4250_lpi_pins[] = {
> +       PINCTRL_PIN(0, "gpio0"),
> +       PINCTRL_PIN(1, "gpio1"),
> +       PINCTRL_PIN(2, "gpio2"),
> +       PINCTRL_PIN(3, "gpio3"),
> +       PINCTRL_PIN(4, "gpio4"),
> +       PINCTRL_PIN(5, "gpio5"),
> +       PINCTRL_PIN(6, "gpio6"),
> +       PINCTRL_PIN(7, "gpio7"),
> +       PINCTRL_PIN(8, "gpio8"),
> +       PINCTRL_PIN(9, "gpio9"),
> +       PINCTRL_PIN(10, "gpio10"),
> +       PINCTRL_PIN(11, "gpio11"),
> +       PINCTRL_PIN(12, "gpio12"),
> +       PINCTRL_PIN(13, "gpio13"),
> +       PINCTRL_PIN(14, "gpio14"),
> +       PINCTRL_PIN(15, "gpio15"),
> +       PINCTRL_PIN(16, "gpio16"),
> +       PINCTRL_PIN(17, "gpio17"),
> +       PINCTRL_PIN(18, "gpio18"),
> +       PINCTRL_PIN(19, "gpio19"),
> +       PINCTRL_PIN(20, "gpio20"),
> +       PINCTRL_PIN(21, "gpio21"),
> +       PINCTRL_PIN(22, "gpio22"),
> +       PINCTRL_PIN(23, "gpio23"),
> +       PINCTRL_PIN(24, "gpio24"),
> +       PINCTRL_PIN(25, "gpio25"),
> +       PINCTRL_PIN(26, "gpio26"),
> +};

This doesn't probe() on qrb4210 RB2 for me with the following trace:

[   10.709014] ------------[ cut here ]------------
[   10.719085] WARNING: CPU: 1 PID: 56 at
drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:446
lpi_pinctrl_probe+0x308/0x388 [pinctrl_lpass_lpi]
[   10.719108] Modules linked in: btqca qrtr btbcm qcom_q6v5_pas
libarc4 qcom_pil_info llcc_qcom bluetooth snd_soc_sm8250 ocmem
qcom_q6v5 snd_soc_qcom_sdw cfg80211 drm_exec qcom_sysmon
snd_soc_qcom_common gpu_sched crct10dif_ce qcom_common soundwire_bus
ecdh_generic qcom_glink_smem pinctrl_sm4250_lpass_lpi qcom_pmic_tcpm
drm_dp_aux_bus ecc mdt_loader qcom_wdt pinctrl_lpass_lpi
drm_display_helper qmi_helpers tcpm dispcc_sm6115 rfkill gpucc_sm6115
aux_hpd_bridge qcom_usb_vbus_regulator nvmem_qcom_spmi_sdam
qcom_spmi_temp_alarm qcom_pbs qcom_pon qcom_spmi_adc5 qcom_vadc_common
spi_geni_qcom gpi qcom_stats icc_bwmon qcom_rng qcrypto authenc
phy_qcom_qmp_usbc display_connector rpmsg_ctrl libdes typec rpmsg_char
phy_qcom_qusb2 drm_kms_helper rmtfs_mem socinfo i2c_gpio fuse drm
backlight dm_mod ip_tables x_tables ipv6
[   10.719238] CPU: 1 PID: 56 Comm: kworker/u33:0 Not tainted
6.10.0-rc2-00012-ge45ddb1f8d34-dirty #7
[   10.719245] Hardware name: Qualcomm Technologies, Inc. QRB4210 RB2 (DT)
[   10.719250] Workqueue: events_unbound deferred_probe_work_func
[   10.719265] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   10.719271] pc : lpi_pinctrl_probe+0x308/0x388 [pinctrl_lpass_lpi]
[   10.719278] lr : lpi_pinctrl_probe+0x44/0x388 [pinctrl_lpass_lpi]
[   10.719284] sp : ffff80008035bb40
[   10.719286] x29: ffff80008035bb40 x28: 0000000000000000 x27: 0000000000000000
[   10.719294] x26: ffff7eea83029428 x25: ffffa0c480a67510 x24: ffff7eea83be5800
[   10.719301] x23: ffff7eea83be5810 x22: 0000000000000000 x21: ffffa0c480a64030
[   10.719308] x20: ffff7eea83be5810 x19: ffff7eea89e59880 x18: ffffffffffffffff
[   10.719315] x17: 0000000000000000 x16: ffffa0c4f34949a4 x15: ffff80008035b7f0
[   10.719321] x14: ffffffffffffffff x13: 006c7274636e6970 x12: 2e30303030633761
[   10.719329] x11: 0101010101010101 x10: ffffa0c4f4b28ff2 x9 : 0000000000000008
[   10.719335] x8 : 0000000000000008 x7 : ffffa0c4f3cfa640 x6 : 0000000000000020
[   10.719342] x5 : 0000000000000020 x4 : 0000000000000000 x3 : ffffa0c480a67448
[   10.719348] x2 : ffffa0c480a67468 x1 : ffff7eea838b8000 x0 : 000000000000001b
[   10.719357] Call trace:
[   10.719361]  lpi_pinctrl_probe+0x308/0x388 [pinctrl_lpass_lpi]
[   10.719369]  platform_probe+0x68/0xc4
[   10.719378]  really_probe+0xbc/0x29c
[   10.719384]  __driver_probe_device+0x78/0x12c
[   10.719390]  driver_probe_device+0xd8/0x15c
[   10.719395]  __device_attach_driver+0xb8/0x134
[   10.719401]  bus_for_each_drv+0x88/0xe8
[   10.719407]  __device_attach+0xa0/0x190
[   10.719412]  device_initial_probe+0x14/0x20
[   10.719418]  bus_probe_device+0xac/0xb0
[   10.719423]  deferred_probe_work_func+0x88/0xc0
[   10.719429]  process_one_work+0x150/0x294
[   10.719439]  worker_thread+0x2f8/0x408
[   10.719445]  kthread+0x110/0x114
[   10.719452]  ret_from_fork+0x10/0x20
[   10.719459] ---[ end trace 0000000000000000 ]---
[   10.719589] qcom-sm4250-lpass-lpi-pinctrl a7c0000.pinctrl: probe
with driver qcom-sm4250-lpass-lpi-pinctrl failed with error -22


[...]

Thanks,
Alexey

