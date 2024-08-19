Return-Path: <linux-gpio+bounces-8792-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6C995654D
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2024 10:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76D9B1F22B93
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2024 08:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E533815B0EB;
	Mon, 19 Aug 2024 08:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XbAHXiPs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4541C15B0E0
	for <linux-gpio@vger.kernel.org>; Mon, 19 Aug 2024 08:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724055151; cv=none; b=hIeUs3EaDN0KLde+BEg2nyz7G2EWeErv/ZFRuJNLpehajGY+rmaZqPv3of9uO1x45Ft6sC2V4/K7OF1GSM8ZsfVLU5I27mswO4DnpzzD7GhjGEtl0QMecjPrZ0WK/97JbUs2N2ToQ7EeHDql3uTThRNXClHyEF8m1YOhO0AQ/zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724055151; c=relaxed/simple;
	bh=m/l+Bps0u2vDb5A2UpFxxbK4X6BidAw7lcMthb4l2Bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=idHhljXFqa4Ro0mRL5Ps97/SiC+97WoTycsTs480e8+h5F9DN//WvgbPGUg0ToeFtfeNEOQRgNm3aPyO0veZptGYdNF8RALTWJTwVaMJOkB3Ti2J77GEcUaUldeeDyO1iXnA0NngyWa+k9LCKpN1HzT5r2P48f72vri4dthY9Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XbAHXiPs; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-428101fa30aso31905635e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 19 Aug 2024 01:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1724055149; x=1724659949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOo7QE1A3KxBwwPzaPh5kYBCjStY+BbtyaKqXXFLTrA=;
        b=XbAHXiPsnyPXR7/nZE4JGsjoaAvZOzDV9vnXF9Pv09kDE1yS940FZ/0Nv7sV2c26wt
         t4ZxxuW6J1tcgwscmnLczjU4sX9drN21XBL73uq9U+pUabABI+vRRTdamzqCJw1lG3+t
         zYbRzg+N/ws5Bg7nm2JT3cyIITS7Tt3FvH3CIMW+mbxyyjMHnRS4nBrJKtoKHuFCj7LL
         2nd3GamFmwiKVzDYe0aKhadeLvLAmM9rZNeWXXVIX8R0ROYnt7Zeu7z+NRmtRYtdzBuO
         tkZygb1IY85MvjHidDDx65lfTmr2W/1wGqHlsTRouR6SYaDhv43zsmpWcmJOwtiV9nGV
         LVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724055149; x=1724659949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOo7QE1A3KxBwwPzaPh5kYBCjStY+BbtyaKqXXFLTrA=;
        b=jnhoJQwxF2AXOxQbgERcys+mOm3RPjhiZZG7eOq3c3WrN5tmUiG9Fhe08WiYG7whne
         8aH8I9EkZMGS+m2BGZnE95KnawHrNnySeStzpAWzp+LOjJX+k9B2Bt7FaEtt5EHnUc6A
         w31t8LIJWZpTFm86gvi9csBD2slnCbhtsyBTNEQKftAA4odasEgqenao2KxoV3jgt8ts
         fayXmkZ5ZqTFHyUz9aRQlYB56SUv3NocxDv6qE7WvltZNospQM0hYubSiX5j6O/RKwx0
         IMGZ98dM+K9XRzVzkSEupLuTOqKyrbVLC9KTrsSmpFpNe73zFbaPtVDA44qs/RFpXkSH
         Jtaw==
X-Forwarded-Encrypted: i=1; AJvYcCUCPXNzcY4D8noiPRmUAfeBmClP91cwRdVyMrpIR767EDhYPs9euOm7XV7CkWtQsg1HtkW3g+3R00H8YpIsTRovrSAjZS2GPLqcRg==
X-Gm-Message-State: AOJu0YyoB5cHffexIjjepIgMI4ZKYugYVL2vheG3l/r3LoAW3Ce5P+32
	DMCeM5k6vbgjHN/CzL2PBARUA/a1JaRInmKw0d6igSQICwt2NVkEqPqjihigB6g=
X-Google-Smtp-Source: AGHT+IFQTeL/XJUq27NXC2pfrvS09EvQAxplLKgrQkp2u5hv3HlH2OvHBmMhkFnpwrLcUEpWPOCeng==
X-Received: by 2002:a05:600c:358b:b0:426:68f2:4d7b with SMTP id 5b1f17b1804b1-429ed78562fmr67358285e9.3.1724055148156;
        Mon, 19 Aug 2024 01:12:28 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7b55:8f70:3ecb:b4ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed648f55sm100162265e9.3.2024.08.19.01.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 01:12:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpio: of: simplify with scoped for each OF child loop
Date: Mon, 19 Aug 2024 10:12:26 +0200
Message-ID: <172405514339.9655.5953861156513618735.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240816151356.154991-1-krzysztof.kozlowski@linaro.org>
References: <20240816151356.154991-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 16 Aug 2024 17:13:56 +0200, Krzysztof Kozlowski wrote:
> Use scoped for_each_xxx loop when iterating over device nodes to make
> code a bit simpler.
> 
> 

Applied, thanks!

[1/1] gpio: of: simplify with scoped for each OF child loop
      commit: f2c38c96d51093a38af90e46bca813c7dff671d7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

