Return-Path: <linux-gpio+bounces-28715-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CE5C6C088
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 00:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 6873629F97
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 23:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF0B30DEB5;
	Tue, 18 Nov 2025 23:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ulakKRtR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7D1303A3B
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 23:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763509392; cv=none; b=TXQwls435GrGXDkxZK1VQoXoX8tJ7nZUmS8a+uls3E90IKVf5RILcZFF1rcj7xuZoLf/4BkphmpEInGE1oR5/L3F6rZrnORQhLxVGA0uqSF9DcoeM2soNsOem46A2PW1wIpAkUhYZpb/XsPPN/GhxPNDS7wIBLnoav7K8M/cL94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763509392; c=relaxed/simple;
	bh=FclszNLaFElOx8zaqeysOTPRKtXcWr3jA8rA+SKDmD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tIgyUj8+zzWSCt4NjjP+KhfiEQnA+wr4bDWPT6eLV+T4jLQJgPolS9aoE5rhgdqtRHqsWF/XsVBvKn/qvtahl4E/TbS8cO6y3wdogizlffoPTegb0pLiOKxrlqSNBxCjXB2E5HOPf3Ve8/oA+plBuhWVLPKuj8IkPbbFHXntRNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ulakKRtR; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-640f2c9cc72so4508200d50.3
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 15:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763509388; x=1764114188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOvEz1Vkfey9HagluRBMMIXQdIKTx7ENVL/+GZqZp08=;
        b=ulakKRtRgwwdQAaIgk1dowKL9ncLIvgX4tNYaR7DZnz93wK8HSEkub8cqlLhrYizqn
         IZrXklFmPgPZo7yiVs5LIs5QgJbazGm379bQpC3fQIBCuaB0+R8DSgpveiG+UGpSPpuv
         S6aJJVtE2yNBlEyiTRUw43B/l1MhAGos4/Bi0kVFSiyF9wEqNmGBTRjLA0vX5lV12G7S
         j4MCpCUxww6Q9UpfU219s2frkBm9OuHrJ3suMfNn1pXefyF4CtL6+S/4sKFpcaa/3s7W
         JTmxOvqRr38zBHI8bmUMDBtH7+MBtntkIxF9LWviELQWVPIkswYuKlBbp1ep15qp2sLS
         /gtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763509388; x=1764114188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sOvEz1Vkfey9HagluRBMMIXQdIKTx7ENVL/+GZqZp08=;
        b=GrEWp9LsBBH2Lcg154w9B9uaT2CsZgsnal6+5w79OEGX/VG8xqzGPRrUXroYbXaiin
         WM52sSov5d3uvBV2qjU8mBbyHYjpMWDFyl2EaGqZbDNGPFPj0Wy6yS3lZ2Rl31nvr4yg
         jtfifm6qzHohUyhDZsnSE+x1RwGsG3nAqaJ+joS7eSxnqrT7cAkyICo4SWkM/gCBuwUy
         46rRlVOM9qcnk23pqWILA/WcTJUwK/dsKyqLTKXtjM0Sep4o3b4F8ciZNNVjgYn1nIW6
         qvpgFLx8jEpp/4pH1kLQCMZmgC5KIt/QvDrlqM+RJ38rBZW9r1oXQLuFz5t1RvlVm8+m
         CgZA==
X-Forwarded-Encrypted: i=1; AJvYcCUlLji4is1mD8UU+yjZwKG7L+4wQmXhljdkpYcvPSWtxBZB49D99gJ/LcGxzpDbkjNYun7ikQCjjyiz@vger.kernel.org
X-Gm-Message-State: AOJu0YwRagIzf8P1J0iqaZNEBkWZI2Jw12xt8YZe5KOPHqrjd/Hq3Eg4
	ggIqFWQhJh2BfrVmjp7KgpyaVhf0z1sosJuNnQXYLUPX8vP/I/M7xrLDUulwqaETpxCAZhQPYpE
	iJtdXwTD8CrfUKyy5A9iQADa3bKySzmf3t0w1HN9XKQB6JRa+wkvDlnDqtg==
