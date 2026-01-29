Return-Path: <linux-gpio+bounces-31268-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFHyBzkke2nXBgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31268-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 10:11:21 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0962EADF68
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 10:11:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1EAA1300827F
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 09:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8191037F0FA;
	Thu, 29 Jan 2026 09:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUdeDKfx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7474D376BD6
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 09:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769677875; cv=none; b=R5ehC/MRNSpj1iXEbCEye5RrixvUZWGrF3byr6CvpvW2j6fp1x282azg/fpBwsBuBDb1IG+LoRt0i4Yv3wKI5ukw9vMmkjQ7V9r1T0sWj+CHKe+065i6z3E7PjsNdONtjSFa04qbgxQ738p2YWjiHrxEAwjfG2eNqyj4SrZ6Ink=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769677875; c=relaxed/simple;
	bh=5HXaWSiI3vXmlt7Hf8eg5mNctMjnuBFiMLGRDTMd4ZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W+l44fzgEuzlaCOM0Ic37mC5A5GLaQgLEZqk2KdzWyKODohe1ZxZe+0KQBFyo7mCrdjpChmiDDmyip4V9HeEJNm2ZDT66PtNgxp3VbP/JdPi64xIoenZTtBJ7uvkw3ByEL02+Tp8F1CtBEV2ezH531Xk6wnVQerMSPvmsTX7JeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUdeDKfx; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso6902995e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 01:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769677872; x=1770282672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHcoX9dbLBVOvdJKUTZ5uf7S6EXVjOaeeDaRiom2PWQ=;
        b=mUdeDKfxPnZS/WG3VfQH35vgvlGJ5R9ZUg4r64U+WoxGmHUbIk0xk2zejoNjGEm1Jg
         kaelo88r8nxV0Ellfk6CS9JjsCrHDNUUoyCbib+7UGo0EIFHGyY5T49Qyuh7SZM1kIGo
         5GeieF3BnyO+RA5B4RkEZw/sgBQSnSNboGbrRlRWSKNGLplnVHOcmn6KhVxRj5G0818b
         KKMsFbxXvWKzns2EQFTQVz0P1nL/GZ4e5eNZk6MG4fDlFL1wi9rZ97x4EKFziQcDydvq
         14iL20QLH2R/ekg/jim6J5NYOOliclknzp0FjfFe6cwqXYL0VGnnHJhbpuEVMq5zs19B
         jzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769677872; x=1770282672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AHcoX9dbLBVOvdJKUTZ5uf7S6EXVjOaeeDaRiom2PWQ=;
        b=V576LC4AuAXVTjTjD0NEMlVQ6Lx6OlkH0PWEGB9N8jcI/q1IUDGm0eKXkNgPfL55X3
         cDT+Os2t9EFbkCxYy8SNmjMK1ZkmajMjnCCp13dmxZhyq0VUsxUWhM3DI1fL3cGm9OXY
         rZXxknRWowu4zBPf/oxbeTVd3QQgmuexVjAAs0PYfq5CQ9gozHZ9Z/AmEHOXP2VdJeI7
         h3Htn4jE73Q29xwrUpHdwKTqo1senZK1VjQ8lu+hdPtCSmVho2lRT2uAQU83UUIv3O1p
         MjxX0wFm61fwPTR/zTaYuHakKCEXHXvJdW4yqbXc8pk9mqQLd9ixNfcbfEPQKrs8dNDZ
         DB7w==
X-Forwarded-Encrypted: i=1; AJvYcCXcj6NuSzIs6LH+vHc7UZ53iUlJ/+JEyaK4awBbqUErndIP7aAqX2h5/GecR589qRJktpmJi8oS8U+9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7xfO0hjRoOqk4icY+xHhn7U6d0CNzFYbGCtb4CseVMUWobdRS
	iugRL86I66zE3rz/AfJ5mJ6u4n++RDIQW4NHMXBk7MYqRi7Iby5MseNR
