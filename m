Return-Path: <linux-gpio+bounces-12265-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A87219B3A9F
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 20:44:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D6C8282736
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 19:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76DAA18FDD8;
	Mon, 28 Oct 2024 19:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xrWnMCR4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA23618B03
	for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 19:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730144673; cv=none; b=mxjARDdTQc70BPRc1M7/n4he9Fd6URrIFtdpQAZAdtB8OWMjn2WZ9efIs3qnzV6hmgYO06tmUX+NztpjvFQHkc1pfb+CEN5wZonMOwq/7kJL+gAGygkvl5eBjqIdmj9wvr8a0PLeEeqgbc+L8ZtU4q3gHIcA/vXYV72gvfKUSU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730144673; c=relaxed/simple;
	bh=+GvX7DuFUQwS8dyz19eILAcV3MrlsVTdpSMnXZ0ImVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p8QjsdGrEu7Mm5el4gpStOrD0xaa3rO7wphgL5JuoBJoltZNi5m0pfOkd5rqJKoMGbKUxsgH5N4c3bMkm1wWDp5X3ITdLEY1ya/qRQwQTbHam3AZb8+DxOXBplZ1OieVqTzljlSGme/ocw7MEnVT1XpMdCHoVkmm7GUfCQLjgGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xrWnMCR4; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb470a8b27so51591121fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 12:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730144669; x=1730749469; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Es5FJ/Eqn/7f/TR2CLB1xIqLZ59Qh4jlmfwS9MwJNhI=;
        b=xrWnMCR43bUsLbKTMCKce0xJEwgf0ab5a6+FbBl03bWbTLyaKBS+wamfqVc0ZMM4Ix
         vDTePsZnIGUiax3zKWNUunlUl/KsCahm7Vp5xw02feqVqan0dIKcECCVgP/h0PzozVQR
         eNkw4ryIotIPvwP3H+ocg4lIwD3affMKajM2fSa7MO51BSOmLtTMrTPX3Hri3E+zi5Y2
         Mg5UdE46EhPsxlXvktrgj9Anl7tbGKs4249oTpSLTmKD11Bw2hykGo/FRV6Lks11D/jf
         l6OMbykEo3SNdCCAARegs0CGS5UYNMcBya8qE6+eMimt3yFHCBGmY0L32LghhQbUbkDZ
         eikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730144669; x=1730749469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Es5FJ/Eqn/7f/TR2CLB1xIqLZ59Qh4jlmfwS9MwJNhI=;
        b=VREu25hxBDVE31qFVsuzYWOKf5kUiXCcoLKZXTGGhPQEi0myf9qKV0isLZra4hDD4c
         EK906JEz/9HbrYM2N4WKu1hFWd2l/e3ggBSNuCbuZiGBqGVZ++FQt2lzj4w2b1NRzQ6t
         rKM2M1DQ+XiGqDN2bY4k+DHjhD3yfTQRDCcMKLuwUESnSciuXtW0d2VpHI7uqrvOAp1n
         +CrN6JTb+lexgkxqzCl0dZ2o0zNGX3iRleEYctq6p3UtDa/PwIfL4KIrT7nHta311Vy6
         YPbcGnj3OAPoTRKRBOPY9rapw2ubGMdJ9TFt4ZFB1L6SOBRANnw3LMk5zGXzeyDQJYND
         4BCw==
X-Forwarded-Encrypted: i=1; AJvYcCWA7PxVACMtjltKY2Kfx+fagbcq0A3DlVl61QDLDJymuiKE7/V8oQhIcE71Kj0s0KkQJzYoKQOPIl+K@vger.kernel.org
X-Gm-Message-State: AOJu0YwdNn/kkRJAp0HVHGhR5sbMG3jm1poa4+3+7CanVEYNVnMPDaBB
	4lSsDn2MMkCwVf7t3Wgar6unGU1JXYBhXkQTtQLs8TKqEnk583rVy9ZRwI+a0cJcXg5qYsjmEgs
	7hB6A7A154j4qht4giSl25x6Csz7sermLz78dwQ==
