Return-Path: <linux-gpio+bounces-31387-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJ4pNaD0gWljNAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31387-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 14:14:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B273D9C43
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 14:14:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5CF6330A2880
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 13:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B6634FF65;
	Tue,  3 Feb 2026 13:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWCjnNe1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F0E34EEE6
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 13:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770124257; cv=none; b=V4/DXphL01EuQSlowtXj0x9eD440LKUtRJk5+LIHk2o+F+T7vY4B6suYWaefjNZcMaf/RgGKYABj4uQ2HxU88qA0xLoWNLn7U5hLoR0cSKHDmloC3eWPDaduMV7zmlq6AGlyVmLvh7pTX4wNSSvvHq8a6fJiBxHgptsuikw5Y+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770124257; c=relaxed/simple;
	bh=65BrGAhya1zzOUOBDYsMX/xfUf+p71L/tnB0E8FnSH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gzptSvj46vOXmks2h1W2USpRldYi0STTiKqt4Kevfi9GMvHpMYzWyuBd4j0QnVzwb/QvOXz+PNCMwTQoEnYexjd2v89uu+BSq/UNf0TcyzxOy6M9kbRlPFuY4GV2EgJ5sbI8xrfKXuB/9OlRWrftUyVetvCiHEeFVQHAhtuR5+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWCjnNe1; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4801bc32725so43279235e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 03 Feb 2026 05:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770124254; x=1770729054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nh3zzMpteI3G2yhc1ta+6rPbrZuGlXkqSjO8pS4A7ts=;
        b=aWCjnNe1XfqtttHhE1G5kue3Pt97CslavASTGezpW0RkoWsHBOmeXkQ8gHjaUNAm3n
         sQzminSgOBPu5i8xe7Qss03Np5hvs+cjbrNRgqtHtP218CzlD4uBsbM2/m/ys3TB5xBm
         dotrmGNZx79LNAA4WCOwk+/cvBUuahR0/SXBf3hcOPkSwbGSmTUngXSTbIZj7sFCdIMu
         JVti5BpjTjoWt7KhTj+kIz1pC+o+CSua3LCgBODVMd4CAtLfmgsvmmItxvL8FF6B5Z5m
         p8LHAKqu5O1eCIUbxtnbHiQn3chl1sLZ9YQV8JIqJGKd3C64MEiG4zLakJfjYobH3mL+
         IWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770124254; x=1770729054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nh3zzMpteI3G2yhc1ta+6rPbrZuGlXkqSjO8pS4A7ts=;
        b=szEjzB+T/Uk5gH1l36zOCNhML7PHVvQT1U0k+i4iO0H5YCfjMg8bOqEBT1O+mEc9Sx
         m+LrjV7ApIVa3ZNKtX5eGJ+yuShi8XBk5lyWVIb9Kp0OnHd6uzdv8mOgsJL0pZNvt5hb
         jLfCd+mKKwuv4en5iuZsMTxj5Nwz+/0MIm1MvElSljLXhSwRw8sONyKood+K0/AdYZ0s
         lA6Ig/D7Z3/+DKV2suLPUUKPa4HB2+ZQ6W6cCV9o5Eoy9L2GoBZHr5+qtAy0xf2YglOK
         inklLcv+VMe7pNiVALlcd8zPQkGOnlTEe9yQX1nw6Du5E1Xm3QhdSAvCDtbz9kyGxUTd
         +eyw==
X-Forwarded-Encrypted: i=1; AJvYcCX1Z1pNsVJqcdWe5Tl7tV+s4lA/nbZpjJYDcIqW2bfPhoonYr0EmHFf7UPXd0OvSaxlnFcekrTMFNLa@vger.kernel.org
X-Gm-Message-State: AOJu0YzW/ZgbmVUVA/OYFliujTMZtlGWowA6nLa66T+AwCjsZc1X84DJ
	Z3YR343lhxNU2aj6ls5kA+iyI7e2QC5oD20+GeOQn91UpXT9iY4QFADn
X-Gm-Gg: AZuq6aJd4eb9ezXPdfB7EFK1NFfP0/Jf850nP6RJGhnqhBHPogalRYHu3HspS+xJiaq
	Xso/QoUt0bOng803niMmtr79UNl6KCV+Gah6iVkYzvb7As9LY20Tqo0GCXQjPAhVmce/wCCXMZU
	228r4UVEGmVPs/MvTIjE/A5ejzuJCVQ/sdbvp+uJMm2eDZ4NPigz5kM5+p803B90yeZYH6sg4nf
	9/HfskM7GaWcvP7joMS9/mxfTO9PP/f416ytXwcSdSAWNFa073e/I02MT2tFlojLt5IbKcOotg8
	x0gm7AaqinHsSA6S7DPeNtV7CPucozI4Pp63mlQt/QUmznGvl0YlO3ZTo81Eu5cZXDxD6WVuxDe
	MrKpL/wTDuAtA9tKacTjAdIF7chXuN6acbcTJVzsjGeFQLXSaQ3MtBQRjP1ShkwAwbJdrb81+g7
	5b6ySjvfJChJDKrxzp4Q==
X-Received: by 2002:a05:600c:3ba3:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-482db49228cmr236858805e9.24.1770124253311;
        Tue, 03 Feb 2026 05:10:53 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:9cd9:f748:166d:55fc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830512ddd0sm63662185e9.9.2026.02.03.05.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 05:10:53 -0800 (PST)
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
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 02/10] dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
Date: Tue,  3 Feb 2026 13:10:25 +0000
Message-ID: <20260203131048.421708-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203131048.421708-1-biju.das.jz@bp.renesas.com>
References: <20260203131048.421708-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31387-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com,microchip.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 8B273D9C43
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add documentation for the pin controller found on the Renesas RZ/G3L
(R9A08G046) SoC. The RZ/G3L PFC is similar to the RZ/G3S SoC but has
more pins.

Also add header file similar to RZ/G3E and RZ/V2H as it has alpha
numeric ports.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v1->v2:
 * Collected tag
---
 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  1 +
 .../pinctrl/renesas,r9a08g046-pinctrl.h       | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index 1a94e396b1b0..c276e3dcf616 100644
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