X-Gm-Gg: ASbGncu+W22XD3mbQy1FcYi0C/ikoxwzcdYXFz8uDsDtTIMzaW8DoCSFCtGi1xqgVTX
	2TrIqBJvFX+dx3g/sE49hzOC3DWpxq4fTKMsdzxGA1WVb2LmPiaTFjbqFhqDDDZXIju0DzMDjgF
	PVr0hWv7tmMKN4toUXu1jsySoB4QxJah5ptAPIx+Vrkb793Cr1deY1Ys7niLEI9kGNj0NapzC7o
	ITYVKd9SaL/8TYkLRBp3tQzIdJcO0DLD4MRwRXeYKs2DnpQP03IpGQL6n00upmQoPVffRM=
X-Google-Smtp-Source: AGHT+IFJN58hrpi/dBN49lau1irVMLe2sxC8PdhtdLctVQIw73A5aMkH9E2UGKPm1u/Zg95NtUWPzjI/uczpUFyRJHo=
X-Received: by 2002:a05:690c:4882:b0:787:c849:6554 with SMTP id
 00721157ae682-78929dff3e2mr321369917b3.13.1763509388004; Tue, 18 Nov 2025
 15:43:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_1B2BC712D34FBE7DEB01320E665BEB2D8908@qq.com>
In-Reply-To: <tencent_1B2BC712D34FBE7DEB01320E665BEB2D8908@qq.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 00:42:51 +0100
X-Gm-Features: AWmQ_bli8J37Q3o67P5_fv5istUjSCQUhMZ2qJYqWI0sCzat2_JylO2Sbj2z4Co
Message-ID: <CACRpkdb5Vatr+GfNwUfou4+5NviNkdYZYH2hSNYo2qifX324Uw@mail.gmail.com>
Subject: Re: [PATCH] leds: add aw91xxx driver
To: 429368636@qq.com
Cc: lee@kernel.org, pavel@kernel.org, brgl@bgdev.pl, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-gpio@vger.kernel.org, zhangxinyu <gavin.zhang@faiot.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zhang,

thanks for your patch!

I see others gave some comments but here are some stuff I saw:

On Mon, Nov 17, 2025 at 10:36=E2=80=AFAM <429368636@qq.com> wrote:

> +static int aw91xxx_i2c_write_bits(struct aw91xxx *aw91xxx,
> +               unsigned char reg_addr, unsigned char *buf, unsigned int =
len)
> +static int aw91xxx_i2c_read_bits(struct aw91xxx *aw91xxx,
> +               unsigned char reg_addr, unsigned char *buf, unsigned int =
len)
(etc)

Use regmap abstractions to read/write registers in a
controlled fashion. Check good examples!
git grep regmap drivers/leds/

> +static void aw91xxc_led_blink(struct work_struct *work)
> +static void aw91xxx_led_blink(struct aw91xxx *aw91xxx, unsigned char bli=
nk, unsigned char delay)

> +/******************************************************
> + *
> + * sys group attribute: reg
> + *
> + ******************************************************/

Regmap will give you debugfs automatically if you wanna play
around with registers.

> +static ssize_t
> +blink_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +       ssize_t len =3D 0;
> +
> +       len +=3D snprintf(buf + len, PAGE_SIZE - len, "aw91xx_blink()\n")=
;
> +       len +=3D snprintf(buf + len, PAGE_SIZE - len, "echo 0x9 > blink\n=
");
> +       len +=3D snprintf(buf + len, PAGE_SIZE - len, "echo 0x12> blink\n=
");
> +       len +=3D snprintf(buf + len, PAGE_SIZE - len, "echo 0x24> blink\n=
");
> +
> +       return len;
> +}

But the LED API already supports blinking, don't invent new sysfs
ABIs for this:

struct led_classdev {
(...)
        /*
         * Activate hardware accelerated blink, delays are in milliseconds
         * and if both are zero then a sensible default should be chosen.
         * The call should adjust the timings in that case and if it can't
         * match the values specified exactly.
         * Deactivate blinking again when the brightness is set to LED_OFF
         * via the brightness_set() callback.
         * For led_blink_set_nosleep() the LED core assumes that blink_set
         * implementations, of drivers which do not use brightness_set_bloc=
king,
         * will not sleep. Therefor if brightness_set_blocking is not set
         * this function must not sleep!
         */
        int             (*blink_set)(struct led_classdev *led_cdev,
                                     unsigned long *delay_on,
                                     unsigned long *delay_off);


When it comes to dim:ing and fading, I'm pretty sure that either can be
done with existing APIs or we can add new ones, with some coordination
with the input maintainer, this must be common for input devices?

Yours,
Linus Walleij

