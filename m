Return-Path: <linux-gpio+bounces-16108-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31327A37D6E
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 09:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D374E188FA4B
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 08:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABA5A19DF75;
	Mon, 17 Feb 2025 08:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iX7aPyVh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E211B199FA4
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 08:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739782049; cv=none; b=HOr7M2F8CJS4IWLORSdzvUvUkj9orFD34TVq4HneXf95n76nFfNCZgmacimxdgQ2z8Gq6IQaXvQPk6G8bZwV8yVEwnemEMfnKOFtxDwCE7FeskN0CNb4vGLdTlK+4YjuNu/l7reEmwurw59xHD3pPW22/qn0WC8mmuhsVRSY/zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739782049; c=relaxed/simple;
	bh=Ue4Ul6Y05UncZ32MPE2fSbcYWky4wxO0AMGYilnHknY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uG5pgG4isymwMstx30L+9rLe5OtPXArXAO83OJfZwqT0voz7eHEOUYYVm18VWCHRANniKG3EtFDMUx5fFo9OzxjATk09SvEwe8kYUKZJFeIioPn07PeOWK0F2EUpUdqBUkScRKd9Hn8VcJcugH2i09Ag2xFRDLA5vIhuMyRIFLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iX7aPyVh; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4396a24118dso25600435e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 00:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739782046; x=1740386846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bb3lhINEgDY+UoXToETIm0EmKe9d2I5IoG0cLpEt09A=;
        b=iX7aPyVh7SDwG8IIbYyY5pw8Lq6883K0paGK83O1vRV6iCOLRQn9ggHdBPD3K0hDJs
         qJs0JTnkO+NnTZyBLniSevmx/Y+cZBejdJpY3IWH3xjmS0+gSfEK5Je8oX0XYjzF+vEH
         2hfpHHDHd3WBEMsPcnv1LTmAbLarJF2BbYvrspJu4Moy1rPnkl+RXbOtW2vSlc9mw9r5
         MoYOqfkdNenccUiL6WwtfUpe2zq6lWbyssQM8u/AMNzYG5ivKHCx2iv8dMfBjXJL/x+I
         PB65AerbS7Jlh36x4IjI6y3V+NHQr758DQ+SYT2hQp6rnxGKzlzVCIw3TKYtvIeG4BY7
         pq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782046; x=1740386846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bb3lhINEgDY+UoXToETIm0EmKe9d2I5IoG0cLpEt09A=;
        b=VYwoAMHzSVPsk+1iyxgWLactHpY9i1Y2REPhW5YCbTrsznCtVa/HzGStnwtirzuPPV
         ngh/bJAvppKmLSV5jihmKUslW4GcRT6iwjEmh3hPmDFMUUidktrFyuqoE+I8iPa1yZUS
         2iqqzw0brl2UcR+HzVRrSFvAS/ryu5cpRy6sEICYDys9E7JYFtPSMFZqJRM6HDmCheto
         DkK/LbW5RLbxKNVbwH+NGNnjZ3Kvg8BhDTF6r+UjPydndDnVhE58EvG0Ali0/l0qPos3
         mT6DCwyYkHl53GxfLkZ3aiR4YPmDgAgAA8VfT7FbpvjQDSgyuB4J/Z+2cWcIRcHGELnU
         +t8A==
X-Forwarded-Encrypted: i=1; AJvYcCVHmv3I+poMWDcSTjPYpBrxkmudnuTDsCL6ySXL4bY6Ifbd5A7R2hN09BzwyX3Gc6tbE5D6w+tR+Uk0@vger.kernel.org
X-Gm-Message-State: AOJu0YxXuMSZ/rpSHV2ys72RMxdDVjaZf2eGNizJb6/hQf8vSBuKxRk4
	VaKPvHlT7NJJZJScTJCqlchqcMBp1W90qnv2jAFv/4YXzC9Cnsfhhbg4jZoupAeS03/P6h1y99u
	beO8=
X-Gm-Gg: ASbGncuf+26JiDtmoxzHzyINOuNVtTAi0eSxyqE7LSKwTgNodQpaCAMrIVrreWj5AHP
	yS6UqiWHHXhLuIya9B3HtZtOyCgD3thqE29pkDIW/bMw5unRAxn+xeauUGAAsFdSs6GH8Yf3TOX
	fBRentjZCTFKNIBdTd7D60TOhArfiFXnZ24yXtQXUFaxjpfReIMRpcl2AE/XnTmM5nrMxyNghrD
	TDsBHLTb9uZDN+Du9f5uChOnGrbaMKm9wb3pgJGaTPL53jR5S9XBIjjRrQeZoQudLWD3qPodbmk
	KqFS5USpRlcQ
X-Google-Smtp-Source: AGHT+IFT+lMKOU/deB2J2ddGkT3HluOwPLwaMtnkgEjYGq7pMKOAsYx3SgC5Rv9p/UAiTeKw5JF2Bw==
X-Received: by 2002:a05:600c:3b1c:b0:439:64eb:67cf with SMTP id 5b1f17b1804b1-4396e6c18d4mr79637545e9.13.1739782046008;
        Mon, 17 Feb 2025 00:47:26 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8707:ccd:3679:187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43987396d3dsm13992455e9.36.2025.02.17.00.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:47:25 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] gpio: latch: use generic device properties
Date: Mon, 17 Feb 2025 09:47:24 +0100
Message-ID: <173978204242.97470.9398094804481647954.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211120847.42437-1-brgl@bgdev.pl>
References: <20250211120847.42437-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 11 Feb 2025 13:08:46 +0100, Bartosz Golaszewski wrote:
> Replace calls to OF-specific interface with generic device property
> getters. This is good practice and also drops implicit run-time
> dependency on CONFIG_OF.
> 
> 

Applied, thanks!

[1/2] gpio: latch: use generic device properties
      commit: 3c998af7ceae2c86b4b0e128d5e47b3c1e1f8f05
[2/2] gpio: latch: store the address of pdev->dev in a helper variable
      commit: 80bcee25b592b018203be1ddb20ede8d207a552a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

