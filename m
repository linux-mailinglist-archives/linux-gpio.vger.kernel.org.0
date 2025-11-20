Return-Path: <linux-gpio+bounces-28899-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC0EC742A4
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 14:23:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 1663B2BA00
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 13:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24AC2330323;
	Thu, 20 Nov 2025 13:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="meltLZXK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AAB331214
	for <linux-gpio@vger.kernel.org>; Thu, 20 Nov 2025 13:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763644766; cv=none; b=J/F5/MXSw9BdA3mn88g7Q2G0QlQ56h209PQM/xzSj4/7PQ71neRQj/2awx99U6ks94h9E/sP4naSAp+zzdUg+j9Au3g1LQJX4Fb8KOsfXhOlotS6DhyHMQWB2M8MQQu/JtDyoF5gLy/TP/9hjRuuNp9iDNUlq6gx9pM72jUdirs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763644766; c=relaxed/simple;
	bh=N+Pvs/P8yaAJcomIF/27w9FonmnRzGGcQEOUpMwbtSc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tgzAv2rjUJKRD1TtKQ5begGCKAOtpLBuD8CdeYp+GI5N+hsfLOpo4pwv0EXSKUshZUXD/pnUsuKW5+OHPykaSNIdiV3uOeKM5I8atqqOvLFqjXLxqcbHCc/deMGG390JzCid2Dn9pMuN87rrowGQi8/hDuZ+uc8EBKYsN7yHc0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=meltLZXK; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-594516d941cso1014248e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Nov 2025 05:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763644763; x=1764249563; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+Pvs/P8yaAJcomIF/27w9FonmnRzGGcQEOUpMwbtSc=;
        b=meltLZXKv479pUgfmPURegvgnMu6dtLgcL72Rya9G1oDvm6Cr0wnMfeRL8DYVsx/RS
         +dXOco/vRjWYaRT332vPdH/QjH6hrdn0q3gmId69p//VGmtInsR/sKlJhRFudQchyED3
         7BSZvlYt8ZKPsQ+iMKdP2ituVo8V75UeHugl2Z2zTMon4OLbuDdIgeGAkeuHI5IYYy37
         uT7PQoRx3MLyUS+J8ueCTyR7+lXVZrZBu8SHBXVuyRitvNXPk4vg3UXaUqyUnLJ0szv+
         LShjKzMrve9hJEKsK8zo1HaI6Z6jMe0EnLiCnnpQcWf8qvq2gN3di86Vy/4KH7Ri/gj4
         l3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763644763; x=1764249563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+Pvs/P8yaAJcomIF/27w9FonmnRzGGcQEOUpMwbtSc=;
        b=Qz0FeYU3MzpsmRaQqOPONJP65jCGsuUMR0eeY4UlGldTuWZ4TrSDSnXI89ucgH6zsZ
         V6saRRD+1r6suZ33KvvVV6rfF/xjHdP1vv1zA2E5xiKoN0MkDV/UGWtDmroERP6696fA
         7lYn6RYmSf6+Yehr0uej9fm1G+DR5LbhfeRi7heNR+Yj+EImk+aJc0UA/ZH4bzzlOamb
         8tJ72gH7mvCLgG/ujKvlToNmzztivy/gVoSPCa5mrNdY1GaCFAie+90YTlfsfnNGuN6M
         7OG1OzS6SjtggGbY6AB8R51r/Znq9jshWznbcaVj6gWFqMY+MAO996O6BT+W3MUiSKR0
         HRUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmcloKyuUypPW61vAl0Yo2ktZ+kXuTB5vvJmfCpv0qL1cnIkd2TCSf8MM7c6F3rhCw/vsZ1Sb21s85@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4rORY/q3/P8Y0oIsDKApnYf5Y5gTunxHYdrbXDzL7s3dZt9HG
	SKffgA+cVYn+Mp2lSZkEOwamBJC5oUHGrsBZWIQL0NtwlM+zZ2UZ7IcgZGiarn72lb9EPW4cIBf
	Qy5c2mfcaqdQp6BhcPJCy1D9yw9OgllvSA+ZU0ItXgA==
