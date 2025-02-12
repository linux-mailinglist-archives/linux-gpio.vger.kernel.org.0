Return-Path: <linux-gpio+bounces-15872-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F77A32AE2
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 16:57:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 107C4188D64B
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 15:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ED57253B49;
	Wed, 12 Feb 2025 15:49:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C950F271814;
	Wed, 12 Feb 2025 15:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739375364; cv=none; b=HIGdxbajNCORJ+vYuITro3zrqYvSEPF/Oz/zSK0JTmQP483QyuKBlDwf5m20TjKld92G0V5AvyTo2VsOK8yUTvTJ/8/JzZofsfdYli1ZBRmv0OMIuokkANJ4QSyVm49gQQ4nFVMcOcFg0husrF9Pg2tLiWZB1Z4qLqmXBIx/wH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739375364; c=relaxed/simple;
	bh=ZYb25KYfw2P0BGhQV+uuhhL05dEUG6c5vP2hzj2tUFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o6rtqvSIlAQ+HrERVdqTClN33fk12A+bd6OaYIe3yMkRQnfg1+y86YcrkRevdL/XU6G3eD306c3o7icA0kpfNy7Khb3sdObGL0d2w582U8zhP/GkTtwGJkAO20K9+wQinah3fAM5LxwM8DsRyaFLNQczh0xwfPtSgpkQjvAjba0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4bbefec9362so398264137.1;
        Wed, 12 Feb 2025 07:49:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739375360; x=1739980160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdhMIUeQbiUqE75o3CDsfPB27KyZHvKIbaqHUkg+aFM=;
        b=gvntMcj4LaRsO07cXkxGsV4L4IXaJyPHAD5dFpGmKhVnv0/AMEFHs65qWDftpB98N5
         zs3ta1eLYIar1VNrIjA3IwhlDKJ6+BzMWBqXTqbPzEmXnB3q46t+SDVTxHQFNgGkESLV
         VDxejy481A03ZtcOYnOc2KJxWe9LYkDdIVANl/tk9SsoTW7raZfARtVQ58SYpQbAMG14
         ndKP+ma+botp+aDSF7KZOg7kE0Q2STdtptEfKBe9gu3Y+fzEF4r6PH4NmRLmGsocKnLb
         4dVgXfJaG2RPuPRGlhF1nceYaMiNfFDqS1aFHUiZyqdYyHVq2Rg4MB+vHECqUsgBwkCF
         /MoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrHF1vC/Eigm0dhiPsnNw8XEn+bprAeI5wZ5pJ1q/7qaUaqHuFxDJ+bz0NBWrrQwsWtysmzw1H/kHw@vger.kernel.org, AJvYcCVSYFpWmMqSCnGOG/Hd13byhVgCvM7tiNNG/gfM6OTDFtmwfPQ6s5CBiFmwRiXt+8nr2r5/Jbxv6Fnad4To@vger.kernel.org
X-Gm-Message-State: AOJu0YwW396lEu5hKB4g2CkpBSo4xWlV2GGcfHNyna1O7uasKyd3u4MM
	kQmFKXd8f2v8nvfQGJWMUDym3p1B2Kn0+WlHeypZ72wQ00/lyeQzPgOdZV+MW0U=
X-Gm-Gg: ASbGnctobVT+okOx5dAru/gPb4KoNNlV4+YjQ1ENs1YCdVP2yv6Qq8k7IXLewW7P3Cv
	2dUN7wYilygyf7ATX7uYbLym/AbxNcpFfBysqIq6dEKggkINnQRW/RCt8ajSHP7oR0MhFN+pvpx
	H//Ae0ua5GS9yivlz3f0VnPApDZPJvKu71zgpvhY0O7y4aMYWLETv5Rql2ujaJMyRpfvDzQ4e+w
	EabYyr43Pq7T4/cqzU/i7eEGJo+9a65MJcQ3Gmlc4GgzUjCLRCjoZHF8MhVn4Jb2I9JrWea8Lf7
	cNdfGJv1Qdqh+RH6635vcAB8bDUXXZ1pP56zTb/5Cgo0+2jv3G1eMw==
X-Google-Smtp-Source: AGHT+IHxjNeXYHO/TESLn6/+lP4SNRO4bJlI25tPHOGWd/RtsWE2l1h+Xo8F6I9hHNqv6rfSWOZbng==
X-Received: by 2002:a05:6102:3751:b0:4bb:e2a1:183e with SMTP id ada2fe7eead31-4bbf22df22dmr3535914137.18.1739375360470;
        Wed, 12 Feb 2025 07:49:20 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ba76ebe373sm2418189137.12.2025.02.12.07.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 07:49:19 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-866e924f735so1968162241.2;
        Wed, 12 Feb 2025 07:49:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV17y4RXKJWF7GgJosW1oe+q98bP2HSYBjSXK1CsafneZn79tLFvkAF4TDQPegnBxma8ICrw9r+1SSd@vger.kernel.org, AJvYcCXDocyd1TXX/STPMQyp7iixpt88W/C33hW/qY2s9/veFfVyswljlq3v0tSqMNm7Rr7EQ6eCrufk4qIvR5aN@vger.kernel.org
