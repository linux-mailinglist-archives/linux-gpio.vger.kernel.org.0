Return-Path: <linux-gpio+bounces-23483-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F063B0A744
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 17:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BDDC7B5AB6
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 15:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5702E2F0E;
	Fri, 18 Jul 2025 15:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PuOpOlUi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2A72E2F0B;
	Fri, 18 Jul 2025 15:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852345; cv=none; b=qyks3loBvf4ORqzTKdB+JOh5m7p+6v7OBLh+nWxVyQUlHSYE+lLCbxW/klyXuYENKF3fvI/ltImEMeg6Q3WVKR31WAHpps8gkkaljALS07TaCd7VheVIIVBaNrkacGxjyQZcNCTuxnynEeGLFRqPbyoJsoxDqv0irclxpz/xF8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852345; c=relaxed/simple;
	bh=A8TElTk1Fj3is2z75X3heqyGoQRmHGTT2JdVWiyMUYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m7zLfhUzGEy2Lm38wwthRpi2BX5ynpuR29cQnYy0C55wENkw1W6orQTJZ/AcGK2gYJ0Zo8trNmFLjh3kG/bDKoLxe5y6PM1DhP/IGz0r/crSEiqnGNHXkXpineVrXbvUC8hy7ABp9JPmZ/kBBLIuOYctnT5vXblheSlSwu5x3P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PuOpOlUi; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a6cdc27438so1528614f8f.2;
        Fri, 18 Jul 2025 08:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852343; x=1753457143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKwNNCz2eG9U29ALEDHAFId45pOA3pYtpGo8B4QYY6k=;
        b=PuOpOlUipTr+QlSAZ9of4ubw9sjBETC4dPuTs/ozhuMYjEhgN0JiV9n3Ip1vNdyg5W
         H3kn4uK7qmhBPSB8JUpMebrc5ckS23QU32jdzdLOMhK22CSQQwSFNDprRieeXIsDmcO7
         BzYsW9ohGY3Uyes6dkqpG76QBzEP9jJUJ4/Bv2ykl4E1FN8Fv/smxfSfrd5et8LarFMY
         W4foLjt7QsSmJIibxW7f60zzJh0EWnI44Pv08GVohSLOUqny8azcWrIquzrN6hDNuwVX
         D7EVijAJ+78aCSXWFlYDXym3Htyl4XCJTxSL29fhuqFBodaj9GBx3XsSsqKYm9OGFZEM
         7rnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852343; x=1753457143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKwNNCz2eG9U29ALEDHAFId45pOA3pYtpGo8B4QYY6k=;
        b=pE4mLVIW+AvGaT2YsbOPi2wfNSQVZs5tjkHSQSJIczYnyDR2+pCCwYq0y9TCT1JHqy
         Bn/9oqez5KIh1t1oeMNUR+yIhPD4q+BpqV+SSMTzGO40/M/2LvmWhFLjuphIH6uIwx4k
         mLys926z9LaWBH5u8h1Ugx8P98fCyAcagsGhr53ahYyLpwptmg59Q1uTnmVDqTljkQFA
         bfZaATdyXf6snodo95OpsCN8aL62LUipFUUFjfmbvDuA2TTffrz2SQpN3Uyrm31RqHVJ
         o9oeMW8cHxyrMlnVrDXA9OIqbths4p0CKKe0xo5D7xXurvf+mf/jKgq6ICXCyMWZJgpb
         03sw==
X-Forwarded-Encrypted: i=1; AJvYcCUsJsE+CZUySzHRfpjFABJcVp37PQMFBFaP9BUyYgniyMq3EvbYTIiFH8bLptDsbfitABvhc2kE2ufr@vger.kernel.org, AJvYcCX1b9oMXpqgkaTIpMqndiw72BzvRmCH3b2TQqvJSY5ZzwhEcmbkFSW7jP/ji3oxL7s+xqvGhYLxTd4t1VC6@vger.kernel.org, AJvYcCXr46sSC+WeU5vN6jfHa/CieN9Zzp0ynh3WOrsBmhiKywVdyyj+/2RmtlLOwtgZNp+6HQUdOOXBA1dRLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ+mAmUEKOAZeBQaGGOr6bjaKxcagYOZvHMPVzEb3vPW/gT5CB
	yfHz084HzVfyG7QnMHrR6oT1IwQn5nlMnku+Q3v2Rcj11E6cI46m2kN3
X-Gm-Gg: ASbGncv8DrYW4DT9YAytDb5wS9Uak2uUy3HBkiyHF7+CQzmZEZvx474WiLVEFkX/e3c
	8ElyJCFtl1uFoJe/ublWtem+/R/me/Cpe/HUiveh+Fs8affXI05GlxxSlFw+euCzQLVL8iMh2Hy
	PbBsfK4MsJ5XhqmhUWQZDH32J4xnB/yJqEfweGyYf/Y4MlarQqY9r4m00zBJHolu24odDeV2K9Y
	lsOoa9lg6As3HweJrRR1YslBdL7jTQHaa4Tqrfhg6MERYeVO9lYXM4ShmcYjfx89IGAyTj8seEI
	V6qZt5TvofrqJTdRogcXxnPItOPSmI54n6GruXL79Ucc3oH5KsZkGRZOeq/R/xATwb/p+3i8VRv
	SIg9ALs/9tySkcK+9Vb9A53/tX/1Kuy32Lw0=
X-Google-Smtp-Source: AGHT+IGK51BdL+yXQJI7ETdHEtahe2g0TA1zj3GYacJnrCDjJBB0ZM/jW6qp7Gsv+wdfK8sGbDTVrA==
X-Received: by 2002:a05:6000:4311:b0:3a5:25e4:264f with SMTP id ffacd0b85a97d-3b60e51caa8mr8808575f8f.31.1752852342522;
        Fri, 18 Jul 2025 08:25:42 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:41 -0700 (PDT)
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
Subject: [PATCH v7 13/24] dt-bindings: media: i2c: max96714: add support for MAX96714R
Date: Fri, 18 Jul 2025 18:24:49 +0300
Message-ID: <20250718152500.2656391-14-demonsingur@gmail.com>
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

MAX96714R is a lower capability variant of the MAX96714 which only
supports a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96714.yaml        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index f53c72e5c5727..1c97624833ebd 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -23,7 +23,9 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
-  MAX96714F only supports a fixed rate of 3Gbps in the forward direction.
+
+  MAX96714F and MAX96714R only support a fixed rate of 3Gbps in the forward
+  direction.
 
 properties:
   compatible:
@@ -32,6 +34,7 @@ properties:
       - items:
           - enum:
               - maxim,max96714
+              - maxim,max96714r
           - const: maxim,max96714f
 
   reg:
-- 
2.50.1


