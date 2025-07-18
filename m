Return-Path: <linux-gpio+bounces-23472-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BC9B0A717
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 17:25:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 982305A8054
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 15:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5C82DEA86;
	Fri, 18 Jul 2025 15:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKSnhWT3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D321E2DE6F5;
	Fri, 18 Jul 2025 15:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852320; cv=none; b=YtjwJKkpFh0sxscuQvAb5qVzE709GMJx4ACd+v3OaFyasZyRVkXs6uQkh5XM5TWhgypV1wc2Gh+JQVS5ETIWON1IelBCy9L5lY7//5fjJlTccDtCYau2BXUMZjVpjO5h4O5LY4vJjJgksNZK33+KKDDSWU99Ec/h6xNWvj/wwm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852320; c=relaxed/simple;
	bh=zcLk3E8m6QKZ807ZGbq64IqbDDccDL60ZUVrGYH/xx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GKbD9q1e5F9Gmi3Ppuxx0wC8/dxpNhch7ltukN7b0SMvjc8MUPygGBn6rAgXKpvNUI9kuqamblbre1I4duxeEUhcqZKhizQlp07+8RUO24R2rh434uoTvlaLyncRanpvfXJAyQn7NwsYeiSWCUAv4o2ywzc1qZ9xqSYHwFGRrcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EKSnhWT3; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-451d3f72391so21633985e9.3;
        Fri, 18 Jul 2025 08:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852317; x=1753457117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVxh55aabjNpQwgd6JsidGTK+fKXf2/FtFM7EHjRQPc=;
        b=EKSnhWT3/zcAHzHS1W/SA3A+AMJDJ93GuCXhHQJBCPZvtZikOkooTXNlWeQ8h4RTBs
         b3wNj379syf7FVz590dDNmy8gnA7kvWdBcCZQKrzT/Ry/MijELSha7yp+dIQVCR5dOd4
         zmN39atBhwZJGlCwNO3h7G5XCt6Ge5n7Tum//0HeiBV8vxP+HHFek+AFUKESN4DBPV7y
         7JBSO4nwz1Em6EphiTdLg2EfdyXizK9eRki2YFRUV8ToLRJhTeqcvVXjg67FR1n4qPXK
         iHSlkNKK3lDMdTJLSYDHs+QSUlN3gVWv6KmEoTN8sczB4YJ03s7kWeFf65hcQ1QKWPZh
         lEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852317; x=1753457117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVxh55aabjNpQwgd6JsidGTK+fKXf2/FtFM7EHjRQPc=;
        b=XV3ItjC9I+ghIuPKxDwpmofRNE7L16Ucdjd+bix/aqMgmHidbVk2TD9mZ7zKQ4n2Wh
         O2Rg0PqUY+dWKRHxQhbY99gPtGM+SvHgLM9g+IBwYgVMN/m+UjyZL8syuO4oM26hBPg3
         BY14UTSJQxuntOWvdwDOKCiPbC1B06Nv5soFUft7aNxERzVsWiTLF9mE7aOGpGB65HDT
         O3+Xk+pu3p4l35d/AcRNYBQpb42ckWiPn6dHn/7kW6Ys+YBZOHipXjkVmxEAg9Se86CV
         ISWAfK7c9/ZmGmV2Vz8CIe8NXmrJdaeNBSrOzhNg6jYfh5KC6bmRfn13zQQrXX2l4Ly2
         y6Uw==
X-Forwarded-Encrypted: i=1; AJvYcCV0ER2NHCkQxt1yd3dXw0AOEqwHp2l7pQYv+PKmvNMDbnijeeyvz8Kqu3gdP1goYcKovsuI6Pd5QLNK/g==@vger.kernel.org, AJvYcCVlDL67H/gmuBPztn8g5X0JWUTEsAMhNyjWJ9zIKnyUI1ZUtk0DO8irdBdOm6Ac0B4AFbkyR7VYLlOe@vger.kernel.org, AJvYcCW+6TIIlzVWch5k0GInAN0c1Gv56IY4kjUNolV2Yg0oSdZ2O+IsfLDvuL2/8zvXa6yA28Xy3BRmtKiVJWTv@vger.kernel.org
X-Gm-Message-State: AOJu0YwkIbtb9Jt8oBZVjN6XNa8hbtDFXOMnD/ihlYoJ+Fr7fuhqaoir
	adS05jdDvt/in6DiD+qMX/4AZjFYSJ/3T8qqrqAXVbLxW8IAFsenS0Ek
X-Gm-Gg: ASbGncvNQvPaaUs3IHoSGPIIxbqnHSEQe/U+ie9D0Jol3+G/2if/UCHpq0BiQafcGqm
	WfMcq1BbtlNVo3oxVgF9NlmrTPYdEkB0oVfikWHFgeOyxsNvE+0IWnvSvhi0CMGCIjf0ePy71k+
	XG3Ad3uFGEcsjhdmzr04w7dg4PHF5wZtv3PORyl4iyQ6B2feMkSd2AJ6OFzr3jQ27PnznhwQmm1
	lU8zF2kHe4rRh4MuwApbqgX/tSKrqO9MlFrn6EQTrVw5be4HqIpIjPhgn22YKP/RQdJL+ZZZIo6
	VDZQTV9C63q3NbRr3CTwzwhXk/EwsPAVwhJU6YUfeMw8JWEQCs9oWZRafZn29euwHl6lZz2Pryw
	6cd7gq/u95bDdPUaZsF4HjKeBFL7byni0Rg8=
X-Google-Smtp-Source: AGHT+IFxyUdRfZgEPkM7R0qNHuzdLNKFoTZgeb0mz6125GBptl1i6RQm1WyjXllR1VirPJEl5oAsmQ==
X-Received: by 2002:a05:600c:3e09:b0:453:dbe:7574 with SMTP id 5b1f17b1804b1-4562edaa0b3mr116293185e9.12.1752852316906;
        Fri, 18 Jul 2025 08:25:16 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:16 -0700 (PDT)
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
Subject: [PATCH v7 02/24] dt-bindings: media: i2c: max96717: add myself as maintainer
Date: Fri, 18 Jul 2025 18:24:38 +0300
Message-ID: <20250718152500.2656391-3-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
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
 Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index d1e8ba6e368ec..15ab37702a927 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -9,6 +9,7 @@ title: MAX96717 CSI-2 to GMSL2 Serializer
 
 maintainers:
   - Julien Massot <julien.massot@collabora.com>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description:
   The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted input
diff --git a/MAINTAINERS b/MAINTAINERS
index 24c557ee091d7..e973b0a985815 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14761,6 +14761,7 @@ F:	drivers/media/i2c/max96714.c
 
 MAX96717 GMSL2 SERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
-- 
2.50.1


