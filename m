Return-Path: <linux-gpio+bounces-1191-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 954DC80BB7E
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Dec 2023 15:02:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 850EE1C20868
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Dec 2023 14:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8491154B3;
	Sun, 10 Dec 2023 14:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oAvzc0hw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ADC1107
	for <linux-gpio@vger.kernel.org>; Sun, 10 Dec 2023 06:01:53 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a1f47f91fc0so402716066b.0
        for <linux-gpio@vger.kernel.org>; Sun, 10 Dec 2023 06:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702216911; x=1702821711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTZxAHIX1rL75b27TvFbnniJkwAzSdlfQSjl1vKsIKk=;
        b=oAvzc0hwebnyhwVkpU0UTpBWJ8CrAL0Nfg8VSaO/KMct/LND3/CiGiZDPw4gPNwwTK
         NTOI814IAY7unTy0fSXwm6nMiGtOpId2yTH2Td0Tll/jJUjCiuQKHxeAkeTVQ0AbNvmC
         Mg6ZKiBIcM9QMibO174+TAcJy9oBDokuzPG1soJxiEk/3CqEpvi0M1eawb9BRAsMFVoa
         QwQ+ATMWEc5hJ6fIuyFXhsWySfHkMyHWqT9JVPII24maVhB6a0GY3FcxMMB20XNMNy67
         U4pb2K/AhIrKT+ckAuaL15/wcwTtqD30kmi/TLK1QVQ5b6rsw7ouZXMWPJoGAwuyf7uf
         RHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702216911; x=1702821711;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTZxAHIX1rL75b27TvFbnniJkwAzSdlfQSjl1vKsIKk=;
        b=D7fJ9TTUEbviMDUGEMPdo5vS4n1VjxyuikltR9Eyu5aamBYp6XHn4it8kDccILCxoZ
         xhgAubhCZO11kQWl2LM2QW9lbJx/Ea4OnF8oCMoqA2sbi6w97jBm/08nBYp8vBhk/M7G
         XkPetxKswbQvLOpZwsblYqs0h+eUL7+Rvv9W8QFuIkq+CM4T25RyXtBrdoxj8vYNoA+Q
         WLlqnuT/sVtQ7IDdfKomj3EOzkXZSzrZSJCEYsh9ik/Gsy2GqlB2PGYj7HjMgXqibM73
         f1JTLUWjwQjLOnMKrlwHkypBTIUbuQs+XZy04xs3V155Wj7L7HVt1inYRWsdpP6PnbGl
         fKgQ==
X-Gm-Message-State: AOJu0YzGHbHn93na9wQRRXSOqaZ8Pc0CwERg1atblsU6CkMo0xQoBsd1
	krmjALRaC5fHEM3UgdXTgAb+8Q==
X-Google-Smtp-Source: AGHT+IG+wbBd6cLWuNE4po6PuceIR8qhG2PoLlIqxdWq6sdNFUInBbdaSyN+vuocr9pFdiEjB7x5vw==
X-Received: by 2002:a17:907:961f:b0:a1d:530c:af06 with SMTP id gb31-20020a170907961f00b00a1d530caf06mr1820606ejc.65.1702216911480;
        Sun, 10 Dec 2023 06:01:51 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id tg10-20020a1709078dca00b00a178b965899sm3458691ejc.100.2023.12.10.06.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 06:01:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
 tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
 wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
 semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
 soc@kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, kernel-team@android.com, 
 linux-serial@vger.kernel.org
In-Reply-To: <20231209233106.147416-4-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
 <20231209233106.147416-4-peter.griffin@linaro.org>
Subject: Re: (subset) [PATCH v6 03/20] dt-bindings: soc: google:
 exynos-sysreg: add dedicated SYSREG compatibles to GS101
Message-Id: <170221690857.46013.17338443649836417871.b4-ty@linaro.org>
Date: Sun, 10 Dec 2023 15:01:48 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Sat, 09 Dec 2023 23:30:49 +0000, Peter Griffin wrote:
> GS101 has three different SYSREG controllers, add dedicated
> compatibles for them to the documentation.
> 
> 

Applied, thanks!

[03/20] dt-bindings: soc: google: exynos-sysreg: add dedicated SYSREG compatibles to GS101
        https://git.kernel.org/krzk/linux/c/d9232785858eafde8553932f96fb7e25c2191ed2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


