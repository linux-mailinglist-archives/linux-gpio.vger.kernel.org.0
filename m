Return-Path: <linux-gpio+bounces-18010-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC34A71906
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 15:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AA641885B6A
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 14:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1734A1F4E2F;
	Wed, 26 Mar 2025 14:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="krbFBxrW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E121F4275;
	Wed, 26 Mar 2025 14:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743000005; cv=none; b=YxI1MrKs9Qg7y09tkOQfiOBhZJqUZFHplQuqEevfnGc7SPENS/pA5pdIiS/2pFO1Om8TgmDfk3H8z9HwmcfQHCgQkkUD2LyX/qU/ENa9ZBW+g1dfxpLZSIZPelx5I9K5giKem8pSdiXHXFrl5TGpcQOKkEXlKjlDuDjxmGDRizs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743000005; c=relaxed/simple;
	bh=dUEpjLswo6O1sHM/kRMnODxM6mYbltNZtsN1kqKu8Cg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fLUbanqY8boyodCjPqdEFe4aYpBRAjAJTFe4fdtuByayjem878K1ZeFkkYZ934xwMxWmQ/dRgh53J0tjkpmqApvYMCl0/aYFQiJcdFKiGmzgwGMdR4D3iLCU4Igq3ABsyweNVGdPRf9W9Gc4dAeAOS+q8K503w2ipC/2Z2MJGS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=krbFBxrW; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso64498855e9.2;
        Wed, 26 Mar 2025 07:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000002; x=1743604802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAi2z0HFAw6yQz/HIvwLQqMf3Ner8YYOCdSxAbTT0TY=;
        b=krbFBxrWs21TjmFjbdAxsejou4KCqLFXamjs0ODGnU5h2Na5rSvqrITw/UYOrG8eUe
         UaTtPkYrga5hKMxRpd1Od9YBJpv6IO5PK6PuwYUbKqX2wrnYMhnQS0LUOpzC4raQl4fH
         plY9dJ8gowJZ+q72LV1uQCMnq7DMvpOhP0xPmeY31szOGOjUE2BbZsk9yEN9+Abo4ItT
         0bD45UjRohiAWvvaJHi5CZ+ijLdpBjPCPIcWMQZjsRcV6EPrtmz6K+0iepOdZZhKfif9
         Q2Bx6Fb4UZWxdHLMTbGWSLu5UYoxuCL6gDakaq0HPG9RhxWjjYsiqS4MrvOE1090A9nQ
         lbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000002; x=1743604802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sAi2z0HFAw6yQz/HIvwLQqMf3Ner8YYOCdSxAbTT0TY=;
        b=KAnKTyQuqF8KV++DyMOwaYz0SKQsNlxQr1jogHkPvrND32N9GMT41/45s0FcbR3Tsm
         9x2cgg2kxMVjyd/gfqVW4y4RAoJ4PG3v5kSC2aP8ju0n0yOVJ5db8TB7OTjqTkO004MB
         76rNeuCvmEnIRFxMq9K4iFr5pEBl38VkMxjbQrsthdtIdCCDTZvLXzPpv7qW542NWO7h
         bHCPDWMcuDegKVc/JvmHmqEVPSUdladvsAkbt6rmlmQrb9a6/C26sTraRMW/wGLzOaKz
         GfcAIPRvsn3xGwyOCSjJvW3PcvdUdHKFYfywIxvUSG0Y54s62EfiCxTt5hFhInmCTXHc
         xKjg==
X-Forwarded-Encrypted: i=1; AJvYcCUp8e3WQ+psFUiOeSTYRPouIyLkcvVScbbWjGgyIQgqb/CCbi8hhXPZXj3xSKW3dNWRh1xvil+2Fu4H@vger.kernel.org, AJvYcCV09wYZOrB6YOIr+aTNbeeXVUiluswDBOuqo56dk8Lnv+xowHqv6j+7LJyY16RnhZ48QEJcEUE6k7akpCaI@vger.kernel.org, AJvYcCV1AHuHSEx+mB9CJJDOj+VlkwICKVjLB49M2enpUKR/WNanlT1qIOJp9WfyTdbb8Gq6DvFj4USvYqlmqE5A@vger.kernel.org, AJvYcCVnww2gvqgaFNRRkdBApY5aZImJDT5Wo4JJNDWObaBsuM9k8K8CTdhaFcgp6O7ejYgdovV3E+MchsOBGA==@vger.kernel.org, AJvYcCWS4qqrzY7+VF2fZIo5mcm99Y0AIxQiHeodQsijhSCkgDrix3rfej/2ZiuV3CYoetG71kE7EmSs7ngO@vger.kernel.org, AJvYcCX4ZDX0w7jNjS494fnH2/GJntXmr7B2zafJOk80a6DghQFpnZyGBV4ifVZg0AysphWNyYv7jounNCWl@vger.kernel.org
X-Gm-Message-State: AOJu0YwBMcrT81o7Im2UuVDiSV9ZpBchePJjuNUETwUjOAairESqTsC/
	SbflRFMLz3XevsWctFNM3yGlL48doJKdkKZF4bUbsJkHuEUpZvgY
X-Gm-Gg: ASbGncu+aqqTzgtrL+BeV9q6+GkgHK8vnCFZbXntFUe2T6AMgQoYpcBnKZChHgDTm+c
	ADJQz7YeQ4jRYTfqj5Q5fWrvOpFSorS1uolfn5jKUw2d1LVJnpqlLxsQg5Y7QIL/sLCosX/LtZs
	PEHNV+6VE08kqj4HJl5hg286hrvDu43O4Drj8fKi+zOPEbSHMKeK5zWfCiVesHEHuZCOd03V7h3
	qIkqQFy/Au4dMjmzRRrCPNQATKDnK6WJCKBPxpz+A/shfXtQeBTM4OWa3UHuIw0JEDPS/E7hjod
	TKSDIWpigFxEMidCyQa9klbCVfPeF2v8CJkHvPNp44hX3Or3GfcRL5CcfMW6l7mawsLkYMtJrOV
	5UxQ=
X-Google-Smtp-Source: AGHT+IFZ6nLqJWKZ14xhUWYOlK3y85b3j/TwiAL0mkfZ4vDmpuUVradIQ80XoUndBnn5voQ7NeEBmQ==
X-Received: by 2002:a5d:6da9:0:b0:391:3915:cffb with SMTP id ffacd0b85a97d-3997f93643dmr19265750f8f.43.1743000002228;
        Wed, 26 Mar 2025 07:40:02 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:40:01 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 04/15] dt-bindings: soc: renesas: Document SYS for RZ/V2N SoC
Date: Wed, 26 Mar 2025 14:39:34 +0000
Message-ID: <20250326143945.82142-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the RZ/V2N (R9A09G056) variant to the existing RZ/V2H(P) System
Controller (SYS) binding, as both IPs are very similar.

However, they have different SoC IDs, and the RZ/V2N does not have
PCIE1 configuration registers, unlike the RZ/V2H(P) SYS IP. To handle
these differences, introduce a new compatible string
`renesas,r9a09g056-sys`.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml
index e0f7503a9f35..c41dcaea568a 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml
@@ -25,6 +25,7 @@ properties:
     items:
       - enum:
           - renesas,r9a09g047-sys # RZ/G3E
+          - renesas,r9a09g056-sys # RZ/V2N
           - renesas,r9a09g057-sys # RZ/V2H
 
   reg:
-- 
2.49.0


