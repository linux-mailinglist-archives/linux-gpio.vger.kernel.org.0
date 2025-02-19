Return-Path: <linux-gpio+bounces-16218-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2E1A3B6EB
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 10:11:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1921D3B06A3
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 08:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C131DF258;
	Wed, 19 Feb 2025 08:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="o1FeUPlN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105081CB51F
	for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 08:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739955075; cv=none; b=JPPMrVRCcCYG840dhxvu/M8JQnsdCxIE+hiRfq0AdSzoHqC+DNMGUBXCe1wD1lgVwDlqs5lyGK3XX6Yy0JmAG+R/rcnXl164gZUUp5btNN1Qe5f6E7kzZVRnoJQcMqSzY2hmgO049Pu/t4+IiLJ/JYQobkeNeu56Br26PAApV3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739955075; c=relaxed/simple;
	bh=QlRt4GjR1jTQddX7TI/CWL55VeGCGZqXC6zBvzHvQVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nynGTjg8vyf1hzS3vTd3FuYJMZFeZEdzh+qxbziv8UAd/SgY+rJZMgSY2L/9mUeK6F8s2wpDO1SSLNPz+NI+dQtIH3DodDMKwo1q9V7Tg7rf9yfO7ylLhDwl4hoQ4Khz2MRZwaeuZby/Xm9FxIgBi+8oGpa2s5LgP0dTGFIzo5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=o1FeUPlN; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54622940ef7so3126680e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 00:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739955068; x=1740559868; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlRt4GjR1jTQddX7TI/CWL55VeGCGZqXC6zBvzHvQVE=;
        b=o1FeUPlNj2ECx+vKbeYadrDGg39J25so27tgeLPmCS/x4a6J+K6GZlwiCkRVHdy0R8
         M3wwgKL1zOi25+dvSjevUgqVN+OC1cZOWQf2HdbeMzamttbQRs61n7SbHB43eqPQTbC0
         NkRAOWk1BzEcdQx1l/VdRF5EsH0OUcgydRaA41Cc7MWBaMRGDg6cJ0dFgozWdp1w4qOU
         +u22E4K0wISQkFfMvYhRo0Pe///PNz7BZYhYsQkoh+6wFu/BmrmtgrZMm+j1oFCFbx2g
         nrjt12vBoBij+AJs3scQfRBy0HufJPXNO4xe9YgWIY/3SpJS6s5j70G+5GvowhnYVCQu
         z4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739955068; x=1740559868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QlRt4GjR1jTQddX7TI/CWL55VeGCGZqXC6zBvzHvQVE=;
        b=a6X8lM5K2XMDcwhr75assXT99sr8WGrEEx+1cU+9eXtptiJxU47QcrOJng7wSOpgqJ
         x6LHva6UtrcCNK/vs8LjlceEcjSjK5j1S+5LrYQqw1RnbQjP/YmCqbUKRe+Hp0bVUCHm
         rieVP/x/BtJvq/hTk1QoHe96uqQBspFpaN+M75cqy3D2EyZzwPp8JyMbUmTnn9YRIA5U
         xzMQoQpzx2wtSS6vtjfsp3Z/f4W+pyA+tLCZE0yAS7F7Bv79hDpvzgcn8h4JdTfvqco5
         8EcVt1T+4mUorgn1zEs0a9PBqDuJP0MdM4IisV9BVEs0XCo5WZQtXrrpt/VNduebqeKG
         cbpw==
X-Forwarded-Encrypted: i=1; AJvYcCW/XTCiyaCKwCB9uVb+Igjsiif85fN1igSWDEuhzr/qeofTyP/Cjzy1dGL6pF+117Dy6WbXDs38PRtd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo6GDlzc4bm+y/LQHA/Gcw+CFkSFMuvXFeq0fNOUGrQTQ9K5xA
	h1i3ORmMtqLxbT/jnf/Grf4qIlKn3IPkpGp/3SwmEiRETXTGxhRmgM+NfDb6MzBeXffVxWT41Si
	r2wy5I0APw36NgdS82ZmucGnw/WzHs0MFO29RGw==
X-Gm-Gg: ASbGncvr1IelPrkx2CYqo73kyAmq4NTRp7V/7vhOWQzviOeOAdq94mVFXK5xAAYCVod
	pRnDbFeZEY5en+HCJ77t3LxGVi2bK/R9VHYXtMGdOgCGVQR9aRZItMy/4UPAOHiL/IhXezrrCwQ
	CchA2xz+S/OV2ZPt5u4YJ7GYmxhDo=
X-Google-Smtp-Source: AGHT+IH64ll7H5Pnr+AXMsIuNzl9rxkEnslGqgkEA+cDQgfdDUoTUpRoWEehaV1nkpYxzRdLERpqNeVg5AkiS0DCNsY=
X-Received: by 2002:a05:6512:3e23:b0:545:b28:2fa2 with SMTP id
 2adb3069b0e04-5462eed85e0mr1036454e87.7.1739955067864; Wed, 19 Feb 2025
 00:51:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
 <CGME20250219083836eucas1p1b7ecc6e5fdc34d66ef7565bfcf399254@eucas1p1.samsung.com>
 <20250210-gpio-sanitize-retvals-v1-1-12ea88506cb2@linaro.org> <dfe03f88-407e-4ef1-ad30-42db53bbd4e4@samsung.com>
In-Reply-To: <dfe03f88-407e-4ef1-ad30-42db53bbd4e4@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Feb 2025 09:50:55 +0100
X-Gm-Features: AWEUYZmqO0kHQqF5k5xCw4NLQbgyDdiC_HWCKvZXBPIn3qhchpNyNDYCJKAkPtE
Message-ID: <CAMRc=MduJK0_gat2aVQbR9udYNj9oDcoN=me0wa4K6L8dX_52Q@mail.gmail.com>
Subject: Re: [PATCH 1/8] gpiolib: check the return value of gpio_chip::get_direction()
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 9:38=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Bartosz,
>
> On 10.02.2025 11:51, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > As per the API contract - gpio_chip::get_direction() may fail and retur=
n
> > a negative error number. However, we treat it as if it always returned =
0
> > or 1. Check the return value of the callback and propagate the error
> > number up the stack.
> >
>
> This change breaks bcm2835 pincontrol/gpio driver (and probably others)
> in next-20250218. The problem is that some gpio lines are initially
> configured as alternate function (i.e. uart) and .get_direction returns
> -EINVAL for them, what in turn causes the whole gpio chip fail to
> register. Here is the log with WARN_ON() added to line
> drivers/pinctrl/bcm/pinctrl-bcm2835.c:350 from Raspberry Pi 4B:
>
> Any suggestions how to fix this issue? Should we add
> GPIO_LINE_DIRECTION_UNKNOWN?
>

That would be quite an intrusive change and not something for the
middle of the release cycle. I think we need to revert to the previous
behavior for this particular use-case: check ret for EINVAL and assume
it means input as it's the "safe" setting. Now the question is - can
this only happen during the chip registration or should we filter out
EINVAL at each gpiod_get_direction() call?

Bart

