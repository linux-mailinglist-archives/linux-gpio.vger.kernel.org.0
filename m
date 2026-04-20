Return-Path: <linux-gpio+bounces-35280-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENb9DMec5mmeywEAu9opvQ
	(envelope-from <linux-gpio+bounces-35280-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 23:38:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF4A43440E
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 23:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 50B7730069AB
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 21:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 157AB3876CC;
	Mon, 20 Apr 2026 21:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgJXUVJ+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38952392C26
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 21:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776721073; cv=none; b=AaK9q+7Po+qk0fQAdk+nHUxBOgEYdaSHUd4I1KBOSGwLwgl4A4JSV81ECednXhv9l7tEYK9NRhAfS6XfYgMGieJRTpitFerbLD7sD/daeKm8OlXgkhA3Cr3jxZ19jSa9T/CXElW31fBzTGsLn1/AhAewubJ4j6rNKjraJlrFQkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776721073; c=relaxed/simple;
	bh=ONzx1TVLssQ2quIYxWPdg1+c0cg1jkFrd/S0xZj62AU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jbZTkvYtRdEjbaFCGF+3tRKBZmIdWAB5TaYV14ksuW+yYcjzzLiC7rNsypSr0IeTKl+vYMH4mTTVGzHypCW4lIgCtdnNkrLEGDAPImoVN+Zo6HUriLcaZQ3gE0FiKow7Z2GCwFRa1KRiSJbkAMNqPpGxLldOlDPCZOHo0XSb+U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgJXUVJ+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso30269355e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 14:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776721070; x=1777325870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FkjylHhPY5Zp4sZf/mKL22KMI1gZWywJJ0iSsDcvxlg=;
        b=AgJXUVJ+fQmuigUW1WebP5+JaMMx3d4aUe08m8Doio5aOt6APm25qQce6HDe0zARmY
         LqVqjfYsainkg/8xwx65gRR8sT9iF2tMkIrjCp//0gFm6MAjkQS/k9KmYdSTBq23Pev6
         +m7+MOMHzXVOmwfUYWT1amQYoNJj/X/K2DNrbbnVnWikGEV/MNDiEjW7KXw/JFlqiDQ+
         5hbJ+SgcCr0jv+Znf3Pq0NlfkcxJi07VUkTq6BD6lC5i8vY0n5UfGjD3daLm8nK9rIAo
         ipfdJ/aqXuQX+YDdm1obiaNrBZY4uLJwj1yi7FyBstyGmkI3y48dCCZrG25uvReFt5n7
         UPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776721070; x=1777325870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FkjylHhPY5Zp4sZf/mKL22KMI1gZWywJJ0iSsDcvxlg=;
        b=hjpAN4oExtqYy+JLtOxjQI4I0GAidPbtBVY1QWRVJ8Ta3YQd+MCn3QsVqYUnRaTqhI
         OeWFxNZLFnHDZyLU8ie3y0XFgjgcfNaHMqDA02NP6Hn3fIUUHm4cSHhfz7s3hvzDKMmw
         HDu1VmW6ic3W9tfHkyYdKXwakmZiEPH3L2W29ZYtGWSBgqJ9nySkptzAgxdTYo8fitNq
         x8Z6QJ6Y1FeBSJEQ+QoqUOI1hf/q6qtz3PtEzg8efYt+jSs4p2wnt8wZ2MI/lo0pKUQr
         NMFgatl6Yz76geKTsTY+lze1wS3/kYcWOsJKzN8chn4Cr+lXkqBNMuZdbTdmeAbv+mAo
         qWBw==
X-Forwarded-Encrypted: i=1; AFNElJ+E/M01rpbzXjdawcKQjj2k6ko6FO1Os5A9qUqqw6p8RXJ46Va4ga851W0dNweyk5vHzEvAn52Xixlk@vger.kernel.org
X-Gm-Message-State: AOJu0YyzKDlC01mDj+FAejLBfwQ8pX7Ivo3JVNcm6ubr+tmHeL9sCEzN
	XU27tlDW1v1T9dLg6uez2oi97quf2BYRYFwzoihyCyofb11vNtJRbn64
X-Gm-Gg: AeBDievcltxIsQNBNzBHcsc23+evVbBSaDbODMSWLBdnX0PwmZVqgg724KwmjzJOf7a
	JDcpm0y9+UisriEMXr//gEm1SPN28ZEmqJWCkBGEhCIuxBrlJLHrN74wKk5/1me87OnAIYFceUP
	a2rmKomn2JnnQz8rvURK1arS3fclVl/YXR29OylpXeQUCxnzQjakEPtL5MzrxrfAPr+jlpwD48V
	aujaPXklN4VFWt9B2Ny66wgKAA2qicuawBJygBedwX2ozTTiCM/GZHD1OOvONTa2gM2SBGQ5dY/
	ADIZLVFmPEsRIwaY5gmReF9qtqd3wtFQahRCs/qgjN+jBqVl0BKsuBQ2Gb8CGgRU9by9b+sjc+g
	NSLcYwJdD0bd6/mXL0qcvh8w9qpCkT38b0J1/rHuQmFP0SRgDHZSz2JMUif5/udCyCN4BxTvmys
	tSusitAW0TvtksLPYCk7dCG5eOU7s5HA==
X-Received: by 2002:a05:600c:8115:b0:488:ac01:72b6 with SMTP id 5b1f17b1804b1-488fb77d7d3mr178338515e9.21.1776721070421;
        Mon, 20 Apr 2026 14:37:50 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc140c82sm289500355e9.12.2026.04.20.14.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 14:37:50 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Val Packett <val@packett.cool>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v5 4/9] dt-bindings: pinctrl: mediatek,mt65xx: Add MT6392 pinctrl
