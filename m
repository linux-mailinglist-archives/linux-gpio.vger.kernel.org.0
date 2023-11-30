Return-Path: <linux-gpio+bounces-803-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DFE7FFBA2
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 20:41:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81712281DE5
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 19:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A1152F8C;
	Thu, 30 Nov 2023 19:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QiGhVFca"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EDCA1BD1
	for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 11:41:03 -0800 (PST)
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-4b28a042838so431029e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 11:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701373261; x=1701978061; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gn7QMiHmnBhhrQtWzWviINIVzAQIsTIp5DW2ypi2s40=;
        b=QiGhVFcaw8Dn2A2zW1Sha+D4yBySlstOP7PIN8ehquw3tTVueDlk+yUW0hk2thAtdZ
         h/cTfs4BELrGJanZlV8UN6+xwNEPYdJO+gwmmRZhtCIYhTk5XQmBkV7JGKcJA/y76ZMl
         1896F0YO/314IIVRfQWA/ALnjb5vuzzdNFGecKW/uMnClyQgdKVAYLnqegU/8ik4ItV6
         Kf+hXrrp8J8gMsgMy3n0jarvbZPKnPXcHHMI7Obl0ythMqxv6+zhGz0Mq4pIni+L4cYo
         WhcNwYYuk8pfFdZX/JYlipZ9RKDrgtBd7eYph+7+Cx1BCU8r3GKbFwepX78Q5/fUtxYm
         372Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701373261; x=1701978061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gn7QMiHmnBhhrQtWzWviINIVzAQIsTIp5DW2ypi2s40=;
        b=EJLdONLtKALrOXRyIXxKM45mU4zD3sA5jAElici3a5VZSU3aL4dmKyXSJw1bVHn8CY
         4gGdaJUcoT5MO2TP/VkqiplA0cez9bzbB3C51uda0GvqOP+VigvzgHGiNUmsfqdgBMzP
         OtKQaBNcA+K8DKs9ln8kZziVD874qb9xTcTokL6ODDafwxExvhyiW2nZZpqZU0EsSbcO
         8e9fun4W+RClqW4hsvCcHpk6iF7r8BvU1dYIbicMFJ4lBxqy5DucLeXhkPBZec+1Ex5d
         rfq2ImzWGZ06NyAEnA5buW4PqDU6aEaYh0ZJlUB7oVARmpJK6tqNyCvYA09DGyA4zc9e
         IN8g==
X-Gm-Message-State: AOJu0YxmUkAC09yfUzQXjndMQICG9NGugdaTnBs/6ddvkEwtcEtzC1M9
	9oQvhAB7ZumVYwL23olh4VnwmhVueSzvHkTzmJO+ZQ==
X-Google-Smtp-Source: AGHT+IEUMj926+Pj2U9c1X4FFM4L/vibbx6irF3m7H97aRXN73BRfnXeixzpx16hwX/ZcqoMgnUulXyiok+bqErrHr0=
X-Received: by 2002:a1f:4982:0:b0:4b2:8efa:65df with SMTP id
 w124-20020a1f4982000000b004b28efa65dfmr5392973vka.14.1701373261670; Thu, 30
 Nov 2023 11:41:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130134630.18198-1-brgl@bgdev.pl> <20231130134630.18198-2-brgl@bgdev.pl>
 <ZWi34tkzNsvkCQqi@smile.fi.intel.com> <CAMRc=McLyT9h=VGPwserUgwmXOtNx4k2Za7j8VEwAqu7ChXZzQ@mail.gmail.com>
 <ZWjNr6ae4VPTbuvP@smile.fi.intel.com>
In-Reply-To: <ZWjNr6ae4VPTbuvP@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 30 Nov 2023 20:40:50 +0100
Message-ID: <CAMRc=McXbe9iQVMNjcAQCU6m2apO3qnpbAb6d=HWf7y=7PuzeA@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] gpiolib: provide gpiochip_dup_line_label()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 7:00=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Nov 30, 2023 at 06:48:06PM +0100, Bartosz Golaszewski wrote:
> > On Thu, Nov 30, 2023 at 5:27=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Nov 30, 2023 at 02:46:21PM +0100, Bartosz Golaszewski wrote:
>
> ...
>
> > > > +     char *cpy;
> > >
> > > So, why not naming it fully, i.e. "copy"?
> > >
> >
> > Ekhm... let me quote the BigPinguin :)
> >
> > --
> >
> > C is a Spartan language, and your naming conventions should follow suit=
.
> > Unlike Modula-2 and Pascal programmers, C programmers do not use cute
> > names like ThisVariableIsATemporaryCounter. A C programmer would call t=
hat
> > variable ``tmp``, which is much easier to write, and not the least more
> > difficult to understand.
>
> In contrary the cpy is more difficult to understand.
>
> `git grep -lw cpy` vs. `git grep -lw copy` suggests that my variant
> is preferable (even excluding tools/ and Documentation/).
>

You are a thorough reviewer but man, are you also a bikeshedder. :)

Whatever, let's make it 'copy'.

Bart

> --
> With Best Regards,
> Andy Shevchenko
>
>

