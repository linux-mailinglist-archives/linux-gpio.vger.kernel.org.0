Return-Path: <linux-gpio+bounces-23372-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F745B07DC1
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 21:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB0331C236BD
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 19:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0792DAFCD;
	Wed, 16 Jul 2025 19:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHScXgRS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD09B2D94BC;
	Wed, 16 Jul 2025 19:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694300; cv=none; b=Ebx96Hj+CxAdVK+lB/gOs2SF+P10fQXhMwfJqyMrCQeYDnpWELeSU5Ywyl/9lSfxEXi5yBV4UwNcj5+gr+NP+AVFbkOHAc25LUkO+gHoJ2MXfjHWBkdPVCYS0gtKv+YDjxyMQK0a6sDygehxcDUn67TCXY23wA7aAYFh8g4iE+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694300; c=relaxed/simple;
	bh=RVveu7Evk1TPpysgWbQDv8i6qZhE42ob6nWPtfOaz2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QQtfhK99HTJSzza86XChQ/1lxg+4Ef/yCQ5uNNJNAyLw/66QakFbNfZlW0hGnv9n9Ds17VSlFq4Y2klVi5p4pk/2veil1VSyysZi0JY4ri+tCZum0UapOpdOTz4jbeLL/KjdabdXC7gkIqZp10R20i/0W5v//mOhfW2DSPVTTyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHScXgRS; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae0dad3a179so30521766b.1;
        Wed, 16 Jul 2025 12:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694297; x=1753299097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DG2Ojz6YKxpY0UTt6+EJTFAtjpkMtyyp2I7xk76Z7Mw=;
        b=JHScXgRSNxvTXs157XBlB99JAFW33xsBOtmjgUgzx6zsArszyvzT09KFSzwPeCfvWY
         Hg+nXmIDEhJW5va1lzBTlkZ/BdRdQ/v1Sv8Tw/4aE47/BITWlt/WE+zjGW7E5y8XNAK+
         eW6hNPQLPv8fHgyoHXK3iMxOUYfrGhdsXd5azt/tPoLTLTBvBi3NVC7h2kxibj9v1lDM
         NJeBsQ77adwTXMymUubU2tlLlYcWY1Su6NONjwhwlF/v6GNGXVpXBHf3Nr2zYhGBoViM
         VJnRShsigEXZU5rihneqXDvluJoS3McctL03kCuMnHa8PtVGRyQUlW14caqNJtyl2JyK
         Btkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694297; x=1753299097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DG2Ojz6YKxpY0UTt6+EJTFAtjpkMtyyp2I7xk76Z7Mw=;
        b=xD4xEI0IQTFzr5C70J4O2sJhZwOykBu5SRxGjeAvc1uB7TVfX+8laeW+6tYllVfSwr
         5sCQOHFJ0C/W4X5TAmFoq42hiaeArvGsCVsgCbmMgdSxz+V2wsCqOZ8kWuHdw1pqpreE
         8+qmq/3b/ADzR1w/HTZg1OY8ppejI2U1KMwsOXxP3SSOYJZL+R8oHnzbq7e4xGn9pgv8
         nXPs2Tw3c7N63St7nLcQ8cBx9l50YVGeibBQWQenSnYGLt0lp0Rem1OqTr0pvNBpqKzt
         RzAKEn5pcuZnj407VNwCTITeYBOXW7ZRf9YSDT4+WPcSR5tNgKqF4q9pEfs2npo4y2kF
         THtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxP7x4mwSiw8YpNjfqbf9MLRRCOTR3B+/8RgrP0VgG6KJKyy6hQHqbvt51AIJbL6Xg4EMCwQGCl4uvCnhE@vger.kernel.org, AJvYcCWgA3r5XWBug8S9bkWKvo68wKl9sPAPt932ZT2IHXD59dILbY9naI9O8XeR216ngcF0ScKQ5yaZdyhi@vger.kernel.org, AJvYcCWqFTyIwkc+6+1O+I1qJoG7g3yxopySDQfNLWX+b5/WHu1g0ZwGNmvvzZ9Z9eCGUpAKF/PYZ/qAsYA1Mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKJe5tYR7M2oZkDjYD/daYGeLAB7JqWoVq/kWAIrdJ76m+30E5
	g2pVAMIHEmIfIHenuDtfXoONEIHOi+DU4M0ugJcw/oXaEqzgNRLZsfMNjZfEBQ==
X-Gm-Gg: ASbGncsMUU0szP7QePa4/kSkoZUfPbPfg10Vd+EndtG8pm4gOiWLDNCU8tqZsMFf8/3
	jlOGr1J+z5olg5Tgv1EdqRlh/MqoGvsHRoqqFUMy3NCup4tcnoU+KVNytm+gU6vu1J7HflQHJaR
	ktfODISenwXdK8zuosQk7hMqPvcLaacgBKvJY6oDEAXUA1ckqhImBjo1xCoIpj9kQ+lf1oG71lm
	EsRm8sJ8fkaaKSUQocgPDWWFB+A3oDUKdVVBSkYeQt0HnLL6z++qzfN32HmccObg8+AvdIRVZEt
	ZGjrVkyvn7888glTDpKNzBERpo2O6kt2GylhJimJOSe7go/3DCxP1huHmMq40LQf06faVC0zOow
	ycFGDek/UJphi8Ivt3gYzyM6QNkj+8uF0Su8=
X-Google-Smtp-Source: AGHT+IFHnGRB8Zbsb5skhelScTg8x+HOj/hT5XQA3F9WDpWtwluScncqS5TTowKEUi8eWz6u+e1Luw==
X-Received: by 2002:a17:907:1c15:b0:ae0:d201:a333 with SMTP id a640c23a62f3a-aec4fbea40fmr21957066b.30.1752694296855;
        Wed, 16 Jul 2025 12:31:36 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:36 -0700 (PDT)
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
Subject: [PATCH v6 07/24] dt-bindings: media: i2c: max96712: add myself as maintainer
Date: Wed, 16 Jul 2025 22:30:52 +0300
Message-ID: <20250716193111.942217-8-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
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


