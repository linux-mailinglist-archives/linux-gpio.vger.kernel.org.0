Return-Path: <linux-gpio+bounces-17110-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FC9A4FE65
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 13:16:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6067118886CD
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 12:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88B5245025;
	Wed,  5 Mar 2025 12:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bcgMQ+1A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BADD245024
	for <linux-gpio@vger.kernel.org>; Wed,  5 Mar 2025 12:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741176951; cv=none; b=LDHLJG+zfIlGmogBUj+Hu3DC8MjwP7e7coisQu/T3lKaglbY1eGVWCzjjR7kpsRWMEYFHDa2xVMUmCh/oDtHKfEN9avPEEZg/haVMW6dNcN3+nZU/xsd409oxlMm7v1KuP4D+2XKuJtyNgErqj/Us4J8ZBKNjvR5ecmQ3/APcUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741176951; c=relaxed/simple;
	bh=Gmr3CVW4KCL8FrdHAQy2UDexIgSGUd2VWojLQkupXkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R3zoIpVRellDm4VyTu7cxO0IiYAvKtXw2SBqrMA5Uy4JuQQwKyZMy6c7xaqOyIk0AnM8hxtu9hEjHDMrq89jVtx3ATkXXH4SV5rDqc0QvSOC9WXeNjaCW+1d1Daxib7k9eqq7niOhyvXKJPcEIHoCdaskKqwIBEQSNpG6g2sqiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bcgMQ+1A; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43bccfa7b89so13621555e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 05 Mar 2025 04:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741176947; x=1741781747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2GFPnGsi09/8I/8w+iTT/QIwkPrcH5VHbNtZhD12ug=;
        b=bcgMQ+1AEp1SwgynFr4H62rZ80juhRzB+aqgzgQn/82CCKUJE+x+1tOarAPb2daifb
         T4UmJE5rOU7GuhbNnpcedKes89EXXhPzh4T8LtIxrXJ49uMdfZWt+ZfSRzwvPzOyVr2O
         ER9k9QSPV0JOPQh9o00t+Rz/WL3cdB57Y3hjmcRjYLRH0VtlCfcphMSL1vgrO9yLFHgb
         32hyrjTLqNDbWq7nTANJygKVF7UE1Mh5ZxKkM21o5juULlNJT1MDOnyt/g7US2ZbIqRQ
         eDhXNd5mZ/KXxytnXjaIM+R8+wDKazkzCMx4noLtzEPlvRgup+TVSXpR5obp8xv++y9Y
         pZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741176947; x=1741781747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2GFPnGsi09/8I/8w+iTT/QIwkPrcH5VHbNtZhD12ug=;
        b=NsOuLSdroF93fz+lg2CZ56bS3YBDBJEjxQ8wVFZIPvs5dwRf70wwkfNS8qvt82Drwl
         LtFrEVWCd4OQepWmxJWns+cv7+AosI/VReNNRjSoSNUVf/jR2lnh719EvV5R/L3AOdyN
         4w5QFmcaIZ5/8vNxAxj7AbanAine26Y29MpGa81Z2dWTbqEDuiPg/8jAz2BgbcDE5SXM
         tAq3I4mQHmKhE4YGOHcUcOx9MzpzLj3/R204fYeHnYvzZkCsze8043F9JGzTgauMmAyG
         yhdFS2XHo+qtDMja3DQYyV6XhTrk+Y1qUV2jCNdiGbb3LtMEzt0s9GUFTnz/Yv/Pi/qU
         dvVA==
X-Gm-Message-State: AOJu0YyXOQZaSpFCRK56AMHBe/KMYHUKmuIzXztcGdjcX1FqhphRSYxV
	P80L/eV2qrTJB1kDeXS5VmzcSU5037XSedYuf5iSVazBKw/05PZ8+8j+TP/zlMpx91jWFBgxrDT
	K
X-Gm-Gg: ASbGncvt4SdwEQu2EuAjRotjeTB/GEgOa9C5mdy/b3dsJj9NMOxUI7aHeWmQSw7m/tS
	maNNd3hVcVCIl4OCgthYpMMfredXm+4ui2mq6Z+gWbKyPScYFstvAL96JCv5KnD5Ryuc5WmsHR8
	I3DQM4Z1RIc7HQst75LFZMNsZNTVWQotem5Ln3Yme4QbC93EcsKJFi20J2XCuM79NsuAT4hiXJF
	RjNbQEwJP5QBTV/hhdXfBJUTB1sT2lqOyEYlFt2kmBXS2+9Uqpsasd9S7sqhiYcTM9Qnl1oAcWh
	0vEByiKNV08BqpdHD6K6pnZXbI9i3dSaDgbScOh718Gp
X-Google-Smtp-Source: AGHT+IFcgYjq00qPIwqVIYZzDQS3HF2VIF0S3SyacTf9nYgadrmt2P4HSYpN+uMXawLFNISH9Bryow==
X-Received: by 2002:a05:600c:1988:b0:43b:c1ba:21aa with SMTP id 5b1f17b1804b1-43bd2aea5camr18296955e9.25.1741176947407;
        Wed, 05 Mar 2025 04:15:47 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:e514:53b3:5af8:e408])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd426c01bsm16061945e9.2.2025.03.05.04.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 04:15:47 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Koichiro Den <koichiro.den@canonical.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/9] Introduce configfs-based interface for gpio-aggregator
Date: Wed,  5 Mar 2025 13:15:42 +0100
Message-ID: <174117687651.61264.9467200851509383581.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250224143134.3024598-1-koichiro.den@canonical.com>
References: <20250224143134.3024598-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 24 Feb 2025 23:31:25 +0900, Koichiro Den wrote:
> This patch series introduces a configfs-based interface to gpio-aggregator
> to address limitations in the existing 'new_device' interface.
> 
> The existing 'new_device' interface has several limitations:
> 
>   Issue#1. No way to determine when GPIO aggregator creation is complete.
>   Issue#2. No way to retrieve errors when creating a GPIO aggregator.
>   Issue#3. No way to trace a GPIO line of an aggregator back to its
>            corresponding physical device.
>   Issue#4. The 'new_device' echo does not indicate which virtual
>            gpiochip<N> was created.
>   Issue#5. No way to assign names to GPIO lines exported through an
>            aggregator.
> 
> [...]

I don't see anything wrong with this patch so I queued it for fixes. I
will pull it back into my gpio/for-next branch once it's upstream and
apply the rest of the aggregator changes for v6.15.

[1/9] gpio: aggregator: protect driver attr handlers against module unload
      commit: 12f65d1203507f7db3ba59930fe29a3b8eee9945

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

