Return-Path: <linux-gpio+bounces-11800-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B9B9ABD18
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 06:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 358E2B23962
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 04:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A29B14658F;
	Wed, 23 Oct 2024 04:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YO28bgCn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34ED13CABC;
	Wed, 23 Oct 2024 04:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658701; cv=none; b=OWie1+wccIsSmNJsGyq2+MgzaipVkBuWeM5hhMBHeGmWsxxZOpQGNfRzKrH7EQZYftSsdnGOBaI5JIwNvVzJ5HUC+PzaYYNnWa2HZH3a+gGtV199m3NsAkdQNF1nLvJfa/n8R1ng8XzVHoiXEbx4UG7TmiC6oZPxEQ3Pe57NFic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658701; c=relaxed/simple;
	bh=xNIV6DN/8buZvNlK0QqZPtrqGuIXmLL8oUXC00+mtW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sKS/VOoW7YXpxo4r48sADd1MvEFnIfoINlSQGlsNKicvEaXcqnRxfT85jpOHrUfOjS/o3eD7vNaVgaMV7C/Cx6faF37Q/YaSPTp69jMuCRArsPY1cmGH4hfqhXkMi1oEC8o7PFiTx7Leki4ztcTDsskDBtfpAgdwWEuGpEaFA8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YO28bgCn; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20cb7139d9dso58355555ad.1;
        Tue, 22 Oct 2024 21:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658699; x=1730263499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3kpdjyoP29XpDiPFedkAYnCbJjAK7z6B+D6DDuXAfbg=;
        b=YO28bgCntqtjCTnaUJzWFA/4Q4qw6yYe7pnBptxO0Q5YrBdz4OupazexFlo6boFOSb
         PVz4ieoJpnMa5bzdD5ovSrtkNCyLBVsOgBMhnlKgdGhEsPCIL2p5Zw14ypCvuOFY4YhV
         WoEvB71evdKVNQE76IEo+uaCzxXGO5rKeDPxyB8wSYLqbm9gojL0AJzIU7g707iJFx4I
         vO3sooHFIQz6YXfL+GaSh8JZiOws/s0XAwJqgbBsiZ4wRxTaryUShoObTTatjoU0SvK7
         EqWC+lmB50XGWFkoQoYdk6KLsZtgucJY8sffh68EYsOjxlYg4ulM2n/5s+Vmgh2esXeU
         ZRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658699; x=1730263499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3kpdjyoP29XpDiPFedkAYnCbJjAK7z6B+D6DDuXAfbg=;
        b=RwRNomupg/WvmmM9KXuaWSieh6PpWNQmMzUBWUDcdl+AoOarhJPnCYJfTTYgupzmgv
         g9IgR3PcQYZ+firEYQvBxy5Eb2vG90MHRhmvsQwP2Nep1GChhPkCFS4upTUAyMaV141m
         QE/u133lw+rpSiYk01NWYbl7XTqCY51SqRYSuTLt+dx0GigZ9bQoEsAzXTF1Glp+FHZt
         G0x1ETVq47ipZregKhVhH9yvoTkSqqmduTz3uIE7fKw5fMmXGWL1Al9w6Kb2GocbN0dw
         pILMz8rAEOb/kErIboUdVecikH2INAG8qkdJQd+STUCKTo6R2VUP29aq2Nh/i2w+OhLN
         jC0A==
X-Forwarded-Encrypted: i=1; AJvYcCUUOx9vfEa8TupVACTz1oNXFKB+1y1g5hmO3ikOgimT4CBEQ5JxJuYsZUqmCNwJtUV5a5Iwso2BUrUE@vger.kernel.org, AJvYcCV0Oc1cXtIYa6yqCsFJtmTralUEHF9JoVzH3vmFgjI7Ky2h3y+8J8ZRcXEuCGyowVZ/TmSb1WBNfAuQ1A==@vger.kernel.org, AJvYcCW5KkE9Z0dOGiH9fTaX0yqxEu8NcjC80ZHMI6VI5pmC3JovevOe9OdIZRVPb189sMS7pkyywyOBME4tObl0@vger.kernel.org, AJvYcCWxQH90cS/TMJlHK2ZpyoFKGGpTn8a7Xk7rB/DQNNP58sEgiSIPG8S2N8lWpT048I3tcV+6nGc6Og6yrOWxI+o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyzp5jGKf9KiaYVkc51rPi9GlLcFbuzuefVqW+GLx6dFreYwvP
	i2UAJ+M7xSgDNfloUQUeIp8nqoff0IcSyMIhpLWzvlG7k+bmY4/p
X-Google-Smtp-Source: AGHT+IFZFDdv83kDhIIVLNfNpDvYr5lcyMvZPsFbMtN5Jo1HlWhITkFyccJswUnCikzDBX93+nPcsg==
X-Received: by 2002:a17:902:d4cf:b0:20c:b517:d715 with SMTP id d9443c01a7336-20fa9e5e89bmr17667155ad.25.1729658699245;
        Tue, 22 Oct 2024 21:44:59 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:44:58 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v6 RESEND 03/20] dt-bindings: pinctrl: apple,pinctrl: Add A7-A11 compatibles
Date: Wed, 23 Oct 2024 12:40:38 +0800
Message-ID: <20241023044423.18294-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023044423.18294-1-towinchenmi@gmail.com>
References: <20241023044423.18294-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The block found on Apple's A7-A11 SoCs are compatible with the
existing driver so add their per-SoC compatibles.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
index 9c07935919ea..63737d858944 100644
--- a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
@@ -18,6 +18,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pinctrl
+          - apple,t7000-pinctrl
+          - apple,s8000-pinctrl
+          - apple,t8010-pinctrl
+          - apple,t8015-pinctrl
           - apple,t8103-pinctrl
           - apple,t8112-pinctrl
           - apple,t6000-pinctrl
-- 
2.47.0


