Return-Path: <linux-gpio+bounces-21732-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D6CADE7B7
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 256CC1796EC
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 10:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196BC289E10;
	Wed, 18 Jun 2025 09:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwhrW+0g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AFC1E5215;
	Wed, 18 Jun 2025 09:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240782; cv=none; b=suB1ocdVbT6YRDPbWX6SG5S212LWOdMQw/iZjXBrUnGk0OO5LPC0SysDUTceqn+2OBS9DgJmyFaje3JiN3p4LuNkJ1rrzEWqb9xBNKR6wDokYYlnuhTrp1Y6qdSTl2OheVnrIbHgoi+wGxRfUcMII5u1gRwD7PYHy3SC0BDNxBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240782; c=relaxed/simple;
	bh=15wPRCs9dOEXS8QCWnBMvIR+cz+8ycMORdur8CEVy74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VobcSTen0+vm0G+u4dus0mQRilRMt033AETakEOU+8w/yifHf9C3AZVK3O8K/fmWFWtLvXwReKB4GtLkt3uJJnpTJ3zsgmxX42LCeb8V45M0wtcpsZjdVPa7ckPTm1+GNOVoMFh+WG4G0U4XdLzv32iTe+EnXIbE2px/IGocvQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwhrW+0g; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so14153688a12.3;
        Wed, 18 Jun 2025 02:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240779; x=1750845579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3K73ck1qcTjw5eQ/Cd3WvzHWsx2/6iy9qFn2EtdRrY=;
        b=mwhrW+0g0Qq5v7FY/Q0U5HTeq6qTJmH3u6hcMJJVfPMY5jLrpN2JECLp+J/jQK5LvH
         iez0OZ9le2E1ifsch+910Jckbz7zubMl9OAMQQlHl90zc/Mwq1Sh0MYeYA8vjIPAq1R9
         qJKAeAlOu0gMfIexayQqK3z/cOYOZC+5S7AGM/PqPNEFwtxaArYIEN1p4bs8krstOxt1
         jgRLsmTBwxw6E01nEPu2DqgG8hrZxfDRL7fA1/hOnKFTV+FFAm6F4BjMLETEMP4CEthk
         IoyG6agCUWF94bKfSMEOlQCcQjglnxR7Li5ld5osA2ROijCNjvGoo/JHdYkIDu07WQL0
         MttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240779; x=1750845579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3K73ck1qcTjw5eQ/Cd3WvzHWsx2/6iy9qFn2EtdRrY=;
        b=E8JNGawYnC7O90Jn81w4aPJQ1FWkO/gjVct09t9+I+1cVMd0iQxzhCZ54LeTm9WxKt
         6A58u8OQzJYlcbMDIPRTI9FcNTNoiDk1bVEj4RhzoZqt8hFw5NHsz4+rsa0z/J0HSkp/
         VxJrKOY/KTPVjxLcETk+P/f09vGU7QpQ9l7LFx9y98mQP5arcGKfE7BKVC6WmaRvaySx
         lNGG3cxC1SRExHZYq2IDwf6ZQ9FEKz9B+yx+ux1tPE/igT6wFJPOnPt/HKOHsElBAlpe
         ZVdkv9SIL4DElwDJFQuH6GcP9PdN+LvqqdcyBebrc80xW8Ch2SeB2fR97RWsJeB2bVmm
         Sevg==
X-Forwarded-Encrypted: i=1; AJvYcCUoz8hGVRUzoMXFb4nURXB6FlkDhfC5/GPqgAaho8NuQF6+VO4ztN0kofxIM1VTqKJzbtsUQ+0W6J+tHPaE@vger.kernel.org, AJvYcCVUe8LgGWBLhLnmwW9KWeC5+dsfhvCE9qFmsVJmEwxGxGpBxoWKTZ7k+MJwVgt3mGdBp88RWAS4WW6SqQ==@vger.kernel.org, AJvYcCViz53fEa4muyZd1XBQdkT2VDm+7yz7TdVoxK4orSPlsPOwMYr4PxdMvv4fqz258bcq6fAQEWjdEBme@vger.kernel.org
X-Gm-Message-State: AOJu0YwBw7N6Ckb9N1lcSF7rr9cvWvXsuM/eJOUTaf3Yaaf7gRKbO8KS
	pd6Ha+pbQscWkhpxh7OWgkeXUk1mObOEApAsYhjxZf8flRcq1Ulro9+s
X-Gm-Gg: ASbGncvNllTLOJ6hCuXyO1xCOdxgccdAquX3ht6FKUgJYX8/HKv4UgfIGTpzxNfC2wE
	OOZ9x7an2SWIudPhOGX6wyjtHz23VVw9JNH1oOyzNPpGXVqaZ36sZNQqDPNaRYAsykZQFZtebU4
	noQZ68w/j3PzAokwR70lq8NC2TRCxvDfe+dVOebzXGlCyjBPzqzmIRh6iFGAIC/7iVg7EF8k9N9
	gDIW+/SditBDDXrBHl78N7M+HrUSBKhnPRqfhOp8uqxo4aSjs7PE3parjH8plfB8/iUkKrD33fj
	MFfRWo7xNYnpbHRE6gtl37g2fechihUwx9oCDiOjaKaJ9OSDAu5YZibq4gfpz4Gn6it30A7BDI8
	=
X-Google-Smtp-Source: AGHT+IHArPLOCNMBFG1nWDN3wTJ1+S5KnCdJplNWr3EV5d16jBetdbbdgiTcJpvFD7zmIwoGGtOE8Q==
X-Received: by 2002:a05:6402:34d4:b0:606:a26c:6f46 with SMTP id 4fb4d7f45d1cf-608d09475dfmr14830079a12.19.1750240779368;
        Wed, 18 Jun 2025 02:59:39 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:39 -0700 (PDT)
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
Subject: [PATCH v4 06/19] dt-bindings: media: i2c: max96717: add support for MAX96793
Date: Wed, 18 Jun 2025 12:58:42 +0300
Message-ID: <20250618095858.2145209-7-demonsingur@gmail.com>
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

MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
links.

Document this compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index ab46a5f0bd7e..23f611177a87 100644
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
2.49.0


