Return-Path: <linux-gpio+bounces-35954-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AiaGO/M9GkDFAIAu9opvQ
	(envelope-from <linux-gpio+bounces-35954-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 17:55:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2AD4ADC65
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 17:55:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB1103016F0D
	for <lists+linux-gpio@lfdr.de>; Fri,  1 May 2026 15:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E7703D6465;
	Fri,  1 May 2026 15:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="tNcg/P1P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62B23D3334
	for <linux-gpio@vger.kernel.org>; Fri,  1 May 2026 15:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777650877; cv=none; b=hZKpo2m+wnwoEfaI8NbXJ1MJSrxedtaLhcEq3nqlAi7mH4Xb1ty3srI9VksO/Bp0S1A/AE1u8hfCuWhtpgwROKxGueKHvj3/pilK/j1PyZtxiINGubVOF4onbZvtja7OV8zWBqqAEDYQ3pokMDzkZzVwmAs/bXIzU0mKKirXOfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777650877; c=relaxed/simple;
	bh=FecQt5wh6wqUypR7GIOTL8vQl1Ce+BG0nyhOWnwbzHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IvGvduVkjH+I4Gx6Jq+y4FPJJxRZhfgp0UuWlK0bX9hvMuH4LM3NH4ozan6O9jNBr5ujj75ZFqy8a2Tswy0EDVV9Exq297H2kVzd1u/HjsAUTyIi2u2CHkSupg9FVmY2Secla3/80ayp4D3SRy2097SIUa44Omui2KbP6VYVcHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=tNcg/P1P; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8a08fa355a1so28894636d6.0
        for <linux-gpio@vger.kernel.org>; Fri, 01 May 2026 08:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777650875; x=1778255675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HU0BdifEzvMmdb0M7vix3Brd2gKsWcYWwUTy3bx7+E=;
        b=tNcg/P1PC+kwjWrj+0nDkm12iH83g+0LHIXYlZK9eJvfzDn6Fbx2ejBpmXkXWEbJzi
         dx/ij0rAWyHvUW4t3j57Lz9to9iqAvr7Kb/rbWAmZSR604/Wh4NQ14zcJxh0t8PSpdhr
         3TsOZJxn6w1Hy0Vgf6LaQdO8Ce7xKOmPUzRYOHsuj99wMrM2L5S2Q5VhreaIDRppxEG5
         xc0C8J9QL3TlM9akv6ha8pEaXilam+JPmyVG2IZP/Locgn5ZauqbTgbhqbKPDMkbQZye
         qqpYKADzZgQb2uDeCn6UUt3OSuUNzwKqW3z5MrQEo/NxhQdC7jeVuUqna/uqMsmHIqZ2
         mhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777650875; x=1778255675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/HU0BdifEzvMmdb0M7vix3Brd2gKsWcYWwUTy3bx7+E=;
        b=ZFbFIvoJNQKEjoy78+8R3iNRIzyZIXkB9bdKcNVCFSUEDG+tXzyI4mUwwSYMQ7lllb
         3aFM+spe6McwU1/QGSUtncMJ/2N9rBbX0bwI5kryZ0AoDcJsH0DG6XlyQxwGV2Y8MMKb
         LIdbLdrRtUyL3TYUXOMlJXFoFnha+0Jcivgn8B/eav3QxDZNBy/tSaZcn3AQTFjUAuYb
         OnowPN4zIN8HaOk1kK5f19Mx1riVmrvKwB//tNhPkDgLpJYZRExEvS6IHxesLfhTp48E
         3184URTOTkhVWx+SYODmUrNJQtCusc2LTAEO+NnQVyRCu0Dl9q/SRRUqSbvO9ueWhSds
         29tA==
X-Forwarded-Encrypted: i=1; AFNElJ9jFrhXKJeY34aV/+C4gHXPtIhxza2YmMlMBfxN5LXHurhoPg5vWK+RmNLs9sMh1xL8N9OYUAcRlDbX@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrt4pHn/JBtv4QRVU5/AvvW5x2JLDK3FK5kIFeu6cHczV/5GbV
	e424SFXANm2GGnqVx++I4MaC+odsbi7gAtc2STgHZ55Zoadxm7i87Jd7Wll6lSLp5Ck=
X-Gm-Gg: AeBDieuBvjujDLCUbrfC8IdWdJ8DZzibwsKdeQOxsTNvn85aQqAVSy80ZgBU8BpXTRe
	YtdaOOp+oJ3qBowoA/1Cl7HcvknLtBblPpL9knGQC9WWEHvDcg5Uv4coG3flJVCnPOahkkQ+pcj
	c7FZi6put4ZfzGdrMnpVGTq2nbg+4HcmcCs+fpoInBHKrq5GnTot8IL91UJ4nnKcC0iRk8C0B1d
	nckcGwZLBgjbR0ybYrleMDDfbl1xpMxfCITZ5RI5ZuAcBLMr1FddnSn4xc7Lj3GbrgqxQgHZtPQ
	2m/VUWVcGuJYjktKbNKXRbZrAfNz9lMTpHu4435lH7O09SkF973pMmILccw9SMTh+LUGVqG04R2
	fjsi2lD3dnxtjiBC6+3ode83pmPWzixdI1CFoRbePk/bvHKJ1uubgpDg3uJ8OC+VKu3kP+21tRJ
	jz2tpNo+jq0r5iRmD22YYCphw3+NpTkha1kNeTrgob43IlVHxdRZkxTLa88S4KKvbH9QUYdu0SL
	Kk9e++UvGlVWvo4
X-Received: by 2002:a05:6214:3d9e:b0:8ac:b63e:72eb with SMTP id 6a1803df08f44-8b6660063bbmr1282856d6.12.1777650874598;
        Fri, 01 May 2026 08:54:34 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b539aa7293sm26615406d6.22.2026.05.01.08.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:54:34 -0700 (PDT)
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
Subject: [PATCH net-next 02/12] net: pcs: pcs-xpcs: select operating mode for 10G-baseR capable PCS
Date: Fri,  1 May 2026 10:54:10 -0500
Message-ID: <20260501155421.3329862-3-elder@riscstar.com>
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
X-Rspamd-Queue-Id: 3E2AD4ADC65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35954-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:mid,riscstar.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

From: Daniel Thompson <daniel@riscstar.com>

Currently the XPCS found on Toshiba TC9564 (a.k.a. Qualcomm QPS615)
is unable to operate at 1000base-X and slower with a PHY connected
using SGMII/2500base-X (in our case a Qualcomm QCA8081).

The problem arises when the XPCS supports 10Gbase-R. That means that
the reset value of SR_XS_PCS_CTRL2:PCS_TYPE_SEL (0) is valid and this
suppresses the modal switching based on bit 13 of SR_PMA_CTRL1 or
SR_XS_PCS_CTRL1.

The reported XPCS dev ID on a TC9564 is exactly the same as every other
XPCS supported by the kernel so we can't use the dev ID to automatically
determine what operating mode to select. However we can use the feature
bits in SR_XS_PCS_STS2 to detect 10Gbase-R support.

Rather than introduce a quirk let's attempt to solve this generically by
setting SR_XS_PCS_CTRL2:PCS_TYPE_SEL to a reserved value when we detect
the right we detect the right combination of phy interface and XPCS
feature support.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/pcs/pcs-xpcs.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index e69fa2f0a0e8d..b2c84b7e1e113 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -747,6 +747,40 @@ static void xpcs_pre_config(struct phylink_pcs *pcs, phy_interface_t interface)
 	xpcs->need_reset = false;
 }
 