X-Google-Smtp-Source: AGHT+IGTvHMPUI/0J/2KHYkR+fAP3leECYNBYRfPtJkapPvHm+GUyRxqn0AB2BFQnjuIH8tk2CV1L4CP3TZybtZe7Cg=
X-Received: by 2002:a05:651c:1986:b0:2fb:49d7:8009 with SMTP id
 38308e7fff4ca-2fcda0499f3mr2325171fa.3.1730144668714; Mon, 28 Oct 2024
 12:44:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240812-dbus-v5-0-ead288509217@linaro.org> <20240812-dbus-v5-4-ead288509217@linaro.org>
 <93c9d617df7cc3f6814a56d07d90aa3f98e352f6.camel@siemens.com>
 <CACMJSetD8JeP+5AV9tcGXPVQQaUO=e3bG6ZNVd82kdREOqXUJw@mail.gmail.com> <0efb4b35cdcc28298609a72eb8f856f8887334e7.camel@siemens.com>
In-Reply-To: <0efb4b35cdcc28298609a72eb8f856f8887334e7.camel@siemens.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 28 Oct 2024 20:44:17 +0100
Message-ID: <CAMRc=MeXqXVdQ6fHK6z7btafU7=k5mbJF9uKx1z=HXmTu3_9PQ@mail.gmail.com>
Subject: Re: [PATCH libgpiod v5 4/4] dbus: add the D-Bus daemon, command-line
 client and tests
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 8:35=E2=80=AFPM Sverdlin, Alexander
<alexander.sverdlin@siemens.com> wrote:
>
> Hi Bartosz!
>
> On Mon, 2024-10-28 at 20:13 +0100, Bartosz Golaszewski wrote:
> > > Strange, I'd expect from this code to detect pre-existing chips immed=
iately,
> > > but this is not what I observe in practice:
> > >
> > > $ gpiocli info --chip=3Dgpiochip0 | head -n 1
> > > gpiochip0 - 24 lines:
> > > $ gpiocli wait --chip=3Dgpiochip0 --timeout=3D1
> > > gpiocli wait: wait timed out!
> > >
> > > (without timeout it would wait endlessly)
> > >
> > > This is not expected, right, otherwise it would be counter-intuitive =
and racy?
> > >
> >
> > gpiochip0 here is the device name. It's dynamic so you cannot use it
> > with gpiocli wait as you cannot know it in advance. You need to use
> > the label of the chip instead.
> >
> > IOW it's a feature. :)
>
> Thanks for the quick reply!
> My bad! Indeed it works as intended with labels!
>
> I think I've found something else, but I didn't have time to look into it=
 deeper:
>
> $ gpiocli info POLA_RS485_2
> gpiochip0   2:  "POLA_RS485_2"          [used,consumer=3D"gpio-manager",m=
anaged=3D"request14",output,push-pull]
> $ gpiocli reconfigure --input --both-edges request14
> gpiocli reconfigure: Failed to reconfigure lines: GDBus.Error:io.gpiod1.R=
econfigureFailed: failed to reconfigure lines: No such device or address
> $ gpiocli reconfigure --input request14
> $ gpiocli reconfigure --input --both-edges request14
> gpiocli reconfigure: Failed to reconfigure lines: GDBus.Error:io.gpiod1.R=
econfigureFailed: failed to reconfigure lines: No such device or address
>
> journal:
> gpio-manager[3043]: failed to reconfigure GPIO lines on request '/io/gpio=
d1/requests/request14': failed to reconfigure lines: No such device or addr=
ess
>
> $ gpiocli info POLA_RS485_2
> gpiochip0   2:  "POLA_RS485_2"          [used,consumer=3D"gpio-manager",m=
anaged=3D"request14",input]
>
> For me it happens with all GPIOs I've tried, I can reconfigure output to =
input,
> but not set edge-detection, neither simultaneously, nor after output->inp=
ut configuration.
> However I don't have any problems to configure edge-detection if I do "gp=
iocli request".
>
> Just for the case it rings any bells, otherwise I'll look into it in the =
coming days...
>

Does your driver support edge detection? Does it work with the
first-time request? Does it work with gpiomon without going through
the manager?

Bart

