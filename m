Return-Path: <linux-gpio+bounces-16179-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF57AA39639
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 09:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A88D71888C62
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 08:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5FE322FF42;
	Tue, 18 Feb 2025 08:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="d6HdmiVZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E0E22FAE1
	for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 08:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739869040; cv=none; b=HAQ48gZG9bHr3qLsifVpoJgPb4AEfTL35D1wL8bNxnCYzoxqWFVpzfnEt6N+0QcE8z81HZoKotOlzUP3vrqmzdSMsSw/zFoD/021O0MYkpFAjnnzMz6LqoADISsGX9g7S2UJQs9oWynzLAgGaimu5u4z8RcLkaLNwm7wXw08uXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739869040; c=relaxed/simple;
	bh=hlErsFV9V7vbfjbxZQu67cLb5ITsC3CKvDimUBSUYxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bK4leQano1vXulRZ0xSDd/+o54Y4A0X2GWv9LD2pXzters3Y3RgqJ+dXDhHnM2AnnmPvQN3CGTFr6/Evx0Q2Pk1vAEl0Y594L2BCEqRxOd/GVRPdQocddqUKB8+gdS8lfamTYbk3p6vhT0xQlew4w3MQYSWmD7jwx+PLN+1kX3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=d6HdmiVZ; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5461a485a72so1850047e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 00:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739869036; x=1740473836; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hlErsFV9V7vbfjbxZQu67cLb5ITsC3CKvDimUBSUYxc=;
        b=d6HdmiVZf4LqzxiA17GacLhqDeoZKeHjBYckuFRwoJRYbxOv9H7oxK+wdfosbgD7to
         EjPvB6RRk0VQfaIem7U1Qbybd5EiFr4B+gXeVZUf3e66krZuKL2rzRQcgZFcDxMQjztA
         YFBWemTxjZJaZz3S2dahsMbOjv0dzISwWCw+Xr4SZOeXh1/YOwBK+ByCCF1cASE3wJ1Q
         dHhKYS+NLeTO7slojfC1+iSJE7sWSSDq5a0p/1FEKX/hQNvYcSEANcb9aSSzvSlnAOWM
         ArUWR0QWY4lM8ztNV3ccwm1t/Nd+EyP7wCS2OZLe6Sn6PBsGXOioV18NUOmS+XOvqN2S
         CXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739869036; x=1740473836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hlErsFV9V7vbfjbxZQu67cLb5ITsC3CKvDimUBSUYxc=;
        b=f+DlY3739B4z/tS1bgTsVpm+hLx3LkMuRmTWCM3wooxafoMjswWvimoz/+6bDjYf4Q
         fwaoQPBo4rp7bVYxj9aOniiiUTQ4F/mfq7JmHuIFggkYBiDkNN/piI3B/pmW3IfK2iyV
         va408i1/JpBuKPPR8ULBN8O9BbGMkULW90/HaDhgO4e+1PEmTzE+BgxDxaLW+MkIZuFd
         vbLGSoKakXc53G9mEdVkb+auRFPznlfFhxNWNcAlp3kpNEvx7vPDhiz0QtptN1ZjKlYT
         QuUlq3crAccPJbqLLsUYubFl/vJap28YmPHtJWfaEofUt35o7oYF5etJW4DOx9QDNHG3
         UNWg==
X-Gm-Message-State: AOJu0YwhLvEqQWdUlQz/BbHDqtUe06f+vqe7mLXzzbdCnru6NUOz8y/m
	5A8FaS//6JMJYT9RmiqFD8E+s/2fLZl8XzowWdEXdYdonbcx6lq2C96+najsfmVF4wa7e2oWHnJ
	qtARMpdT7In2M/0oD9I5UfeIah5id+7GrdD1HBA==
X-Gm-Gg: ASbGnctEKezpCRTwK4nXYmAQkSLuEtlA8xpmRSxlgMbKvEL3pcyPhRKCuB+XmpGmadA
	8PehvWEbnTqRbiCMPrGqyVft/yJk+Hehz/0XkEoecKHh43sQO6jAFLhW49MKOYQ3z2hilV0KLWU
	FyQtpprs6uNOdoiIi+sA4NmXgiHsLg