+static int xpcs_config_operating_mode(struct dw_xpcs *xpcs, int an_mode)
+{
+	int mdio_stat2, ret;
+
+	switch (an_mode) {
+	case DW_AN_C37_SGMII:
+	case DW_AN_C37_1000BASEX:
+	case DW_2500BASEX:
+		mdio_stat2 = xpcs_read(xpcs, MDIO_MMD_PCS, MDIO_STAT2);
+		if (mdio_stat2 < 0)
+			return mdio_stat2;
+
+		/*
+		 * If this XPCS supports 10Gbase-R then it will be the default
+		 * which prevents 1000base-X and slower from working correctly.
+		 *
+		 * Why are we writing MDIO_PCS_CTRL2_TYPE + 1? We want the modal
+		 * behaviour that comes when we pick a reserved value. XPCS
+		 * allocates extra bits to this field and allocates values from
+		 * 15 down so MDIO_PCS_CTRL2_TYPE + 1 is the value likely to
+		 * be allocated last (and hopefully never).
+		 */
+		if (mdio_stat2 & MDIO_PCS_STAT2_10GBR) {
+			ret = xpcs_write(xpcs, MDIO_MMD_PCS, MDIO_CTRL2,
+					 MDIO_PCS_CTRL2_TYPE + 1);
+			if (ret < 0)
+				return ret;
+		}
+		break;
+	}
+
+	return 0;
+}
+
 static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
 				      unsigned int neg_mode)
 {
@@ -919,6 +953,10 @@ static int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
 	if (!compat)
 		return -ENODEV;
 
+	ret = xpcs_config_operating_mode(xpcs, compat->an_mode);
+	if (ret < 0)
+		return ret;
+
 	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID) {
 		/* Wangxun devices need backplane CL37 AN enabled for
 		 * SGMII and 1000base-X
-- 
2.51.0


