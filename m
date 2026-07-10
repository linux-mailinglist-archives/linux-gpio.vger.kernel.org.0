Return-Path: <linux-gpio+bounces-39823-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ApSCBLDZUGoP6QIAu9opvQ
	(envelope-from <linux-gpio+bounces-39823-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 13:38:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A1473A53D
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 13:38:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39823-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39823-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E43B3049E2B
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 11:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BFED423A9B;
	Fri, 10 Jul 2026 11:37:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FCF420E62;
	Fri, 10 Jul 2026 11:37:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683429; cv=none; b=jRkhhf95EeHg/tZxu1yyiTlhn3nM5nrBwQJ5xKzGrbMmzlGFfijez5KPd6v4otjEzntjJvhBoMWcgZJ+CsvYyChrgcPCs01oNr21HdUBsP7deQjBz/r30Hhb4/9EgzwC36aV71xQf6FbeCL3KK8IcSCUJpjGon9KESYFChv6pPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683429; c=relaxed/simple;
	bh=QZZvrero1iSCFyrcpqaqfp70RvDsSjgnbhSzsrrj9UU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DmuMORytlIMzhFOYgdG9mywuMlolQOwbSDmncsun1NimRSGT01jz13vX+ooPQAmuJbKwceKXRKoDlPfnWSoJge6D63vT9h1JyP+LkEQDh3RBSJXs2G+rcEj3KvHyovREKyTAhm5ilHXn7DIepzTTXwF3SsOu+BS/ONLxqH2Csj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C431F00A3A;
	Fri, 10 Jul 2026 11:36:57 +0000 (UTC)
From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v4 5/5] arm64: dts: renesas: rzg3s-smarc-som: Enable I3C
Date: Fri, 10 Jul 2026 14:36:37 +0300
Message-ID: <20260710113637.1328000-6-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:claudiu.beznea@tuxon.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:wsa+renesas@sang-engineering.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[claudiu.beznea@tuxon.dev,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-39823-lists,linux-gpio=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,tuxon.dev:mid,tuxon.dev:from_mime,sang-engineering.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9A1473A53D

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S SMARC SoM board has a connector for I3C interface.
Enable I3C.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

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


