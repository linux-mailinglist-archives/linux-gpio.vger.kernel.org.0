Return-Path: <linux-gpio+bounces-19589-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1D2AA8BD8
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 07:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD9A93A489F
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 05:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C021581E1;
	Mon,  5 May 2025 05:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGpHkZLK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D348C191;
	Mon,  5 May 2025 05:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746424164; cv=none; b=WK4wLR4rfCjMmMpZ2kyFYaFLsV3AHFFMO4fDxv+XDEZfemuF1JhriCWwfleO3mu8nj1q7/vQPSJvXVAotRZb2WNxg8BeZERxKYAqoa+3uaJviN3WKlVx/kkyxLcXU5T34kytn/Rs/w+IFFy/v3HWamYuqJFS/TePt6X0SHpFobg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746424164; c=relaxed/simple;
	bh=+FgMjKYqhxS1cHdqrPa33yg8+8R5RcElOW2tGyI1Kx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BrQpFb0rjot/RxahoYrYwhKuY806wszVkb0t1kC08AGtIXNEtzZT2FD/JiByo9JGRSRUQDLVyTr3KKUtFvCyNmwuqTv12FS6FlJ6BsIjGMyYDFapLomt1HdDlUn4aX3SgwsKSQhW0Ba0wC5BlcQNrftJQbpmuyf0u2CJx7Z1kk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FGpHkZLK; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so4961453e87.2;
        Sun, 04 May 2025 22:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746424161; x=1747028961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F7qwbDp0f7k4ja2LqUiSR09Ld8+F7/LbnaIjm4GJKRE=;
        b=FGpHkZLKhAqeJiHr/IKiA6Zvwkj+NMAinXSm9OOXC9HgQksteUjJ6KEjZcYOWa5TsG
         QVNKVAWYuOPdNYHsv6GpQ5ylKXh7NTRablGzlrypU+/ey+Jy4QEAMLlVYFVteRNEAn9Q
         HEiyOgl/IPxRMsiOFnJJUvYK/8m70aGha7Go6TXEwDU6/zpEJbxIhbR2HdrDYfqHYHlF
         B3sxWaAMDTATXV9n/17XIOMOF0wfEp95LNG+BoBe3DQkohYJzY+FJ8CMKyaweFhHKLZ0
         +Xx/yfjAGOY8GW6aa2Z3giRH8pqEh/5Y5LwGV2oF/wHLt9hxh9AP02Cmtj25em1Xpur/
         sVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746424161; x=1747028961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F7qwbDp0f7k4ja2LqUiSR09Ld8+F7/LbnaIjm4GJKRE=;
        b=SrL3HfSv01y6OmO+1N75bVpAgdA4g+Bl7UmAyXvrcC/JLUi5hIlNXrwl4ZxLx2OSql
         eYCSSM5F4zA6KzOIXURoM3zEkYoU4Vt5COcTPrl4NqVI+tlahbUU0L3GoB2U2AC23Q7m
         /juam7ev9ZYjCURSnFZgxPAbdgEY3PGb0PNlBnkyBtN27tmDP0/bHn7czyCjKzPiAGC6
         Uv+yOca6F+j1CCySG/9vSh7Fgg3eK2MVupW9pUEfgEig/iOQQFRNcPZYktIe6GzzSbby
         hXuotF/WGrgF7axKLUpZpPxrkxur3f92VesvnaSor4WoMffhboqTXPeM5TsGMmzk5p0z
         dIdg==
X-Forwarded-Encrypted: i=1; AJvYcCWNADkf4D9BrowlUbn2mq16Cf65hnTxGXdFRlBcA4XipDxiMSKGWtQWdzMqSGpI6wEMQ/XDmcYXyb0q@vger.kernel.org, AJvYcCWUDfBM4KrgSCGRZ2uQks52ziun3NeWnVFoz0pbPlXNyHbJ6iXf4VIF2wLied/TkVSMHXGTGkW+AYUJwK+Z@vger.kernel.org
X-Gm-Message-State: AOJu0YwrQvQXKT8CXI1CKI3zfBvOO1FONCIYel4+6r5oui8UlA16E9bh
	aoms3V9B0vrp+zJ9ZfEkeVC3LDt3DFMvBL0XF+sQHSZ6qART9+Wr
X-Gm-Gg: ASbGncuzdcxlC10X4t1p6jih0F8JngRyM76mcTrfGmlOPCt+p3oMqPSCndGzUPtUUnU
	ovxC2vtTwYK3ZLH5MMntM8x21YWbB3Bl4MnttbOhSBll41vLa2UuS31FFIFd27m/ioyOgNT8FnR
	BcYUk7nMV7t+6T+oRnrdBtmaYjYLuZedWaaKAgAu1bH7lPiNDDLAh/a1tIJPdMmUUas5w/OVIge
	bt9XI5OuQ6zH5PsQjY3HyZIhb4g+/E2HbWiPRSfkYOX6Z5xZlGCOfbmEl5TFwfMcC/zSw5SewOu
	+xEpxuIkRwSfvEXuWaVM9PIt9s/0H5Jvj2HAgEpI7apOXOJRGMs71n///cIZhROG4hnQhRT4rTO
	VTs0St2mOjTfREl1oibUPnw==
X-Google-Smtp-Source: AGHT+IG7I2Hi0oKgaw7vLe5XbYTAnttjMnNVypSo9F6RxZlOGnQml/7g5P0McvNg69vLjDZWi8r9Ug==
X-Received: by 2002:a05:6512:33c3:b0:549:8fc0:bc2b with SMTP id 2adb3069b0e04-54fa4f8af6amr1321909e87.39.1746424160427;
        Sun, 04 May 2025 22:49:20 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f6a6esm1562650e87.240.2025.05.04.22.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 22:49:19 -0700 (PDT)
