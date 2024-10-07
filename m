Return-Path: <linux-gpio+bounces-10917-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21905992574
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 09:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B66411F21768
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 07:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B351898F8;
	Mon,  7 Oct 2024 07:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDadaCcz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A3A188708;
	Mon,  7 Oct 2024 07:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284940; cv=none; b=AmSYEuAOotNFc6UKXLAr2FKkHF1cidb76PRoMBPW/dS0GOjY3mkX2KeYpS1F75UdMHBOhLJmsByrmZax6WBHZq5h3IDdyeTw5G8h9QjnAe+sRRkGb5vwXAPKNMnuGr8ZpMa//mRsDOwcBdpauxsDbv4yMjdIug1yyjG4aav2Ouo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284940; c=relaxed/simple;
	bh=HRfB2cVxNJsZGB/Yge5g5UVx4Mjkd+/Dzcp3QbR+eeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sl8R2Uw8G5ncgCjqPKfz7N4ESqXJ7vV1kEVLEuLahB9/oBx2Db7J7Y2vCKRz08UyYMO4VdOU91P8H5XyRRaBBVkHjnXdzioECcPB64gKhrv/maKKxWA8ZoK0giBLgPINehGhXFiLfbN+A8jDddGAwZZvrFoq63zrVD/ojBFhzRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDadaCcz; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71def8abc2fso1673611b3a.1;
        Mon, 07 Oct 2024 00:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728284937; x=1728889737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLXZ49bajWJJx8bAXLSOk/QnLsRj+shderlmWknheaE=;
        b=QDadaCczpVFDCs3eIxwvUq8oR1AMJm1zS4AIKrOUAvS+gmaIq1KfvP5VtHGAzaCfkq
         hRM1YK1NXavr7Z1R9UMLqyeJ99/fWjFTykMp4Y17nTw2WJmK8GCUtlaT8ZZdF3rtY7m9
         qPKExcq8m3bgaWIzJPQAECDLo885sb744aCC5AtyJcKr34WwpJ1hHhbFxQNqAHOUaAPC
         tfyuBtzFZEwskjsClIVFQ5IOP4niMQL0qb9kLJves/b7aFUhMUnwf3BPDaOlUEaka6gU
         mlysFIyOCWFTV3/nebnuxcs6eW8kKuXnCAmFMEi24jvVX6amU0aXdC4VPOUgKKH2SZmZ
         8dnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284937; x=1728889737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLXZ49bajWJJx8bAXLSOk/QnLsRj+shderlmWknheaE=;
        b=p+O/QRWzDg1uKazIK6ipcnyYZooblixGdYo1KeCnojIkZ2TuOAZKzJYW1qeymfYpmj
         ln8zgReAuTQ+CkHZNzipFi77lv+TnUk4w7Yg9yaxAa1QAedoWjDnR7Sj0P59JGvdOBzy
         H2iJZGitg0v4rLK8ieDsuc5mVKjTV2/SCQX8rIzDD7uXQGSs+U3FoDbYVP4Km4yzAsx3
         YCKqodd6GNJ3eldRFmFfeQLznuDj0GpSzP52tE7Rmm+qhH8BsbEmRm9VRp6svyVPmYUi
         giUe8q3OwHWKRd1+Ly6CND4Lx95WEb91cYwRJRBXSnoPeJIS/4AR/GMR+eJioIyEHuwo
         JnFg==
X-Forwarded-Encrypted: i=1; AJvYcCUncd9clbVCVhfZCbzGO6jkAAq4sZAEJUvV1pHsjgW7meTuLUnA8tbyeXX9JKOMjQbg/2JEnFSP43PArQ==@vger.kernel.org, AJvYcCVv2jKgVk7H3iOHKTgEl/JdNFf0gp1rSgp9qpealj2gmJ++i35T51D9FcbWPfkiuQwChGSCdhy34UvA8s8b@vger.kernel.org, AJvYcCX0NkauoS9GVVojl/621mahF/0/WZax5ZFTCEnGmorSKbhrNfZO7duiphyKbNCWeRi8Dv703AF+kbV3sPo67SY=@vger.kernel.org, AJvYcCXMca/e7FrDZmQb9JSAM29Hg88EL9Q7IthROVd2/kgBn4om/Xo4LVs//9XGib8uXQbRsho9aWkz6Wbr@vger.kernel.org
X-Gm-Message-State: AOJu0YxEI4ViYyaQ+JXr4bOuGw7e+3lCiV2Ju0k6CYZ2u4cbDq3QDEZw
	jyGYCAyvPjzoeNcqGccV3vwv++0oUkpcinFgcLTEaAnvXIMwxhALl4g5kaof
X-Google-Smtp-Source: AGHT+IGT996U6ce63c61zU3HCm3aj142b34ghP+upFDkmtXado75z/eCf9GDbs21LIlnwFpQes/niQ==
X-Received: by 2002:a05:6a00:2d15:b0:71e:209:512a with SMTP id d2e1a72fcca58-71e02095209mr4635445b3a.18.1728284937236;
        Mon, 07 Oct 2024 00:08:57 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0ccd1a3sm3764147b3a.66.2024.10.07.00.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:08:56 -0700 (PDT)
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
Subject: [PATCH v6 05/20] dt-bindings: arm: apple: Add A8 devices
Date: Mon,  7 Oct 2024 15:05:30 +0800
Message-ID: <20241007070758.9961-6-towinchenmi@gmail.com>
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

This adds the following apple,t7000 based platforms:

 - iPhone 6
 - iPhone 6 Plus
 - iPad mini 4
 - iPod touch 6
 - Apple TV HD

The remaining HomePod is not supported as part of this patch.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 89c1e35e404b..c05a4414c8b6 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -19,6 +19,14 @@ description: |
   - iPad mini 2
   - iPad mini 3
 
+  Devices based on the "A8" SoC:
+
+  - iPhone 6
+  - iPhone 6 Plus
+  - iPad mini 4
+  - iPod touch 6
+  - Apple TV HD
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -89,6 +97,18 @@ properties:
           - const: apple,s5l8960x
           - const: apple,arm-platform
 
+      - description: Apple A8 SoC based platforms
+        items:
+          - enum:
+              - apple,j42d # Apple TV HD
+              - apple,j96  # iPad mini 4 (Wi-Fi)
+              - apple,j97  # iPad mini 4 (Cellular)
+              - apple,n56  # iPhone 6 Plus
+              - apple,n61  # iPhone 6
+              - apple,n102 # iPod touch 6
+          - const: apple,t7000
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.2


