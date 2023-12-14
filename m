Return-Path: <linux-gpio+bounces-1444-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A165812BDB
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 10:40:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4152B20CF7
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 09:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723472FC5A;
	Thu, 14 Dec 2023 09:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Z04AwDsX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 718DB10C
	for <linux-gpio@vger.kernel.org>; Thu, 14 Dec 2023 01:40:38 -0800 (PST)
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-4b2c2e77777so2161925e0c.2
        for <linux-gpio@vger.kernel.org>; Thu, 14 Dec 2023 01:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702546837; x=1703151637; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdaVZVYnYeQOiEs5xQZ/aME71d5T9TRS2cRXJbz9OzI=;
        b=Z04AwDsXS2DLvcErL/s5f0v5AKqhNeA20bUlFX+DuUlIZ4WVLnfKWa+q/8Kz8NG2cn
         pHGlQkLmw+1iE8sEBEfUZJjxM/0jZ4Y7LPHGP7qFMJzC44ixqEXkEEbNBPupr5nVeK8U
         ltU1ykW5HKKuJcob+PNJn0Ax889LGILAeSb7BnBrU5hEtFE+CjTjeWxMzKr6Iehj/t/Y
         sK/p5TJaDa9WwbyXWvVD4wz78qYXo3LFOnCxVadJ8PY4KiToHBkpsipOwJ15tgArL454
         LFphXP12ZlGoAvu3bZYWroCYJg+GjqrypWfxBKAww1bKzwWi9Lg8g6nUcKrMBlM5/22S
         wBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702546837; x=1703151637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NdaVZVYnYeQOiEs5xQZ/aME71d5T9TRS2cRXJbz9OzI=;
        b=TT23a5AMqahNnOiHEYKlQWWgd5+wx1ynh1lKLIlspDZI0dzO3WYqTf0nKWVyNXjthf
         XS14SO18+c10E7dioebpmpCPaeEE0gL9bPLEorVlA5w/sbk1LQ9yqw8YvzcvqBarG8+y
         7ANEz7ufx7oERFuPY3dRc48RHLRtChG4flbSq43xr2Aq3AroOFVZy6SyCf7LUOiLZmFB
         GKbsew4ZUtA0ng+r5azOlaH7y5XP3LRkeGzKPxuPoHN6MHZV66en3uwMAF1eQ3pKWDlX
         +CGFwsz/KNoFHFVzYwpk+W5rA+gSmei/9nQgFgskcHuysAQkogHlvP3d5b0p+wpCewAg
         m6ww==
X-Gm-Message-State: AOJu0Yyru01lzMUMUja5d9slMofUdyiXCcf4STRUlKje7938EGMymsah
	sJjw4Z3a0JICt32trfUiX5r6JUWQl3RraXJIkR1UIg==
X-Google-Smtp-Source: AGHT+IGZq5rJhUCqBnslm+4oKVQDWly4syWw/KzYFHCO/NyKaF+WrXN5yqJAb7UuR4cmKFlK1da29q0Fk9+wrzXGSak=
X-Received: by 2002:a05:6102:4746:b0:464:8ba6:2a66 with SMTP id
 ej6-20020a056102474600b004648ba62a66mr5927212vsb.31.1702546837567; Thu, 14
 Dec 2023 01:40:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZXm3rayrcvfO1t1Z@smile.fi.intel.com> <ZXm_WsIpgIyOUNHt@rigel>
 <CAMRc=Mfri8K4ZqcHb_eQY6gi+q_-uBZc2wiMrrb-+a7Tric3FA@mail.gmail.com>
 <ZXnU3tMYCc2Rw8Qv@rigel> <ZXnX8jPHxRLW8lhi@smile.fi.intel.com>
 <CAMRc=Mfj_4YvQVP=UWkULBwJniDDjapttU+qSgqfN5ZWNgikKw@mail.gmail.com>
 <ZXnb-ks_noYLWZZ2@smile.fi.intel.com> <CAMRc=MfaHKKKNkXW0L1FPjCH4VvG22Vn9q8z9tupZCtCEKZU2g@mail.gmail.com>
 <ZXoO8B0N3S49GnvX@smile.fi.intel.com> <ZXpJueTnmtUIecCd@rigel> <ZXplMThBSD53UV0s@rigel>
In-Reply-To: <ZXplMThBSD53UV0s@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 14 Dec 2023 10:40:26 +0100
Message-ID: <CAMRc=MeZg0xg7ASA3x4PxCYymCmCEp0zZbUgGTCCzrjPaPZCag@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpiolib: cdev: relocate debounce_period_us from
 struct gpio_desc
To: Kent Gibson <warthog618@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 3:15=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Thu, Dec 14, 2023 at 08:18:01AM +0800, Kent Gibson wrote:
> > On Wed, Dec 13, 2023 at 10:07:12PM +0200, Andy Shevchenko wrote:
> > > On Wed, Dec 13, 2023 at 08:03:44PM +0100, Bartosz Golaszewski wrote:
> > >
> > > ...
> > >
> > > > > - it adds complications for no benefit
> >
> > It provides a placeholder for collective documentation and clarifies
> > scope for the reader.
>
> Turns out kernel-doc can't deal with a struct variable declaration - it
> needs the struct to be named.
>
> So this doesn't parse:
>
> static struct {
>         struct rb_root tree;
>         spinlock_t lock;
> } supinfo;
>
> but this does:
>
> static struct supinfo {
>         struct rb_root tree;
>         spinlock_t lock;
> } supinfo;
>
> at which point I prefer the separate struct and var declarations as per
> the patch.
>
> Opinions?
>

Yeah, don't make it a kernel doc. It's a private structure, no need to
expose documentation for it in docs. Just use a regular comment - say
what it is and why it's here.

Bart

> Cheers,
> Kent.
>

