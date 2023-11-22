Return-Path: <linux-gpio+bounces-385-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 211BA7F5395
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 23:44:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC9F31F20C74
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 22:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4356F18E09;
	Wed, 22 Nov 2023 22:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADD88D44;
	Wed, 22 Nov 2023 14:44:13 -0800 (PST)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-35af2b4242eso1007745ab.2;
        Wed, 22 Nov 2023 14:44:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700693053; x=1701297853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jv+I5ygeCBBH4i6/1z/VsQ04aiJmZYKY8Xf1D0sEDB8=;
        b=KASjoie1S474SY2KC3TTJDBXpFAdN0ZMergC/rTCR09HMyHA5wAS9URLAl4KfDJ1ln
         HoRNDfqJyA0DLDfn0A6jPCJWOcIPcnHa9x2aXQRBANzDuaCCRrYX3DbUa0siE+YONLj/
         SwZSyF8HT4jE2mOwGeSDAwkV6D7B3xklRRbnr5LOnUBIX+Z9q52Ct+sQ6+ksxluyXBtP
         hy9164x2Uqm0A58V8VjLc6EUXJW1v7dmIBVVROHlAykuQizRRGyqS71OyKPNMxkRXOi9
         uN3/MIzrAolrdIN0LeFLMYuOUxbxvQ8tOKH4XKzV+QoaV5I3exaQJ2Z3amvKHUc0q3Yn
         063g==
X-Gm-Message-State: AOJu0YwJIGtf3+LmqNg/cqsa9TWnw9XmTCDpTgAXFIgfpyyAJKk3Xywz
	2zBhWIRNlVdfM7K3f87gwKeHHaEfkw==
X-Google-Smtp-Source: AGHT+IFZX4h000rselaaWAr+ZwBLVTs0wSmY8oE1uFHQtmznbb/dbTuUk+6opx72ZK9RwAc/mqw6RQ==
X-Received: by 2002:a92:c685:0:b0:358:104:679d with SMTP id o5-20020a92c685000000b003580104679dmr4125263ilg.28.1700693052953;
        Wed, 22 Nov 2023 14:44:12 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id f5-20020a056e0212a500b0035af9ec3e50sm172702ilr.48.2023.11.22.14.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 14:44:12 -0800 (PST)
Received: (nullmailer pid 2809108 invoked by uid 1000);
	Wed, 22 Nov 2023 22:44:10 -0000
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: renesas: drop unneeded quotes
Date: Wed, 22 Nov 2023 15:44:08 -0700
Message-ID: <20231122224409.2808999-1-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop unneeded quotes over simple string values to fix a soon to be
enabled yamllint warning:

  [error] string value is redundantly quoted with any quotes (quoted-strings)

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
index 8271e7b2c162..8b8e4e1a000f 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
@@ -20,7 +20,7 @@ description:
 
 properties:
   compatible:
-    const: "renesas,r7s9210-pinctrl" # RZ/A2M
+    const: renesas,r7s9210-pinctrl # RZ/A2M
 
   reg:
     maxItems: 1
-- 
2.42.0


