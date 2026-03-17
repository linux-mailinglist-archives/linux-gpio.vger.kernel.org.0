Return-Path: <linux-gpio+bounces-33674-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LLxSO66huWn9LQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33674-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 19:47:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D261F2B11F4
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 19:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C1851304394A
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 18:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B633F7A86;
	Tue, 17 Mar 2026 18:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qh6V96jH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CDB3F7896
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 18:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773773226; cv=none; b=dPxxiLAoklKXipOdvvv40xPLyjgJfZNc+xN+m6sHgwYn5LphMKFy5cffoZY3m6PfxsaSoY7Y7TBuYLNAUR1k1QJcMgKLx2OWSGq6Ewq6y6XcUq9JZ82p6ByAWvsU+9Y30Gw0QUkeK2u4gNxRvYLkfjqibRzZ0iA5P859STlciYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773773226; c=relaxed/simple;
	bh=Alua8m4zrqQttj25hcBMeiYpw6ue2/UZ/u+SL0Ib6DQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fIjCpCerZYibEXHYk7B4Y2ebmUBsm12men6VNiYdWNTgHQcijdEKy18+UrFQOJ/qFoblo0MTB9Pg2uG5shVPHru4EnTUZ3D+359UT6PBDpS//PH/MGWcfHBzfxpQhN5Rtebz5kt+KNuOYZeTc7+oVnruH5kOAK3GNOm+spLhI6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qh6V96jH; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so71227995e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 11:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773773224; x=1774378024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0En4KcL/SU6NkK1eXcFNBzstXxwR3LITHNqWxLtxrU=;
        b=Qh6V96jH1Dy1sdw1ghdnZ7irsDy6MdIHFAFCAsZRlc3eqN/neGdQzLDM+s6L2CG959
         JxMl7mv/37R9UIspv45AWnovx1ciMgrhT0AKKZma59WLm6WZGFHbbPsWP8W2X6L+W9vp
         3fZpOU8rKVWwjSAUru1mh0ZloVV9SudIeGW+oO9L8/2pOPgm8G3VPeMFyX78C58jzzjU
         3pWfg3HIDSkRo7R6eq9KTtGs7djvg7XnJdEi1KgynzjC6H/bTF7xKiHzZt+KzbvbGYLd
         eDdhQrV67fpwf5Y/DzNUinJaePsGVrprHGJVCZRZFBI9NxoV72wjdv018GcSdyRJdo8z
         bs7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773773224; x=1774378024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u0En4KcL/SU6NkK1eXcFNBzstXxwR3LITHNqWxLtxrU=;
        b=ErhyJ3bg0FcDxz4dj9rPjiBZUOQJiotFrwfdJrWqAhFMIaFGD3Y1u/eTJ0TvhKCFzT
         PoLaIUWes/9+ObQn7CQ8KEGNcsq6wOZd4IC/3xA4Px3AzEEeWoY3y3yRa5yn0P2Pnl1R
         Oi9Q/HlfXD41tqzL+vNijJx7lZK6PaqfBa/fz6XMmuyGe0xRRcvc8DlCg2sAju0nPFzw
         68U2nlq1Hs+Jx9tKO5cRqmEtBUpe+3ksj47DPrXfd5x0UC8O6t3SFxN3hA52P622g4z6
         TrsVxtHEeX+CsA3Ju18Tn8Q7dVBBq3hIqMKwcLeQ3Q6N/goqtkTAWJKD3m5SnoK/45vb
         phow==
X-Forwarded-Encrypted: i=1; AJvYcCVmRfjRNefV+x6GK+sCFJ9HR/sA0Hj3xyNx6mzC03oSxWE/Myfp7fdcrZSQwi077Q1LgLKTrGPyNAXF@vger.kernel.org
X-Gm-Message-State: AOJu0YwNL7Q/grWmtC8zFMqoxZlGJUQ3IHE4OILMH7zq/1ze5y+frwP1
	KdicjAsnjg+cgoUjeDVyNee55vK2C116CicFCNqoNc9jJVCvO7z4AZwe
X-Gm-Gg: ATEYQzxmJzI7CWW57rEhut/vjzbTKR1S56HhXtP9Dm/KaLcq7zYk7tq8e2jpEs/b20W
	R1E17tASd46toIZ8qpVlojiq48gCLaK0D7Lg1HmCrii6teQlTzuex3sXjPoSTNDYo0KsnLUsFPZ
	dJSolDi4KWgExFDElp8afqddSCedcqRtubfLCMTv3q110owVstrDBv0t7HwqWl1ZUdfqDHQjGLM
	7jgfFTPsNrl+KEHBdr6gMJaaf9hnM2XBfYlAUxPIIUW2WqVhgLktBv8rwW8ZgHsuGSX0CXxJvpp
	7e1zjHtS+nB7dGFzNa4g9veWzz6KJ8wHACJvPBI031HJz0AvfVqtQoXIqMUQ9ntIiMpx739Hv8+
	XXdN99gTL7CO84xmuPwTJk6u6v6Y5zkP6lmPKaegXyBnckYJMRynxGynTVU2VXaTtogZ26FDGjM
	lzM18NBkEaWW4P6KpzLow=
