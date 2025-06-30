Return-Path: <linux-gpio+bounces-22438-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D00D5AEDF5A
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 15:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 232A07A513A
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 13:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E49928B7CD;
	Mon, 30 Jun 2025 13:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pGpHUUDz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2B72580E7
	for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 13:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751290849; cv=none; b=kdztmfiKiWNumUdmjxRx3BjsGBvBzE/5WBRFTpw9XRZj7boKwXJUeaZGt1AcrjVex/d3XQOo9KM1RRXBzqWRHikjrRbe060BighXbEc/RaxDJ6PUiqAPPnatCbomE5NPTI/J1RG9Cvg/XVxzibFaDIcgwQllrxfeE+JW8w4uzv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751290849; c=relaxed/simple;
	bh=Bdfby/u6bdjw0RZMd+EKW8id3ZusrWIUx6zentQhWOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XcSgM3co0Rh0DxsM8Rv/NLZT0/mzY8X/0Y3Ev6enOLygbulHzlnjLXcXlWzTi96xDTho3PU48Pw9PEthXCI5W+oXj/aEYSqTI9OdRUToy6GiBKOzvHDVFl8AGUklcLUY8r7PfRUu2vMB8RX11yt48SFzm0uDjP2cyCIyoidJNno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pGpHUUDz; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553b165c80cso4527822e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 06:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751290845; x=1751895645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGQ8OBPWWUH7qxoscwJADjTSfSsFBxaQr+m3BPxVcZw=;
        b=pGpHUUDzD7LnT9XgEpBZZ26XxK563dQwXS7+vka4cKxGQXj8tOiBwHL8jfKD6Whgh1
         bSENxq7JphDA6vQtg4X+yOApJmDyVXp/SvJX/bqJ3G9OPwWHtAry+il2AyvsqaqKe2f9
         oIecynWAHgU25Hc4xmJsv0KyGVSTMW+qb9qG4VjrKR6UPWPbvtwg7IlNDadG0k4cDgoB
         ZVF5N5GP3Nhg8HU+mDX2GX482zzEPPViCZ8Pm1U4G9stmg/HovOgfVyqRW5Q7mR78PM4
         t1PTp6DEv6hTGmp/lnKsCP6Jyx0KiyxfhLrPmKFDGAqy2a71r2seXs7MzW0mgb9tLVSS
         LOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751290845; x=1751895645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGQ8OBPWWUH7qxoscwJADjTSfSsFBxaQr+m3BPxVcZw=;
        b=ijm7TyLB9JeDp6MAlCq9YaBrsCyDS+CV0SsjuGzrgiutU4QEz6qqVwPxqW2Si6tAD1
         IBtVRky1n9aRxJLYqTrPzQTu3TdIjxmJSLzRbiEQComBWhgQPD3CFs1V8Oze8SjPgdBS
         M8GxGYoCQIHrhMlkyXdQl4H1JPVwg2ezKN1xn80tX2aYXfzDm/abvGruSd0ti29B0LXo
         RjUCS0JxnUnM9Zl2eYna7LdMuoF9D30/6VmKtoxOrL0AbY6pIFxUmpi0EJhpvKZotONY
         Yo+BIPVId6oDqxF6M4MVHR1/nLT7ncz3K6Fq6wbhJR35wgSpEdldg3xhz1g2fa4FJS8z
         pXTA==
X-Forwarded-Encrypted: i=1; AJvYcCV07qNBeLfVUWuHgNwOY8nHEUBZ6Mzk5T4KaUukU0KshExNk5OkXeqvPG9+QvJBRd9z0W8NCBmLqtmX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2MoFy8QgG58pAQVNhykmf9iHSaR208Eo/QxVK+X98Blntyhbd
	imJl0ULolvNuzXttvKnufoG3elQen9/qmxhLh+md3HvfBc2Tz6UoJD9dvW/G8L13utFcKqfMkpb
	HmcqPEk7GsC4wYy/1O+H8jt6UmcrH87DP50RIpg4QUw==
X-Gm-Gg: ASbGncu/i11bbVnfq26eisSHtM4b6n1NPmod1aLXiSBEHcrOq/Wo3J/aoRUtL1xxb9j
	VkCCAOP8NEl/4lNeGQjMkMeOZkOkieuCmXWnIsTsuv3QVya4+TQQIaW5YZHtb2npzX2PsoLMbve
	dnyPLAdmQcfDUlLkSmi+UspqPa5fM5kcsHGuDqLQN8CwzH3Vr19ma3ki5oak+4cUZbn3O/8PPUk
	50=
X-Google-Smtp-Source: AGHT+IFEKA2SLJQpysUlJu4jsICuTZHFEG1exDwjVz3c70l0NRetqL6g79HhvHWrXy3zPDak/MnPe1KGqiN5+Hwazo0=
X-Received: by 2002:a05:6512:3f1d:b0:553:2ca4:39e6 with SMTP id
 2adb3069b0e04-5550ba4a95amr4553312e87.50.1751290844699; Mon, 30 Jun 2025
 06:40:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629095716.841-1-jszhang@kernel.org>
In-Reply-To: <20250629095716.841-1-jszhang@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 30 Jun 2025 15:40:32 +0200
X-Gm-Features: Ac12FXzqcQQBva4ynxgyaDsPaC44ZITNmwXtVHMx7t4B-6L8ulDkLpq6h6Gehdo
Message-ID: <CAMRc=McPmYLhPrRnkZAQWHX+wF2PvYhDE5rD_Ws5ExSB2sGPXw@mail.gmail.com>
Subject: Re: [PATCH] regulator: sy8827n: make enable gpio NONEXCLUSIVE
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 29, 2025 at 12:14=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org>=
 wrote:
>
> On some platforms, the sy8827n enable gpio may also be used for other
> purpose, so make it NONEXCLUSIVE to support this case.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/regulator/sy8827n.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/regulator/sy8827n.c b/drivers/regulator/sy8827n.c
> index f11ff38b36c9..0b811514782f 100644
> --- a/drivers/regulator/sy8827n.c
> +++ b/drivers/regulator/sy8827n.c
> @@ -140,7 +140,8 @@ static int sy8827n_i2c_probe(struct i2c_client *clien=
t)
>                 return -EINVAL;
>         }
>
> -       di->en_gpio =3D devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_=
HIGH);
> +       di->en_gpio =3D devm_gpiod_get_optional(dev, "enable",
> +                       GPIOD_OUT_HIGH | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
>         if (IS_ERR(di->en_gpio))
>                 return PTR_ERR(di->en_gpio);
>
> --
> 2.49.0
>

As explained in the discussion about this flag: I hate this but I
haven't yet gotten around to proposing an alternative, so reluctantly:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

