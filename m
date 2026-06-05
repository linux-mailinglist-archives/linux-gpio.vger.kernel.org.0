Return-Path: <linux-gpio+bounces-37978-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jNv4LVwhImprSwEAu9opvQ
	(envelope-from <linux-gpio+bounces-37978-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 03:07:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A1B644423
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 03:07:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=riscstar-com.20251104.gappssmtp.com header.s=20251104 header.b=QmWrmb4e;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37978-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37978-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=riscstar.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BBD0230992B2
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2026 01:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD4C36E46F;
	Fri,  5 Jun 2026 01:01:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B228311956
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jun 2026 01:00:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780621263; cv=none; b=Ro5ukmIgoiL2bMg5Rz5woez/K8ZqSNYNE8wI+EIMlUcdReKckEh8q1dNalxhXQIOEKkdchYD9Sajxd3oepWG9h8bMoApzPf//o9+vnBPTmRsWth2ECXLbs5GGDyrwEyA6d30MU3QmWhK28ELz0gyRrv26MHuhm5x4lFUPqTN8x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780621263; c=relaxed/simple;
	bh=aIq/9ufivsXPLWgxyepAcfegpx7woiOwGaoVD2ffqhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rpm4zNMwikUJGFXDBJM2SYEG1Fv0F7HwsMS/uNL+1jrw7XdtTO5PR8b+DG9GRFawKETkbOJp7gYkfkhibcfPqtIGcFnRaZW7cFnUPhdun89KnvnQlTNLivKd5TI/2OLAbRi5ZMUrbvnwkIMlx78UTG3esSDscvCNcAy/METBSA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=QmWrmb4e; arc=none smtp.client-ip=209.85.167.180
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4854d5cc708so851979b6e.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 18:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780621244; x=1781226044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7RcozIfkgTb1ceMrXgVzxfNf3AdsB7YSa91tWGMELg=;
        b=QmWrmb4eZRkT7Iv6epdW6VuHDutBj+AaUBCXhADnZAOgqQCAHLeIuNF7uQssyG1l4o
         dqnkYsfbdOwTLsRXwSPfyK/+K+oKhjxTmRKe7Fy/T9QwyVidQoUp+A9D0BFgEVzNW7jS
         fg/xVrzCXhDgcQFeLYiKri3r+5Ojad74jLhNAx9DmOybe5ER4VZr5G79tuFBcdAdd/w+
         PAAxm6+NYHagd/Nz9AOpic3RHpGEvUBq3x2KT96pwtKKLgJbT5QoOqoTMN1nMwXORAkw
         zmwYYLr2OCaih3f0WZeF79iWTU3EDIYqYILZEhyf4QxbfMgh4BkLSivXzd81ZSqdcDl2
         hJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780621244; x=1781226044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d7RcozIfkgTb1ceMrXgVzxfNf3AdsB7YSa91tWGMELg=;
        b=Vn+Q55yamlL7La9ii3e9A/pR2e78wnbs1PdXtYA46hDJU/Uu19zcp2FmATbEoraUlj
         v6C/NHI85H0qMxwk1mVjDFwu4nFomt/Bt7PvE94LBJYd659LXrwX2CezChFkKuaYFGpW
         rdlZpwZet9fbsjf0ytlmUcULaCcs2ZwhyvY0rku8kOECA4ByHt8FtSH2RhV7+8zT+GHV
         SI0xQ2OwQAvhYk8EFtZEu9rqzrGypIcDivYQUvLExPEAjZQDaV+KgncGbZqyqu8xzwIT
         McoB+nBEZzswUW8pCjscayZjvHHSHSLWYuCpf49Yt6Xhl5l1S599Of28UHWCI+3plddN
         uH9A==
X-Forwarded-Encrypted: i=1; AFNElJ9g2p+Ur2MRFSZE3p4WmBHO6/apfyoCF2EUtBrqOd5mZs35puMCzWRR/PHgUmH6NZPLGR4nadXE6KUh@vger.kernel.org
X-Gm-Message-State: AOJu0YztsezitOxRmp4QZ/HldQwNSvN+3o/RoQCikhAq4GcuDf+kN+xH
	+GC55dKJ84OHMylm++0iBDkMI5jz7HH6MijOCnEZxM50EF247S9RjjILouZnNE97LiE=
X-Gm-Gg: Acq92OFvg01Y8iglBpYp6Gtto1t2NGog7Xj2rYjYg5LA/ARCeIRzlIWOFfu+G81js4Z
	Yei7xAyRHhxQ6rP6ngKtcnzmYEDlPbL+fqTDBZovsgprn8oVnTfHDDUbSBL5s1wP5EFIaItEPkz
	ocmw1EE31ws9Mz5LAoqh9HTpwv3we10qZTQB/PlIFaWCsowDsBlCUtVzNsvOxXh3v3K+NmuMntJ
	+gMA/ogdR/OUY0FbInyUXI6cXVoUdltZm5hih2JH8QqlS4/P0zb9aFGmbiAXWVV62CZHm5n8Ws9
	cimPAo0vA0Trj1czqtQnhwYFs+NvvKaw5Ms0xkzUslOSDa3lXhvUQei6NnwVEYUR9MXeE0ejvhf
	v79FJrhzLcbH02zRci5RB9ZAyuox2fxv2QOb/E28ZITsqKyXc83/87rQQRP+SLwGnErKxdyxvTz
	nXLf3e43YqWtAdCtrCLYDTDPp/8WdaaGNoOfmwdA==
X-Received: by 2002:a05:6808:a599:10b0:485:a99c:cfe3 with SMTP id 5614622812f47-4868df4dd74mr546927b6e.42.1780621243759;
        Thu, 04 Jun 2026 18:00:43 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b6ec694sm5544631b6e.5.2026.06.04.18.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 18:00:43 -0700 (PDT)
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
Subject: [PATCH net-next v2 05/14] net: pcs: pcs-xpcs: select operating mode for 10G-baseR capable PCS
Date: Thu,  4 Jun 2026 20:00:12 -0500
Message-ID: <20260605010022.968612-6-elder@riscstar.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37978-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56A1B644423

From: Daniel Thompson <daniel@riscstar.com>

Currently the XPCS found on Toshiba TC9564 (a.k.a. Qualcomm QPS615)
is unable to operate at 2500base-X and slower with a PHY connected
using SGMII/2500base-X (in our case a Qualcomm QCA8081).

The problem arises because this XPCS supports 10Gbase-R. That means that
the reset value of SR_XS_PCS_CTRL2:PCS_TYPE_SEL (0) is valid and this
suppresses the modal switching based on bit 13 of SR_PMA_CTRL1 or
SR_XS_PCS_CTRL1.

A fix for this behaviour is already implemented by
txgbe_xpcs_switch_mode() as part of the quirks for WangXun devices.

Rather than introduce another quirk for TC956x let's attempt so solve
this generically by setting SR_XS_PCS_CTRL2:PCS_TYPE_SEL to a reserved
value when we detect the right we detect the right combination of phy
interface and XPCS feature support.

The generic strategy adopted requires the default value of PCS_TYPE_SEL
to be 0 on devices that support 10Gbase-R. Based on TC9564 documentation
and the logic already implemented for WangXun I believe this is likely
to be the case for currently supported XPCS devices. Sadly I don't have
access to generic XPCS docs to confirm. However I think the benefits
of avoiding a cargo culted quirk outweights the risk of regression.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/pcs/pcs-xpcs.c | 39 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 76c04372b5b50..e58103ae8dadd 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -705,10 +705,49 @@ static void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
 static int xpcs_switch_interface_mode(struct dw_xpcs *xpcs,
 				      phy_interface_t interface)
 {
+	int mdio_stat2, ret;
+
 	/* Wangxun provides a full alternative implementation to handle quirks */
 	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID)
 		return txgbe_xpcs_switch_mode(xpcs, interface);
 
+	mdio_stat2 = xpcs_read(xpcs, MDIO_MMD_PCS, MDIO_STAT2);
+	if (mdio_stat2 < 0)
+		return mdio_stat2;
+
+	/*
+	 * If this XPCS supports 10Gbase-R then that will be the default
+	 * operating mode. There are several interface modes where this default
+	 * is unhelpful. Change the operating mode for interfaces were we know
+	 * the default is wrong, and restore the default otherwise.
+	 */
+	if (mdio_stat2 & MDIO_PCS_STAT2_10GBR) {
+		switch (interface) {
+		case PHY_INTERFACE_MODE_SGMII:
+		case PHY_INTERFACE_MODE_1000BASEX:
+		case PHY_INTERFACE_MODE_2500BASEX:
+			/*
+			 * Why are we writing MDIO_PCS_CTRL2_TYPE + 1? We want
+			 * the modal behaviour that comes when we pick a
+			 * reserved value. XPCS allocates extra bits to this
+			 * field and allocates values from 15 down so
+			 * MDIO_PCS_CTRL2_TYPE + 1 is the value likely to be
+			 * allocated last (and hopefully never).
+			 */
+			ret = xpcs_write(xpcs, MDIO_MMD_PCS, MDIO_CTRL2,
+					 MDIO_PCS_CTRL2_TYPE + 1);
+			if (ret < 0)
+				return ret;
+			break;
+		default:
+			ret = xpcs_write(xpcs, MDIO_MMD_PCS, MDIO_CTRL2,
+					 MDIO_PCS_CTRL2_10GBR);
+			if (ret < 0)
+				return ret;
+			break;
+		}
+	}
+
 	xpcs->interface = interface;
 
 	return 0;
-- 
2.51.0


