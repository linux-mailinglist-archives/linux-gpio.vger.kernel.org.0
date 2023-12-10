Return-Path: <linux-gpio+bounces-1187-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF30F80BB68
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Dec 2023 14:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43EE3B20B53
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Dec 2023 13:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 531E7125B5;
	Sun, 10 Dec 2023 13:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gjf5THU4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7565F0
	for <linux-gpio@vger.kernel.org>; Sun, 10 Dec 2023 05:57:46 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a1d93da3eb7so423441166b.0
        for <linux-gpio@vger.kernel.org>; Sun, 10 Dec 2023 05:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702216665; x=1702821465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kW/HPfKMhok3sdax4/7yRdGspuPrVo40wKyVBvTDbfY=;
        b=Gjf5THU4+bCzUfxOKT4Z0AQ5tn8vUKINgBR7WyCDKCTX/f3+xGP+JNu7QLeMgwtzYZ
         YhPEMcq8dEgJ9DJrPlss9tEICLxgRO+6YAaCUVzL1XM4gfAgZmOwgfXGcQq7Vlnv/h0b
         NJsQgS5wlCMQHJX8lXd24JsBnI1Vaf/zRN03YrSJ6STpwsKVf1MM9xpSqAILgHlAwvEv
         m9I4FDCWquzbEoQWMEE+6t3liT7P9C67A3c2G1c6JYnnw29vdHkiB0f4DCUZIKS/Zmi2
         jiQ9OeuM78EmTQaDRvJZkmh7eKNF5L69OnsiVNVOgY5zCo9XpLo1DvzUVik9iCvyuCyP
         cK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702216665; x=1702821465;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kW/HPfKMhok3sdax4/7yRdGspuPrVo40wKyVBvTDbfY=;
        b=a8PkjuBbQC/J3ZWAaPaeoRx2LJIk/9/xB1S+z59RoVNldZKd7YfwXdJBoc9+jmCEHP
         J3Wa1DV9kPLIFYEk0DEU3GZSd4tU77ZVKS6GjpermPAnda94XVnPRaIrcUauZuNdKLq0
         qjnZ9JuqOi+p29LMzea/dg4Bp2NDugRpfB6Cg0Qj+iUTroalrWRA31fayrn8KSHkrgTA
         0ruKmrNBy4urW1zlwfcFiH9F04tSPYP2EnEs65ibHueZBZxNcnJxZdFYVKRFPZb86cN0
         1vjZRowTWoCE4DPb02MRJT+cVGk7xrCfzeaVWgYK8BKPaR9PhXqzr3CkbemVZAQvRXhw
         svzA==
X-Gm-Message-State: AOJu0YyYAeElU/bZGVaeGZeUAZdA7YzrbKRTB34M0usZUkNK3NP8KKPt
	iaSAZ/U0IPtwE4JvmD3ZODgzIA==
X-Google-Smtp-Source: AGHT+IEiX0Ga0iSCeXy/H7DeCARzWj52tQUW0/WK6+nGTq3Be9t4FyM4BtE4El+v2+woOUipXyOwaQ==
X-Received: by 2002:a17:906:1787:b0:a19:a1ba:8cd6 with SMTP id t7-20020a170906178700b00a19a1ba8cd6mr1495305eje.116.1702216665431;
        Sun, 10 Dec 2023 05:57:45 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id vv8-20020a170907a68800b00a1d2b0d4500sm3442809ejc.168.2023.12.10.05.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 05:57:45 -0800 (PST)
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
In-Reply-To: <20231209233106.147416-7-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
 <20231209233106.147416-7-peter.griffin@linaro.org>
Subject: Re: (subset) [PATCH v6 06/20] dt-bindings: pinctrl: samsung: add
 google,gs101-pinctrl compatible
Message-Id: <170221666275.44902.3863677775174337941.b4-ty@linaro.org>
Date: Sun, 10 Dec 2023 14:57:42 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Sat, 09 Dec 2023 23:30:52 +0000, Peter Griffin wrote:
> Add the "google,gs101-pinctrl" compatible to the dt-schema bindings
> documentation.
> 
> 

Applied, thanks!

[06/20] dt-bindings: pinctrl: samsung: add google,gs101-pinctrl compatible
        https://git.kernel.org/pinctrl/samsung/c/4a2006d0c338c95352bf9f06e5b3cb8afa0bc885

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


