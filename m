Return-Path: <linux-gpio+bounces-27207-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BD1BE3EA2
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 16:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD6E53B93A9
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 14:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3802C33CEBB;
	Thu, 16 Oct 2025 14:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="A7SnySTK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3318B31328A
	for <linux-gpio@vger.kernel.org>; Thu, 16 Oct 2025 14:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760625028; cv=none; b=G4dU3GYhzJom7CS4APoUomcmVY7+DQUEaxNh+q/BOxKO5v/hIuUsHI1mxMHxSk9KbhMZ28YsmGZTwzQ8IPZpgxFhvWX4QcTA7jYypYRLkfEqOI4douMPn5XSjmv6zNCjlZ9XTlpJPkoFDTxsVyeoICutfh4luxe9xjneC3nED2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760625028; c=relaxed/simple;
	bh=T0IcD58X1Kbm9j/Mmnqjb35nYoD5ZL5E/cjiyrGur2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DoMCPH84SEuPCtLUBR6517pZagDbdI89KddeqPhEUN7vhbKpuzHBIVDOxFBRk7fxdPvyV8MfZ1pp9bBhDUGEHbrvk18VN7Pv+wUiYPo2jZ0/HHoeukabWm+fnzyS0ohsLqObep2QaoS69kGvvCbyIysIVcE0XoEZj1WIrqhw/A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=A7SnySTK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e542196c7so13214715e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Oct 2025 07:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760625024; x=1761229824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64Z2itRYroa1p/U2gj/hs15ONohF5cg9NpwZeAottIE=;
        b=A7SnySTKeiPFyqPEhqm/eoQhv1G8kH667sm44GSGkAxPPA+AlI4k6XPKNgDiLiu7Bv
         E9xdkVUo+DojngyxeVyFXA+Cx5x2K3XPysh5vQlE18ezXzWXYv0skh6BdCoLdnPXGxIg
         qsMfD12KjY44fEpbbcgEeokVY3ONS5hbyJYo+TqYtGBf2NGwgIA9ll66YotDzWJQS0bE
         +yCrlXSkInjwTTUTHJLUhZ5B0B6/NqtxhZ5VCIAJ4lY0OwRyupoPDfgXTpV/zrwFkROs
         XvdF58j6e3pgFGdJKMr0C+ASSYIvfQuMVgGpa4BKqWhgJdkKfGC1+kXGh8yz4TWcSM19
         ufcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760625024; x=1761229824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64Z2itRYroa1p/U2gj/hs15ONohF5cg9NpwZeAottIE=;
        b=dfnp0KMsEejgA5R2N6On9nknROJH4sVsrepzXm5NGQ5eKDATkoIBCsXHZydITyBLWe
         e+yj8DAMu3lmrGW/sH+qEKcp7ihpGKTbL3V28CmSRZYv4cBe3KXnwbCiV7f6GccW3Kxm
         Y+3nrnpIRaOJdmQOkCi5734m+f50Af2qcbs/flGeEMtk4Q/qhNtMVxYoVjqfjVzAsU/7
         2dXjBv9fYEY1G9z7rLpwaPQ5J8/LK2g8o2ctPctLXOXl2qcQREaJ3uS5NSq4YD2UZyH2
         tNsBwJrorgPDM5XOFyeMX6/9/jx7GN+Afb0u9zmciQM2Tq+Xe/6PaxiXGAnTw6tjyAVJ
         2Jng==
X-Forwarded-Encrypted: i=1; AJvYcCUbsN13KnTMTzU+1lM1LGWqfmclCexbpuxscq3i8hY97t8Ft35k5T1eyCf6P45G9vAZk4sb3ZvnYdXU@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3MsElWH3LW/UGF6YtSdswbxOeit9nciceA9Zjx0gqT6p4HWIL
	tm9VANSu18R2ikFPXDLJIp5MqbEl2myU7M/y0bcHs/rhJo0/MoV+PBejQZb7PjlpiKo=
X-Gm-Gg: ASbGnctL+EJ+eOlmMcy4zUhBhUfk4guqVm3MhEzwgb4/DLC+Kk4I4QqcXXMp46KjI9p
	1JtM8VHbdEZ7CFMiDltdhDLwnhi/ynaE0j2aQr43oopYXrsiG1xOrgtLufgiZBOnaA8UXJS79+G
	1hSKKidoCTeoQDgUGrU5F/YvhpIpAMDtYxLcpQ2b0frL9g8SBBQ/WvAj2tYXR7pDUHg3lPs1v9p
	6cZwKT5+Y6M81Sx9+69DhcEJk15hxWzDs3JVJEBKOeMcHVu1z7TEEpEJFKKv+BNyrIai2Y/xApq
	Lr5kALMeqXWZuIG86AIOWuSnrCPRpD3jIYslQuwOEsuZoQF+oR/YJd7GmlRFFIXp3+awV9ZCTal
	Htq1McCDfNUyGKg3JJQ0NDgBGnrOUhg4nJq17ex1Ic6wQsI+BOYETPZbk0mIEW7GBfduHF+pfcP
	ChYX3Tkiy/Ap0=
X-Google-Smtp-Source: AGHT+IGq3NRRypW29ee0XCD9JMY2kHnXLbqeGs8o31qrq9QzhF2mvpDXcOW40RfB5yhA9DpJg0uqCA==
X-Received: by 2002:a05:600c:4793:b0:471:ea1:a460 with SMTP id 5b1f17b1804b1-4710ea1a4e3mr12346405e9.11.1760625024040;
        Thu, 16 Oct 2025 07:30:24 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ef97:57cb:86cb:f7c4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144d1765sm41639815e9.17.2025.10.16.07.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 07:30:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francesco Lavra <flavra@baylibre.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpio: pca953x: enable latch only on edge-triggered inputs
Date: Thu, 16 Oct 2025 16:30:21 +0200
Message-ID: <176062495388.120857.13832123622797460794.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008104309.794273-1-flavra@baylibre.com>
References: <20251008104309.794273-1-flavra@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 08 Oct 2025 12:43:09 +0200, Francesco Lavra wrote:
> The latched input feature of the pca953x GPIO controller is useful
> when an input is configured to trigger interrupts on rising or
> falling edges, because it allows retrieving which edge type caused
> a given interrupt even if the pin state changes again before the
> interrupt handler has a chance to run. But for level-triggered
> interrupts, reading the latched input state can cause an active
> interrupt condition to be missed, e.g. if an active-low signal (for
> which an IRQ_TYPE_LEVEL_LOW interrupt has been configured) triggers
> an interrupt when switching to the inactive state, but then becomes
> active again before the interrupt handler has a chance to run: in
> this case, if the interrupt handler reads the latched input state,
> it will wrongly assume that the interrupt is not pending.
> Fix the above issue by enabling the latch only on edge-triggered
> inputs, instead of all interrupt-enabled inputs.
> 
> [...]

Due to the potential impact, I will not send it for fixes just yet but
I'm willing to give it a spin in linux-next and see if anyone complains.

I've queued it for v6.19.

[1/1] gpio: pca953x: enable latch only on edge-triggered inputs
      https://git.kernel.org/brgl/linux/c/9f0fa1801fe4503eb119a4523a59a494768fda5d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

