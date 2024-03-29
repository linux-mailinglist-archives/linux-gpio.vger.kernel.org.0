Return-Path: <linux-gpio+bounces-4895-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA02A892468
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 20:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 282D11C21BB3
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 19:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EFCD139D04;
	Fri, 29 Mar 2024 19:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Faz4w5jW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1945139CE7
	for <linux-gpio@vger.kernel.org>; Fri, 29 Mar 2024 19:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711741247; cv=none; b=YjhVT3eDrEtVJGmcZYSABcB5y0H76X9AMg9+2MvriuXizi/bWKINPFg3mpUOe9O1jmw5Qp6y6cW0wPjcajpcWxpw8Pt+wuGGdylr5n1kDJmNBkS9L43iDhzx1YO1D7YfA+pPf55N4MGmc+AFHViReoXbw34AXwiUINe7FamIl00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711741247; c=relaxed/simple;
	bh=BOQI1k1tfyqL0tc7+yYdpT34753QIX3JP8lZfbTdaqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oKO6AE8jQOiyC4zbEr2LWWIOuoYnvP7TyqB1KMAmnDD17irjMtgeD6dhy6glOGxvyWXUCpt6v7Vqp5LqhSl89+ZT5dMotpaXmxrllwp/pM7pJZl0tBPaGfi9rMRfHpww/0V4f5VTcFcCfJ51+K0fWbDJ3s6xi5NsGi7CcnrR7wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Faz4w5jW; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-566e869f631so2467633a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 29 Mar 2024 12:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711741244; x=1712346044; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFomKtJ/ko5gP2de8iELQHNaNB6nelyPz/WP1+pjQaI=;
        b=Faz4w5jWb4vlTeLHq2zeBUjatlZtBhxhn7A/gZ3rt9Hg34fTMCdsHshBCfN2Jzsnn6
         v9sx93WcAAxoZIL9dQj4G4fZy1dcZUp0lKjgccfUASv0SG3RbIqRqmwJYSTeIZgB6oog
         3mobsH7ptmzNIDcLpWhcBMCdlYN7TQbpUFFtfwHAUsLpfGoLq9+izUHOQGc+TCU1RccY
         3lzuPS6MTBW+hv2namevOQu98eKSPAb5ogpwl3eh41gxU8/8V8oLMFxLwyCN2bVZ4///
         pKr9JTFSU/F4+Wp8WQQN9QtmIZqZvIHJ/WhK5IaGRS7mXP/fD95ya7aZtjUuH8pqKdj/
         pxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711741244; x=1712346044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iFomKtJ/ko5gP2de8iELQHNaNB6nelyPz/WP1+pjQaI=;
        b=s469oGQnN0REEijBd8pyfiV6jC3yoxg3443GbKtnglbBA5rWf90mPNMElChhQhaEYH
         WROwFFllmf2/QidONIXuPiJswvmfZNhmpAOEvXidoIUFF4Wn0lX30mFdyrrJxa3HpUUe
         5q8uD1toqPwNroTWctUDF0lt0MAsX36beZTS4szJzN0C8D83DfS0KrmIYU0MzrE7NHJD
         P7OV4DDf5n7DJ7vbXWDhYEPEtKQ6Zm52l4VLPv7zlC/b3Qqb4dc9H4T8wAQ0oInbfFbS
         3vJSeyIrjXlszLL/hkAgnJhTnDuMSoQ1ENwvOeXDyI7n+7ubO0oYfnn4dundjN+um0DT
         9O4g==
X-Forwarded-Encrypted: i=1; AJvYcCXWiPFgWfDbqERoQtdFHJlK2/nr/tHlYaKvu+p9GzLOHzgjZwQMxiU1Ql7U6dUml0ornq6v4Z5HZZRIxcEYt1IZHf9edJDSsEyHqw==
X-Gm-Message-State: AOJu0YzRqxcMkkhiJVchGqICANauqHr6K4p5+NZDKDxehve1XWKF5i+5
	dXCyXPqbYKrAJ49sXZAwn2BLYSQZCKOKbL6eZ5NMiLwU9SYyYeAOcXAOTWNYDJPKFA45U4XnEyu
	1XvWutSYnXGeAnQRKIROJHx3i7Vo=
X-Google-Smtp-Source: AGHT+IGEd5TAwHxcVRtd8OO7jcqTvMmHL9Tj1oNs1dYRZsLV0e01+/MQ6GAw59woWU5+V7U+VpgndoJAejiFMZ0RdHI=
X-Received: by 2002:a17:906:1699:b0:a4e:4369:236e with SMTP id
 s25-20020a170906169900b00a4e4369236emr591925ejd.41.1711741243955; Fri, 29 Mar
 2024 12:40:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bdea97a5-93e5-471f-88fc-a3c6ae74970a@hansg.org> <CAMRc=MdM0hNf73jVVd7kSchUVVBXmtQqSwmhNXus4TVovBSeHQ@mail.gmail.com>
In-Reply-To: <CAMRc=MdM0hNf73jVVd7kSchUVVBXmtQqSwmhNXus4TVovBSeHQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 29 Mar 2024 21:40:07 +0200
Message-ID: <CAHp75Vd3qQC6YY1Ysf2EqH9RFHQygX7HXP37Ju5p6BzsD7S3Ug@mail.gmail.com>
Subject: Re: [6.9 gpiolib regression] gpiolib: triggers: kobject: 'gpiochipX'
 is not, initialized, yet kobject_get() errors
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Hans de Goede <hans@hansg.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, Andy Shevchenko <andy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 5:16=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Fri, 29 Mar 2024 15:11:21 +0100, Hans de Goede <hans@hansg.org> said:

...

> Thanks for the report. I hope I'm not being naive here but would the foll=
owing
> one-liner work?
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index ce94e37bcbee..69f365ccbfd8 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1179,7 +1179,7 @@ struct gpio_device *gpio_device_find(const void *da=
ta,
>
>                 gc =3D srcu_dereference(gdev->chip, &gdev->srcu);
>
> -               if (gc && match(gc, data))
> +               if (device_is_registered(&gdev->dev) && gc && match(gc, d=
ata))
>                         return gpio_device_get(gdev);

In case you are going with this approach, wouldn't be better to

  if (!device_is_register(...))
    continue;

  gc =3D ...

?

>         }
>
> This would make gpio_device_find() ignore any GPIO device that's not yet
> registered on the GPIO bus which is almost the last step of the registrat=
ion
> process right before creating the sysfs attributes.

--=20
With Best Regards,
Andy Shevchenko

