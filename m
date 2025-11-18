Return-Path: <linux-gpio+bounces-28638-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7EFC67DDE
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 08:16:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A5B024E4AA5
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 07:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3924C2D9EDA;
	Tue, 18 Nov 2025 07:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hC2WWPzq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E058F2376FD;
	Tue, 18 Nov 2025 07:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763450139; cv=none; b=SYz01JodypbyI1xeinEuN3Phl3LaZRzvKm2vQ+fL2hmmf0/QC8iHI+X1gTwFBIIWHCAXGHQAW3BERW7nlYa7VaFgRVwYWjfrviGU2ea5WW7eYLKWijRohyvbISVukjbFEWEtFWZh7vOYwU7WGroJiwkLROjGojKQGRYSBl+KIAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763450139; c=relaxed/simple;
	bh=TaK3+GcRTl52fnu7JKjw5BH2tWLx49qhm29L81/A/YI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hiD33DkouBSH1cKViTNQ1xtIqxTo+O+SPWvKSSWsFNkFCsjFuMav3t0rygublmgzxsL8vjPOBEYWfLdEOZUs2sHN61mIkacFe/juvzjhB1kSQoHDNG/bFqF1lVXWWte8GVTj6uLDG6NnOeNWILty9fNqzej2WnNAK4/ZpgXizQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hC2WWPzq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66777C116D0;
	Tue, 18 Nov 2025 07:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763450138;
	bh=TaK3+GcRTl52fnu7JKjw5BH2tWLx49qhm29L81/A/YI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hC2WWPzqMpiSHch/Y3DfBs8rZpE+h7g+hX/IKqGfZjTEodRY4aEnnpKm924JEckmV
	 03BM+akCg3dKWXJM/TNCEpW10/OdPM4nxPxRlkZBjHgnSoGQJnTD/gyw7MSAO6yt0f
	 iOp8Ix1vhoZRnYI2/ajHCak6eaPEBtG/r11wFAvA00gajdEOzx16w5VEcgee/oivVt
	 OdhHQ6XWEmFg6VO23MRuvV4YXkRkryoWX+kdBLg0ZKwNjNqvxD9NSXxyGrJEl/lmri
	 H3UaLUt3KIZyNAx/AYtwYHNABaZIouvfatQRBZF5LLo6+yy7Mx/mEwsaW//xAk8Rll
	 bTrXwj/FqNwUA==
Message-ID: <41ea5cef-e083-4a30-89a5-7aed7a6d4d6d@kernel.org>
Date: Tue, 18 Nov 2025 08:15:34 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: add aw91xxx driver
To: 429368636@qq.com, lee@kernel.org
Cc: pavel@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-gpio@vger.kernel.org, zhangxinyu <gavin.zhang@faiot.com>
References: <tencent_1B2BC712D34FBE7DEB01320E665BEB2D8908@qq.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <tencent_1B2BC712D34FBE7DEB01320E665BEB2D8908@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/11/2025 10:35, 429368636@qq.com wrote:
> From: zhangxinyu <gavin.zhang@faiot.com>
> 
> This commit adds support for AWINIC AW91XXX 6-channel LED driver.
> The chip supports 6 PWM channels and is controlled with I2C.
> 
> Signed-off-by: zhangxinyu <429368636@qq.com>

Mixed up SoB.

> ---
>  drivers/leds/Kconfig        |   11 +



...

> +
> +	if (aw91xxx->matrix_key_enable) {
> +		/* key init */
> +		ret = aw91xxx_key_feature_init(aw91xxx);
> +		if (ret) {
> +			dev_err(aw91xxx->dev, "aw91xxx key feature init failed \r\n");
> +			goto err_free_rst;
> +		}
> +	}
> +
> +	if (aw91xxx->led_feature_enable) {
> +		ret = aw91xxx_parse_led_cdev(aw91xxx, np);
> +		if (ret < 0) {
> +			dev_err(&i2c->dev, "%s error creating led class dev\n", __func__);
> +			goto free_key;
> +		}
> +	}
> +
> +	if (aw91xxx->gpio_feature_enable) {
> +		/* gpio init */
> +		ret = aw91xxx_gpio_feature_init(aw91xxx);
> +		if (ret) {
> +			dev_err(aw91xxx->dev, "aw91xxx gpio feature init failed \r\n");
> +			goto free_key;
> +		}
> +	}
> +	aw91xxx->screen_state = true;
> +
> +	pr_err("%s probe completed successfully!\n", __func__);

No, drop.

> +
> +	return 0;
> +
> +free_key:
> +	aw91xxx_key_free_all_resource(aw91xxx);
> +err_free_rst:
> +	gpio_free(aw91xxx->reset_gpio);
> +err:
> +	devm_kfree(&i2c->dev, aw91xxx);

What?

> +	return ret;
> +}



