Return-Path: <linux-gpio+bounces-1188-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE5880BB6B
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Dec 2023 14:58:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87FA41C208FF
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Dec 2023 13:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 616EB13AF7;
	Sun, 10 Dec 2023 13:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SMpVsTMq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6733EFF
	for <linux-gpio@vger.kernel.org>; Sun, 10 Dec 2023 05:57:50 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a1d450d5c11so474238566b.3
        for <linux-gpio@vger.kernel.org>; Sun, 10 Dec 2023 05:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702216669; x=1702821469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MXVQUF9hBZSermdBHqSrHFHjSYaowAtJg9NEr1OZEw=;
        b=SMpVsTMqcwEFEGwVT+yllfIUWxyFzwNYiWaPGhAfWPeEsgTOyMBSX264uXslrGk7e2
         YXJ3697uwB7aWMj+JdzK4m8adY2IVDWFsvRWdBc1el8SUwVuJrtlWSqlVRmxeKLegI+z
         PHckKrIT3L8BJUmSm5FwHdClScbYzXu2q6eDieUZDDVOigtngt5D4+32JeF45ftEi2mS
         dKQtEmvNxdvbs++4L86RyH81KU6NA8acqC8B5YC5tDQOrDPjGcA/9pfL5XJD169d8pII
         5Ki+TX2qSnuNi4vnzy3/sUZQd5us80DOGlyFRUDrxJDzjs1EBjfy6wVtdrrOmXZYAzhi
         Aibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702216669; x=1702821469;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MXVQUF9hBZSermdBHqSrHFHjSYaowAtJg9NEr1OZEw=;
        b=ab9fJtXt5Ne7aQ9Mu9s6+x4clSGlzDeK15RHVDBgUEbFjXZjr0RJwM/qdcZpeDkfrd
         tWTxa+FSdi1l0JkxuYX9aBmqOyfl0WAka35ucE9jO1Xx1CZxoAZb6nuIVeHSepvAf0ep
         IyNg/QcgejWMceNP4aoGiZXdWNLBBjR5sk2aJ09GMHt/joOCD2XjAytnplivO1j7aADZ
         XwYN+WuuTMYGdKjQODfQDvzVaoLoalIoyzCBpj9tYY15qpoQ5mj7XMrHqS/A2OvAXWFH
         uHqp5toWzGOeevUavzsqOMUsWHUJUi7XC7GSuVwJ9L0f42FvJmZoaFstIeSvoU5JyCyj
         aTKw==
X-Gm-Message-State: AOJu0YxlPytjwfNNPBx3lUT+9DXX3aCMF+gCq6RT8AuvEjHshZCiDHhW
	EVbd43A55Qu3HPo23EYaiA6vag==
X-Google-Smtp-Source: AGHT+IGD6qb1/At1uCsJLOjEwryh2b+ycrxGGw6w0Sxcmi0IKmT47n6y9juHoaKzTw5rY4NhKL3RaA==
X-Received: by 2002:a17:906:197:b0:a19:a19b:55dd with SMTP id 23-20020a170906019700b00a19a19b55ddmr1382260ejb.109.1702216668825;
        Sun, 10 Dec 2023 05:57:48 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id vv8-20020a170907a68800b00a1d2b0d4500sm3442809ejc.168.2023.12.10.05.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 05:57:48 -0800 (PST)
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
In-Reply-To: <20231209233106.147416-8-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
 <20231209233106.147416-8-peter.griffin@linaro.org>
Subject: Re: (subset) [PATCH v6 07/20] dt-bindings: pinctrl: samsung: add
 gs101-wakeup-eint compatible
Message-Id: <170221666553.44902.5488217525830070811.b4-ty@linaro.org>
Date: Sun, 10 Dec 2023 14:57:45 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Sat, 09 Dec 2023 23:30:53 +0000, Peter Griffin wrote:
> gs101 is similar to newer Exynos SoCs like Exynos850 and ExynosAutov9
> where more than one pin controller can do external wake-up interrupt.
> So add a dedicated compatible for it.
> 
> 

Applied, thanks!

[07/20] dt-bindings: pinctrl: samsung: add gs101-wakeup-eint compatible
        https://git.kernel.org/pinctrl/samsung/c/abc73e50b394f248aa8e7ecdfbd4dfa52f8e8355

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


