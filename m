Return-Path: <linux-gpio+bounces-22631-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A701AF591E
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 15:31:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 318FB3B1571
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 13:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 854D828DB49;
	Wed,  2 Jul 2025 13:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7iesLyn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A518328CF65;
	Wed,  2 Jul 2025 13:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462503; cv=none; b=H24YssgjhuoFw6ErwtgLC5VY41gqluUCbwPF8mH49U8BqNfxOleUax9K/QUQtxNQQcwZX48w1shxTvk7jDzXpKuFJ37/EWNMQDE+8kAkyAlUQEx/0im71N/Ur+uLCjczm3ZsWpUQExK7Og4nUIfNKJdQu4FS6BRFkHuViDBIl+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462503; c=relaxed/simple;
	bh=ghXZMToAsypTjoUt2g2lpxT7MAA49Nbf+kAqmkife/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R+At62/6JB0Bu/ai0ln/YzMCAsPFYt5wCwhukvz2dyQvSS1RXZUU/YK1UPkGU3NSRF2kExIUjwd6pd+Ao/qqmzz86McCD5JMNs7Uklz4MAr1rm8oEZDNPXvwRfC4vpExZI8LJbzaDVX7UfO5FE3xXvd2VgeW8+fKtUz5gB7DY+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7iesLyn; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so772467266b.0;
        Wed, 02 Jul 2025 06:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462500; x=1752067300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H03QxZ8jCGcSyzf0c9ETEKnlCFRjYaAWDRsc1hq5beQ=;
        b=Y7iesLynst+cKxSYi3j29XwIi/1SO+Lz9Wn9rRh26pcikNKHIl+DJWd9s9cyPUtvea
         vwNx/08UBIopdpBf7/EUp0OXCePK6zNoYGb0PF7LLjYqxzlRlc6HDS7+MtZZSVR4o4mn
         NIunZ3uD1+rfmc5CYw5ZOU2I8aOUeo7ol9EO4gv0eajygWuY3NcofJ0peg/94+Q+DDBm
         I3f/ji8QjiqCeI2NtVm1HMEOdLajb2Am/M7j69E+SrrtIZSIxDZGbtPRQM/sE/y06NJ6
         c+K4ScLEQJtdICeCr44AWp5et4fC066ru2Sqw0cgAMxHgYhEU2bFo4PeduTXcNvMxTND
         WPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462500; x=1752067300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H03QxZ8jCGcSyzf0c9ETEKnlCFRjYaAWDRsc1hq5beQ=;
        b=uEVPadsZTwYrS8H2k+NchEzGT5LdSwJ7QHovH6jZi4o3We0HLVWweTtc5fsnUPhI9C
         WYWSgHK++O+3roHyuApRCLVW05aOEM146Vf7gVFwurIFNUzA1YeIlTVhiSTFDku9Mhpd
         Sld2c3BB42pm3U9OaaMHQcrrmEBClK+1z5vuKOAW0bIWw9mFt7S1e6Ao6TD5xfkJVPIP
         Mq07rLP7S64hdwOlQCdAPDF1wtnAomhAN3j4fobciHiDGyMX7McMmrvGz+T2DQeK420/
         uVD4gn3FCbNMR7MLfL7icp1RIonZ8ZijgJp69ysLmgAzjiawVqdqj0wpkONhzJDUA+/v
         2B/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUhvE7aRu0bSihkK3SyrSU2hdPgaqc914OvNvQtLO/L10sJnb66pQb/dLFKM7lQvEHOPmTEPxqUV67Pww==@vger.kernel.org, AJvYcCVNYYAUMAFwbV0+NxnNCrbZyzzGP9UXG1rSo1kfsra/QD/r32LRzY/72ziZQyV74xcwNfJcNFFvqY2b@vger.kernel.org, AJvYcCXGSZOZym7tGfRxpNkRhf+6N4TIkv/5aFIkVtuSIZV/qUTlowOptXSSYn8dxxusyx9fGOizOmPmc7Wk1B/f@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8wWWtR3suHrYwPwm9G1XNtq455CIQjRWe1stxhpH2qJIFrf7X
	gU4xj8DCe2McRkv5nmxUO8J5Ncf6UfThMm9S1cqrEatfmznIAyNLDmJh
X-Gm-Gg: ASbGncs9UxxZj3uZINMV3ssrRTVMMaU6ec7Zn2rFDrpK1PJ0wDGEFezc4b8Gtmn8nOC
	0RMJvU367lLoRr+n1QbZr7EWpi9x3o2S06oUBCrdcC4KX6UvQ17Y5YRb6/6vJUHMFb1EH45nkGP
	U44pj7G3H5zO4ECArM0jQryVxxAcaVgLkMhdNCx1zxXHoVi5XhUvBn1ijWxgmFvhW477pl32BfA
	4lo9P8rFLInmq5+HDHgTDO0f2l7jJtFQbBcLvrWMrllmsEGNVw1SknKHtFANxfI1u1Vj8Iy2SGd
	Lc/id8P8lp5b3+j++InWqk8xs6jskunoXfOvIeetVNANPLdPMLAk9hPMuWQpC3x/LCVaCrAnOGk
	=
X-Google-Smtp-Source: AGHT+IFSFezEWpfgEBsp/mJRLUM12wzHFLkzaMEJRfqJQGh3GVulCFiNoRfRWUaVV2bT/4DwuhdRIA==
X-Received: by 2002:a17:907:94cc:b0:ae0:ba0f:85af with SMTP id a640c23a62f3a-ae3c2dfc3fcmr314072766b.51.1751462499748;
        Wed, 02 Jul 2025 06:21:39 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:39 -0700 (PDT)
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
Subject: [PATCH v5 13/24] dt-bindings: media: i2c: max96714: add support for MAX96714R
Date: Wed,  2 Jul 2025 16:20:39 +0300
Message-ID: <20250702132104.1537926-14-demonsingur@gmail.com>
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
2.50.0


