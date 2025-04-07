Return-Path: <linux-gpio+bounces-18385-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9512CA7ED61
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 21:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20D5A421A99
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 19:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF57823E347;
	Mon,  7 Apr 2025 19:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBmJmRbw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4A92288D2;
	Mon,  7 Apr 2025 19:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744053406; cv=none; b=pj0GKe1Y+tDfaiQoRzZOGIF/hBuvV8i7gZ+Dsksu1SOV550vOAT7m/AC78ndFtepDdMkIhEBat75eGg81DtLV90JmwMrznp5X3tSN11MVl/DbVyhTVX2x1xDgPrq2wtnSfWgHRxApYdRrzRPjQMAK7FAuEe+cvLYpho/KvW7N0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744053406; c=relaxed/simple;
	bh=ZdC1rjwN3Kfo/6FaNG2oemVlX5srMZViudiqWc1Z/P0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eUQXcfPemxpwcverdNRtL+cRWBE21ieouiZwtyjLhk8GOZtZ//DY0hpA8kYlDldRZUR1sZxPSKgHHcwXMdhLkM12kO8RINj2F0EF3/IUKG/e0NsgyagB574iKjqfx9Mlxib4xkj71o8wjbPXjn2nTwuk4XICfwydRshoNCyr4Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBmJmRbw; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfe574976so32760435e9.1;
        Mon, 07 Apr 2025 12:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744053403; x=1744658203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBFg+eEj+Hp2w6uh0VP8SichYxaF4xiZut0Cb8Og4Eo=;
        b=MBmJmRbwuALcHYg26R1C8/ATLQvtTbMVhnLONTWukB8047HMinZYSFefZy1XyrSOly
         Z2sTxCmIG45TsbjOrVkNhcu9n81kXrBujDH/ZAuPCGb5U/zLDz3fG9ExhOL49rlFd0yA
         nrlnZm0+o1HNGcOMA1z98DCGLjHgcn/Ea2gHHf19kjLep7a/lagFPPEwcsHFMpo3EaLs
         OJ2tRWoaUgKtz7vqTwK97XHVbISZt9xc9HINeLmKzRyGmk/2wQAgSR7+n3uybmSrA4vQ
         1DPvoZ+DJI/4MxLGku3Oi74k6LKkWqtALNzUK2WCAcfDi2gjpsZnLi0M7LmjK3RSSfm3
         v9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744053403; x=1744658203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBFg+eEj+Hp2w6uh0VP8SichYxaF4xiZut0Cb8Og4Eo=;
        b=dg1U38ZGR4nCcPLce6ph7yNzXBvOnzsIEWK091en6+KcnMN3lAa63yxXUYPstuecs7
         lHb1wElnznJdDjb3oI7f7Y5uf+8EvjQ882cKjE++B5q2Au5jnT2IybIbdlpNJLVXrmdl
         ZoE/6jCrc9gZlQiOkldy5sU48dYoHP0lCV9jWrkzEpmmbLRP8BPK0jkS0do8Os66/a57
         0+NA2pl747UG3MNsFPFHMq1TPHuYwMWIld6J0CWY1+xF/yFwebyvHtVxA0r5SiklkMh5
         56TVsGEGvnBfjm01XHQDG1FZmZmCPSRDWq1PuxFzT++C1oOrrFPAsRYpYgohB4E2c+/R
         AN9g==
X-Forwarded-Encrypted: i=1; AJvYcCUJoGoXiTjgFiUs7JgiXiUGqUoMTzQ2ppAiEMLcL4rzAaRiF9neFm9XNO+VRkGH0AwL1l8RxvqObdjzrsmY@vger.kernel.org, AJvYcCVsZ+o//vqh6zDpMh9AccpRR6g+FZVYKvl2W3/ajj/hs5jbpZYtspEuBD8dnZ+tGUF7p69EKemATN8j@vger.kernel.org, AJvYcCWHjQ8VUKEyXExKduxjyaA5tSjjgPpe65Uvb9RympGPmSu/Mch3Y8NWCWdSX7JNOxDQ29K+Vfyk7de5eQ==@vger.kernel.org, AJvYcCXaM+ebEeJLoC8GUWd0v0EMLWwIL+B4qSjqajhFlkoXASdRG/rkvoVqpXf2axazYk8XvvEgljY1JObjyX6/@vger.kernel.org, AJvYcCXmPJAeYTpQJjTEwZjTpkAd+en16t/ft5GfX9j7dwjUPn9VRVyyYOfJM2Wl6PDhSjd+PbPizDsny5u+@vger.kernel.org
X-Gm-Message-State: AOJu0YyUHtieXYBcpjK2dQ/3UuqHLtQ9QmY2Ohn3hQqL3DrgHh/qNgIZ
	JlYq6hts9dGsZNxGzy683JDi570QvSR+x69lnbZ5ZKXXYL0Ts0+r
