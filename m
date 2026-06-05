Return-Path: <linux-gpio+bounces-37974-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6OJ7IGohImpxSwEAu9opvQ
	(envelope-from <linux-gpio+bounces-37974-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 03:07:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E4364442B
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 03:07:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=riscstar-com.20251104.gappssmtp.com header.s=20251104 header.b="P5NRH/k4";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37974-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37974-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=riscstar.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FA803078369
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2026 01:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB9830C168;
	Fri,  5 Jun 2026 01:00:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C8D2E1F02
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jun 2026 01:00:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780621250; cv=none; b=D1KrcYoOMIipR77lb7N36QI1ZGG0ZtHhODmtUh7j2OHYxkVogpomFHmjYFG4Qc5IM5se2r2g1FIj//bONs4KRI1OieEt/Af9ovaqTPkvGdm6fJea40Jb7u5zDswfevksQnXXvebEC5noVsM0twSMk9mivup4/fDNsycntfOlQbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780621250; c=relaxed/simple;
	bh=vMr4jxhlvuiWi2PyxKlVKNSh14l3upUcj5Q6o8aP3EM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O/LQWTLZ2/I/AS4XTVLwrnjoSxtn1jSQ1XY5JYRzb/vnmUx9c9MJnh1jhjX0wss0CzSFrxwDeHb6VjwchIy1eG7CTjEmplxXR+wlVqXaeiYwxTOYdg/eO8jwk7nuXkqkQs+ni4ZxgSvki14pHSyaaWgOkkfbhrgXNim4RJCVZME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=P5NRH/k4; arc=none smtp.client-ip=209.85.167.170
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-48650c78e09so564265b6e.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 18:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780621234; x=1781226034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJ+38FTwss9ygHui1gfTl6vP2WH2KcHiorJ0gzERMpo=;
        b=P5NRH/k4oh2qX2Mxdd1OGFpXE8cbMm9Qg67qkD9BjzDwrunKnD461+DMCBCtWg7XJ/
         ivuyG4zmFl8XBfqAxnaxlTVlEMaJtBNWUGgAa67ubcick5WLoapSlMULVLXbsoEejMPA
         njCAqnmHUNS1o6j9Fx6KW2VVjwH6iMltkcnVE2qwFnaK9GLCKMS3P2KGAdob0lqR7zH3
         lgJUTPMkTHsrLS/HHDuoYj7sI8Rs3Dph4OdadMmHO5J/P6DD1VbijV3LcEjizTlR18TB
         yirDWNylk12lGSdC0PxAFOZO+yP35qc9KFzPlDH2MFDG9FatFM4+NM++S0kNd/VnQu0V
         YkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780621234; x=1781226034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fJ+38FTwss9ygHui1gfTl6vP2WH2KcHiorJ0gzERMpo=;
        b=lTIt/mb8HuafJ3y6rZiwoSObIBR7KgXKCtHtRHuFdjyHWtlij1j7T0cQZlT2X9PQnW
         rX8oZvp8M6ehOn+evi1q4dl3//nxvT3/NS2LRawxkettHBVEH6ms1+qt5HH8xY3zuhXr
         bIAKOrpPthfV8O0c/b6jC9myKCSm3mAAVEsiW4BUqRKiPmyIHp++fl1Z4mrhw1WgNVNp
         qTViaL8oYYhsRTUJSFqdd8pVjcXGGHC7MNczJq8sZg30FNeSy6lS6727heaLY5dSetyZ
         VlqodQqX1Zhx+egUUbPEsP+oLEq/My/PHY7Soz7VfD3lURvxOiU6J2nkS++gHhcSa1lX
         NHWw==
X-Forwarded-Encrypted: i=1; AFNElJ/aEECp7c27Oj1ofkc9LsQuKkJVw6tuGY0PIXn5AOkdSveMREkoScEWZEdOsLyFnfITF+uc1IUgJ6Zk@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo3nb+wsQK8chD0S/uHnICU23gLfFWkIsHhO/YPCye37Z6T4QH
	JMuRqRB3HvXwVWD77q+zrJnGIPgcCYudhjVK9HWCEsq8/TLZjJ4+JpP/yBHdyxNEx9I=
X-Gm-Gg: Acq92OGmTF6sKLIu2ZQP0lR8h7PAckzDhEU6IQEojo+wPzOLRgIJJB+dbzDZ9y5uHQi
	lfbzqbJvlj8WR6aQFKnFZtgphRwEk4/ODrIzz4y1OeDhhKQmPnW4S4lxpA1Yxe75gGRFDBhwMIt
	gyTH2AuIAdAjPjYY25AXvrOmhOfOBpANMiKRjJnlNS1lO1sgNuqeMacgs+Rr1sQBcHW8WGN0yPQ
	Iymxb11NodL4WVPdDGvEn8MF+fSeyyJPKG4xwE3H05ajZZRUP2LVEx5v7Dkji9Soe4C8B5c+MqT
	Qsbq1OYurCqizam9C4Coc3wlRAV8SB4rBGpoC0UnbimQ18WDkdHPit7qftqaHDiQKQ6NatnS3EA
	cX4Drg9jIHic0/+RlfBTS0aqWxTkh/79gYw1WA7IoX/t3zDhrN7BLLBRD1E//RWMizhjvp3lYVQ
	4CGdKJtXYfl9e9jQelRvmbvUve5Oze7ZQZRsfUWQ==
X-Received: by 2002:a05:6808:1b25:b0:486:560d:aa9c with SMTP id 5614622812f47-4868dc63516mr816744b6e.15.1780621234618;
        Thu, 04 Jun 2026 18:00:34 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b6ec694sm5544631b6e.5.2026.06.04.18.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 18:00:34 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	elder@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com,
	alexandre.torgue@foss.st.com,
	ast@kernel.org,
	boon.khai.ng@altera.com,
	chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	hkallweit1@gmail.com,
	inochiama@gmail.com,
	john.fastabend@gmail.com,
	julianbraha@gmail.com,
	livelycarpet87@gmail.com,
	mcoquelin.stm32@gmail.com,
	me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	richardcochran@gmail.com,
	rohan.g.thomas@altera.com,
	sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 02/14] net: phy: qcom: qca808x: Add regulator management