Message-ID: <5f66f797-a16c-4ab4-9bcf-589e4418e161@gmail.com>
Date: Mon, 5 May 2025 08:49:18 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] pinctrl: qcom: don't crash on enabling GPIO HOG pins
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Guenter Roeck
 <linux@roeck-us.net>, Josh Cartwright <joshc@codeaurora.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Doug Anderson <dianders@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
 <20250503-pinctrl-msm-fix-v1-1-da9b7f6408f4@oss.qualcomm.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250503-pinctrl-msm-fix-v1-1-da9b7f6408f4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/05/2025 08:32, Dmitry Baryshkov wrote:
> On Qualcomm platforms if the board uses GPIO hogs msm_pinmux_request()
> calls gpiochip_line_is_valid(). After commit 8015443e24e7 ("gpio: Hide
> valid_mask from direct assignments") gpiochip_line_is_valid() uses
> gc->gpiodev, which is NULL when GPIO hog pins are being processed.
> Thus after this commit using GPIO hogs causes the following crash. In
> order to fix this, verify that gpiochip->gpiodev is not NULL.
> 
> Note: it is not possible to reorder calls (e.g. by calling
> msm_gpio_init() before pinctrl registration or by splitting
> pinctrl_register() into _and_init() and pinctrl_enable() and calling the
> latter function after msm_gpio_init()) because GPIO chip registration
> would fail with EPROBE_DEFER if pinctrl is not enabled at the time of
> registration.
> 
> pc : gpiochip_line_is_valid+0x4/0x28
> lr : msm_pinmux_request+0x24/0x40
> sp : ffff8000808eb870
> x29: ffff8000808eb870 x28: 0000000000000000 x27: 0000000000000000
> x26: 0000000000000000 x25: ffff726240f9d040 x24: 0000000000000000
> x23: ffff7262438c0510 x22: 0000000000000080 x21: ffff726243ea7000
> x20: ffffab13f2c4e698 x19: 0000000000000080 x18: 00000000ffffffff
> x17: ffff726242ba6000 x16: 0000000000000100 x15: 0000000000000028
> x14: 0000000000000000 x13: 0000000000002948 x12: 0000000000000003
> x11: 0000000000000078 x10: 0000000000002948 x9 : ffffab13f50eb5e8
> x8 : 0000000003ecb21b x7 : 000000000000002d x6 : 0000000000000b68
> x5 : 0000007fffffffff x4 : ffffab13f52f84a8 x3 : ffff8000808eb804
> x2 : ffffab13f1de8190 x1 : 0000000000000080 x0 : 0000000000000000
> Call trace:
>   gpiochip_line_is_valid+0x4/0x28 (P)
>   pin_request+0x208/0x2c0
>   pinmux_enable_setting+0xa0/0x2e0
>   pinctrl_commit_state+0x150/0x26c
>   pinctrl_enable+0x6c/0x2a4
>   pinctrl_register+0x3c/0xb0
>   devm_pinctrl_register+0x58/0xa0
>   msm_pinctrl_probe+0x2a8/0x584
>   sdm845_pinctrl_probe+0x20/0x88
>   platform_probe+0x68/0xc0
>   really_probe+0xbc/0x298
>   __driver_probe_device+0x78/0x12c
>   driver_probe_device+0x3c/0x160
>   __device_attach_driver+0xb8/0x138
>   bus_for_each_drv+0x84/0xe0
>   __device_attach+0x9c/0x188
>   device_initial_probe+0x14/0x20
>   bus_probe_device+0xac/0xb0
>   deferred_probe_work_func+0x8c/0xc8
>   process_one_work+0x208/0x5e8
>   worker_thread+0x1b4/0x35c
>   kthread+0x144/0x220
>   ret_from_fork+0x10/0x20
> Code: b5fffba0 17fffff2 9432ec27 f9400400 (f9428800)
> 
> Fixes: 8015443e24e7 ("gpio: Hide valid_mask from direct assignments")
> Reported-by: Doug Anderson <dianders@chromium.org>
> Closes: https://lore.kernel.org/r/CAD=FV=Vg8_ZOLgLoC4WhFPzhVsxXFC19NrF38W6cW_W_3nFjbw@mail.gmail.com
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/pinctrl/qcom/pinctrl-msm.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 9ec15ae4a104cbeb9a7d819b964d341f3bba58ea..a99275f3c4a66a39f4d9318fe918101127ef4487 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -149,6 +149,13 @@ static int msm_pinmux_request(struct pinctrl_dev *pctldev, unsigned offset)
>   	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
>   	struct gpio_chip *chip = &pctrl->chip;
>   
> +	/*
> +	 * hog pins are requested before registering GPIO chip, don't crash in
> +	 * gpiochip_line_is_valid().
> +	 */
> +	if (!chip->gpiodev)
> +		return 0;
> +

This should fix the reported crash at hog registration. Still, I feel 
this is only papering over a real problem, which is the dependency from 
pinmux request to the gpiodev. As far as I can say, there is no 
mechanism ensuring the gpiochip is there, right? Even though this fixes 
the reported crash, it also causes all early pinmux requests to assume 
all the GPIOs are valid, right?

Also, I suppose there will be a time window at remove path when the 
pinctrl is still there - but gpio has already gone. (I didn't really 
dive into the dirty details of the pinctrl... Perhaps if this is somehow 
prevented?) Anyways, I'm not sure how valid it is to assume the 
gpiochip_line_is_valid() will work in such case?

Unfortunately, I don't have any better suggestion how to fix this. So, 
what little it is worth, I am Ok with applying this, at least as a fix 
for the crash!

>   	return gpiochip_line_is_valid(chip, offset) ? 0 : -EINVAL;
>   }

Yours,
	-- Matti


