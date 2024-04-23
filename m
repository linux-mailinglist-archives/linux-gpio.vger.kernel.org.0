Return-Path: <linux-gpio+bounces-5759-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC918AE8BA
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 15:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6EC5B24F1D
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 13:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340511369BC;
	Tue, 23 Apr 2024 13:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m88+BXqe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2095A1369A2
	for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 13:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713880443; cv=none; b=KFp8wszpNJYxVJBhvTly7hMRCeK1mOuJUaoqxBY6F1u5KGW0k9/ssQ/Y60Rb2uET4yrylTL2uKhc6nOPGj8AwR42FKB9lL6eTDHk0+fgQpt4bBz5azy22dWVR738jeynDDcGV8olvFsnH8sBY+2o4gG3oSIZsThDTVmRppSsDro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713880443; c=relaxed/simple;
	bh=lI8s7owPpwByD6RBM7NHPi7jr13y3XDnCKjaFdUwjWc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nbpMkmRZ5YUzgd7wA05jpjA2fDMupKK43d3IQDIZfEQtBI5L7qlAmqLAj268cjO9sB1sLKZUwJZ9b1qihNQBYHpPcDxFpwHqoLKg9YnURGKP3UnAVKTvk2XZndfOq7mSDj4IKoC+hr0gUzl09qcQgsrHoh+8BnpIF8jfejgCS+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m88+BXqe; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51ae2e37a87so4505390e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 06:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713880439; x=1714485239; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=66DV356nl07B8s70QCWM5H1mhDJnsNQGWmnd/8jOjIU=;
        b=m88+BXqejBwLtkDrGq6/v7M8QzujZRfz5jTdI2ReXj6HQu8l0BSMjE+/0lE59GKLsx
         /KjPRHamHMuqqCQQT3XRu31qY+NnQicWnGSAtHcYuT8jmMk5scLytC1AeY3xxoDhBFF5
         Bh9/GcrwEUOg5PvTbq7R7NUn8+3ZW9PwSBPqFE89+FadxkqB4C/JWl1g0/FDw/E4YorN
         aHuDIfji2lN0FaeUaqTxYvmxjp3nzok/q3d1xKhKEb1TCSPJv2k8KMj5jgxy7bpnT5BU
         NC4CtJ1Nbwk9YnecknsqGXNFfRsUqgv1+Es2VbmRROuABKyhCsaS+C2qV6RfVMih+sZs
         sc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713880439; x=1714485239;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66DV356nl07B8s70QCWM5H1mhDJnsNQGWmnd/8jOjIU=;
        b=MPk9RJZmGNvR3cyZ0WEKoJf93LubFqD1NOBrUxH5cH3GFTmd+gWJzXkwSbmOIlEgne
         XZ+cRGUdbvrK365dKVWpCGYXPm6GL5a8WafOt/zNyIV66x/oHER3G+2cwNEpqGvLF8Wf
         ISvnTArSsQLz9of7NSPfad4INdA1+g/XTJW9sHIciWN7MkjuvYsuRpPOCKl3g1qIGIwA
         rVyCmuUQY3oFDLqCxWFC8CG620BvJ/O2+m1BJaotjAsH8+oXwQEQutf0zEPEuNXRWpsq
         hSplnnyPEYqPouDortDCkeNp5+2cik7Un12obHUmiZC4OiRILpWDmGdqMF/W1F56NksE
         ncTA==
X-Forwarded-Encrypted: i=1; AJvYcCUU0W6l3Q2VAK4Rca6tk3hA1yYYDHduBEwGqFWczqllnBCi5LGqirmEoD9VF5uDqRvOcDbwvAbfbe+NLu7vBLG7YKlTsQzCA0OTEw==
X-Gm-Message-State: AOJu0YxS3e1TRS4gTXtyy8w/Oy12UFusxQAPxNvlRXhwxOnEmQ2D42t7
	nbcp1Nxs4HLGjWzrfbxw/hiyp3A44X6Nt1iquar6f6PpyLG0dlnKimdfIeqgg930tRtuNAmZV/3
	W
X-Google-Smtp-Source: AGHT+IFWeokGbcRhJU5XEUlY7hLxYHlCNeke73KzR6lYd7KgpcLeleHIVBSpBUji33s4BCx3gMhpDA==
X-Received: by 2002:ac2:4a69:0:b0:513:b062:98c4 with SMTP id q9-20020ac24a69000000b00513b06298c4mr8574686lfp.11.1713880438992;
        Tue, 23 Apr 2024 06:53:58 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id b18-20020ac24112000000b0051a61f2d251sm1875997lfi.290.2024.04.23.06.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 06:53:58 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/5] Decrease the usage of global GPIO numbers for LEDs
Date: Tue, 23 Apr 2024 15:53:56 +0200
Message-Id: <20240423-gpio-leds-v1-0-799c2f6bc61c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHW9J2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDEyNj3fSCzHzdnNSUYl3LFFMLk2TLRAszU0sloPqCotS0zAqwWdGxtbU
 A1ZbYwVsAAAA=
To: Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Gregory Clement <gregory.clement@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.13.0

Fix up the orion boards to use GPIO descriptor tables
instead of hardcoded GPIO numbers in all board files.

git grep 'struct gpio_led_platform_data' gives a list of
suspects. We wade through them and root out the use of
global GPIO numbers in favor of descriptors.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (5):
      ARM: orion5x: Convert D2Net board to GPIO descriptors for LEDs
      ARM: orion5x: Convert DNS323 board to GPIO descriptors for LEDs
      ARM: orion5x: Convert MV2120 board to GPIO descriptors for LEDs
      ARM: orion5x: Convert Net2big board to GPIO descriptors for LEDs
      ARM: orion5x: Convert TS409 board to GPIO descriptors for LEDs

 arch/arm/mach-orion5x/board-d2net.c   | 16 +++++++--
 arch/arm/mach-orion5x/dns323-setup.c  | 63 ++++++++++++++++++++++++++---------
 arch/arm/mach-orion5x/mv2120-setup.c  | 29 +++++++++++-----
 arch/arm/mach-orion5x/net2big-setup.c | 21 +++++++++---
 arch/arm/mach-orion5x/ts409-setup.c   | 25 +++++++++-----
 5 files changed, 116 insertions(+), 38 deletions(-)
---
base-commit: 4cece764965020c22cff7665b18a012006359095
change-id: 20240423-gpio-leds-9d584c9a8659

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


