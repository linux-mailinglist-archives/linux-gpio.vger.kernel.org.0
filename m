Return-Path: <linux-gpio+bounces-6157-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 702AE8BD2EF
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 18:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92D3C1C21045
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 16:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55915156238;
	Mon,  6 May 2024 16:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fFs/K4+2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0126A7868B
	for <linux-gpio@vger.kernel.org>; Mon,  6 May 2024 16:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715013284; cv=none; b=FV90xmHu5ankTF1YMQKKLnCqSx5UcgYDEWazB7p14x+w+ngCP1c6uokdNkJw5CK8uYWTQsIIPl//NKm8CFdCVXxiLCn5ZaUOqG+ZqX7SsGmf3+quEIbq83/1kfbafnjwETzy9/U5oPIunAco4rUlo2C/vLUSukYiPq42gGbrYFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715013284; c=relaxed/simple;
	bh=tKyIj/5JPQZKWiis0c7fnJ/rGG9KUisngK0YUmc1xEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dJgtv5k4zZ0dWzvDJGYzUUVTQV5fcH4SLO8G1/tFM8cKP8AGUZ9X83/v76yNWZnsc5ykmeEcctsAMIQAJNDkHomqDXiAYSOkJJWns7Rl3t42KipMDEIjVyoly1Ia6apwAAGTM0BV//ZQYj06ZNbTiM6hxmHPcpizCDz0m+r4YCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fFs/K4+2; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2e242b1dfd6so24053081fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 May 2024 09:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715013280; x=1715618080; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKW/qTBvbSneNz/X8MFX7g3e+U34AlmsOC5IxVNy+xo=;
        b=fFs/K4+2MkqPTofs5QPM/utNBmecOB8iD1XHuZ/M/dq7O3tvN/jXZwtsi6CXM73UR0
         1ypYnbnaZFRJDnkoGTgLLxD1Kie/j65bGeHC8Fn9WwwqT/g5BOIx67pkEkI3sx0LM388
         T/bhbEa2+SjPZYzu6G+rf5Y/xGHtbLaY8k2wka13M/biBROQ7Ut6vDGaNem5qU/BkJI+
         Mw7pVO0lnEKllyi6YfBe7qDwbEqQ/FurbkbNWRweVMNBbPBBb4sXzuO6xbDA48HdPKEr
         4HqhNPHb9ya1k2vU0BUctKwfn8pjCaCW1ZZihrYSXgPW5xVizby0FP1MoIHIytseenr7
         LxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715013280; x=1715618080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKW/qTBvbSneNz/X8MFX7g3e+U34AlmsOC5IxVNy+xo=;
        b=X3X9VX1lC6tEqMrgeW6bIm979Mkzl8JdEZCA8qLQFGhrebl4lBroZUxrcIEL/elUCc
         cO95MWeiZzTfXBXRFkSQmXvgCjjZZtYutGegrGJNblq8A6ciFn97oCcnwUBBf/gbOZ0E
         OyjKMy18FasGjvi5Jn9DFSxr7JQ4yubFhmTQ9CX706uSFncjc4+Ty2OJjgJbibwjPFwa
         aj/rKUkjfbCA2KSVo+QDqknuzS3oG5xxYB/hcKR0xviR+3PKM+sxdlha6h1Qjj0MxLUk
         atbxZvSsY2v7/unE5zRMz9J9taNBMiBbXKM5OLxWDzkvM/TqmPghNcYSp+tFWQ0lkryf
         fiQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcroLlp3L+N2zKcgoeD8n05c5XZwczi1yLNIpGXW0ntTqJKmjDkj/zPGrqFPtnA0/ICEQpbCIiZhQiNMdhZdALKxwtLQNXdSCuIg==
X-Gm-Message-State: AOJu0YwoGRa4v9aax0nAhI9N5/XIhmYe1SHWKUGtNAhUK/cr9KIsQ1qe
	0hOsSfd+ajhA1Spf0JuE7wkoLvP181cr4azHdcWn2hiiZnVZesG+pLGCh1dJUUQAL+9UAUjcEzd
	BYHa3w25jg+VpgTU4lbtrSJVU6+1TPI4TQK0wJtjeOfkFcICy
X-Google-Smtp-Source: AGHT+IGV+zc4YYIbsUwKPNP5Bg/rwviuEXwJJB+ekZtuIRDcJpEd2P47TXwGCO2HxQU9ZNpDOw3x31J1W+DRGQP5ymc=
X-Received: by 2002:a19:e011:0:b0:51c:b44b:aa75 with SMTP id
 x17-20020a19e011000000b0051cb44baa75mr6125615lfg.26.1715013279735; Mon, 06
 May 2024 09:34:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=Mfig2oooDQYTqo23W3PXSdzhVO4p=G4+P8y1ppBOrkrJQ@mail.gmail.com>
 <2b2eb5f5-af66-4ba3-bab8-c34b680d8715@paulmck-laptop>
In-Reply-To: <2b2eb5f5-af66-4ba3-bab8-c34b680d8715@paulmck-laptop>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 6 May 2024 18:34:27 +0200
Message-ID: <CAMRc=MfnSc1WWg47g-SZqqgEQPUQG-EfHEQxEqvvmRA1ksVnDw@mail.gmail.com>
Subject: Re: Performance regression in GPIOLIB with SRCU when using the
 user-space ABI in a *wrong* way
To: paulmck@kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 3:55=E2=80=AFPM Paul E. McKenney <paulmck@kernel.org=
> wrote:
>
> On Mon, May 06, 2024 at 02:32:57PM +0200, Bartosz Golaszewski wrote:
>>
> > The offending kernel code looks like this:
> >
> >     old =3D rcu_replace_pointer(desc->label, new, 1);
> >     synchronize_srcu(&desc->srcu);
> >     kfree_const(old);
> >
> > I was wondering if we even have to synchronize here? The corresponding
> > read-only sections call srcu_dereference(desc->label, &desc->srcu).
> > Would it be enough to implement kfree_const_rcu() and use it here
> > without synchronizing? Would the read-only users correctly see that
> > last dereferenced address still points to valid memory until they all
> > release the lock and the memory would only then be freed? Is my
> > understanding of kfree_rcu() correct?
>
> It looks like kfree_const() just does a kfree(), so why not use
> call_srcu() to replace the above calls to synchronize_srcu() and
> kfree_const()?
>
> Something like this:
>
>         if (!is_kernel_rodata((unsigned long)(old)))
>                 call_srcu(&desc->srcu, &desc->rh, gpio_cb);
>
> This requires adding an rcu_head field named "rh" to the structure
> referenced by "desc" and creating a gpio_cb() wrapper function:
>
> static void connection_release(struct rcu_head *rhp)
> {
>         struct beats_me *bmp =3D container_of(rhp, struct beats_me, rh);
>
>         kfree(bmp);
> }
>
> I could not find the code, so I don't know what "beats_me" above
> should be replaced with.
>
> Would that work?

Thanks, this looks like a potential solution but something's not clear
for me. What I want to free here is "old". However, its address is a
field in struct beats_me and it's replaced (using
rcu_replace_pointer()) before scheduling the free. When
connection_release() will eventually be called, I think the address
under bmp->label will be the new one? How would I pass some arbitrary
user data to this callback (if at all possible?).

Bart

