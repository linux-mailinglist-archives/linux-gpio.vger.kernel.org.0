Return-Path: <linux-gpio+bounces-17426-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC88BA5C273
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 14:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7EBC3B1F6E
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 13:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B909D1BB6BA;
	Tue, 11 Mar 2025 13:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XPi+u4lk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA778192D96
	for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 13:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741699311; cv=none; b=KaHuDc0QPOuSqPKVPWoE1tIM6DopBdfpSE9FHH+oETVmds7LkP7ev6OrFYjNMlto4qRJkuF+yNqNkhAHx7kc6lHbJthVaE5JjwpO38HcCkn9yeT3LF9CVJ1+MGbnDfmCHhgJLIbZathGPyO+Lz+abVnmqtld1TwT3x9sL7NBeo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741699311; c=relaxed/simple;
	bh=Qd07Q4VGPkFidTJBRui/iWcevj6QeWcKXSoFsfCfUnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQ+dfQOONRaH8HS10GcHtNc2M4EzsrtabBNIuCsKkCgfbWhHE2rirZO9H888z385IsA/z3J0BUT5UuI14Su6viVnOuiiYOgzqcY0BLp9smcqaQnLPXiJLZJmrqQVnys9RbNLCvRuCmrBi17TrIwvJzT9aaXduS3XUiOmQchxDcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XPi+u4lk; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-548409cd2a8so5264241e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 06:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741699308; x=1742304108; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qd07Q4VGPkFidTJBRui/iWcevj6QeWcKXSoFsfCfUnc=;
        b=XPi+u4lk27GEgdRxJCB9vu8EWp7aKd69bCV4J/ECSl8Ddp2etEmJLue7jFnwkElMev
         v6j4GuHlb7BsQjMyHMkVrOqQHNY1merU84Wq3dZoT1Qw0HU1cPMRA+3bsaMacqserH0Q
         v+Buk9Atz4GpVaLslNr7kRtG/o1BxmNdmRwA0SrW4Y8Ox/vw0K0lKoNzHhvewc6hQtlq
         myf3NbeM1zz4UKq+0yNoOQBdm4MH4gvKJiPNk0IgR/G2GJo4ndppHJ0GG2UzF4kqaZ0G
         By/LYVVBJscVPNRIAmojW1zuIgbEMX9jGBBdmtp70rm3rda6xPAMdI/XNZlcdZ0YD0kl
         kapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741699308; x=1742304108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qd07Q4VGPkFidTJBRui/iWcevj6QeWcKXSoFsfCfUnc=;
        b=DrUObScPLH3O3viDZDXhkR+sIolV4ENy+tIgHX1CCd3WL5qWi4EfTHPS7T2g3IsApb
         qv8iITmBYxjT8oPaYnp2abAsHbJjYoyzrpRYqdZeCTY/bSlHrv1aCmqbsGappi7alKOE
         DgLgvQkpaTOQEtrb23lQ84b2/o6LN+Dn1GcIpIcLcnDO9RB/5EjbrXaAW9cocYpr8DA/
         1ahvVlMkKFPGxXzmiz1GWFZM0VpO03usmO0hFo5vBhFOVGVd0oOIy2SEKwtjtQ/quP/c
         twGL8ASJs8r/Z9a9gulTD4WtIrV+i2WEYOnu69zcCdT54XMO6rRofQogSmMtUxxDw3+f
         dLiw==
X-Forwarded-Encrypted: i=1; AJvYcCWRe+JrX/5DKGd18t1OJcK1oojkC6kVnR/47WesgRfKBoolDJXFoZn91C4O/1W5yVpjFscHhlWSzHeO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2V4L9qaa5vgeRW+G50jbAHe41DmEM7/CZDP4fUEbIS1GhA24p
	nKWyB7hCGwY0LWh68CJ8kTE2n68oNg8aQMe1lExiESb1Qd9HY6tgrmKo4FCB5oa5XLEtE1uR6N7
	4uXYWOVpCXW7FSTBgQR7YYuWG3BCv8j1jTDWA4g==
X-Gm-Gg: ASbGncukZBNTlVLNFvRX3tIcSTJE7XEG4j7JPFDYHFOeCg6A96W/rC1fKCcrmahLO16
	mUtCxOobgpgK3tWlNBG2i5nWHNsBsfA067pJ72qE9QOJ7wWjv6cKx9XmjU6uz7ToM+DNieEOOlA
	vCG7FZtCXGM+MBY8hcS7xGx6Qrs6PPuaJ9JmWsvWmVWUEdQAAP5vVwW55n
X-Google-Smtp-Source: AGHT+IFfdhddh1gHpzqLS8IWLTpedfRgy013YVoiUYXZPF94QYiG23Y1yOKbxXbCrswWfXfhwXoVw/1pv2z+tdow0S8=
X-Received: by 2002:a05:6512:39c7:b0:542:28b4:23ad with SMTP id
 2adb3069b0e04-54990e5da4dmr7596422e87.16.1741699308040; Tue, 11 Mar 2025
 06:21:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311110034.53959031@erd003.prtnl> <CAMRc=MewC-7XFfWxPS7cmMycxo-62NDrUKFyjnnCbwqXQXWuZw@mail.gmail.com>
 <20250311133010.760abd61@erd003.prtnl>
In-Reply-To: <20250311133010.760abd61@erd003.prtnl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Mar 2025 14:21:37 +0100
X-Gm-Features: AQ5f1JqUOVL3X2gCgcmbpAbT0fy5j2-XGgHTJB1Eycy9onj9r36vOwUAw_3p1l0
Message-ID: <CAMRc=McLEtiF4tfGpOGW+agA8-BK_qU6UWjvq1BOgthWXXym3A@mail.gmail.com>
Subject: Re: regression: gpiolib: switch the line state notifier to atomic
 unexpected impact on performance
To: David Jander <david@protonic.nl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 1:30=E2=80=AFPM David Jander <david@protonic.nl> wr=
ote:
>
> On Tue, 11 Mar 2025 12:45:51 +0100
> Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> > On Tue, Mar 11, 2025 at 11:01=E2=80=AFAM David Jander <david@protonic.n=
l> wrote:
> > >
> > > On kernel 6.13, after git revert -n fcc8b637c542 time is back to what=
 it was
> > > on 6.12.
> > >
> >
> > Interestingly: I cannot reproduce it. Obviously gpiofind doesn't exist
> > in libgpiod v2 but I'm running gpiodetect with and without reverting
> > these changes and am getting roughly the same results: ~0.050s real
> > time for 1 up to 4 chips.
> >
> > Any idea why that could be? Can you reproduce it with libgpiod v2 (I
> > don't know why that wouldn't be the case but worth double checking).
>
>
> Can you describe your platform? Is it a multi-core or single-core CPU? Wh=
at
> RCU implementation does it use? Tree or tiny? If it is multi-core, is the=
re a
> difference if you disable all but one core?
> Maybe some kernel CONFIG option that makes a difference? I am not an expe=
rt in
> RCU (in fact I barely know what it does), so maybe I am missing something=
 that
> makes this problem go away?
>

I'm testing on a qemu VM - SMP and single core. RCU algo is tree. In
any case: I've just sent you an RFT patch that switches to using the
raw notifier. Could you see what results you're getting with it?

Bart

