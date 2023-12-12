Return-Path: <linux-gpio+bounces-1322-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C28580F6D2
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 20:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45717282070
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 19:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413A852754;
	Tue, 12 Dec 2023 19:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HsiFg1aL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D56DDB9
	for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 11:39:23 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40c2a444311so59115125e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 11:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702409962; x=1703014762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHCKqEsShPqcjb6XeOamSmX9Zt5UjanurpUFV2/Ak8A=;
        b=HsiFg1aL65TRMp4RKG9W97Zbc04oqV+/0IwYZ1mS6EnRXFDSKaURlGU5ftAFPhawFf
         bAe4fg+KYNlgdkcDdxrVAsYlEKGWYAfnXwqzuepUo6KAphO334u3F2CpXkbsWcuVDNaf
         9uOda+OsxFxvY4G7T+ZTF4XfiQwEA1p865TkU+e4qfIB59yt4Ow7G9ASxU9HQOvCnHTq
         BkWn6T289C4HQFGcPj+pMMULDWBEQnj3il6Zz1sAMDl0NGLBAEsnqoXdjd5jZtejp8HI
         xMwQG/xXxHQIgiFcG0olOGiDTX7MGN59310W6sJm210X/gJ5R8rK8ONG5+jSv5lME/cr
         nuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702409962; x=1703014762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHCKqEsShPqcjb6XeOamSmX9Zt5UjanurpUFV2/Ak8A=;
        b=nd59F9AqygM6/r4ydIdJRuDMHZu2K+x0xa4Gs8yESYukLJrAATNIAJPaqDiJ3dxXAg
         iDlAeD5UAah/Rwb4y+vUt2KhTtSLd9aB/NbjvMEcLx0f6umA3e4L6bJaP/X0ryAH8NHa
         v9c+BSu7P9JmqiSD5RCHXF1BmD4fJzk7icc8rW1KDJTBIRUNeiduKEML/DnT38eOvz23
         4u5tS5jclzw4rBdfGiNNs3+yLeo0YqzMbaDhheCAtJNGBC0+5MrXw4wnELpCxbl3cFvS
         agIXhtp+wP9F/KI8GGcrT1f3F6PCP+nyCc+EY6d/SkdVoMZGNU/d+gRSAzKbFHaa8GN2
         A+Xg==
X-Gm-Message-State: AOJu0Yz++Nrqn7MCrgSmRACk3yF0KN9UVLBW74/x/E9BCNE+JYAs+duf
	f5xQKCDwiDnPhzFDVAdLOcTpmQ==
X-Google-Smtp-Source: AGHT+IFEm8UKTARU0fexc14vH9SqSnbtk/kvHEWMUUBqxyH6Lcs+bK7kJJPq63ERjUJGAnmF5Xwuvw==
X-Received: by 2002:a05:600c:1819:b0:40c:3630:264b with SMTP id n25-20020a05600c181900b0040c3630264bmr983498wmp.249.1702409962237;
        Tue, 12 Dec 2023 11:39:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id i9-20020a05600c354900b003fee6e170f9sm17345530wmq.45.2023.12.12.11.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 11:39:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: Re: (subset) [PATCH v7 01/16] dt-bindings: watchdog: Document Google gs101 watchdog bindings
Date: Tue, 12 Dec 2023 20:39:11 +0100
Message-Id: <170240988143.242356.11503491743323659918.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211162331.435900-2-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org> <20231211162331.435900-2-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 Dec 2023 16:23:16 +0000, Peter Griffin wrote:
> Add the "google,gs101-wdt" compatible to the dt-schema documentation.
> 
> gs101 SoC has two CPU clusters and each cluster has its own dedicated
> watchdog timer (similar to exynos850 and exynosautov9 SoCs).
> 
> These WDT instances are controlled using different bits in PMU
> registers.
> 
> [...]

Applied, thanks!

[01/16] dt-bindings: watchdog: Document Google gs101 watchdog bindings
        https://git.kernel.org/krzk/linux/c/81306efd22fff7eecf4e62919283dd27111f0173

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

