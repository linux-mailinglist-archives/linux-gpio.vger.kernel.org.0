Return-Path: <linux-gpio+bounces-30050-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8875CEE20E
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 11:09:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 18C75300163A
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 10:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238691E89C;
	Fri,  2 Jan 2026 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0kx0J102"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B7D20B212
	for <linux-gpio@vger.kernel.org>; Fri,  2 Jan 2026 10:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767348554; cv=none; b=TRYYHTRhsEyGdKtF3LNkf8FEgmGWE7P5+7uWpbPhIdzfspZEIN1XHF23W+BIHVM6KRRopH59s0/heizXozo58g/mPp/lixRVD+UYtva0MEM+RfdKiMez9o8JPISFCiNZUzatMse5w2HIpurPyOakgHJNkeUqv4eVnaYihkz/Z+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767348554; c=relaxed/simple;
	bh=GaHqVjch9Pej6BXtAbKP8uif5ywRSBxpXWA45dof1TI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tjlIiMwDopy4+UgpWn53JosIy1wSbrtEOsBJfCNcJsUq1SDN+aOf6PBHBNyBFRlIf7GLlifkkQgrQA1GC/ORoQ6Hxsg1crJulBgmg6vyoa03EXLOVtrOPm0fR+oPoO/zfgQOUxzmxhAar7XgeTiT5n3ScQKEZVaF7AKGWtptCZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0kx0J102; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5959105629bso11826177e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jan 2026 02:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1767348551; x=1767953351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quKKpi291Ij61ZouqUEp6jzReIm02EqX1LBuWIaBPAU=;
        b=0kx0J102kCD2oMQ44AxabRQVRQW6aAjx7WztpkuVNH3kCw0ECK3Lxs02Mls7RjSndG
         0KjEYasaHlEfDP098LHfWuqOWQXQ+Rn/kyhojhoz2Kz7qaBG3fzpNu/kVMTs2qMrk5ro
         0CW7kjZmvnXhSyRWdg3FeIHkdvSv3DlwZFt5+y03JNOrc8aEujlrmLiOp9Y+mN7AvHUE
         ZOw2duY6lQEwQcKx6aIrmya2CBG8CcVWXd/PXKfIEfK7T43LAcoP37Prp5/Pf3nqY2nt
         JYKqDKWjMY5srFBguzbfsZ9HWqoyeNUBr65rnXz7GX5s3IdyvT/UWkFcx2LHUvrE32GA
         M2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767348551; x=1767953351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=quKKpi291Ij61ZouqUEp6jzReIm02EqX1LBuWIaBPAU=;
        b=P9DkFBrFvEEuS7EEr5H1oYzReuHXF2/XpDoAWblCSPGTqr1Ln/jp5m4191DFWi5LBi
         iG3NMWfuFzoMiEkHovXd5w6XGyOvpIsBUgsRGxEsgH/hv1inwm0DeK/EDwIFEOGHBdhJ
         biByO7EwnHDN4yCsHtK3AQHcv14+y6QF/Ca5c9VJAQKZaGN+7onOE7PClzgPITQfi3LF
         NNtRj/Ic877KkmFK+xn1uIY49O3v7JIEptrw61YbHPBWIPqu6mcx5NCh2AD3K4rWz310
         WFSz+l3VuFJIhwOmuq1MFUmSh+Oyx/lkftMOwF8v3JMUnC128jW9rZJQGy+lIiX7AFNT
         dlJA==
X-Forwarded-Encrypted: i=1; AJvYcCVKcOXnTiQKNOJv/tbq7+fmBWllvIRMJnYnD9qAQWMjrsMm1jPhXOCRqz9SlJOaoWDDelmR9p0H+8kM@vger.kernel.org
X-Gm-Message-State: AOJu0YzVn3UQmeyiqkCAwgYjl96tN7Drjw5Sr/Udh+LxZqdhwUJm21L2
	/OIkKcvjanHYkJSLLa0+G5LYFcdYeutJvQDF6uPy7k4xiZ3g+v/FdCWY6AQIDrLAp+gyGs8PUNE
	pTYBnAS4+452knjdPoR1jFQ5vwUWsCyWetciHr8IKMw==
X-Gm-Gg: AY/fxX71fxhaXF/YtONeDVtZxNyGSqBZtzz7ZWXx+MRDXKV9xvz+93tr+0R12TCqR3z
	P3xadsVdor8qwAHivbhAa22Pi48MuNx35+CKOdxKPrlb9B6KupX1Xn4vIF/Pg5z+v54K+ppTZ8q
	WGjXSZ8GzAXR7TqxVqpbWewNFOfOXqdglYTrB0FFNbEeTCRR9KyGifjF+8EznzjsS/ihx1kBQUn
	vnFK7uhB0g/1KpKq8xOIlkDuYrj1VYryy+hCx/q19OV7vS2dFpAymQkVZEJ01CayRI+ZjcgaML5
	3xB+qXhLd63LBupzBOnL2kgKKLk=
X-Google-Smtp-Source: AGHT+IHjSaOFOUMR11HrjYKQvXUIGVNogKo3uPHeE0VNpzsZZVoUCwXVx0TOIv6UbnLc4tYDAoC6CU2AMhhsN5fF6ic=
X-Received: by 2002:a05:6512:b0f:b0:595:82d7:a275 with SMTP id
 2adb3069b0e04-59a17d4f8d4mr13173122e87.37.1767348550994; Fri, 02 Jan 2026
 02:09:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org> <20251227-s2mpg1x-regulators-v5-20-0c04b360b4c9@linaro.org>
In-Reply-To: <20251227-s2mpg1x-regulators-v5-20-0c04b360b4c9@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 2 Jan 2026 11:08:57 +0100
X-Gm-Features: AQt7F2r17Srt20LVLe2RDqwU3JWhUJkE2UjKhFxeZxdb3Gpm1SvqBNl8ICy9QX4
Message-ID: <CAMRc=Mcn4MN5Mp-7avR1fVn=V1HFCimM5FM8jx4bXvCpjjVzNg@mail.gmail.com>
Subject: Re: [PATCH v5 20/21] regulator: s2mps11: more descriptive gpio
 consumer name
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 27, 2025 at 1:24=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> Currently, GPIOs claimed by this driver for external rail control
> all show up with "s2mps11-regulator" as consumer, which is not
> very informative.
>
> Switch to using the regulator name via desc->name instead, using the
> device name as fallback.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
>  drivers/regulator/s2mps11.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
> index f068b795ab51845bddac84eca08be0efdcf4f164..178a032c0dc192874118906ae=
e45441a1bbd8515 100644
> --- a/drivers/regulator/s2mps11.c
> +++ b/drivers/regulator/s2mps11.c
> @@ -362,7 +362,8 @@ static int s2mps11_of_parse_gpiod(struct device_node =
*np,
>         ena_gpiod =3D fwnode_gpiod_get_index(of_fwnode_handle(np), con_id=
, 0,
>                                            GPIOD_OUT_HIGH |
>                                            GPIOD_FLAGS_BIT_NONEXCLUSIVE,
> -                                          "s2mps11-regulator");
> +                                          desc->name
> +                                          ? : dev_name(config->dev));
>         if (IS_ERR(ena_gpiod)) {
>                 ret =3D PTR_ERR(ena_gpiod);
>
>
> --
> 2.52.0.351.gbe84eed79e-goog
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

