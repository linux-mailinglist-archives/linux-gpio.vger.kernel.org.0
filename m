Return-Path: <linux-gpio+bounces-23477-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCEAB0A72D
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 17:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94C1A5A82C0
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 15:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93CEE2E093F;
	Fri, 18 Jul 2025 15:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhISl+ky"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F122DE6E7;
	Fri, 18 Jul 2025 15:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852331; cv=none; b=AXqsZ9A0DYRz8tPMSNgD9ociw2CYIDHC705WjplaaTSa0/pqmPMDsF3z4BpzqceDzZnECQZGH3Rkqe55UcWnTBRtHZxI3/LgrGVk4J4t+un53tr7KcwJQAy5ljLpfNNElI28UMttaHJ5tzTIJMy21l2sKggHqKbnSMysO9OdkDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852331; c=relaxed/simple;
	bh=RVveu7Evk1TPpysgWbQDv8i6qZhE42ob6nWPtfOaz2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NbdUVy4Oo/8GmhHvXhfwxP1M919fzfotIKHun2HCp8G12IQ6iG2VCfFh1G5Im/T8WSQsNLKTsUljtAkmzuGkgtMv1D2lvUpZsKxXRhVEBn76Pfn4oa7adzn/HfeCnRHf5bRMLBmECQZDdJzLw/ZGh/W/0mhY7/H/iiWK3FkriPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhISl+ky; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so15927285e9.1;
        Fri, 18 Jul 2025 08:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852328; x=1753457128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DG2Ojz6YKxpY0UTt6+EJTFAtjpkMtyyp2I7xk76Z7Mw=;
        b=NhISl+ky4fGpISj5W/wyZBz4xvGmuuufhprsreB8MAexqSe0tncEIMFA+IH2GyUduP
         8LTS3uTdnAMRB49s7NA9/z3S9473v+Qdug3vPJ14xAgZ/3PzHfwtnS7gDwwxRhN+EYki
         Z3y809ugy7q8uv1J1GcAbkc7jTRNM2QXizzyf+TSNUlPmaujgzvesqBgoAmTw7rI7hAs
         JyuezQpcfhQ3FbFGUtM1cTcFsARpwpUp4VqahQhdax4W4oXmE4/LJVA6RxJ66xtgLbhH
         d4BTv4xuQCxioRp2DDKeoEDDocvZmwD0Oeixx+hx3g3UqWDgCYSs9hTngNOtBDBvwclp
         6AEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852328; x=1753457128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DG2Ojz6YKxpY0UTt6+EJTFAtjpkMtyyp2I7xk76Z7Mw=;
        b=X20PYC2G8TS0KUiCXlAPCFtKbD7mLbo2GHr0i/6jeiORN3Pll5MmT3NfK6werdvsTo
         /zWkZauCxm5SaXPun0Ff+ptTtHqrKci3EmZ8ixQYLDOq6HrpGtZqbh9kwGDVlHlBaORs
         wyfuXJV9Do/JPf+9Dg1Pq7jeGlw4FuAe0/Tt2z1RMSAzQc9D2WvzYZQaDoJeliP4vWrm
         VIU/EM1q0EpGuKf1x/0BylLC/cjNhs66PNpREKs2xZ5LcF6FRI+yzzW4cso33UyzHZbn
         6bm7OFA0zXQVlzPAZ3hdYfrzBopkz1fOMk31U5Y0rc2hhwFOHOgQlKkqpSOl7Bnlto4C
         3mRA==
X-Forwarded-Encrypted: i=1; AJvYcCU4j7Zbeb+aUygvmY0bKSHJ1k0Ke1rkMjX+TDKoBUi1P7axC3U2eILeqoT4lCYdaJw8xeJJmWTl1ZbtXg==@vger.kernel.org, AJvYcCU5F5+hgw/pG0VZj9r9ffyQylCuk4r/JZ52aDt9vpJXH0yYlzY62RhoPIKrwsTXwD6bDB41Emdq+zWa@vger.kernel.org, AJvYcCUguGBLOgnIsE+NEPISx4mOE6wMrPd6+hXiZB413QCrkK+b7ZLy4EF2693gJOhIwno6J//wO1MU7vc7vCoa@vger.kernel.org
X-Gm-Message-State: AOJu0YzCaVFPjlImO8MSuxmDyaYi3P1xRwpntNc/Sz3w4T2r7CMUFVfO
	pvEHgw1OhMKZQ+UR31v/beUcyv1EQWbC1YAkaheV1pV2a7JM7s6tiIIo
X-Gm-Gg: ASbGnctrTxNwY8gS9YZYMu39FFAgHOTVEkdB7xQfKBqMs6SkOWAUs21/AGAVkUvRHEp
	tEgC9+/AymMhx/rCQ3+hJ6b4S7LBins8R8c2JZf8SeA0lc3jLd4GFVVhDYOgPLHAHA7UhiHQ1S6
	e+iNKlFscKoowZMgj9EV9x+Yeb3spkA/T1SxqbwYn2JRWQFhzDpwW7ZKbrMmLd15hVUlUgGCmNS
	Q6UZuALuwONiq7CqPai0Qyy+XBC093DjV6yAO3DTsmcke3xby/yLdCtRlwMtLokDSWFdYDTSYBM
	5IZtn+PsBY+hkzsHzujwQFyPmVMUeCyVvlGTlsfDbr41aOPSSCqLVxtRS7ZFHYaiMaOtXT3D+8o
	Ynnt8tDgu5aHAda+OcujLRWR/o7oRwcKJW/A=
X-Google-Smtp-Source: AGHT+IHMaZ6xEx793pS+VQMOqZMScf0rd6McvymX91J9dR2zouCdkLclsbNOoq48C7pVJzsxrGBGSw==
X-Received: by 2002:a05:6000:288f:b0:3b6:489:b7e5 with SMTP id ffacd0b85a97d-3b60ddc5a47mr8778911f8f.49.1752852327784;
        Fri, 18 Jul 2025 08:25:27 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:27 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v7 07/24] dt-bindings: media: i2c: max96712: add myself as maintainer
Date: Fri, 18 Jul 2025 18:24:43 +0300
Message-ID: <20250718152500.2656391-8-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 26f85151afbd3..efdece2b33b96 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -9,6 +9,7 @@ title: Quad GMSL2 to CSI-2 Deserializer with GMSL1 Compatibility
 
 maintainers:
   - Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description: |
   The MAX96712 deserializer converts GMSL2 or GMSL1 serial inputs into MIPI
diff --git a/MAINTAINERS b/MAINTAINERS
index e973b0a985815..3117345d0619c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14747,6 +14747,7 @@ F:	drivers/media/i2c/max9286.c
 
 MAX96712 QUAD GMSL2 DESERIALIZER DRIVER
 M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
-- 
2.50.1


