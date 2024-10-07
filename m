Return-Path: <linux-gpio+bounces-10915-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D79F799256C
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 09:09:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F44EB2249D
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 07:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70CA187332;
	Mon,  7 Oct 2024 07:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0QAbrDp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186FE1865E7;
	Mon,  7 Oct 2024 07:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284931; cv=none; b=uDJ8aJI7jnEVSXHZG5o8Th2Cy4JEWdxfKetrMGt3O0lTjS0+rKTDDADFXCauTub6knygyo6y8ABT0QuD7voB0XH9NmUYwkIiVNwufyqsjHD5K/xeTsL3Etzkte1e+mYmDB0Shb/Gevf700VNk0wMYQIueIvus22ZOEdUyDw+DN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284931; c=relaxed/simple;
	bh=GQSksQ96S7zlcAvNDUY1NnWPyZSqqBA79BGkHM/xhx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AeQyQqajOjMtsXGWdwyoTxXudPCYfapBaalxJtiTgIeL9ZgXdSBrvbl3C6rXpVnQgn0SR94rE/XvcU6ety+nFwfSMB+DJTsoePryJqL1tCowUoRZmJ47g7KAHEZmIylyq8aRxhlB/PFV74DuJLZn//hvkIaH4AhBXbHnhWn4gM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0QAbrDp; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71df1fe11c1so1272659b3a.2;
        Mon, 07 Oct 2024 00:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728284929; x=1728889729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4gV2Y6X/a2+9Wxewo4YqIzOHCrZcI/yvqqITYkikdI=;
        b=d0QAbrDpRmqKvXvYuY7qKKzE9rfBiFjTaD+PE2T7lhVGYfFsBhtlFVENYarQCGpBgf
         irO6+xY4rAvWqFnepoJxuW/K/0PRpjcJdkZmh/BsbpLmXKllwwB9Wqndy6Ce4l9cxrm9
         YDjon3br/GhTPZYhphS3WVQizW09DEELpzZobeCdzD4BXqc7cDODim9ynFgW8ieVsMSL
         23whg2ZAajVeJ380fiABki52qWpRPJod6c7voOJyFdIsxInhflAjLn5B9mmio9z2NmFE
         2QQ7iQmGNHPWI26q2H1gbFj6q0ITXQVamWbXcxDFI2jmTO3qtdZi1nxcc7PzGnUBTXTh
         KiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284929; x=1728889729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P4gV2Y6X/a2+9Wxewo4YqIzOHCrZcI/yvqqITYkikdI=;
        b=X9NHlgXD9C44wYR2wPB3HRJ4iinqbfIAXLLE2KW5taBz3lI6I2FK9gECEI2mArHJ+m
         hyO27P/Ps8DEQUZut2tNdQB503SwXyhDKl1IGTPuuzWf8cIJ6kzWqYBdwHbS0aJOH46z
         Qi/Yk8FYxpPqFceGeLNt0FBt3G05+LOsaO8muokfv8dshu8J6w9U5L3sVVSncBuSetM4
         SDJov+TXdcdCj7xIL2lOPm8G89hTC6oBjf3F57FPa8XJ2nybmkwZ6sF+7cJVsJjTwRFY
         Sa3jkwsPSQNPbZDk0WL3Lt+pgasEf33UbCeLqzP4z7oXDiS/HcA4frEIo1AmZIuT4+Gr
         Ae/g==
X-Forwarded-Encrypted: i=1; AJvYcCUtquZgTzlF1pxGYrTAiw6KzQwqh+l4eBiLqjZxomiDebRiiA6Uwf7lDwD53oEYSUpxVS55kJn7G2NWKgP1@vger.kernel.org, AJvYcCW4TgPEz2erc5gdMQdoUuEmP1Gjrvv1YTnzHXSUaufxVmg5bj5adc6lTO1E1cIMrJuc2z2F338tNuxB@vger.kernel.org, AJvYcCXRqU6vcx3cqLyD9f6d3rzxWD+Qwm7xIedugVD/bqhztCvI58OLxOrgO9PTamK8D/gslFJCgNmr4Toe0w==@vger.kernel.org, AJvYcCXeJNGRZ/3Y5OIYeYC8SwDZyf2WCt34iGxnvmmcXg6R0MfqcHeGGZdxOAONpUN3vH2WoqQCMooPRb2I6vozwm8=@vger.kernel.org
X-Gm-Message-State: AOJu0YysaWsXPld5zOB0C0txUxM30AJrjDpEFHgsNHsznqZHEz9HthHd
	wczw0QEZOiqa0pIMAHgk6PDEglLLS1rwzXwaIkGTBreFcYb6qb0d
X-Google-Smtp-Source: AGHT+IHIEWrYvgGHZlS6oVwwmLwGg2XSistN8iW5sd/6BIcTu2UH8xaCU0Leii+mUwM1dCd7PcYm+g==
X-Received: by 2002:a05:6a00:2d15:b0:71e:209:512a with SMTP id d2e1a72fcca58-71e02095209mr4635060b3a.18.1728284929318;
        Mon, 07 Oct 2024 00:08:49 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0ccd1a3sm3764147b3a.66.2024.10.07.00.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:08:48 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v6 03/20] dt-bindings: pinctrl: apple,pinctrl: Add A7-A11 compatibles
Date: Mon,  7 Oct 2024 15:05:28 +0800
Message-ID: <20241007070758.9961-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241007070758.9961-1-towinchenmi@gmail.com>
References: <20241007070758.9961-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The block found on Apple's A7-A11 SoCs are compatible with the
existing driver so add their per-SoC compatibles.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
index 9c07935919ea..63737d858944 100644
--- a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
@@ -18,6 +18,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pinctrl
+          - apple,t7000-pinctrl
+          - apple,s8000-pinctrl
+          - apple,t8010-pinctrl
+          - apple,t8015-pinctrl
           - apple,t8103-pinctrl
           - apple,t8112-pinctrl
           - apple,t6000-pinctrl
-- 
2.46.2