Date: Mon, 20 Apr 2026 22:30:03 +0100
Message-ID: <20260420213529.1645560-5-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420213529.1645560-1-l.scorcia@gmail.com>
References: <20260420213529.1645560-1-l.scorcia@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35280-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,collabora.com,kernel.org,mediatek.com,packett.cool,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[209.85.128.48:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 4BF4A43440E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a compatible for the pinctrl device of the MT6392 PMIC, a variant of
the already supported MT6397.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |  1 +
 .../pinctrl/mediatek,mt6392-pinfunc.h         | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6392-pinfunc.h

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
index aa71398cf522..1468c6f87cfa 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - mediatek,mt2701-pinctrl
       - mediatek,mt2712-pinctrl
+      - mediatek,mt6392-pinctrl
       - mediatek,mt6397-pinctrl
       - mediatek,mt7623-pinctrl
       - mediatek,mt8127-pinctrl
diff --git a/include/dt-bindings/pinctrl/mediatek,mt6392-pinfunc.h b/include/dt-bindings/pinctrl/mediatek,mt6392-pinfunc.h
new file mode 100644
index 000000000000..c65278c8103d
--- /dev/null
+++ b/include/dt-bindings/pinctrl/mediatek,mt6392-pinfunc.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef __DTS_MT6392_PINFUNC_H
+#define __DTS_MT6392_PINFUNC_H
+
+#include <dt-bindings/pinctrl/mt65xx.h>
+
+#define MT6392_PIN_0_INT__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
+#define MT6392_PIN_0_INT__FUNC_INT (MTK_PIN_NO(0) | 1)
+#define MT6392_PIN_0_INT__FUNC_TEST_CK2 (MTK_PIN_NO(0) | 5)
+#define MT6392_PIN_0_INT__FUNC_TEST_IN1 (MTK_PIN_NO(0) | 6)
+#define MT6392_PIN_0_INT__FUNC_TEST_OUT1 (MTK_PIN_NO(0) | 7)
+
+#define MT6392_PIN_1_SRCLKEN__FUNC_GPIO1 (MTK_PIN_NO(1) | 0)
+#define MT6392_PIN_1_SRCLKEN__FUNC_SRCLKEN (MTK_PIN_NO(1) | 1)
+#define MT6392_PIN_1_SRCLKEN__FUNC_TEST_CK0 (MTK_PIN_NO(1) | 5)
+#define MT6392_PIN_1_SRCLKEN__FUNC_TEST_IN2 (MTK_PIN_NO(1) | 6)
+#define MT6392_PIN_1_SRCLKEN__FUNC_TEST_OUT2 (MTK_PIN_NO(1) | 7)
+
+#define MT6392_PIN_2_RTC_32K1V8__FUNC_GPIO2 (MTK_PIN_NO(2) | 0)
+#define MT6392_PIN_2_RTC_32K1V8__FUNC_RTC_32K1V8 (MTK_PIN_NO(2) | 1)
+#define MT6392_PIN_2_RTC_32K1V8__FUNC_TEST_CK1 (MTK_PIN_NO(2) | 5)
+#define MT6392_PIN_2_RTC_32K1V8__FUNC_TEST_IN3 (MTK_PIN_NO(2) | 6)
+#define MT6392_PIN_2_RTC_32K1V8__FUNC_TEST_OUT3 (MTK_PIN_NO(2) | 7)
+
+#define MT6392_PIN_3_SPI_CLK__FUNC_GPIO3 (MTK_PIN_NO(3) | 0)
+#define MT6392_PIN_3_SPI_CLK__FUNC_SPI_CLK (MTK_PIN_NO(3) | 1)
+
+#define MT6392_PIN_4_SPI_CSN__FUNC_GPIO4 (MTK_PIN_NO(4) | 0)
+#define MT6392_PIN_4_SPI_CSN__FUNC_SPI_CSN (MTK_PIN_NO(4) | 1)
+
+#define MT6392_PIN_5_SPI_MOSI__FUNC_GPIO5 (MTK_PIN_NO(5) | 0)
+#define MT6392_PIN_5_SPI_MOSI__FUNC_SPI_MOSI (MTK_PIN_NO(5) | 1)
+
+#define MT6392_PIN_6_SPI_MISO__FUNC_GPIO6 (MTK_PIN_NO(6) | 0)
+#define MT6392_PIN_6_SPI_MISO__FUNC_SPI_MISO (MTK_PIN_NO(6) | 1)
+#define MT6392_PIN_6_SPI_MISO__FUNC_TEST_IN4 (MTK_PIN_NO(6) | 6)
+#define MT6392_PIN_6_SPI_MISO__FUNC_TEST_OUT4 (MTK_PIN_NO(6) | 7)
+
+#endif /* __DTS_MT6392_PINFUNC_H */
-- 
2.43.0


