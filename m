Return-Path: <linux-gpio+bounces-37725-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFu0Dmf7GmoZ+QgAu9opvQ
	(envelope-from <linux-gpio+bounces-37725-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 16:59:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8F560DA11
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 16:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F7F1306AD38
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 14:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC1D3101BC;
	Sat, 30 May 2026 14:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LAQZZO7C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D82315D49
	for <linux-gpio@vger.kernel.org>; Sat, 30 May 2026 14:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780153100; cv=none; b=XRZlo7PucVaA3m6g0hgExi+kER54xGYNysBdsD66XQaAmw+GLJzswHRcFDvi3XNeDo45+jVjQOR/T5e1gOjUTdiXCyDbuK3RCwlcjdEsasSFD0SDEZwSB0eNn0X0XUDY9pUj6m/inVS8AfCxaibDidUKUoq5sOmPRRx3MwYD6iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780153100; c=relaxed/simple;
	bh=ttxwrKZsoNm0aTlARy12cwThMUdvtiwIjDzqKmLJS+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Do1OgJfo+8zryaUPLbbKNY+DjisRrA1+5OMeMFl6eooX4VTDEY6c8kChjimnBXVAAmIjzzo4rJ4gRKuG2Z/uDXdhlIP5K6jHe2J5vVopNA//aojxBX/A9Y4RrSwmUQRPYgG0Ep8dUcmxAvW7+Et/4OroImO9I8fHo9c7XnuQ4+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LAQZZO7C; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49048e043e5so68242305e9.1
        for <linux-gpio@vger.kernel.org>; Sat, 30 May 2026 07:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780153097; x=1780757897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ah0Awc7w6DblN/EtzE3iOxHXiYlVpbiL1luCM9s1B+k=;
        b=LAQZZO7Cs4pVvRMp0KBDA/bwRCHluusPvvMcODQ5XF4VI/1jsn7UBQ8tBswys2eb18
         ZFBAw99wOOViEE3Dcj4t3AxvIddBqqdpU5q66Ml+cQoq03NkZi5aHPBoKmObjrXgSgql
         bOMsAbp/db9bBQVP5BZacM2/Cfsl57dSuQ5/6tcoFZ5++Lg51aYGhEoZSiVeyAu8E/MP
         iOZfeS8he2MlDDTuwRjzc07Ad016aG1+9748F9nADEmf/W8vEViHlDG/AmDyVKPSP8Q9
         raTVymylLUMtGb8lf0VlJPPWyy2cWV0MZZ1/Miss23R6LngiCEzhJ4SXyAxluOWXxDs8
         R3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780153097; x=1780757897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ah0Awc7w6DblN/EtzE3iOxHXiYlVpbiL1luCM9s1B+k=;
        b=RICupSyb4PC+1w/ehshbWLZEgDb5E1Cjy6r+K2osRNB2ByOh3xVerhmz5Emf96mzi3
         21pP8d0JgJBjtY2m4S2pSSIrC8NK4cvkNGQgfEygsK/VjIr7zNRWrIIwcUU9PatnCR+Y
         /Ge2i+KJdHpR9rOcEU0Dw7dTPhmliGGQVoi1Gd2sfVExvcHv6DxqJwX4stcp6PP8PNV6
         yvfhqTUIjIAjoi43VJb9COC74yPA3TZM2T9TgsPxcEsK7hHsorHQvxlp5Ht2FrB2RhpC
         doQamXJr04VeUt/ayckDsfWbW4W7oG/BcW/I3eoxd6y3X/C3YsfQ5SyzDjPxuJM85YOM
         5imw==
X-Forwarded-Encrypted: i=1; AFNElJ/I3NnRWItRVbRX7bC7KUSl4DRf0R/S5TcVrGAxOFWAsOwpHLYbikGMx6CQtTnENq8UbdgUUycVY2qx@vger.kernel.org
X-Gm-Message-State: AOJu0YxRdW0hd97y17xjXZ3z43Df2NM2dPWGcwA7iEeKdjwsQ3UIvSL5
	7qZa2qMMz7T1U6SbvS95CYzCOXbloivXeBJZzzvL0Y2rpU/kQdTDy2gT
X-Gm-Gg: Acq92OF/MI7pJDAWSkeTTegS6+YZh0vk6kRoo6MzLFHWXkKYEB+r1nIILyv3NPm6lRG
	IM7q5cSSIxbIvNjocSmUJZRKVxSNzx0E8gtd/EY+G4rVY4xQTw28dWlijNtmloS3RpGqSyl0dF0
	3kq705MjKtfXZ7LVfo0D+INeEjT/MCFyaqcnd6tGwwlmSWv55KqcammhHpZmBr7ZaTl7eZA9JIb
	CuSmVKMjTk6nJP3TGXnmpDQMENIQ4ADyxQE8YzvwdfZRUyf+ftdFTzj2Ry0r3oaR6zHEJ45sy3+
	Ir4cRFh0VczuujaXDUTPyGQveeaaGXlmSKGdVDbjRoIlTamIUAWLcCgrSYVy+0oWfTiaEqzGUOI
	T1yvyAz98J1P3cHf0sN3+9vdM+ko08pVL4HwyB6DIFEYzV1jicyRI+VF5sWZX3u4KRdauo3bOOB
	hLh+Vy6fORO8BvazLAvwUCYsMKmMiScIA=
X-Received: by 2002:a05:600c:c492:b0:490:50eb:b777 with SMTP id 5b1f17b1804b1-490a2901b25mr67467075e9.5.1780153096610;
        Sat, 30 May 2026 07:58:16 -0700 (PDT)
Received: from zenbook ([31.4.224.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354b5bdsm10916493f8f.21.2026.05.30.07.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 07:58:16 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 4/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin controller
Date: Sat, 30 May 2026 16:57:56 +0200
Message-ID: <20260530145800.1029920-5-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530145800.1029920-1-y.oudjana@protonmail.com>
References: <20260530145800.1029920-1-y.oudjana@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37725-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,lists.infradead.org,vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,mediatek.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yassineoudjana@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:mid,protonmail.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,collabora.com:email]
X-Rspamd-Queue-Id: ED8F560DA11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Yassine Oudjana <y.oudjana@protonmail.com>

The MT6765 pin controller has had a driver for a while, but DT
bindings were never documented for it.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 2124804c8863..1f65f0fd41bd 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -18,6 +18,7 @@ description:
 properties:
   compatible:
     enum:
+      - mediatek,mt6765-pinctrl
       - mediatek,mt6779-pinctrl
       - mediatek,mt6795-pinctrl
       - mediatek,mt6797-pinctrl
@@ -61,6 +62,41 @@ required:
 
 allOf:
   - $ref: pinctrl.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt6765-pinctrl
+    then:
+      properties:
+        reg:
+          minItems: 9
+          maxItems: 9
+
+        reg-names:
+          items:
+            - const: iocfg0
+            - const: iocfg1
+            - const: iocfg2
+            - const: iocfg3
+            - const: iocfg4
+            - const: iocfg5
+            - const: iocfg6
+            - const: iocfg7
+            - const: eint
+
+        interrupts:
+          items:
+            - description: EINT interrupt
+
+      patternProperties:
+        '-pins$':
+          patternProperties:
+            '^pins':
+              properties:
+                drive-strength:
+                  enum: [1, 2, 4, 16]
+
   - if:
       properties:
         compatible:
-- 
2.54.0


