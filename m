Return-Path: <linux-gpio+bounces-18803-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7C7A893D2
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 08:20:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D24F17782F
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 06:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CAA12750EF;
	Tue, 15 Apr 2025 06:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ig8QJL1X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7477D21171C
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 06:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744698052; cv=none; b=pUzODnwEnR3xHphAFcxp0ZTRNOyZWD9uiJRnD22RK94x4cDQfOTh1SIOCL29UoiQ95IXnZNsQ4EjBq+hOnzkruasF7xcvLI3OoXLY/hLBRwfJrSKAzomy+8hlxveBpCFBFsIGN6/ZeC7rJ4h6evyy7XTw+g+3E7aMP1IvDMFnko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744698052; c=relaxed/simple;
	bh=1wXOBOgYQVNqr+xMFUAAYMAmc5Wy2T1Eoh8nZ0KLltY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Qev+CAuYmR4LRuyKWmYapMbCg0tDnyItWGdxaiNDSmjGemMgLIOIwwFFhGMeAPlXH5/ldvmUvLeHkdDwy3yOPzPE+4Exbvkz8uDCLdTN1/tORhuJL9oDJKXwNZH4mfcBoavOxR8rulCpyWAK4NmdfYM9QpOV1YdU3cPBY6zy8O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ig8QJL1X; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e83e38d15dso668985a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Apr 2025 23:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744698049; x=1745302849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rfhPeoEjzIHtAc7j+jocnOEOsiVdj1SVq02z7sozKs=;
        b=ig8QJL1Xhqwwy0hLREy+2K7hmZMcxyrN4K6Lxe+TrFw8rZqJZJOS+tHfsOPuh0S0vD
         vtaeJxABSLClVsbFlQtenxdHomUawuGUZen6+zUb9lCwz2AWP/hPf7HzA3Ah25BXrSKu
         NmYpqpM0hNmO9FxeJtXHpMYoxZWsc0NhruOQupkmq3b0juoNK+v+okKrk403nxArvRaX
         5QmswtVN6Bm+4kzy1MGO2/HRY59Y2pQZVXRhA4Uwn9LKPa9Z1SCagCcCYvMK8GRmxP8+
         ZNs0ELxqu6igbpX4O/pdn9caw/fJ7+Yxxh86iUuUNxJLxhT524Kdzad35GilE3cZFnmD
         vkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744698049; x=1745302849;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rfhPeoEjzIHtAc7j+jocnOEOsiVdj1SVq02z7sozKs=;
        b=a4Gm3cI5Gn6/u1EEcq2mk9aVF1DmDJbhEVtXCnVi7ckOkh1wmTwCHF7SclReW5lSP1
         Pwh4T5nGjW3+sNbZxy0QF8RP2+cnubLKhxvPQk87j7eB9op34n2ILI+YNAXiF6KOFL2h
         qGMl3nxjxzTsOcx6WiNWWAOxYZgt79McTF5ULuKwzuT8anv2ZSqPoMpmTjlqiDwi82g0
         c3TZpXVQmpTzUJN0qcYbG7iA52kuqGH1zJuMHLUGRBEuDqCiCgx7p3d2xAYj23mx9SoJ
         RryKsx1E5+//Y1KiBPzWWQB/pV211FkhC2uOGHmqe/e29UcQ6F1BdNWdkq0Ziy3bXElU
         07DA==
X-Forwarded-Encrypted: i=1; AJvYcCUzYhxfglvbFf1WEzIklI0CyyrnbLkbq49Lf8S1+ifAG30rMVExf+injM35oJyETbymT7z/1XaSlChB@vger.kernel.org
X-Gm-Message-State: AOJu0YxlgN+x9a0n8i4txem3VXmMx7ztpMAdunITLKUWqHjSI13VyqNI
	y3vkc2EAenZBIb+6L4hvoFfe62gtEywpWsi/8xZAz7KR5Syuc0ZbaInGQWv5DzE=
X-Gm-Gg: ASbGnctrRCDP0kMxJtMR0P5mofrIHj/9+JO3tz4s63FC0AsiP/JfGzE9FqqAHLz7WQA
	XEyp0xBbSZNioqX+xhKXWCJr4NlWZe79InHOXd+nTrtqAXzyfUB0Yt/8vshz2kFXSom/oMs1ik/
	xgHStpAiJHI0pgPI8Nd5sbX6FwYDB+CPSgwPhe/pauJWGcubuSbnrs0kIrwOvN/rv52Rlve/zaq
	PIMn84TglLhfViqszFbY84vz0oCNYjDagiM70DNxN2LyYBJI2WA9GdO+M/mg/QhMbZyY+kCKmnY
	7Onw6oPgbQ4sq1So8HPFKFax5DoA85iqCIQYoENTcZ20DoJ9rV8dCDw6mPo2tqCAacFxccI9vJu
	xch+uI8+ZBw3PBAM=
X-Google-Smtp-Source: AGHT+IEhbVvbM/D9UHsiRmzPL9GGSfYHw1Hou6MhR4w4bWsSUPkFLFMOaIpV5Zft9r0xm9z2VHFeZg==
X-Received: by 2002:a17:907:d850:b0:ac7:3911:250f with SMTP id a640c23a62f3a-acad36a20a5mr446907666b.14.1744698048611;
        Mon, 14 Apr 2025 23:20:48 -0700 (PDT)
Received: from [192.168.1.26] (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4129sm1053861866b.98.2025.04.14.23.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 23:20:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-memory-v1-0-5ab0282a9da7@linaro.org>
References: <20250407-gpiochip-set-rv-memory-v1-0-5ab0282a9da7@linaro.org>
Subject: Re: [PATCH 0/2] memory: omap-gpmc: improve the GPIO chip
 implementation
Message-Id: <174469804731.15476.5829884320265602221.b4-ty@linaro.org>
Date: Tue, 15 Apr 2025 08:20:47 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 07 Apr 2025 09:21:18 +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. However, this
> driver doesn't even need the set() callback so let's remove it
> altogether.
> 
> 
> [...]

Applied, thanks!

[1/2] memory: omap-gpmc: use the dedicated define for GPIO direction
      https://git.kernel.org/krzk/linux-mem-ctrl/c/a63f9903a56fabe17a0c71dd0c291499d28214c5
[2/2] memory: omap-gpmc: remove GPIO set() and direction_output() callbacks
      https://git.kernel.org/krzk/linux-mem-ctrl/c/1f34b5a9f09696eaf464c6ed06a055ed9cde3425

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


