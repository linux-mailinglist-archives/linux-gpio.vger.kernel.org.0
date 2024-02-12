Return-Path: <linux-gpio+bounces-3179-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E39A850FA4
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Feb 2024 10:20:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D13C91F2164B
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Feb 2024 09:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7550A101F7;
	Mon, 12 Feb 2024 09:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XJ/dvrFp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED81F6FB6
	for <linux-gpio@vger.kernel.org>; Mon, 12 Feb 2024 09:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707729605; cv=none; b=WdWKQAuDnSO+bcX1gkmo6pP393iLdovdv1Si5lWdrkb/7YDaLKAzYEwJBI9nV3a93uP564Fk9euAiKk4qS+UYRYHl2xsG0+Kek/rc/nkPA+jJmef6gWs2PVGeZisxdmPX0qRwTKy1z2LYeVNOLEnWMpqZXvngSp3ZJ98bJhlMx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707729605; c=relaxed/simple;
	bh=n9Ov502+N3u49Z6R6ct/dWB+FR+V6UVDXzvlJNlA6/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gqe3vr2Nxt32r1P6OL8qQj5S2n/BfK2n0CQSTcUSaI7QCIJZp32+mVCwl6NfW27Ln2YDPCR2C6Toyo/4kYO8FWTUWt49qJRp1CZ4D90NSln5ISPhqyjDTnsRpriIAYUhUj3d+imCf7Sx1cOnykxFo3m4pEzuXFLpEXyPRvok6d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XJ/dvrFp; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-46d321e2344so244821137.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Feb 2024 01:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707729602; x=1708334402; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9Ov502+N3u49Z6R6ct/dWB+FR+V6UVDXzvlJNlA6/A=;
        b=XJ/dvrFpttiQ0eQAWsv6BNf28mhumKXDBJL1kRyE5XvscwtHjwCHH5e9Df4dR8sVRj
         1xvcCsY6MKuj3VtfNahIH9UiG79XntdW0IVzEvXbrXcz2j34pvgrMH3VwgkD6d+V9Xq3
         RsvIDHJVyKEHSJc/DHvqExwb6Rlq4EVaCyDZ4ypUhFKrD2DTngy8/IepEPyPPh+NkvR4
         MXAghX71DJOFEyYpgf0+gdloMuPaAxhKWh1OTdlRiVNENRGrxPh1YP1uswd1ZeDYBDtE
         /Nnw7lfkTLudfiS1x5SUby3xr5hhIPF67gi/2pvq3BCqiLxEpOZPGe+kSvAEnGCt/0mT
         IxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707729602; x=1708334402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9Ov502+N3u49Z6R6ct/dWB+FR+V6UVDXzvlJNlA6/A=;
        b=e6A+e4p63zaXIMmL8bBiD7c9BEY+ed5AzhGyhCY2hKFJxgaE2HVoQ5hk7wWbaJXulJ
         LgunxlkyjdsOH8Ov1TGUklR6HLqPLsVgTiQZbWFGo3V0+P1Hz6O0tpIuXJ1boerjdO7Y
         hfMCwE4zYWQV74rsujs5z8Of2RP2KeJTfi6d07UBrDTcV8ytOXLyeI7puCrCokOl1vlz
         8IVFhB+JW8LcFqEI25aQxccYe+OPQ4sUhlzQJMB4BhMlxgWKKnHsdpGXk8jdbKFi/rF6
         JdBlSyQj654riVEijNfCgmki2qiVwsFA/uXc8Ti62D5Sq3a19utA5OAKguGO54KPh2y8
         i6wg==
X-Gm-Message-State: AOJu0YwIZpuQZc83GAldj1i0LwQV8kh5Tll6RfEhABa9stSrZYHCEE2G
	dn1kL8mO1K3GmPuUb683ir7LaGXF8lS+QJE0IhKJyQZYTorZ5Mp1gw6Xn6/a+LFtzZjSrikYX6u
	F7NbvSDR026TSZB2wBZ1LRdhnK7MRxPQFd/rueA==
X-Google-Smtp-Source: AGHT+IHSNotxSJ3ltewKqxnRlk/iLnxwhZoi5Ou1X3qQ81yggKFAcv995ilite4ToFQmhx0SV+6LFcU5SayNI88fb6M=
X-Received: by 2002:a05:6102:495:b0:46d:2336:fcc0 with SMTP id
 n21-20020a056102049500b0046d2336fcc0mr3136855vsa.25.1707729601851; Mon, 12
 Feb 2024 01:20:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208202704.631203-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240208202704.631203-1-krzysztof.kozlowski@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 12 Feb 2024 10:19:50 +0100
Message-ID: <CAMRc=Mfezg_tt7Fd8AiJmL2ryQRp9pjozdOnM9Ak7mFdNVw34Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: constify opaque pointer in gpio_device_find() match function
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 9:27=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The match function used in gpio_device_find() should not modify the
> contents of passed opaque pointer, because such modification would not
> be necessary for actual matching and it could lead to quite unreadable,
> spaghetti code.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied, thanks!

Bart

