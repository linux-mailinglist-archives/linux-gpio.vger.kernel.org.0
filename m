Return-Path: <linux-gpio+bounces-8947-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDE4959BCE
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 14:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA243B219F4
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 12:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711721531E7;
	Wed, 21 Aug 2024 12:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rQbDvdyN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56481531D2
	for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2024 12:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724243370; cv=none; b=CbEPPjy0O18qybmUkUx7tGwlitmyP3F+wuU3wRTrp784HMsXw4s65UozWd8heSX8+BT4fHtyr7eUT8XJEdcLGrO0u911yiY/WjjSgBCG7pNPF8/ajvpo4bUwvwx3HAQ08L1uIce6QfaU76eJQRoGloQSy3QK7dVLAAsfYaHwlA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724243370; c=relaxed/simple;
	bh=55JSZG9ArHtSm92G+/eJtdLoGlrhvtZuPq2qsTcq5uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TDyMoP33XaO99fgv8nZ/x09NIuZ+DXE4eBJstcekPRXgeDSvTSgwQQGkzB9FfeHmXrTfRAJPpLjCjByfSQb22bfdADxUK9C/RTvPg44NNCxzFYD9CoOASUJzYpcIgCFEVZ1wiM+ObRNCDOkbaWL8p+kbSTGfWtyHpu11SapdRtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rQbDvdyN; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-371a6fcd863so2810268f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2024 05:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1724243367; x=1724848167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyD68kUeJLAKfef1FwArtlpycB4eh7cWkR7ymjw6pt4=;
        b=rQbDvdyNdy8rsWlvK4HJTVZ4flrU+wAD6te0CQLFmlU3UUzixjBQ91Vx/6O9gAe8IQ
         pC9uLJB9rawbmzuP9VCbPjdqyRoYgjfGIUKRvkO+4san8DB30aadQYSZ09h0P5u1AZqQ
         DPbIBWVKobUvhhzvtVUIp4R9MdzmEDr3E1Kcv+IHEpFbMfeR/cw8T5jMPEz4am6XveE0
         NLR80C1DOFHyTNBe71KrywlkMFfw5J9lDyHGCg8oUiLBJOkez2ivgSE48c2U8YRUEvtG
         P/F9g4VIu+Sddj7hsg89Yf/3WhFNIYIz45E7V/+uIQX3BxZZIBPdMfzPYHZKirK1kmhi
         RxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724243367; x=1724848167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hyD68kUeJLAKfef1FwArtlpycB4eh7cWkR7ymjw6pt4=;
        b=h+v2AcpHg/PAIenXlGtKP+Nf++yvL4o/H7B6JjHQnb6i/s6vIOzEhCoQ68ldkuHGj/
         VFFcJNvmYAwRTbWgJk7fNLEqHJY3EV9PAGVGKGmJpJP2Vv4eV5jnUiV4t5xywU0qTvNq
         kHrBtJ20lAEvtDVkr0s8vC0EQZwsHuJRdYD/U1YHxf1xkImx/Sxh8m6mKD2pEuItb+yK
         D1Zf8pF3MKK3+HJmyMMBTB+JDObVITCndizgE+Uh+QOwkfeZ3gTHmEAgDpXYabw/qsyK
         QPo332kkVLM47FKQLLeWYluxarFMWs2FLyDf/oBNsf0A9RqAddOQ6ILCOJ+FbmRkBx8q
         uFtA==
X-Forwarded-Encrypted: i=1; AJvYcCU5qBftw5CQsruWFRJTTOVAlJzydGASYjJKJ+NkJqTCNLuaZctLXGaZBjhLNW4A6EADyHV6zmJ2WBV1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6h33gtsedF2naG3WuFw+X0iYdg9yL8wZJtI07sEn48HHWXSAk
	cTG5QTS4/jq6sm0R6nJ0UNjrlURYgQXj1KDwUKoPUI1sWBsZBury40J4SNKGeNc=
X-Google-Smtp-Source: AGHT+IEZOjotabjbznJLwPZVrtanDzeEsedEmfjC+GPFzePP1+IY9JBT6G1h1Cn0YaWhU5cP8pU6NA==
X-Received: by 2002:a5d:45cb:0:b0:368:5b80:b8d with SMTP id ffacd0b85a97d-372fd5c9a91mr1392671f8f.21.1724243366234;
        Wed, 21 Aug 2024 05:29:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:42a6:b34f:6c18:3851])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898aad70sm15574096f8f.104.2024.08.21.05.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 05:29:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: brgl@bgdev.pl,
	Fabio Estevam <festevam@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org,
	linux@armlinux.org.uk,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] gpio: pca953x: Print the error code on read/write failures
Date: Wed, 21 Aug 2024 14:29:24 +0200
Message-ID: <172424336033.20857.4489262506082077101.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240821114202.2072220-1-festevam@gmail.com>
References: <20240821114202.2072220-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 21 Aug 2024 08:42:02 -0300, Fabio Estevam wrote:
> Print the error code in the pca953x_write_regs() and pca953x_read_regs()
> functions to help debugging.
> 
> 

Applied, thanks!

[1/1] gpio: pca953x: Print the error code on read/write failures
      commit: b41a9bf2c64eea119bb6cbef420345f547b9a677

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

