Return-Path: <linux-gpio+bounces-1083-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA9A808191
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 08:09:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 673CA1F21BFA
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 07:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E38171DA;
	Thu,  7 Dec 2023 07:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="AWSw5Ym3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 733E710F7
	for <linux-gpio@vger.kernel.org>; Wed,  6 Dec 2023 23:08:23 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-54c74b3cd4cso1291245a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 06 Dec 2023 23:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1701932902; x=1702537702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUjigMyhPNILQVeiYoNrETQoN43+wjidRPsdTz48dao=;
        b=AWSw5Ym3VuWuvTyH8QEwBdn5nP1tXgvzsHEla1/bif8o68OyTKIS0ncA3XA7uv86N2
         qbCWqUgSYuR8V9odKpfQhi6orPmlR7CTztxBZ8TrFAvyQVHApmbwdb+VDQ7V4y5xxRWh
         LU7Sc3/A1PlysM8ANQ/7M5rmIBeNDQnWoAnrpjMSHkwgKjYYblPiGNQtDxfoJVXGSBhT
         G3MCjoJnwvCYgxwzKX4xz1thcQvl870kt/+639XvuI6uF0Vy5rrLrVZ55Q/6AjrZiS/5
         PoVEnYNqn3rM2b3+uWZbgu/fmtvTRLiM1pe94Dl2Jv/HiKdPAb8UosNwF8AUoFH74kR0
         9gJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701932902; x=1702537702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUjigMyhPNILQVeiYoNrETQoN43+wjidRPsdTz48dao=;
        b=WhrhsctxF+Rniru8A+lA/U4tcIOdC1To2bWEmwPRwxJdkMhMEmYhVXBDu7LBOE9Gp9
         pFQf5cOWbsvxbMuZzKmKHoAGsFo04RMuCM+r08G2OqPebdq+uG4I0+wKD1KSIXhiyPSN
         dOD80B8VWgYOKETRZ1P4xlXi+i1lzGhEvYTO9j2+0cUNtilJf6Xo1VYIyU3iMO5mcWQ/
         8OdEEJhom/j7/fWXXCtWCCq+Wx2UBvEqoYkI7lzuJ/ebx66tmPARmrV9q8wUNI83KTAA
         lUjJyIG5wk17xP9qwrTdaM+8Kh7fRQB8eAghqr+XCisZXdHCEOaXis24rviMXtPW+tNQ
         hJIQ==
X-Gm-Message-State: AOJu0YwSR1TIl2+FgdW7SOgLptVX34jh9lrw3ke7kD9XgE/e/S0QaaHM
	FJLB1x1nFLOda5XPHYUnb3SeSw==
X-Google-Smtp-Source: AGHT+IFk46iDHgu7ETFLNBvmcvrvOXwvdapV6HeLC5q18UEGLhbhcwKim2TNZ/s0F3jsOomMkpUCuw==
X-Received: by 2002:a05:6402:26d3:b0:54d:8bf1:a24b with SMTP id x19-20020a05640226d300b0054d8bf1a24bmr2862520edd.1.1701932902012;
        Wed, 06 Dec 2023 23:08:22 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.22])
        by smtp.gmail.com with ESMTPSA id b41-20020a509f2c000000b0054cb88a353dsm420818edf.14.2023.12.06.23.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 23:08:21 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linus.walleij@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 08/11] dt-bindings: net: renesas,etheravb: Document RZ/G3S support
Date: Thu,  7 Dec 2023 09:06:57 +0200
Message-Id: <20231207070700.4156557-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Document Ethernet RZ/G3S support. Ethernet IP is similar to the one
available on RZ/G2L devices.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes in v2:
- collected tags


 Documentation/devicetree/bindings/net/renesas,etheravb.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
index d3306b186000..890f7858d0dc 100644
--- a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
@@ -58,6 +58,7 @@ properties:
               - renesas,r9a07g043-gbeth # RZ/G2UL and RZ/Five
               - renesas,r9a07g044-gbeth # RZ/G2{L,LC}
               - renesas,r9a07g054-gbeth # RZ/V2L
+              - renesas,r9a08g045-gbeth # RZ/G3S
           - const: renesas,rzg2l-gbeth  # RZ/{G2L,G2UL,V2L} family
 
   reg: true
-- 
2.39.2


