Return-Path: <linux-gpio+bounces-21739-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4239BADE7D6
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B349A1886422
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 10:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168882E2EF2;
	Wed, 18 Jun 2025 09:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKH6SuPA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145492DFF11;
	Wed, 18 Jun 2025 09:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240794; cv=none; b=jFoK6xt9jZ2UxGGRsXq0sFMT2KopXoYPIxI3MYXUBagGApKp55hTlmg/gPaKot5HmaE2VUweJ6XFOWmpkGqqz1VHnIX3zxgRjE27APGSzJWc71Px04sgqH4TifNsM/oxnMe/I4wYdqmbZpJUkbvr7i1waVpBKH2OlLNo1h++/PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240794; c=relaxed/simple;
	bh=+KYT79oixLVsm/5Pjglq0/OkL1hq1IwEz8hrWKZiJOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dPE62vVtHh42rziMcPfmw4Jj7dX+TWSg+jsfHS06oXizPCrpLw5AIGYvqIfVvemOCkRjVRnrBzLVPd4yHxmSZys5xDWclfoe3Q5Tgc9mW5iIeAUy661feyR5996Ghbd88RVN69cPQNzLGKTNO3R4oECFw5uRMMjs6kxClrlUUEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKH6SuPA; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60780d74c85so10240579a12.2;
        Wed, 18 Jun 2025 02:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240791; x=1750845591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ec22XHKjG+ejR8ND9PWg/+TxLajWfEjpKEPLdRkBrqE=;
        b=eKH6SuPAYjzqm+I0r7edotUVasH00kze5NxYzJOhXlN+kY51t5XzZUr3CtdBy1gccq
         zEtuLpfrot470uf4GNkQELjG5IOvtf/7KnpL8HywCbFcncPcgj+3a/Yc+WnQtBxrT5Dk
         MHVAkAKkphQ8cwdzrX+KpOh4qIRTpQwVvT3VgAZI9FimILNtRT7QR66hZC+E8w+j06bA
         cAJ2KokgtBiyWg8CULz0zphrscA9zp19Zh5mBXfUg2bCTZRkRzEDlkPy3TWaHtpkOUaB
         rG1DCkEUxwIE1sbQaIA/uAZvbfNu/++1FXdoXf1uYLEj/bsPYBQ9zaIbqGkKJc6NvXPv
         zATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240791; x=1750845591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ec22XHKjG+ejR8ND9PWg/+TxLajWfEjpKEPLdRkBrqE=;
        b=eoxx5MQqKVmcq8NG0k3zq8IaSK161Bk1YnzaqdUyGoVu3OxVew71/kvTxOdyUXUh+i
         4vdhUcsYTiVvGVLYB7A/k2QvhMS6sqr71VEZAUm8mrXAU96yc9IHvJCsvKExqoJ3jaz1
         uHKW+vBlggoCDqFQC4NvYHEEVYBW/pmrVNk1qVXqhfOQiF4nB3fXBM0FSn/CAqM824Z3
         qanmKZkCrPHIiay5NT5EJ/rQ1tyyMgYrSYbbm25Q+kIE/bObp8uaiamzDIh29+kSPD8m
         5IwpJLyPYbIaFdmHdiL3IeKoq1FL8qIAd7qoZHgvBAgglqd5dQmYR9XzIYRtqt0fBOOd
         QEfg==
X-Forwarded-Encrypted: i=1; AJvYcCUyfm/QfLywtwwLgHV7x9lMTd9618kPtQw5/5zh882U46LC/6gavB6pGvqAN+zL8DWqxoyCJfq4p5gOThU5@vger.kernel.org, AJvYcCUypaC0BBgp8QjnS78yhutdmiY6hk8DOc/jFMDIJWpj0a8IWub5n6f5MzMbiO7PfOjvRfFkdJfq7sRt@vger.kernel.org, AJvYcCVE6K+ai7L6jy/nzigU5nW+pZH632DJUUxuBd+KqIlVG5HpR7HFlIxwBfZBaJ824Jdn7SfjY7garcG+Tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGVOQiJZeIAVmgyBbtggpRFYEaGbaamZx4gbLkt3KW+vFIF0Uo
	NwG95fnzWa7sMx52ixxCpUEQ5aUdRo19lt2e0TD21Sh0tqA8wy4oXbiT
X-Gm-Gg: ASbGnctI4KUJm51gYDwpjHnGdjnvnyB3kbyxsbn3q0YJLk31ZopG1FkWWMiOF+qZwlA
	HVqF7MQPopeKcYg4+aFWk53utH7gAUaS5QKvJZJiYOKXWcezMtjmsc23nyq0PKD/lpiW/3OvhhY
	t4wfw1wYgD91jiF5tZxDTIKV6+FUR6wAF5WgWIbmNwOc8gpDLmp1istrWwthtIpXNulc5TYeF3/
	63xHLZXB8+PjelxTEbIQPl3cvm4fCi0SIGj59S8jmcJjok0yTHZBWXcm/FyD5NLcuLyLA5AUpL5
	N0YiFyw95UvEPCFOEpYfqO2Yt1GBYCkheza9/GvO09/BOGsXp84Gf9oVOScZg+nM38fAN2d05+A
	=
X-Google-Smtp-Source: AGHT+IEwMDBbeSHpT0wB215NsckLc9ZFcIVd0MICCrwqb68KTljLkYsjJiAX5ubzR9DASWsy55435g==
X-Received: by 2002:a05:6402:26c5:b0:607:f513:4800 with SMTP id 4fb4d7f45d1cf-608d08b5dcfmr16192558a12.10.1750240791306;
        Wed, 18 Jun 2025 02:59:51 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:50 -0700 (PDT)
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
Subject: [PATCH v4 13/19] dt-bindings: media: i2c: max96714: add support for MAX96714R
Date: Wed, 18 Jun 2025 12:58:49 +0300
Message-ID: <20250618095858.2145209-14-demonsingur@gmail.com>
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

MAX96714R is a lower capability variant of the MAX96714 which only
supports a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96714.yaml        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index f53c72e5c572..1c97624833eb 100644
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
2.49.0


