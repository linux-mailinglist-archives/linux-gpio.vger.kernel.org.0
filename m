Return-Path: <linux-gpio+bounces-21737-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7307ADE7D2
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 697441796EC
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 10:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8BE2DBF4A;
	Wed, 18 Jun 2025 09:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AlVlYz3U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C4129DB8F;
	Wed, 18 Jun 2025 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240791; cv=none; b=W28/k+fb9EHELF0At5DBi3Sg7iJLKqw77nKWKOvVb/fyPUdx3fKgFKYuixdcljxHfKtASRmdCcYUz1N7A8S5fuCefF37xAvDjoMG5rsa4k/T0i2PMFF3AB0i4I2ymHzgcXqUTvn27y0saifIgjSqCuc41XB68SEVXAcnRwNnqHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240791; c=relaxed/simple;
	bh=7azAzYVJQIJvbMOuSKi/0/feviMdwgddFDT5sAMjhd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pRj/3MymUlW0tD2vwl4CjOjgd10IA3jGMZnBdSeZ6RkH52V0GPEePAzOZZ1zd4wLK8UZLQV7Y+hIhl4ZoM4nDls5/dYakl5lhABSBD55dhG6yR00o5UA0NoQuKfUA8EtNJULOzaglt+e0B0Mt9iXN9dCAUm4ApZ72VqItWjg88w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AlVlYz3U; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6097d144923so1284182a12.1;
        Wed, 18 Jun 2025 02:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240788; x=1750845588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nX9uBVNO9qs42Kxb8fqv2jV0nxF10U+H6s6O+nbAUxY=;
        b=AlVlYz3UlXjh4GNPQkFfkmRACakL/IX1AwjDaiQxjsExvNcGB7by6UauYbFJfKu1wJ
         r/7FZ+jbx9VXFViJ1ytxwOob7hfhi0zkKuo8vZ2DiJQHWxaYMRZ4PUC5lTnISVqki71R
         FgUwDwP0BgoK73jtvT2IkqqCRSV83ftRDIjsZDnTVIGioUY+VjbEP8zz7NKKRJxNZ9io
         1rBKPa/GrriYVBUyLzNeRK4NpX1sauGWxKEkENoegEVDfIK09rC+BV4kw7m8NMpbH8s4
         0Y+pgZHOPSxJhbO+6P74236QeY5qNmfPnM94SkTR6Ou/AixKLzPpzgKwLk3CI0wfTWuE
         MP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240788; x=1750845588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nX9uBVNO9qs42Kxb8fqv2jV0nxF10U+H6s6O+nbAUxY=;
        b=VQcjmNY+Sde5eTICojiNNo1x4Rp5p0nVeEuDTmQM/rFLlUW+DhsGgwsuhaRCYjAmtM
         2e+WyqTT+rJlb+m5peX0fKcHsLkbgUGZi7eGXaBA5IAEQBO5uZogiOQN6uzied1l6kwQ
         HppOiKkecTHerO7EteD7L4cglSlBsxInCeYOUs1xW5olFs39IgjvhCONMkFdr/RdTqbY
         30X8FYqfVm5h1vfjL22h3w0rwWy0EvszkclFUGHODT33/lfE31TbcSzEiDrkmvD/1x+E
         WUrD7T81Da08s0bhEp4Xd9xDw265Q1uswLJggQXLvsLrwlkxtdVdUkf1KBKG1ah8QaVn
         9pjg==
X-Forwarded-Encrypted: i=1; AJvYcCWM/5FFPWY/gGSde0m8egP8B0Oltns3Ru4tClUm/hmiZKkP2eZQKrB9uHuGdL2JsNjYApXTXAzBoZRGC6u/@vger.kernel.org, AJvYcCWmvF7R6KoRvN/9Lx6Y6oId8NYT0IhTs0j0IJa8v9M8Rw+F3aKBy31FkXN1NRneLN3y+RHiJnuqQKJepw==@vger.kernel.org, AJvYcCXG3wB3Ff0UfgXoIRLkNO6W6Qb1ycvABxKhhO+VhBFG8PtH4YbY1FZxDWGfrU25eogud2w83igXCA9q@vger.kernel.org
X-Gm-Message-State: AOJu0YyijnqIJIPDzpZKyCmQhedBb4WVgG7TAEwnPrEuPDJGUpL+yI8l
	l6lPJ3Zvx2XiwD+ydHYUpiNgyev5a7uLl2Ggj79R8b4iN3xqMIbJtiDR
X-Gm-Gg: ASbGnct27UCKmhClW/AtHivkXw2qkjY25HmVtzJabzl/f17T1QsD7icygwZ9PYj+zrV
	FMYvbABIvbPwxfqbxw8UndG4nm5Bfm7f/DVM+Jmperiw1YJPybnN1KXFfX/FJS9ynI7ASppan+N
	xoIq034eNA4d8nAG3tEXAT1Ckaic6XvSdoKnQULdgpWjU0sncrYlbTiKNuoWDaEByZfb4v+8EX0
	bKuJA5ALiuVWLTLfFowNXF4LPHOm7h7DpDoDzyKMvXAF2UuffBaVWfuw6vbY/SL17nWmatbjL/d
	2Y9bwgsDY/rXNfOXvRvc26G9xWoCCViHwNVLq6ubUJNjJrnVhpQvCKcoEnR7YYVLFzaWDl8vWmI
	=
X-Google-Smtp-Source: AGHT+IFKNSYCXHMXpMiW1D3ujznnkUIaiaR6vPPjrEqq56F/D3dCZHy5fYRRHjPkLHsCOyGrvhDTXA==
X-Received: by 2002:a50:d68d:0:b0:607:2e08:f3e6 with SMTP id 4fb4d7f45d1cf-609c1b9438fmr1253767a12.17.1750240787842;
        Wed, 18 Jun 2025 02:59:47 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:47 -0700 (PDT)
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
Subject: [PATCH v4 11/19] dt-bindings: media: i2c: max96712: add support for MAX96724F/R
Date: Wed, 18 Jun 2025 12:58:47 +0300
Message-ID: <20250618095858.2145209-12-demonsingur@gmail.com>
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

MAX96724F/MAX96724R are a lower capability variant of the MAX96724 which
only support a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index b345305acc4c..5dcafd46344c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -24,12 +24,17 @@ description: |
   MAX96712 can be paired with first-generation 3.12Gbps or 1.5Gbps GMSL1
   serializers or operate up to 3.12Gbps with GMSL2 serializers in GMSL1 mode.
 
+  MAX96724F and MAX96724R only support a fixed rate of 3Gbps in the forward
+  direction.
+
 properties:
   compatible:
     items:
       - enum:
           - maxim,max96712
           - maxim,max96724
+          - maxim,max96724f
+          - maxim,max96724r
 
   reg:
     description: I2C device address
-- 
2.49.0


