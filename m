Return-Path: <linux-gpio+bounces-38882-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GGayMIEIPWqWwAgAu9opvQ
	(envelope-from <linux-gpio+bounces-38882-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 12:52:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9BE6C4DDE
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 12:52:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ZzD2goIW;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38882-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38882-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 582A83054EBE
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 10:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD47388E57;
	Thu, 25 Jun 2026 10:48:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B74388385
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 10:48:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782384495; cv=none; b=Nu2X1AX1wHxKmFkcLCV9A6YHjrskKuBMgFtIPFPxB/Eqd41rShNBC8Ryk/5AgT0L7hLDa8OmPPTKy2ePmnnpSjrKXMxiC6o+9CqfSnHLvwDpvzZWwsfzZdqev3ag68AShYSda7SW0qwnB0lw8Pis8ed9EDMO6E6yzOdmi5SsVEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782384495; c=relaxed/simple;
	bh=85JpFHUCR3X4aSnnJhNaKIDBi3/5GXYIOqt+mp/9g2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ld+ADmLTV0d4qENOczQXE9MwMBKJ1TBEUdnIdcirHyN0fl2n1f2ARLujKJ2Ehz86c1r3zZAhHuCeCIhxB8eV3GWdfqUvkjVxzg/QKEE/vMJLe+QAeXKzfHpN+W8X1gks8dl28gNRaQ76qhE0xKLn41jP06Y9y3W10NTvMqWIsFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZzD2goIW; arc=none smtp.client-ip=209.85.221.51
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-46e22950091so212798f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 03:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782384492; x=1782989292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGDKUwtGAyS+7+q7mgtQ02+mVANH5ixDJ+D4q6Iez1w=;
        b=ZzD2goIWyVsx0p+c+8vPFrK6ygwSXJLlAtkoHSmXGNEWySXGv4uc9eyTxPXEFR3BEm
         H4lbWjovEFGa07umxQx+JBeG8i3FMUVkD9wVFODxtoOVlOjMCIyml/ZfPgIRuZageGhg
         aJqe6wI8tsyrH8AXL0lGwh+9BkCSTze8m8it2xdXu7duLb+UiDdYLPz0pmEe/YRPMOwg
         HD1BJWVsy6mc8IcA8/cozT9GxbC8poyNhd9HW1+01xFWYvr6Tx+sFFidIg5UAoYPvFWP
         e0ztlFzMINtGEaScwW0XABan8lYT1KSB6dfthajwgkqjozCD9GRO9hYiygOR+cArSGVf
         rUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384492; x=1782989292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qGDKUwtGAyS+7+q7mgtQ02+mVANH5ixDJ+D4q6Iez1w=;
        b=LtdWZozDNaIOdlv+6tJxex/EbyQ/xR0EEV/qMVnuhoXxq4hgr7XkiyB6sBiKHTCCSc
         Q1S8MJVyisEDIJWAZtZ5urCGeKSvVLr9aq6aP6iyQfWsy5AiisM6LJnwKq5QUoy0/B3t
         036KC1ZqMl12a36cA/qBE8TE/fk11wuYc521haaEdyIlA46A7TylbzPMe1ofWvRcW/sY
         /o0d8lJjEU1YZDZpverKVGYoy0ujg/PTKjEenHyw1pG62TVHzYVLr6bXsKZg2/jo8kXM
         g+Q95O7sozyx1lRpTulw13Ws5N2KMfaGBqZP49z2buRJQrdxPnyvJCP9qbxxfkiLra61
         sfIA==
X-Forwarded-Encrypted: i=1; AHgh+Rp2nuOQEjOSHkdeIeAQHvx/6Nk5PzOZF63VQ2In5Vk6cT2o0nDixslBiiMtLwOkrbH6h+WwNUIkjzUH@vger.kernel.org
X-Gm-Message-State: AOJu0YxLcHSSipyFq5vrVppBcE781gqPh02fBv29ifPRt1dJXi5DkW2t
	rwU4Wh4V4yE3WGWLyPlww3LAEY6pEZ/ZCF/qBPAAVSnjx73vjd2blb/a
X-Gm-Gg: AfdE7clalt9dJdHn3+aGYF1zxH08Od6rACdVhNAvkTAUZOBoD4dkRPoYUGj2SZ29cRU
	6d1FDemKrRs2b39I9vDjOkp7+PVjhuywzUDiKaBqwFXXF1/ka+03n22XLPzp7k9YEoQ4PO/mhcW
	vRk2Z73sCKHZpAeXD7jo2dO1W2rQbcG9dYaCP9Ss30+GnPLXXjD/hpPCmKTVV6StGWiqpAShbYt
	GiFSRp7C0X2B2dg0O9NpWiPGsmTpDK1U3eO4LzBGpAiqLrjOr/qEHecwpGMmOu0vToLd5bEdjt6
	bpHof5Dz2LFV6jVpE4FAeyR787a2dAHefIzNUXUcCfUClxgJqxmBGBQgl2ezjEMeqrCi8RCokZr
	G7Xn4X+9NRqVDVtO3jPJAl08i4Ej35kdnYR4AFSGQ47qDaHYd4WhP2HSkCmQQbfHXaTVRHePpY7
	T2lVyS1w==
X-Received: by 2002:a5d:64cb:0:b0:46d:32:3340 with SMTP id ffacd0b85a97d-46dc16b9abbmr3055956f8f.36.1782384491908;
        Thu, 25 Jun 2026 03:48:11 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01c6csm15254989f8f.14.2026.06.25.03.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:48:11 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 3/3] arm64: dts: mt8516/mt8167: Update pinctrl nodes for the new paris driver
