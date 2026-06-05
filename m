Return-Path: <linux-gpio+bounces-37982-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zAaaDmQiImq9SwEAu9opvQ
	(envelope-from <linux-gpio+bounces-37982-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 03:12:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D00E86444B7
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 03:12:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=riscstar-com.20251104.gappssmtp.com header.s=20251104 header.b=Zb7NREbT;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37982-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37982-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=riscstar.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EAE930B5969
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2026 01:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BFE382394;
	Fri,  5 Jun 2026 01:01:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958F432D7F1
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jun 2026 01:00:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780621275; cv=none; b=RL7D1T3ZrnmNE10Y4JcuTK+Q364d/6yN3pG8kAIZvsuUVMsQqnYL53Igb9o95mGqEbApHXSmf3VISWeByJV3GmfDa4tuioShlh7JTvrRF6pvaXPnf30v2pH4sgmFANVvXObHb59xa6buJzuCpUlsIQ3pN/oP3F81fn5Xq2QFjzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780621275; c=relaxed/simple;
	bh=Fl2vvfFimqS4GlpOM20DZtsfCLCrtWoZalqmHnKTKCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VaKf/HGa8NhI7jY0MMba6Y/AGVH4+YOpkzNCZbw3vedNKcZxnTUOoVE3eIFhqRjV2366yrwVs1g2fGa25h1gdVj0b7CogMVpQrYHz+O7bs3AVsIdyF7odj7c3ukan72hwrC1QghMWVM3nt3b02t1iHElhXzdUdyvQmuQNWM8Nq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Zb7NREbT; arc=none smtp.client-ip=209.85.222.174
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-9158fbaa4bbso172965485a.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 18:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780621251; x=1781226051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZkK5iRkM+bFu8r36hoA1oZzT41u9/qmzwRkx8FhOsM=;
        b=Zb7NREbTsV0iloEEKcCoJ146TTAbM54yV3o7UNyF5kVmUkzem6jQLorCNz5dyh60rj
         iU3Xe7Wcnn+yVEDW9gIOFHQQKIR2OEQLDvGKg8uKFARrXjxca8mQ+Og1KmVllVinW0qB
         el6Ms+cNtEcQYfdropZQEwfckgfEO+S/8wVahnA3RYnMPtqnz8u5WijMnkCdGay/0gOY
         VaowX+lWzL8D/vpcm16cCNL0SzWe7UW885PS2CkmYpQK+9UbsiPJvT1coL3EQhTXhIXM
         P4aJbkmmD/aZchnuG29BxihauyampCsciuSGXYfuRwb32++nyX5BGtIYAp9y8F1r1i0h
         I76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780621251; x=1781226051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EZkK5iRkM+bFu8r36hoA1oZzT41u9/qmzwRkx8FhOsM=;
        b=i6Vb/lHIftFlj/mIf3K8qK+ybw7SJx5T9owMQKl9GGFJCIOO3LkjXXCJt4esXwCray
         KWSdEtCatX2siWUvQkrh/bLVxXm32Xt7Yy7C6YWrwLVQ/wtyo5SmaCPHRp7E6VgTcPj7
         JRxNhHJH6IcP4qFr2a9jvds/5iMX+F4sho2uicrAR9OwJnGtjGp8HzMmnWF5z2PKLlDx
         xwcmO8iPw267SF1TQjf+I+IUPpshqqvDoFzew3cyH4qFfRxi240tikKGH8N/o1Z1QBoV
         iqUSiPm7vhgw+/IZ19ofc8uHXNbcs99KAV+wYO1WdqadVCg9I64gAbrro1WGNEejBbv9
         U5BA==
X-Forwarded-Encrypted: i=1; AFNElJ+4qMjCz3NAel3cZuD3om5Ozu56DKfmRjpV4tK6w1Gdo4DY+EQZbxjRfgnN/ZYSzfxw4EKA3tBGxaTK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9G84xxY6aaxml/yI7/XK1DrMJx3ux/iido6lEr9H/Ve8xrbo4
	CXZIDi9sKCO5ka58lthMePZcPl5rXyPZ0PM/QsYcb97N3pfZI7+Si45xQWQGZwygXe3FWUBIAK7
	i3WD3DxY=
X-Gm-Gg: Acq92OGgnG7WK/elxEjnksytEsAQ2+743nemPQIzICIovVNStfFUQ4Zuwzc8RNrAgak
	OS8XciUffiksKDurE+5qj9LuJQbt8xmrpb61Nq+gp4uYxMm5AlLlr7h/kfKUichcJuDgdmCkF1p
	oYeJivqQ7Cg1/QDjXIPeJTg6VFta/Q32O2e9zxH+HzIJTkFy0B0eL6hvp8iq25wqWMF8lb9ThE7
	Q1tzqtvXfIxkmKp6vzeBnB8tp976nedECG5DcrvgRXEq43FKY2o7EovslNxnsxl0nOYtDgFpSRZ
	EDpX0YcULyC4JpzspDa5603rbBkeTyfYkdRdm7u1zdGFaq71Vt7UhfMTnS/AwKy8tZ/Xk7ksoX/
	C63wLSxIokN+P8J0iO676v+LNkGKNlFahO14TqR11lgm0WhNgD6tx3WuVhcOAzILXzt3QdnHqXL
	CBcqlv2rnSqiVFoYbUd6tBWMxE+QaYfYwqBvHaaw==
X-Received: by 2002:a05:6808:1b0e:b0:467:5f1:fc93 with SMTP id 5614622812f47-4868dbe795amr869921b6e.9.1780621240655;
        Thu, 04 Jun 2026 18:00:40 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b6ec694sm5544631b6e.5.2026.06.04.18.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 18:00:40 -0700 (PDT)
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
Subject: [PATCH net-next v2 04/14] net: pcs: xpcs: re-order xpcs_pre_config() to update after the reset
Date: Thu,  4 Jun 2026 20:00:11 -0500
Message-ID: <20260605010022.968612-5-elder@riscstar.com>
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
	TAGGED_FROM(0.00)[bounces-37982-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: D00E86444B7

From: Daniel Thompson <daniel@riscstar.com>

Currently, on Wangxun platforms, the XPCS is configured during the call
to xpcs_switch_interface_mode() and, if the need_reset flag is set, the
XPCS is reset and the configuration will be lost. This is harmless at
present because need_reset will never actually be set on these platforms.

Nevertheless having xpcs_switch_interface_mode() on the wrong side of
the reset is an obstacle for future changes where wiping out programmed
configuration with a reset could be harmful.

Reorder xpcs_pre_config() to allow the reset can happen before we
switch interface mode. To make this work we have to hoist the special
case logic for SGMII into the parent function.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/pcs/pcs-xpcs.c | 56 ++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 26 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index e69fa2f0a0e8d..76c04372b5b50 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -705,46 +705,50 @@ static void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
 static int xpcs_switch_interface_mode(struct dw_xpcs *xpcs,
 				      phy_interface_t interface)
 {
-	int ret = 0;
+	/* Wangxun provides a full alternative implementation to handle quirks */
+	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID)
+		return txgbe_xpcs_switch_mode(xpcs, interface);
 
-	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID) {
-		ret = txgbe_xpcs_switch_mode(xpcs, interface);
-	} else if (xpcs->interface != interface) {
-		if (interface == PHY_INTERFACE_MODE_SGMII)
-			xpcs->need_reset = true;
-		xpcs->interface = interface;
-	}
+	xpcs->interface = interface;
 
-	return ret;
+	return 0;
 }
 
 static void xpcs_pre_config(struct phylink_pcs *pcs, phy_interface_t interface)
 {
 	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
 	const struct dw_xpcs_compat *compat;
+	bool force_reset;
 	int ret;
 
+	/*
+	 * According to the XPCS datasheet, a soft reset is required to initiate
+	 * Clause 37 auto-negotiation when the XPCS switches interface modes.
+	 */
+	force_reset = interface == PHY_INTERFACE_MODE_SGMII;
+
+	if (force_reset || xpcs->need_reset) {
+		compat = xpcs_find_compat(xpcs, interface);
+		if (!compat) {
+			dev_err(&xpcs->mdiodev->dev, "unsupported interface %s\n",
+				phy_modes(interface));
+			return;
+		}
+
+		ret = xpcs_soft_reset(xpcs, compat);
+		if (ret) {
+			dev_err(&xpcs->mdiodev->dev, "soft reset failed: %pe\n",
+				ERR_PTR(ret));
+			return;
+		}
+
+		xpcs->need_reset = false;
+	}
+
 	ret = xpcs_switch_interface_mode(xpcs, interface);
 	if (ret)
 		dev_err(&xpcs->mdiodev->dev, "switch interface failed: %pe\n",
 			ERR_PTR(ret));
-
-	if (!xpcs->need_reset)
-		return;
-
-	compat = xpcs_find_compat(xpcs, interface);
-	if (!compat) {
-		dev_err(&xpcs->mdiodev->dev, "unsupported interface %s\n",
-			phy_modes(interface));
-		return;
-	}
-
-	ret = xpcs_soft_reset(xpcs, compat);
-	if (ret)
-		dev_err(&xpcs->mdiodev->dev, "soft reset failed: %pe\n",
-			ERR_PTR(ret));
-
-	xpcs->need_reset = false;
 }
 
 static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
-- 
2.51.0


