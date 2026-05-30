Return-Path: <linux-gpio+bounces-37723-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMViEiT7GmoZ+QgAu9opvQ
	(envelope-from <linux-gpio+bounces-37723-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 16:58:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ED260D9BA
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 16:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A01CA3017CE3
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 14:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E8031326B;
	Sat, 30 May 2026 14:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHK7UGSs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEAC3148D2
	for <linux-gpio@vger.kernel.org>; Sat, 30 May 2026 14:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780153096; cv=none; b=sEM+pp8JgiDBeQ1n55+OEEK6HiHw5hWJTUUl/8W0/fVB/lpmVLyoZKnzEXBXiFy98ySZlielh8FU8BUwI7o1jo8hbnCBxvtEqirL1QydruH+S4SYpzH4y6YpnVhRQgSkMbcdQZy/+vtMoCACJoRCnLWdwf5s+9kImGfCtGeG+DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780153096; c=relaxed/simple;
	bh=Q2dM1RFym1OfrINK+LVMiRXtIN6rihS6sLMgCqCHGOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mUDGVM0j9FUrflTZQZngUi4gQfrgOMo/8HJmdWINz/1gitNriHbgQ34LPez5H9krwbX38wYpy0BgiYzEnpq3VhCGWokHNjFPchHqTW3DLI8KTa5v4cyuw+A1OMyQyDQzcwMKqj9KADW0jpCAcMqLSfnNnen2MVyH5Chf6QBo1sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHK7UGSs; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso91451035e9.0
        for <linux-gpio@vger.kernel.org>; Sat, 30 May 2026 07:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780153092; x=1780757892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1TMEZ0J6gXWQTFmjGHghmrU7hof3+Zk+ggFlB5N5pU=;
        b=mHK7UGSs7sXfgjRCktwK71k/Ahixb0t57RsnlhYjk2flhs7ixaIytqbFez1p9u2LA3
         S5udJpY4h+06gMkO4cvd8urOvPgGVDcFdPws9k58Ni33utFEf8U8SxnW7ara5DSvg7x6
         0IEY/ZGVi1SVHJYS+DIcQE5TIxwFwYxgaT5/YoM635h+uG+0AybDbuY0KSBvDESvCk9c
         zP7khnSqE8zrChlfA1qiZaldvqFFL7ZWMMcwRhbcmocdB86pEovSFXSzZwfC6simzOIM
         dDwES8Wuv7eoICHybVkSan1x3mL5uzBDn0P9lylvDYuz4L383L+hoMO+9MrgYQKD0I8L
         9dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780153092; x=1780757892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E1TMEZ0J6gXWQTFmjGHghmrU7hof3+Zk+ggFlB5N5pU=;
        b=PlMFf0AAh9MTPVjpLKzza8yF34Om8GKObmyz337UZe44Ne6wZR5Q4uLnOGmHeP7dCr
         NlwRqRnelys73/7eS7R3kUyX++N6ixUUo+cGTY5JXMayQjnHqWEKRG0VmHWeO3993VSw
         Ebz3TFlCc0dzhetfPqwM3h5SDTAkgshEBn/Z7U+8qp3aaet3cf90pXIjHACmLcabP7a2
         Hj/hiDitCxxV9P+rBpcyR13Rr+a/qb/IKLVzSGCXwqHGn6I4rmzaBF18/0sR90gE6+j2
         yjfVvMOTsSXHpNdU8gGUz8G8jaqZjAXsy2yLTBuG5rq7eO+tVZnsj+KhwJsGkxEF0owV
         ZNuQ==
X-Forwarded-Encrypted: i=1; AFNElJ9S57c3Z8tydw79CcI/3GOuc09vMJGLsbg/sahrN8AzB0M+ZY3d10QDsab6Le60dlHr0/VrIXnlcAH/@vger.kernel.org
X-Gm-Message-State: AOJu0YyJa/KokSeZUKaG4UZcmujpTGQrOqyxZ7xJbewT1bUwyCaxc2u/
	fH+vWacXllJt5MGOV9YLBR3LOJ5SZ/t5rGKvGWpul4W3L5qxSKrNXCX5
X-Gm-Gg: Acq92OGJXKeKmDaN8U2EJbZHr4Hie7dzwnPkJJ+Sz8rejd2EJNWQyn9KBVsLjKbKpwI
	bkYq9JZysM9NwavDUacgdnVSoGI105x2ijQAC4vwSWq8nJIjAPBaPLpoEzqTGLT4PE8fFXFGfvM
	5hBiEM2ePQLamAchpC/MjYz+bL7l/hoFUzzilhr7JQU8DSl3trNMs+Wz5UbyoGdTM4gFDlU7i/b
	a3o5VsAHSSA8ED+wTqDL43b2UK6tAsuYXOH6iyF/NuSeEX71kBxLesyM1ztHl2UeSEvcwmlXR4O
	MBn8VtPOR8PMKZkejxOb9zVj7RQOK/nc/Xq7bJugwzRDNYbVLp7ENGCrypRi7oLRXcWzTmRXt4F
	otMfoELTcpJQKABgmH5cFOj+Xn45h4oTGbh61Fof/wXyC/Zn/AhWd+BSSwSiVbo0WOp97lqAexY
	5H6aaS5rAQX20jqyRdnqThUZ/6BrtESdg=
X-Received: by 2002:a05:600c:4f53:b0:490:3f7a:108b with SMTP id 5b1f17b1804b1-490a2958dc4mr75086275e9.16.1780153091542;
        Sat, 30 May 2026 07:58:11 -0700 (PDT)
Received: from zenbook ([31.4.224.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354b5bdsm10916493f8f.21.2026.05.30.07.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 07:58:11 -0700 (PDT)
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
Subject: [PATCH v8 2/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve pinctrl subnode and property descriptions
Date: Sat, 30 May 2026 16:57:54 +0200
Message-ID: <20260530145800.1029920-3-y.oudjana@protonmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37723-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:mid,protonmail.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 85ED260D9BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Yassine Oudjana <y.oudjana@protonmail.com>

Change "subnodes" to "subnode" in subnode description for better
grammatical accuracy, capitalize pinmux description, wrap all descriptions
at 80 characters, and remove literal style indicators from descriptions
that don't need their new lines preserved.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 0dcbca5ca8f9..4dc9504e24ad 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -119,11 +119,11 @@ patternProperties:
       '^pins':
         type: object
         description:
-          A pinctrl node should contain at least one subnodes representing the
+          A pinctrl node should contain at least one subnode representing the
           pinctrl groups available on the machine. Each subnode will list the
-          pins it needs, and how they should be configured, with regard to muxer
-          configuration, pullups, drive strength, input enable/disable and input
-          schmitt.
+          pins it needs, and how they should be configured, with regard to
+          muxer configuration, pullups, drive strength, input enable/disable
+          and input schmitt.
         allOf:
           - $ref: pinmux-node.yaml
           - $ref: pincfg-node.yaml
@@ -133,7 +133,8 @@ patternProperties:
             description:
               Integer array, represents gpio pin number and mux setting.
               Supported pin number and mux varies for different SoCs, and are
-              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
+              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h
+              directly.
 
           bias-disable: true
 
@@ -142,7 +143,7 @@ patternProperties:
               - type: boolean
               - enum: [100, 101, 102, 103]
                 description: Pull up PUPD/R0/R1 type define value.
-            description: |
+            description:
               For normal pull up type, it is not necessary to specify R1R0
               values; When pull up type is PUPD/R0/R1, adding R1R0 defines
               will set different resistance values.
@@ -152,7 +153,7 @@ patternProperties:
               - type: boolean
               - enum: [100, 101, 102, 103]
                 description: Pull down PUPD/R0/R1 type define value.
-            description: |
+            description:
               For normal pull down type, it is not necessary to specify R1R0
               values; When pull down type is PUPD/R0/R1, adding R1R0 defines
               will set different resistance values.
-- 
2.54.0


