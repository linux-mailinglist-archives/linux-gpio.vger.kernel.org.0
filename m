Return-Path: <linux-gpio+bounces-22628-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EDFAF58CB
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 15:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0528F1C41A62
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 13:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065E628B7D6;
	Wed,  2 Jul 2025 13:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbFkBSZo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B782820C7;
	Wed,  2 Jul 2025 13:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462496; cv=none; b=WE5na70a761WDbcxsE4FenEPJ3EtwZAG/6Zrutuk90hFhEDbeh0jXR62qOYHO7Qf+L7K1dAP2MPgh93hlD+jnEodBszqq7eWJj6GA567dEdIMCaQszSG7aRU8T705tmwls0VGBaRny7dBc1p/51AaaqyPnDFTpz63+Jo3ngHWYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462496; c=relaxed/simple;
	bh=FlUeBByjjmUWDFCviH/QuygzCnSHCQcTvS1UEc7C/m8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HlEk5XZss87HU2ZxGQ+DxRiHe0IGadV6D45Brujap56FfdysHZSCSvuQRPJOLhS4oRW3UnRus5sLaYefK4XdeWdTGtkrhw/E7OGu7f780IvFtqMfX9thtyv8GYvaYV9b4jFrNSGSrpjw08Mb1TTItvBPBYPHM1vJhClSKKJsYvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbFkBSZo; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae3703c2a8bso877382066b.0;
        Wed, 02 Jul 2025 06:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462493; x=1752067293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woN3IMIK0eyXUy8BqjMpuHpqxM7ZtBG0o8DuW1QypD8=;
        b=ZbFkBSZoun/N2MDxbzalLy0L4NBNr84C8PFX7qh5kBSMUiIGd7xkTO+rKVw6opaY/E
         6wBQovzl/T5Jdt5rxEOys7ANUz8irWkvUiDns4vZDKNueOnEzY+oLsvYIl2RTKm1Gg+J
         MzeJRtm1+wru/+qcHLX6D3KRSHBmMgaJSxoY2RD6peNrU8Cddoek/9pzUtrxD1lzP506
         sM4Id0LzLh1s/nBPGtaaKdcgC2BToNHiwoKLIsaCsjwsk7GfEITV2vlC6hnY2bzmYuvB
         Yp8luvcmWzB2hkOUUYrHNa0l01sjFQ5QtcSzUjiy5Knq5+n9atL4MbI4BZ4850Q9mRWk
         Ouyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462493; x=1752067293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=woN3IMIK0eyXUy8BqjMpuHpqxM7ZtBG0o8DuW1QypD8=;
        b=xRlCVHfKmm40wd4gFtFW04zl39Y7I6qjpn0lI58dlZRGP+3ZxhYvI9w0XEErAgEr86
         Tw0/+qklYKezFasSR/mKvf+Af6apXV2I9WZsn1MRE0+fmOTXK2/L8Kd6zlwKtrDqbbi4
         x/ojgiQQ1MHe9Vk/eZhbW8kcG5UQDqyhRJGHOaw6OyRSBrtPA/liSf10P41BHmPrW1s3
         VynTkNjmZpHvU6cTNs+saP6C3WIV9ESB7zpqL0Us4aVgG4qvkoJMgEiv8m4lnfY2lDct
         m0H3TIpGFN5Xm0oJ7dpu9WLM2kel0HEDZzVbLY8MW8I+S8bS/e0ZAHoRzOMIXrpY7o12
         AoiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgqiU/4lmWajm18sr+SVb+UIHsi0UfXQQVlysIVP7FJ7Vv1ZrkRgX5DR6YqbtDNCe6guh1xdc179pExSt/@vger.kernel.org, AJvYcCVlnoQ4YfiCRov3sjMV0eHxMR/KOGwL0aaEilK+kWxP4ShPoTpxPErVCp3tPrw0nmLEm2p7l+s+FMzp@vger.kernel.org, AJvYcCWWVokEzyp2SV09XSv3XPAzti9Y/3iifgPbKaW//jUq4AjD5SFoJg54GwRLqh6aRrtUKwwUFaxZT2WNmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCevDt5/awBbajbaB58hJbSA+Xb2FWj+BR9HjpiDyzeeub/QRA
	PCf5Ww4DlYRo2/QMsG4Om0wvmE3URdr4FCuDiNJBbSdwTU+T8tNKw+P/
X-Gm-Gg: ASbGncsyyU6199hO+EceztEmfMk3nua2wU4jaxcBh72bswZQs7Bv8pfH8Yt/CrPiY8y
	Q2eT9G4GkDGeF5B7dEVYCHPcNOw5Atyc95vkLhGwf4Wf4IPxUZTqM0sq7AKYFTqK3VEc4RePwz8
	pJ4FZRhC9xoKJcDab6rM4v29S+TOoRYOeB52mciwhdBs8l7XIAS6MbHHTrwsSA+sYK61oYbUlYw
	U6GZIHp0Aa5iRTa3GlEcByvCDnj9yitBKG2ROErXSUeWjtmfJfFADonJ2f5ERAhh2j6jsQkyFj9
	qgRQVNy5vqoDzQlu/Ez6/V9dgacS9eIJWez/aeshYGqtk9mseLe7kTX0QMz9FqksbJijmxuZU90
	=
X-Google-Smtp-Source: AGHT+IGlHDeC2VpgxzSynRb5GjQ581DXed8/GXSRXFEwPtFkw5Rr8/fs8tBrPXGwcvbY6SDwagW99g==
X-Received: by 2002:a17:907:1c1f:b0:ad5:4806:4f07 with SMTP id a640c23a62f3a-ae3c2b10b5amr283503466b.2.1751462493272;
        Wed, 02 Jul 2025 06:21:33 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:32 -0700 (PDT)
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
Subject: [PATCH v5 10/24] dt-bindings: media: i2c: max96712: add support for POC supplies
Date: Wed,  2 Jul 2025 16:20:36 +0300
Message-ID: <20250702132104.1537926-11-demonsingur@gmail.com>
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

The GMSL links can carry power to the serializer when using coaxial
cables.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
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
2.50.0


