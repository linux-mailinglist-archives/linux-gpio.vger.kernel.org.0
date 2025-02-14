Return-Path: <linux-gpio+bounces-15987-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D21EA359FA
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 10:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0512E188EDDB
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 09:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2538022DFB1;
	Fri, 14 Feb 2025 09:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A3O7hXzj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634F722D4E7
	for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 09:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739524512; cv=none; b=gtvRl7bQubblIN9pHPwn4PfwMQgG5RMlvgdJSSlSqvgMFbkx36BVcms0MkI59IflcrHyUht2ZxSJE6eKidViJM+2ccMrKW/QTmv2mwHTlBPHLgeQH6VskIlzFMvNbwYe3E8UVimVbZh2/alIHj6gWFk3ZDtSUejMNXpSh7dcWWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739524512; c=relaxed/simple;
	bh=ZiKhcGMvd/Bw0mcCiPOfs080A5Z3v75UBl4QZlo6HWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uYDfexSB62tmysLy7MkRZD0hHWEFHkVBGOZiK0jxIcLK+LspzFpmCmc70somrq0H7CKeBKs+VbeXNmkmIfIHj8nHhW9GWeciGpnZkAtUPRkgXVg8vwS91wwB6xtwqjOZCKIs/S63ypRZhiL4JXkoFBMAyzAtjiLN7JaTeetPVTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A3O7hXzj; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3061513d353so19604801fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 01:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739524508; x=1740129308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZiKhcGMvd/Bw0mcCiPOfs080A5Z3v75UBl4QZlo6HWY=;
        b=A3O7hXzjDcngCgBm4JZguRacgu5+MpLAfgeL4TS7yUToHr8Q2iEW4t9/FcnXMaKuLp
         QF736a9DWN1qf6IYG69kMH61hKyi0IqXnQotoAwcVGgJqKi7Ch/ad+JXHWcYbLHUDIgk
         rWMnEtRz7yJQ6ddBuJCDJW5m93iWkO885DEVZwZNArcGJP+hP5V5fKUPDlbihc87hMYg
         yK4Xls0wJ5MS+M1Oe1BoM5Jm9SjPyCEMKRTp8XfMxX5N2Fn2WPhttWmTpIYmMZqxIUXp
         KcjJjOPiXuzDleByVURxycyFL1Az7jJ2CqNjoGBlmaYzz3ogNEyscGrmjYcr/aIP7UYv
         FPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739524508; x=1740129308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZiKhcGMvd/Bw0mcCiPOfs080A5Z3v75UBl4QZlo6HWY=;
        b=En9yaRCJVa8nRpUOVCFho2MOgC+lMeAb3ld3bGC/XWz10o9z6N5BEc//GFfNsEeeLk
         ADiMfKTWFT32bpw5ae0PUeTOQNkW84nmGFVpUyQBCmi+1t01TfMH5xjyM+2cRHjPhWJg
         ifUeP+ryT1gCF98eRcmt0Je6wANvrK2nNxYKqjb4xjTM6LnJnSTykMVqmsyUeocsY8z2
         lR7bo/+rYY+wfvFsRdMO+37YkRyFCJpRWT72Za4rNytRFFagOyodAkqi4gNoB27yn2Bg
         O8ySNE+oaBz7nxrmtLlHwCu+O0D+l8YHTjVmAJ4xVYP0lp2rFVCD84z6bpjI0ycz0wqz
         o5bA==
X-Forwarded-Encrypted: i=1; AJvYcCWIQOJwY4vS6S7ZSxPvuLHFcEcKDpI5xyMuz9BoKIIU6dfDaRcsXUvBI4V2nMAACxVrhFeQ5YcohZen@vger.kernel.org
X-Gm-Message-State: AOJu0YzgocAULi6mnKB+C15kTd3BfNngz9aX/yX4IRVug7HOvpYco5/g
	CrMsPKdWJW1d/pFPBEn+nCt2UYNTIhT7QIgpzgTS+CFoHv9RCDzPz1zB23Ezmgc8+erj7ebrVg3
	udr5tG2frhgreDRyOdksJmJoABB27A0iIz0c7DC73rxlhQNpWlNs=
