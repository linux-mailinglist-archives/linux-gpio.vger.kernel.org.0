Return-Path: <linux-gpio+bounces-17328-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5009FA58247
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Mar 2025 09:50:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 299B13AD6B0
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Mar 2025 08:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB7291B6D17;
	Sun,  9 Mar 2025 08:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgWnuV4T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5BE1B87D5;
	Sun,  9 Mar 2025 08:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741510132; cv=none; b=EH99x/E291LirgF7nLPpoBx4pKaty9StA3K2CgcLbaNwxmEw829kfxcTftiEGT8+jMqCDgHaIZj+eSZHg9YrvMaYyaU9mxEzPAyeGFvO9mDoQ0bRnctWd+dwpLyrHXBoKeiDj4TlVFQ944SoFQm/4fKxMaYL2GbMcRT8Tr2ReBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741510132; c=relaxed/simple;
	bh=ZLEVbgIgj5wrAWs4Zhn6rr/9m3Q09MuxUivARR4TQPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oJ/NvcPYDHcb6RQ/JkMAkO1gjseuQCt+jEERCvLgIVku/5x66EdV1teopfEZUf6/pEKfg8G9gDCO9MX1wXVY+OPqfEYWhn0+qKVgGYD2czzIGd0Fs0YOm4k+9PcKa9c4f2k57WJd6SLk4Mng+49D3uU98oBsKwB52lRnw+32nj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GgWnuV4T; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-abf45d8db04so494884666b.1;
        Sun, 09 Mar 2025 00:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510129; x=1742114929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRFND54pfWCeCgjcI3QhzMAI2iu+uBF4oELfUtwbQW4=;
        b=GgWnuV4TiZyAswG2NB7Db7jWJ3ZF0mwypgDB2PRyMiYfwxLq4TBPqsZO7ns2xetOuZ
         YT0dCIW3C2IiioaBXyL/blkpOcwPYjTNuMw+Jp7fERCRqe9MXySsAY2etBVFP4xmOjoB
         j9tHyCo9iIcBdN4c5yDCjT3EtizpvVesrvFeLE2ypTb8WyHQMo8AaaT9g0qDa3H1rxgQ
         adwwfNQBvvGLAtcBYRfCQ61i1+gijGt+vvY5Uwbpojb2G4CIAR8h8ICzULUnDa6K7cbn
         wcIpM8c5HHcWQak6XKp4B1MHuE6g48sIBefzh4pREBctkfEIvQ/wWHag9S59hKWf38YQ
         lE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510129; x=1742114929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MRFND54pfWCeCgjcI3QhzMAI2iu+uBF4oELfUtwbQW4=;
        b=XyCZxW/BVRhLgaakkMal3v/ALWbJ5Z/G0A/J1QEMtCn5qCX7vfSWoCpg+6rOCa4mwx
         sCtf9x3MviZQgSo9LZ34TfPXPj4njJWz8ISESQLCWdytkjPWRqRLX+NcMRu6pMOkTRLP
         Zj7gtu250JrXyekKzd1kNFmz+tz2WeJa+6t1KOOAsrirnn0NlbD9rsLLiKJpbE0UZRa9
         +aZcd0ahByvL6whU841BphF8eA855tmEKMfKyeIEj6LAdrYd7GR8yhq+6FBGWOO1osDN
         7fls2DSCTP9lJ8DCC2ghdFmydNZbwPWtctKmrfXU05gRuY5wyEs9vE6izf2ILPyjQ3/r
         hJJg==
X-Forwarded-Encrypted: i=1; AJvYcCUeUqUFHwdhAMp7H+nkSfrieZd81lBQyhHSz01+leaqdPBf9gDKjxSirwILqH6KGeAzuls0wWKBRS6CZUM=@vger.kernel.org, AJvYcCWqGNud/0TtkCe+R3x38tLqWJ+jC29AGI1e8+iZl/wq801fBBBBxGQtWWYkFbIH9um7Vu81XbRf/IB8sg==@vger.kernel.org, AJvYcCWsJFxT4nq8Wi3MDiyD+h7KifP3jSQH37uazk3/j3sL3pP4f3EhGwhi1HdPPSRWwAyS2aSs0YsnBWKAgLSX@vger.kernel.org, AJvYcCWv4imHASKgiv8p76HohfHur+VF4kabALV2KXBTj5sor+YwKz1Gy/rPvKQrKJELLCc2OLkYbgqPlyhI@vger.kernel.org
X-Gm-Message-State: AOJu0YyUs0bFNvJVnlf2tgwV8OgPy6TbIEcTbfSRO7eQ2MhGOZigG62z
	C51ZZaUCiaBITt+ZLLoHGBkzYJKG2bCFQ1MFm6SPLFDsP3k2AQ8M
X-Gm-Gg: ASbGncs4IfSqNdGmCjkVR6Eir0koIuGX3hqSRf3NbJDnunsnEJDFWLrnZoh9HLOcL2W
	IktyHgaXmpXlgTCPtTk3ssWC4xJcUVrZKEzO8Vw45xOl16RTc3TQadvh1EZ+8p3h1MG0JWjhPUf
	UXHjhXnH7EzV6z3FLrvou+UoYEm/TPyuh318ttvOAdjvtnw+9RaxfuZJ0O1iSp8UlCRl7I+KuUG
	Jkz3WXyXxdhbHSdTJPWJGoDSEYdIXMkSanKupibA4mmgWXSR5ucbFMv/hCt6SCLb4E1yA5+H0rK
	hHdSoM/yWmAKNTiL1U+uO2JaMMcqQX+KhZIiDbvxCmdqyWopcSNM2fvnow==
X-Google-Smtp-Source: AGHT+IEQtmKUVV88EQYf1nXCbrxWnIHZsl/uXnzZPIJH7g+3jAJsdmu+BnkfQ0xHlYuHu8xDJYCjTQ==
X-Received: by 2002:a17:907:3f1b:b0:ac2:7bd9:b2f with SMTP id a640c23a62f3a-ac27bd90f23mr491776566b.9.1741510129117;
        Sun, 09 Mar 2025 00:48:49 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:48 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Taniya Das <quic_tdas@quicinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH v2 08/16] dt-bindings: media: i2c: max96712: use pattern properties for ports
Date: Sun,  9 Mar 2025 10:48:00 +0200
Message-ID: <20250309084814.3114794-9-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309084814.3114794-1-demonsingur@gmail.com>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MAX96712 and MAX96724 support up to 4 separate PHYs, depending on
the selected PHY configuration. Use patternProperties to document this.

The input ports are all the same, use patternProperties for them.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96712.yaml    | 29 +++++++------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index efdece2b33b9..bf8c861c836b 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -40,27 +40,15 @@ properties:
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-    properties:
-      port@0:
+    patternProperties:
+      '^port@[0-3]$':
         $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 0
+        description: GMSL Input port
 
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 1
-
-      port@2:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 2
-
-      port@3:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 3
-
-      port@4:
+      '^port@[4-7]$':
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
-        description: CSI-2 Output
+        description: CSI-2 Output port
 
         properties:
           endpoint:
@@ -78,8 +66,11 @@ properties:
               - data-lanes
               - bus-type
 
-    required:
-      - port@4
+    anyOf:
+      - required: [port@4]
+      - required: [port@5]
+      - required: [port@6]
+      - required: [port@7]
 
 required:
   - compatible
-- 
2.48.1


