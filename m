Return-Path: <linux-gpio+bounces-22625-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B19BAF58BA
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 15:26:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C81D917FA4C
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 13:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FEE528A1DF;
	Wed,  2 Jul 2025 13:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIl9J322"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2AD289E17;
	Wed,  2 Jul 2025 13:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462490; cv=none; b=W12Nj30VdAKuHIcdNk4X0+mvjSxHw4x0SA6rr3kcOjsZbOePI8XVRbkKyXnm1Si3hJ43LzKm19bfFqxBz8WxuIU4sqMeXzy6jmS2Ir4yQqL97NO+piohAFTqOZI8U9amU33QWaG5hzkQpIzNvr2Ja7HL9zEc2KewkK01EX30Aso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462490; c=relaxed/simple;
	bh=2UXQv5xiTOnfjhuEGz9G79TZ0C+5uNG+PUSw5mMQ2Qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uxxoYN2jYakgSK+BePpG4MqGSwdevOwGju27TqxgQPR/479Oo35+uCgSry55Q7lobNJ/CYE8GKdNHBNKqg6K7ccBdBqPoYV0EK5/Zyf5yW9t+gCzDl/8rDblMEfNH9iGT632r4eBH7ZyIKY3BV8/rsG/2TDMuJKSDPDBg7cuKdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIl9J322; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6097b404f58so11122869a12.3;
        Wed, 02 Jul 2025 06:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462487; x=1752067287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNmCPN3gRHp9kE1IhRlEIQDYzdEUXzUNt+AYwUzgX64=;
        b=hIl9J322sFJtJ11M8i+DVpL8dI5Scdov2UL+rXfZ/cGS/bvTqR5c0nHc8RCCIvJ1T0
         cznDzixbsIuhGAu0/T+UyZR1j1fuJ/IdSdLh1njmKj0p7D/kDimGcM0h01sGcIOwqhDC
         AqiAzSuRAcOQpzbcJUDr53Xs61jiD7+5LVXGbTQoDusY8LrnC2SsB2wDDGRtcinEgZO/
         ASu2r+bRUMMC3h7aKsbjSBgT3sL++/KM5LmgdQGjyyAQiN6Sid3gXg1qas4MlqAz2l4R
         rsnQGKFoNxRAZwFWv0LIi9VEFJH/o2fxbKcMYIKyuiXAYRb9oFQieueUTQ0Fy2DKOBQQ
         d9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462487; x=1752067287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNmCPN3gRHp9kE1IhRlEIQDYzdEUXzUNt+AYwUzgX64=;
        b=XwUkkmhJVRS/j8KAJ4H6e3ZKnw/xZlp9IRJ+wMK6qI2K9tkifmjjp1O8hpjvOEgTVh
         ntbB/RGzm+W4lVB9I453J/tTlzYOXoRfl6QZaFldGJcLbbpUgs1dagiJ2rPYc0h127RZ
         rQzMSKUOW+zeaGnM4FlNrPsZijkrQ3XuQAMfldaCeOJgyD0/rDND7s0CQmxNrTEZmvm3
         uZ7mVlGWwRmR7cE8p66zUeTb1Jt4iEZal32U2sLK97WcSvXP6i49m7Pl4VkezzSH9H20
         XLceh7xZLwpznoQD+/9nGMk3Fv2QVYvIJI5Ae0Viw95goL3/TzM1SPj+Bvub3xF/7U6I
         tB8g==
X-Forwarded-Encrypted: i=1; AJvYcCU1xyFcg2EDhbhnPTr1JSTi2v+u67GxsIW/s5yOdStBMw6rVLYr0J7eQ7MBawXr3Ysli3Qg17pI+J0gPw==@vger.kernel.org, AJvYcCUlIFrtYT/VrqFNjWIAkK6I/tF48RDDtWh9iGTyll6SeyB/5+02dckfYEuhG9SEiDJLG63EmicfgT5cbQz/@vger.kernel.org, AJvYcCX9TYos/9ZOknVkloWivx3V736JlvIwxYP6AUmMnO8ci/xwFwJxdBsZHWzyYMW5DDNJOkxHE3xuD22z@vger.kernel.org
X-Gm-Message-State: AOJu0YxBHGOLN0yKiZNGDq+xFv1kbCPISL3b0vl2Fc6/hixkk4SfeaHb
	j9IqqSrFUwbJWItGmiNiGcojBwe3NT211fgz+gBa+BXvP/TGnOHoJFS6
X-Gm-Gg: ASbGncuaqCmWkRJla6E13EiWMVq6G0XEsLiIXw+ZNjuAR3IuT4bhEgDAEEM4F/8YG9M
	FCBsOeVhVkoUv8zfN6fyw8lFDk8fhI/pT/QvXgZOmkt8yu/V5P3A8AXvI+7sKGhrR7dhykJeZmi
	qsdEMNTspkWsfWNaLYHS10hnJeK5P0l7aGx1uCJL3zXfN+47tzZ1LEr7KMQlX6S6iNamBW2j2S4
	mlcAGRl3xpi47fSvgEN/NufeaCGiwJT4dSfTwFyvURKnOJVWXiQoQst4HC2vRS5S7ftzo350z8X
	jMjAmI13Ltf2wRUKOOZvm1QpQy6M2D5pqJy95/CMQsWjPO2KGivRCIRp1GSlpgWIW+yg73ELrPI
	=
X-Google-Smtp-Source: AGHT+IEIR8lRO+Q+RXs2O/NtywQw6YqQSrcQ+z7H9VGv25vo3dLO4oH9KC9oZC3d1SPdav0VZxpsPQ==
X-Received: by 2002:a17:906:4fca:b0:ae0:c8b2:3fc0 with SMTP id a640c23a62f3a-ae3c2b0570dmr301043066b.10.1751462486408;
        Wed, 02 Jul 2025 06:21:26 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:25 -0700 (PDT)
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
Subject: [PATCH v5 07/24] dt-bindings: media: i2c: max96712: add myself as maintainer
Date: Wed,  2 Jul 2025 16:20:33 +0300
Message-ID: <20250702132104.1537926-8-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
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
index 26f85151afbd..efdece2b33b9 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -9,6 +9,7 @@ title: Quad GMSL2 to CSI-2 Deserializer with GMSL1 Compatibility
 
 maintainers:
   - Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description: |
   The MAX96712 deserializer converts GMSL2 or GMSL1 serial inputs into MIPI
diff --git a/MAINTAINERS b/MAINTAINERS
index c4bf1503eae3..6a89cbb2d14a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14728,6 +14728,7 @@ F:	drivers/media/i2c/max9286.c
 
 MAX96712 QUAD GMSL2 DESERIALIZER DRIVER
 M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
-- 
2.50.0


