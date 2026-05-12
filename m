Return-Path: <linux-gpio+bounces-36697-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJ25LCqKA2pN7AEAu9opvQ
	(envelope-from <linux-gpio+bounces-36697-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 22:14:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C52D528FF0
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 22:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C35B730A6740
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 20:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4286B3AC0C1;
	Tue, 12 May 2026 20:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pL88q/UJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C553AC0DC
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 20:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778616843; cv=pass; b=ibUBspga4ft+r7dly+cBNi3yyUU8RjQiHhNQReG3E2Rab7tRp59Rpq2AoYhCg5NC96LXLm0dYNUBBT1gdfZJsVCqA9DmeT6M4pXxMNgF8DtYlMsms9lvoenIV8qY2z3fE4BJMkvTq1C4NDABCP7S9XzpuT5lYgU5TIbLz+YbIW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778616843; c=relaxed/simple;
	bh=aw73wrlsT9ay/mNTPbpByGZ+dtyGQl7PfwCRhoX2vyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=da1JU7SlnuXyRYm2MGfZSuc4G7mD1FmTR/zi5xKkP7XqV5SEEvDtf4vNUVJNm+1tbnuZo/+WdD063lP2myDLv/kuF5/Snt8GHg1+lJ5qGjfRjsH8Z/hzJMpyZuKtYi2hQYWcMF5AeWQhYk6YjP/g/vsmiVjZtd0O8tJm6yb5pO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pL88q/UJ; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-67c4aaf76ecso9310763a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 13:14:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778616840; cv=none;
        d=google.com; s=arc-20240605;
        b=Qx/ivRZ62uH97q1g7aGcW7DQ/0PlzVh4jguY3Zlb7C3G5MjH/I6dl1JBBLjMbTeas7
         q5CXZc7xmWpnkhtGYSlWigAmRtijJbxWHwc8scrd+o+R5B5zdA/U9Y5sud3wWb70+KHC
         fPFtCTQRFTKAzRgfc96IhS/LC2Yy2IkKYni4HkmvW6R9fXKUA5bEG2sU0Ud/BSXpzl5B
         PYM7grDa7rSmsBbv5e2k4SbczmajECGZTtD+GtHb2+2AR3yQEKFuJBQAaZ7O9iMi355K
         7TzDD0RtA1VvejZeW43Vxl8vaj6Tu6xA0wKNy4fCx1seQMckX1zTM6ePy6Dke+JLJNxN
         HhtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CdYjIIJuX5fr70Sxdo/ccQur00O9l14SS6MC5vYG7jo=;
        fh=x0+qdUHO7df5XP6qtcLAaXCuXewNm4Z9D+5CNSgIOBg=;
        b=d8tBisudnPEe0FbujYPo4UjxnQYO23yx0lfV11euCLjDWFi0sz5hBRYeDGC3XM441S
         Yh/gxnoUOSJnY3udyIH+zii1te6JVJg0Y4RTIWdDx2kQ/MXDW56psBItr0WpWU68+M/N
         CbYPUNPEVN7H2xVDjXIaxoU0rSyTcuv7hs9Pf88ye1hf8+jyhT+ocBM9pE6WhVJlbn24
         KcHpantxkM0pdqsiMw6HLT0YC6M4PC/hurjqbrmgDqe5ipqucHIyFXt0sEHWjxprOCMS
         Y3nIx83NJLW8NTIejT/RIrNbJY3LBMqRaiYIjj5trHGOIMzzDigM3qrxgHrtPOVSTuOk
         eIeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778616840; x=1779221640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdYjIIJuX5fr70Sxdo/ccQur00O9l14SS6MC5vYG7jo=;
        b=pL88q/UJd43j3bqSqXwGqggwXy5+vz7iBlwm1vW+YSvZSqDCpdmEEBHoLneAzfsSlT
         qIqw8qgEBaotRy1xcrHlPGfizGPN+YOpg2Fq0xoWZVO3Dk0fdO/qughl3KUkET9kHhNv
         Vx+dmcrx/p5mkX/03lXRoJdklj6xBgXsbE7gXorTX1gR1ohFY7naYziZruaPwBC7ylet
         //NtzVx6fa9w1pK78bFPHWkAu6aRdbYeovDZRTq71SwmWAUCaLD5cSB2dGq/uF2CB3wl
         vZhD4LXSMGY0lInZP2bNPo6CsTACBCEiVyzJBDUaaQvvfdoGOdeSa6NTk3b1EC1wr2kV
         mwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778616840; x=1779221640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CdYjIIJuX5fr70Sxdo/ccQur00O9l14SS6MC5vYG7jo=;
        b=OgFNZ34UOOg9kMEsdG4RfcNKV9byYHsCCvnwHeTlQlbKrUeiQG4bdnzwy5KFXRBoms
         Ta5XyXIqozEXl3jtGc45hRngRjCAJ5G1agIni3BhIFQTC3OabQ1MHYLzdJ7PEmB+6LPd
         UkcY063Ihdjjn/oo+9pEdXTUQZp/Rx5eyFWBf3MeFXVKRcfm4L6+6Bnc+WnEEE4Vap1b
         ZSQ0iiKDIcNUpQmSJY4kGF6l4LtdT5Y10Yi42e7whpop3+wHhLuF/VT2GioxGZjvHO7z
         ADlmnsNE/dd/+1T9ZA0XS+ktOMfPOIpA9mHI5ts2sV6q2gYJ4J36vMpP015oQMt2+hji
         2qZA==
X-Forwarded-Encrypted: i=1; AFNElJ8QtuEOMonGHF6Ts4D4/aqjQvOabWbLGyD4gg4V8aHgO25lLQuLKAY9il/Roymlafwh2eDXCEsCrmjh@vger.kernel.org
X-Gm-Message-State: AOJu0YzNRIFoiNW73pI0U8FT0tzmvZKmC3kzii4Yw4p62H9SjGTE2RTI
	zikCmlgLUsUfb51/uFVVn3vhGY8ENtlEEs3r+OSLLHE/oNPqBAnyUxLWCli6plaH9d3djpno5yb
	dg2TWah/exMvnlMwbH4xYxumEwmalWXo=
X-Gm-Gg: Acq92OHRh07zkHP456Vv/7CbaO8LJhWM6NMFcfbUIIcZofvwsSVli0w7ftZKNcaqg4H
	ozqZPlSeLIZM4ZMtJtKlssv3DPMj8djB154DXgq66WE9y4hOvxANpyPL2dRAeN5sXnAEOAQpl+b
	yKlq/n7jLzWW0NNcbMm8qyrxphqYJLDCu6yYf/1SQy1mL+2UAXud0QxI1AiN/A5xf49d2mEeXTd
	qIbrmBEcIwMFlqJTqwciVDneGVQQIDubtMizj/2AN0MaUrRUKe8OOeotXLys8CZNTOoMKjtGqaS
	t3chnfI4sEHD06zDasPWqIrZ/Kgsz5muJeBs4jxX1zu6bsmpSlXVreGxSxDRPsmjYsM6q2rJKuc
	ZuZBiW6BwmceX9B00JPbn5WsQacvga0Q9k+iAFMdBwgbHKWtU+84xNQZLPSXfuR9/rbbs
X-Received: by 2002:aa7:c403:0:b0:67b:7d77:14da with SMTP id
 4fb4d7f45d1cf-682558f09b7mr127673a12.8.1778616839575; Tue, 12 May 2026
 13:13:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260509003327.955942-1-rosenp@gmail.com> <CAMRc=MfwDx8RTwaJb48ta=gppJGNwfXMOMNiNvQoRa9ibUh60w@mail.gmail.com>
In-Reply-To: <CAMRc=MfwDx8RTwaJb48ta=gppJGNwfXMOMNiNvQoRa9ibUh60w@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 12 May 2026 13:13:47 -0700
X-Gm-Features: AVHnY4KIcweIsFs1__LMQ5JPb-kIJnCjK_nHRWwFViSB2kG-QHGPVeam3sXQfm4
Message-ID: <CAKxU2N_XgMqc6tSzEFCrZhoWBwv-Xb+fn7O+Jfg0gVN0sQkKjg@mail.gmail.com>
Subject: Re: [PATCH] gpio: sodaville: allow COMPILE_TEST builds
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6C52D528FF0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36697-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,lkml];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 3:15=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Sat, 9 May 2026 02:33:27 +0200, Rosen Penev <rosenp@gmail.com> said:
> > The Intel Sodaville GPIO driver uses PCI/MMIO and generic GPIO helpers,=
 and
