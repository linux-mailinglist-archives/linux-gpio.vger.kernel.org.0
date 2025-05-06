Return-Path: <linux-gpio+bounces-19699-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 174C3AACC34
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 19:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 147C71C07BB4
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 17:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D8E3284B2A;
	Tue,  6 May 2025 17:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VbOdnteZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73954227574
	for <linux-gpio@vger.kernel.org>; Tue,  6 May 2025 17:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746552495; cv=none; b=uAYfe3nUplc1nnkVSNiwT7Z9zyX+dWtHGT61jcbzJLrXaeANSezDkqNqmUiCLcgM7+KFhG+PXJbod0ej15qqNL2KwJesXC4qEHVAjTAeRIhitKiztY/90odghbY+QUSti1546lguzTKXP+fuHvMBfA7QAVzTclyRVCZnvQ6nhes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746552495; c=relaxed/simple;
	bh=jnnYN3kbrZDz/R+9FtFmAiIQLTBC/H1JHKyfCk46ZWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RtiMflGByFLeYg7ZrHQ7O7yihoXvTz8xmZOnCQpM95xiI6I7min2/jLVwXlkwv9j25bYhjx/M9UDjxZE5GagCeU4dwzQrN4KYQD0PpYtD88mPKqDzw+wGeUWk74VM7QjtuYV+7I3XN6tbsyaTOnwIXQ2f6feeFZX/SDpG4UCaX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VbOdnteZ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-acb5ec407b1so1058878266b.1
        for <linux-gpio@vger.kernel.org>; Tue, 06 May 2025 10:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746552492; x=1747157292; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=grXy49nE1iJUPXKhEEBd+iUH9oxUUGc1jM22YoCJ94M=;
        b=VbOdnteZzTGFiiJyf7EJqBUqk/pDrimIS7Htjm0qmRcZg+ioxb1uqumEqzdC0qli8S
         hAG20boCT0mQknLw4RkWzBnGwn7M19I6mmdZcI5DTv8Amvp0BiqBfIUmANqf8wwc6Wpc
         DraGQG4TQilnZXsRXjwYwkw4KaRKhqkZW+vrm/SvDSLGJPa+Bk7HIxKT0FY8eOUv7zfv
         rgBCRbQfNCDXf0sVgXzH1Or0gfiufcXplTkftXLE/eLkNlxQ/s3NPv7aBYtJwzTAdbOU
         wYjCDUCdK/jyiTswPiwxutaVPVnugakmJQotEUVMilNX3E5AQlTGNJJ0X+i68a4B7Q7X
         TQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746552492; x=1747157292;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=grXy49nE1iJUPXKhEEBd+iUH9oxUUGc1jM22YoCJ94M=;
        b=BJwb0l5Ybw8e5/IrM+LAbX9SveWKYWn0HmVhxPRePAVTo0RMtL67i2VWO+ud7C8aow
         h+p57prJQjdUYaOqhEP6ttn8J0dKiaAcMYvyfqOFDV08cQ5Iit0QS+/qgY71OcpJjeNu
         oz5TzeF1AwWyfoFPjrL2y4K5xJwsji7q3v8vYmC13JhYNzQcgI/qFXda16HbMyH8Fe+L
         Z8ZiR5cgnCqgCXh1dkI4Fw4Qj//MgGB3XhCY3qyuk0HBGVJ0lj1a6v58XEj1GJN4WRLz
         9DfqOwtFIrBfJURVBKk3cV8HR62rxwF5/yBvEt6JHn/uXCkRQw0hrOi/67Q1ChJxVR4x
         6Z0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmBWiOWbHHgirJPUL1aSTlMK2UT/fpmOT+5G4YcLZYi1VpJocBgTeHqBiNZVWIfnTK1STTFs4KrB8g@vger.kernel.org
X-Gm-Message-State: AOJu0YzNNA4molg5oSeutbZ82Ow/AKZs7rQkJv8F9rkWZWp2RHOzM+b+
	4QI/4HlFjYItfvzXUzGtWH0tFlfhXbmAsFlwAva++TEHBNLaCHZ+XdBSeW6sD8REQVut1ToFXqk
	nzZ6eb4lnhFpYAKK10q3kL0cxuWjkvkqBvQcyIg==
