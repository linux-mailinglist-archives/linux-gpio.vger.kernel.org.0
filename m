Return-Path: <linux-gpio+bounces-35955-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFaQOzrN9GkDFAIAu9opvQ
	(envelope-from <linux-gpio+bounces-35955-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 17:56:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABFC4ADCC0
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 17:56:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9BC52301A140
	for <lists+linux-gpio@lfdr.de>; Fri,  1 May 2026 15:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C2A3D75BC;
	Fri,  1 May 2026 15:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Z5pLDII9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F411A3D3302
	for <linux-gpio@vger.kernel.org>; Fri,  1 May 2026 15:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777650881; cv=none; b=J3//Yhw3xDjzeT5fBFWymP8tqrEAofXClXo2wxbL4RP5wsB940YVxZ5Hm0h72oeRhEwo0r6OEoGmY7AQeGQb5xTBMbSVb+zd4bdfGoQqnIPtXBF6ZldiDSKC7ieXARLg5bwIOtyzemXJs9B6Jps5xahEb6Upo98W149Ix6B/lRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777650881; c=relaxed/simple;
	bh=vSMz0fMwD5nvE28rW2N/JHi9BJvlZF2OiadS95iYJ7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PfiX54s2+X7wJBGESm85ZGFnKaxNE4TLWErxJVjNT1hl8b8ursTjlXeW/Z1+M+Ba9NjuFhBPvOCpHnLry6m5S/wAW52W7WN5oSX2qKxh6TlpQvD4MGDUhiFH/SpoCPL9dB8ooNojeQkbOFPYw7QEVD0foD+iPjM2bcHngwkrAkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Z5pLDII9; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8b62ca1d28eso2336696d6.2
        for <linux-gpio@vger.kernel.org>; Fri, 01 May 2026 08:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777650878; x=1778255678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVr8Clh+n9i4UIz8+5GUPFBuftN5UkiMGfqWWtAa7So=;
        b=Z5pLDII9inAZIYRk3mHwRycVsXtkdv+tJIEvThfg1icNH8qCTRn+9tTfuMPeovkW7P
         aQyfaIEH442Fs0eM8ndBTO2CA74qq3PvbpncoYETsKlrO1XAZ+Aa/TUPukzfqc0z42dg
         bjLWAYawkJmCx/oTfbXnbGm1HowNQ1loVD+lWT9od8pPZFGuQmtJJn10620MKicg1cXp
         brPPS5wXGQWUUmaMzR8555yBCFcstfLYTEsZN6RqjSP+ev8ympE/3h8ThKfQfkvZoZ9G
         nHyRUL0Afm51WMx/9vtY0l+lbCP7perMn1H3HIk+UUBm8ab9lrekzEb3fdpREmkWP5Y+
         4C/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777650878; x=1778255678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aVr8Clh+n9i4UIz8+5GUPFBuftN5UkiMGfqWWtAa7So=;
        b=H9TzJj19qDh1sb4s1UFUpCcwBPI0imzyvlHq/dLKpWgXbDvakqTJe+bS3RXbd+mezH
         /+rduvF+FqeJLqnD0lIajmew6HUGpcIAldqjVsx69mF9nOY4JylKVDdYaEnqKpbtT/tS
         Z+3ylfmD5vT0+SIVhO/QKXJ+NYQaeRX6/7u07QH/wIPCZC4NYslQAKO+rSsPi2LtumGo
         lVt8mtINXH18rbpgTfK0Y9CXOX6NzJ0D0i9cQqDbLte5U2F1u7NWveiK+r6Uva8XKv8s
         gZorC5RSwEIx3j47N5XtYuSZEwZsYGpmkLF8+nELzUXfC+HOyhfJsMtvsCP/CFENkY0c
         MC8A==
X-Forwarded-Encrypted: i=1; AFNElJ+4G7AAQYmMUX6255tKv468DcryM3RdDJD+aX1f50VUTibO24IV9dMhZetG74u9mFSaq17QwmyQencv@vger.kernel.org
X-Gm-Message-State: AOJu0YxhphIWJMwdbxHs+7Pe8Hr/tqGixkE80mkT+4c8PujwgbG/2gAt
	DyVXZLueP+dHL/dSx/rEpSfv8ZUcZB3vs0C+kNgh8N+MXHZJpm0u0FXuuEjONWE2svc=
X-Gm-Gg: AeBDievH/3M5xNMcorhSE8oV0pgpbI+AVLOQsw+wG5uz5kmy0Tsjk8d5xthjUjynxYz
	6sZovVl89+nuOzYTv793xIiwGTskEFje+upPd+79gr8FrdviG9cyMWhIW10Hswe9r4xFiOMPguu
	sfjzIRNGQ8rHT+Ki+AyWDQ6Vbz0AJDw71qdO/0gplmfbQN9Our7aLUwUkKFzJq+N+ANPCIk5w2Y
	+rOPDBxEOkkQEmT4w2nj0C7X53H6tIu9dfRJXjUPeIUJwx6KyWLG/a6yrsIvqqKJqioXojUUcgW
	Rx/yBUe8wrXGdyBFuy32effGV4lPWY+E2M2n/6sEbKGGhSLURekUGCTlKLQDEcEyhLmeQ3MPRf+
	VvSD0q9rhy7kmYxQG6T/9BK6VTqUHeMTcblOXLD71s3MlEv+Nt2Tz1i/u6Xb63BBE+qBTJWArLJ
	lxekVS69IxxN5FPpg8fFv5BwrjH4VU5AapzHxwZB8PsfPv5LKYWXFnN/q0sZVfnsAnoc8pFGbiC
	23MCA==
X-Received: by 2002:a05:6214:483:b0:8ac:bb62:fe4a with SMTP id 6a1803df08f44-8b665f02857mr1068856d6.5.1777650878062;
        Fri, 01 May 2026 08:54:38 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b539aa7293sm26615406d6.22.2026.05.01.08.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:54:37 -0700 (PDT)
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
	matthew.gerlach@altera.com,
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
Subject: [PATCH net-next 03/12] net: pcs: pcs-xpcs: Preserve BMCR_ANENBLE during link up
Date: Fri,  1 May 2026 10:54:11 -0500
Message-ID: <20260501155421.3329862-4-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260501155421.3329862-1-elder@riscstar.com>
References: <20260501155421.3329862-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0ABFC4ADCC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35955-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,kernel.org,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_GT_50(0.00)[50];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar-com.20251104.gappssmtp.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,riscstar.com:mid,riscstar.com:email]

