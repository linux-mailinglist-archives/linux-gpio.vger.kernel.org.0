Return-Path: <linux-gpio+bounces-10288-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9833797CC48
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 18:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DE95289249
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 16:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1066E1A4AB5;
	Thu, 19 Sep 2024 16:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8NXngSi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FB41A4AAB;
	Thu, 19 Sep 2024 16:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762585; cv=none; b=OCWIBZ46ZkLL5hnD08CiHXBqpeaS2SJZh/+4XqsSWBQg+FioylNbv102GuDHOvUQ3dAKu/XoDh2CcnnO5mSPMvcdcDL1A8n2Mmwvwp/qfjuwllCDNpnBZA9gTZKgKAgPbffrplEaQI3jrw8+CXDSaxDUhn3Qgnp4VjCqBNdMtwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762585; c=relaxed/simple;
	bh=yX9FGeOAafgayJ0c4XDJye7eSl+sIm8pgWg4SGBRWHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tr6oX85ozBPxSpDS0Bu7t75uypdzbFAgjsDTCA+nvoBWtTZIXQO3wAdKTyHgrAz4kjEfSN6It0CR7ETctPcpBZpcvwnVuGuU+BGbpl8/yffYtgKW/YaUd7x1d/W/cZL9qgtBbU3+3o9mf17ubn9aoyZV4MVeMXaKJMfmSBAYnH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8NXngSi; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7d4fa972cbeso763641a12.2;
        Thu, 19 Sep 2024 09:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762584; x=1727367384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FxoytMjm/HXsXb2InFhsXewedzAR4yfvch8/uf3Wzb0=;
        b=i8NXngSipu3PLorj+JZz5Q/3ibgl9hcExPutt8wiYt2843raVHYWGpluVDUm6WyfFY
         nJ6Fc1y0BjHjOSbh/33sLlUT/rGgU0YHb9lHDP9e/I0MltX7Hx7uu2O64Mn/B+p2kMI+
         b5JBoAtHvsE4zrIkBAX8ccS5RgRSa29Ou1fAYktZJerFkEAdjMNv/AKfKodGDyoXuBU2
         ZQkh/vPYm9JZuNiESvrt+n1P3KW+BwguoX4PmWJ/Vww7NJQSVKR7CI8Izmp++c7RSFP+
         K34ktj37p85jB4+15H2xVmRYJlhQFgrNGsfjC+TBAVmVbOnEQg8N0F5/qxTuSYpzxTNU
         RY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762584; x=1727367384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FxoytMjm/HXsXb2InFhsXewedzAR4yfvch8/uf3Wzb0=;
        b=ItzaU6yzfE6IbYzlIrrr74V8TqFQQ8iiuM37Gvzzx8MkMqfNjE2itMVL7NSIMiaFxF
         lEJDNZ+bYxLPdk+qISQ18K6+q40EcRdo1IHXYMRcm40RvP1zzXd2/0soBnVP+2U1GzDm
         69rBwRQzl+3H+dKcF4kmr4m+oqLy0hQQ6mEtPhtC1fnNl6x+AILcKsnkiYpKRUel0SJv
         8eZ+WjVsIijjN7ArUr5STZu62572XNkItlFxFMfVcKO5K84YCikhetTwPaG+jsxQjxcW
         f0mCySW2GsttMQAug/1m1DgppAjvwLIAUaWQp4CPzRELwyfK35+34mSxPXyC0Ip28oCi
         t7Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUnRK1+BnufhR0uhqn1+EJrNbqZYOg7tqbfUmZlB595WuIF4meZ7+va293S7rwBR+i6QSJkfgSgUxphmA==@vger.kernel.org, AJvYcCVVPUXk9afa8YdROuxa2LN80Qz54P7fRJmeu60RKCylhtpwXdRJ/plUEoCaaZZN4Dl9JINuYDp8ZKvJLCx6@vger.kernel.org, AJvYcCWEI8Ziy5Q6nct9fFMfX5V7fikUbeAPcf96hwNVqSVubkKyWpD305nm9ONC3m60CWcP+vC+oyBVHDX6qIKbhdM=@vger.kernel.org, AJvYcCWcv4oH1njNekIyYsWQZI9KB5b5xEDn5vOYGGU80Ila7/+7rbOtmZWZsSj8jJ8endgGd8fCKH6SPuf+@vger.kernel.org
X-Gm-Message-State: AOJu0YxXRHOCOOb03+9s01xMp80JMkGl6O49EPJyvJqd4orKM41+YAjw
	HzgKBkVpM1GkF5yLYs3FFRkDLL3R4a/LXVYo8fr0P11Uh8FsLFEW
X-Google-Smtp-Source: AGHT+IFRMpng/YbZnXcqjdDyySe+x1hLs/kbmol2k16G7QkiAxl2R2k7DP501VtCzDXSISUcF8W+9A==
X-Received: by 2002:a17:90a:9e1:b0:2d8:8bfd:d10b with SMTP id 98e67ed59e1d1-2dba0067ffamr27168183a91.26.1726762583570;
        Thu, 19 Sep 2024 09:16:23 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:16:23 -0700 (PDT)
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
Cc: konradybcio@kernel.org,
	ivo.ivanov.ivanov1@gmail.com,
	towinchenmi@gmail.com
Subject: [PATCH v4 10/20] dt-bindings: arm: apple: Add A10X devices
Date: Fri, 20 Sep 2024 00:05:59 +0800
Message-ID: <20240919161443.10340-11-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240919161443.10340-1-towinchenmi@gmail.com>
References: <20240919161443.10340-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the following apple,t8011 based platforms:

- Apple TV 4K
- iPad Pro (2nd Generation) (10.5 Inch)
- iPad Pro (2nd Generation) (12.9 Inch)

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index b6a2916fb0f6..96efadad15a6 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -51,6 +51,12 @@ description: |
   - iPad 6
   - iPad 7
 
+  Devices based on the "A10X" SoC:
+
+  - Apple TV 4K (1st generation)
+  - iPad Pro (2nd Generation) (10.5 Inch)
+  - iPad Pro (2nd Generation) (12.9 Inch)
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -188,6 +194,17 @@ properties:
           - const: apple,t8010
           - const: apple,arm-platform
 
+      - description: Apple A10X SoC based platforms
+        items:
+          - enum:
+              - apple,j105a # Apple TV 4K (1st Generation)
+              - apple,j120  # iPad Pro 2 (12.9-inch) (Wi-Fi)
+              - apple,j121  # iPad Pro 2 (12.9-inch) (Cellular)
+              - apple,j207  # iPad Pro 2 (10.5-inch) (Wi-Fi)
+              - apple,j208  # iPad Pro 2 (10.5-inch) (Cellular)
+          - const: apple,t8011
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0


