Return-Path: <linux-gpio+bounces-16098-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC326A37963
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 02:07:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 579B13AA503
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 01:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F6D4182BC;
	Mon, 17 Feb 2025 01:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="AAyijUfh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3430D2FB
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 01:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739754434; cv=none; b=FAkSW/3tiWpJTR/9s4rJCbi9CXqjurAU6W3o2aqLm12haqmqF4CEXrAmnxqYBkLtjG1pBcrSi7yPQfS5/H1N3bw+k5DoL0OvqFLpf5DKke7qykv+Fv03EsDg89qio1sfUlvPQGnPH7gMwszJ5xMzLthydTF2Gu9fgGUo2zi+DDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739754434; c=relaxed/simple;
	bh=r0i6heuaVPSa7p0zoaWhFw3re3YRJH3Qsth80J4/D7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fVUYv/f4l3V8HijP2H8d8WAWtc63KtGFXCLBnEaI0pwqFH3/VknvcFNSjR6G3wcnKkm0sw8I0JdKld2HBqZRb9UEePXQxd3LP95mvcxPD8ZiaCrKyWLEChlUQ47S5b72nDNYLV1FMtYDjwSmrvuVYuWug04kmnAO6TB3SETHamE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=AAyijUfh; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5E0F23F175
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 01:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739754428;
	bh=nr0Qsc/Vfc147F5wq/TRUqaKRNYr5hm2ZvifJ1Iio1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=AAyijUfhNmN5pw+GGwfWPExPe4wAHmb6hntrQLdeqQ6Yrk2A0PZ2hzwFeA/LsHc/Y
	 9hWkt2bURyOv9PLW2idgDxTYdl462cmMsRP9Ds7CVtdMGohCZ3aXvEFez2owt6irPB
	 KiSYk2amSvZMmXXc4dtKyFXMspWoakJiIZr72roOIWpcEyicE8ADSrKTB3Jley5UKt
	 2LQmdz1avrALf2tgJGo4hkwY5gDfywKx5Em8+ztEBiAa8R8kQtJyczO9lB6uxXXdZo
	 4yAsPQn9xj2pEkFaWetQHqxF3OYCUJQ7jByTRYl3RwG/pmF5xmLFTKTxjxfW+EdBHf
	 NCV90d8zx+UUw==
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-220e7d654acso62083015ad.0
        for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 17:07:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739754427; x=1740359227;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nr0Qsc/Vfc147F5wq/TRUqaKRNYr5hm2ZvifJ1Iio1k=;
        b=NCBNHVzcumSUaKdDsjK7qUiLHCYO4WLAQXIVpdb8+sFDuZeVGjynaGeu40WpUWdRld
         ecamjJf5sf/JWQjl+/psiBCNQP1PHqtmj1VaT1hfp2M1GLu2sBckfZTcnKMBFnoxpAER
         MwJ4cOesUbYPZNZlzFDcYpjJOwHAbFw7vSRkwUXnhLYDUSzUlaL809SartqjcckfQbjN
         01FHYCV9UdlWs6dfN2ShJ3t2zG4+laUbRfUHlcQI4Qf7G8zBChgetj7jRiKG48r+LPB1
         gKIYUpf4xwH4/urrUR+USLSCggCUaTUa4wCA2H6+FLUFJDsFsz2LuKdzjwmAwDrgTB8N
         9OEQ==
X-Gm-Message-State: AOJu0YzJah+qSo74mJj6/uRCo+N//acj15VjPykq8cafsJ2+b6gqha+q
	MUkpRAXUGmt7pC5jXwxX37XmPqAESX73SvuG9AA1gDMS2/DOnt7hQPZqxh0lZiQ+LigY+0mM6Gq
	oxRUWH3OrbqBwnvv5g1qakVWMctQks3X66IrKnt08zTjxmJc/02ZCXL1Paaomm0qEbt02Eat4cX
	E=
