Return-Path: <linux-gpio+bounces-37477-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLalKS9hFGqgMwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37477-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 16:48:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B795CBE71
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 16:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A42E23006926
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 14:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DDFA3F2113;
	Mon, 25 May 2026 14:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Admtch7U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D19D397AF5
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 14:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779720488; cv=none; b=WDlMuP0vjGA4DG2DlY1qA6B6zftb+stexA1dMRXIS595r5NoNOip1o8R0cbGDtAloQEj9+52e0nCSWP64vXpYKcXvkMmGk0li2VxZy4EgsSPzvDCB6ch8GZ20Fv47EW7txHrENR09Y1ZlL+ZQafkh6UKYLNJ3jTVWS1IzWEkihc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779720488; c=relaxed/simple;
	bh=ow2Pp8Yde2ialN0PVZ+ngSDDkSxMoIzeQ2w8Qc4ooeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SGKObA3mV4q1zExlCN0q8qy6Ir3tb9K0rF3KcaNiC5a1b5ZsjV+cLMb/VocQXkaZps5Y6FffFjoK/3L7XKXR8/d88jJxhkBsY3D9Z2cKOJUZCzVDSzEANXvda5uCukL6HTEojaQD+HIp6oRtmnGrvrfK6ceAmLJKYxDG7q5aNiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Admtch7U; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36af4b7840aso394515a91.3
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 07:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779720487; x=1780325287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IY5VpH1QCqNL+Hxqm+EMdHN3zeBtEzU6Oz9nJybwNNI=;
        b=Admtch7UI0gu5S8ZMD2Q1X5linI28LEuf2Znabbk/HF89K7f/+QpiKWvfsRGy1riXr
         zolhcnbGN2MoA7M2jfcEhw3bh9/hvifTRHtsFOQt3rrz7/Jf5kY78O0p4TMTm+A+lqVe
         LldrbdJog8Se0y6HZMUYuLWOOndczHvpMDOXWGCiJ07GxhHZgq9dKrDq9iFLjSaDesu+
         YVfVTWovmuG9ghuT5InQ9mC55D3dXEP5kCoD4Vbh0M9MtOC+3z87bMoYTHh9sSCffmLv
         wSmSeYuqYYLoSiFbE9/rHj1Tcd/73zBcy8VOOaWCAkEpfg8oEcE4KhCaHqUEoHeKIIfj
         VsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779720487; x=1780325287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IY5VpH1QCqNL+Hxqm+EMdHN3zeBtEzU6Oz9nJybwNNI=;
        b=ATAN66Efsm4XIv41nLCfkTYcFBWA3busxkOcYGZeUsLEDc4PzIWFlJmA30JfVY0f3x
         nTmmOj1zNBvNv1elxxOONA4GMBOIvSg/+Ave57vL42xpwINkEBeITHqyCFLudefTQnN7
         sqs/5eYJSJYCgSIBRGpvvFm2RQzG1+jZbLl7FGIGDCyXbRJaEArGtDqoMY8M108fr9dC
         wG3fnEuf1CUiRCmVRjYv17jRgDfk6HdyNMKLYr/3f9RAdWwb5zZu6Ri2BXnowgmcMGFI
         J2ADaYjWa9dn2jJE2eMzrSWzT9rCXKk1e8Ae2YiOeHO3tj+dY4bhmECuVh3lJmwjfFGZ
         sszA==
X-Forwarded-Encrypted: i=1; AFNElJ9CmbxQSERZNz0vCfsvuVpENGHO0f1Fww0EEO8CzXXN30dmh7aHiwhvRX0CB3157KPq9HebScEVkGlJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwkB0jTEHAWLO+up/651v+l3gc4KM4EmYK6DzuHXVTirMYuL9tF
	YFwFn7o7Z9SrcbzmK7fcwwAxqUqMg9Fi3zniETLIvnf1GsSIChAF28wx
X-Gm-Gg: Acq92OGy8k9OCZ3LuzrDfMS6b5C04xcGzZML5FVMspRYZfGtfrz0w5dRaS2lknpwZ/6
	OEXdKvv22H4wev8/EvjKheI8dcWdrj5abV3ODkXJudGzDXEstUOJhLt+lsP5ihwDPuQ5y2Bdb8Y
	FzQR+vDn4CTxXqn3Dm6CotIPjKObYLJ7LX5dt4m2Y7ANDvnLWs1FB29cN6AgjjP1S+i3JmGWux1
	zu5Q4irf8n1Gj7DNZIEb9h6fB44yI1XvQXjTS3SbVTAQcubn81ErgnGayeQ5oAXck8i9bqD3qmn
	V0+EtmYsipZJM94Y8n5oAtF2gWVtyXZbzezV24EzvdaiVs/810gpuzICcvMyFTwml+tz4vxYrj/
	/xy5NMvLBJlY5Mj3UlyTAGHTsKGQmWBDaTO0dXJtOs4QCIfjFkIuAi7oazDXlWsjjPdLxEvPFTy
	saleKHFrKg6TeC7K2wL0vlc8TeHRDKVbZXr2cvP11CnYSfiCeOEhUEkH5J3QZo
X-Received: by 2002:a17:90b:2e88:b0:369:a359:b18e with SMTP id 98e67ed59e1d1-36a67449708mr14002024a91.9.1779720486941;
        Mon, 25 May 2026 07:48:06 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36abfe17c95sm2721993a91.0.2026.05.25.07.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 07:48:06 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linusw@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Shawn Guo <shawnguo@kernel.org>,
	Paul Barker <paul.barker@sancloud.com>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 6/6] arm64: dts: marvell: armada-7040-mochabin: Fix is31fl3199 shutdown GPIO polarity
Date: Mon, 25 May 2026 22:46:12 +0800
Message-ID: <20260525144629.498630-7-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525144629.498630-1-jerrysteve1101@gmail.com>
References: <20260525144629.498630-1-jerrysteve1101@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FREEMAIL_CC(0.00)[gmail.com,ucw.cz,kernel.org,hisilicon.com,glider.be,foss.st.com,vger.kernel.org,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-37477-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,lunn.ch,bootlin.com,gmail.com,mailoo.org,163.com,arm.com,tkos.co.il,sancloud.com,sartura.hr];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_PROHIBIT(0.00)[0.0.0.1:email,0.0.0.64:email];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lumissil.com:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 03B795CBE71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The is31fl3199 shutdown pin is active-low [1]. Correct the GPIO flags
from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW to match the hardware.

[1] https://lumissil.com/assets/pdf/core/IS31FL3199_DS.pdf

Fixes: 737929191283 ("arm64: dts: marvell: add Globalscale MOCHAbin")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts b/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
index 6bdc4f1e6939..cf690a85cc2a 100644
--- a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
+++ b/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
@@ -236,7 +236,7 @@ leds@64 {
 		#size-cells = <0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&is31_sdb_pins>;
-		shutdown-gpios = <&cp0_gpio1 30 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&cp0_gpio1 30 GPIO_ACTIVE_LOW>;
 		reg = <0x64>;
 
 		led1_red: led@1 {
-- 
2.54.0