X-Gm-Gg: ASbGncutEf6zbn2j6gTNu1E3BrKek6AltX6ZMaEaSllA4jRN4dN8tsq71liFM6KwM6/
	Bizl/MsLMzqy/1DiPqN/eCqONtgIhfT7ualrYEmsgY7JxGMyAnLiJvhYVLzSGR1jOSaXg8ogH6M
	k5K5DklVlATc9Hw/FvTaF6zoqzIamwiKRnoeG0PCOV0yu45JOKRl4Dq30xEGhuubhUqoqVl3JF2
	dK2iSzEVdho+Cgs4oRRyvCzYeH1Lk+2ma+1JmbHgHvcAg+Kr/7rpIEyR0VAp2KUUx7+msvhxoCa
	BlguyWl0pnIIPlgV2mCrNFjTdwCSLETLlB/4T9bt3uY0yKUrlndmGQ2WH9uPi7oX+F5MfDZHPzR
	ENYWQ
X-Google-Smtp-Source: AGHT+IHhfbSQ6ncK2aFZtHkFs+LYxTntR+ciXtxvLW3iiIL4vJb2Rmn9PZpxuM7ylmARXAhieFJdhw==
X-Received: by 2002:a05:600c:1f0c:b0:43c:f81d:34 with SMTP id 5b1f17b1804b1-43ecf85db8bmr123951035e9.9.1744053402816;
        Mon, 07 Apr 2025 12:16:42 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096bb2sm12994453f8f.12.2025.04.07.12.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 12:16:42 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 01/12] dt-bindings: soc: renesas: Document Renesas RZ/V2N SoC variants and EVK
Date: Mon,  7 Apr 2025 20:16:17 +0100
Message-ID: <20250407191628.323613-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the Renesas RZ/V2N (R9A09G056) SoC variants, distinguishing
between configurations with and without specific hardware features such
as GPU, ISP, and cryptographic extensions. Also, document the
"renesas,rzv2n-evk" compatible string for the RZ/V2N EVK board.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- Squashed the RZ/V2N EVK and SoC variant documentation into a single
  commit.
- Updated the commit message.
---
 .../devicetree/bindings/soc/renesas/renesas.yaml  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 6874f425bf1f..92eb99e82465 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -551,6 +551,21 @@ properties:
               - renesas,r9a09g047e58 # Quad Cortex-A55 + Cortex-M33 + Ethos-U55 (21mm BGA)
           - const: renesas,r9a09g047
 
+      - description: RZ/V2N (R9A09G056)
+        items:
+          - enum:
+              - renesas,rzv2n-evk # RZ/V2N EVK
+          - enum:
+              - renesas,r9a09g056n41 # RZ/V2N
+              - renesas,r9a09g056n42 # RZ/V2N with Mali-G31 support
+              - renesas,r9a09g056n43 # RZ/V2N with Mali-C55 support
+              - renesas,r9a09g056n44 # RZ/V2N with Mali-G31 + Mali-C55 support
+              - renesas,r9a09g056n45 # RZ/V2N with cryptographic extension support
+              - renesas,r9a09g056n46 # RZ/V2N with Mali-G31 + cryptographic extension support
+              - renesas,r9a09g056n47 # RZ/V2N with Mali-C55 + cryptographic extension support
+              - renesas,r9a09g056n48 # RZ/V2N with Mali-G31 + Mali-C55 + cryptographic extension support
+          - const: renesas,r9a09g056
+
       - description: RZ/V2H(P) (R9A09G057)
         items:
           - enum:
-- 
2.49.0


