Return-Path: <linux-gpio+bounces-23377-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F88B07DD4
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 21:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1060C4E39FF
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 19:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F0C12E3395;
	Wed, 16 Jul 2025 19:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3Nb2CmZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6FD2E090E;
	Wed, 16 Jul 2025 19:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694312; cv=none; b=FRRIhHI24YT6+xq3nDmDdWKLP9fMTpaiYy4xauIBDteoB1IGcyQJyWY2dVtjMJEBpmSDcQiksICUFeUoUVDM/4IO6vvDLyYarjK67eU85ZDJGzeM96156a9eMHSf2coU+C12WNpjWdYp2qKYRvAAIyIUfq6YvynuglmyidNWIcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694312; c=relaxed/simple;
	bh=6IaLZk5ajCLYmQ3Mz5pBghgvBkfz9rSnhglhzXJVewI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FgpNeAlFR6W5U4FM+BLKWj0TX7v8vQIqZoS43LJ/42/oof+isHaph/UT+K5bI1+rNNyieWP+MDUbIy+D4OXn/KZiaElXaIJj8fi97w5juvztn8q0oA5U7q+3b5ndI5nDxd8k+0ZohKYMjWgrwgoDRF0r1Je3hamxJgATQmr5TV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3Nb2CmZ; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso357600a12.0;
        Wed, 16 Jul 2025 12:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694309; x=1753299109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPCXaM2fReTmTR1+dO9f5EB14T9FRoV7tVgoNxuKveQ=;
        b=T3Nb2CmZuqikAlrqp1hM21y4ReKsXOdg9y3k/nT1z+2+54qMnMTlize0fup0QXF6NY
         Zmpqrpx/f5iWRq9Tb3Po//XHfxk1V0UYq562qO5jPC04OLx+x010nF6qRyvBEWXtq83i
         CdfxCFDUmd1Ib4yGKb6PPuY1NTQK8P0BaMOHfJcw0OdrIsBBMwFsE0b1Nd4nC/11flNW
         6GLz8kRCsFAwZcvaK5DA4Ml5s679qTucwmMeZVeu3k2GGZVlYJSPRl9b/yoXjz2mncwY
         QJWxw/QvAquplWmS8xjadn6SqCQZ/GOtBUaLR7LlIvpfZC5xsI75YO5gl4VaRpvDOieq
         kCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694309; x=1753299109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPCXaM2fReTmTR1+dO9f5EB14T9FRoV7tVgoNxuKveQ=;
        b=nqSkMbggsSLbSycJ6XkgYxSxw9ADg68CKsA5lAR8WOi0ZrEBx1V5SUbgFYyXIIfQUE
         4Tb/sZJ5H7R7l5sPW6cx70PTrtPss9DKmzIdJbXGli4LdTpUvKAeiOKN8k2d0VxKb+RQ
         6O6k7rrVI3U+u7hoxMVG3FK+dYn8jp+BBP/78ukml4b/y5+f+hbmXDpNKRADwOJazUvk
         XMBxxTCi6SpqxMyKXQfCRIjoflHZH4JG3pVI/WiPRB5I9U5yWLlr/5ja3yD2yAxJLkKk
         oLQ39e3Hyo6uF9IIwd5VJ5Ol+HxGgMSt7IFc1nPu1x/zKNSPoEcA+x14lJxPNKhehDGG
         eXcg==
X-Forwarded-Encrypted: i=1; AJvYcCUapmsSjLM2E+yKS1B9QYTd84sMgFCRY71t/3O/uS++dEOGRUdHWsgMHSGeG++zODuKH/EYBcDb2/C0tBjY@vger.kernel.org, AJvYcCWFkW4A/WeAFb6pcPZUyxr/VBdjEjjl5fNMNEXkwwUmt0eMKKCHyDPH07aQJIEDszSCyoTZri01mXBmrQ==@vger.kernel.org, AJvYcCWqZ+0y/Jnr4ejc8jklF9G0r3vDi8Js6xXOjYQIY1yLnDqaaWSl8NtPjpY9InWE2CA7SCH9QDiosZQL@vger.kernel.org
X-Gm-Message-State: AOJu0YwD1b/v32NIlCohFY+Mkg6xUsfYZ4POgGBv4vILrIXCfQWhqY4f
	Zc7O0XsaTgObQ+/WB0RRPHzHmI425RF+KPeRyJSLaWbHMDywrYrjlkfv
X-Gm-Gg: ASbGncsG1wdT13UVd/HBG6sPDXpfD5xpRN4jhaSSERr4bQu1hEEfx0bR/dZj8GnFNwR
	VfqBETlhwNwBpe2PoXZ1tCVpavkzy41pyJ6P7X2Psai7d29fHV9vX0F6LN9/840PtBzwQQYf9a2
	ba1mZ9tRd99BVqBDeJBXlqZf161xSczTEMx6f9qRNhVf5d4ATMPa4xUSlJYo/p5CngPS3TdaL0F
	zcA/no5VSMr4c+INQTa8CwFk3rDEsUpgLl+UBTCvZx8ZZ6NfNVIs5z2+RyT4ZRVm4GEJX1fUmUK
	ZrkD7iqfYOxNDcRvElt/Hck1gm8QEShdBh2zRklDmbq1/V1t4+VLS2AWkJdIwnG7mzkVNmyzmTF
	DzFSG1/IrhRnwI1WbqJchTxXD1vat3wrvu7E=
X-Google-Smtp-Source: AGHT+IHHlWroyZIAzbjIooKRhrsUTXEx8/lblNbRFcxi6xG53BBEHU5lpzkZPyY/mfo8NS6RlQGa6w==
X-Received: by 2002:a17:907:9450:b0:ad5:74cd:1824 with SMTP id a640c23a62f3a-ae9c9b15e4cmr504054166b.38.1752694308932;
        Wed, 16 Jul 2025 12:31:48 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:48 -0700 (PDT)
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
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v6 12/24] dt-bindings: media: i2c: max96714: add myself as maintainer
Date: Wed, 16 Jul 2025 22:30:57 +0300
Message-ID: <20250716193111.942217-13-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index 3ace50e11921b..f53c72e5c5727 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -8,6 +8,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Maxim MAX96714 GMSL2 to CSI-2 Deserializer
 
 maintainers:
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
   - Julien Massot <julien.massot@collabora.com>
 
 description:
diff --git a/MAINTAINERS b/MAINTAINERS
index 3117345d0619c..93e22dfd61c17 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14755,6 +14755,7 @@ F:	drivers/staging/media/max96712/max96712.c
 
 MAX96714 GMSL2 DESERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
-- 
2.50.1


