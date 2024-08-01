Return-Path: <linux-gpio+bounces-8511-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CC4944697
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 10:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D2D1B21D4F
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 08:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98EF16DC35;
	Thu,  1 Aug 2024 08:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dQhxNbAs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A03B12E1D9
	for <linux-gpio@vger.kernel.org>; Thu,  1 Aug 2024 08:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722500882; cv=none; b=iSx0roth1fG5QisMlA6THfWf07olMHREwQEK9T4hqRDPV7PclGF9M6LKWJNqsflgChPr2nNMRAUvTvdHVeXW1wYYaOvuBqfZn6OakLZ9hU6pVtIPFIVxDLm0pVnZTQs4UPxyTK7k/8kNJi9mbDIGM9LUf7+z1jYSCaTG9nRJ97k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722500882; c=relaxed/simple;
	bh=14t7yrm0BUlVc8I8hou0LcuS5lTsLKQSJHMSVqOikx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IO4cxFmkQg5aGZoR4XdEgh4avSArgOXLTI1iu/kgR02xAWqBt9Ep/ltKS2gBundZcYxTWq7eKZXePXxKMCTtQmhw03RLBVIUrmP4RNu0yJuVFn4G0paulhgnH3xExLTt/chSlOkLU16yGatOWCw8WhQskW9JEuha3tmC6liq4fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dQhxNbAs; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4280bca3960so44355625e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 01 Aug 2024 01:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722500879; x=1723105679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfj3IDAdmSoPrMUO+6jiT2S/0j8SLb2lIijrfD9qBEw=;
        b=dQhxNbAsXxhF+VmwxcCC4LX9ReNV9wKEIZmxTiH0+PBCYQKXQR+S4WfN2D9MN8QqCk
         bgwzx3KLMXmvtYGiev7yTU5KUYncF0w8wX6akAUglaMtvh5/qs3H2l2kgHp2kXh1mzvx
         N8zDxUwegqJqk3NFB6Kzjl32YGwza/3PofoWbaQERkpWNpYQK879qYS348w6C9RDwngq
         axIjHezTKhP2MksEBCHemGEHlke74n6FbMSZBB//1CX/kFDFyQOvFgRQG5OxM/DWQWBR
         cUyCBkK0txEtIVKNfJarIRYzEd2ZSLX9/Aw/Mj+IFg6UWf9VBzl9IPRC2QiyU0xsuMYl
         y/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722500879; x=1723105679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hfj3IDAdmSoPrMUO+6jiT2S/0j8SLb2lIijrfD9qBEw=;
        b=Oo2w3qmXjDMPS2u2yI10Dt2KM+/0W74CsYfYU4aZaqYUN1FuUmm5yWCl04insD1lqz
         vc8OaxvpzTYnamMgdYwxu804lJKbI1JUV1MKITowuvi5WhsGQ0pUXhkO51KL4RALxLCk
         3Lo/NAo/b27+X7dopF0pFzgx0ayrt4yts2XRTRfMEQFlIEeCcy8Wu2lWxX3622mh/hEu
         JbTxiUFcVJ1vlrlB7iG23qay6K99MckTT/LtcbTJhXO2rrthUUtRv/Oz4EK6lu3CQ9Dc
         TZh++vu36+ewMg+6jTraJKMVDLT+oNgF/OvMeLUCbi70PUuyLoFePckqV7HB2b2QPtp0
         7kSA==
X-Forwarded-Encrypted: i=1; AJvYcCV/DLZVxLRxeirzd0RMSR/TaB53OXJZ2X3pOO0KcD5mqVGVwnNAYmdLMVxf7vMfsG6aMGrxA2bT71Qc4qBL/etSHMlQ6dSVKMWzjA==
X-Gm-Message-State: AOJu0Yys2k5zv50zNjtnFCAhfHa+s2t8YE7dbanaauw4kxozmQbaVKdI
	5xKrBHvW4yGQ+P8KeSirnMP8cP/9ouecadEGM8X1u9fkzTQQVf71ZqVngV1ZbXE=
X-Google-Smtp-Source: AGHT+IG/7fjbSa9KadTynqklLe5rhZxiNbHj0yy3uDg7Si+5S/oRvXESVgpzf2uVfN5hyVwMzACLWg==
X-Received: by 2002:a05:600c:468f:b0:426:6353:4b7c with SMTP id 5b1f17b1804b1-428a99e0356mr13272265e9.8.1722500878558;
        Thu, 01 Aug 2024 01:27:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:9895:bf13:f4de:f316])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42824af6e8csm50101515e9.1.2024.08.01.01.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 01:27:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: =?UTF-8?q?Benjamin=20Cab=C3=A9?= <kartben@gmail.com>,
	Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod 1/2] bindings: python: properly pass event clock settings
Date: Thu,  1 Aug 2024 10:27:56 +0200
Message-ID: <172250087482.11905.15756322661791778513.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240731104658.93117-1-brgl@bgdev.pl>
References: <20240731104658.93117-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 31 Jul 2024 12:46:57 +0200, Bartosz Golaszewski wrote:
> Python binding was ignoring event_clock line setting.
> 
> 

Applied, thanks!

[1/2] bindings: python: properly pass event clock settings
      commit: 2f38f92ae27b1427508cf014815ad33029fa6af3
[2/2] bindings: python: tests: check that event clock is property set in request
      commit: 025693a045f82c9c6cefa6b3d91d15ed05721915

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

