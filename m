Return-Path: <linux-gpio+bounces-11798-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF339ABD06
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 06:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 763D01F23CB3
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 04:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78D913FD83;
	Wed, 23 Oct 2024 04:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MA5TEM++"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B1213D52C;
	Wed, 23 Oct 2024 04:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658691; cv=none; b=uHm063Skh/YrjNf9HySzolOjBmXnaz+V/V85BuIWwwEwDv1QlB5/+BiI35+7SjPkBXUt5+/5OLE/vLPBDx3ETQ6WLDtV4IMRlTduJovdysf7jkm5mFQjHWkBAeAMZbMm7UCqmHx2ttDmdbEZxowGNd3WPc9HqE87WskstyjUgMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658691; c=relaxed/simple;
	bh=Zigzrlnp/ggViYOHlizqBPJEHu5N7+T4SWqNN3pX6F0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OuVpxZIxs+PtGTBrKeocTGvG9MN+zQ0I47lC38jrdwu0f9ECp8aiFx+avot4E1PET3aN8s95p0nvtrapDXKIWLbmaJvARn1e9QekHLVq//TWa50Lv7k8sbjiwYuGKl8qhe1GFDkIFEULfFk7pMjQbhsTmJ650XCMSPaP+fsgViQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MA5TEM++; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20c9978a221so72665175ad.1;
        Tue, 22 Oct 2024 21:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658689; x=1730263489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/DXdjRCmhmjz3IRlGxg8kr3zWLF2w8ofwZY/NRTv2s=;
        b=MA5TEM++NDdW7AukPrQt39zb1QPURjD4sxKz4Wi4QGaZDxpgdNgGq0VBcL88Z3Mu5M
         izHmHzc3V3QwlhghPm+3UjCk+y4WJsAPsgTDadywnQk7itYVUrtjDpdj94Fos/VuXodb
         ndUx0gTi7iS2bt4H6vBeFItV+jwHbTrG6G7EwGAa6YQ7TYcPZiTEwtYuSv1XgULhxgmP
         iXksRT3h3L7LwCFyNTybW1hMjZv6FYSDucLvHh9YZcxyUM3zFVUaJ2YVWHI9VpdIG/Y5
         kCl7PeI7NjYS+/ydb8eb1jd848WKAhww52ySN1XmukXPTjPudq31ZTD29K9dWyjirNr2
         lI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658689; x=1730263489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/DXdjRCmhmjz3IRlGxg8kr3zWLF2w8ofwZY/NRTv2s=;
        b=lYq3XWKkeWdI2C1FHATKgI6OzeRxpqzz55ESOyVyVN1hPTqpfHdttLcicETsuxjv+K
         KflZsYh8RF25YCGC9QY7wAeQ6Ab9SqpyRVqhGj4weCWN2hVup5sRlB9NVlqNoE8+Z7nD
         E7qPDmfbkM6zinkajtZPvf3dd9rNNdea5eF5necRDNt2GCi3uJ6YagOT/JO4f+SLQQ6a
         zXW4JS5wbsWYycsVSxUeCqbTc6o4zatYOMiCqevSTTzD1d3RlqgfioVcn6TRJLokWljT
         +CPg3TpJpqFECPXqs7inr3ZjLKSE33oSnoJzItWSYgLHRlWGszcmEuXEqvcMZ/uJJkSM
         DXTg==
X-Forwarded-Encrypted: i=1; AJvYcCVz0eK/JaeHUM7D39bSrRS76UJ7IdDR8aCHBr3b4dH++k0Pjak/l2B2XSe2dLEvAhTdwxUA/7Qgi3D8LnMybHU=@vger.kernel.org, AJvYcCWKv+x4bEUGvnAfHPnIUNNWB3FjhLhpOXsGEfPnzgdwGFU5Usykk94pGxgOgqtz9NwxgT0cuo/q8rarc0VM@vger.kernel.org, AJvYcCXSs9edpklP3daeL8YdYG9kD6ZBx5SHOs7uosyD5feXX+L9PKx7YLGkb1oQiMKzjpw1POCUJxGKk3zI@vger.kernel.org, AJvYcCXjiMkMmtzFqyFa22imKmPSClqwOp835Tz0jcvEMFwzXkvkdkgkZbUWcjlHTErRILI63tWbb469b/3v+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzosTCg7T9JfGIWFN4YqGu1dNAKmzUxLBjAbs4iIjzg5sqnNiom
	QWK+GEKxi7DNcTMBsVUbHqPhujk1Ln6xo1KduPrBgzQ9UDK+bcdO
X-Google-Smtp-Source: AGHT+IGn7UgZ9BJ/TlkQ+E2HAb0XR+rspKCuaZMeClu6zEYk8ERChl9lG0s2Nk1ILro9xGQFJ0oStg==
X-Received: by 2002:a17:902:690b:b0:20c:f3cf:50e6 with SMTP id d9443c01a7336-20fa9eb649bmr18804295ad.38.1729658689494;
        Tue, 22 Oct 2024 21:44:49 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:44:49 -0700 (PDT)
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
Subject: [PATCH v6 RESEND 01/20] dt-bindings: arm: cpus: Add Apple A7-A11 CPU cores
Date: Wed, 23 Oct 2024 12:40:36 +0800
Message-ID: <20241023044423.18294-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023044423.18294-1-towinchenmi@gmail.com>
References: <20241023044423.18294-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the following CPU cores:

- apple,cyclone: A7 cores
- apple,typhoon: A8 cores
- apple,twister: A9 cores
- apple,hurricane-zephyr: A10 logical cores
- apple,monsoon: A11 performance cores
- apple,mistral: A11 efficiency cores

In the Apple A10, there are physical performance-efficiency cores that
forms logical cores to software depending on the current p-state, and
only one type of core may be active at one time.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index c54d20dd9d7e..dc0d219ff9d5 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -87,8 +87,14 @@ properties:
     enum:
       - apple,avalanche
       - apple,blizzard
-      - apple,icestorm
+      - apple,cyclone
       - apple,firestorm
+      - apple,hurricane-zephyr
+      - apple,icestorm
+      - apple,mistral
+      - apple,monsoon
+      - apple,twister
+      - apple,typhoon
       - arm,arm710t
       - arm,arm720t
       - arm,arm740t
-- 
2.47.0


