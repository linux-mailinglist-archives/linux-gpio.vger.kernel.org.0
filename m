Return-Path: <linux-gpio+bounces-1980-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC9B822A89
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 10:50:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1C4D1C23250
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 09:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1A31862A;
	Wed,  3 Jan 2024 09:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZu/o/vB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D956A18E35
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jan 2024 09:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6da4a923b1bso1136939b3a.2
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jan 2024 01:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704275375; x=1704880175; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L8Swz2yIZ/T2u7iElJjdidE/5nYsKtVPHXA9sRYctrg=;
        b=DZu/o/vBCVdGjInbyUhbwpva4AXkxC5ZNTM14CjP+dzLvzaVtQRbJOVRA5MoNT9bjo
         jFJzSbEGV3+6Xqtr1alKlusqJ5W6YTlqPKTr6BPEN9a4+03gmhG2K2Wa6OFtAkauIBAc
         pvNklAYT+eV2VcpfSk3rwcdgCY/74mEuykcKj27PGwSLFn+0NEFj4ihFmAKBMKYK4imV
         wzf1Ei9pqHh56tnCGEMZvfDYrxS5sURbnRoljtz6wRCg9b14efn3b3kQw8mR2egjxqom
         obVJCvHSUXdbae+TSp3cVj25JxmaOOu0LFElT9x09COygrN6IncKhUwRofOjx4AtzAuW
         1aKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704275375; x=1704880175;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L8Swz2yIZ/T2u7iElJjdidE/5nYsKtVPHXA9sRYctrg=;
        b=f351Dy6o6g14AsHNFNKDPWC0zQ2L3T9qnI0uUW268z7fp9b3gz96P1rJVDgjs3PLoc
         fC7U59QhAP86wE5YXSs3Po+a6d0/MOMhadgLMBCVdU9kp5ueMEQCf6aMNtKdPayDn91m
         Rr6ZrXxySjtQ67HUQx4/bZ6vhxuXPWQs5vuYAAY9YlON+bUQn/L8tSxYS6A+EW5Fi3gL
         Sus3q59JziLbMuOBdqik8Yl12+Te51fp3dV7QSYpHtiMNI6K7Esyl2plQR+Xg2gb0ez/
         uohX2WPKtIWi74j+ce9Br6rC4gKOKFNCX6IGYOlBwa1Vp6zfA/GJihd9iPc1PmIqAWjk
         kaxg==
X-Gm-Message-State: AOJu0YzwgWIUJNAYIADUcWseiQCOXdez995GKFjqzu4Q3mNKM1Io4jef
	1wVd2Shn2KbTdEZDa8N80AQ=
X-Google-Smtp-Source: AGHT+IGCbgvcZEzP5N5Jle1XCM/+LiQByIN65lwK1fJIzetYGHAbDcfLpUgIS8u0prC0ZJYvpczynQ==
X-Received: by 2002:aa7:8185:0:b0:6da:18e8:6f83 with SMTP id g5-20020aa78185000000b006da18e86f83mr3881515pfi.62.1704275375054;
        Wed, 03 Jan 2024 01:49:35 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id k16-20020aa792d0000000b006cbe1bb5e3asm22447691pfa.138.2024.01.03.01.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 01:49:34 -0800 (PST)
Date: Wed, 3 Jan 2024 17:49:31 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Seamus de Mora <seamusdemora@gmail.com>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] Some thoughts following a brief test of libgpiod ver
 2.1
Message-ID: <20240103094931.GA117646@rigel>
References: <CAJ8C1XPiYYeOzbZXcDFR2GX-CoRFuvJim6QVi9-O-oR4mZBauA@mail.gmail.com>
 <20231228092915.GA67274@rigel>
 <CAJ8C1XOP+h9iptC2gB0-6+Loaxr3Ow2MXYUjAxqr_t2EgBmDew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ8C1XOP+h9iptC2gB0-6+Loaxr3Ow2MXYUjAxqr_t2EgBmDew@mail.gmail.com>

On Wed, Jan 03, 2024 at 01:51:53AM -0600, Seamus de Mora wrote:
> On Thu, Dec 28, 2023 at 3:29 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Wed, Dec 27, 2023 at 07:19:54PM -0600, Seamus de Mora wrote:
> > > Hello,
> > >
> > > I've done some testing/evaluation of the 'libgpiod ver 2.1', and I'd
> > > like to share a few thoughts from that experience.
> > > <snip>
>
> > Then you might want to update your kernel - the kernel device driver was
> > changed to support peristing [1].
> >
> > I get this on my Pi4 running bookworm:
> >
> > $ gpioset -t0 GPIO23=0
> > $ gpioinfo GPIO23
> > gpiochip0 23    "GPIO23"                output
> > $ gpioget -a GPIO23
> > "GPIO23"=inactive
> > $ gpioinfo GPIO23
> > gpiochip0 23    "GPIO23"                output
> > $ gpioset -t0 GPIO23=1
> > $ gpioget -a GPIO23
> > "GPIO23"=active
>
> Yes - the device driver on my bulleye is current; that change was
> committed back in 1Q 2023 IIRC...
>
> I hope I've not already asked this, but:
> In ver 1.6.X of libgpiod, gpioset exits immediately, and returns to
> the bash prompt. The GPIO line remains set at the value designated
> after gpioset exits. AIUI, the driver change from 1Q 2023 was
> responsible for this.
>
> In ver 2.1 of libgpiod, gpioset (without options) does not exit. This
> means there is no return to the bash prompt. The GPIO line still
> remains set at the designated value, so there is no change in the
> behavior of the GPIO line between ver 1.6.X and 2.1.
>
> My question is why does the un-optioned gpioset ver 2.1 not exit - as
> it did in ver 1.6.X?
>

You did, and I answered on SE.
But to reiterate; gpioset v1 exited immediately and that caused
confusion when the driver would revert the line to its default state.
That made it look like gpoioset wasn't doing anything or was generating
a glitch.
That results in "gpioset doesn't work" bug reports, and we got tired of
that.
The decision was to make it block by default to make it clearer that you
lose control over the line when it exits.

In short, we changed it because people complained about it, either
explicitly or implicitly.

The -t0 option can be used to emulate the v1 behaviour.

Cheers,
Kent.

