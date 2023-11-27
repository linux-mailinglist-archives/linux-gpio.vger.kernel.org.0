Return-Path: <linux-gpio+bounces-537-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5978E7FAA89
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Nov 2023 20:44:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECF97281A24
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Nov 2023 19:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E6A405C9;
	Mon, 27 Nov 2023 19:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FEPqbSMk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 443B9F4
	for <linux-gpio@vger.kernel.org>; Mon, 27 Nov 2023 11:44:47 -0800 (PST)
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-7c43ca1b178so1250845241.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Nov 2023 11:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701114286; x=1701719086; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BeXFsw6k+b1yqi2ijxZf9CyVKX0PO75Po1++MiTzYuY=;
        b=FEPqbSMkLCWlHExazb8l3du43DCyK6IikRz+A4Wlja32mB1HEnRSGk5FcavHkBuJsK
         HP9tf3WVB/k11+pCOXGpG4+J9e2qgHoq9Dmu18qjoq3d3DDjkYSgyOcxQSF0WVXlzBeX
         XdfOJBbRUZSs0VqW2euyJS99CHeyBsNxvM3r0JOKWNLnP4yPut86v/PzaPt37kaH+TPG
         VtOtu2VlRYovQl8rlqPxgkvV9IqZoCEGWKGyNFSj63ZhkSlXmB4t119gqIlnrMFjbY6H
         GSVVyKWqKj/ZoJQcdwYRGLf78mWwQGZjzc894cWC4sYXNI0m5Ej4iWOIdb3v5DTMBMhx
         UzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701114286; x=1701719086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BeXFsw6k+b1yqi2ijxZf9CyVKX0PO75Po1++MiTzYuY=;
        b=iJwZ7SdojVcoJgrFNUw5yVtKI+rDftoIUmArK91AQlLcWiZ4X75g+LDKsykTCmI2rE
         NMOySxQiVKnKgf9maJOsWWhKZE4YFRGdwiaHPSNgUDsuoxKC/nVO4ekRet5dSZrVYZrW
         mTgPLUq21iwUW/nUTySycvB3Kb60hCG1FikFvBV+sMplHFDO53TYLhsEAT/O7fQXNqrn
         glz4/iRxNMAMAZbeqvuxX7itipVuAPgbFBXAZqasaO1iTVIt2shmJpj8UbiZnqsSsZY+
         /hNkujvTuIfXOhY/SUeyblqpqdIF2vGfNejrombTPZyXrr6krB+BnEncGMHPjmS4rRvc
         9cMQ==
X-Gm-Message-State: AOJu0YzxCfk8OWS+q2sEmxMgYpSIL3uOcotbuI8741f0mF1psvXrnvML
	WbZPlgcE3zqeDwbvk//6x4uIB6DaCwIw8RuFU4yKFg==
X-Google-Smtp-Source: AGHT+IGannuDIadBjq3LGczrA0Sy8LurXgG8Aq3ZjMevxPLTGPiM9CIMnc1BAsuKhetFgU9SiKLYYnJ29NUmisBPVQI=
X-Received: by 2002:a67:cd0d:0:b0:462:83ac:e6bf with SMTP id
 u13-20020a67cd0d000000b0046283ace6bfmr11630637vsl.30.1701114286325; Mon, 27
 Nov 2023 11:44:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231125-dropcomment-v1-1-15800415aae0@linaro.org>
 <ZWFepm7ufLdl115j@rigel> <CACRpkdZvwePEaRVQLafD8KmiOENgEGFFDBXGPqS5_WLzNi2_yA@mail.gmail.com>
 <ZWKNyFOU65IHND1k@rigel>
In-Reply-To: <ZWKNyFOU65IHND1k@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 Nov 2023 20:44:35 +0100
Message-ID: <CAMRc=Mfv=kgk0mdT5aVmB9VmhCBvyjr3zq2Xdrk0QY9T53ybjQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Drop cargo-culted comment
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 26, 2023 at 1:14=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Sun, Nov 26, 2023 at 12:05:08AM +0100, Linus Walleij wrote:
> > On Sat, Nov 25, 2023 at 3:40=E2=80=AFAM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > > On Sat, Nov 25, 2023 at 12:25:47AM +0100, Linus Walleij wrote:
> >
> > > > -/* gpio_lock prevents conflicts during gpio_desc[] table updates.
> > > > - * While any GPIO is requested, its gpio_chip is not removable;
> > > > - * each GPIO's "requested" flag serves as a lock and refcount.
> > > > - */
> > >
> > > Perhaps provide a comment as to what the gpio_lock DOES cover?
> >
> > Normally yes, but Bartosz just said he is going to replace this spinloc=
k
> > with a mutex so it's better if he adds it then.
> >
>
> If that is happening soon then leave it to Bart to change both the
> comment and lock.
>
> If not, then we now have an undocumented lock.  If the coverage of the
> spinlock and proposed mutex are the same why not describe what the lock
> covers now?  Then Bart wont have to update the comment.
>
> Cheers,
> Kent.
>

Yeah, I think we should maybe leave some temporary FIXME comment once
the mutex patch is in saying this must go as well but it'll take more
time because the problem is quite tricky.

Bart

