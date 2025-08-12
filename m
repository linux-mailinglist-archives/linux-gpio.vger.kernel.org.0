Return-Path: <linux-gpio+bounces-24306-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1737B22980
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 16:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A660E1BC820F
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 13:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79F3284685;
	Tue, 12 Aug 2025 13:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eGAQjq9I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02657284686
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 13:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755006173; cv=none; b=cViBv76pGFTQYwbk95QFyatXdWT/7j6eGEujz58eLRpsACEq7c6LcJckvQymyJf5BeN6dWyZrEA3b62P/xP76Jx+KJz9tM4jQRCCnta8AMWyW7hfJhdc/YBLXiKdPvQKYku3lMrPZ0JoPvUPw97jxI63HssYEiWu5KpgapKv3z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755006173; c=relaxed/simple;
	bh=WkpTqop/p/VXbD3Mpouw39PkBycZix50Z8dm6sU9O/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E+YVngSZYhKo4MEuKbkjszPhbco9E7UoygcSKOuk6aYRyIExWXPgjWd6Xmin4mxaRm6InyESSKIUvF9M+74PlNTpoQQOqdEES7TJANREUU7wEls1OTHGh0utAQCroukpQ/e/b58o47xthH8AAzRwZ3HeYNqAq07/S6QS4i8D1qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eGAQjq9I; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55b8a0f36fcso5841921e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 06:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755006170; x=1755610970; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4g0CjNts11+3oHCNDZ5gJDPRrk4gclKzgBm7miqOkM=;
        b=eGAQjq9IpL/gTUg3TWy67rbCDD3buTRrsMR28J+dmE4fCg9jNCtr87utJ7ETkXfSAS
         Yl4076ccSYY0CpyMz7paNR5aeIRKXFSYtz6F3KuykrPMhEh84V69fPkPPTh0PtdeLOcA
         JD/zRp7fqycyCbEA4sO1xJfRFu7tsnHepG7vuvWZJf58GXk+PEguAw1TvrRQ1AfomNqy
         7c5hS67XfMDnAZMSdpVk3ysOMWpyBWaXmKrBSKJ8HhpBtDhWsZJaVRHUdFjmkZi/ayOI
         BwFevQaiXLhhZrepFPwWBG33GzQoi+o/fzRxi9AClBxNBoERUnm3s9rJkPmfRVjSBvP2
         j92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755006170; x=1755610970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4g0CjNts11+3oHCNDZ5gJDPRrk4gclKzgBm7miqOkM=;
        b=mB+CnfCtXNOZZE/4b7UoSSUSrQLGj4pQIU46MK3bF2bNElUzlElkIjhsdCH2Cofg56
         7cKHLstZLrsK52iHd7zg5tr+MqRa13sboBEDQLH3JwMH2FISkP0kn/vtlgE3UOf9JNNR
         wPKoKqBjJIjLw+fbEEqJq8Es3RaIEvfhpPQll62GkutqIfDsLpqANHeCLJT0DDG0uAU7
         ZifU3cnus9pPo1dfq4w7Du+1BW/8nRcfc0D30KJPHtt9j4hibqZqqixvwxSIH8lQSZVO
         HznTEjqsdzgulMv8sNf9hggjj8n+yNUvjlTuVesKScBNFyRSoSbfcnRp+wnn9OZq8KNK
         5Fww==
X-Forwarded-Encrypted: i=1; AJvYcCWIvk9r4r/Rhgan5PNyIXMpFUeEZgTxKNVUq6gb4Jp95TXA1M3vGM5MURGU0m3rcejDaZLlPaOmFGOK@vger.kernel.org
X-Gm-Message-State: AOJu0YztyBOqmpc6B4nBuVvDOhk2g9r0wSI0HZFMLSVbxuVQ6hyaH9lj
	SSlzZ6b2+U1iHljb0uk4/sksDPeggl1t+KtVlJRf/zHktMucViqtW1d7qFTp1Pno2dDZBEUbsuM
	X7O0OSD0vdrcMpm3O+GKq1j0IFzVHduoxCY4I35ZmqA==
X-Gm-Gg: ASbGnctg8pUATfFiVca89fsWwH6aHG/h40oBIBzdxb5CdXL/a3PVSC2NyQ6+/QCW2vR
	tmqRurG5rnkbpYPjO+F3dSqmNtPGwN3zt+0pOp7TH7bVoMV91gzUAT/sgSOsc9pIicbRWD+SJvY
	uDEOtnnP3Ej5348vukyRWMr3i4Iz/KtWQUW5IbI8wvRbGs5DQKgYyFCLVfRfJAIk40xzKZjbokM
	fNbRoxbXgHXRTzKVPjsu1DIrOL3Ra/P4zhM
X-Google-Smtp-Source: AGHT+IGT7C6SpEMV2b6ciCNBkYT3ULmCzFc5kB/Au9Kxn/MeeusTVlqfq7XNooEYzUyJ6v739uDuC8+2x4p+q07BWkE=
X-Received: by 2002:a05:6512:31c3:b0:55b:7fd2:25f0 with SMTP id
 2adb3069b0e04-55cd763b33cmr1197242e87.31.1755006170093; Tue, 12 Aug 2025
 06:42:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1754928650.git.davthompson@nvidia.com> <ce70b98a201ce82b9df9aa80ac7a5eeaa2268e52.1754928650.git.davthompson@nvidia.com>
 <aJpT_nS5bDNRVn9a@smile.fi.intel.com>
In-Reply-To: <aJpT_nS5bDNRVn9a@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 15:42:38 +0200
X-Gm-Features: Ac12FXym4hP-E2PFWmiXeVjXY0EWjQJ327lO786BIbiVQWIwmxf2XAqohuOfWrY
Message-ID: <CAMRc=MftLCu6bedHkV=K9j-VgB=myWH_Lp_=vUprqUMC3RmpnQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpio: mlxbf3: use platform_get_irq_optional()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David Thompson <davthompson@nvidia.com>, linus.walleij@linaro.org, 
	mika.westerberg@linux.intel.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 10:35=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Aug 11, 2025 at 01:50:45PM -0400, David Thompson wrote:
> > The gpio-mlxbf3 driver interfaces with two GPIO controllers,
> > device instance 0 and 1. There is a single IRQ resource shared
> > between the two controllers, and it is found in the ACPI table for
> > device instance 0. The driver should not use platform_get_irq(),
> > otherwise this error is logged when probing instance 1:
> >     mlxbf3_gpio MLNXBF33:01: error -ENXIO: IRQ index 0 not found
>
> Missed Cc to stable@.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

I added it when applying.

Bart