Date: Thu,  4 Jun 2026 20:00:09 -0500
Message-ID: <20260605010022.968612-3-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260605010022.968612-1-elder@riscstar.com>
References: <20260605010022.968612-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37974-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[49];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:daniel@riscstar.com,m:elder@riscstar.com,m:mohd.anwar@oss.qualcomm.com,m:a0987203069@gmail.com,m:alexandre.torgue@foss.st.com,m:ast@kernel.org,m:boon.khai.ng@altera.com,m:chenchuangyu@xiaomi.com,m:chenhuacai@kernel.org,m:daniel@iogearbox.net,m:hawk@kernel.org,m:hkallweit1@gmail.com,m:inochiama@gmail.com,m:john.fastabend@gmail.com,m:julianbraha@gmail.com,m:livelycarpet87@gmail.com,m:mcoquelin.stm32@gmail.com,m:me@ziyao.cc,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:sdf@fomichev.me,m:siyanteng@cqsoftware.com.cn,m:weishangjuan@eswincomputing.com,m:wens@k
 ernel.org,m:netdev@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:conor@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,kernel.org,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5E4364442B

From: Daniel Thompson <daniel@riscstar.com>

QCA8081 appears in embedded board designs paired with GPIO controlled
regulators for its power rails. Add logic to allow these regulators to
be turned on during a probe.

In order to avoid the complexity of tracking state for suspend with and
without WoL we take a tremendously simple "always-on" approach to
regulator management, essentially relying on BMCR_PDOWN to conserve
power when the phy device exists.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/phy/qcom/qca808x.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/net/phy/qcom/qca808x.c b/drivers/net/phy/qcom/qca808x.c
index 8eb51b1a006c4..fc3f2cf2e55d0 100644
--- a/drivers/net/phy/qcom/qca808x.c
+++ b/drivers/net/phy/qcom/qca808x.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 
 #include <linux/phy.h>
+#include <linux/regulator/consumer.h>
 #include <linux/module.h>
 
 #include "qcom.h"
@@ -178,15 +179,44 @@ static void qca808x_fill_possible_interfaces(struct phy_device *phydev)
 		__set_bit(PHY_INTERFACE_MODE_2500BASEX, possible);
 }
 
+static int qca808x_power_on(struct phy_device *phydev)
+{
+#ifdef CONFIG_OF
+	static const char * const regulator_names[] = {
+		"avdd18", "vdd", "vdd18", "vdd125"
+	};
+	struct device *dev = &phydev->mdio.dev;
+	u32 count = 0;
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(regulator_names); i++) {
+		ret = devm_regulator_get_enable_optional(dev, regulator_names[i]);
+		if (!ret)
+			count++;
+		else if (ret != -ENODEV)
+			return ret;
+	}
+
+	if (count)
+		fsleep(phydev->mdio.reset_assert_delay);
+#endif
+	return 0;
+}
+
 static int qca808x_probe(struct phy_device *phydev)
 {
 	struct device *dev = &phydev->mdio.dev;
 	struct qca808x_priv *priv;
+	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
+	ret = qca808x_power_on(phydev);
+	if (ret)
+		return ret;
+
 	/* Init LED polarity mode to -1 */
 	priv->led_polarity_mode = -1;
 
-- 
2.51.0


