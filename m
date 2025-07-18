Return-Path: <linux-gpio+bounces-23454-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2810CB09D6C
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 10:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B01391AA7499
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 08:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F110287249;
	Fri, 18 Jul 2025 08:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bFSMIElY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F161F17E8
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 08:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752826304; cv=none; b=Y/yMghbDCSrQT0AliSb+rs/nwj03934eBR436b74aaT1VaZQPxqvYOMGGDFmJuH2XL8BOwn621rBv9l/C0tVvMWAo9n2y8BffQQD6C9syXmhqKIA8v5OmHMltBLE6y0yonBql9GEYZjPmcsd8/6208WzQ3fIYPTR6mUfq2F8vIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752826304; c=relaxed/simple;
	bh=1jAhRd3FU2QWDV+irfVHSFtxSupHRhWFUek+YocDJXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bgW7305HSqMtlsoFKvnYSZJ1FN2e1Nl/sXbHO/g01ezsVBxhJTz900lcqz0/wEylogz/BngxWX88KBXGoTNcOAEWWmWWKYriopaoUgH0vkleCTkXWx7y/D4OmSA0gowfoo2REHBXEfCYGSSBSIFRzFoj855sOFDhDb6gSlJrK4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bFSMIElY; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55a2604ebc1so1685925e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 01:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752826301; x=1753431101; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jAhRd3FU2QWDV+irfVHSFtxSupHRhWFUek+YocDJXU=;
        b=bFSMIElYHdaBXKzDxtG9RfJyeYj7A3fHBpq7D/oI99mPyvum//FPQe266/lU4XF82N
         /iVWmHXXGxV35qAzN6XhMy3Np7Enl8DdrGjAIc4A3mzcolC+psF6PX00bl3hXg8EpZ0x
         YIenmSz2bMuN44XWlPKl/AewcHwtOA1mJKX4Q8lO0oAcVXe4eV7JzunUC3Yu0Z35arVS
         OCSXqqSpiS+XA3aVWTV4lp08ywcxEBjtO4xteKgQgz5TwR9YO8xH2Z77RvHo8L2VYOMh
         33tbrfGoVt+crLdBAvdmaUF2bmbZKAHhek/hpuBTmJoFPgmQpNbfuUzTBsB6BKLN2sIB
         3DGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752826301; x=1753431101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1jAhRd3FU2QWDV+irfVHSFtxSupHRhWFUek+YocDJXU=;
        b=oMSfAKgv4q+3GRyCF5Vc96SqH7PEaJwyhb53jI5JFRLQk31xA6OscGqly2cDjc1i43
         O5Hww2f/TW5H33ZrVZT43KaV7s6Z/q2PDyEpqNOEtRGNY+191ctN23AOu9JOmVXRvUnw
         9eb3/e9rAsU4/AM8rlK4/mxUCde0UFZVniIgNGrG2BREa5jCLDqy24yn56HqaHUFV18O
         BLGdSCwt7gYecpt9134hAdjUpGYVJanTsA+QFgrh1f3UHi1cjuGSyZbcS2UURmXPq4yz
         8Ji0Lzt3+pseLQ68v4HHuLrrSR+zud5RdTM06dOH0ybX/Oyz1zeZzlMRtUqBa1hBquaG
         Uqag==
X-Forwarded-Encrypted: i=1; AJvYcCXAD8kmE1hGY40qsNN28HNI/U7kVQogMNq7fciuJTcC28JbM4nwTRSyhTBSfui4s2QnEd2nUouNhRW1@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrb7v9cYcRarSao6NBXrH4U6iuA2EMdvGcPrjoPPrMV3Y4k4me
	S1A23SHNtRfPSty5DEfHKgfdJb64pc3MV8h9dz7Vc5AzcaaRKnnredIvRdqIrCNuqS1gX+Fs+ze
	ZVWD87Issdkl3L2esI3bbv6uD36+vm9gYj+29n/nGNw==
X-Gm-Gg: ASbGncsYiI+FDFHq0BlStKGdGNrpjMOK8bQTPv5zb7FQai9aRzBD4bZvaDRud+2r8lT
	WHbGoHNFXb0Wp6e6hAvsOupdHAeD4LAqCQbP61NMK51K9ez74aWZzQwSjHVtmyqmDrjo78Bx4eL
	fGtHDh/tYiPMvCGnch8CymGzy0TSf+KiYzEUcyY3kw33JUJV6CjXZZTc9lFeB6MvRHUUR7h3Z93
	4ffayAFaJYiZfEgqE+4npvoDiPJ3T6JeMWpNk62ifiHKrX2
X-Google-Smtp-Source: AGHT+IFb1uJD4V9aouoJvlP1yjVac8eQbZ0nNrzuuL9tqojwVBFkpEZenb7Pr8T2XBBshIaYd4a1UVo6aAXBNqT0N6o=
X-Received: by 2002:ac2:5686:0:b0:54a:cc04:ea24 with SMTP id
 2adb3069b0e04-55a23facb73mr3023679e87.46.1752826300986; Fri, 18 Jul 2025
 01:11:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717141000.41740-1-harald.mommer@oss.qualcomm.com> <20250717141000.41740-2-harald.mommer@oss.qualcomm.com>
In-Reply-To: <20250717141000.41740-2-harald.mommer@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 18 Jul 2025 10:11:30 +0200
X-Gm-Features: Ac12FXxoZ75HfgStvYvOn-iPfwrSf7_9mNtIsTgIecfFZm93LScfE32n1cfLPdw
Message-ID: <CAMRc=Mcxb4SqH+XJeLkd8J==TNaja3iUep2dEm147HOETUfXEQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: virtio: Fix config space reading.
To: Harald Mommer <harald.mommer@oss.qualcomm.com>
Cc: Enrico Weigelt <info@metux.net>, Viresh Kumar <vireshk@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 4:10=E2=80=AFPM Harald Mommer
<harald.mommer@oss.qualcomm.com> wrote:
>
> Quote from the virtio specification chapter 4.2.2.2:
>
> "For the device-specific configuration space, the driver MUST use 8 bit
> wide accesses for 8 bit wide fields, 16 bit wide and aligned accesses
> for 16 bit wide fields and 32 bit wide and aligned accesses for 32 and
> 64 bit wide fields."
>
> Signed-off-by: Harald Mommer <harald.mommer@oss.qualcomm.com>
> ---

I guess this needs a Fixes tag? And possibly Cc: stable?

Viresh, does this look ok to you?

Bart

