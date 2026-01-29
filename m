Return-Path: <linux-gpio+bounces-31273-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKFcJ2s0e2lJCQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31273-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 11:20:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 478CCAE860
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 11:20:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CDEA301DE34
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 10:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D986E33F8B4;
	Thu, 29 Jan 2026 10:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gb4vb6Fn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66A4337BAA
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 10:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769681816; cv=none; b=RtFeV14yBQKDcu5PZOtREO0dpkzL7dvmxLizrsxLs+PLmE5z5K+1CIhBD77UCH/HMfboMuuJecPN5k2MgCl4yPVu5FFIBK9mze3ys2K3KEZgN1iMNfAWGYLy55UvQc1Nt+tSuRM5NNSyZFRHgPPobp8PGxilcsjrUvMaHc2uXcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769681816; c=relaxed/simple;
	bh=5HXaWSiI3vXmlt7Hf8eg5mNctMjnuBFiMLGRDTMd4ZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+ttxLGvlG2dmO0zo/jqehV7yFF+rfgZOiLSuo+fvz/kQp0Ud4hvk+lPEndkpex+Gn71Kh0ytXSWMCsiEwX/Jp/tZT4iZlPwZ9e/sxn3Ob6cB5/5rAFdPM5keWWFe9uAxMta7/ZHq0ZBE+SJmV9+oL86bEqnjYjTzfj39mSn3l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gb4vb6Fn; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so7997775e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 02:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769681812; x=1770286612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHcoX9dbLBVOvdJKUTZ5uf7S6EXVjOaeeDaRiom2PWQ=;
        b=gb4vb6FnoVGBDcVVQowirz1CAzZuZ0Bi1n/PHQMcbYdDFkPGavm7MX7k/GG/lRnzSU
         xLZZZNFJrlKUoqiztoloet/s8kSQLC5dE9Kev0SXq+bU18n83dSOFQwm5Fqk8exTguH2
         wxEI+GCgA3rjTo0Cvm2I08Y98bgDKS0AJ/AWGhFi+0QoL6FqL0vL+E1wgyR8zkESvzpV
         6OAWrbvKxrlLBFB8qg20qOMW2B/FLCVVGjeWhLTq2jre4toGF6yVQ7NIzOVGQsxRsJsl
         QidAe7yJ5dBkvU3Isb/Xtu+/YiFxE7iCAwFhszYh63Lxs0wISHJDI2/JIShdOmjcAVyo
         gAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769681812; x=1770286612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AHcoX9dbLBVOvdJKUTZ5uf7S6EXVjOaeeDaRiom2PWQ=;
        b=QFR4CljAdfp0XIkE95WM8L2+sWfVmf5nLX6BCN+kRRRIxKuOLE0s85sh0J9lErfwDo
         UbqPDBzb6XAxT8CBS/uwWTMnCAhRUMzJpfXiU8pDvkZhhXlVE0pKrNRyIAPpTkQ/dWbE
         7rKAl1vaRyE+Rf73BX8DCdE4LFvUWYnbJNSW3bgMptptPtv3fAQJLKc1bALsxSuTV16t
         isZy4DJFFJLi19xH+9RKbvyxUSw5x5xKHTSiEf4C9fx/EjHdst10wg71BIKLM54qBI1j
         ZPqTKp4M5AGW+bTC/+5IYltgycrshDPxQDLH0lZlEqNAaJudAf1KSZletl4YzZo3y5qj
         8Y9A==
X-Forwarded-Encrypted: i=1; AJvYcCWdSFjAJ+7jc6Q/uE6auYQfN7E1RUG/p3p1hLZH9hNKxSQ5Dc3xWkI0zEEZSdIxpmhsUMMVH8itHnhS@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpnl1jH9UGDnJNrEwU3JC+lSM/AVPuyRLT6FMOsE5ljFEy3kFu
	dXDqmFx7WVKmckKCPFnbmH9uc/Kjr6zpopcna2peAzOAY8Z+L6jE/3FB
X-Gm-Gg: AZuq6aJECkqXoQpOeHZWd335qhEhLQjoCaNFBq5wQUjZRuh2h7YZuKKPYixgMqbR3eI
	LC+KowWpojduaRbZ5rTz0rXMV2eYu3nhrPGOKo7ZL0J3DNsSARumE99Jnpas0jMVwpFfL4AS8gP
	Vz5Ar0eSmI4TNCnuCpnsoCf//SdBS07IsXFRJd/+UaiHtL6b0Yb1/cVu1Sa3f5b+e3+wOKketG5
	1jYEdvPEqBGdBCN4BsSIJoANJ6ARPnK3jnN2CtHik02ajCSYMRSfmrniUZ/oCmVH3cXEebMYbA/
	aHBGXff1937bmnJzD3wM6699jU/yvjyRmmihR3HBycnqn0jjKrenLfBzI7E/R1tdbRQE16qw/K8
	a9YK5mNhFLp/52lt1MAhpPQQSb52Lnwj+x9H5qr58xTxuTnk4FvFN9okuWZCyYZX/meFZyeoEOO
	EFpE6hjQKuGm3gsqRk
X-Received: by 2002:a05:600c:8211:b0:480:4c45:aff5 with SMTP id 5b1f17b1804b1-48069c755e6mr91235405e9.34.1769681811780;
        Thu, 29 Jan 2026 02:16:51 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm178642065e9.2.2026.01.29.02.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:16:51 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: biju.das.au@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH RESEND 2/9] dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
Date: Thu, 29 Jan 2026 10:16:37 +0000
Message-ID: <a040f07000220605875775161b51f34bebed8a67.1769681553.git.biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
References: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31273-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,glider.be,kernel.org,gmail.com,baylibre.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 478CCAE860
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


