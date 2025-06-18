Return-Path: <linux-gpio+bounces-21736-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 803E7ADE7CF
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83AAA166B92
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 10:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E987B2BEC28;
	Wed, 18 Jun 2025 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WqZ+O7UA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E765A296153;
	Wed, 18 Jun 2025 09:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240789; cv=none; b=J2CjhylgCWgKy0kbqpfm1xa2TiB1V+grTsMIeUze9dA6ItYCOL9Of0RWbyZNw6ziaJ9SKyuuj0x93YgeCKNsfaOjQGhQ9nIDELhz50RE3C9Rf3tYiM4lQPvpMk3Y/TWGwGc1Ury+JWJQ2g1oyB1hla51w/i1TMuGi8FWrKLzYXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240789; c=relaxed/simple;
	bh=npU5zmbq4m16yFFE/UvTeSSqz/GjiLDGvge4SkV+dOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z2RRbb2dUxAH6/vvBes51/Em4/yvzENrnAWVsPZVPLwxCD51xOJi+TsuTS7EXNPQN5UMuWKtEi3LaDhabdhdJ7RNPdjlNFpP7A+ozYEkvQGXZSuQbLIf2kerL0zolnB/swoDQ2obw/PV1kym/fSWTpXDlXf3Qr62OQ1259D56H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WqZ+O7UA; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so11427606a12.3;
        Wed, 18 Jun 2025 02:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240786; x=1750845586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Zlxe0FWKSlX6ZpjYCnKa20yGhgX4GJOUiHsNsl82fo=;
        b=WqZ+O7UAu1g/FqLxUNQwcTdwya6EBnqgw6wjULsK1J+hcK0b27GbROMYxLNC7LEg1V
         e2+O6jfry8EBt+jWwJrd7Cri7tHvD54liikX6C3/5+uOB+DmU85OFrb3NvinOe/Zlz6O
         GyFa1hW06wOjWcyakwAuSQWKeGNTVqzYnY8rBpe/PGwS+Rh8nvas5HTLP+9JKhOrWpRL
         EdIufdyOSOCWMLldlBUOglgWsg/sv6yMqRZjT2TNJ3HSixfp40rDd4zBdGW5uJN46691
         7+HXPzB0UEwPHQK/VM+YonCz/QA861ECWLM8C8wcq2hZOUAMQmP3Ircmf3nNByUlyVvm
         ytUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240786; x=1750845586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Zlxe0FWKSlX6ZpjYCnKa20yGhgX4GJOUiHsNsl82fo=;
        b=we3I1jgE5w/YRsv8CTUwY2os/qgcLO1Jj2YIqLRnGbRdyrAz8RsnF93v0sHtff0hoe
         j4dYRHIw5Tho+YbheE2YD6HBHKsgZ5BUt2lbEaEOd88Nb5GglJBSZdoTg2n8MuJ4A4+q
         qjyFkXunNzRd5yr/SIDCs0q8Sp4e55bHBecLXSReFGAEWX78ZodJNwkUbW49XRssvIbO
         ihmrr/tJc+eLOBTp1ntQjFht2svSStWaHrBDQo4NlVKwE4+RM2vZDFAxrxhX0h9kAU7w
         moRLgZlfi/lU+sh6ISu6CttYUZi0DDoxm4qWOz0RtBZ83XMUZ9WoTkd04aKBLtjAA5Ni
         vDhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoDcPfeaan9A7d/VFf+IdfmR25F0XkngNeoL2A5Son+s7nJDA8412lK7d245LQHAi66frRhTOqNX0OLgqL@vger.kernel.org, AJvYcCVIEV+AXExoFOkrgvEduUhjCthx3UVRvWAXzeSszK4hNmCiRpUVWrkTTgdqwQGrV2U2skyBeXlGOQs4@vger.kernel.org, AJvYcCW0l1dVfaTdDMTCF3+xDh5IMfcwyrrepz5e3XElz576UlpJIpzEXOtb0OwDbGylWT6kgJg3LcvjrCWTmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIo9FSdrt7P7XB2/t/xbMqR1hupUT5TUPk2TacjRpUdzf0dMS7
	52Npn73AS921vAxdJBrXuppGKoKmFMl7Kz4YL7Nn1dDigiq9962gH52h
X-Gm-Gg: ASbGncv9vaHxZNgTQSio4vK/E1QzLbGNC44ZABrkRSt//vuyUfG1wNu2DaMzTd297+g
	lbg0g5uqDtkTgvUwcGDJPrhy0gzqcCk1OYuRiuid/o/oMrwKS85ErxGL6zDCDOGYKqloA/qGK0E
	2Zh834Zqcwmt8BKIYnpZttSMlXA+UbAQrt2xqnaOkzsqLQJXo0rU4scwUX9KKU8BpuB3avkK9Eq
	VPqTQu1C/Y3DFxxI5hjgV6I8i75Wu2xdw81FleqrR9ysK2L7oCWcEb5aMaWYCZ+PfOjQxJGxHRH
	qD9nc1Z6YEa+5c4azDeG/+T2yww4XhQUi5VOeevkiPlPeZlMbXF2t7NsHU4IpjA5OHbc1vionSQ
	=
X-Google-Smtp-Source: AGHT+IG9penIGaVwsHptDJX0KM1UF66PREWfOai3W+uhZxrAvJnSPfX131I0r9nwPgeEttHzQcYPTg==
X-Received: by 2002:a05:6402:34d4:b0:601:ad95:ca6d with SMTP id 4fb4d7f45d1cf-608d08616b3mr14849444a12.8.1750240786236;
        Wed, 18 Jun 2025 02:59:46 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:45 -0700 (PDT)
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
Subject: [PATCH v4 10/19] dt-bindings: media: i2c: max96712: add support for POC supplies
Date: Wed, 18 Jun 2025 12:58:46 +0300
Message-ID: <20250618095858.2145209-11-demonsingur@gmail.com>
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

The GMSL links can carry power to the serializer when using coaxial
cables.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 758c0223977d..b345305acc4c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -96,6 +96,10 @@ properties:
       - required: [port@6]
       - required: [port@7]
 
+patternProperties:
+  '^port[0-3]-poc-supply$':
+    description: Regulator providing Power over Coax for GMSL ports
+
 required:
   - compatible
   - reg
-- 
2.49.0


