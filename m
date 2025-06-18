Return-Path: <linux-gpio+bounces-21738-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E74DCADE7D8
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:04:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F73317BAEB
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 10:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008452DFF2D;
	Wed, 18 Jun 2025 09:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ferq98+c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CFB2DBF53;
	Wed, 18 Jun 2025 09:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240793; cv=none; b=fax3UQfZdxlAMD3ulZnDX3afOILjIYw6i7rcuN3sWayz54gzW2icXqQqnXg+5RdB34hI/1GeIpqjeB2DmSIDg7ya1yHaDZxv5DeKwurnw5Wsny4vwA7RD3Pv+tvB6iEYYlwKJekQyLUCJRrX0s49MQn1Fw3/Ub4tLnqbUvpFXlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240793; c=relaxed/simple;
	bh=gIyaOL/GH2nwn0BYIMfsTgulPERxN4X2Ld4ChyXRgKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XWXyYRyD1Bd9VDgF98ZgpBsAAyYhCnXVX+EEoaUv5u6P6aUKFejE26NV0pAOpSVG60GFXH17xuskcD7uNlDD9pKsCRSgn91mvXgR975gJNEM5GuqczFNwxKaZHlm9jbh0fK5us/BF5encHKjE4xxgZBCTlXU15/BtH6mpxeZTjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ferq98+c; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-607ea238c37so14134092a12.2;
        Wed, 18 Jun 2025 02:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240790; x=1750845590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sX2+2gdHzfIqMHzK0HUE6rBPOILvK+9cIYaOod1fnc8=;
        b=ferq98+c9LSpHDeqE/eyGUTAXC6ZvBU/rgpw/0iUUhcTLzfaHLLYh3KAVaG2o+Cc4j
         X1l8Vwr6sS1jVjU+h4Asxi3Ou7nhGqtLtDpxt9B4j4ZaisULoYu3j00RY0WulTqWYGW0
         nc1QFqHdNrp9tgf7MDXDlzQWGvFmieKsP4CobYfAKEOcbxdDx8gMtPxg76MsD2Z/19SO
         GB+DqutRbWAFGBi1WsaFrqV79JVt0nOB/Da083BoOG+vwgkmqltVVmOkJ9NXqVvG5RGj
         tWmwbLEIn3MDBlZXgjZzggftHYeWrMe82DH2n7sCbSX3CfplZTGcK1dpFX4cAoyK8qDc
         spDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240790; x=1750845590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sX2+2gdHzfIqMHzK0HUE6rBPOILvK+9cIYaOod1fnc8=;
        b=fUzkspbZscK5DSRxxmYZeY2CDoQt4zZfy4u/jtux2evEiPRCvJxz9Cbqq+P+NxCDDg
         +yJ9d+tgyjW1vEN2lpkqQNfmUIam8f8jbxy9jYGIadNQBxSjgKlrzuFafikHkpEvp7PB
         0EmeWRKCEWTgw62c4Z45FVfN4uDNdGrqKOJSnIL6ASfQKN8mbgZoqSJxNnjSs7B2ICe4
         KZNLJ58Ucd4D1RoyD/wgiPoCq5mbrzu/BQIImviXHt2Y8s24P/TeEWVCQAy9O1dR2nYn
         zXPGzZ0xrS/D10FBWBpe121dY+5OWT9ErUQNiUmufPei3PUGi0sRZTjfLOyQehIG+IT9
         20vA==
X-Forwarded-Encrypted: i=1; AJvYcCVFSsshdMYtLJstyJDM8ULxXCFBMurY/yN6crXZ9f4+wAbdCACaNFmnl6RFbF2/Bd59c4zbCowOeHLf@vger.kernel.org, AJvYcCX6pUUEmx6bYs1HDOgaqmVCEoiuGLAyYUzCzPjT/rbrec3sRodfs0ZJTyhnMMEQuxQwSOJ/EmEnWgNIpA==@vger.kernel.org, AJvYcCXokUMzxBAMMTmHvJXlFvG6xUptsochVcmEjQrRAdzvxTsmS4YgxEVZoRY0AVKLPxWYLBZAmj3vuVwXzCz8@vger.kernel.org
X-Gm-Message-State: AOJu0YzDa88E11iidt+swNpGmTaByELZqQBwFbYLdLBv/1mZESULL4CS
	gpcFyO5keeDv0cFWl3jg+d/dNQ8iSg9iRi+5iLshRaBM1kWh642nr9qx
X-Gm-Gg: ASbGncunIuK8I+T80I+qkLAlfQerR+1X5pikaJi8Lr3+1dsXGmoEvsJ0ZkM2ahuNtsu
	WhGZepSmTAb1W06NFTC0qCDjKl3zQxKLFDE5BdWw+lowmS0BC0yF5oOFunZBelshuyhHs5e0ruJ
	QbM+Lzt/GRkmirbvfY63Z98Q6DIe6CIvA/SvMIO+XXhTj84E5M/lAr3Q8MF7WVW1oqoCsMi62+W
	6MwbacPEQzxRQAL/gVL/tB/WA/27of+WTxIGbW0ZWlycQJQHp3M98zrbOdDi9LHstQI6urhmRfh
	flIEUBLeXJm5atCWMEi0ocZEWpUEAhtpz5McA17PonEBhTOEUnNhF5UdaDAUKBjgrNoVkM1mDqM
	=
X-Google-Smtp-Source: AGHT+IG9Ltz8OOKzg18kmieWDJZRnteyY4BMf39tj5nKgAg4iI35WEGx6FggKsNK/B/tndtnp7aXlA==
X-Received: by 2002:a05:6402:3552:b0:608:4945:ca47 with SMTP id 4fb4d7f45d1cf-608d09486c4mr16001513a12.17.1750240789542;
        Wed, 18 Jun 2025 02:59:49 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:49 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org (open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)),
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 12/19] dt-bindings: media: i2c: max96714: add myself as maintainer
Date: Wed, 18 Jun 2025 12:58:48 +0300
Message-ID: <20250618095858.2145209-13-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
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
index 3ace50e11921..f53c72e5c572 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -8,6 +8,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Maxim MAX96714 GMSL2 to CSI-2 Deserializer
 
 maintainers:
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
   - Julien Massot <julien.massot@collabora.com>
 
 description:
diff --git a/MAINTAINERS b/MAINTAINERS
index 77adb1f7ac9c..423ef18ca693 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14736,6 +14736,7 @@ F:	drivers/staging/media/max96712/max96712.c
 
 MAX96714 GMSL2 DESERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
-- 
2.49.0


