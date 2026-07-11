Return-Path: <linux-gpio+bounces-39895-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1m7CA150UmoZQAMAu9opvQ
	(envelope-from <linux-gpio+bounces-39895-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 18:50:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 777A874245D
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 18:50:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ZJZXCd52;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39895-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39895-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14CA7302BB93
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 16:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8909C3CBE6D;
	Sat, 11 Jul 2026 16:48:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA16F3CAE75
	for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2026 16:48:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783788517; cv=none; b=X7qTqLLwPWz29UOMrIVwq/joFkR7aPimFx/vI+xSKn+7Ul6u2+RIIHYSB5IzTLY6OWnn+FmSsne8BlG3ztaoG6nboqHN+nEGtYbedRL9PWJ9zSVZEIT+MInyjs192TqCwfPaM38iUFuDAEZFOGGFa71X7tNJUfLdO3rWRkDw51Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783788517; c=relaxed/simple;
	bh=8gu660Q0u7C0W8t7xo2+vLeynZsPh27OtCchUb5pAFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m5NOxblriMij11yt9PcXJOA2/qFE6S3YQPkJOTkD9k74F0e6E2PjJaU0LqyrupoA+G80tMxDrjReuPC5nUP9xip4Abhx8UXGeG1mXKnj7L00pruZ+Ij9jkpb4+DH0e0jSM1UvW7OIm87Z7w/NoSQwKyJaQiEw+1EoqXly/SDDPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJZXCd52; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493f60208a5so13232025e9.3
        for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2026 09:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783788514; x=1784393314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PhreuQjpg77ctdkAec2a78pglE74GvXVMC9BSorqz4I=;
        b=ZJZXCd526PBGcsE275x8ElVB5+6uBnUiTv3kfpyHPiijdrzPAx48m6xnrLoysjOu8B
         CP35OhHD4nHawYQ2f1pBtMWeO99FknQCV8GUERmnQQZ1xqPSp7A8ijJ6MZXIK4KdeS2d
         kWwSEc4kOwG2x9cS4SO20/YWls86G2DOY5BqRgB3ERlDCcSd0St2dA4JnpZA0eaucKor
         NzSL1othtzt2aPKwKhVChHHy/4josABg1EAfSmVTKxDoDx/QvF5GZLqTpIkmon6Hsp8L
         Td9BhysOGZ3PL2Ikr2Rb3YGoozgbokUWpY83R1PvvYCHl8f9GjzmJYkUlTPzRYq8HpcQ
         L5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783788514; x=1784393314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PhreuQjpg77ctdkAec2a78pglE74GvXVMC9BSorqz4I=;
        b=Jf1qtwKhe7uPKKn7l341/hxc9iTlfNqx7EEOVhhMEwH9Bs2tVCV3IwkRyyF8udIBMZ
         h5U1NqRF0y+OkkenW3LnBprAwXhRQd9vqtHVvI3B4ZmQFfzTfoeM7fal2Z4o0lKDMOTW
         Hw9p4n+Y1bd1wrQef57wW4pIwJ+nP28nTWrKs9p036W/tmnIyIKva5WIjO7lSARABL2Q
         Ezd2nfarzbEJbmoN9XXrOi+6THdHX1RbFw095wkl69wX6OrYYDWyKEwFgfsi/EpkYiqT
         9YSQuLyiUAeFXtpnfjRRwLtswftq9wDcNigRjY59qN8oRpMYSEoe3y5loRN7Addk1KRL
         mz6w==
X-Forwarded-Encrypted: i=1; AHgh+RoHrq/crE7Jh6w2/MGmTGHHoZn19FqpEfHTydI5Mo4nwXUdI/tlxMRA6u9Ear+PnSepCYfxLkd0OZwP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5aOuwWOBb49Qn/XM+uiw+xxDYOsN9ZhUam+Hy9eZ7atpzUgwW
	3L2ZJVA0Dk0NQvVctAx8GOtdPP2vF7qXqtTLZNusinvcR5ECGwxxjU0d
X-Gm-Gg: AfdE7ckMrWFxe+wrjSGO1uGKR02ag/KdLuOa2s8uVo4QGeH6TNJ9wwglukya/sVCKgQ
	djI0H8Laj9Ep6Kk8Xaqb10uAj42uah4SCfgWK1umjrIjYKhknXp4opb0sMwj+I9FOFOICD7NIev
	GW5W4Xx+VdLrARUObMc809XdiI25UJ/LATs37zipwe3SQznCcq3zjujA/4KwEhNeh70lZVyNQy0
	FS5P0t4ci/Sf5VAfURCTo3A0NF+6jgIQUuXlBqJtX5a2dvbszSaNTc4FLOuWqcRQDrZc0k3fzk8
	WHHCPK9WbB3CbC/XFl22aOPC/QVQahWnsUAGOFFqPBln4D3HdGB0XaMv4o9SwWqIaoal9LrJURi
	vrbOmVosAkXkIJLIl/eBYFkjPTRqMDkSKYhKlT9wHkCpxsPGXRoUYj1Cpmwd94AffQVeUsd4+AV
	6Z27Q/aLlN1LRLUBSRaGJn5jhcGWUQcOPTOhwgpOxV4n7P
X-Received: by 2002:a05:600c:19c7:b0:493:fa7d:56a0 with SMTP id 5b1f17b1804b1-493fa7d589cmr22554885e9.13.1783788514279;
        Sat, 11 Jul 2026 09:48:34 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d83bdsm69152875f8f.13.2026.07.11.09.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 09:48:33 -0700 (PDT)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	--cc=linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH v4 5/6] ARM: dts: ti: cpcap-mapphone: add charger detection interrupt for CPCAP USB PHY
Date: Sat, 11 Jul 2026 19:47:53 +0300
Message-Id: <20260711164754.185565-6-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260711164754.185565-1-ivo.g.dimitrov.75@gmail.com>
References: <20260711164754.185565-1-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-39895-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:linusw@kernel.org,m:brgl@kernel.org,m:--cc=linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:ivo.g.dimitrov.75@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:ivogdimitrov75@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ivogdimitrov75@gmail.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ivogdimitrov75@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 777A874245D

Update the CPCAP USB PHY interrupt mapping to use the charger
detection interrupt and corresponding "chrg_det" interrupt name.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
index 6b1195c2a768..51a858021541 100644
--- a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
+++ b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
@@ -125,11 +125,13 @@ cpcap_usb2_phy: phy {
 			interrupts-extended =
 				<&cpcap 15 0>, <&cpcap 14 0>, <&cpcap 28 0>,
 				<&cpcap 19 0>, <&cpcap 18 0>, <&cpcap 17 0>,
-				<&cpcap 16 0>, <&cpcap 49 0>, <&cpcap 48 0>;
+				<&cpcap 16 0>, <&cpcap 49 0>, <&cpcap 48 0>,
+				<&cpcap 13 0>;
 			interrupt-names =
 				"id_ground", "id_float", "se0conn",
 				"vbusvld", "sessvld", "sessend",
-				"se1", "dm", "dp";
+				"se1", "dm", "dp",
+				"chrg_det";
 			mode-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>,
 				     <&gpio1 0 GPIO_ACTIVE_HIGH>;
 			io-channels = <&cpcap_adc 2>, <&cpcap_adc 7>;
-- 
2.39.5


