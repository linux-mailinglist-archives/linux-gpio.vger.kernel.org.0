Return-Path: <linux-gpio+bounces-37348-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGYqHRsxEGoaUwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37348-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 12:34:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 185AA5B230A
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 12:34:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92A793094AF0
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 10:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 975DE3F7A86;
	Fri, 22 May 2026 10:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BaUCIE1k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404FA3F54AA;
	Fri, 22 May 2026 10:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445417; cv=none; b=tCg6pkLU/bxL24yQapci48S4UiRIPVbhIBd3f+lnJ4jSmDkGPP46xWFuUytfip6OoxoBcszmCBHeK8VCYMT4ikimdFw1DwN4PF5/HDI7I0EdQYAAdpztpryr7eAYF7NKJX7eiDwkvLWKEmd9Wa3U4Hk2kj0UNOufa55Zph+TYfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445417; c=relaxed/simple;
	bh=W9lPTgx6mDxArcLHARU/ZZqLqgXOeySBXq57O5dffOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SWGCi6tKDzwYC4IGVBTBB04zlenHDZLugup0pzQYK8hXg8O7G4lVuUfgyY/mhsvk8Iupkh1rjTL//VRDaZU0A5CZ5m28yX4KbSXQH1olu0wZ6USIEoJIDmZngmrcB6KTNDlKx6mc/tP9WwmCBuG5HDMVU1u4dTnwQvzT9/c1u7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BaUCIE1k; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D34031F00A3F;
	Fri, 22 May 2026 10:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445416;
	bh=6QEWAjHSDHCKnr4dwU2wD6RoMsBK3plNIjm7Iq3i+s8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BaUCIE1kfn+KGCxtZcLLpv0Y863cq/kKP75/p17kFXApysgQCbjRPhocHhu/IaBFN
	 3u66CR12I398qeXH123vQMeXsT+Ew+gTqLuQco5rm8IupF5I5mGPQkBfgbXMBRP6x5
	 Hoig1NUC+STlw353HUNCDqKw916OGcdRq32uXaTCCDek+qt3vO5tahJNeXDa+u4eFD
	 QFXTjNs8/Q2WozqWzgREVGFySQ7BeVjnk4I1GloLYcqTa6AqANo7q4cWAtWbHv45fP
	 RFr9AZPd+22TYJP3SWaSsu9Ho4XjnWWWBM0SgyjrMQSxHRVsrnSQ+TXvj5No3yAWde
	 XOhgQYSCP1Yxg==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	wsa+renesas@sang-engineering.com
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 9/9] arm64: dts: renesas: rzg3s-smarc-som: Enable I3C
Date: Fri, 22 May 2026 13:22:51 +0300
Message-ID: <20260522102251.1723392-10-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522102251.1723392-1-claudiu.beznea@kernel.org>
References: <20260522102251.1723392-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37348-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com,sang-engineering.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 185AA5B230A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S SMARC SoM board has a connector for I3C interface.
Enable I3C.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     | 30 +++++++++++++++++++
 .../boot/dts/renesas/rzg3s-smarc-switches.h   |  4 +++
 2 files changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index b45acfe6288a..370b39b6a33d 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -168,6 +168,15 @@ a0 80 30 30 9c
 	};
 };
 
+&i3c {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i3c_pins>;
+	pinctrl-1 = <&i3c_standby_pins>;
+	i2c-scl-hz = <400000>;
+	i3c-scl-hz = <12500000>;
+	status = "okay";
+};
+
 &pcie_port0 {
 	clocks = <&versa3 5>;
 	clock-names = "ref";
@@ -302,6 +311,27 @@ mux {
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
+		renesas,i3c-standby = <0>;
+	};
+
+	i3c_standby_pins: i3c-standby {
+		pins = "I3C_SDA", "I3C_SCL";
+#if SW_CONFIG4 == SW_ON
+		power-source = <1200>;
+#else
+		power-source = <1800>;
+#endif
+		renesas,i3c-standby = <1>;
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


