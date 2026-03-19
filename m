Return-Path: <linux-gpio+bounces-33812-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YItTG6Htu2liqQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33812-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 13:35:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B9F2CB354
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 13:35:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17899305D1EB
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 12:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E0134402B;
	Thu, 19 Mar 2026 12:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHFP6AJ/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FD234DCC4
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 12:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773923629; cv=pass; b=sqoiFtutqA+SWLIZdT4qm5HVvYLZ0sOyveuEHvRPr5eE0PF3RNNHBgwXgQ3aF0hQEEnLFacRStd0IpZds9o7XK8kCaMx2eNiAauhbCBgZMhgNm8fx5VfvrJeKVhHIiK9XZHsmq2fi4w3JatK9NsEttzp3FDL8J7wheHhk9Bmqco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773923629; c=relaxed/simple;
	bh=rahPFhXoJKojrJ+t/AQj+3fUZpSmFo9M0nxP0t0dnUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hrqFIxqSEdq5R6QySqBO18LrsI2dUJmWOE3ubmTBwRimZK0/D8OlFIdkh9YhE+jR2f+xvUcgg4Ki0HwWgyXRZI1G8TeU62DqxNfx3cYjBgZIsHLOWglET3MC5wcXcKX6bmy4kSPcYqg9Mvl8BKMk/2U2LT7OQceJaLINgINZ3o0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHFP6AJ/; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64e87a81639so1057295d50.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 05:33:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773923627; cv=none;
        d=google.com; s=arc-20240605;
        b=HD1NtP9t4KBHVJrGau3Sa3ffR2rwvwVzjU8xcvjfkn9NTmuFA0xUxIqZ3w0RRtCMCB
         TSL9uWG8PiKYctX1dIirGpJMeR/lmBG+YKTJ7hcdyyI04qK1mSsgGCT5DrJsqT4Z6hot
         r4+quEaNZtx1wp+BJfJrQMbIaPc2TyavF6Bgmu+rXzlHBsCVKCqLLKQEA7deLpmg1HiP
         m4WhM7bu/VdmtTkDcImUFVgKQX8Rj75fHpyrdt5sjtdosxtcXYG39K+fJjmoXUohitIX
         t7PiK8nv6XBzP3xHNpLISoqbLnAJP30jucJYkZm8FoEiByjafvBnE2zfMfelc9YzA5MD
         hg9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rahPFhXoJKojrJ+t/AQj+3fUZpSmFo9M0nxP0t0dnUE=;
        fh=yrWZy3NKZSo/mWDQAA6PWzfyhWZwYNTTf4ebPsyoTsM=;
        b=UltpwFlNnn2H1JGVmWjECu217zuvTl5/MOUQI/REtECJoNH/R4uepmYlCZc6f1H16Z
         sRgXZ9k/JOOiipdD28CArMlrirUCLjXKVMSrF5gI/I2D2aENfHDS2kYsiFWI3NiIcOvJ
         LISFysjquF2thw1D/ZRf4LVaNVpwg2tTOZhtkK2HbLNXheH7NjxQCQwEt0d8A7eJhH1a
         g9x/74rylKt4FJaD0Mk3wKpx4bSoTDrjBtz9eSHHtU0dn1J/dtnZToNz+fj86YpFjWJ3
         EbzwpkFacVWzcV6oG9/Wrsp+bcu+W7wcvtTHjr1JlFHkKdNJvIMi6P7YGo1laHtLQJEn
         5FmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773923627; x=1774528427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rahPFhXoJKojrJ+t/AQj+3fUZpSmFo9M0nxP0t0dnUE=;
        b=UHFP6AJ/TugGhJ8q8s+tVOZOWnFL6rSNekg5HK2GRX/lGLdzVMjT5xHh/ySm7x1pES
         j2qRgqWDWrn7HTXxcH+L+BzY8ZqcGNygMi7SL3Rw6LLcfPR4xDDxkaGZoSuO+9rLf5dj
         ogoy1vqlp4Z8sh6ZoT7Mmw0Ng8kvfeNCoFF1kDOTwSbUs3ZedRHJW0/WbWoDJyjim55Y
         P/jf805+d9JGinzjlK7JqnrFXnPkGSdqVSol7juoFhxaRC2DGUn36mG7bI5H4R/Mwe4R
         UVWuhpOSXZxt1rchnGlYfu5HPiOEcMxHr/8n8G3AIFVnQD0lQvG7ZzQlRzDLW+ZTI1Rv
         3QXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773923627; x=1774528427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rahPFhXoJKojrJ+t/AQj+3fUZpSmFo9M0nxP0t0dnUE=;
        b=KQDfmHS4rrdyCW5btJq2mKvJF52jSp5cPYo9RIwmU/XKvSX6YVQk+YOqp69Gbe2Mp/
         LozlV7Qk0iIB+AN+RdqxmpyTdNisbjuz3++snjv73lFCT1nMOUtIYIiRHyLhUM1CXRax
         tE6FfsKhU3MXmTSDoJPbEJ2VArwsqFDg4WPwq8Tzu4eY0HauRfZRZijNXZDZVBe58avX
         oLLKs5xKbrpI5YTcDau6z6MttWblONJbnisi9CCOn930vY0/dOLnKIpbsOQjvsnj8DDM
         hYguKL8JVg4qpT+CL7D6U9CgBn38eYB563/XFj0Bad3fQguuRbUFvQyYI3WPkQyFu8jj
         6eOA==
