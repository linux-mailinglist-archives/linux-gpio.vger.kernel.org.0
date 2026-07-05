Return-Path: <linux-gpio+bounces-39465-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dc3LNYkuSmqF/AAAu9opvQ
	(envelope-from <linux-gpio+bounces-39465-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 12:14:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D8A709B67
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 12:14:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=a1NLJkIS;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39465-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39465-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E2C630459CB
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Jul 2026 10:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 091753921C1;
	Sun,  5 Jul 2026 10:11:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34DA36B044
	for <linux-gpio@vger.kernel.org>; Sun,  5 Jul 2026 10:11:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783246289; cv=none; b=ry8x4KO7l0aO032n1QpyQeYX1UNXfL3qDHta2qvKVfK1EbFlYxZEnOOzfjk2S3yxRsxDYgyeQkmX1mHV46SbWhavZaZChnjb066ps3t9tVAzVdluWYsDGwl+FJRQiUW6Zby4fsmDgOY1JCVBkxmatijB25NVokNtpHhuJX7KK68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783246289; c=relaxed/simple;
	bh=Xsqlm+rF7jIXTcXnCSKMaVUBX15NQaxokCbcRbwJDbQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=an5ZxuFdNSZydJGSb4VwFvP+sK295PffPewvr46gbRavnEkrfUbg/sASIYZP/3fWX0CPE2bJ671I+645LhrA/yYIfz34r/9yw848iMsT7OCAxIfu9G0gGHlQ+wNXXtd0ASfzdANeYzP0t4AiS39grMBTRWm2vYJp5zjIUPFrpxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a1NLJkIS; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b691cb44so12891615e9.0
        for <linux-gpio@vger.kernel.org>; Sun, 05 Jul 2026 03:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783246284; x=1783851084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UY6T/viKs724YCtcNe87O9J53G3jzdQBIfSFXtvLiY=;
        b=a1NLJkIS8n1xjhVOy5lYXcSxfeWUQbO4dPt8XKHTYwJL3QmyzS3X5FsW8LacxHXOMb
         URmcwDIfMgG54oyiULOIoTvg9vpeUnNEwOhavFkRw/55A4U3aZ8wpPENkrEvnRD8D/F6
         cWuEtjFl5kVYQxCeKdIm7LijNCbyBmPqmX3K1X+eKpl9JBOjl+X1w6VRO6j0iISCx0so
         K4d9fdF1yw7ai1T0gRfcytQLuss8+D4qKtXHR4U+HjE2Ic14SQGoUF8+Wg+jXwJf9lhB
         XR6HnqkMOozn9ek9TRuKBtBoi3XbZzEkGTqQmfUNrop2K+gd1oq915lzcxSy5da3tQJz
         mrlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783246284; x=1783851084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7UY6T/viKs724YCtcNe87O9J53G3jzdQBIfSFXtvLiY=;
        b=I34aVDyXzaw4bkG7urM87oA74fdkP6Ds5Ec6yb5u3f9aMvKMu5bt5gFm5bkKaXxOHo
         m/EIGNL7D56VrO+55hCwYKe7JmwwwNbnvzV3+qORf0sq6A17qc/h03uvviw1ZAIVKeTz
         zw/m1Y1EeL3JabtGMXCSu7wbx+SRIw2qX+fOHKydgo/cnzK9v5slRHStjnbCOp17JA9l
         yXQFOjg5Bf5zw0JrNaL51M1h2cmqZw4DA8SVksGknXnu6KDrbg3pPop2aLZu2zKKwR6M
         DOjw5qkhczAxinWg86KlvfU72FYrCunv5TnBOVkcleiV9w9aY1Iz8meKep292Xq4FaqY
         h4VQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/WpszoGVDLygpqXxvyYXT1FkWgoGmCZpa0JIkM5lSz5Lpktxku8j0Q5APA2trbxseYwLU+ixsnFhm@vger.kernel.org
X-Gm-Message-State: AOJu0YzfOdYmLagtbXXBiwDXpNLJWlZpV7+pegkYgu5+bYzVox7L3s0o
	jOxUUGbzw5Njpw1Pyyha3Xw/0GRVkgsZqxlQmV8UhoXKYju0mbDcw1g0
X-Gm-Gg: AfdE7ckjD/UOYkJavz1bodalArPOYX6/TPPDX7MJpRl1XhnJXr0uqOhAqLYTZ8/FMSU
	B3sIueRpK4ayrV6KyytQKYBunpwqFg5EWG20cnMI+uBBWnJOdOUBpipa5C9n8qA8eAvqWvExHcM
	mCnuLOeTUKTYQQ9q+iRngZJdToQKxvtO0oLB7JW9ijr1NcMXx48eU05APbJyO3bPfC0akRAPt4n
	CbPkklwAjdeRrvkLpwRc7S7pcgBssUQWIPtWjq4ME4hNLb0NugCqhDQuRXA770pFT+kJpB5qHgR
	VUH4aCTzsYnIesMUuNX7gZmrFvgIKQA4EXe6M9I723UXuEm/WIedx1Evqxmn6P0/itbz2A9+was
	a0Ak7x89APCJK5MQ5MoQtDhu7EJs+nRVo5YFNuavfDkGL/Sfo0vxOKIxKfoIbaKOLWXAYYu3Q6q
	8ngwPK2oyRjcoASLLc1gGZiAhJqFZaSlaKiQ==
X-Received: by 2002:a05:600c:8b85:b0:493:bcef:5646 with SMTP id 5b1f17b1804b1-493d11db32emr69992255e9.12.1783246284252;
        Sun, 05 Jul 2026 03:11:24 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637bbcfsm261382715e9.6.2026.07.05.03.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 03:11:23 -0700 (PDT)
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
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH v3 2/4] ARM: dts: ti: cpcap-mapphone: use charger detection interrupt for CPCAP USB PHY
Date: Sun,  5 Jul 2026 13:11:03 +0300
Message-Id: <20260705101105.1798069-3-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260705101105.1798069-1-ivo.g.dimitrov.75@gmail.com>
References: <20260705101105.1798069-1-ivo.g.dimitrov.75@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-39465-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:ivo.g.dimitrov.75@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:ivogdimitrov75@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ivogdimitrov75@gmail.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,gmail.com];
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
X-Rspamd-Queue-Id: 32D8A709B67

Update the CPCAP USB PHY interrupt mapping to use the charger
detection interrupt and corresponding "chrg_det" interrupt name.

This matches the driver and binding updates for DCP detection.

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


