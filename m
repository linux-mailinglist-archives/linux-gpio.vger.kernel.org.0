Return-Path: <linux-gpio+bounces-10423-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CF29853CD
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 09:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A16381C23505
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 07:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B633515B971;
	Wed, 25 Sep 2024 07:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWvBxW3V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F764157E88;
	Wed, 25 Sep 2024 07:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248856; cv=none; b=Xk9WirCiPxXyQNaAwKreWmuYKDCSonj02jyxKhNLPj18hHiF+I3PUYglrU0if0frIcettia/a3qZxzFzGKcZlVKSRBngW8BzlXRH2pCXgex8XfL2TsaRD419Mo7nAiYUO6Wp7OzQN3jc2paiIm4WMPphGxSCgTjgBN1+VBiP+Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248856; c=relaxed/simple;
	bh=i8976LxUokzRrIAum4bKP4FHZqyTqb3EoP03KvW0FYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hvjRVsmcs5+67HFcs/7hSA+cl2hALHoS15ueoX75kuvw9/j8UOv4NDwJ7KSlZawpSipzEzdPEpUE/mlZmYR+1LaKDb3X1qmPTsw1Dhze5XgxaZcaisToBKh5sraUlpJkSwcEOfhEEEZ80dvBNXgIOD++7qGOwUErG7Zk2TgnKRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWvBxW3V; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-709346604a7so3131416a34.1;
        Wed, 25 Sep 2024 00:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727248853; x=1727853653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0BGeqoOyiBBfxko0YQeQCNLaxzumXXb88iTx4M2L8Ds=;
        b=NWvBxW3Vw7oAl/llVKAcJu5CJQAtpTJenN+GYtr80HSXUhcgkmmqKjLHD7MAeDnqvB
         C2r5ET6f7wwUHKqWdMfdKKoMnVCFDtGKjqKJ3DCg0kmFmdie5bQJAyVA2Kg8AGe6FtMm
         NDRmzGY0pBYot9B7PQdbmQKMyUPqoFFFIfJp27hxfHVDVgMggk4JVAGiymYHu1xLJzME
         cwQ1hZGQAgJtg+oVfbdfH5za2LTWOms4dUpFEZNbLGR2psWP21dJS+WVlkLr49y7Jsun
         s/xK4NakCCJ+D+COXq8mxdYtaO10NRhzkLdci20/1VuyhAk4zwtt2EEU4nGAj+ERuRh3
         zHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248853; x=1727853653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0BGeqoOyiBBfxko0YQeQCNLaxzumXXb88iTx4M2L8Ds=;
        b=NVNZDdElnMZpRuXwzu40EHy3ap5zlZ187EPB24vON4B1JBUklkx/Vl96PidwQ7BIYh
         Wn7PWKzUH88q4IsOUpKNtz8lCXxObhkAYOYOWgs4QOUMWlbX0VMW9jpjRftb+zcmQeBM
         +HakVXK70Bgp33y3ufU59u2A7mUOB74kLjc8Pf/xuuAF2VhAWelOefMwAKZxOdGtagVb
         Y1PXftBHXTr4dIJiSAuGnqYHQZs3/DAXJZ/PtF+XAXSNzGn9iRUApvhnr0wirD7m+60q
         AILrGcPlt+xKUn9skzGGFTIv2lrSSYVayRArvZ9EM+qN+wExXZjHkmhrqOAc5TiqnqNV
         UyOg==
X-Forwarded-Encrypted: i=1; AJvYcCUUnszXYtn6c9ALg93aEAYW1yTsNT1eWVs63m2qYQCBXUvNheL+aIHxnmNvbRKst4QjTF13d9bC5PESSg==@vger.kernel.org, AJvYcCUgSP3vljuO662zuzdzyMXGNadt3XoxpXAqIAbL6DxM2Wz6EmusmyU6mjbwa7WhZIJ/eAMHcGDlhwYnzDW8Y38=@vger.kernel.org, AJvYcCUhUmUf52ib7IGkbYOPdUpKlHssRll2Sbz7VogYOpK8mYw2yObhdolNr4m9GhEJGFEytPqrPanhh7ei@vger.kernel.org, AJvYcCV80AcfpMtJ2Q1jhbR27JQ6lOLhpIYoENbC1ZR1xJYzLirgf9viYMM8VQ9UbhaaLymPzsCEh0OCOnibgG/K@vger.kernel.org
X-Gm-Message-State: AOJu0Yyluxx4dC7WAwr8wtgFbgtN8FTgQXuPdqd5nmBy9H6JAVuxeazZ
	nGtnnEgLmRtbX8Kfnw5B0APJWrbHuJpOQP85M9elLLJ5KxbyrqZj
X-Google-Smtp-Source: AGHT+IHcWwEBIz9J+4OSED5kctf4FrX3jmlo6xLutYP49XS+9Gh0oLHvhiC7/iOTW/EKSGXH2gKnug==
X-Received: by 2002:a05:6830:6b07:b0:710:eaf2:9f0c with SMTP id 46e09a7af769-713c7f3484fmr1214023a34.32.1727248853464;
        Wed, 25 Sep 2024 00:20:53 -0700 (PDT)
Received: from localhost.localdomain ([49.130.52.78])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e6b7c732bdsm2155662a12.63.2024.09.25.00.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:20:53 -0700 (PDT)
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
Subject: [PATCH v5 05/20] dt-bindings: arm: apple: Add A8 devices
Date: Wed, 25 Sep 2024 15:18:03 +0800
Message-ID: <20240925071939.6107-6-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240925071939.6107-1-towinchenmi@gmail.com>
References: <20240925071939.6107-1-towinchenmi@gmail.com>
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
2.46.0


