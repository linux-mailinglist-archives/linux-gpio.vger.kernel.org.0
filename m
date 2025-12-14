Return-Path: <linux-gpio+bounces-29534-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9519BCBBE50
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Dec 2025 19:02:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3F04300956F
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Dec 2025 18:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7F530C633;
	Sun, 14 Dec 2025 18:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U//lDwki"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B8B2192FA
	for <linux-gpio@vger.kernel.org>; Sun, 14 Dec 2025 18:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765735338; cv=none; b=ule/cseJPToerfkRYPxwVA6r/DGkyfnLNqs3WP9cKJLEOJUKyBPyX7AIhalkNclx4UcO4CO/SFieqCjLcmOydzq55O4LcVDMCYL2sWDqyDBkkbPfFHoVyMAG+dVCBGv4AVHYMWbMb/XRt6hZa3CvZIpnztXkykY6Glj8i4giPbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765735338; c=relaxed/simple;
	bh=RGei/f5SwSEa8t13vkw1SgXDIi55PhIypHX3O9WgkHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XFiTVWxP8DPkbZDGbWmywQqulZJdh59ye7sf5gL7p/h+PQmfjebuZLgvAY1NoA98tp5zMgF1DBMiiYapyqvAPmyYlcORv/FSKcFbfVUY+MlDfxArmGOuV+lEdJd2S05ooq2bmiyzqPpaZklbu54fFxXZMvgO3H8v7EcYyRzHvqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U//lDwki; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b32ff5d10so1488318f8f.1
        for <linux-gpio@vger.kernel.org>; Sun, 14 Dec 2025 10:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765735335; x=1766340135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxEDIovWgG0RAxcrxkL5LpkDNxOzLaNzDMcC6W7//Xg=;
        b=U//lDwkiHxSjJvR2ScYBuTZH3Fba9Ch2Im0tfUvYLRXSXdjgITVstiwFYQFe/y7Bh4
         Y965nnTcLIQmc62e3OvED8aEgWvP9D7f+BSjiUS2VgqTZJun5GlJ1cR+SBRevtwo6bqu
         trWz8oFgb9ASSwaF7Za05VD7gDM9XovdojVDJSPtTNuuOR9uZcka1IOYPZP+x/poKXjD
         Q3nqf4G5PSydItvGBlb1p/1fexhKkDGIPbtFzaly/aBszmhYGLBBVa2UoMeb7zCYaXaP
         Z+6SDpGBWq5FRpEHlzg6L6FJp7g97ZuLudvpjTCdaKshgFa9TT4EdVBtHfLHAgxsZUGK
         JMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765735335; x=1766340135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IxEDIovWgG0RAxcrxkL5LpkDNxOzLaNzDMcC6W7//Xg=;
        b=TBCb+rB1FZGS+wees9ZOO1aMvrNd/cMD2vmNLwfik7w8bxthLlDMt68HuXI9ECfbjn
         YOQMNlIscAIZkWJDZkK32A2rhR55xIHNxwLEmHnxvlYcvrccLajS7gABCc1LHtut2p7R
         hawny5f4F4XX+TjhBdbHn268TZBJ2zkz4XO9HA7XAuZANTLzCiVcrJ4/zA9UuPZEnzDo
         aXSdk/Fe34imHBn1hVhcuVYysSJx8NXcpuiRQrZfhmy9Y+SHKc6fNjahf1+Bdo73pgBP
         /hEorXprhwMgbBa2BFp9Do8NRFSGf9PR3w7IdJu93LgldEV1W8woGF1EtO/mJhdbbvyn
         n1cw==
X-Forwarded-Encrypted: i=1; AJvYcCVn1Cq9uNsAe/7xtgyhPTy6DbXBIC4/95ev7Mt7FRGh8aLZ9PnPmL0Yf++5gV6PxEXzsV1L9vRoZXee@vger.kernel.org
X-Gm-Message-State: AOJu0YwzuqdkOvOyTtxRHMLC/9Axm3mK6kcqflpkvPFocvsvUDwps9/x
	siWJCe6sCKuskcpmFpJOWj29jnLBfI6t5njWaHQjZWigyy7EJMLPYX1T
X-Gm-Gg: AY/fxX6WZuC0utWC1LTsGPx5r38sU3di+w+RM3zdDRJ0JjKWcJmtlHoH51KfUMpVVrW
	PSOK49siO5FhEJkA5gN9Uh4+vTGUXcGDIw7nM5/r9HW9ZYUCvv+x7r6R83O/ZzIGMJkWCjhj05k
	yumsLZemZL3NNu3SghUBsa9mzaX95LeOztxy60qQ2ujzUaf0FOoZZqsazsbGFbSB2XAAM3MoYFl
	6TDYT7pzWiI9MFfuImmrbjUdUugDiBMH1bGY06rXbLPKAHlAJ1T2tUMSEC6a8osZTUZMeVvJuER
	2h6P9W+TMkEpN9jhp4qy+KnCDZUPlVLDHQqL+d1y2j6pmZ3ASnoeTxutXakH05xWoVrnbaclmN9
	TS09WYAv2nnVH4/EhsjxujaYHbmUGO5GZz3k+j2RS2SYfpcFOPgpLd1Dr4BtwbFpBw2ayMqhDnm
	kZNou2Ao6iBxt3Pqvaw3XdlcXO/1CSOugwu1HWWEy7W4Ha/oyxy38u7N5f5olEDnIdwak5HkDIZ
	ic4M9r/fBzXvQ==
X-Google-Smtp-Source: AGHT+IGgbzrdWAmi3FTKqIKUB2VW7lxYhNhaEz7HG6Q7Cw6Y9LlDIr+hAvgQGiySJ+2joVDShh4tzA==
X-Received: by 2002:a05:6000:2002:b0:430:f975:addd with SMTP id ffacd0b85a97d-430f975afc3mr1930973f8f.5.1765735334845;
        Sun, 14 Dec 2025 10:02:14 -0800 (PST)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fb7118267sm16191030f8f.27.2025.12.14.10.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 10:02:13 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linux OpenRISC <linux-openrisc@vger.kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: Add compatible string opencores,gpio to gpio-mmio
Date: Sun, 14 Dec 2025 18:01:41 +0000
Message-ID: <20251214180158.3955285-2-shorne@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251214180158.3955285-1-shorne@gmail.com>
References: <20251214180158.3955285-1-shorne@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In FPGA Development boards with GPIOs we use the opencores gpio verilog
rtl.  This is compatible with the gpio-mmio.  Add the compatible string
to allow as below.

Example:

        gpio0: gpio@91000000 {
                compatible = "opencores,gpio", "brcm,bcm6345-gpio";
                reg = <0x91000000 0x1>, <0x91000001 0x1>;
                reg-names = "dat", "dirout";
                gpio-controller;
                #gpio-cells = <2>;
                status = "okay";
        };

Link: https://opencores.org/projects/gpio
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 Documentation/devicetree/bindings/gpio/gpio-mmio.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
index b4d55bf6a285..0490580df19e 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
@@ -23,6 +23,7 @@ properties:
       - ni,169445-nand-gpio
       - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
       - intel,ixp4xx-expansion-bus-mmio-gpio
+      - opencores,gpio
 
   big-endian: true
 
-- 
2.51.0


