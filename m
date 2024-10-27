Return-Path: <linux-gpio+bounces-12176-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A369B2016
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Oct 2024 21:01:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 540FD1C209DC
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Oct 2024 20:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660041885B8;
	Sun, 27 Oct 2024 20:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i+Y6MUER"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E5718786A
	for <linux-gpio@vger.kernel.org>; Sun, 27 Oct 2024 20:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730059214; cv=none; b=K7lQWIh2MZgwhH8KwHm+I/s9COUAf0STDG8y7ER/n1GCSCfK/qRKXMczNgr49E+WuzISZhWZQbdDgk1tB0r7RbzLau/Zb/cLqfpIQjF08lz2+QQ9vDRbyKUkFCZKO9V9jTqT5dpcyb6SGSPmoMyWgpY6/0nxWvjaclGB+caFS5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730059214; c=relaxed/simple;
	bh=Oisesr/Ba1yy4663sg86B9QqB9EYXZllcsyos0tWm8s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mhdVvlV8whX+mnx/PUruKJd1yWCq6Vwvde7uVMnIBuxJjReOBHYSZE26/1Xmw18QTNzFQ1QlzWGUX857nJDfFkuZqgf390AlAREKmZGoQqFwH1FeAHScvHS0xDJozzbr9iq4SWUF7Q1XYkhj+wo9MtLTLfOvYvKba0a5VNwvKDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i+Y6MUER; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d58a51fa5so337826f8f.1
        for <linux-gpio@vger.kernel.org>; Sun, 27 Oct 2024 13:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730059209; x=1730664009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l85KdlkTAz5xadASW0LnnSxWZp9LJjbJpdAW1AcAw8M=;
        b=i+Y6MUERvoKaHDf2nAdJyDki1yjMp3kg5eDpEF2M3M0qkZ34qokdRbtDyE71GEbcWq
         NOehclVtChkClWNt4Ekj6zP07pbeVYdoDBiScEcsmSGrFNB/LfwQDeR643r7sHgUSVlg
         coxJGXCDQLrIzqYTQy2LNMeXr1BFgfVCcMrE3p2J9OqvySnvVVcOc0pMti4Wxj4a7kbi
         PKV8ZA8IdJajO1vt9khKZ1cJF0cHFQMdrjNVq/bbpNpyG2IC9Kw+rSgnZIOe+p4Fsiuw
         jcPXPt4LKLClEgE0KREDK3kBmxbSjTk9JgOAIeVMfJwuzGVmw0gRWRT7wdfLzwQXqzNV
         99hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730059209; x=1730664009;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l85KdlkTAz5xadASW0LnnSxWZp9LJjbJpdAW1AcAw8M=;
        b=lYfUfkekAx/p8n3N8DoqmcnPTuFY9EHLvbyJ+CwC+HqCu6gBZtWrkM5OmRqHlH3Mal
         0kTwnzuin430UbHIPk2S5gTj02BMOdCMLkM+kR+isZ4sR7lHzsv72YMAOo6xHC7+xMOC
         TbsNsa/rrqzS1M+S1o/4mXiOeJfc1B84Ofj7abgvM9OHSzWj8qD8fW41d5mW1cJrkAO5
         h7KMj4oo0oClVVb5rPsE0X9xQJBAUypE6e71ARRiKKZMjGw15a07izW6HaVg/yO9328p
         Eo2NkpTWXhA6U6DH4vYVfUd7xMQ9y32v5u5PKrP8U5RZGj+fh/I4FvfA/e3iBId2P0M0
         XYmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQhb99PWFg3RAc4HqRoeCK8RSf6Mbo/eBibgU/DVTkfQPbep7HWSKRxhv7dkAni3b5PI7XBfs1d0S2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/i9acWZJIK69V6heqo6UZVuEc5C0j51gYjM7Etc7W8YTCMpfr
	Uste8L8u/4l1nFu/zJoR2Bk9JV1TS4XRA0Hf+cWwEKeG2rgdbuI4NF6p8oELw58=
X-Google-Smtp-Source: AGHT+IEmbj/P9TPMmqqzemyzz2y/YY9lE9cW6lfA7r2y8ypUokN9JN2GK7tIgbwhXjQBFs+E/KDZDg==
X-Received: by 2002:adf:c081:0:b0:37e:dad9:8ebc with SMTP id ffacd0b85a97d-380611c3f49mr1617106f8f.2.1730059209345;
        Sun, 27 Oct 2024 13:00:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b6f838sm7506639f8f.83.2024.10.27.13.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 13:00:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Markuss Broks <markuss.broks@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
In-Reply-To: <20241026-exynos9810-v3-10-b89de9441ea8@gmail.com>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
 <20241026-exynos9810-v3-10-b89de9441ea8@gmail.com>
Subject: Re: (subset) [PATCH v3 10/10] arm64: dts: exynos: Add initial
 support for Samsung Galaxy S9 (SM-G960F)
Message-Id: <173005920628.11546.8542073762216918711.b4-ty@linaro.org>
Date: Sun, 27 Oct 2024 21:00:06 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 26 Oct 2024 23:32:41 +0300, Markuss Broks wrote:
> Samsung Galaxy S9 (SM-G960F), codenamed starlte, is a mobile phone
> released in 2017. It has 4GB of RAM, 64GB of UFS storage, Exynos9810
> SoC and 1440x2960 Super AMOLED display.
> 
> This initial device tree enables the framebuffer pre-initialised
> by bootloader and physical buttons of the device, with more support
> to come in the future.
> 
> [...]

Applied, thanks!

[10/10] arm64: dts: exynos: Add initial support for Samsung Galaxy S9 (SM-G960F)
        https://git.kernel.org/krzk/linux/c/229cf465b9f68db9af3f10b31d6a81b49a14f0e5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


