Return-Path: <linux-gpio+bounces-8475-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6228B9426B0
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 08:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8518B1C2426C
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 06:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0042B16D4F7;
	Wed, 31 Jul 2024 06:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SfnDCIEb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hVkcakGZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gKvrVJyR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DK7P163H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B2F16D4EE;
	Wed, 31 Jul 2024 06:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722407216; cv=none; b=GUKUtZwyadvw+2h/1lo5o3KtoH6wUdRPOYvWqOKx+YgYLdim3xzX38KWD6d/YlAwnVd/glF1/eXAXqfHlfKyXLoA49aQ7gJ0YsqZCOP4Z5Z3L/QQGQxiTTfb3rhAt7chdWDI582aPt6HpBtnA1WhZ7J8rD+UJJo/wV6WOPZ8Vxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722407216; c=relaxed/simple;
	bh=Uo/D81Am4mCodBJCTUXEc5berqMta6FrWWN5ffqu2r0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jjzmqzbw481N1umRsrwo5T/g6gi1jK4Xy38D5Sa2HmH4B9d5hV8nKB8nMM4sdngO8ySDmDE4+NHULfyVFqd9OxBTlQC2DQ8xqbqagGO9xiHbCddn/xcZ1begweFYaikClGDr5WldcpBIyJ6DMPuoxfxJ/jVRQOSCZ7SgfV40GHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SfnDCIEb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hVkcakGZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gKvrVJyR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DK7P163H; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E430521F2A;
	Wed, 31 Jul 2024 06:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722407213; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rp0rpNLOYwhwb7ddk2R3at8FcK8edFrUqEE+I+ZiKV8=;
	b=SfnDCIEbFPBsdQ0xrj9Fkn723UPU9Xjr3V6W3RBuQM0CHkZ5BZd6q32jerhjyqO191txds
	dmHWhVec/L/+1ifdAed456LrySyKuOG1ThPVmEyCXTbK4crDOLgXb5I5DlmBEghokVPgxv
	m767bbYKeaZjQbg8s9PqGlBMIQH/hKE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722407213;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rp0rpNLOYwhwb7ddk2R3at8FcK8edFrUqEE+I+ZiKV8=;
	b=hVkcakGZ+oNGTcFKePCH6XeeeerZ+TY2PZt/RP/w0SZel5SDhgUIfhqrCpZYSaFpL9SYJz
	872gzSTM9JZCQaDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722407211; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rp0rpNLOYwhwb7ddk2R3at8FcK8edFrUqEE+I+ZiKV8=;
	b=gKvrVJyRSLLRhw8uqyhSGN+H0aIwCq4n11xdvn4+WqIwEl1vLck9KXbAwDdqP77d7Ckv7Y
	vwS078iLO27gVW/ilWYTCqkM1PIpO76D6F8It0EeGj/xjYvRssM7CaiByLSq0NkKOf8BRt
	XLmZil5H6F6xo51vBKmV6YTKWSih/1Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722407211;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rp0rpNLOYwhwb7ddk2R3at8FcK8edFrUqEE+I+ZiKV8=;
	b=DK7P163HrOY0ycv6t/oycaxSnE+jKrpiamZayclgFcBRNcE4XATZ73tCa9nFSbC3Q8ndPk
	J5EVrNq9fE0fPADQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C4B7413AD8;
	Wed, 31 Jul 2024 06:26:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oGuhLyvZqWYkZgAAD6G6ig
	(envelope-from <iivanov@suse.de>); Wed, 31 Jul 2024 06:26:51 +0000
From: "Ivan T. Ivanov" <iivanov@suse.de>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org
Cc: conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	andrea.porta@suse.com,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Ivan T. Ivanov" <iivanov@suse.de>
Subject: [PATCH 1/7] dt-bindings: pinctrl: Add support for Broadcom STB pin controller
Date: Wed, 31 Jul 2024 09:28:08 +0300
Message-ID: <20240731062814.215833-2-iivanov@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240731062814.215833-1-iivanov@suse.de>
References: <20240731062814.215833-1-iivanov@suse.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-5.10 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[kernel.org,broadcom.com,gmx.net,suse.com,vger.kernel.org,lists.infradead.org,suse.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo,devicetree.org:url];
	TAGGED_RCPT(0.00)[dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmx.net]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -5.10

It looks like they are few revisions of this chip which varies
by number of pins. Perhaps not all of them are available on the
market. Perhaps some of them where early engineering samples,
I don't know. I decided to keep all of them just in case.

Cc: Andrea della Porta <andrea.porta@suse.com>
Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
---
 .../pinctrl/brcm,brcmstb-pinctrl.yaml         | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,brcmstb-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,brcmstb-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,brcmstb-pinctrl.yaml
new file mode 100644
index 000000000000..c5afdb49d784
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,brcmstb-pinctrl.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/brcm,brcmstb-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom STB family pin controller
+
+maintainers:
+  - Ivan T. Ivanov <iivanov@suse.de>
+
+description:
+  Broadcom's STB family memory-mapped pin controller.
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm2712-pinctrl
+      - brcm,bcm2712-aon-pinctrl
+      - brcm,bcm2712c0-pinctrl
+      - brcm,bcm2712c0-aon-pinctrl
+      - brcm,bcm2712d0-pinctrl
+      - brcm,bcm2712d0-aon-pinctrl
+
+  reg:
+    maxItems: 1
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+  - reg
+
+additionalProperties:
+  anyOf:
+    - type: object
+      allOf:
+        - $ref: pincfg-node.yaml#
+        - $ref: pinmux-node.yaml#
+
+      properties:
+        function:
+          enum:
+            [
+              gpio, alt1, alt2, alt3, alt4, alt5, alt6, alt7, alt8,
+              aon_cpu_standbyb, aon_fp_4sec_resetb, aon_gpclk, aon_pwm,
+              arm_jtag, aud_fs_clk0, avs_pmu_bsc, bsc_m0, bsc_m1, bsc_m2,
+              bsc_m3, clk_observe, ctl_hdmi_5v, enet0, enet0_mii, enet0_rgmii,
+              ext_sc_clk, fl0, fl1, gpclk0, gpclk1, gpclk2, hdmi_tx0_auto_i2c,
+              hdmi_tx0_bsc, hdmi_tx1_auto_i2c, hdmi_tx1_bsc, i2s_in, i2s_out,
+              ir_in, mtsif, mtsif_alt, mtsif_alt1, pdm, pkt, pm_led_out, sc0,
+              sd0, sd2, sd_card_a, sd_card_b, sd_card_c, sd_card_d, sd_card_e,
+              sd_card_f, sd_card_g, spdif_out, spi_m, spi_s, sr_edm_sense, te0,
+              te1, tsio, uart0, uart1, uart2, usb_pwr, usb_vbus, uui, vc_i2c0,
+              vc_i2c3, vc_i2c4, vc_i2c5, vc_i2csl, vc_pcm, vc_pwm0, vc_pwm1,
+              vc_spi0, vc_spi3, vc_spi4, vc_spi5, vc_uart0, vc_uart2, vc_uart3,
+              vc_uart4,
+            ]
+
+        pins:
+          items:
+            pattern: "^((aon_)?s?gpio[0-6]?[0-9])|(emmc_(clk|cmd|dat[0-7]|ds))$"
+
+        bias-disable: true
+        bias-pull-down: true
+        bias-pull-up: true
+      additionalProperties: false
+
+    - type: object
+      additionalProperties:
+        $ref: "#/additionalProperties/anyOf/0"
+
-- 
2.43.0


