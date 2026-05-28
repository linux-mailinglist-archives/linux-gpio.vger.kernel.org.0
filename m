Return-Path: <linux-gpio+bounces-37620-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMB2JyX5F2qTXwgAu9opvQ
	(envelope-from <linux-gpio+bounces-37620-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 10:13:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8CF5EE5BC
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 10:13:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54BDC32A7465
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 08:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EABDC36C0D2;
	Thu, 28 May 2026 08:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ip7gm32Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C530136A37C;
	Thu, 28 May 2026 08:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779955521; cv=none; b=r/Gq98pDjpfGs4w4Ct9S/gCQkhd36GoExtT1DYBkCtz04kJlaM4xUsra3tAXfihb6EzEFzHy9GvBd5W6AOF6CxkaJi0Ht/Vf0Hm3ukN0BxKig8QDhsr4EUcQi6XJ286WbHLIOZ1vvoWCDHC73xPXYYCKZLDzwY6CTmZccwZ/05c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779955521; c=relaxed/simple;
	bh=cFR3gSTACbeiyg57x8vNPOONmNjhDlVTfZQtxPdEUh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kjc58YPm9SPX/g+RdBlCyqXbtRE80BG+TLJun3FVYKI2VSL4geGuNbHcXzBGvPfFFpx8bhQLqMJ1lWx0ZLZLRI3rQnQKMialOpL3fL/rWw5+XZQDgcLrJu8oje4HDuZ3BdtLjI6i6wgscWbjAB3edi915cxE1vbaMWfcoT6V4/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ip7gm32Z; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAD4D1F000E9;
	Thu, 28 May 2026 08:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779955518;
	bh=YwuM/0kb/7SjJbumekNnRVt6BwOm0F+PoXL/ynyf1MY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ip7gm32ZLfEIACEZjJo9ydg0l3f1uHL+rXDNHKUqnepOnRXGyRuPgj7YsZ7Ie8rhY
	 09MWF8uNFJGCNaCUugikuM5HZpo/F9FGYXLcMUwOUVuly/mkm2AzCpkigiwnwT4HQK
	 CmKsfelRT2I47EHRvHQKRCXwTm5ZAYPJPv3lCcgVHaResfKYcWWGaUTuvfZGyhmkaP
	 hAyqiVSewkNwnT/TtP7eFBrrOxVjlRA/bJ/eryCDlGuCfugd1nioVfErN8uVD+iO7o
	 u9Tqxk/2cNwy+xPFIpJIDROP7FhER+LiHNP3+bMeaCTEoUltMTVvC8QwRaUYjxNvN/
	 lBqseOTLS3iQw==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 7/7] arm64: dts: renesas: rzg3s-smarc-som: Enable I3C
Date: Thu, 28 May 2026 11:04:39 +0300
Message-ID: <20260528080439.615958-8-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528080439.615958-1-claudiu.beznea@kernel.org>
References: <20260528080439.615958-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37620-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com,bp.renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: 4C8CF5EE5BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S SMARC SoM board has a connector for I3C interface.
Enable I3C.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

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


