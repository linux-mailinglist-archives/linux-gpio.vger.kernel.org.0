Return-Path: <linux-gpio+bounces-2176-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A5D82C34F
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 17:08:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85B09286884
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 16:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB2E173164;
	Fri, 12 Jan 2024 16:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xMXeuC+M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E261373167
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 16:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-4b857733f9aso1415490e0c.2
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 08:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705075673; x=1705680473; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XZNRasipIcJbjq6DqoiB2wRh9aOHz8WeVp8gaKPKz8=;
        b=xMXeuC+MIZVTe/39uN/T/efEqMZl6+kEZHzsAeAKKP+eqFrsJPiHSNAf2k+Z3qIjpI
         zvNRqil41LjreGzvJbUDI5pM79rgdwU9Ui9McWTSe2GACYHkCW7DgOrqVrQpAj+hroVM
         S/8HVRjG4RpNVSV0EB3v7b1sO3MUOhxO7tUQ7jymveDqaCFlyem/nPGtTTcIumFbC0zl
         ky5tJw1Wwc3NjSzZBWeiEu1536ndpI+iMtnW5ZTGtezp0frEJlTX8UNyJusTy57xMU4V
         mDl0Koj0423gc7G0/ObifXNiyhPu6xj/xUn6HAZgBwPzgE9pL/anvNknZLirYzbFmg6N
         4Vbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705075673; x=1705680473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9XZNRasipIcJbjq6DqoiB2wRh9aOHz8WeVp8gaKPKz8=;
        b=HB/S7AR2pkTMj24Gwlg9597uYONlYdBSOYJcsCJhC04ia9q/2nCLR4eMBRj1D56xaq
         qmbyM2YQyq82raUshZi7893lCWbUiaaMfvZUAcGQbvV/rpLxyHyIpVIrPAex9S9i63Ox
         qUILXFCjP5Tna3Wop16CUD2uAq3PSJkUFZUlQwPa2wwX02F6zTGU1v4LMZ3idkwbvX2O
         sQ2fQcmOQ5n87Icdejs5A+DEaOJR7RfbGnCJcUJY0DyAfQRzLSYzhL76lVQ+7yTkdXZl
         tPGye7tHre1L10/PyVaXZksthOURzKfip26L7pPhGBRn3ObFqZFrYAgyi3Ss0O+o1Dsc
         1RGQ==
X-Gm-Message-State: AOJu0YwSMv8DEMwlZqa1wS83/Es5NhPVfjJ9D0sPT6Np+pcULi8+kzQG
	Qfl0D1peeAj0oLw9bh/clkTOeEu6HS2uS9nnNL+zNv/fdRz2dA==
X-Google-Smtp-Source: AGHT+IHHkDX4Q7Wz7IDBrgFDZhhocqLmklrvDfzaaieDwrM6C0SaZulLdD/nMCxUSojwoAtT0+aaR1sVjDrUwAypjfE=
X-Received: by 2002:a05:6122:1150:b0:4b6:e096:806 with SMTP id
 p16-20020a056122115000b004b6e0960806mr1244388vko.12.1705075673655; Fri, 12
 Jan 2024 08:07:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240112150546.13891-1-brgl@bgdev.pl> <20240112152502.GA92656@rigel>
 <20240112154030.GA94712@rigel>
In-Reply-To: <20240112154030.GA94712@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 12 Jan 2024 17:07:42 +0100
Message-ID: <CAMRc=Mc0dLkjnOrM2QdVkOhnXccHv6hFu0WPEuL31hGLKkJpbw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] README: add info about the github page
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Phil Howard <phil@gadgetoid.com>, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 4:40=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Fri, Jan 12, 2024 at 11:25:02PM +0800, Kent Gibson wrote:
> > On Fri, Jan 12, 2024 at 04:05:46PM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > The github page over at https://github.com/brgl/libgpiod has been reo=
pened
> > > for bug reports and discussions. Add a link and a mention to the READ=
ME
> > > file.
> > >
> >
> > No problem with the patch, but the github page itself seems to have
> > Issues and Discussions disabled.  And the Wiki might be useful too?
> >
>
> The Releases section could use updating - it lists the latest as v0.3
> from June 2017!
>

I don't want to do releases on github. The right place to fetch the
releases from is kernel.org[1] (I should add this link to README too)
and I don't want to duplicate release tarballs. I'm pretty sure people
would start fetching releases from github for distros etc.

Bart

> And unless you intend to handle everything that lands there yourself you
> might want to add some of us as collaborators, with appropriate permissio=
ns
> for what you would like us to help out with.
>
> Cheers,
> Kent.

[1] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/