X-Gm-Gg: ASbGnctP+rx2eBNJg1fqY+/GZCbPTMNYrNVPnZ/db9cGlP0ddN3gi9X9ceH080fDp9/
	iZyC+P3dUggt9uMT+TZLxpTL4w3wOmvUOXTMoHTF2qT78UAzdGLlm/m/ZyvVqqKbTGQEOOwpaNJ
	WAbe+YvQuwqVe2H58W99wVv1CDLsi874HLUs6dFEAtFL/g1C2n8BOxX6AHEzcb0S0jITTMB+M6j
	b6CJZZIJbERv8Wr74p7rAA+llO86HNcPquipli6Hy6YMxsXjU6inEWOLnQosWGEQgX98vBapEB3
	Tj3QkPY=
X-Received: by 2002:a17:902:e54e:b0:215:58be:3349 with SMTP id d9443c01a7336-221045be927mr119384435ad.14.1739754426985;
        Sun, 16 Feb 2025 17:07:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGINbnORJERYLV1toDiLsb3YR+F8zpJcdAW1YK15qVKFjxFXMXNTZB3GLtcH9d3rtJlkyPk+Q==
X-Received: by 2002:a17:902:e54e:b0:215:58be:3349 with SMTP id d9443c01a7336-221045be927mr119384185ad.14.1739754426668;
        Sun, 16 Feb 2025 17:07:06 -0800 (PST)
Received: from localhost ([240f:74:7be:1:a6da:1fd8:6ba3:4cf3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d53fsm60989245ad.110.2025.02.16.17.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 17:07:06 -0800 (PST)
Date: Mon, 17 Feb 2025 10:07:03 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/13] Introduce configfs-based interface for
 gpio-aggregator
Message-ID: <qw5epzoexlteotpuulafg4fyjatlsjjko3ldnzjezoumhodgko@a72wjsaw6fgz>
References: <20250216125816.14430-1-koichiro.den@canonical.com>
 <CAMRc=Mef-cg_xt_+mEAyxY_9RfK4=qWEbt_GebeT2mu_8GWVxw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mef-cg_xt_+mEAyxY_9RfK4=qWEbt_GebeT2mu_8GWVxw@mail.gmail.com>

On Sun, Feb 16, 2025 at 04:56:59PM GMT, Bartosz Golaszewski wrote:
> On Sun, Feb 16, 2025 at 1:58 PM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > This patch series introduces a configfs-based interface to gpio-aggregator
> > to address limitations in the existing 'new_device' interface.
> >
> > The existing 'new_device' interface has several limitations:
> >
> >   Issue#1. No way to determine when GPIO aggregator creation is complete.
> >   Issue#2. No way to retrieve errors when creating a GPIO aggregator.
> >   Issue#3. No way to trace a GPIO line of an aggregator back to its
> >            corresponding physical device.
> >   Issue#4. The 'new_device' echo does not indicate which virtual
> >            gpiochip<N> was created.
> >   Issue#5. No way to assign names to GPIO lines exported through an
> >            aggregator.
> >
> > Although Issue#1 to #3 could technically be resolved easily without
> > configfs, using configfs offers a streamlined, modern, and extensible
> > approach, especially since gpio-sim and gpio-virtuser already utilize
> > configfs.
> >
> > This v3 patch series includes 13 patches:
> >
> >   Patch#1-7: Prepare for Patch#8
> >              * #1: Prepare for the following patches.
> >              * #2: Fix an issue that was spotted during v3 preparation.
> >              * #3: Add gpio-pseudo.[ch] to reduce code duplications.
> >              * #4: Update gpio-sim to use gpio-pseudo.[ch].
> >              * #5: Update gpio-virtuser to use gpio-pseudo.[ch].
> >              * #6: Update gpio-aggregator to use gpio-pseudo.[ch].
> >              * #7: Add aggr_alloc() to reduce code duplication.
> 
> Please don't ram this new functionality into an unrelated series.
> Split it into the gpio-pseudo code, factoring out common parts and
> converting existing drivers, then send the aggregator series saying it
> depends on the former. Otherwise it gets way too complex to review.

Ok, I'll do so.
Thanks,

Koichiro

> 
> Bartosz

