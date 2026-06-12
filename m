Return-Path: <linux-gpio+bounces-38377-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hgw3KYprLGq4QgQAu9opvQ
	(envelope-from <linux-gpio+bounces-38377-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 22:26:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0044C67C4B0
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 22:26:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=FC6sXHkF;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38377-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38377-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 169F93049FFB
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 20:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E4E39E6C9;
	Fri, 12 Jun 2026 20:26:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B8A3A6B8E
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 20:26:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781295977; cv=none; b=uYajBAetcGI71eWoWLv7uV/o/GEgawcyy893DbWzSlVDigQpZ1ryL8UlIxzLGUz6adsAkaHV7DP9B/fOAZ2cv45rR/s96lj5t4L3xkOmjsA248Cca+WTIClI5xkI/Emt+YXbg+JGm+KZh3Z5U4t9T++AeDudvNXm9sA/nHvGshg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781295977; c=relaxed/simple;
	bh=3RdZslaSA8ENYukoWe2cG239lXtpnapiIyzZsztFDOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n0eYjsMVy3NBApXzXnuE77gZrZuZbc+5I464sQcY2zTlsXicqeg4Xsqf/UrE133WzB5HhZvNJKVcPzotZ4vf63m7jU6P6MG37xtncIWeAlXATCaqoycQMek1k0Ui2L9VPkmlNOPaz/SwoSJWv/xz01fHxv09JlwxFhn+MRDBpgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FC6sXHkF; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b915ded5so13996705e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 13:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781295975; x=1781900775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQbFs2CKnSzJgOy+gjpokoR/HX0Y2GFtRKZFX0F9ALQ=;
        b=FC6sXHkFj0Zs8lq/HpdZuQoNiUSD/6URqmnIof8Po1yBYUEEuLuEoY4MGYOjGZ1QzP
         U2Sjg+U+JOm42+XcBqnCLZIwIFvHyxdyShYl0BzRoiOQJuyxJn4xS6rhz/0sBDohUN8y
         IK+VjUvr813B7bOssMOHlTj1B/oM1/FPc1wg9e8B1nRFoQ2k9M3YkMfhHqkyPnKYNkl5
         6xY9CEQw9FfyMI0zI/ZATj/xVi6ei+9+Bd39+xTJh1B7T31irtpe0BkqjvCUeBToUZR4
         aPKX9WRzwiAmZ48JdS7P0GqMzlSy0uIqI5W2MUeKa5iXxioNRaOx7tRnNaJxFLQQ9KLU
         p8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781295975; x=1781900775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GQbFs2CKnSzJgOy+gjpokoR/HX0Y2GFtRKZFX0F9ALQ=;
        b=INLDN8Rn7SpYyy7FipvxvQNL0MlUFFI3v+oHpcu1mOMUwJaml6t7WdMrt3sQmRr/j4
         ZXpoWd94d5ki9RsS4QwEKeYyO4I7PBpwLv9rW1Ki1lC6O4Dem0tYnrt7ymtT7bR56bDt
         mgnhXc/4vNOtJGjYE+9pd1zSSe3K0d1CC6PolfJuhhgd81k9uwwDSv7J3jbvaCmrPAyl
         bWb53NWCF+z4tSy4pT4ZUDxVG4AK4J2s5YajH3kgkoUQcVD1XIDHwKtY9fW0yRbwjvT8
         hcVif/72363ueBJ7iaHCgvUbW13tvKXFFiiByyUyqTlAq9IVYjUJEmIa92SjWW1dAR4o
         Kv9g==
X-Forwarded-Encrypted: i=1; AFNElJ8pz33j+al1PblrMUyMN5UKL7DC7VV6x5g3/yKkDZv0b6pIR9xl+mrnzZ42GWAI0spPKp+gKHYjb1K0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9vevGax1QH0UoOljtn4atwRXiUdRYzsX/2LsgIyIxOfplMs1d
	65GVrQYfInn5d0tL2oSeriQB8N2kOPztVe+GGpvy961xKrU0fHxU/lRQ
X-Gm-Gg: Acq92OGCbW4jIGzZt5PW0y0YHDO/c5+hw7PR6h1fg/alsVn/RxSJQF/f1udpDSL8Vu/
	EmjphN/ni1qLm3FwIKhUUJubczYcuVQEIJsBDGOO1p2jDaldoplr3HkiJLdqRB+R3sP+pWhLl3P
	20dZsf6KsYRhiUM0T7XtjoMeSxa8gQpPXQ5bHYnhp+hUR4AsupS2MQIndEBLs/i5h8iq4604NiP
	kDne4yGz1MGG8b3Aw69b0dUWUmXju6fFWErNN3bg+1mmLLFotG9PBHMrtElnuK4uIaI68R3z6Q4
	DZixIzSiyxDHsWbXjJkTGF2Fq0/apE4qxefLUZVmIlhpFPyJegmBj1UIZ5BehfpQr8qRr4B3wWS
	veAjcX68zOonSKaE+QaBmREwhb1d46B7It/lzlxe+DEeGvMmuzD4PMzblye8G4Z/4InsltFaQDF
	O3phNtONsHgP+PKc9q
X-Received: by 2002:a7b:c7d2:0:b0:490:c2a2:e91c with SMTP id 5b1f17b1804b1-490ec521e1cmr40772195e9.34.1781295974844;
        Fri, 12 Jun 2026 13:26:14 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm9173261f8f.1.2026.06.12.13.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 13:26:14 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v6 1/7] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Fri, 12 Jun 2026 22:04:06 +0200
Message-ID: <20260612200717.361018-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612200717.361018-1-l.scorcia@gmail.com>
References: <20260612200717.361018-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38377-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,packett.cool,kernel.org,mediatek.com,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mediatek@lists.infradead.org,m:parent.f@gmail.com,m:val@packett.cool,m:l.scorcia@gmail.com,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sen.chu@mediatek.com,m:sean.wang@mediatek.com,m:macpaul.lin@mediatek.com,m:lee@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linusw@kernel.org,m:julien.massot@collabora.com,m:louisalexis.eyraud@collabora.com,m:akkun11.open@gmail.com,m:chen.zhong@mediatek.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:parentf@gmail.com,m:lscorcia@gmail.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:akkun11open@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0044C67C4B0

From: Fabien Parent <parent.f@gmail.com>

Add the initial bindings for the MT6392 PMIC and its RTC device.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../devicetree/bindings/mfd/mediatek,mt6397.yaml          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..e39e81aa9924 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -40,6 +40,10 @@ properties:
           - mediatek,mt6358
           - mediatek,mt6359
           - mediatek,mt6397
+      - items:
+          - enum:
+              - mediatek,mt6392
+          - const: mediatek,mt6323
       - items:
           - enum:
               - mediatek,mt6366
@@ -72,6 +76,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6359-rtc
-- 
2.43.0