X-Received: by 2002:a05:600c:4612:b0:485:40db:d40c with SMTP id 5b1f17b1804b1-486f442e710mr7845185e9.3.1773773223563;
        Tue, 17 Mar 2026 11:47:03 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4ba760esm102725e9.24.2026.03.17.11.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:47:03 -0700 (PDT)
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
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 9/9] arm64: dts: mt6392: add mt6392 PMIC dtsi
Date: Tue, 17 Mar 2026 18:43:12 +0000
Message-ID: <20260317184507.523060-10-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317184507.523060-1-l.scorcia@gmail.com>
References: <20260317184507.523060-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33674-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[packett.cool,gmail.com,kernel.org,mediatek.com,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,packett.cool:email]
X-Rspamd-Queue-Id: D261F2B11F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Val Packett <val@packett.cool>

Add the dts to be included by all boards using the MT6392 PMIC.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt6392.dtsi | 141 +++++++++++++++++++++++
 1 file changed, 141 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
new file mode 100644
index 000000000000..fbf6f671524c
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Copyright (c) 2024 Val Packett <val@packett.cool>
+ */
+
+#include <dt-bindings/input/input.h>
+
+&pwrap {
+	pmic: pmic {
+		compatible = "mediatek,mt6392", "mediatek,mt6323";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		keys {
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
+		pio6392: pinctrl {
+			compatible = "mediatek,mt6392-pinctrl";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		rtc {
+			compatible = "mediatek,mt6392-rtc",
+				"mediatek,mt6323-rtc";
+		};
+
+		regulators {
+			compatible = "mediatek,mt6392-regulator";
+
+			mt6392_vproc_reg: buck_vproc {
+				regulator-name = "vproc";
+			};
+
+			mt6392_vsys_reg: buck_vsys {
+				regulator-name = "vsys";
+			};
+
+			mt6392_vcore_reg: buck_vcore {
+				regulator-name = "vcore";
+			};
+
+			mt6392_vxo22_reg: ldo_vxo22 {
+				regulator-name = "vxo22";
+			};
+
+			mt6392_vaud22_reg: ldo_vaud22 {
+				regulator-name = "vaud22";
+			};
+
+			mt6392_vcama_reg: ldo_vcama {
+				regulator-name = "vcama";
+			};
+
+			mt6392_vaud28_reg: ldo_vaud28 {
+				regulator-name = "vaud28";
+			};
+
+			mt6392_vadc18_reg: ldo_vadc18 {
+				regulator-name = "vadc18";
+			};
+
+			mt6392_vcn35_reg: ldo_vcn35 {
+				regulator-name = "vcn35";
+			};
+
+			mt6392_vio28_reg: ldo_vio28 {
+				regulator-name = "vio28";
+			};
+
+			mt6392_vusb_reg: ldo_vusb {
+				regulator-name = "vusb";
+			};
+
+			mt6392_vmc_reg: ldo_vmc {
+				regulator-name = "vmc";
+			};
+
+			mt6392_vmch_reg: ldo_vmch {
+				regulator-name = "vmch";
+			};
+
+			mt6392_vemc3v3_reg: ldo_vemc3v3 {
+				regulator-name = "vemc3v3";
+			};
+
+			mt6392_vgp1_reg: ldo_vgp1 {
+				regulator-name = "vgp1";
+			};
+
+			mt6392_vgp2_reg: ldo_vgp2 {
+				regulator-name = "vgp2";
+			};
+
+			mt6392_vcn18_reg: ldo_vcn18 {
+				regulator-name = "vcn18";
+			};
+
+			mt6392_vcamaf_reg: ldo_vcamaf {
+				regulator-name = "vcamaf";
+			};
+
+			mt6392_vm_reg: ldo_vm {
+				regulator-name = "vm";
+			};
+
+			mt6392_vio18_reg: ldo_vio18 {
+				regulator-name = "vio18";
+			};
+
+			mt6392_vcamd_reg: ldo_vcamd {
+				regulator-name = "vcamd";
+			};
+
+			mt6392_vcamio_reg: ldo_vcamio {
+				regulator-name = "vcamio";
+			};
+
+			mt6392_vm25_reg: ldo_vm25 {
+				regulator-name = "vm25";
+			};
+
+			mt6392_vefuse_reg: ldo_vefuse {
+				regulator-name = "vefuse";
+			};
+		};
+	};
+};
-- 
2.43.0


