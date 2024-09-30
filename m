Return-Path: <linux-gpio+bounces-10547-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03529989B4B
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 09:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B317E1F240A8
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 07:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9863F1547E1;
	Mon, 30 Sep 2024 07:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tl8zES5m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1D6154433
	for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 07:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727680864; cv=none; b=BQ/fxK4lVfqxvljF320PAH8DXFwSnqmneN/b5NkZZi3EnycnadlSF466PJZSdzAt42U+k/ucvg8rildj/tQ9fNoWNpRE44ehjqIYZm3nJRJOtPa1iryktAmHJs/BESZf/qnk2V4xS8O7rz3CblTokiLzH3qxDFVkwp6Ykibl9w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727680864; c=relaxed/simple;
	bh=uC1bGFbEyGnI6peNkcbnxCX7JCDxAYzla0brkJrjWb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WwxuoXJrIBRzQrFrKPGQJRCvRCeWBIaxYrgwQ77m3/LmLToIiEnHWQTiSATRJ6fqaEBojBdc/ZH09+nVDblNfN2K78xnzOn22FMNgk0PLu4S7NSRiUeI4yRUhB49GaqcEEmdQdX7skqJ1hx5ibMbXdgY/FSSEU3m42uzQDlkm4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tl8zES5m; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5399675e14cso461010e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 00:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727680860; x=1728285660; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uC1bGFbEyGnI6peNkcbnxCX7JCDxAYzla0brkJrjWb4=;
        b=tl8zES5m1tUmKIF/UezgVfAqn5GotsDOH9Uwg34ZLcBHbjMmvATPnrfp5pkZanPJNy
         18JQt7uAT5nisIggVnvyEFMll7mP86RdMjeozldL0q0z1RTXBwrrGBZGeIJ7FDUTIzbY
         iHzZxjf9MSCZizIOu9MbxG9aCwMNErvDesoAgxSq7LzBGUqvx36u9nJlvvcFroJ09GSa
         uQLaicQIiAA74BOc2ZnOW8jEUa4lh6FW/RvCv7JcK2fMHbbYiuFUGvBev6UBgGnItnHq
         RdmeukKSMoaXliGCwahO/f9aAEHXYz1ZbS60/bwv1GXTkHZ8n1bS205OB8IK4uoGZMg1
         wzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727680860; x=1728285660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uC1bGFbEyGnI6peNkcbnxCX7JCDxAYzla0brkJrjWb4=;
        b=UdtZJCt30WLkaXbyi11V9UaqKkdsdZgYQ8LLbM9XBUPvImb3uGApkGNpQlSPiWzpdP
         CeBLiBD7flmRjXw0aO/31gXMPodxR+uUEYvYumFzr2DnYLFFCE5tECBGugovVxscdcOH
         BoDYJhSp15Sf41AYr3ykP82EZeCtxTWi2pcvdedK6ujSG16esJ/gKB1PLPR0Lbu0N0ZV
         Gk2SawWGo3mhu2lu7lK2qLo8X7vvK8Y75WsoI+dYsST93gMQySKqyJKJRLKuRKxqUiH7
         zS/w7tEu3D/zMvCxX5yIG2xVeWNXCOXhBe5NMdPWYF5rstT8qVckPv22Qw++3bkaV5uN
         Q3rw==
X-Forwarded-Encrypted: i=1; AJvYcCWavfPGHKtPERYZmFSlGhbvRpdfHXC2VHmU21sTeG8fHVwc1OEqPPINdL2Kss1YuB6+Eq+aqWwngT01@vger.kernel.org
X-Gm-Message-State: AOJu0YxxnhOwJgRFMEXd1iVt9895mu+pVg8U7nsEBa47Wum59Jk+XPfR
	89EHxauTmTkde9pwbyVi9rHChEp8EZB83PS2+BsYgqeBK9UGvoDIvLiChcw8nOKOCaoYHRhOU5P
	4yOl3st1mHUP4yfRLpFDKbLeH2WQ3odsgCvmvKQ==
X-Google-Smtp-Source: AGHT+IFYFzyZZpqPm4CvKXnMmyZwmoxgOyu+OoTeGQ6Dn/BNHK2mrDp78kiFddScwnepG5KcZ+KBLeZop1D54hXqbns=
X-Received: by 2002:a05:6512:1155:b0:533:4820:275a with SMTP id
 2adb3069b0e04-5389fc6cb88mr5500517e87.52.1727680859993; Mon, 30 Sep 2024
 00:20:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927074221.9985-1-brgl@bgdev.pl> <20240930010334.GA6286@rigel>
In-Reply-To: <20240930010334.GA6286@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 30 Sep 2024 09:20:48 +0200
Message-ID: <CAMRc=Mdt8+ATGVU19E+pRrMhKZTcO49HTPdboHLLeN_Omd6LoQ@mail.gmail.com>
Subject: Re: [RFC PATCH] gpio: sysfs: make the sysfs export behavior consistent
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 3:03=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> > I decided to write a sysfs-to-libgpiod compatibility layer based on
> > FUSE. Since Rust is hard, I started prototyping the thing in python
> > first to at least have the logic nailed down before I tackle the rust
> > part.
> >
>
> Something along these lines[1]?
>
> Cheers,
> Kent.
>
> [1]https://dev.to/krjakbrjak/simulating-gpio-sysfs-interface-with-fuse-an=
d-c-30ga
>

Well, this doesn't really do anything. I'm thinking about something
consuming the libgpiod rust bindings to actually be a useful
replacement for kernel sysfs.

The master plan is: provide a drop-in user-space replacement for
sysfs, make users convert to using it instead of the real thing,
eventually remove sysfs from the kernel and then some time after
remove the compatibility layer from existence forcing everybody to now
move to pure libgpiod. :)

Bart

