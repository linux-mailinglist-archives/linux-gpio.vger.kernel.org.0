Return-Path: <linux-gpio+bounces-14909-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B77A1525A
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 16:02:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4287188C5FF
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 15:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57B01917D6;
	Fri, 17 Jan 2025 15:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="CuoUoTir"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417BD1537C8
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jan 2025 15:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737126117; cv=none; b=ZJ6GhkIW8nWG/M4AFGlJwfM9/BwMgZsH+ySJt1nBTSyEzVFsEy9rn3x0y72cK76zh5J5L3ehU4zZouoqK9T8N2S0cLHQ+TQmXISCitRUjdzxbj82xKmcFA1UnnRiu1qmM+eUbrbdjQlWO3dXKFDokORBP8Fmw7fpUDNefBRHc7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737126117; c=relaxed/simple;
	bh=WJWecxE6Q99/E4SwlHulGj4mvLDYu39DCXR3yeZPd68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oMLK6h3Qbx5cmNsHUIjd1lY+JcmFCZRb1N6Qg+UKWWS7ecU4gmSXd2vNLODOc/YxrQrmLfjQ68jShvCxeJjAMZIxG2QOgdd2gZw7LQGhMTjY6b3dbHfkNmnnIgdxywJjTazj+uKFdFU69YTpK5IwKQxqLwiGJgHyw0N/00WK1QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=CuoUoTir; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so5474085a91.0
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jan 2025 07:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1737126114; x=1737730914; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFMNwlplxaHnJ/vSA4fIqDAnSEGp9qRKtZv2ZMgip3w=;
        b=CuoUoTirn0kRAwIOQbXts5bAYy/COiYRbrkI0oSIjUlTr2igYVhJK5VAcQ42yFHpMH
         QHzvBGoCcMM1/ujzpzUE7FAyg6y/9gfH7SGN5P5LCExU8W695sBFtIzEXVW+wH9Y1Wzy
         ZhfNO6uN1OeWYOLkikOuAajRlIuZ0SP6/YvxkeZPZ36vwnBpg0KajndxiCf31vZ1VKh2
         OtQdWs3wmeVl5vejUZU56inxIx3rO8YlPJhAHP85jzS1gzlBK8C0ODKw+gaLq7le+ErI
         +6NIJ32s+iH2qqsZJ/+6aDOmfmSwHVZuZEDFRcXQFazPiWKpTkrh2GXGLZSDZmOL4eXn
         FrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737126114; x=1737730914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rFMNwlplxaHnJ/vSA4fIqDAnSEGp9qRKtZv2ZMgip3w=;
        b=DvDwuZIyLGd+5uRs0M785wN2eQwJygcYFXod5kdNmHIUOQXMEIsqOTpoS7utKk3kGA
         0U5iqAM/CPvf19FKN/f+Uc8soyOORv26yJ4XkBhKFYZ9x30EBjOaN3stte+kKJbaG3aE
         McIiqPUf/XmD6ZimTFBEAcVzBq+rKuM5y+nze0Vj9NfdcMjp7ihOis163gMdTnO562wk
         2a7RSsWXH6Zsjngsx/9MxbScOJZNI8eV9JxbPTIl0mlMMjjvS8hPFOGpV3+Hym5B41cC
         SdflaRewcctaHWpiLfFwZsklsop3HMy9RWHcjrIr73zPLbpuGsKFXTB2NjCt1jxTeKxz
         FM4Q==
X-Gm-Message-State: AOJu0YyS69MJ/WzHLa80UCQpzzKQcYJvi4I/IoTXb1XxOZ4BqfzKQNT5
	neVkwgNqM/XjjkZZRmUtUrNouAz6DUcfxC22xPS7uvR5HjmVdFQdMleDtgUP+N40QQ11oZT4wSj
	ib+zRJ3Smiy0tOFIsK9jBo1rgIANQoCQhxPsFB+LWQVadZNPG19R5PA==
X-Gm-Gg: ASbGncvrUpGwCXWVFlJ6EoTQgGbhacdEAq3Dvx/Ao+hgZA2nFTPLGX1imNfeXRzT7xH
	mmLJ9imsqd+fgB/ulXH56HuTNzb1iGzk+xvKe
X-Google-Smtp-Source: AGHT+IHYXDt8VbMk3yPNP4ujJPanP3PhnKhpN9Jvf7k+G/LAMFDFKQPftFX5drdtlGu9OozFfktNnYj0j8FncqMRfw4=
X-Received: by 2002:a17:90b:4d10:b0:2ef:2980:4411 with SMTP id
 98e67ed59e1d1-2f728dd3cb8mr15473251a91.9.1737126114494; Fri, 17 Jan 2025
 07:01:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117142304.596106-1-andriy.shevchenko@linux.intel.com> <20250117142304.596106-6-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250117142304.596106-6-andriy.shevchenko@linux.intel.com>
From: Patrick Rudolph <patrick.rudolph@9elements.com>
Date: Fri, 17 Jan 2025 16:01:43 +0100
X-Gm-Features: AbW1kvbzyFmbH2xBcdr6B7_b3PZoNSFworLloanEie1yaK-gWzUd7urZCNLuTIU
Message-ID: <CALNFmy2qGCt8OTb3qx+0PsPivbfY89gWe74Moeeu7r7hCp_UaA@mail.gmail.com>
Subject: Re: [PATCH v1 05/16] pinctrl: cy8c95x0: Remove incorrectly set fields
 in regmap configuration
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,
On Fri, Jan 17, 2025 at 3:23=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> We don't provide defaults for the regmap, we shouldn't provide
> the number of them either.
The intention is to read back the defaults from HW to initialize the
regmap cache.
The defaults are applied at each POR from the device's internal EEPROM.
See regcache_hw_init() for details.
>
> Remove incorrectly set fields in regmap configuration.
>
> Fixes: 8670de9fae49 ("pinctrl: cy8c95x0: Use regmap ranges")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/pinctrl-cy8c95x0.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl=
-cy8c95x0.c
> index a94fade0ebc2..e98eba17cd13 100644
> --- a/drivers/pinctrl/pinctrl-cy8c95x0.c
> +++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
> @@ -464,7 +464,6 @@ static const struct regmap_config cy8c9520_i2c_regmap=
 =3D {
>         .ranges =3D NULL,                 /* Updated at runtime */
>         .num_ranges =3D 1,
>         .max_register =3D 0,              /* Updated at runtime */
> -       .num_reg_defaults_raw =3D 0,      /* Updated at runtime */
>         .use_single_read =3D true,        /* Workaround for regcache bug =
*/
>  #if IS_ENABLED(CONFIG_DEBUG_PINCTRL)
>         .disable_locking =3D false,
> @@ -1475,7 +1474,6 @@ static int cy8c95x0_probe(struct i2c_client *client=
)
>         memcpy(&regmap_conf, &cy8c9520_i2c_regmap, sizeof(regmap_conf));
>         regmap_conf.ranges =3D &regmap_range_conf;
>         regmap_conf.max_register =3D regmap_range_conf.range_max;
> -       regmap_conf.num_reg_defaults_raw =3D regmap_range_conf.range_max;
>
>         chip->regmap =3D devm_regmap_init_i2c(client, &regmap_conf);
>         if (IS_ERR(chip->regmap))
> --
> 2.43.0.rc1.1336.g36b5255a03ac
>