X-Gm-Gg: AZuq6aJua/j9fy5i2Ud8mB1m1qiCNgxyHr+1AOiypXHG2kwDo5oYveRw67Gf2Y/JC1R
	dTsVenZZVrd5gqTp5Wc3kORfyFgnaTK9UmFTJEERGxRn3Tg9uJsJIeQ5fDoIUfCfqIL2FRS7ieA
	yvlWS+IZKw1yVj2mWIycGMpK1945T/vbgNpsEPwYKFhhC8WHXRpcZ44YMka+HHLJyuaRjwy1bE+
	Y5pWYqwKQkDajTkPajewszOeFjZq2Hvfw8FO8ngbroF4s3yCu+7hgvVsyn1sUKu0ZSsp34DKR/m
	l2t9mbOSbR/irr5nK2vypBWQzABiLkNOiL58uXphRKbOmJPSS9RIbcuvcGzUDa4u0RbLOd0hSJd
	tIvHNfVAYmEAZl9cQ/SzjJWtK90upU5ujZSal1iaYgNZHWopcybJoNS+kCQ22eMxs0IR3Yy3Gjc
	SRB3Rgh7vS+T0eb020
X-Received: by 2002:a05:600c:8b61:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-48069bfad7fmr105512965e9.7.1769677871750;
        Thu, 29 Jan 2026 01:11:11 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm175338875e9.2.2026.01.29.01.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 01:11:11 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 2/9] dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
Date: Thu, 29 Jan 2026 09:10:53 +0000
Message-ID: <20260129091108.95277-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129091108.95277-1-biju.das.jz@bp.renesas.com>
References: <20260129091108.95277-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31268-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0962EADF68
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add documentation for the pin controller found on the Renesas RZ/G3L
(R9A08G046) SoC. The RZ/G3L PFC is similar to the RZ/G3S SoC but has
more pins.

Also add header file similar to RZ/G3E and RZ/V2H as it has alpha
numeric ports.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  1 +
 .../pinctrl/renesas,r9a08g046-pinctrl.h       | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index fbbba53cde9b..dc7f92c35eae 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -26,6 +26,7 @@ properties:
               - renesas,r9a07g043-pinctrl # RZ/G2UL{Type-1,Type-2} and RZ/Five
               - renesas,r9a07g044-pinctrl # RZ/G2{L,LC}
               - renesas,r9a08g045-pinctrl # RZ/G3S
+              - renesas,r9a08g046-pinctrl # RZ/G3L
               - renesas,r9a09g047-pinctrl # RZ/G3E
               - renesas,r9a09g056-pinctrl # RZ/V2N
               - renesas,r9a09g057-pinctrl # RZ/V2H(P)
diff --git a/include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h b/include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h
new file mode 100644
index 000000000000..660c26477d42
--- /dev/null
+++ b/include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * This header provides constants for Renesas RZ/G3L family pinctrl bindings.
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ *
+ */
+
+#ifndef __DT_BINDINGS_PINCTRL_RENESAS_R9A08G046_PINCTRL_H__
+#define __DT_BINDINGS_PINCTRL_RENESAS_R9A08G046_PINCTRL_H__
+
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+/* RZG3L_Px = Offset address of PFC_P_mn  - 0x22 */
+#define RZG3L_P2	2
+#define RZG3L_P3	3
+#define RZG3L_P4	4
+#define RZG3L_P5	5
+#define RZG3L_P6	6
+#define RZG3L_P7	7
+#define RZG3L_P8	8
+#define RZG3L_PA	10
+#define RZG3L_PB	11
+#define RZG3L_PC	12
+#define RZG3L_PD	13
+#define RZG3L_PE	14
+#define RZG3L_PF	15
+#define RZG3L_PG	16
+#define RZG3L_PH	17
+#define RZG3L_PJ	19
+#define RZG3L_PK	20
+#define RZG3L_PL	21
+#define RZG3L_PM	22
+#define RZG3L_PS	28
+
+#define RZG3L_PORT_PINMUX(b, p, f)	RZG2L_PORT_PINMUX(RZG3L_P##b, p, f)
+#define RZG3L_GPIO(port, pin)		RZG2L_GPIO(RZG3L_P##port, pin)
+
+#endif /* __DT_BINDINGS_PINCTRL_RENESAS_R9A08G046_PINCTRL_H__ */
-- 
2.43.0


