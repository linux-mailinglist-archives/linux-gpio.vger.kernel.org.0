Return-Path: <linux-gpio+bounces-10488-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E0E987FF2
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 10:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4AB81F22E69
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 08:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400A5189524;
	Fri, 27 Sep 2024 08:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kqp8Bjha"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA66C189506
	for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 08:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727424241; cv=none; b=SVysFfRXNm3ApYJkPYUMw2OX47L15sob6OCsfb5LkvvMjcQ5Mxnis1vLFbF9H56i8otQ97WUsH8zZUqukVXUICmHjNyT8hcgKl8bMVVCOsuwTQo49kDdKb1Y47svWRaF3OpdN+hgkdjEyq7cYZGIWhTXPBCgTpjDmOLrIULeDMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727424241; c=relaxed/simple;
	bh=6a93xl8FpW2INESzkmGVVW5uh2N5rJCXS8bzNc5Hiek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lEnxe3ooEENGdyvyrWVbJKWwuLyafJMcpV5GvnCB20FoJQcIWKiuQaz0VFokDDhhefwS/fJNhbpUo2+8iELPWi6sG26yhs+C5Hc1nccmYj1AQQ5JRnWsFWn8jY3IFmI/HWUnsJ3ki8F7t9I1InRQXlWR0x/vwlH6WyW7ZUsU/wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kqp8Bjha; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2e0b9bca173so516052a91.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 01:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727424239; x=1728029039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6a93xl8FpW2INESzkmGVVW5uh2N5rJCXS8bzNc5Hiek=;
        b=kqp8BjhaHuzyRI9FI9/945t5uanM+8AYKy3XlWLZXsHIoE/5FFb3IKOpmAcr3iEkoT
         qVDd8v9BzOr7NOBZiQNzpgLAHOjIXI7H+Xx+0uv/9Lz+g1n4d3dsIWaZpDfKuOjEdkr/
         PUWgBCLPpLUQnvhGlHKEAZjilc/D1BEbypQHo/FeAB+nBhHp+IYsSmfAmy83M2NCDFI7
         VFatw4z0Hdc03XYPekRF67eFZwHv78fSAU+AHVB3HzS/X8Wjlol1hh7zlkUJdcxtYoqI
         +ET9zXkKhdrnomIRIS+qZMYDIZ4p4vNUGWmT1yEqja1zQrdfUKh+dvpI5qjdTCVVP6tL
         36Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727424239; x=1728029039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6a93xl8FpW2INESzkmGVVW5uh2N5rJCXS8bzNc5Hiek=;
        b=pW59+ysJ1MHwHl1d2BpnScBHMZ7m1Udusl5/v3MOGQ4iJZ9h0RnUKpiqg2/G4fDlZX
         QwTo2AYhI/76aUF6QeySAwBm+wovWVn4ju0xOYtaYSJl+SSN6NArXn7Bx05/M4gcOQd3
         m9sbME2F47rfVoHtrmBgRIaXaUvK3RC3eJTlT+QhEIZxRlxSJY+nijyLB28BcRhoXBaB
         OIF0mhmmpqHdDIO+PMXjBM6/9XrtlWyvFY6KmbSIbSwUaQlIpxHzp3ahd8CRB+LQ4ybZ
         YCNyiCRDjRwdrVPRsja2P6nZ46cA6VxMw8QEj2AW8SqsBErQGjzpArWWK/yDjsb7pf9c
         jvaA==
X-Gm-Message-State: AOJu0YzofGrq454+3mHcYiBbCrQCV1IbfN2GX/zsj+e+IPEqQYop9AUd
	o1ALe+emufs/E/SK9zOLdD8VG4shwJlORozbXI+eBwXoLKOyFRM0LmK5HB6vlbLEX5GKtrqNKZH
	Kl6NAsVh+k/T5gv5mYLvPTAy15G/LhSl2F9AucQ==
X-Google-Smtp-Source: AGHT+IEcFT8vmej2xsz2ybsoir+SHIS4Ii2TyEWuN7zTzvYYQbbs2fcOGo46UjPmTn5RiUGIHJn1tKwQt5c0Vi/YTJ4=
X-Received: by 2002:a17:90b:96:b0:2e0:caea:8466 with SMTP id
 98e67ed59e1d1-2e0caea92f9mr773491a91.27.1727424238941; Fri, 27 Sep 2024
 01:03:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240923182550.3724996-1-vfazio@xes-inc.com>
In-Reply-To: <20240923182550.3724996-1-vfazio@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 27 Sep 2024 10:03:45 +0200
Message-ID: <CAMRc=MefY_J3n=wFJDwzL+4s8f52ECGxNB5UWGcnD-ncD2cnQg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: python: tests: skip some reconfigure
 tests on older kernels
To: Vincent Fazio <vfazio@gmail.com>
Cc: linux-gpio@vger.kernel.org, Vincent Fazio <vfazio@xes-inc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024 at 8:27=E2=80=AFPM Vincent Fazio <vfazio@gmail.com> wr=
ote:
>
> Commit 40db20e added tests to ensure that lines that were either missing
> from a reconfigure call or were included but had no LineSettings defined
> would _not_ change configuration.
>
> However, this functionality requires the changes from kernel commit
> b44039638 to work as expected. This commit exists in the 6.10 kernel and
> was backported to 6.9.8 [0].
>
> Now, these tests are skipped if the kernel version is older than 6.9.8.
>
> [0]: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/com=
mit/?id=3Dd972e7b24a50d1f89967d5bffc3147810af9222d
> Fixes: 40db20eec045 ("bindings: python: tests: extend reconfiguration tes=
ts")
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---

As discussed on github: I prefer the older stable kernel branches to
have the relevant patch from Kent backported than to start adding this
kind of unmaintainable ifdiffery to tests. I see Greg already started
picking up the backports so let's drop this for now.

Bart

