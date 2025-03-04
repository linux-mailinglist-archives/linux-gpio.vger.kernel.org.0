Return-Path: <linux-gpio+bounces-17013-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BEDA4DAF5
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 11:40:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1F547A3903
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 10:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CCC11FCD04;
	Tue,  4 Mar 2025 10:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jS0aCpAG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CF51FECA5
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 10:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084610; cv=none; b=RIov7Ot0ZJ/152Gksz3rdNN42Ab9GoU3UqPB9mGaqlT9OlivZwqHj5E/GLSPXWonOIxIOFpoX2PGMJib6OLOSgzm7AJBgKrf9wEQ3jLjQDk399iBngohD8nc87TsZ/FqashupnnA6D6V0CC6E3K2IqsJndyZDT1hO+80l/xxI/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084610; c=relaxed/simple;
	bh=EHoD0qagGcne6cLZT0wmntslq+OP88nXMSPMcbC5g7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GQiHjWCXE0uFSgkQ/iwrYKosrcA/fJ6Jzozai6omsnHnESqLiV9mzgtladnlCkMVFBSHjLMpOmaUL5W+QZZy+HmUDyPD3bGwn7tXbaZaf33P/ItrESGBkznHgGTB9MncwG4CNSy61mrWJ4+194D1eoYXs9HCZsj+iqDnXG6N8rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jS0aCpAG; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54957f0c657so3877460e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 02:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741084607; x=1741689407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcgDcrDvfr7N8xNLIke7CDnqsWk3AZK9G46chFxkHHY=;
        b=jS0aCpAG/NDoxa6sRCg7MBP+A0WJZBboS/xY/3AkRrs32dlV9hd5i5JPMYEXwe4ECz
         jglhlllXqE+HvNsGQQR9lTgejmmi4FHmEXnWIodHKLiWJECVY02IJwCP9Yq+igRQWEoQ
         jfusvrt8e9WT+tHFc271gMmnKKi2oRWlMVU2WwcfeM75ZFbsHqLlPtJQwmD5Wi0enWuH
         C/msOKeVMY4jhyHZoUN2EY4MlzDfI9qT3LKb3W11klOClle2B9y2MvymkxIAR6eOnIJ1
         Z/lnGaRngb43ehdRJj0Ysvc17GVrRzFOzkk5osMB7B2mlj2O50ANkprNAryV+YfyIl3l
         xn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741084607; x=1741689407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lcgDcrDvfr7N8xNLIke7CDnqsWk3AZK9G46chFxkHHY=;
        b=NnK0DqiyFZbUMTG2um9vS0TTuPgFCNZ72rlOaR8leWoYitIGXh1rk8B7OHsnlB7uPQ
         CVvkL6Leo0gx8J6VmRGGLJkK7W2079aEqasCMI7TQEuL10P9LSO/I5/uOThaLmN/UTuT
         mpLuo6t5TYHM/NX7lpKPhcAi59Ery1V17YSXWJ/ND63h9lAG7nWnOBBaRK2e9XhBulYH
         rIxCqAOsYAsx1ZHuQQfvBmX6y3nRubN74YtshcCXcn0k55CTSr76ZhzbcpUIvYONqi97
         q6iejR5WKTdyDzUyR9ryeqhHINbKAm+gXPIbqrgHUeND6NVLmn0I5pCmC2DUUhG9L3sD
         +XJg==
X-Forwarded-Encrypted: i=1; AJvYcCX6mEMxE3h6t0662hl3gWWEMz+4IiZ0p9Il4gcCkhkJWueuuiAMckeC4s3d+FA4R8W2W3ifd/sFiRkS@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Ag2xdSb1KtGkZNFwtlx6gixCZgaydeVyawYwzFpnW7ertJLU
	0ct4aoK2mrrHGvzmhFTvYpPTysMcj30CfhaZEtEqDUjj0fG3zNKUmHIAAen0fiZ1N63lS5Y2RxZ
	JsR+YC6L13gM84zBBleX8reJx/GBsbwhcKizfKQ==
X-Gm-Gg: ASbGnct6TqsyUmsTtIhU/wdf2/XI7mWOmIAn695ldWVmOQEYum7b9WVLa4thJp9yxXu
	hGCrboKEikIonDh6lq/7ZUsVC5BNkU0zio9LkE/GRVShLnT96dvui2adoDlooSApeyb1GQTB5u8
	x5HLEXh5Kjmqz5SO5SBe9S65JG3Z84OXdnQN/8QZ278StKDMRh0rkNgKBSOQ==