X-Gm-Gg: ASbGncuLbURW+DMKHGSq1ndfQiC+uTDztCal4q77B6EYj1Mx/hJgukGz6IS+qP5Z3A0
	RJaeEtH2x4ugXYG/CWYpJ7l2RotHFBh9+p+jjMAuqEmxB6ma3xqFPM0jhqVQjpZMiAp+EWj05wP
	PtNTtu+/W1RspRe9VL0oWeqXx/6Ps0sTRZYgdyhyj/D4M/AuBlJme5A8G6vToUwdK5+ynYl+wIV
	OWFqK510q1YLpHj0/ervscKt0AZsTTow1ETKGF7nzj03a5mbbI74iCoOeqG+7nPKGoIqLxC51dS
	3HqqdYvyMy8gsbhIMuA80B4D1g==
X-Google-Smtp-Source: AGHT+IEQ5Of/pwZQALzGabgNx2iK3YUlSn5cLYElEN96Nu9WW+rH8ZIKADzTHUZ2rHI3X/Cck3HhjRldNNCydiLySOs=
X-Received: by 2002:a05:6512:12c7:b0:595:81ba:fb4 with SMTP id
 2adb3069b0e04-5969e31aeeemr1132843e87.47.1763644763516; Thu, 20 Nov 2025
 05:19:23 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 Nov 2025 05:19:22 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 Nov 2025 05:19:22 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <aR4EEJO_PeXMKF_h@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119150049.13537-1-jszhang@kernel.org> <aR4EEJO_PeXMKF_h@smile.fi.intel.com>
Date: Thu, 20 Nov 2025 05:19:22 -0800
X-Gm-Features: AWmQ_bkIlwbTZgGoZosO65uRCBe6I-MO9GZQWGgQg5fS3X-qe8cV74I6WtFGmbU
Message-ID: <CAMRc=McJz-omnKZsFLN+us00811bM1Q8Y-jodL5gtCp=OEsEEA@mail.gmail.com>
Subject: Re: [PATCH] gpio: dwapb: Fold dwapb_context into dwapb_gpio_port
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	=?UTF-8?Q?Michael_B=C3=BCsch?= <mb@bues.ch>, 
	Jisheng Zhang <jszhang@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 19 Nov 2025 18:53:20 +0100, Andy Shevchenko
<andriy.shevchenko@intel.com> said:
> On Wed, Nov 19, 2025 at 11:00:49PM +0800, Jisheng Zhang wrote:
>> Fold dwapb_context into struct dwapb_gpio_port to further simplify
>> the code. Sure this brings a tiny 36 bytes data overhead for
>> !PM_SLEEP. After grepping the arm/arm64/riscv dts dir, the max dwapb
>> gpio port number is 6(the berlin2q soc family), so this means we will
>
> GPIO
>
> *and I believe this is limitation by Synopsys in HW, but I'm not going to=
 check
> the datasheet right now.
>
>> waste 216 bytes memory in total which is trivial compared to the
>> system memory.
>>
>> From another side, as Michael mentioned:
>> "The driver currently allocates the struct with kzalloc and stores a
>> pointer to it in case of PM=3Dy.
>> So this probably has an overhead in the same order of magnitude
>> (pointer + malloc overhead/alignment/fragmentation) in case of PM=3Dy
>> now."
>>
>> So let's Fold dwapb_context into struct dwapb_gpio_port.
>>
>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>
>> CC: Michael B=C3=BCsch <mb@bues.ch>
>
> Please, use --cc or move Cc list below...
>
>> ---
>
> ...this cutter line. It will have the same effect on the emails, but it w=
ill
> reduce the noise in the commit message.
>
>> NOTE: this patch is applied against the following series:
>> [PATCH v3 00/15] gpio: Use modern PM macros
>
> It's better to just put a link to lore.kernel.org or at least message-id.
>
> ...
>
> I have a mixed feelings about this, but if maintainers go with it,
> let it be then.
>

I don't mind it so please resend it with the issues addressed, Jisheng.

Bart