> +
> +static const struct of_device_id aw91xxx_dt_match[] = {
> +	{ .compatible = "awinic,aw91xxx_led" },

Undocumented ABI.

> +	{ },
> +};
> +
> +static struct i2c_driver aw91xxx_i2c_driver = {
> +	.driver = {
> +		.name = AW91XXX_I2C_NAME,
> +		.owner = THIS_MODULE,

So you upstream us 12 year old code, with same issues, same bugs like
above and below:

> +		.of_match_table = of_match_ptr(aw91xxx_dt_match),

Here with warning...

You should start by taking a recently reviewed driver as base.

> +	},
> +	.probe = aw91xxx_i2c_probe,
> +	.remove = aw91xxx_i2c_remove,
> +	.id_table = aw91xxx_i2c_id,
> +};
> +
> +static int __init aw91xxx_i2c_init(void)
> +{
> +	int ret = 0;
> +
> +	pr_err("aw91xxx driver version %s\n", AW91XXX_DRIVER_VERSION);

There are no versions of drivers. Don't add it.

> +
> +	ret = i2c_add_driver(&aw91xxx_i2c_driver);
> +	if (ret) {
> +		pr_err("fail to add aw91xxx device into i2c\n");
> +		return ret;
> +	}

No, drop such stuff. Just module_i2c_driver.

> +
> +	return 0;
> +}
> +module_init(aw91xxx_i2c_init);
> +
> +static void __exit aw91xxx_i2c_exit(void)
> +{
> +	i2c_del_driver(&aw91xxx_i2c_driver);
> +}
> +module_exit(aw91xxx_i2c_exit);
> +
> +
> +MODULE_DESCRIPTION("AW91XXX LED Driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/leds/leds-aw91xxx.h b/drivers/leds/leds-aw91xxx.h
> new file mode 100644
> index 000000000000..d69c2334ffe0
> --- /dev/null
> +++ b/drivers/leds/leds-aw91xxx.h
> @@ -0,0 +1,128 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef _AW91XXX_H_
> +#define _AW91XXX_H_
> +
> +#define AWINIC_DEBUG		1
> +
> +#ifdef AWINIC_DEBUG
> +#define AW_DEBUG(fmt, args...)	pr_info(fmt, ##args)
> +#else
> +#define AW_DEBUG(fmt, ...)
> +
> +#endif
> +
> +#define MAX_I2C_BUFFER_SIZE 65536
> +
> +#define AW91XXX_ID 0x23
> +#define AW91XXX_KEY_PORT_MAX (0x10) /* 16 */
> +#define AW91XXX_INT_MASK (0xFFFF)
> +
> +enum AW91XXX_FADE_TIME {
> +	AW91XXX_FADE_TIME_0000MS = 0x00,
> +	AW91XXX_FADE_TIME_0315MS = 0X01,
> +	AW91XXX_FADE_TIME_0630MS = 0x02,
> +	AW91XXX_FADE_TIME_1260MS = 0x03,
> +	AW91XXX_FADE_TIME_2520MS = 0x04,
> +	AW91XXX_FADE_TIME_5040MS = 0x05
> +};
> +
> +enum aw91xxx_gpio_dir {
> +	AW91XXX_GPIO_INPUT = 0,
> +	AW91XXX_GPIO_OUTPUT = 1,
> +};
> +
> +enum aw91xxx_gpio_val {
> +	AW91XXX_GPIO_HIGH = 1,
> +	AW91XXX_GPIO_LOW = 0,
> +};
> +
> +enum aw91xxx_gpio_output_mode {
> +	AW91XXX_OPEN_DRAIN_OUTPUT = 0,
> +	AW91XXX_PUSH_PULL_OUTPUT = 1,
> +};
> +
> +struct aw91xxx_singel_gpio {
> +	unsigned int gpio_idx;
> +	enum aw91xxx_gpio_dir gpio_direction;
> +	enum aw91xxx_gpio_val state;
> +	struct aw91xxx *priv;
> +};
> +
> +struct aw91xxx_gpio {
> +	unsigned int gpio_mask;
> +	unsigned int gpio_num;
> +	enum aw91xxx_gpio_output_mode output_mode;
> +	struct aw91xxx_singel_gpio *single_gpio_data;
> +};
> +
> +typedef struct {
> +	char name[10];
> +	int key_code;
> +	int key_val;
> +} KEY_STATE;
> +
> +unsigned int aw91xxx_separate_key_data[AW91XXX_KEY_PORT_MAX] = {
> +/*      0    1    2    3 */
> +	1,   2,   3,   4,
> +	5,   6,   7,   8,
> +	9,   10,  11,  12,
> +	13,  14,  15,  16
> +};
> +
> +struct aw91xxx_key {
> +	unsigned int key_mask;
> +	unsigned int input_port_nums;
> +	unsigned int output_port_nums;
> +	unsigned int input_port_mask;
> +	unsigned int output_port_mask;
> +	unsigned int new_input_state;
> +	unsigned int old_input_state;
> +	unsigned int *new_output_state;
> +	unsigned int *old_output_state;
> +	unsigned int *def_output_state;
> +	bool wake_up_enable;
> +	struct input_dev *input;
> +
> +	unsigned int debounce_delay;
> +	struct delayed_work int_work;
> +	struct hrtimer key_timer;
> +	struct work_struct key_work;
> +	KEY_STATE *keymap;
> +	int keymap_len;
> +	struct aw91xxx *priv;
> +};
> +
> +struct aw91xxx {
> +	struct i2c_client *i2c;
> +	struct device *dev;
> +	struct led_classdev cdev;
> +	struct work_struct brightness_work;
> +	struct delayed_work int_work;
> +
> +	int reset_gpio;
> +	int irq_gpio;
> +	int irq_num;
> +
> +	unsigned char chipid;
> +	unsigned char vendor_id;
> +	unsigned char blink;
> +
> +	int imax;
> +	int rise_time;
> +	int on_time;
> +	int fall_time;
> +	int off_time;
> +
> +	bool led_feature_enable;
> +	bool gpio_feature_enable;
> +	bool matrix_key_enable;
> +	bool single_key_enable;
> +	bool screen_state;
> +
> +	struct aw91xxx_gpio *gpio_data;
> +	struct aw91xxx_key *key_data;
> +};
> +
> +
> +#endif
> +


Best regards,
Krzysztof