> > builds outside X86.  Move its Kconfig entry out of the X86-only port-I/=
O
> > menu and allow it to be selected with COMPILE_TEST.
> >
> > Tested with:
> > make LLVM=3D1 ARCH=3Dloongarch drivers/gpio/gpio-sodaville.o
> >
> > Assisted-by: Codex:GPT-5.5
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/gpio/Kconfig | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index f8e34b16fd99..9e1ed0f451b9 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -1908,16 +1908,16 @@ config GPIO_RDC321X
> >         Support for the RDC R321x SoC GPIOs over southbridge
> >         PCI configuration space.
> >
> > +endmenu
> > +
> >  config GPIO_SODAVILLE
> >       bool "Intel Sodaville GPIO support"
> > -     depends on X86 && OF
> > +     depends on (X86 || COMPILE_TEST) && OF
> >       select GPIO_GENERIC
> >       select GENERIC_IRQ_CHIP
> >       help
> >         Say Y here to support Intel Sodaville GPIO.
> >
> > -endmenu
> > -
> >  menu "SPI GPIO expanders"
> >       depends on SPI_MASTER
> >
> > --
> > 2.54.0
> >
> >
>
> I don't mind it but I'll wait for an Ack from Intel GPIO maintainers.
This commit was slop. Will redo.
>
> Bart

