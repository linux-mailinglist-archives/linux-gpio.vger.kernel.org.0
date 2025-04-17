Return-Path: <linux-gpio+bounces-19018-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4BDA91C61
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 14:35:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2A145A29F7
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 12:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E5A23F420;
	Thu, 17 Apr 2025 12:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LEURn2J3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346181EB2F
	for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 12:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744893310; cv=none; b=GNRxyhm2QJ233yHPpLFK3AAhOg5GRZzkHwrpfnXG5+EtzqIhuuT5MYFtqtxh9BEmav33eWbmLbdDT5Pk67wSNTEf6eJO7QPtf+E+zkKnOSH1Xt1hVHC9HThIcUDxlA8389DHsjnBkPjjrESwCSi6p0ACJevPYXkA1irDhg1In2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744893310; c=relaxed/simple;
	bh=KYGjtBdb7XtMLaG0d3QFZTqtsfA5Al+6Ejy4SwFGmOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QY6H3yoMHTihRrS04cjLAUdjGV8bgUmNU4bsjcBNdHOZ7E2P7uvwgvSVjZWbxfPbIXspUA8Yi2WDXNs3Pt03r01syKjTpp+ZAKenf52ApA3QGNTAPNLrKexlna+isFzIzJKKKr0jK2xEZ8YbUucPAud/v/gDbojHv/q8PDgJ/Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LEURn2J3; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c30d9085aso536447f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 05:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744893307; x=1745498107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTuj486eMBPlCuVzE5Ghwv5ENmZwB8uFg3Tiow35Sbg=;
        b=LEURn2J3Kt7Z7fjsD75ekoDTaCUa2Xj9Of/mFCnZFv5ZPdHFJrPv/8AOsaM34u2fI+
         o4ruSdV6JH40NltkLqtUVxULCEDfUOILM8Ws4Ct73q7maEbJTxsCtM2pY25eB08ar/Sp
         A/l8hhxA2m6Ncim/da6oQ1Jeej214PtL9gqnVUkWi6qkbFT5/52A5kuSJmpm5bUNsTl1
         mfxr4piKI+D/zgMGSqlPFYH0n5wbQeHty7kVOddmJkUJY2FJ1VWX7QLvSKksBgepIh7m
         UEO9uYjMbCIIo0tJ/wQCF1KIN4rN+lZ+6bpVvahS6yZmDFlnCmJ0jRp6sjCxItoWT6Su
         Mjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744893307; x=1745498107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTuj486eMBPlCuVzE5Ghwv5ENmZwB8uFg3Tiow35Sbg=;
        b=dAgeMVVc6+B8XsNFEfX6I0W27Z+mKkXjEOmTjYy4jWCRClGJz3pJ8oQGW5wwNxpR+O
         VzqDVG/I8OzwvmHFjBrVgcQbYEyAtvtwgMTYrZH779dq7QWG0srUfEyaDM5u9dmLGiqR
         lNr3vVrM1Q25zSaRvmcbz6jafPPCxc0C4ghl1wusaAxRqyBRN0F9MDyOVOjhfnR/4Wd4
         YgfdmdOc/DGBqeYnc42y5s7XJ2wGgYBNct17gLMQgSsVPJND7gxGeJUH5bSS7UjrR0rf
         2wt1rUBszNpq1qo+yMNJtRKySboH7lXJn5PJlbqRSl2QV8LRzU2tRVsIUSxJTAxkUdKZ
         agkA==
X-Forwarded-Encrypted: i=1; AJvYcCUTc9fnsv9JroBmf/UXUQFOUIU4IsL/Vxn+fWj1HNJ6WBc/0C9WJgE1GUFdcTwUOsnSdDpSgibwWYAC@vger.kernel.org
X-Gm-Message-State: AOJu0YyyTLbFGS2n/wCKw4rtvcQ9Kx7ltgn4U1bm4xXvbyi3sZru78k2
	Ut8IASjRXXZs17x+gNEhDPDe8sNU8uR3t4NJ3NbOtg8xtnpLJkvedRTWL0oRNGg=
X-Gm-Gg: ASbGncuKH+RtKltaj0GWnKAiH8BB/MhJ7YxpHzrTPXBdC7ORQaDY1+Z2SdTLtJ8FwjU
	DsQPG4vEMf1VoZbhIk7ciiNrzSebpED6reWLJJnrJ+jglEvaq58N7hqsKiSedKoAlZQtiJAhlCr
	7HlpNRqmWj5nGF/o6xF8SmMU24D8v+PI7KgZ1WhfarLOdQRYln4XZbDHDja0WrQPXkdktYXU3ZV
	cz9yoK//wiPldzujbScfLHVXWtBQtQC2QAXgUvAWupg/h222DHjbXUT3kvXGcRbZ3nnsDRO+iFh
	LL7DtL3kMhqwF42xpBQrym4gp4irsRkhvBOMhaIpz6MEJ/E4U74=
X-Google-Smtp-Source: AGHT+IHsx+KpPXNauX7YJ1CpF7I0pEn6OThh/kiz1Tij3RGxo6jg5fZyTZOC2u0bvjB+NaEYetVrHQ==
X-Received: by 2002:a05:6000:402b:b0:38f:3a89:fdb5 with SMTP id ffacd0b85a97d-39ee5b13247mr5200859f8f.11.1744893307325;
        Thu, 17 Apr 2025 05:35:07 -0700 (PDT)
Received: from brgl-pocket.lan ([2001:861:4445:5860:9b49:d51a:4244:693c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440666705c5sm14418765e9.14.2025.04.17.05.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:35:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Alex Elder <elder@riscstar.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Jisheng Zhang <jszhang@kernel.org>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: (subset) [PATCH v8 0/5] riscv: spacemit: add gpio support for K1 SoC
Date: Thu, 17 Apr 2025 14:35:05 +0200
Message-ID: <174489329731.7849.17910336598453828998.b4-ty@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org>
References: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 12 Apr 2025 07:31:27 +0800, Yixun Lan wrote:
> The gpio controller of K1 support basic GPIO functions,
> which capable of enabling as input, output. It can also be used
> as GPIO interrupt which able to detect rising edge, falling edge,
> or both. There are four GPIO ports, each consisting of 32 pins and
> has indepedent register sets, while still sharing IRQ line and clocks.
> The GPIO controller request the two clock sources from APBC block.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: gpio: spacemit: add support for K1 SoC
      https://git.kernel.org/brgl/linux/c/378ce04c79d14c730fcee6db9f3076da4078b65f
[2/5] gpio: spacemit: add support for K1 SoC
      https://git.kernel.org/brgl/linux/c/6149376c9ad1777aa4214e13d844f12f88e22dea

Best regards,
-- 
Bartosz Golaszewski <brgl@bgdev.pl>

