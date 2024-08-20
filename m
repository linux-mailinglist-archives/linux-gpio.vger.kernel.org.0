Return-Path: <linux-gpio+bounces-8884-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CF8958F3F
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 22:43:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F366B22C9E
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 20:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B626C14B96B;
	Tue, 20 Aug 2024 20:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+kgxDPM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D6D165EE1
	for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2024 20:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724186630; cv=none; b=Nme4pTCgOOc4EKCRqa+qIBCkXcfRPxofJWk2kooDHCdOmCZN9XRaPSzATysfU22ax64cE+vpyxBblw+lPkRuPHyPJE+YXIyQXOqeKoxqaDFT0iSiA4tK0nipqKRPc7cb7GCTZwE0BvzX9LYTKNWPkWVFdh8Jp/l9XLCyD9rrUJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724186630; c=relaxed/simple;
	bh=xHfODCvjIomWKvRJewemD/GWRqIPw46713cNyM5d/xU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Idd/JNyTqAyCxLzYqd8BMUqiwQxT7bw0G+RPHYnCMjR2KE9TMXNJ1/5Uwx8F1KUyyLbQsXsnF8tSe9ORpYeBYMoN4h5jRcmr1yR5GwOX+/xPYf4iOTaEnBpCkYYvnBZIoS6iJ7CLJjDbiLMufGzCiLTVbR0kcKfzRnKfdX3Gk/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+kgxDPM; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5bed83487aeso4641674a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2024 13:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724186627; x=1724791427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWIfJWd1ZGj12rM78grkuzaaBYP2MwLZdKZAHIOJgtI=;
        b=H+kgxDPMdWtTYJ82hszI39AYtbjRx7dJKML4LhsYgvYqimdoSb6pbNl9T4vO5JD345
         obAqsfKzC4ac4Q4YKgkMS/ofK4lQ0fgGAY7oRr7796O9s04rrNDJUzQLIeN6d/cBZ45o
         Pe085pEDGhWjre8+FEhwPQMzdIaVhCNcIvPirrbsbV06/JtoNvvHgnecyscSwkyUofDF
         wXMeQ6mcvtOQDhR2iEUvD56Pdw5Ow3jgSOivbMUZ5yiJ9jHfp1n4GggejhIKK2wDy3pS
         cZjwuUvfw/KlJ5FAtIo7xcdP2VHYsyhasSi0bfuDNQCdgiKsM8v3eP8AmY3hQ8cGWjzN
         wkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724186627; x=1724791427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PWIfJWd1ZGj12rM78grkuzaaBYP2MwLZdKZAHIOJgtI=;
        b=qLBo9O7aWdvhSTCEsa3+0AReqeMeFvEdBUARl9i8qd6lbGu9zjKyBL943j8WM35die
         liELS7fYT18SeRD28f+EdbGicMYci6yGCrxZ7bSLNLMdeop43vqhNSb2T4PjqZG4kBBo
         IPLVBrb1YMAHQL7ab0p6ga4tvqGh1tTL/yTqVMnUCStpHtDMovj7XxZeo8oX+V+U0F38
         pj3VIt3xVjC/mXZDBVU5qTIbrtuu8tTeKHmqpLLosmUX6LXtVS5hf6zu5KP7oFGYBSV2
         75oTPKGJJitYYQe5vBI0Qpp5oRqYdUuuclX0tzLxl4lzofx8sE+eEJN1T5SNdiLMfZO2
         +WsQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9mm8OPGp6djeA8XFXjBOLo+JFlZrMNQbXoK4uk5Fy3NQdcXJ+TLfCDlCSkxWoCjBfTq7ZE0B+Ex4A@vger.kernel.org
X-Gm-Message-State: AOJu0YxMdQMLdnIe/RP8trdX7b7C+bgk8Gjzftcztmodgrqw1XfGLOsj
	4L7zaEStxl5bb16r4p4NIl9sL1JAa//wxnh0n8gVhx+w8no9mCrCxE0OXEaBT7rFoeoUZd7bZF8
	B3jRuNgArXl+FOHs3S3XuK0OAca4=
X-Google-Smtp-Source: AGHT+IGKmBFNaEkcmhZ8YrD4EIPSLBbxT8Mfphie51yJuPOU/MbjddiyRHp6dTacol6ihmyMquhDCEQ7QMM60RXHmFE=
X-Received: by 2002:a17:907:847:b0:a7a:ab1a:2d71 with SMTP id
 a640c23a62f3a-a866f8a54f8mr15491166b.59.1724186626921; Tue, 20 Aug 2024
 13:43:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
In-Reply-To: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 20 Aug 2024 23:43:10 +0300
Message-ID: <CAHp75VeDa1xvK1=mOwMaxvuFQo1B9g2ENUZQtmOdDfNV6zv-Yw@mail.gmail.com>
Subject: Re: pca953x: Probing too early
To: Fabio Estevam <festevam@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 11:05=E2=80=AFPM Fabio Estevam <festevam@gmail.com>=
 wrote:
>
> Hi,
>
> I am seeing an issue with the PCA935X driver in 6.6.41 and
> 6.11.0-rc4-next-20240820.
>
> The pca953x is getting probed before its I2C parent (i2c-2):
>
> [    1.872917] pca953x 2-0020: supply vcc not found, using dummy regulato=
r
> [    1.889195] pca953x 2-0020: using no AI
> [    1.893260] pca953x 2-0020: failed writing register
> [    1.898258] pca953x 2-0020: probe with driver pca953x failed with erro=
r -11
> [    1.905575] i2c i2c-2: IMX I2C adapter registered
>
> This problem is seen on a custom imx8mp board.
> I am not able to reproduce it on an imx8mm-evk.
>
> If I select the pca953x as a module or insert a delay inside its
> probe() function, it probes successfully.
>
> The drivers/gpio/gpio-pca953x.c has the following comments:
>
> /* register after i2c postcore initcall and before
>  * subsys initcalls that may rely on these GPIOs
>  */
> subsys_initcall(pca953x_init);
>
> but it seems this is not happening.
>
> I have also tried to register it like this:
>
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -1369,21 +1369,7 @@ static struct i2c_driver pca953x_driver =3D {
>         .remove         =3D pca953x_remove,
>         .id_table       =3D pca953x_id,
>  };
> -
> -static int __init pca953x_init(void)
> -{
> -       return i2c_add_driver(&pca953x_driver);
> -}
> -/* register after i2c postcore initcall and before
> - * subsys initcalls that may rely on these GPIOs
> - */
> -subsys_initcall(pca953x_init);
> -
> -static void __exit pca953x_exit(void)
> -{
> -       i2c_del_driver(&pca953x_driver);
> -}
> -module_exit(pca953x_exit);
> +module_i2c_driver(pca953x_driver);
> )
>
> but this did not help either.
>
> Does anyone have any suggestions on how to fix this problem when the
> pca953x driver is built-in?

So, it should return deferred probe when adapter is not available?
At least this is how we solve such an issue in ACPI case. I believe
you are talking DT here?

--=20
With Best Regards,
Andy Shevchenko