X-Gm-Gg: ASbGncs4oZTh3p/Q0SGbbaxOV0nEbFaocGkFPZaeiPlXiTvBPb/s+ZQ4BE8qb3NKWHg
	qGsIDVHrHYZBRsawR+aTe7pJxmImMq/dFq2C6SRinzZFWVDo2mG8bOodaeGO5N4nMxlpMgf7oJl
	lB8F0d7fplNZ1HoKoas3LWL5MASHyBoBn35xnQWmyOnJSycA6pNS8elA==
X-Google-Smtp-Source: AGHT+IH61rER+jFaiIMyOhqOEUN8cALas+FRcUonmSs8Vu5Kdp86RSl4BnRw/SiVr0jad8d0Ju9qzSTzny2sUIMnvOs=
X-Received: by 2002:a17:907:7207:b0:abf:4da0:28e3 with SMTP id
 a640c23a62f3a-ad1e8c50735mr32187466b.18.1746552491747; Tue, 06 May 2025
 10:28:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com> <20250503-pinctrl-msm-fix-v1-1-da9b7f6408f4@oss.qualcomm.com>
In-Reply-To: <20250503-pinctrl-msm-fix-v1-1-da9b7f6408f4@oss.qualcomm.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 6 May 2025 19:28:00 +0200
X-Gm-Features: ATxdqUEJCS-layHQflUTslWJjo7dTQpNOzT3ZmPo75mYuoogCm-sg4h65dFuYco
Message-ID: <CACMJSesqtkorg1akuXjMa9U1fe60aDhfGOSB_T6mX5CtCYDwtg@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: qcom: don't crash on enabling GPIO HOG pins
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Guenter Roeck <linux@roeck-us.net>, Josh Cartwright <joshc@codeaurora.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Doug Anderson <dianders@chromium.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 3 May 2025 at 07:32, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
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
>  gpiochip_line_is_valid+0x4/0x28 (P)
>  pin_request+0x208/0x2c0
>  pinmux_enable_setting+0xa0/0x2e0
>  pinctrl_commit_state+0x150/0x26c
>  pinctrl_enable+0x6c/0x2a4
>  pinctrl_register+0x3c/0xb0
>  devm_pinctrl_register+0x58/0xa0
>  msm_pinctrl_probe+0x2a8/0x584
>  sdm845_pinctrl_probe+0x20/0x88
>  platform_probe+0x68/0xc0
>  really_probe+0xbc/0x298
>  __driver_probe_device+0x78/0x12c
>  driver_probe_device+0x3c/0x160
>  __device_attach_driver+0xb8/0x138
>  bus_for_each_drv+0x84/0xe0
>  __device_attach+0x9c/0x188
>  device_initial_probe+0x14/0x20
>  bus_probe_device+0xac/0xb0
>  deferred_probe_work_func+0x8c/0xc8
>  process_one_work+0x208/0x5e8
>  worker_thread+0x1b4/0x35c
>  kthread+0x144/0x220
>  ret_from_fork+0x10/0x20
> Code: b5fffba0 17fffff2 9432ec27 f9400400 (f9428800)
>
> Fixes: 8015443e24e7 ("gpio: Hide valid_mask from direct assignments")
> Reported-by: Doug Anderson <dianders@chromium.org>
> Closes: https://lore.kernel.org/r/CAD=FV=Vg8_ZOLgLoC4WhFPzhVsxXFC19NrF38W6cW_W_3nFjbw@mail.gmail.com
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 9ec15ae4a104cbeb9a7d819b964d341f3bba58ea..a99275f3c4a66a39f4d9318fe918101127ef4487 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -149,6 +149,13 @@ static int msm_pinmux_request(struct pinctrl_dev *pctldev, unsigned offset)
>         struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
>         struct gpio_chip *chip = &pctrl->chip;
>
> +       /*
> +        * hog pins are requested before registering GPIO chip, don't crash in
> +        * gpiochip_line_is_valid().
> +        */
> +       if (!chip->gpiodev)
> +               return 0;
> +

I really dislike you dereferencing gpiodev here which is (implicitly,
I know...) very much a private structure for GPIOLIB. Can we move this
into gpiochip_line_is_valid() itself?

Treewide there's only one driver (under drivers/pinctrl/) that
accesses gc->gpiodev and I would love to fix that as well and have
nobody dereference this.

Bart

>         return gpiochip_line_is_valid(chip, offset) ? 0 : -EINVAL;
>  }
>
>
> --
> 2.39.5
>

