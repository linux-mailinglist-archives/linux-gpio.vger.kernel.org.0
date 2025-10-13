Return-Path: <linux-gpio+bounces-27007-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EE4BD2561
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 11:42:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E19A93497CE
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 09:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3472FE047;
	Mon, 13 Oct 2025 09:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Xe7fN3zu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B524926290
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 09:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760348519; cv=none; b=qeZHD9J7b/NGFMyHrxGUHNTXOgKx5MLdzA3/Mva5pzAJmHp6QiXO3MDCnCRQ+vQx4BEU6yPzk2F250ZgtzQsp6ZTcxrpgA/DhHSnE/nvrgfk1nYuGUmCLltjNQ+q38jLIYAh7dHROzAGGYFab9mb6GAkVPUMsJy2RmJRnK8HQ8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760348519; c=relaxed/simple;
	bh=7OS6r0QXUdcNugcyHhSXlvIAJ1AcOpyHg7bGDGAZEH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IuGXcdOqklOlR55F2ybRr8QkvpNh4U93jNGP9EPkCaZsd5WWEdzH3RijiM08B6TQSJACaIlH3VWx4qVy2BSsiLZis1wJRdYIFAKWqFvUJzg1LKND/uZ/4pW6rBEQMf8H4i/ManlTt6NFkPwCKLVi/mvGHQKzYtO/o4v2OyocLKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Xe7fN3zu; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-57b7c83cc78so4031902e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 02:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760348516; x=1760953316; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kzyn5HR4B+RyFj646ROarW3G5ceUJxiCmvsRF8Iv79k=;
        b=Xe7fN3zuenFQemPe1dDbIEgxV4gatd567o8sEtWNzxmpS/WHeyhZVXnR6ML8/WPi4A
         1Nf+JYOBMJE3HzPteaLRNsiqC6yOTXEp0if6yRl9iCKLYh4JyDBrFkjyWCVcVlub0fh6
         XN8pLnTOc1QYTdpz3XVhTYoDinAO/pUoi+ED3i1qGHgVtgzUxPkaq2FdpTa+4DLmtOz5
         6YgfgH9JdG9hg3dkklLTK38wMJKjpfgEJnhR5XktB4/VqkfVs9gSCJe0gj8WLSMz4SIt
         ddbBhm7DmCt156KGorlPJ4uT7lJUaWsc+SZeZsPfl3kK3ctg4Cexrmj+KewGkZwAGmPv
         f4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760348516; x=1760953316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kzyn5HR4B+RyFj646ROarW3G5ceUJxiCmvsRF8Iv79k=;
        b=NZw/pGl/CFvZDFkAnEralkNg4kTV2+BHzUUsVepCj+JTvlqzp44D5exvlpTf+Wd+Xd
         BOY0JZ9dCeqJmCqWWPaSXRV1ESLbvr9T/8cJIO059eDsheUlLWGbpzyC0aHgHx9sWGmC
         teBbVJkkiL3AXDhZy0zfTuZ4uTq8USi2TaHTcMITqK9IALhCAEhP83Fm3TDGXU/LUIoc
         wMwHhcQngM21qyhWUcC9n7KenyHU/9IqlLPlaeKRU1NbS8PDYq9rIlTLw9aZoXkMr+ku
         IisXezuU6YseeiYeWuTR/ESrpH418qu9Vywu0IWHA8HtItGg3cYi71XyAm48LAKh2O4S
         iQhw==
X-Forwarded-Encrypted: i=1; AJvYcCXrpmBofyFIPAOGbpVN4IbLVSgJQjAqVWPrisFGfhYeMR3Xn4Xx+O5ReGRWgIAyN0w9nT2TX8/3pqVz@vger.kernel.org
X-Gm-Message-State: AOJu0YycvlsnQKHUKlCmji2Tn2kRBfLwSWaJP/9YmW401vC0JqFxXSuV
	eDyJBK2zUdj9h2r4ubSVD+uGsms1Ui5cafd6k0c8+wyXcORjJamldmhG3NPqm9o+bEIELXAGccP
	6nanowy4/jmfPVSmKpGeCD0iyWRhuEucyUxsx+G18tQ==
X-Gm-Gg: ASbGncsnVUX6yI7TmXzWoicih+u6jUir6YK8bfXM9p5OI7Y/ORu3SVCZ8Vi3aPj8sWR
	h3RiYVDsS8jtde3rFZI2qDCNcQE5dkE/xcGJJOtUSyZ9zdjTqncleemCOC9UclVVOLwCC+2StIO
	aEYbqSCqT7bnaeKiP1a7TeTKzO/kzIJuN6/ZuBC/Or/nU51ETs3TQpxf2w8fr0S6irtaWG+J/0k
	zMWDopNk8mA4enE5QCVjphRQmSqXykOTp8vUKa2+uMdA7KZ9KZyWSQKYg==
X-Google-Smtp-Source: AGHT+IEo2A2Q2VJMSBIH17uG06uyhaJ8OWT77uhilmx6FtBE+5N5iob0Ed/oF7xMbtYrws+KR2BR//E+D1FZ0z6K/go=
X-Received: by 2002:a05:6512:224d:b0:57d:cdb4:5b94 with SMTP id
 2adb3069b0e04-5905e2024e5mr7442241e87.11.1760348515946; Mon, 13 Oct 2025
 02:41:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010105338.664564-1-vaibhavgupta40@gmail.com>
 <202510110924.dUQeeRV6-lkp@intel.com> <20251011122612.4fa7c97a@barney> <aOpAO7j0Uyo6FPcu@gmail.com>
In-Reply-To: <aOpAO7j0Uyo6FPcu@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 13 Oct 2025 11:41:43 +0200
X-Gm-Features: AS18NWAxbYdqmNzUcHN6qByywYTVDrUPwmo1A34-f5zcgyydo35rhG25EAcst_4
Message-ID: <CAMRc=Me2ABQUXVeHyfsDR-etyT9mdX-kqxfQDnh3msfZiS6ccQ@mail.gmail.com>
Subject: Re: [PATCH v1] driver: gpio-bt8xx: use generic PCI PM
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: =?UTF-8?Q?Michael_B=C3=BCsch?= <mb@bues.ch>, 
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Bjorn Helgaas <helgaas@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 11, 2025 at 1:32=E2=80=AFPM Vaibhav Gupta <vaibhavgupta40@gmail=
.com> wrote:
>
> On Sat, Oct 11, 2025 at 12:26:12PM +0200, Michael B=C3=BCsch wrote:
> > On Sat, 11 Oct 2025 09:43:54 +0800
> > kernel test robot <lkp@intel.com> wrote:
> >
> > > Hi Vaibhav,
> > >
> > > kernel test robot noticed the following build errors:
> >
> > >    drivers/gpio/gpio-bt8xx.c: In function 'bt8xxgpio_suspend':
> > > >> drivers/gpio/gpio-bt8xx.c:233:19: error: 'struct bt8xxgpio' has no=
 member named 'saved_outen'
> > >      233 |                 bg->saved_outen =3D bgread(BT848_GPIO_OUT_=
EN);
> > >          |                   ^~
> >
> >
> > It looks like the
> > #ifdef CONFIG_PM
> > must be removed from struct bt8xxgpio definition.
> >
> > --
> > Michael B=C3=BCsch
> > https://bues.ch/
>
> Hello Michael,
>
> Ah yes, this macro somehow got overlooked by me. I will send a v2.
> Thanks for the review!
>
> Regards,
> Vaibhav

While at it: the subject should be: "gpio: bt8xx: ..."

Bart