X-Google-Smtp-Source: AGHT+IFAY6Xns+/Ob9unwK3yUiO5P96UI8GY5KEOai6Gz8IDG+X5xZzrb4DaYRMJSIXmR6ytPjyR2Hb7Fmg8G2ZxrWs=
X-Received: by 2002:a05:6512:104e:b0:545:c23:9a94 with SMTP id
 2adb3069b0e04-5452fea6dcemr4513084e87.48.1739869036236; Tue, 18 Feb 2025
 00:57:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250217142758.540601-1-koichiro.den@canonical.com>
 <20250217142758.540601-2-koichiro.den@canonical.com> <CAMRc=McB0bcG4jERmUyrQ=eTP+kcfLBBAOaT7mCMKbgUB1W5nw@mail.gmail.com>
 <d2qdoq3f3jk6gzgsjeqszgaqk7z523r7cfnopxfq4ghsbsqgp3@zjw67ewqzi5u>
 <uogv4ckqo2e2byspffvfayu44v6fl46sxtu7eudweoye62sofi@5iwsumpttpca>
 <CAMRc=MdNtDW_Gbd6dsG345110SCWe1vD_rNd_QaWBYRApHBoxQ@mail.gmail.com> <saszavmizjwhzechspy6otune2xwtgjjygaitxminzclgj7zep@ofwfb5jdfcam>
In-Reply-To: <saszavmizjwhzechspy6otune2xwtgjjygaitxminzclgj7zep@ofwfb5jdfcam>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 18 Feb 2025 09:57:05 +0100
X-Gm-Features: AWEUYZlXaLy29umfWhy-dvc45_tPOq-Fj9punVFoIZsBxonlMFUOsDQYUkbAzxU
Message-ID: <CAMRc=MdDi6_neGThU3wq_uq2VA=DUHzTwvrv_wivj26ksNSnNA@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: pseudo: common helper functions for pseudo gpio devices
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 6:01=E2=80=AFAM Koichiro Den <koichiro.den@canonica=
l.com> wrote:
>
> On Mon, Feb 17, 2025 at 06:29:27PM GMT, Bartosz Golaszewski wrote:
> > On Mon, Feb 17, 2025 at 5:21=E2=80=AFPM Koichiro Den <koichiro.den@cano=
nical.com> wrote:
> > >
> > > On Tue, Feb 18, 2025 at 01:12:17AM GMT, Koichiro Den wrote:
> > > > On Mon, Feb 17, 2025 at 04:46:30PM GMT, Bartosz Golaszewski wrote:
> > > > > On Mon, Feb 17, 2025 at 3:28=E2=80=AFPM Koichiro Den <koichiro.de=
n@canonical.com> wrote:
> > > > > >
> > > > > > Both gpio-sim and gpio-virtuser share a mechanism to instantiat=
e a
> > > > > > platform device and wait synchronously for probe completion.
> > > > > > With gpio-aggregator adopting the same approach in a later comm=
it for
> > > > > > its configfs interface, it's time to factor out the common code=
.
> > > > > >
> > > > > > Add gpio-pseudo.[ch] to house helper functions used by all the =
pseudo
> > > > > > GPIO device implementations.
> > > > > >
> > > > > > No functional change.
> > > > > >
> > > > > > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> > > > > > ---
> > > > >
> > > >
> > > > Thanks for the review.
> > > >
> > > > > Looking at this patch now, I've realized that there is nothing
> > > > > GPIO-specific here. It's a mechanism for synchronous platform dev=
ice
> > > > > probing. I don't think its place is in drivers/gpio/ if we're mak=
ing
> > > > > it a set of library functions. Can I suggest moving it to lib/ an=
d
> > > > > renaming the module as pdev_sync_probe or something else that's
> > > > > expressive enough to tell users what it does? You can make me the
> > > > > maintainer of that module if you wish (feel free to add yourself
> > > > > too!).
> > > >
> > > > I had vaguely envisioned that this might eventually contain some
> > > > GPIO-specific code for some reason, and also it's just a tiny utili=
ty to
> > > > reduce code duplication, which is why I placed it in the neighborho=
od,
> > > > drivers/gpio/. However, of course you=E2=80=99re right, there=E2=80=
=99s nothing
> > > > GPIO-specific here, so moving it to lib/ makes sense.
> > > >
> > > > I'm not really sure if this method for synchronous platform device =
probing
> > > > can be broadly accepted as a general solution, but I have no object=
ions to
> > > > making the change. I'll move it as you suggested and send v2, setti=
ng you
> > > > as its maintainer.
> > >
> > > Regarding this series, I feel that it might make discussions smoother=
 if