X-Gm-Gg: ASbGncvENB6GLtRIH1Dpll1zquOHgrxCi36ZC0tfrjrAsBvcYPB/i0pN5B7+aw54wj4
	yiMC+N7bAUCYHMirfXC7l3Fy13hKxKeHsjah8LC3Ly4CKek8OCsriWEGDt+81Zwda+KUa+0kV
X-Google-Smtp-Source: AGHT+IEtqp4mABmBvWG5a+on7rco3OTYFaB/UlhFXdqsmSc8+1dkkVnWTBetgEdh+3ocosqLQGGwjp5UiqXVKDpCGTM=
X-Received: by 2002:a05:651c:e01:b0:309:231c:c676 with SMTP id
 38308e7fff4ca-309231cc803mr1536801fa.17.1739524508420; Fri, 14 Feb 2025
 01:15:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com>
In-Reply-To: <CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Feb 2025 10:14:56 +0100
X-Gm-Features: AWEUYZl1nb00HNAL-hFeqSstGUkg7P7SfNLXF8TGNGrQCrz_0Qpk57FS5mPGShs
Message-ID: <CACRpkdZXm9eFJ2nzb5Gsm_ddirt6XZTQyu2G+vX2FB+=L6Lttw@mail.gmail.com>
Subject: Re: Replacing global GPIO numbers in sysfs with hardware offsets
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 2, 2025 at 1:46=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> I think it was Ahmad or Marek who suggested that users aren't really
> attached to the global numbering but to the ease of use of sysfs.
>
> I floated an idea of introducing a backward compatible change to sysfs
> that would allow users to identify GPIOs by the label of their parent
> chip and the hardware offset of the line within that chip (...)
>
> We could then encourage users to switch to using the chip-local
> exports and eventually at least remove the global export/unexport pair
> if we cannot make the entire sysfs class go away.
>
> Please let me know what you think about it?

Yes, I think it is mostly equivalent to what I say in drivers/gpio/TODO,
my only point being that when we add something like this, we
put it in debugfs where it belongs, and as illustrated by your
example, it is indeed used for debugging/exploring the
system:

----------------8<----------------------------8<------------------------
Debugfs in place of sysfs

The old sysfs code that enables simple uses of GPIOs from the
command line is still popular despite the existance of the proper
character device. The reason is that it is simple to use on
root filesystems where you only have a minimal set of tools such
as "cat", "echo" etc.

The old sysfs still need to be strongly deprecated and removed
as it relies on the global GPIO numberspace that assume a strict
order of global GPIO numbers that do not change between boots
and is independent of probe order.

To solve this and provide an ABI that people can use for hacks
and development, implement a debugfs interface to manipulate
GPIO lines that can do everything that sysfs can do today: one
directory per gpiochip and one file entry per line:

/sys/kernel/debug/gpiochip/gpiochip0
/sys/kernel/debug/gpiochip/gpiochip0/gpio0
/sys/kernel/debug/gpiochip/gpiochip0/gpio1
/sys/kernel/debug/gpiochip/gpiochip0/gpio2
/sys/kernel/debug/gpiochip/gpiochip0/gpio3
...
/sys/kernel/debug/gpiochip/gpiochip1
/sys/kernel/debug/gpiochip/gpiochip1/gpio0
/sys/kernel/debug/gpiochip/gpiochip1/gpio1
...

The exact files and design of the debugfs interface can be
discussed but the idea is to provide a low-level access point
for debugging and hacking and to expose all lines without the
need of any exporting. Also provide ample ammunition to shoot
oneself in the foot, because this is debugfs after all.
----------------8<----------------------------8<------------------------

Yours,
Linus Walleij