X-Received: by 2002:a05:6122:65a2:b0:515:4b68:c37f with SMTP id
 71dfb90a1353d-52067cfe3b1mr3462313e0c.6.1739375359679; Wed, 12 Feb 2025
 07:49:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203031213.399914-1-koichiro.den@canonical.com>
 <20250203031213.399914-10-koichiro.den@canonical.com> <CAMRc=Meb633zVgemPSeNtnm8oJmk=njcr2CQQbD5UJd=tBC5Zg@mail.gmail.com>
In-Reply-To: <CAMRc=Meb633zVgemPSeNtnm8oJmk=njcr2CQQbD5UJd=tBC5Zg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Feb 2025 16:49:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU24x9pxEjBHTKxySxwr-L+iKXSUNFxpM9hvaSTNAWDuQ@mail.gmail.com>
X-Gm-Features: AWEUYZmpWWmZOz-tU2hYiwfvYtFQ4il4iVmshwrei97TcpDUFUcWtvxe_jjHHOw
Message-ID: <CAMuHMdU24x9pxEjBHTKxySxwr-L+iKXSUNFxpM9hvaSTNAWDuQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] gpio: aggregator: cancel deferred probe for
 devices created via configfs
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Koichiro Den <koichiro.den@canonical.com>, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Tue, 4 Feb 2025 at 14:14, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Mon, Feb 3, 2025 at 4:12=E2=80=AFAM Koichiro Den <koichiro.den@canonic=
al.com> wrote:
> > For aggregators initialized via configfs, write 1 to 'live' waits for
> > probe completion and returns an error if the probe fails, unlike the
> > legacy sysfs interface, which is asynchronous.
> >
> > Since users control the liveness of the aggregator device and might be
> > editting configurations while 'live' is 0, deferred probing is both
> > unnatural and unsafe.
> >
> > Cancel deferred probe for purely configfs-based aggregators when probe
> > fails.
> >
> > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>

> > --- a/drivers/gpio/gpio-aggregator.c
> > +++ b/drivers/gpio/gpio-aggregator.c
> > @@ -1313,7 +1313,6 @@ static struct attribute *gpio_aggregator_attrs[] =
=3D {
> >  };
> >  ATTRIBUTE_GROUPS(gpio_aggregator);
> >
> > -
> >  /*
> >   *  GPIO Aggregator platform device
> >   */
> > @@ -1342,8 +1341,22 @@ static int gpio_aggregator_probe(struct platform=
_device *pdev)
> >
> >         for (i =3D 0; i < n; i++) {
> >                 descs[i] =3D devm_gpiod_get_index(dev, NULL, i, GPIOD_A=
SIS);
> > -               if (IS_ERR(descs[i]))
> > +               if (IS_ERR(descs[i])) {
> > +                       /*
> > +                        * Deferred probing is not suitable when the ag=
gregator
> > +                        * is created by userspace. They should just re=
try later
> > +                        * whenever they like. For device creation via =
sysfs,
> > +                        * error is propagated without overriding for b=
ackward
> > +                        * compatibility. .prevent_deferred_probe is ke=
pt unset
> > +                        * for other cases.
> > +                        */
> > +                       if (!init_via_sysfs && !dev_of_node(dev) &&
> > +                           descs[i] =3D=3D ERR_PTR(-EPROBE_DEFER)) {
> > +                               pr_warn("Deferred probe canceled for cr=
eation by userspace.\n");
> > +                               return -ENODEV;
> > +                       }
> >                         return PTR_ERR(descs[i]);
> > +               }
> >         }
> >
> >         features =3D (uintptr_t)device_get_match_data(dev);
>
> Geert, what do you think about making the sysfs interface synchronous
> instead? I would argue it's actually more logical as the user will
> instinctively expect the aggregator to be ready after write() to
> new_device returns.

On one hand, I agree that it would make some scenarios simpler, and
let us propagate an error code to the sysfs writer in case of failure.

On the other hand, it would change user behavior. Currently people can
configure a GPIO aggregator, and load the driver module for the parent
gpiochip later, relying on deferred probing to bring up everything
when it is ready.

I2C's new_device is also synchronous.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

