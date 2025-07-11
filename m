Return-Path: <linux-gpio+bounces-23151-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A17DBB01997
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 12:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B81721C4509E
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 10:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D08F27FB10;
	Fri, 11 Jul 2025 10:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="POXC6jug"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44F9279DC3
	for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 10:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752229277; cv=none; b=WKt7Fk3XfxlA/Pf51BEHr5kC3V2JOnFNnmU97noEMbXF6iaL+oIuF7o2Y9XJs2DTihhFiHtbzFwYtt9XYBtMvVsbBzMM6gVv+w2eoOz/8TBEbLyDzvyuIUT7+zt3rLgzR8/iO3RoMB3HmRVmsMDM1Y3RMfBcUvD6FK4A5umRyJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752229277; c=relaxed/simple;
	bh=9U5Qw/3AXzJBpxBChR745u6GgyjjbqlHXinlbSjJtnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d4FNn/J7ZRum/oScUdAvFfmRrJBHYdtxIrnyxg1MJSJ12+x37MUYfr8ZiWCqLR+gqJlb2/pBrolKYa/xlrAHYzwUAe9iOUzIMG+pie/K3Qw7GK6+N89kvEpsFZPhQ1yd9811MFSw7YsevSgVmgWhFhCgs0MP88e25dzoIOnd5KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=POXC6jug; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b49ffbb31bso1180292f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 03:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752229274; x=1752834074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucM8ujevxCrED8BMR+hWxz3gAzlP3qd37Xf/zMpVXBg=;
        b=POXC6jugrseP7ouxfWlr2cFmAdErlOGj/sKevMXpG0l3pRCAzX48BwwCEpfHUt51nv
         3fYhA2D9FXVWpY2gBBWjfJicYs2zngDBW5o7vjhtnbNM2Z3K2sylQiCVAF3e+Spj8+rg
         b1AXTxJ1kbzHhkFn+zOOYRAzR3dT4veVn79d55nktE6DDuCKUq2TWy1lAC5EQte5qBRa
         ReKh2c4SoesgnGq+ztSbQsiTwLwbI0p0R9kcewYYqsWxbO1/GWzmxazgSZlcwhEaUdqv
         Fzy4hYDGnxZPWobPEYta1XqviDpT/y6TAhJW3YwnBN5SatjINSinndhYFZFWAMu7VpT3
         Ye6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752229274; x=1752834074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucM8ujevxCrED8BMR+hWxz3gAzlP3qd37Xf/zMpVXBg=;
        b=b9VHEdYpdly1RcRI2vGvp3IyqkUrwwJoirEZNRHn/uRg+fwI/hLO2/qxgISJFqG2Lg
         ByIuv+P0IrGp9g4wt1inzbuits010Kuy+aKVu30HxJSpwVLRdUSL6pXJ3yeZ1rSLedkS
         OFXW3SqKPU2mS+xPSro+SIN9guJFrEdeWueo/pY22RlUUSDCTkPsofb0XdlIAMCaJfJt
         RIBAtRnBXvBNrVCfYwfEi5fsA33TesngevmHEIh74jSrssliPrKxo84e6FqFqF+SubRy
         deKYZSoO0MQdp6LWTlidH3EvWb9Adk1A3mhHCoAOZSDXq65pcfmu9hrrbQhRZ/PtzuAy
         OG5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxfVtzwRvIR3iswiP2Qma7HeH5QKD4A33EEtce5MDqEMSo9hpPxgFbMC7mNAWSCzFO1icFPjFbz/jr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6B+JiIbj9UDdsYRDXppfsvL6YrgVGiJkjXBeOD296gHdlW3fY
	5oKz1I5NCDXMFVACmUOT7/94HHT4gxBvvCyRgCP4rvYQ+TzaOYi0PAuN3VUCEHIPRpU=
X-Gm-Gg: ASbGnctlz0cqkFbM3fBzfTmbrrTqqtrDXZaRVyfHs4wRp1DlmcV6jow4Os/XIbvvxwg
	Q68tpRltbbo2MrbdZ2i1c4u2K4O8lVHmb8tFORGTS5XWwUDxcK5fTBWW8XSRwe13P/hj68D9YLQ
	kmpzBLp7hkzxMRt7cZa1OL0CfofgwxdGFqV1A7p/aKN71dZ6P4eOT2SwsDZ0qnEW0G0PobtE2Aa
	ID6zySh9KLhmb0JRpXOOJYjoH3EWiKx+dhc6OIdMD9x5N6UwLfSo8LLTcHX+6D+kSY79gK9siUv
	baKRXrRRE8B/Q48gwOzzGasZEc9f/pfFCx83HD88dmCPalxJgn8gCBWte43906tBwdQYeSZjk2R
	U1QOhPg/c69hqNpohkYSNfA==
X-Google-Smtp-Source: AGHT+IFKfLwK0/p6xfFnLGZFXzWGAdSY/SqT9MSCFhGWxiczu2skaO80Yn33FTFBelWczkU9tzk9Xw==
X-Received: by 2002:a05:6000:4112:b0:3a3:6e62:d8e8 with SMTP id ffacd0b85a97d-3b5f18dff07mr2432560f8f.55.1752229273959;
        Fri, 11 Jul 2025 03:21:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4de1:8724:bdd:326e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e14e82sm4085256f8f.71.2025.07.11.03.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 03:21:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] gpio: rcar: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Fri, 11 Jul 2025 12:21:12 +0200
Message-ID: <175222927033.51560.13787916709041612909.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <e201140426daacaa799d73e2f76bfd96b6f5718f.1752086619.git.geert+renesas@glider.be>
References: <e201140426daacaa799d73e2f76bfd96b6f5718f.1752086619.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 09 Jul 2025 20:43:59 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas R-Car GPIO driver from SIMPLE_DEV_PM_OPS() to
> DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().  This lets us drop the
> check for CONFIG_PM_SLEEP, and reduces kernel size in case CONFIG_PM or
> CONFIG_PM_SLEEP is disabled, while increasing build coverage.
> 
> 

Applied, thanks!

[1/1] gpio: rcar: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
      https://git.kernel.org/brgl/linux/c/328d48cc0a644bc54c2ab27ee584f3510ae8c6ec

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