From: Daniel Thompson <daniel@riscstar.com>

Currently the XCPS found on Toshiba TC9564 (a.k.a. Qualcomm QPS615)
is unable to operate at 1000base-X and slower with a PHY connected
using SGMII/2500base-X (in our case a Qualcomm QCA8081). The link
negotiates speed correctly but the MAC can't get any packets out.

This attracted attention to the ANENABLE bit and we observed that the
bit is currently set during config and cleared during link up.
Preserving the bit during link up allows the system to work as expected.

Perhaps I lack the imagination but I couldn't come up with any reason
why keeping the ANENABLE bit set would break things for other XPCS
implementations. Let's ensure link up sets the bit for SGMII interfaces.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/pcs/pcs-xpcs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index b2c84b7e1e113..1d62d5b31c61c 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -1263,11 +1263,14 @@ static void xpcs_link_up_sgmii_1000basex(struct dw_xpcs *xpcs,
 					 phy_interface_t interface,
 					 int speed, int duplex)
 {
+	u16 an_enable;
 	int ret;
 
 	if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
 		return;
 
+	an_enable = (interface == PHY_INTERFACE_MODE_SGMII ? BMCR_ANENABLE : 0);
+
 	if (interface == PHY_INTERFACE_MODE_1000BASEX) {
 		if (speed != SPEED_1000) {
 			dev_err(&xpcs->mdiodev->dev,
@@ -1283,7 +1286,7 @@ static void xpcs_link_up_sgmii_1000basex(struct dw_xpcs *xpcs,
 	}
 
 	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, MII_BMCR,
-			 mii_bmcr_encode_fixed(speed, duplex));
+			 mii_bmcr_encode_fixed(speed, duplex) | an_enable);
 	if (ret)
 		dev_err(&xpcs->mdiodev->dev, "%s: xpcs_write returned %pe\n",
 			__func__, ERR_PTR(ret));
-- 
2.51.0


