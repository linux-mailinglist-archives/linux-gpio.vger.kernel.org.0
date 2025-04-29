Return-Path: <linux-gpio+bounces-19472-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1801FAA1B96
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 21:53:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9817C188C5EE
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 19:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5EE25F7B3;
	Tue, 29 Apr 2025 19:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BwUD7d8M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B32118F2FC;
	Tue, 29 Apr 2025 19:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745956420; cv=none; b=meVc7m7NeCZXV/xPSpNmn1AUqBlsZyAabW6MO+yDkaCYCMUMOtcIzZb17061TicnO2beE5WxgaOezLmzW0DBkjYdYKHgHh1Fxw8raBdCttkIcmh5yK5IxBAD7/3lXvqQ4D4Iobmk5KyCmXMrDghQgpFLPgxJ2kZGH+uFyJjFd6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745956420; c=relaxed/simple;
	bh=/m2f5glFJoqPUvsL1MCDWCg8ycsdqZ8UzASsUMK5Y2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L5iFgpWoMz4YpacbLJ5Xo0DRYLWOPlzHziZsboiVaIkvNsLdi+Py3+R9MbutrWh61rEhEdwn4/etgHcfzHMCD1eSVFJ4Qt7ryKWK5nV5vcARbKcK8JTzpEW56zupCP4YabOJ8ruBMGK++WtrWJQS0Spaw9GD1ZLQ9Itsbqc+axI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BwUD7d8M; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5f7ec0e4978so5916488a12.1;
        Tue, 29 Apr 2025 12:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745956417; x=1746561217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amJhdD4Bfh27xkAj5s99YtoTbehGVcO5N5MkHcm2+9g=;
        b=BwUD7d8MUnGUOQxJ0cGcJWZjnWtwjNxhzDsE4Eg5nClNkFQp79PGbicC9f45E30ke8
         +raFb+Hl9F/5tit0bgXz/myLYR4LnWtdrp1tlDudy0wjyCGek+J9YLpDX6M7W1gGfOT0
         ZDZnSxp7eww1PlR/or+CrSo8AoSGoB/k/TiAE2U2R4o41IaI4n6DsxQu+g9qC+l4v15J
         sSstmC4647xN2z0aIosiWqD6ZV4FGFIeophuYk3qZH59rDYE4AwbET8M8TSdZMCIYuo1
         b+WVUM1/DlcxXVsPpEtMrQ5ZXmzggcWmj7Iy+omhrTCgpPmb/9WQ3i6UIXTDStfEAGgE
         5ocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745956417; x=1746561217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=amJhdD4Bfh27xkAj5s99YtoTbehGVcO5N5MkHcm2+9g=;
        b=Ejxq5+OLcbr4VJqo2VlekwsELzcvHZsNFqjDhMaTKY98Ewm+9Nr3rfJHcfvoKBQXjZ
         d5KTp4hWDl4QU/qMWHopR4FXrJoN06qBatG+D0GWDqGYNFvyasdTsFhNkazShU1/qQsQ
         gId8PRCIvun7KEzCiDQKTBCd6qnDIHgYdJkHmHX3U2D8MSeH2z1YZ/GYG7Uk2amLb3P0
         2oljAUTss0kejcMOAK67nofvQX2Ygn5REhtlbBIE7Hy+8WEZ2f+nqt8TVT9RwMcy8+8l
         JChqgZ0Q88jZorB3t6wH+SrPenOmPXbzvnRQnDkvu/w5WEAjnYyrXi6cRN0D/8pNtRU+
         bEWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnNlaGSbQp4HYldFcc3SZ0yJBQbACLDBs9u8uyXco6q3R9sttOg2Zx0yAsIxs6+z0eg72GR0dfWQZZ+9RlffYb@vger.kernel.org, AJvYcCXYkcTqgeR8Nrw6PI56Q/J8faBJdYstNQCs0znTbZleZPuuxfkxmjJTojYl8/cRaMb6EVlPrbC9rkAxkAPY@vger.kernel.org, AJvYcCXzZe54mymnDE6RciwXJ2sbcxCAgeSydvPBavGthDX8mBvSIUGThaWJZCRkCc0HNEGLb3W6A9xaD2mg@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrmme8RCU1M3CnaAwzj+OpLBI4ngkoyy5uvOJjScUhOSweaE53
	O/aUDNerYPnFkI3a8OUg8CjcpegsWxnZ0/gCOO96XjM89ejtbIN1e6p1JfVLg+PnEEuWfu2BUi1
	PXPeyDX6rkeMG+9RDzBUnI/yAnO3z6dSO
X-Gm-Gg: ASbGncvPeWXtNkCDsYlVhMI2JxWQT02Jx92T+mZEILLCUUwcC1vZpCh6aiQwvbmDQi0
	pQXdgvdsokhcK3e3RWA82arTQ/KBddNQkDHs57D2eiqwzf1HsPaAxMqi87VqFbetmeOEyqkGJYi
	WH4xGBbEftOhxbKHYtmw5vxA==
X-Google-Smtp-Source: AGHT+IFn+Ny7vYGospb10UuJ4S9bFcXHWzs+HDCP+yYxtmh3gLnLEIb7H9zLRBUWbVIgjB5NrwRSq66TQfIqBMNO99g=
X-Received: by 2002:a17:906:1119:b0:acb:bbc4:3344 with SMTP id
 a640c23a62f3a-acedc5e042cmr50004466b.22.1745956416638; Tue, 29 Apr 2025
 12:53:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-aaeon-up-board-pinctrl-support-v4-0-b3fffc11417d@bootlin.com>
 <20250429-aaeon-up-board-pinctrl-support-v4-3-b3fffc11417d@bootlin.com>
In-Reply-To: <20250429-aaeon-up-board-pinctrl-support-v4-3-b3fffc11417d@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 29 Apr 2025 22:53:00 +0300
X-Gm-Features: ATxdqUFIOUQJascpH7Q4rydZ5qHH4jZYeeXXhuypZCuHlgQ4MyZpT2gNs5uAOio
Message-ID: <CAHp75VfM7hw7LLkZ8_oXj2WsWJKyr+yYq38csYYczqNo2qV63A@mail.gmail.com>
Subject: Re: [PATCH v4 03/12] pinctrl: core: add devm_pinctrl_register_mappings()
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 5:08=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> Using devm_pinctrl_register_mappings(), the core can automatically
> unregister pinctrl mappings.

...

> +static void devm_pinctrl_unregister_mappings(void *data)

data --> maps

> +{
> +       pinctrl_unregister_mappings(*(const struct pinctrl_map **)data);

Why can't you use the 'maps' pointer directly here?

> +}
> +
> +/**
> + * devm_pinctrl_register_mappings() - Resource managed pinctrl_register_=
mappings()
> + * @dev: device for which mappings are registered
> + * @maps: the pincontrol mappings table to register. Note the pinctrl-co=
re
> + *     keeps a reference to the passed in maps, so they should _not_ be
> + *     marked with __initdata.
> + * @num_maps: the number of maps in the mapping table

Missing Return: section. Please, validate the kernel doc.

> + */

...

>  void pinctrl_provide_dummies(void);
> +
>  #else

Stray change.


--=20
With Best Regards,
Andy Shevchenko

