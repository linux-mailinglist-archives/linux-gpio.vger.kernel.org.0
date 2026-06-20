Return-Path: <linux-gpio+bounces-38749-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CfyIHgLyNmqgGwcAu9opvQ
	(envelope-from <linux-gpio+bounces-38749-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 22:03:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D63226A9A17
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 22:03:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=XGf2soMZ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38749-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38749-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64EC93012BFD
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 20:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31FF836DA08;
	Sat, 20 Jun 2026 20:03:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7C12F0C79
	for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2026 20:02:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781985780; cv=none; b=taKgrrv34RrVSDYX2pSdSLesGJoLrVxqtqqOZ0XelsPNOvl/MZnQNa4//Xt2lwQuAsgzrs+qdEc/OASjrYldB+UTmapZ6lSV2GpdvRPpzf9NYHq26wTekHMKEPUbtGNQW3C7x5R7CjLkG/y4Fu53R/8vGDVs+ILVwtUla75NvXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781985780; c=relaxed/simple;
	bh=DyUYpkJ4idO1NDseET/QMPcS41WzmgGFOPp4+aPtdUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hLHMw548SOTOoC847xIkVCW5AS/cGDU8xTCNH+tDM19O7+VzzxiDDZW50+oTmltlWFXYMwXbuQg+LbtWErKjg+sXpM4gX4V9BARG+9kJAjD5KdF2EenCguEy8sBLy8Acvfpe3SYHAFqxXxMyWkUJXB7rS46f9MHoIXes4uEZg00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGf2soMZ; arc=none smtp.client-ip=209.85.221.45
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-463b2f6fc9dso3266219f8f.2
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2026 13:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781985777; x=1782590577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dt8oMFSBDgldcmRls8UUYxStsjEcsWhbys7AxWlQg3Q=;
        b=XGf2soMZSyL/4Tp2XKBk7XCtFORwkOHQTskswUdP/1R8YEi4G4X7qJklqKuoQIGG5p
         IoExxqvQrDfOWDcUwiqSHy9Pnnx0GKOPtScs02LQqYfV/vIc3TQOVsb0uGxo6am+kGHv
         fpI5UEKuhL2cXtaxHUZ0BszCtZABYcg/elTOv0frDKXptFKkV5TF5/5Q/QyuvgCj+PnC
         iQC4Og6hNOgazXi0G8K3DXWIZY5cfIqzH/jQIwlRM/dG6vGF6GqpWCxpFCF47mxIMgGy
         JvMRIxDihX97+NxJBH+4hmGh9sAVZ6t4/Qh/tSrHmc6bryHazJEuI33xUSiogXin9wnY
         mneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781985777; x=1782590577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dt8oMFSBDgldcmRls8UUYxStsjEcsWhbys7AxWlQg3Q=;
        b=UJBxsC7zX1fTYwyDATBzm49p8alR4coQVCYuv9rEJuP3HfzxP1IGVX+2+Y1H0ZbfZN
         rq3JI+hgGeTk2i/0XWtwZrtxJkbW0Bg2a6z/raRV3gR5qo+hHHZxUd1kdRWWhgnfeyYy
         W6up7sHczNq2I3k3j4l+GZ73puqeWDRN4RHSj+K4xzVOf7VeZlQNejiSshGhWtwnvVdC
         mTVS0yb+FMjPTz1apaxhWeiTfJ2kUTe/xvLbQeMhVLW5LTnYZD50hgQgS1/TXznvFSKv
         7+29FVMFiuOEPtggJprzqw0OvOwuqq1301zftu/TPNBs5BSE42fodUd6kxa6RBON/I29
         f8hA==
X-Forwarded-Encrypted: i=1; AHgh+RoGieOGjMkI+51jak6vIwT9KfEA7cCcfcFszqsffovL2arUR40f2+jiAd8SI1yHyXpPXb9BvnnyDgzr@vger.kernel.org
X-Gm-Message-State: AOJu0YzFyqBfD1MUi24o1EX8uVWtGBGgu+k/XPmbh+Dms+NdzmcxTSx8
	Vn8XzG//xhHYXw/LdD8hCmjivSVsGTZNJEc4Coim5ld+oIJ7j2hr++CQ
X-Gm-Gg: AfdE7ckfl/bvZ5p9Rx1FX9McG+koAIr6SCpGp0UzKp3hDfjtAjwWeJ7uKt3SwtZoZ5X
	WZZoMymzTmBlUdIjo0VwjFjFWarrgUDTv56D6CPMxlFrqSOU/FNjZkYojGwzDxXNY7hlhNfvVGp
	6I2Y9Y3Btm+nIAkDbdlcPAhH4E45JCSOEpGJLYkhyS81krMVWogjBhp5xySqkBg8Rek5Q0xZdb+
	BIYN6tifbRbGnQuuWPtrZ8HKMjx/6QHvT/ElBMo/JFi1IYtg+fMfyZRWdIB/+Z+ZA3vN8Bs73GP
	or+MyKyH2EvAaGB+1N54cVlS3YLzxVymYsiqmLX+9gBbKW063m1NPCTbdP6lrwvgpAFZsUvzxki
	JQXlJbGQIKxacqxouSbXaPoQg8Is+HUAdPSW2dRxxaThrBJLP30INu/cFdVDapm9R/1ZL3tOSLB
	66+4/r0A==
X-Received: by 2002:adf:ed0c:0:b0:44f:da54:da6c with SMTP id ffacd0b85a97d-46508afad8cmr12607549f8f.26.1781985776753;
        Sat, 20 Jun 2026 13:02:56 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666788226sm10708354f8f.23.2026.06.20.13.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 13:02:55 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
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
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v8 9/9] arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
Date: Sat, 20 Jun 2026 21:56:55 +0200
Message-ID: <20260620200032.334192-10-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260620200032.334192-1-l.scorcia@gmail.com>
References: <20260620200032.334192-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38749-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[packett.cool,gmail.com,kernel.org,mediatek.com,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mediatek@lists.infradead.org,m:val@packett.cool,m:l.scorcia@gmail.com,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sen.chu@mediatek.com,m:sean.wang@mediatek.com,m:macpaul.lin@mediatek.com,m:lee@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:linusw@kernel.org,m:julien.massot@collabora.com,m:louisalexis.eyraud@collabora.com,m:parent.f@gmail.com,m:akkun11.open@gmail.com,m:chen.zhong@mediatek.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:lscorcia@gmail.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:parentf@gmail.com,m:akkun11open@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D63226A9A17

From: Val Packett <val@packett.cool>

Add the dtsi to be included by all boards using the MT6392 PMIC,
providing support for regulator, keys, pinctrl and RTC.

Import the new file in the shared device tree for the Pumpkin boards.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      | 148 ++++++++++++++++++
 .../boot/dts/mediatek/pumpkin-common.dtsi     |   2 +
 2 files changed, 150 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
new file mode 100644
index 000000000000..19321ae010bb
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Copyright (c) 2024 Val Packett <val@packett.cool>
+ * Copyright (c) 2026 Luca Leonardo Scorcia <l.scorcia@gmail.com>
+ */
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/regulator/mediatek,mt6392-regulator.h>
+
+&pwrap {
+	pmic: pmic {
+		compatible = "mediatek,mt6392", "mediatek,mt6323";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		mt6392keys: keys {
+			compatible = "mediatek,mt6392-keys";
+
+			key-power {
+				linux,keycodes = <KEY_POWER>;
+				wakeup-source;
+			};
+
+			key-home {
+				linux,keycodes = <KEY_HOME>;
+				wakeup-source;
+			};
+		};
+
+		mt6392pio: pinctrl {
+			compatible = "mediatek,mt6392-pinctrl";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		mt6392regulators: regulators {
+			compatible = "mediatek,mt6392-regulator";
+
+			/* Fixed supply defined in the data sheet */
+			avddldo-supply = <&mt6392_vsys_reg>;
+
+			mt6392_vcore_reg: vcore {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_BUCK_MODE_FORCE_PWM>;
+			};
+			mt6392_vproc_reg: vproc {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_BUCK_MODE_FORCE_PWM>;
+			};
+			mt6392_vsys_reg: vsys {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_BUCK_MODE_FORCE_PWM>;
+			};
+			mt6392_vaud28_reg: vaud28 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vxo22_reg: vxo22 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vaud22_reg: vaud22 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vadc18_reg: vadc18 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcama_reg: vcama { };
+			mt6392_vcn35_reg: vcn35 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vio28_reg: vio28 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vusb_reg: vusb {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vmc_reg: vmc {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vmch_reg: vmch {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vemc3v3_reg: vemc3v3 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcamaf_reg: vcamaf {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vgp1_reg: vgp1 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vgp2_reg: vgp2 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vefuse_reg: vefuse {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vm25_reg: vm25 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vdig18_reg: vdig18 { };
+			mt6392_vm_reg: vm {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vio18_reg: vio18 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcn18_reg: vcn18 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcamd_reg: vcamd {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcamio_reg: vcamio {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vrtc_reg: vrtc {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+		};
+
+		mt6392rtc: rtc {
+			compatible = "mediatek,mt6392-rtc", "mediatek,mt6323-rtc";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index 805fb82138a8..6bc80924cb6c 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -6,6 +6,8 @@
 
 #include <dt-bindings/gpio/gpio.h>
 
+#include "mt6392.dtsi"
+
 / {
 	aliases {
 		serial0 = &uart0;
-- 
2.43.0


