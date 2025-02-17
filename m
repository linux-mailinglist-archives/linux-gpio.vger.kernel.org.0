Return-Path: <linux-gpio+bounces-16106-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D11FA37CDF
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 09:15:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B650E3AEC47
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 08:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6C3191F68;
	Mon, 17 Feb 2025 08:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2z3v18Rr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A87155C82
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 08:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739780151; cv=none; b=UVZ2oZvqm7sCqGh9MYWALnlYdj5xAoLigjo3TOKN2ynTjNUuuj1Sj2QGVMITB+w9In1COz6tyxJ3kt94Th5h4lfaFUYiulk+sNrN9nDKevyV9FwTZyui4AegnTssP5n3u/HVB4MkpuM5S1CmCL9A7KVek6S9F2vo8IZ2yVqODH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739780151; c=relaxed/simple;
	bh=JbmDUTq3vXnGaGTLeoFijLxTK0aByIFKDc50O6gCEGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TCYyHgSgusWEApPlIwcBR1KQrBTe9AbPmMg+OZjW2gcvqD3SVEFWEk1CUWX7ORr2yHhkUglLRfStDtfYTcqSoHU2KeCLy+b8HW1j+jaoUeyTbBezwM2z0SOkJi8BV7Q1Yff1qmepKNstYhgFZpV6T+RC9bTXyweuap7hVmHB5o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2z3v18Rr; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38f32c1c787so1496349f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 00:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739780148; x=1740384948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5m1MxROoOW/42opukpjJQr/KNqsLV/udyoCCGFOefMw=;
        b=2z3v18Rr+TfBsOWYyIczkuEyX9eiPbk73EbMz2DHG5/Al67suhdoxrt8cVC1oECG2g
         BjUKHzfEO5nvv1W7FaBsv9vYzwgmKvL/gOVwNZKEWsrbwvANlv0LsV8XZxz/YNsGifQv
         KABFm6/BVT9g/6VLOTNe+KIufuNAaKAcFhtMgEOPKaOL61vNt5gv8or2JWTZWoxNp4sI
         oxpF73j6dgrInAjlmECyUt40Na/UwBPOd2c0xhDKEiKpgRt7r1I8HU16+/3TnQ+E5dcf
         5VhpY7rpE33mFYdQNAZkNu4gUPRtTkP7xS7PfS4tEGk+r1ixzTRsUw7sdPyCfG/P4OZV
         FVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739780148; x=1740384948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5m1MxROoOW/42opukpjJQr/KNqsLV/udyoCCGFOefMw=;
        b=EwXdSBliYxmjmGtMng9PfSlwrfxpZYR8Fnk5kPJSAaAcv0Zl5/B4PG2BXe4KrQxXS+
         Ds1P+DMajtUYOCtoNXr3d5Rz3UpjpGSjmQapuQanpnjLoXWC8EVkJ8b0QFCBgUznUVqk
         jm1AymBgJLkCZSJqXOdy2EJgTq9Tx2slf5IQxbqSwXMH98uK2an0jypLVf/Cs6vyf7vj
         xOeGW9yBuQHOf/6c1JiUAmFRV6nDz0+L6VPpg9vfd98o1U0LnFKKSzOo1DGa5ZC9Wn4D
         7Ihr3n9d1OBZR4tgS2uz3qP5dq955hPps8X7Kp6sQyEAZQxzuWso3oBUoLkbfHL8Wftg
         wrOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXog+5S6VZXjxIdzqwCeMXk9Ph/3N+GqcnHkd9zgBZB1PsALjq3LS2FeSp0AWqtE3cS8q9c6gMV9JuT@vger.kernel.org
X-Gm-Message-State: AOJu0YxfsvK0LASwl2bTyupc1+EJIfJKYzDSkkAGLaumXTzVvUC/5Kva
	lJDOKj2YAjU3QMJd7uyPpVOhK39sosNEViQk1oBtKd+aES85HF/X63ms9ctYc0A=
X-Gm-Gg: ASbGnctulWM+QeiFB7jAPFGBSNX8clTG8brYEu5VecrX6aDiw+STXrTTqzuMLKViB0M
	HT31LbEsqwT0yiUOWm11vh65tdpkTyQ0iWD+jm/5bU758rJjNIBwHfj0rsiIvOgT2Oqiv25px3r
	pCcb4VegmrTEgCQXKc0mDMPcCl0un1Cpz4DwKMX1AQGTHcQM8CbLwnAO/SswLnwYXhry8KmTSPB
	aMj5bAmMt427M6JsPFDxcbmZajJFqmyfcy0mC9Bi0THfItCwmRZLPEqyFi+16nf/0MC9sD+dcGb
	vwh54PwiA0ol
X-Google-Smtp-Source: AGHT+IFX5s8tEHg2FDnLcSYOCY8Y1HYB8nLmzyE55INZD9Kyhy1GNfOAo9r4s6QHbUp6HlfvgUv2Yw==
X-Received: by 2002:a5d:588b:0:b0:38d:dd32:c939 with SMTP id ffacd0b85a97d-38f33f4ac7fmr7328884f8f.36.1739780148193;
        Mon, 17 Feb 2025 00:15:48 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8707:ccd:3679:187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ddbbdsm11650902f8f.37.2025.02.17.00.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:15:47 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vincent Fazio <vfazio@xes-inc.com>,
	Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod] gpiosim: defer removal of bank entries when device is not disabled
Date: Mon, 17 Feb 2025 09:15:45 +0100
Message-ID: <173978013648.7264.4457406391885888363.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250214102648.71382-1-brgl@bgdev.pl>
References: <20250214102648.71382-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 14 Feb 2025 11:26:48 +0100, Bartosz Golaszewski wrote:
> Linux kernel commit 8bd76b3d3f3a ("gpio: sim: lock up configfs that an
> instantiated device depends on") has uncovered an issue in libgpiosim:
> we use reference counting for all objects (to make RAII easier for
> bindings) but, with the above change, if the user doesn't explicitly
> disable the device before dropping the last reference to a bank object,
> the parent device will never get correctly cleaned up.
> 
> [...]

Applied, thanks!

[1/1] gpiosim: defer removal of bank entries when device is not disabled
      commit: 3dac2c5d9c2ed3d77e9bcf89e03a6173ca28b9c5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

