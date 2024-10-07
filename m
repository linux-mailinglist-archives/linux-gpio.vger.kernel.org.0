Return-Path: <linux-gpio+bounces-10919-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F0799257B
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 09:10:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28AB5283504
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 07:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5782018BC17;
	Mon,  7 Oct 2024 07:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HC1eDRDG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AC018BBB8;
	Mon,  7 Oct 2024 07:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284947; cv=none; b=SB6dCxbc6Lh4M81s4BQr6CuS+40/osRC3pPaE9L7v+rwcspaCocKUcASJtjN3TquD+IIoQZG8XEMv+/qDow3dWTFiSiBUM8Pxl0C7AbIFu3yNzbl8dDh6xAv74113z6qT34H2nkaW6vKjMuliD0uZvw3qtMJbS5ip+D7tbp0yVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284947; c=relaxed/simple;
	bh=bCnh2aQC5OVHshLZNGNmvjurPxNhzTl6bwKiulsS3I0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZXqIIBLnKxyPjR/GjZnLhRzSxvME+NgAcusg3wFNxCD5n4oHIigOaEx+I2RGR7m+al1hgEweS4MRTP5O3loBj/9uCcPw+RUYjHEg63jQTEnNvzESpowh/NQNUeXXgY2bKgVBvVL5IZ/d/7gcaC52eiqjImED6ylAuLWlg4DRK9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HC1eDRDG; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71e023635acso439361b3a.2;
        Mon, 07 Oct 2024 00:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728284945; x=1728889745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxMNA/RNvIg6r3MEyAPgARFuu7Q+nWnn6kz1wu/WjHM=;
        b=HC1eDRDGuwLrQJgMHZor6yerFVygSsT2cE1wsFq1XVK00siP36uERIbOZTlcGeQPBi
         suSp4DU/pofAbWxwbP885NTasT8z5LxuNX4bhBmCU/LtwxKVjA8zu9or8mvWiOaCwBLk
         BmL6ga4LKYf/x2hg7SnhDcHQcbhQ0h2dhiolODYvuroThnZXYThNma+r0Kj/mw60+zp/
         ajEio9C5XMB/86IRX7SZP2UCjhbMrhJTWSq/WmMyaXgjezOPg6iRYhS6AgJebCX/vu4r
         OmyieuqdAvdTA9S4ys2qAf9B7Vc7PtDzzyXPR/DOUdPTDMeZtwSeUfJ7h8bZGV0h2KmV
         0zXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284945; x=1728889745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxMNA/RNvIg6r3MEyAPgARFuu7Q+nWnn6kz1wu/WjHM=;
        b=BTGQK/9jkN5XiP/k7uK7zCcW9nXUdoO11vw8WROPCaeCxij4hG60+8VtlZPEg2EHk8
         VSr5gmxl07d4RFK89nc9dpRuW4KDe5GMvb/NUc4G3tRWOWvZNo1WLHXsovMRjXUTflkW
         p0k6lcqvgDVPv8F7B4QnsiZo03BlCyoMsD4X85qjw/LtlmvH/Rao+xe45IPZiffWT0aq
         oOZ+Uda6ErTf0WtPnTMusyX4UWmGrV+f6/6xGrST2CG6X8ysIUfvbXTmQ17r7f/xL7kK
         F+A3mZzK4bR4I6aXz621nKV0Jt3tzvZdIx35p9Aw/FfMP9GScOnpqhIf+c+IyyaoSApv
         yQMw==
X-Forwarded-Encrypted: i=1; AJvYcCWVTnHboVWRYysgCVPAcwEzd88VU2xuMV8h0AdNXmqgsCLV0mXg5FboJYZNioKk0rynbeRxvNYe9EcD@vger.kernel.org, AJvYcCWaSjfzA53VPf9noil8uVhCBjJI229qa/ldsyxgIQwnweivXYQBFwT88u3Cr44gOwFMHMRL14u7fMUJK0kRLBI=@vger.kernel.org, AJvYcCWbEgtmxtvtRsz0iBQjF4gRhwr1haFLMDQD/MkZg71zFWG7YrnAxDGWBvoPmWMQXdTqXaOaQuhUiTkMKZdU@vger.kernel.org, AJvYcCXDNHJ2f2dPcFs3jxfcovOCwIMKOGislZb3Z1EmOJ/0blKfGKJP8LPAXExxjNB4Nl8HLgiQSQz9k2eZOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrgN2Aql0mer5+NN5XumN+8K3IXtuExn75DK3n1o25oRFIQWMn
	FmRX7UuikaUDN/hMKYmbP5PsfQnzOrBfihpil7M/DWRX18SZWVTU
X-Google-Smtp-Source: AGHT+IFBAV9R9YmCshOgBZxbmo4PdTP1N54EmwTJRz+BxDKqQqytnadaBw2Zp4aczBmvcN1jWD0J3g==
X-Received: by 2002:a05:6a21:8cc4:b0:1cf:2a85:722d with SMTP id adf61e73a8af0-1d6dfa25a45mr14931970637.3.1728284944986;
        Mon, 07 Oct 2024 00:09:04 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0ccd1a3sm3764147b3a.66.2024.10.07.00.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:09:04 -0700 (PDT)
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
Subject: [PATCH v6 07/20] dt-bindings: arm: apple: Add A9 devices
Date: Mon,  7 Oct 2024 15:05:32 +0800
Message-ID: <20241007070758.9961-8-towinchenmi@gmail.com>
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

Adds the following apple,s8000 and apple,s8003 based platforms:

- iPhone 6s
- iPhone 6s Plus
- iPhone SE (2016)
- iPad 5

apple,s8000 is the Samsung A9, while apple,s8003 is the TSMC A9.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index fecc4953df33..01965890b4ef 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -31,6 +31,13 @@ description: |
 
   - iPad Air 2
 
+  Devices based on the "A9" SoC:
+
+  - iPhone 6s
+  - iPhone 6s Plus
+  - iPhone SE (2016)
+  - iPad 5
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -121,6 +128,28 @@ properties:
           - const: apple,t7001
           - const: apple,arm-platform
 
+      - description: Apple Samsung A9 SoC based platforms
+        items:
+          - enum:
+              - apple,j71s # iPad 5 (Wi-Fi) (S8000)
+              - apple,j72s # iPad 5 (Cellular) (S8000)
+              - apple,n66  # iPhone 6s Plus (S8000)
+              - apple,n69u # iPhone SE (S8000)
+              - apple,n71  # iPhone 6S (S8000)
+          - const: apple,s8000
+          - const: apple,arm-platform
+
+      - description: Apple TSMC A9 SoC based platforms
+        items:
+          - enum:
+              - apple,j71t # iPad 5 (Wi-Fi) (S8003)
+              - apple,j72t # iPad 5 (Cellular) (S8003)
+              - apple,n66m # iPhone 6s Plus (S8003)
+              - apple,n69  # iPhone SE (S8003)
+              - apple,n71m # iPhone 6S (S8003)
+          - const: apple,s8003
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.2


