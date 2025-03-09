Return-Path: <linux-gpio+bounces-17329-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F22A5824A
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Mar 2025 09:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4477188D8E9
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Mar 2025 08:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F851C1F00;
	Sun,  9 Mar 2025 08:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9Q7/RdA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759771C07D5;
	Sun,  9 Mar 2025 08:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741510136; cv=none; b=iI3Jh3PlvC6qOaT8UllVnfR3rCCebybUeO9sQJAN5rgeyOF/Clz5saNAIzHthlWce7T0IUOrGwIq7QggjL1DNGyAgMb+61xeCZzdR/nFlfVOIGG3TNU5bmx4wEmp1/c4v83JSJ60dAv+GPZWJfWC/9cfgJHNpfheRC+lNH8RdC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741510136; c=relaxed/simple;
	bh=NhRGOmX9/MaUTOS5b0eo/6ObEFwyCEmjAFZ2amwfknM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mDtMxZvIMKLbyrmqB8lmuTq7kQzYdNUe7JZVs79XXSb8XNeqYdFO8Rk+87JNQEtpsALj9ie3RplR1UXZnyneVCqKw3fvuP2R+ZW2kv9252QOmJOH1SF8VO21NHUP8WxfGXECfzAjyHeqlnUjMGnJ8Gzdz8O3PfSpjnd7YM4yJ1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9Q7/RdA; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-abfe7b5fbe8so470421566b.0;
        Sun, 09 Mar 2025 00:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510133; x=1742114933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/XMiQrVzYH+TzZJLylgzzmMHkdleZU+slDLqGTb2MY=;
        b=d9Q7/RdAFcwJ56xDwcGje5w79+sQ3MjQiGUvBBM8tLWynn67qo4WTvXlWASc5Jij1T
         Q6RHvqJAusPgUBZ9EJbjaH8R5+GEXT++hWZ+Aq8qntLfGMGjDenZ+HS0KuBEGnXWxR+O
         7Z4rgKyZ5eLZGzZlpYRD8qBlK5Aw+bKQ0gzguOvHXY7bbPulbrtLHGN+POYy2TI8IlI3
         QmzBtKuBvqbk0BpBrdBVt3j8g6gWMOlpLnr4VNoaQFNgO0gqJZJlqqQLq6J7FPkDBkc8
         tjDC7m1biXswGMKvI9uDpZbnkm3FVXFNvd2Shz111yh79/exN978sx1SjYJDMPnT0IDq
         4nDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510133; x=1742114933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/XMiQrVzYH+TzZJLylgzzmMHkdleZU+slDLqGTb2MY=;
        b=sNujEva54RZN9Jei4a5iocWGM9KowIRhlsaL45OwoVAaPB4ecjs1xrtD+Gld7ZY12q
         OG//I6Tnv87l5AUV6Gl8wtLqU4HNKYKP/n5gZKnnSdWZaVufaVNpqzg7DtP9Y4G+LKV7
         Pj0Z0P1Dgj9G3pBBUaehPEWRkqtNonwuQ5eZw6jeWe5OY4GwHBb1CDiUAz/9yOv1KVXr
         HIFF6Dp/AkuZDU7gWjhkD+SUAoMLa2Kf/eBy+aNhRbyyavXL0367YC+zeFcBH5d4Kywv
         EE8w52U8MtEbdm8J/Ga5xA6ewUfldL+ua75FcszE6vUzXF5HiJD3bL9kNOZZkrh0b6Se
         b9dw==
X-Forwarded-Encrypted: i=1; AJvYcCUYMIj4vJBlsVsgBKdm3IIly/aGidehxIBr2JDkE2E2kPeH469QA8V9/iFETwxsEZsuSIXeL2RYuNVNzg==@vger.kernel.org, AJvYcCVLLQBdOegXmozdO6ijMECPDBD8DNC5apNQEklZ1zB+8hSPNq+mug/0emSo7NAJMDIvYh3G4gk5kDMj@vger.kernel.org, AJvYcCWc0bLHsXFBh+4RU6IfWS1B2RysGYSfV8//kByoY6Qn3ZWDs9jDlHvXJNhUuN9iir25dvYGABHwxSURvcQ=@vger.kernel.org, AJvYcCXpww/E0jNEvmb1gKEBU6kxnsqqzcUhO0lcbz8p2SkeK54AY4zZVN7LxXbXOvMxdBkImbtACwiko3AbyIXP@vger.kernel.org
X-Gm-Message-State: AOJu0YwSOUoGAFyPeKCwjzBGG0n4EYSKZsmOi2qhI1DPr2QhjhuphggQ
	9xXeDteQOnUuE1O0n6j6WzczUDqIdE8bPuTtGQezXEqEiTowVKsl
X-Gm-Gg: ASbGncudvfCm0xQUbfz/sgyBOOmf2nGrLtYWBLmpvhdTCKu+WUu5lQ/atpf0ReNyYmu
	hk5PafUPxHqnoR56estgOaVw/jYI3BrtWcBlit0K13BS5yioXu+bzM10Q87t8kAKme0xsXY3bS1
	m2hvHJjtItOCMvRCcuQXheBOiMkd36/9QUMx9OntfxxKJ8nec924NYeDHPtngREDNWZRGIr2RIp
	xrJUvPIQf9ZksyKd6sJLnIE9aM9QQ6+kQ68kjHFGY3BjKl+nGzKulDBWC/7U0XcvxNI0ZTrVCBJ
	EfEOfo4Eew/bsqlji88BZaIDXKOn0/hy2abRA1ZGIaNdI7u0k8oWzbdm8odnPzZ7OI3x
X-Google-Smtp-Source: AGHT+IEEWfGQxkuZd8tf5P3vShYuUP5N/11BTkYFYFiWpUuAwDxrOihccUqBS80lDlE4wNLi4HgKYA==
X-Received: by 2002:a05:6402:280d:b0:5d0:bf5e:eb8 with SMTP id 4fb4d7f45d1cf-5e5e2468800mr24297960a12.23.1741510132648;
        Sun, 09 Mar 2025 00:48:52 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:52 -0800 (PST)
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
Subject: [RFC PATCH v2 09/16] dt-bindings: media: i2c: max96712: add support for I2C MUX
Date: Sun,  9 Mar 2025 10:48:01 +0200
Message-ID: <20250309084814.3114794-10-demonsingur@gmail.com>
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

MAX96712 and MAX96724 have more than one GMSL2 link, and each link is
capable of connecting to a separate serializer. If these serializers
have the same CFG pins configuration, they will also have the same I2C
address, causing conflicts unless the deserializer muxes the I2C
channels. Moreover, the serializers can have the same hardware attached
to their respective I2C bus.

The MAX96712 and MAX96724 suppot I2C channel muxing via the GMSL2 link
to facilitate communication to each of the connected serializers.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96712.yaml          | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index bf8c861c836b..9e27568e0105 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -37,6 +37,19 @@ properties:
 
   enable-gpios: true
 
+  i2c-mux:
+    $ref: /schemas/i2c/i2c-mux.yaml#
+    unevaluatedProperties: false
+    patternProperties:
+      '^i2c@[0-3]$':
+        $ref: /schemas/i2c/i2c-controller.yaml#
+        unevaluatedProperties: false
+        properties:
+          reg:
+            items:
+              minimum: 0
+              maximum: 3
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.48.1


