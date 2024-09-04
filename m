Return-Path: <linux-gpio+bounces-9780-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0BF96BADD
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 13:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDE4D1C21CA0
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 11:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C49A81D04AA;
	Wed,  4 Sep 2024 11:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pDrDrzw/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4581CFED1
	for <linux-gpio@vger.kernel.org>; Wed,  4 Sep 2024 11:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725449749; cv=none; b=pquTyKVNEfLK0n2vcn7NIS8P2lGBSce8++3HuYlBOXLD2cBVEXfVGchB2OTV6VIg4cZJSJ6/4qazlPvyVROmO6iWQZOa4Z0gSXxCjaAAJAtrvnxGGmmUTXsJsMt6BBaRDF9afI+gey4ubAet03z0YzWANYOC2wkLujjtC2a8yBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725449749; c=relaxed/simple;
	bh=7rNKf88NM5l3vh10Td2IWy0wFcvPtUeAEA7U3Pml7xs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DmwKAfykCJrmIGKwD9XdjdIKzk54SxJTSIR7jEZ/QflmfrxZ+1Zdep4ij6f/MZOlVc4WpmM0BUeePuYKag2FPUzbDc2xds0xxfCRQyO8ejtQC3RdhSRzgIO7Nf74vAUI2Kijxo1aXSPvnh2NgLfnVFrDD7U47Dzp/aAVx0JfAgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pDrDrzw/; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5333b2fbedaso11326789e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Sep 2024 04:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725449745; x=1726054545; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAHvQQUz+K00R6GEj8AX15NybTTxS95yaSwThdl/7oQ=;
        b=pDrDrzw/tASZr7vROAWCKYj+8w/kkzbApvwu2hA5KCWLsiKtLVokJdLhI7w900xZ5u
         BYGJuXanpUtDPlc9HynnpksUk4hCfB7NiN2zzLwVPXNRadsFRRsvg2Jk8LtqiFbo7U5c
         m6f3xFG4x1vSa3VZt+/VbJGMQqvsIBWbjUwt82C1GI2K4NtgIMEauPrhGj/PsOegWqpN
         qlOEWt+s0anJZ9SarUFYss4gy/tc+JsAgby/waFu5moVMnGLX+N2bh6HE752R7yHK3nG
         IQcuvSmdBjQuJoEeWB3d6iMOd7+wy9zzkY2XXBxQQeLsnH2No21KaZDfSM/HFISYHZIy
         hVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725449745; x=1726054545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vAHvQQUz+K00R6GEj8AX15NybTTxS95yaSwThdl/7oQ=;
        b=ttPhIt8LnEes2oBfyMHBsXCO2EKZV68+iBagnAu4nilDULmgNdYMvhihIqv6W/Q37m
         vPoZ8MBX03z8E2AdWeBEDrRONF5+BwgizwBiwCBMiev3b07T8NNgg/EbMWbVZAWmH/HM
         iD/kIioyWDtfjgD6BhX+UX1EdcK3He9viUPtLMcijdPCFcL0QdRDDUSevX11++LT2hCX
         JH1g9mlC0jiy+gk2+X4Sy+GEi0nllNqAxCvnfyCw8WgKtH11i2TiRGEXrPWX/xSn3jqb
         N6e8hMdeRChJ994flEFJeSGSutOeKfoIGVUnhStfzIVk1CFVeMmzxN0I/hTJkfFRoV4e
         X9hA==
X-Forwarded-Encrypted: i=1; AJvYcCX8Va2JAkxeamZZKL8pgWWSUyglrmUJ8su89K/SbsB9EO33ws19rQ7maqO6kk51eSfc0kDH+uO1XGYi@vger.kernel.org
X-Gm-Message-State: AOJu0YwJhD88WOkRp8UZSywYV4PB2DgWPCr9LaNTU9o+YJrF8zG3vuzU
	1GlXLQi6K44wLQKKeeTJAPztNU49cRMnb2HvxalCNpY9BHqIFzROYAPlRsj5JqoJ2Ar7tAYpDvW
	t+KotHC2upkmBOoI4Iud6VgSZDGqiQS0jyjtypUjI1F/raHD5
X-Google-Smtp-Source: AGHT+IFQ/aidxLnarZrrK2xPjVbh7BFEZqyHd1Qh2llpWO9FheUnf7oXZzE7LzA0sD9filJH4EcjBSvFlb87HufNfK4=
X-Received: by 2002:a05:6512:2211:b0:534:3cdc:dbef with SMTP id
 2adb3069b0e04-53546b8d6d5mr10966032e87.43.1725449744669; Wed, 04 Sep 2024
 04:35:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903095357.27998-1-brgl@bgdev.pl> <20240904112902.GA199607@rigel>
In-Reply-To: <20240904112902.GA199607@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 4 Sep 2024 13:35:33 +0200
Message-ID: <CAMRc=MfHB93emD3GvU4T2ZpGkCppCZGQvR2aEGkaee+-HkXjAw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] build: imply --enable-bindings-glib for --enable-dbus
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Douglas Silva <doug.hs@proton.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 1:29=E2=80=AFPM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> On Tue, Sep 03, 2024 at 11:53:57AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > GLib bindings are required to build the D-Bus daemon. Enable them
> > automatically if --enable-dbus is passed to configure.
> >
> > Fixes: a5ab76da1e0a ("dbus: add the D-Bus daemon, command-line client a=
nd tests")
> > Reported-by: Douglas Silva <doug.hs@proton.me>
> > Suggested-by: Kent Gibson <warthog618@gmail.com>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This does not work for me.
> Using both --enable-dbus and --enable-bindings-glib works, but only
> specifying --enable-dbus results in:
>
> make[3]: Entering directory '/home/dev/libgpiod/dbus/lib'
>   GEN      generated-gpiodbus.c
> make  all-am
> make[4]: Entering directory '/home/dev/libgpiod/dbus/lib'
>   CC       libgpiodbus_la-generated-gpiodbus.lo
> In file included from generated-gpiodbus.c:13:
> generated-gpiodbus.h:12:10: fatal error: gio/gio.h: No such file or direc=
tory
>    12 | #include <gio/gio.h>
>       |          ^~~~~~~~~~~
> compilation terminated.
>
> It isn't propagating the glib dependency that populates the
> GLIB_CFLAGS and so the include paths.
>
> That is on Debian testing, btw.
>

Hmm, weird, I remember testing this as the first thing but it doesn't
work indeed. Maybe I had a dirty build dir. I'll look into it.

Bart