X-Forwarded-Encrypted: i=1; AJvYcCWcnHhMevonb5yijkBHmOUE014VCL8Ba/dJaG4bHUeTnaQRcUK3pezGU2oinQYA29IOAKSMiaYDm3ri@vger.kernel.org
X-Gm-Message-State: AOJu0YzIrogzzuh7Aqk6QP+I3W035LXlCVXYZx/fFojbq98eXy5RcudB
	1QC6a2csJ4HVZjBmXqALhiVvuUp4l5vwPRUeX+6XwjRMB16OhpXp8UtqjKKOKr0zTEI97t6De6c
	fWSScpFys+NL+QhVY1iGAbn0C2y0Cgc0=
X-Gm-Gg: ATEYQzxRhbkdMbWIFEcGOhT9iHtc9+Zl2nHXdqP6rB0l2shzYkSjJYOnHvCC61C+ij3
	H9FmoEVAwIny73h+ui61hP6lY+Lngj9bDWL3zA5TzFUDKv22kdw/CgsY28vwuvcc728xtDBQ+uZ
	oR60qeXM4C9PY2uNi4Eu4nwSraHr4LWQseuMb9Dk2/9L6Nz8fmjC8iLC4CRD3IbSdMsL5J7Ltft
	ghVtaWWBtYRAHne19kT6v4TIfIf1I6jfla5CvVsQGtprUWbbp0r3oaw7IhWn6s3LQgz5dLpiZjt
	6hi8
X-Received: by 2002:a05:690e:4148:b0:64e:a87b:4084 with SMTP id
 956f58d0204a3-64ea87b42f1mr54461d50.9.1773923626684; Thu, 19 Mar 2026
 05:33:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318-gpio-scx200-header-v1-1-626688284f17@oss.qualcomm.com>
 <997e3ff4-c394-4fbe-9371-272220ab2aa0@app.fastmail.com> <CAMRc=McS6eojWDMY2MvuRtHNqYD=FGCSc4hOBhWQ=hAEk9Td4g@mail.gmail.com>
In-Reply-To: <CAMRc=McS6eojWDMY2MvuRtHNqYD=FGCSc4hOBhWQ=hAEk9Td4g@mail.gmail.com>
From: jim.cromie@gmail.com
Date: Thu, 19 Mar 2026 06:33:20 -0600
X-Gm-Features: AaiRm522GxGxlZUpHWOnYBINehFbMNmusJuJGcG6rdPfxf0Kqc-2n3ihHKvdAZI
Message-ID: <CAJfuBxztAe3vzzviGH3QJnhU7F68ecrafTLUoaR4BMskMp__3Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: scx200: move the header under linux/gpio/
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chris Boot <bootc@bootc.net>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33812-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.929];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,arndb.de:email,qualcomm.com:email]
X-Rspamd-Queue-Id: C4B9F2CB354
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 3:13=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Wed, Mar 18, 2026 at 3:25=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wro=
te:
> >
> > On Wed, Mar 18, 2026, at 14:48, Bartosz Golaszewski wrote:
> > > Headers exposing symbols specific to individual GPIO drivers should a=
ll
> > > live under linux/gpio/ for consistency. scx200_gpio.h is currently a
> > > top-level header directly under linux/. Move it and update all users.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.=
com>
> > > ---
> > > With Acks from relevant maintainers, I can take it through the GPIO
> > > tree.
> >
> > No objections to the change, but I'd point out that while this is a
> > driver for gpio registers, it's not a gpiolib driver but rather a
> > custom chardev with ioctl interface.
> >
>
> Yeah I wasn't sure if we consider linux/gpio/ as a GPIOLIB directory
> or just GPIO in general. I figured it may as well be the latter.
>
> Bart
>
> > Since the chip was never as popular as the separate geode/cs553x
> > ones, I wonder if there are any users left, maybe Jim has an idea.
> >

I have no idea either way.
I still have the HW, but its been unplugged for years
dusting it off has been on the list, but way down.

> > If there are users, they might be able to use drivers/gpio/gpio-cs5535.=
c
> > instead, but I have not checked if the two are compatible.
> >