Date: Thu, 25 Jun 2026 12:46:32 +0200
Message-ID: <20260625104742.113803-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625104742.113803-1-l.scorcia@gmail.com>
References: <20260625104742.113803-1-l.scorcia@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-38882-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mediatek@lists.infradead.org,m:l.scorcia@gmail.com,m:sean.wang@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:lscorcia@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B9BE6C4DDE

Update the MediaTek mt8516-mt8167 SoCs descriptions to respect the
constraints of the Paris pinctrl driver.

In those SoCs the pinctrl has base address 0x10005000 for gpio settings
while 0x1000b000 is used for eint configuration.

This change also drops the no longer required syscfg_pctl syscon node
that was used before to access the gpio regmap, fixing the following
dtbs_check errors:

mt8167-pumpkin.dtb: syscfg-pctl@10005000 (syscon): compatible: ['syscon']
  is too short
mt8516-pumpkin.dtb: syscfg-pctl@10005000 (syscon): compatible: ['syscon']
  is too short

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 15 ++++-----------
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 12 ++++--------
 2 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 27cf32d7ae35..65da6c0538b1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -95,17 +95,6 @@ power-domain@MT8167_POWER_DOMAIN_CONN {
 			};
 		};
 
-		pio: pinctrl@1000b000 {
-			compatible = "mediatek,mt8167-pinctrl";
-			reg = <0 0x1000b000 0 0x1000>;
-			mediatek,pctl-regmap = <&syscfg_pctl>;
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
-		};
-
 		apmixedsys: apmixedsys@10018000 {
 			compatible = "mediatek,mt8167-apmixedsys", "syscon";
 			reg = <0 0x10018000 0 0x710>;
@@ -178,3 +167,7 @@ larb2: larb@16010000 {
 		};
 	};
 };
+
+&pio {
+	compatible = "mediatek,mt8167-pinctrl";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index b5e753759465..63f36df4d1b4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -231,17 +231,13 @@ keypad: keypad@10002000 {
 			status = "disabled";
 		};
 
-		syscfg_pctl: syscfg-pctl@10005000 {
-			compatible = "syscon";
-			reg = <0 0x10005000 0 0x1000>;
-		};
-
-		pio: pinctrl@1000b000 {
+		pio: pinctrl@10005000 {
 			compatible = "mediatek,mt8516-pinctrl";
-			reg = <0 0x1000b000 0 0x1000>;
-			mediatek,pctl-regmap = <&syscfg_pctl>;
+			reg = <0 0x10005000 0 0x1000>, <0 0x1000b000 0 0x1000>;
+			reg-names = "base", "eint";
 			gpio-controller;
 			#gpio-cells = <2>;
+			gpio-ranges = <&pio 0 0 124>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.43.0