> > > you submit it directly. So if you're okay with it, please go ahead. I=
n
> > > that case, there's even no need to mention me or CC me - I can track =
it on
> > > ML :)
> >
> > I'm not sure I'm following. Why would I submit it myself? You did most
> > of the work already. If you want the changes to gpio-aggregator
> > merged, then I think that it's time to refactor this code before we do
> > that because repeating it three times is just bad programming. I
> > probably wouldn't have done it otherwise at this point.
>
> As I mentioned earlier, I'm not really sure if this particular usage of
> platform devices will be generally acceptable. gpio-pseudo was intended
> solely to reduce code duplication in methods already accepted by the GPIO
> subsystem. Moving it to lib/ would shift the approach, effectively trying
> to promote this method as a standard solution.
>

Promote it as a solution for this specific use-case - the need to
probe "faux" platform devices synchonously.

> For example, if for any reason drivers_autoprobe is set to 0 on the
> platform bus, the synchronous mechanism might be blocked indefinitely.
> Moreover, in the first place, I'm not sure whether employing the platform
> bus in this way is appropriate.
>

It's sketchy, I know. Back in the day I was advised by Greg to use the
auxiliary bus but I realized very fast that if I want to support
device-tree too, then I would end up reimplementing all the code that
already exists for supporting the platform bus. He eventually agreed
that it's better to use the platform bus. We had the same issue with
PCI pwrctrl recently and also ended up using the platform bus.

> For drivers like gpio-virtuser, which we can define virtual GPIO consumer=
s
> via DT, or for gpio-aggregator, which we can use as a generic GPIO driver=
,
> the expectation is to use the platform bus/device mechanism as usual. In
> those cases, adding a synchronous mechanism via the platform bus notifier
> to piggyback on the existing platform bus probe implementation is
> understandable and obviously has already been accepted in the GPIO
> subsystem. However, moving just the synchronous mechanism into lib/ can
> potentially be perceived as an abuse of the platform device concept?

That's actually a good point. I guess this code could be reworked to
work with any bus (that would be specified by the user).

>
> Incidentally, Greg K-H=E2=80=99s faux bus work was recently merged into m=
ainline:
> commit 35fa2d88ca94 ("driver core: add a faux bus for use when a simple
> device/bus is needed").
>

Thanks for bringing this to my attention, I wasn't aware this existed.
However it's not useful here - I still want to support OF.

> Correct me where I'm wrong. And I'd appreciate if you could share your
> thoughts.
>

I don't want to block the aggregator work but I also don't want to
have code triplication under drivers/gpio/. Let's do the following: I
don't like the sound of the word "gpio-pseudo" in this context. Let's
keep it under drivers/gpio/ but rename the module already to
"dev-sync-probe.c" and use the
dev_sync_probe_init/register/unregister/data naming scheme. Stick to
supporting platform devices exclusively for now. I don't have the time
just yet but maybe in the next release cycle, I'll try to make it more
generic (work for all device types) and move it out of drivers/gpio/.
How does it sound?

Bartosz

> Koichiro
>
> >
> > The code looks good other than that, just put it under lib/, rename
> > functions to pdev_sync_probe_init/register/unregister() and send it to
> > the list as usual. With that it's good to go. Just make sure to
> > mention to Andrew Morton the need for this to go through the GPIO
> > tree, I don't think he'll mind.
> >
> > Bart

