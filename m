Return-Path: <linux-gpio+bounces-28578-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D193C636F9
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 11:10:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 063B4365D9D
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 10:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42CF0315D21;
	Mon, 17 Nov 2025 10:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="k7WE4E0m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769B6317708
	for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 10:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763373723; cv=none; b=dc8OpvL3rCpeDMTe7j3JVLKoHQiTgGAiZCPXFofI1y6buXm9xMfbxCPQV6rc1jAv7ilEl79VbvBK3pAWmVNveugfgNPJE+AFDIwMuVM0IGpPxq84hmCrjruGVZVRw5UkH/6XldkEz7IOrnilKl5gVSIXm8Is7k8A3opvCLDkHQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763373723; c=relaxed/simple;
	bh=7K/bfM9jbwOW4XuthNQNRMOYaqOq3RfB7rffJft3ZWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EoYWyy1hHU/VPELs/CZ0AFxVrjGMDuhUODdk0rS7BY2n+VhRS9hTsesAMJBLce1cvjD9FocIZYHWUmvZtj34xXoVnXBKvEKYk8o60+cLncjzA8NABQYejrIh/ssbi9JuD578dgFPGfxhuisii+hISpEGOgT1ECArCEnEIdUKzm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=k7WE4E0m; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37b9728a353so40018121fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 02:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763373719; x=1763978519; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7K/bfM9jbwOW4XuthNQNRMOYaqOq3RfB7rffJft3ZWs=;
        b=k7WE4E0mcS6u5O2TUSkn/USa83PSuhj5IZUV5ZoFiCo20/vCITN591yG5GqWUB2xXW
         VHrIInG9O2xrzc/5N8ADqbmUboufonUOXnt0ae1lNOf16BfrCk7fZrWo8CyC6ugk+Y6Y
         kGHBPUr3TWoKxCBo5y1Sv++ToQihjAcGYFJw6K+Qa3lZD1wz2ctjGFsNdMURaJ4rhGel
         0o+dmgdMsf913YwqiSF3FO3Qghjn0945wmy1e8TUBRh5zWxa6r2CEyUjyfcHeeMK2vnX
         6sdEIlHd48V1OnVZH5bBndlojkLUxJ3A3DiKV6gBvFmBG7ztRjEHRWVIrKFLS8B4yvEI
         WoIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763373719; x=1763978519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7K/bfM9jbwOW4XuthNQNRMOYaqOq3RfB7rffJft3ZWs=;
        b=JjnjoQG92iTnBpxu/p1m3sjN+UXtVbvs0PCbgeP3ng2UvxQng4rGB71zkudW6PQg4R
         kfmx8cSczSBjuN0qIaAvHTk7XD6Q5yDNJO4K1sQR4FkhiJ8I72m/4AOcVr2jgcdWVKM/
         cH27s5zOn8AoKrULCPxr8Uokvc+5sStmNfAoV/w+6Ez/3SuBEBEIAHIQmjYyWIUzTKr2
         ZUFLXUVpANWLz5wwb9Aj0idYBDYcFT5PRsOctkDqvTkQ3tcbK09Bky1s9eo83ErNBVfL
         hptqbMW8Q+FnLBhAA/4SORtuNPgHEINmhbWnWE4b5K6M7x291vmeJDATZxRzMyYtWOEk
         n0/w==
X-Forwarded-Encrypted: i=1; AJvYcCXccKCB3fIdRf4sCviEr2CgEAb9cpUK2k4tvlymq4GUpLCpPByOHwuEIYR8lJuz4crZ7d4t23/ou58T@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2rFBKvSQkNDGEDFvACOkMPc87hxyAAf+THH27OfrKfQJj+T6F
	jqXB8331rIJh4D6vhQbewcF0OLT/hnAfQe/mTg+LkHMwXAUE4INY94iKTTWCgvCkNCf01A2U5N6
	YGwmAdPIWt04YYAL1Qw0kFypYQkUePWJI/e0YgxJgfQ==
X-Gm-Gg: ASbGncuOmQKR/e1VVDKPLihFcbB0CbXJHyRnbSCozv8P3qAS8Fdxn3298EvRmbAAHQF
	XpBB2GwMBKivLYz3VRM9OtTrq8/XVUEQWENKBDF2niqaR9IWTg1JjdCMY9ee6NW2/wYWFAV53X2
	GbbIm2dgzt7dOhDqVLj4g1LYVZMQwlwb/RUOHXRansJNqFNEmtPtS9NauRtLV0Vlh0bC66yGVBl
	jHjjLEuKsbt3Bzgla2BNgUfsMAmzEZxLIVI37kHA3/4ako/m3NYxbEpk017XcSEQY8XXU4zNRe6
	GkPKl1cweZvEZhH32hEHPG9uaMwub03vdhRrDA==
X-Google-Smtp-Source: AGHT+IE3+xBS+gd3uoV2Xk/eND5PLCdkGPDleBhbsmfAsNtDhGI1fn9WH9zX7+f0rV/i5TjXitVKRLgbi2t4EEjqLi4=
X-Received: by 2002:a2e:9644:0:b0:369:55f3:57f with SMTP id
 38308e7fff4ca-37babd74c71mr23843341fa.35.1763373719040; Mon, 17 Nov 2025
 02:01:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117001502.12618-1-jszhang@kernel.org> <20251117001502.12618-2-jszhang@kernel.org>
In-Reply-To: <20251117001502.12618-2-jszhang@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 17 Nov 2025 11:01:47 +0100
X-Gm-Features: AWmQ_bkHIl60SUx8pA__CSld4sWGrizYEicckmfiYK59m9OI-7_5Ss73_b-OzmM
Message-ID: <CAMRc=Mdw73GddiJFx-+3Kk114Nq6ZsSfXQjD_Lf0_ta3=2iQxg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: fxl6408: Add optional reset gpio control
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 1:32=E2=80=AFAM Jisheng Zhang <jszhang@kernel.org> =
wrote:
>
> Add optional active low reset-gpios pin control. If present, de-assert
> the specified reset gpio pin to bring the chip out of reset.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---

This is covered by the bindings at gpio/trivial-gpio.yaml but the
document does not describe a reset-gpios pin. This series doesn't add
any users of it either. What platform do you want to use it on?

Bartosz

