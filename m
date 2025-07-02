Return-Path: <linux-gpio+bounces-22624-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E11AF58F0
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 15:29:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6FDC3B64AB
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 13:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E9028981A;
	Wed,  2 Jul 2025 13:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRx/G0/s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9962289346;
	Wed,  2 Jul 2025 13:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462487; cv=none; b=kVAum1Z8PM/bGzVVDD555XNxNKAyn4NjrPxu7YavbWq3SD2Kseizd9mYCPHMpPADSGqIxv7pG5f3TjCH/V6k0nAmEZm9qQqZv+zMgh284nBNqPUXV6Rv+BZDiwICv4HKiRepSxgwbXlIra2VUz0aueKzY56SAdds112p3ciVc34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462487; c=relaxed/simple;
	bh=h3Zw3p+jhK/y/UgGvWRiSJ+KmdCa3CBYV5h0Z36Ikjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QZmwHHTYVTMcQmj9L2psEparskJUIYtG9wriACpVKKaixD8LYwMRao0kivmes0CIpNkfiJe9D87rQWkXNrE0BAAk87S7T9JpgDJ2v+H5prpGLxaEOPfYdCYPwm6WqCPWfeGIlb19hsxhVxq6Tg6JF+temJHlUEHtQjLHkJL48u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YRx/G0/s; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae35f36da9dso893332966b.0;
        Wed, 02 Jul 2025 06:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462484; x=1752067284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Utu49gZ9ZdunlufpSNh+aHZgAg6knuxu1sYPi3U69A=;
        b=YRx/G0/sDhN7S7WWuWsxtZCdOpsKAJSFYlw/O2YuzkQidMzEbGyeq4BJlxkLzAkB/g
         r+mwinXLd5tyK2AApZFE4kZl7gq4ZamcyrRhgR1JuM1v3MrpAdZlDjVZzd9oLXXoN2rH
         71J59QFeBgnpHSXTPaoZggNY31Brv9lyLdwpG71nPAvRqcQADbQ4GFGSSiwcnmHny61f
         6HTYHoo84qoafwyT42gGHa5w7d/6jsPYqvVhR5afgl/W9BA5Jr+bsivhdmfSB1KM5Zm3
         dJ/K3RHc+9OUmx8o0y99624w+LVYSN5lp76xJOgzTqCuEFhCRgLbR9EL8kzQ+OstOCgG
         4+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462484; x=1752067284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Utu49gZ9ZdunlufpSNh+aHZgAg6knuxu1sYPi3U69A=;
        b=b/qgRZHujdlsX2ztapKVgX/3jRkdhphfgMGRx+6JLdx6fzJu7u01CjzFUOhOcDWYSC
         fh955pX07vIBL13oJivnE0jjdfAe8aff7zyTCdJYEoHTVM9a9Wz4X8tcxuk++Um2N1mk
         HylSbMwSpY6cXDAzI5d3dX558Mu9DKfJz3gV7QjW4F5CDAfi+DvG/43iPDLU5Uls1Rff
         ZJbtaSOM9bbdEjCuw9e0Y7RxN0ukcbSl//0CcVICSlRvpw6Js3kOqz7D8MjkW7XrOjaK
         3Ab28LP3mg+cgXFYEegAjqTUwz9Jw8j0Ove+660z2tzHGx2RuKbRzv2gJbTY2lG0mjEi
         wJLQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2DtRRVXEgZcYEZusePKDSJWNVNyKz/sp7Ij9H53/MzAGVKtsBbfcZMk45trmTP06rOHijyw7Iq+VS@vger.kernel.org, AJvYcCWOyYhd2/I4BdHvO6QSDK3oUBw+ILRCYHRIXIgf0XfoaMsujYQwufz9dr6illW8yuSbuTIWRiXZbwxhCvBO@vger.kernel.org, AJvYcCXfu85qH1oCXbV9KWnjn4GlQTY4UuCBEH3yJWD52+5K+GOZB1B8yFiTUezD6VrRbQzN4hYCbikKudY8eA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzobkROg/59zl4L/9OYLZ0X+cSEhZqlk08Awq2PIkaqPHl/YRMx
	VHtd00dXFIWpFb4cQ99dUM+1fAUlSWZC92srWpZmjoWoht11Sdye6s6q
X-Gm-Gg: ASbGncv0CQMnrXpBJiV7VajGFyGovCjABi4Seqxe4vxbbMji4INck7JDvVmYMRYnaY0
	o9IU0M0QACUg7MLy5+zy3tW1FF/6rMq2fOk7ZJhsUTPqlQLI4NQqwEXh6H+vglmvKTn75/TRVx0
	ZkPZVEOC9mprs6Bu16fhj3x+lgwNmcA0Lafv6GtcA34Gx9jBC/Ku3JCf2LLrW6DdwjK5E7H6sm8
	hUXvQSd1v/akHz8/iEciHrob2f/UY+oDqDiV6lJOp/tCnyzYEgZ/mZVvgVvmCFZrJcD6sgvvU8x
	GrYJ8oFvJu17dnIdaDrfBYcA9+lzEXDJMJBtBz1pHPDJZq2L4/yr0jFhDH2Z0aB4XKExR3Qbb04
	=
X-Google-Smtp-Source: AGHT+IEqn7Qm1Pzei4IQRz8Ezf9TTzuTp38w4YNOcsq9Mh7+jeMr6GzuX1TetleMO9Y8z6HK2C40Sw==
X-Received: by 2002:a17:907:948c:b0:ae0:be38:64bf with SMTP id a640c23a62f3a-ae3c2e668d3mr292897166b.58.1751462483818;
        Wed, 02 Jul 2025 06:21:23 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:23 -0700 (PDT)
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
Subject: [PATCH v5 06/24] dt-bindings: media: i2c: max96717: add support for MAX96793
Date: Wed,  2 Jul 2025 16:20:32 +0300
Message-ID: <20250702132104.1537926-7-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
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
index 78ecbab8205a..02a44db98285 100644
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
2.50.0


