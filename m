Return-Path: <linux-gpio+bounces-37906-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DuerJwBQIGpT0wAAu9opvQ
	(envelope-from <linux-gpio+bounces-37906-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 18:02:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2AF639845
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 18:02:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="FARz/q6Z";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37906-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37906-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42AD0342DB4D
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 15:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 629193D75CF;
	Wed,  3 Jun 2026 15:17:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8AA3D6CAE;
	Wed,  3 Jun 2026 15:17:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499842; cv=none; b=cU4JKaNUKLZ8n/PQ0oH4t01OD0EARZm4jlg2W1WBjui0g4qj2tfI+1X5lEegpqfmy6A+QRuLI0OGR4iHucnBKBEsHq1CzgA3B5BiDkqJOlCTs2pjRPnO9gQguqDJkHPRI+Xrcx932futVoa0Te0aFY820eDHWIye9LnwTIe5w3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499842; c=relaxed/simple;
	bh=5dQdT8sFOwJOLDSBxKJKCSW0yGjLmAHWOVYrFPkQKaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m5jx1zGuCfte10ZpIXLlzP5E+1CLXzEgoewq+ZPYg49jU/Zo/vu7y/XBHnMHRkerto87O1vb76jR3o2MjXaI/GMofGzct2liag8CK+I23q6WJaxBI3cUOTU5Z72FNZ/6JRFUUeIaRsHKAE8h1/orqNsE+1CZmOhYkBlmUUPdzkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FARz/q6Z; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67EDC1F0089A;
	Wed,  3 Jun 2026 15:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780499840;
	bh=oFlq/AL3VtP+pSmrs/29Y1Po0Fraz2VgZagy0oAiduE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FARz/q6Z3xhstGpddt3FEA0rKUlNDsU0dhaBY0QtG4qO01rJZ7emsK9tDvbw5xAoe
	 r+kmQzbuAG37qIsEnIn4D/+xeJXiD6EadgRNMhK12ted7X5wI6k0pri+4cS3H9YWiu
	 bg9GJe5YbpaVu554UYBamACJu0cIfMhzE8CEJmDQTuWOlk0ohG/C5mQXXi4TA3LrXO
	 E2sKmGckHnYTraI6NvnG4GBINAP55nA2Y1vqpg8bf9mKv7Qw+MXylJATOwlrbdoAWU
	 jdFxf36YJyNru8lcF159nDiI+swm8SSdQVNu1lycHMn+zHx2wapDvYJ8VcEDP3v/Fz
	 zJzleLPJTOnfQ==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 6/6] arm64: dts: renesas: rzg3s-smarc-som: Enable I3C
Date: Wed,  3 Jun 2026 18:16:42 +0300
Message-ID: <20260603151642.4075678-7-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603151642.4075678-1-claudiu.beznea@kernel.org>
References: <20260603151642.4075678-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37906-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.jz@bp.renesas.com,m:claudiu.beznea@kernel.org,m:claudiu.beznea@tuxon.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:wsa+renesas@sang-engineering.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com,bp.renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,sang-engineering.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF2AF639845

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S SMARC SoM board has a connector for I3C interface.
Enable I3C.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- dropped pinctrl sleep state

 .../boot/dts/renesas/rzg3s-smarc-som.dtsi      | 18 ++++++++++++++++++
 .../boot/dts/renesas/rzg3s-smarc-switches.h    |  4 ++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index b45acfe6288a..af7357fe4655 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -168,6 +168,14 @@ a0 80 30 30 9c
 	};
 };
 
+&i3c {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i3c_pins>;
+	i2c-scl-hz = <400000>;
+	i3c-scl-hz = <12500000>;
+	status = "okay";
+};
+
 &pcie_port0 {
 	clocks = <&versa3 5>;
 	clock-names = "ref";
@@ -302,6 +310,16 @@ mux {
 		};
 	};
 
+	i3c_pins: i3c {
+		pins = "I3C_SDA", "I3C_SCL";
+#if SW_CONFIG4 == SW_ON
+		power-source = <1200>;
+#else
+		power-source = <1800>;
+#endif
+		input-enable;
+	};
+
 	sdhi0_pins: sd0 {
 		data {
 			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3";
diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h b/arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h
index bbf908a5322c..9cccc87da057 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h
@@ -25,9 +25,13 @@
  * @SW_CONFIG3:
  *	SW_OFF - SD2 is connected to SoC
  *	SW_ON  - SCIF1, SSI0, IRQ0, IRQ1 connected to SoC
+ * @SW_CONFIG4:
+ *	SW_OFF - I3C voltage is 1.8V
+ *	SW_ON  - I3C voltage is 1.2V
  */
 #define SW_CONFIG2	SW_OFF
 #define SW_CONFIG3	SW_ON
+#define SW_CONFIG4	SW_OFF
 
 /*
  * SW_OPT_MUX[x] switches' states:
-- 
2.43.0


