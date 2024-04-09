Return-Path: <linux-gpio+bounces-5212-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBEF89D04C
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 04:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BB931C24190
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 02:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B574F1E4;
	Tue,  9 Apr 2024 02:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AnvRQ9qK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196874F1E2
	for <linux-gpio@vger.kernel.org>; Tue,  9 Apr 2024 02:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712628948; cv=none; b=jibX2WTjz4ycekuYJqqoqookrlagOLwyBQ3llPBBqpkox/vvKMaiCO+sgUxMf2SoQOHW4rECftBYI7ez5m0WDUQr6fod2dUwypziPQ5fI6Mq4BFapCCextx8PpQwKXE8ste9OI9prQi6xNdaVKCjZUnAeYDdtMwrWJGG4TRbrkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712628948; c=relaxed/simple;
	bh=EACAzNMESwHXTAO8TuNLzFl5LsfH+9ZMjLdm0RTjihg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWP748uTzBQ3Bbqma/DP6bqm80tQBdoQESJZNkv3IPjjsBCYcBPjtEXrlATPsP96iEGRXuCL8YyT0fugGQJdhQTJ9qApw5A4pDBynoe+RGzjPTWsJcAwK6KPoCH+6Ldc7A4ASd6AEWe+vBjmtKxSb1pviwgyg7FhbZdTHEzoL90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AnvRQ9qK; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6ed5109d924so1023244b3a.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Apr 2024 19:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712628946; x=1713233746; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EACAzNMESwHXTAO8TuNLzFl5LsfH+9ZMjLdm0RTjihg=;
        b=AnvRQ9qKTsemIpkdzxIsMPV61YrgAUKixP90O2wUDEtAqf6Cf0RGbbBYIch+3/tv3m
         Bt6qHDtBIUMeYS+woE5OoBixG9zBFZEtnzeWtLggPrB54O1rhLMFBp1hnWHyKMj2WvDO
         KxErCZYMcJrhOo/n40k3xsH0ICIyO3Al4WThcSMD/Vi6cymgSfyh8x1T1fUq/jFXuwS8
         +W3Vfu13slNqXR7ONvg9bcNhYvtofrrCT4FWp9ZPywepr6PFbe1FbAJm9LJ7gH3IxHJ1
         P6pAKwkKbPGIwewUKssltRQUN8ksquzeEeJEiLtVSp6A1f98lGB/LkkeCPVm3+DCc8Hx
         C9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712628946; x=1713233746;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EACAzNMESwHXTAO8TuNLzFl5LsfH+9ZMjLdm0RTjihg=;
        b=n+bRk/0kcSqumEhaTW7kzAnBydAHwEjxMkI7jbN3J7SAelXES0BoelZJ0NnRQlC8ZV
         lVxwOTlIHIT8KOdkHxvSRz5z49aM2FXFYdd1GAD3F8t0lRugfJJxUTnppHc/V7E+Zug4
         QpMj2vzJFfSG6AF/auZfDv/E9HOo+KGmyBtRXiNvy7PYbRuXWI/2ICidjupUb76zOvnp
         HkLrHr9JegG0Rr1HEzBpCK1QXax/BNbFSbh0u9CXa3qimhEOMzzgWyddtew0xTZEbxzn
         W2tSoZJ5ZEp+KUmX0cze5NSgE+Pr9wpEiZ4TycZwEaT3xy98cqr/CYwFRFY9etOKdbT1
         8GmQ==
X-Gm-Message-State: AOJu0YzS2jf/kgt61n4+uAcdQeqGkkpGJd2brNYCXB5lhZ7eepQWxy10
	Ko/UZmPc1ThQIWl1NnIkFT/H4SBiGeeMeRZzHnCJtnCg24xDLq5R
X-Google-Smtp-Source: AGHT+IGbEeM1yYqt0THmPJ8epo4onBfLT1LCBMp2W+rGSI5eV7GcFmqToEZwxwMuKjsDTDSORpvttA==
X-Received: by 2002:a05:6a00:a13:b0:6ea:afd2:b1dc with SMTP id p19-20020a056a000a1300b006eaafd2b1dcmr10638604pfh.29.1712628946278;
        Mon, 08 Apr 2024 19:15:46 -0700 (PDT)
Received: from rigel (194-223-186-215.tpgi.com.au. [194.223.186.215])
        by smtp.gmail.com with ESMTPSA id g10-20020aa79dca000000b006ea80883ce3sm7178521pfq.133.2024.04.08.19.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 19:15:45 -0700 (PDT)
Date: Tue, 9 Apr 2024 10:15:42 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Oliver =?iso-8859-1?Q?Sch=FCtt?= <oliverschuett@t-online.de>
Cc: linux-gpio@vger.kernel.org
Subject: Re: libgpiod 2.1.1: Installation under ubuntu 22.04.4
Message-ID: <20240409021542.GA6010@rigel>
References: <02ee3fea-5099-442e-9fcd-4167c7bb4a80@t-online.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02ee3fea-5099-442e-9fcd-4167c7bb4a80@t-online.de>

On Mon, Apr 08, 2024 at 04:47:54PM +0200, Oliver Schütt wrote:
> Hi All,
>
> i am currently trying to utilize the GPIO pins on an embedded plattform,
> a PicoSYS PC with a Fintek SuperI/O chip and Ubuntu 22.04.4 installed.
>
> For this i want to use libgpiod and gpiod but i am very new to this and
> wondering if you could kindly give me some guidance.
>
> I downloaded the tar.gz for version 2.1.1 and extracted into my home
> directory, then installed autoconf and invoked the autogen.sh installing
> it into a dedicated folder in my home folder. After make and make install it
> seemed to install just fine, i could call gpiodetect from terminal but
> it gave me an error: "cannot find GPIO chip character device". Do i need
> to install it in a seperate directory or am i missing some
> driver/dependency?
>

The error means it cannot find /dev/gpiochip0, or more generally any
/dev/gpiochipN, and that is due to your kernel missing the appropriate
GPIO driver or configuration to setup that driver.

So your problem is with your kernel, not libgpiod.

Cheers,
Kent.


