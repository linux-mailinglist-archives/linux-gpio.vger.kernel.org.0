Return-Path: <linux-gpio+bounces-14590-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6992A055F0
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2025 09:56:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 571D718883CF
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2025 08:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE4F81F1305;
	Wed,  8 Jan 2025 08:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="E68G6lV7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131641F2384
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jan 2025 08:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736326580; cv=none; b=WfcbUCut+E7w8gQyn9g3de7A52/9QW1qaCFFW05RhWlRBNVjKWlon732bpwshxyoFfZbXOz8XNpNmjKQJq7X07G7pDfpa2Nk7rSMoOZo3HDGByFHbUYiUGNb9JKj4wOIX6IO0opek2LYuV3FfeP2D+dP1tA3x0QVzuUkcVQWJjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736326580; c=relaxed/simple;
	bh=Onk2sSYGQZds3QFhzUS5kPgszj+f/9AnZ44JPnWgoPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bXpeKwHshw6UbbHdqK+JOjgMwXgDkHJY2axa5LfDXXrExWnwuufHn+AaYDaE0pGjtImnKVOf1D5fO5yr4Chs57rBcMSDM47QfS8YcY4Z0olETizdvtzqjovMZdETx29kY3nCGJY8x+AZmHLO/ZurTciOEEKYLvI1OlhUS5KXKmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=E68G6lV7; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso109830145e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jan 2025 00:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736326577; x=1736931377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DO+JB9RNaOgeHTnZl65iiSYnag2FqtwWn60OLDwZTBs=;
        b=E68G6lV7DwthRSzTLx3+9ExGdKfL7XBYIrUxZjxOkQBlZhjSfbeTzH1MmhGo+JdmvU
         oRR5XdGfrOGKJkkYbaTWbzeLDyopA5fwVJHVNzwKVFQVSfGPKv97CmwHKJG50rl9KnVH
         JRVdrMDBpdNpqZF3CIx/Rtb+kfmsvNAzM/dnNtmYzdmtU0oYSoUDEg+iYybQD72yRq1m
         3ZeBO2ClW0DPfwPu1WqFjZQGFqT5uqT1Te/n9Vf5QEcnCmRDtyScRiXBd2tBkHpfQr86
         0lB+8W6Uk5YAfDT7qqL7ZdLTC/WZpV/6y7Tq3kcQua2uh0+B1uQxo9S59B8jcKe5ofHL
         Xq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736326577; x=1736931377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DO+JB9RNaOgeHTnZl65iiSYnag2FqtwWn60OLDwZTBs=;
        b=oGB6W0s/Zqi6cBMKZqntEImvlbKQAMyxVAPZN+zSvitG2CLy8S+ILbdsWChQuSXDsI
         qlSKBZO6kc20yxSPF5T32pH40LLL+3ya37nnNfIAbHRP901ZZ69r3GpF4ChAd/yGkX8z
         +VF3m0Gg/S/jTLhD5THg2+DqPYCw+2ppspp/TT4tJ3hms+6KcEIC7XzwQWkkvIftuPji
         HwqrMCG2CNDJesLoYZ6IYds/bdsFl0+NJDEoyKVUBW5XjzOFU3+A0pPSKcvBRrCqfZNS
         Hlbpdxut7rWLAyufYixHB6ROgvdEEe2FwvcCwQjgEqyTxEfAUr5sedVy1yIlcFTkHzBn
         nL5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBgxBRLxoTYbKjDvwqjGt3zoZeZ+ihgWyYeg7EfX3ePgBTlHJ4zxgd4EoEEVOEWbmLuD9zqhsgdz+P@vger.kernel.org
X-Gm-Message-State: AOJu0YzPAGAoyb73KZkN4l8guc2z8D3RBHN25uD/b0d0GigbAG5003pW
	09n26d+QDEdxQY5176GXE72OHjNMeTNQF6JZtco5MvaqCxl0Sd9W/RJNyj9axSYBM49DxGU891B
	s
X-Gm-Gg: ASbGncvKk/kzyes5Scsdz2M4g2zMU2jTVs8B/4XJUtlCSgjrstPEdjyoOlS6hb4uiMG
	bluVyvYwiRaRWRRjF/1b3luTOeXxzXCimD58Kweym/dlwEAHH9gBjtLI958/7tFY7pHAVwGDFLc
	pXzWRUOHe36D7uU/+DTEzBbtWG83OnwmT8ArnKrqSpDEWNFCIphKhELmM/WKVVJBZ+z62AP9a61
	ZSRV7xAdXwCwvQQw4TUe0TMPVYHQHNU8pnp2fKZ6aiPdLmirC+ewUW4
X-Google-Smtp-Source: AGHT+IETKzpogOxHCS5WOaTSk4WK0hUbdMVAsdx0TJoWpMC7K7QUnIRdsGKQkBaIeB8n8RulNzo2vw==
X-Received: by 2002:a05:6000:1446:b0:385:f47a:e9d1 with SMTP id ffacd0b85a97d-38a872dec76mr1506977f8f.17.1736326576734;
        Wed, 08 Jan 2025 00:56:16 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2bec:9854:befe:756c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c6ad3e3sm54122526f8f.0.2025.01.08.00.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:56:16 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Huacai Chen <chenhuacai@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	stable@vger.kernel.org,
	Hongliang Wang <wanghongliang@loongson.cn>
Subject: Re: [PATCH] gpio: loongson: Fix Loongson-2K2000 ACPI GPIO register offset
Date: Wed,  8 Jan 2025 09:56:15 +0100
Message-ID: <173632657312.7338.10059795793670742517.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250107103856.1037222-1-zhoubinbin@loongson.cn>
References: <20250107103856.1037222-1-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 07 Jan 2025 18:38:56 +0800, Binbin Zhou wrote:
> Since commit 3feb70a61740 ("gpio: loongson: add more gpio chip
> support"), the Loongson-2K2000 GPIO is supported.
> 
> However, according to the firmware development specification, the
> Loongson-2K2000 ACPI GPIO register offsets in the driver do not match
> the register base addresses in the firmware, resulting in the registers
> not being accessed properly.
> 
> [...]

Applied, thanks!

[1/1] gpio: loongson: Fix Loongson-2K2000 ACPI GPIO register offset
      commit: e59f4c97172de0c302894cfd5616161c1f0c4d85

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

