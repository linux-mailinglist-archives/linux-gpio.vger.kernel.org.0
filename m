Return-Path: <linux-gpio+bounces-23354-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AECB071C0
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 11:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1EC6581341
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 09:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1993A253356;
	Wed, 16 Jul 2025 09:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pHGkgxAM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDB027146D
	for <linux-gpio@vger.kernel.org>; Wed, 16 Jul 2025 09:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752658470; cv=none; b=qG2zrVGhDQ56CND09j1NY+RZyI0fN4wfK9Tx6F0cymj2Q8qWzTpolwjvY5dZ3ovIkM3RyZPtIGkQjIB+n4Whl8IMUGRl4LOsrsGIassqMjuSb2wDcYtsolfILxoz3Vb2dk9bKXpacxWI9Euens4uu12m0b5VZPxNG/xeGkb7p/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752658470; c=relaxed/simple;
	bh=Q5vaseOVMicvKjKhJ1PcLGMQRqy2eYGoRNUY8CbcxBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DKKHc0CPYDgru3wTfdGvAI85BS2YfXu9w7QULCPKaqoi2vrpiMr15LxxhGZGwcbtKaabUeuoVIZJiPPuuvyLLp5837I2eis25YXMie0prDVj0S1p7TtI9HGIIoWOLIkzk9k2THTVIaehjPW+wqlD3BV0CZGSEPg0gbffAQs+HNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pHGkgxAM; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45622a1829eso9852905e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jul 2025 02:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752658467; x=1753263267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vR1kEx5MpapX5QiqbMmlgDd5/xNfubElkSwNGlcT7SU=;
        b=pHGkgxAMyzRTPXEEU8yEtKNbxEqHCQI4PO/RGmh4xowY9QEaXXbYrI6iO3I6b0RM/Z
         1Js2y5NcBuppkRH72V4fhRv1ZRLAByutBsLeTGm/p4S/tLyPyU4+XfFqeHhcwWstwWrq
         thTganYcmkn/qGuZKIkMktXUniDHeotNvYHQrEEj76TyHqmL6JF5GQ4rupKWshp5gTbJ
         w4Lo8NWHcgz3Toln0o0Sv5cbC7t/uNwE4muGI8VSEpP7KaG8fuKKzf9dGMTk136Kv+dV
         u2zFoclzhmHDkVCxLIaNa3kY8irW6nJOGOmvQjm/TYC0UPsTkFJJ07R7ykqW6yqoJ5y/
         JItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752658467; x=1753263267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vR1kEx5MpapX5QiqbMmlgDd5/xNfubElkSwNGlcT7SU=;
        b=vFISqO5n5g283eGOihdxqKt6UzQ1znFskLeGca80J6i5meksblzUpRQhFqKXSg8Jkq
         XQYXPHomB4z7qMD7vExg5e/O4lwUDbKm9TKrfkg0lKXkQGD+SyaZhPDk0rMt3REK1SmU
         bqcWscfy+s6xIjLKINrAWyYV+kBW0pjMft1JUZ93kffKRFV5hEVR+3x5cep1kmox4dfC
         961nY95021NRnd5FfqMvEo7815Ns0zbR/y4u8GKh/KgbuqTO9+t1UZtzrgd4k2Sd7Qo3
         i227j4HpSWaap7NBOUHNbLtrw2GI4G70LD4wKzzoDSdGIx4R3PohY1u/wIT+4viSYjn8
         GJgg==
X-Forwarded-Encrypted: i=1; AJvYcCXiUnN1yESSfjJDkEJTa0Tgqjo0m2cIIKQ+h4fqTe+b6waGcrEbmqf04Nk6ctfXKPhnxbfV9ZmByrxG@vger.kernel.org
X-Gm-Message-State: AOJu0YwbQDjnAnVHhFZB+pnSRqHisNKcVmY4OW0uxc8cCnTyPHtz13BB
	NsNOPIx7YlKFa+iOCVtvh03XKwR3EZpIEaryYBYUDwJ2Z37vQmQ7cSIvqNggxZwqIhQ=
X-Gm-Gg: ASbGncts8Ac3yWPtcl/0PDsOxqvISGMSQe9q1Bwxe6PuEHQgkBN9Q7Y/+NJCd5FAmoz
	k5FtCYa370o0nQMuMDnSc6mmrP7P/fiQSLDKW3khgaD8RD1uoitRP5Y8dF6vkv5TK1ulUcMOY3l
	qEEtuG4FDC5qSGKQa06wzN0ZrtOfGKLCpXYQM1E/CGpRVRQ+wDOFDPudVKmz68TNXglG0V3BeCR
	JpcCZncoMIIAAe3zzjv2+yi+glXAzBdCrwKfmYyaT0l6bdQp0Wly6TzF+ToGViqAHemfOSM+dwO
	vqfLAyAdDS3f1RjyjB+5dnKjOsWC9za9FGMIvdBQPlV71B8nU9Bem97ssJmK0JVxgKQceg4hkQf
	vV2FiQo8OOaNTA4MKJ6ERds8=
X-Google-Smtp-Source: AGHT+IFGBjF281E0tPFetmhFR4EVWxWxpTuFGQ7+pIU175wapos6MK+1PLaWqFhEzeIF6rpsAbFwiw==
X-Received: by 2002:a05:600c:8b08:b0:456:d25:e41f with SMTP id 5b1f17b1804b1-4562e03bdb0mr17600755e9.7.1752658467236;
        Wed, 16 Jul 2025 02:34:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:e8b9:11d7:19c9:41b2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e8027f9sm15511895e9.14.2025.07.16.02.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 02:34:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Huacai Chen <chenhuacai@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Xi Ruoyao <xry111@xry111.site>
Subject: Re: [PATCH] gpio: loongson-64bit: Add loongson gpio irq support
Date: Wed, 16 Jul 2025 11:34:25 +0200
Message-ID: <175265846346.17224.4425884504505052017.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250714064542.2276247-1-zhoubinbin@loongson.cn>
References: <20250714064542.2276247-1-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 14 Jul 2025 14:45:42 +0800, Binbin Zhou wrote:
> Add the interrupt enable register offset (inten_offset) so that GPIO
> interrupts can be enabled normally.
> 
> According to the latest interface specifications, the definition of GPIO
> interrupts in ACPI is similar to that in FDT. The GPIO interrupts are
> listed one by one according to the GPIO number, and the corresponding
> interrupt number can be obtained directly through the GPIO number
> specified by the consumer.
> 
> [...]

Applied, thanks!

[1/1] gpio: loongson-64bit: Add loongson gpio irq support
      https://git.kernel.org/brgl/linux/c/27cb8f702eb789f97f7a8bd5a91d76c65a937b2f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

