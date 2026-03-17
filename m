Return-Path: <linux-gpio+bounces-33666-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Nu4E6ChuWmiLQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33666-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 19:46:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEB42B11EB
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 19:46:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD7F530F345F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 18:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6CB3F7864;
	Tue, 17 Mar 2026 18:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwjY8TFH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F89F33F36B
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 18:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773773141; cv=none; b=XLIbNk7AvRH5fDHp528tOKKai3JtvG8dCO+JWS2bu1KCwQJjeZQtvEeaAJ/t1a863W2Ny3YEVD2Z2M5zwplNgo6aoS7n9u1Gdn9O0mzXpVdMgPkqvZCYflnckhDNf/6K14OR8mVkKgiOgjb5H0yq4EemMhi9kTkPgvI27lIJzi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773773141; c=relaxed/simple;
	bh=ZfqOUDFz7v7R+mSXLBEeMIVnBZ09sWfkQvpiVD+GjhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NK+AbLUdRl1p6NALH4AvwZj2/KE5VMFznp+8Foc6pPRSExIPaU1GOXuuAF4atdAWwmdVAB49ddP0foOxTEsL3Mxlthy9O+V2PqgfbkaIsZrgEGlR+fMMZDO2pbJq7uCUqUhDxUy7R5qF3wL7ulKVti64c+RgSoPNuyfAoBdnV8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwjY8TFH; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so69022165e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 11:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773773138; x=1774377938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTAXSeu6BtwHvgdghXlLX79R1MN9WAcZ3+G+4vaYWf4=;
        b=mwjY8TFHlZGYD59OayPabt2eM2tZ05M/gG4uikPVwIyJqeVqF+DaH1urznwWZldGNx
         uBNXk6pi0lVHbqPWpRC9lUFgRMGIsIzd0HD9XFpKtj6sbaRs5T8AcvqEfhI6TTyrW5Ho
         nrmSW6wXX8tZyNZVeL/HOwjlq6AddXFUCBNduMDHYUxH9zSbZlD1lqRJiZLCotswr5v0
         mwRABOwf8i3wCztsyrddsxy0w3FhXJG4WyviXAJb/7eIb1bKNx74jyApzwq85y/RukZI
         By+aGX0W3Qxmwmt8ndSeG4H6u71sBPcE+VONWc70MbKAZZmdtDOTttoYWYJ3yN6tlP40
         sWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773773138; x=1774377938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pTAXSeu6BtwHvgdghXlLX79R1MN9WAcZ3+G+4vaYWf4=;
        b=Rq/xXQDOt8i8xe6PgOAHWywqCEqcAv5BbvcyFeLPHt8phCP65RCpKu16pg3zMxtRUL
         klPo98sZMsiUO+tnU8O8HfXPI8JyKwEn2FmQZDeWJSBHwVwtEnliXkuYDNFIl4ymdUBh
         bEfl6Gj03EY2mPq/BMn+219bC/rtW0idFuwjdVArexYdW1EC8Qdg9vLX5T22PDZZ2NG1
         EHO7c2HyJafbWXWRrR/+noC/9xPrD8dqTimD2+0Qdi9JWpDwPbmp5PP6J+w+DFixvgWS
         7jXuRnPtBkN8EjavMNUWqxILb4bjOa7jXESda/jseMt3cALJWEK88RIZOXc6Re9+8dma
         20pA==
X-Forwarded-Encrypted: i=1; AJvYcCWIBkaMI6JL93SdUPj1gfVfgmdBHIuSXqxM9WEWw4t2JVHZS1NIIFnTSH3J081i1/v4bp4bbNZTik5N@vger.kernel.org
X-Gm-Message-State: AOJu0YwYLugzTESK/3zimbBS/oxCZE6uc1v/RkvLAmuYJRjYCHXxTLyF
	U17Mtb+bXdB/T4wXjT7Szkf96oo+h2Mja+dNKGmZYjk7s4uRuZ5bhMpK
X-Gm-Gg: ATEYQzyL2pSUOGt5lTyVs5rLW5aom/myBJp8ml45vglE47ZsfzUrdGXcmuA+cV9XhhH
	uJuBHuu6D2qiHVYb9Ve0mRh/roKX5C9S/3aM1aAPJ6eXlYa80duWdGuBOyGFyBHLnY1Sygc9DOT
	HCeQhcfZNtI/0ylhkysBxR72rAyB1/y6rqS7M56udjKmFCqbgpD5fQnVBKjaTgWbeDnm7z2ggJ2
	XDMCRfktX4O43yyWFKIXV/GPQL8+1KV9UmsvJxVQR8YhLBzR5finh+5wakUcWUdMHfCeU5m+96O
	V6M2m//8ywN9tZAiqCVYpslcVNI7Y2J+/8cwxZNLWlJE1yeaUrIph9BNiIDZsp2o9l8NEWxeDS7
	GYhMQPajYjPsT08t052pS0kvLRwts0vf8KLX37Mby9oehvhtzKo8vLiGUd4DNkgWRrhMQDEvEWC
	6v22O5dac0v9XpR98If+E=
X-Received: by 2002:a05:600c:1d0c:b0:485:3d00:efd with SMTP id 5b1f17b1804b1-486f442df4bmr10381735e9.7.1773773138294;
        Tue, 17 Mar 2026 11:45:38 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4ba760esm102725e9.24.2026.03.17.11.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:45:37 -0700 (PDT)
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
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Gary Bisson <bisson.gary@gmail.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 1/9] dt-bindings: mfd: mt6397: Add bindings for MT6392 PMIC
Date: Tue, 17 Mar 2026 18:43:04 +0000
Message-ID: <20260317184507.523060-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317184507.523060-1-l.scorcia@gmail.com>
References: <20260317184507.523060-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33666-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,packett.cool,kernel.org,mediatek.com,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,packett.cool:email]
X-Rspamd-Queue-Id: EBEB42B11EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Fabien Parent <parent.f@gmail.com>

Add the currently supported bindings for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../devicetree/bindings/mfd/mediatek,mt6397.yaml         | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 6a89b479d10f..22b09e148d7c 100644
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
@@ -68,6 +72,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6366-rtc
@@ -92,6 +100,7 @@ properties:
               - mediatek,mt6328-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
-- 
2.43.0