X-Google-Smtp-Source: AGHT+IHrJYmirFBfVDyUeRd/XJ8RpCYbbhbHQXdds9Yd6n8xkkrcThPtbWwAqBJ4we5vsSXGsXmtMn+6In/C/xPYNp4=
X-Received: by 2002:a05:6512:3d19:b0:549:6309:2b9d with SMTP id
 2adb3069b0e04-549756c58c6mr892295e87.13.1741084606493; Tue, 04 Mar 2025
 02:36:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303074552.3335186-1-zhoubinbin@loongson.cn> <20250303074552.3335186-2-zhoubinbin@loongson.cn>
In-Reply-To: <20250303074552.3335186-2-zhoubinbin@loongson.cn>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Mar 2025 11:36:35 +0100
X-Gm-Features: AQ5f1Jo6thrrsV43N2ZSskUr5sNrLRHWs4jPUL34hLtTkZv2cSPAt92oKZXNOBk
Message-ID: <CAMRc=Mfr5PCuad28dL19iZrpA-qkL7x0W-4Lt3SZyVfXPP-ipw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: loongson-64bit: Add more gpio chip support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linus.walleij@linaro.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 8:46=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.cn>=
 wrote:
>
> The Loongson-7A2000 and Loongson-3A6000 share the same gpio chip model.
> Just add them through driver_data.
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/gpio/gpio-loongson-64bit.c | 51 ++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>
> diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loong=
son-64bit.c
> index f000cc0356c7..a9a93036f08f 100644
> --- a/drivers/gpio/gpio-loongson-64bit.c
> +++ b/drivers/gpio/gpio-loongson-64bit.c
> @@ -254,6 +254,33 @@ static const struct loongson_gpio_chip_data loongson=
_gpio_ls7a_data =3D {
>         .out_offset =3D 0x900,
>  };
>
> +/* LS7A2000 chipset GPIO */
> +static const struct loongson_gpio_chip_data loongson_gpio_ls7a2000_data0=
 =3D {
> +       .label =3D "ls7a2000_gpio",
> +       .mode =3D BYTE_CTRL_MODE,
> +       .conf_offset =3D 0x800,
> +       .in_offset =3D 0xa00,
> +       .out_offset =3D 0x900,
> +};
> +
> +/* LS7A2000 ACPI GPIO */
> +static const struct loongson_gpio_chip_data loongson_gpio_ls7a2000_data1=
 =3D {
> +       .label =3D "ls7a2000_gpio",
> +       .mode =3D BYTE_CTRL_MODE,
> +       .conf_offset =3D 0x4,
> +       .in_offset =3D 0x8,
> +       .out_offset =3D 0x0,
> +};

The naming convention here is a bit confusing, can't we have the
naming of variables reflect the compatibles they refer to?

Bart

> +
> +/* Loongson-3A6000 node GPIO */
> +static const struct loongson_gpio_chip_data loongson_gpio_ls3a6000_data =
=3D {
> +       .label =3D "ls3a6000_gpio",
> +       .mode =3D BIT_CTRL_MODE,
> +       .conf_offset =3D 0x0,
> +       .in_offset =3D 0xc,
> +       .out_offset =3D 0x8,
> +};
> +
>  static const struct of_device_id loongson_gpio_of_match[] =3D {
>         {
>                 .compatible =3D "loongson,ls2k-gpio",
> @@ -287,6 +314,18 @@ static const struct of_device_id loongson_gpio_of_ma=
tch[] =3D {
>                 .compatible =3D "loongson,ls7a-gpio",
>                 .data =3D &loongson_gpio_ls7a_data,
>         },
> +       {
> +               .compatible =3D "loongson,ls7a2000-gpio1",
> +               .data =3D &loongson_gpio_ls7a2000_data0,
> +       },
> +       {
> +               .compatible =3D "loongson,ls7a2000-gpio2",
> +               .data =3D &loongson_gpio_ls7a2000_data1,
> +       },
> +       {
> +               .compatible =3D "loongson,ls3a6000-gpio",
> +               .data =3D &loongson_gpio_ls3a6000_data,
> +       },
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, loongson_gpio_of_match);
> @@ -312,6 +351,18 @@ static const struct acpi_device_id loongson_gpio_acp=
i_match[] =3D {
>                 .id =3D "LOON000C",
>                 .driver_data =3D (kernel_ulong_t)&loongson_gpio_ls2k2000_=
data2,
>         },
> +       {
> +               .id =3D "LOON000D",
> +               .driver_data =3D (kernel_ulong_t)&loongson_gpio_ls7a2000_=
data0,
> +       },
> +       {
> +               .id =3D "LOON000E",
> +               .driver_data =3D (kernel_ulong_t)&loongson_gpio_ls7a2000_=
data1,
> +       },
> +       {
> +               .id =3D "LOON000F",
> +               .driver_data =3D (kernel_ulong_t)&loongson_gpio_ls3a6000_=
data,
> +       },
>         {}
>  };
>  MODULE_DEVICE_TABLE(acpi, loongson_gpio_acpi_match);
> --
> 2.47.1
>

