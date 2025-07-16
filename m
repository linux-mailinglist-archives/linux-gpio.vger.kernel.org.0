Return-Path: <linux-gpio+bounces-23371-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9878B07DBD
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 21:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FA661C2337C
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 19:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2EA62D9788;
	Wed, 16 Jul 2025 19:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXqMLeTg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E292D8DD3;
	Wed, 16 Jul 2025 19:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694298; cv=none; b=orjKYDSF7/B5B7GqKkA1/s+aKVPdLcveSE2hvLERFae1UD9K9+nFZD84z6RGEj694rAKGlDIJWBxDIEYSjpKO79D4wiOvg5Sf58v1o8R16SP21OzzC4FE1vGgRr7Ss6aFR/ClLNSiFqTbheTJXX2leh6SfmkqDgcBMOUXu8RVNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694298; c=relaxed/simple;
	bh=yFTG/+IvVw+bzb3MnGzM0TmgGas2u22oztjAItw/ZPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=giijxvQIdcrNVZc75KFEotPPP4MCv+MwTt8BZ3GRjwBIYvzM5YzhF0+DALprGD/CXHnyvp3b22TPjwA7p/gsd+JVDuG09uU4rLNoaSS5YqpFHrod0V6G+0sg3ovdNI4AkAsOHz7yuGyj3o/mOYijIWJsKsysmBohkhMpUau6TW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hXqMLeTg; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60c93c23b08so302888a12.3;
        Wed, 16 Jul 2025 12:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694294; x=1753299094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wewY8zDENwwbPbKmIemi+OnwOyoDCjMzJlIPnG076OQ=;
        b=hXqMLeTgkRNy01tyu4z9pdjYkmQ6Rz92m3QF4B9SeZREVL7XDSU9e6i+W2IsNskXMo
         VLRYfbWNpsbUkLS108SvAQUdkJhs6j/AyoaP5WQWAmxP7BN7eNzNb3d2PdntJdYO90b2
         /4rzjcRwusARxtz23V34hoz7FwQjnZ/UYttJVwI6XrVD5ApaOxpcIQeoSYcJ59kvyKaz
         JYqPl2wQe50YR8+9HL5SRgx0zx79uEbZHoEVRPzNWFw9NzJAsWOvl8ny25keX/5sopbY
         wRA7nO+Qk9oeK4rGC2NhAjqMaVJvBGLJdT+AF+A+cYnJVf0VMrPVUZbnRjawIIPucuXN
         Egiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694294; x=1753299094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wewY8zDENwwbPbKmIemi+OnwOyoDCjMzJlIPnG076OQ=;
        b=rzD6FnNH17C5voeUPhgKKC4dJTtmr7KTJHjixe9TGz391xhAyc9dQIxt2rIYe9QHiL
         F52captN79BwwIoWQI/qbDm+PSo7EAG6MGNGRoBJ/PeYZEfrPtuU1e7QZVbAKzJmx4AM
         H2b1nZm4lcPMgbQNe2DCI06DHroeBlRkhdQmwcWbtaMDkAE2RjK2fHReK/zjqwdh5IAN
         YtPBrCqL78Lm3FmQgK9Wv+0E013vdkTemjHfw5ERavCMRCSxKynAqTx4ZzsYWq1nCd6o
         AXrD8VtGccdxPos3jajBv/pdM9AOvuH/qePUoOY37WV+QkT8Vl+UTyf0pe9H30vi2tOd
         5MTA==
X-Forwarded-Encrypted: i=1; AJvYcCVGsPFHm7OvAvCaVDcHf2KpqqY9bgAQfUCSbhrWmZytpqi84aYdZ2nWH44qtya98Zaw4itAbIAfKI+cGg==@vger.kernel.org, AJvYcCVt8wBAOVKP1amDLzPoB9mBmdmoZ1CIDRrS3ONhIoxnbwJXEHlQJBjQL4BmJGpVdns+kaRhkWYss0FS@vger.kernel.org, AJvYcCWjfQ7JU6EBsfa8Bvv18vaacgTHwGPfIVfAeZHsoSeXb07Ep4gZDb8PSFfOx4jiJvP/3TE6EzBkqfBFATVQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzRQJmw88Uhwl3+iQ2Dh4UmdM8+b4ZqfY5IdOl09KL4wuheKERh
	FyUes+AIR4e7qsCG4nZr0hYxqQcMMk9qiH/vxuQ3GpODXOIfffPbmOQP
X-Gm-Gg: ASbGncsWeYRplFbBynP3ShzITSHUphqiHvCMkp0kbmeb2eCvYd6AeZw2Ix8PaMlR4Tm
	ptO7NTK6As7DOtt9V4MiqjihT94iufuyVEKRg1Rc4+sGrIfGP6oMlqYLF4yugsjshNPGxK3Dkgi
	yVu+tbPYfsdRgx0Q35smmXlVJTsQleuI3Mah8CqfQBJWH/IlJrqi6cOV9xDyy9UpSV88jwVWSAY
	e8K2ll9vSaxxwPfmXxCKLTFFGEvZi4cKDIFxyOofJdLZJcVlSJZE3W/t1Q8qqkuAUXi5FHcsqYK
	hs9ne3B2WrA6Z1/4WWEKGKaHKPUPdWWECbsXTceGlzh9hVFSlc9f6fh4qjYNf2ByvxxPj5ySt0L
	g7BZKuqOsyEhipeGfoARBmtlhRwSlby3O/LE=
X-Google-Smtp-Source: AGHT+IGnJYrIFL/keKJceZG4RSgfZq1LbZ/S54PA0u92gPmYWNBKcE22dBkVtcHoD3MVexHsQ2rApw==
X-Received: by 2002:a17:907:d2e7:b0:ae3:67c7:54a6 with SMTP id a640c23a62f3a-ae9ce07df63mr338641966b.34.1752694294157;
        Wed, 16 Jul 2025 12:31:34 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:33 -0700 (PDT)
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
Subject: [PATCH v6 06/24] dt-bindings: media: i2c: max96717: add support for MAX96793
Date: Wed, 16 Jul 2025 22:30:51 +0300
Message-ID: <20250716193111.942217-7-demonsingur@gmail.com>
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

MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
links.

Document this compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 78ecbab8205a5..02a44db982852 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -30,6 +30,8 @@ description:
 
   MAX9295A only supports pixel mode.
 
+  MAX96793 also supports GMSL3 mode.
+
 properties:
   compatible:
     oneOf:
@@ -39,6 +41,7 @@ properties:
       - items:
           - enum:
               - maxim,max96717
+              - maxim,max96793
           - const: maxim,max96717f
 
   '#gpio-cells':
-- 
2.50.1


