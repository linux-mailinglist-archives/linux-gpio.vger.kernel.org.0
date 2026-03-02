Return-Path: <linux-gpio+bounces-32379-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCPICARepWkL+wUAu9opvQ
	(envelope-from <linux-gpio+bounces-32379-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 10:53:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A771D5CD6
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 10:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2658E3009E1F
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 09:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24EE33939AC;
	Mon,  2 Mar 2026 09:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="cCaz4vQa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010A438F65B;
	Mon,  2 Mar 2026 09:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445126; cv=none; b=ghzb8kxeACZvr6cJwOJ2ve0zoKMKzu8doAnhDzCB2ib2FsuCMeHukqD96Xpkg97hjJiiMJnRf2uopMxpJmYGOXQ2Ccz7YRLd0kry6ItsDVz7xTv1WaK73DR86lnGP0PUfI8k92y+Wgw/VN/oqlY8eDgz6nZsSrQdTKo0so9TtAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445126; c=relaxed/simple;
	bh=lKoF/wcHDIjNaYmYBLQBoVUwBC9gPMzuq7kD/juQ81s=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=uN3AZaRrEaUv4+4n9Rs+0owhZwdbnKXUJU2VDYFcLPotTElh8Uf6C7+tmB2aAbnQ1JvNlxwq9QJROpYEvjcqkJuomGCFBkHdfeWzU5pRqwV8yubLp2vR4mCBB4RuDFXDGbQ0Zx+sT4L7+meZ2JSIF+MfMukDPPiKS+iNjqRKSpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=cCaz4vQa; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1772445114; bh=DudSbMsg3N5XTgGas95Iv9I8hs1PbVkuMzNhI+MXRZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cCaz4vQaj0/EeJIHwIv3PLtjolHKngAnFVWpQRtjU7hb0JOdiSBX+WKeAj1S1doqZ
	 SIvqfSQv49Pr6U9xd3NXt6We7zB9HVReT5fLwfipQU+8s9Cc5YGQHtJ05OazwWIHxz
	 0Q4wVA7fuDAoOLFpJ/hGl/ze1Mi5HO5ci7+12GcE=
Received: from WIN-B62RPRBL2BM.localdomain ([218.76.62.144])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id CEF2F43C; Mon, 02 Mar 2026 17:51:47 +0800
X-QQ-mid: xmsmtpt1772445112tgixxzezd
Message-ID: <tencent_C5AC554BD66AA42D2165B044CA4EF1CC8D0A@qq.com>
X-QQ-XMAILINFO: OUycJhUUya+/hFky0sKC0DCZA0tbHo3qSAT01aWYYL/ACvFrY4a8DUevvSsvnK
	 b6vTrgNHbUa71N5HXeTYvkTmcHhfYRGcj1HLAP7XJ92aHiUbS1fBMgcJY1szjAp06j5qz4tDZcqv
	 OcuqyTjGJDZEPY5cxxg8Q9S+oimYbBGC6yuwr41oXU+aWDW1R14HrQeA4Tvm5ISwHJgUQ9B1YhIb
	 Tt0w52DBZYTsauNHFxg2xTC11OTSMOk7B8ro9oMNPPRDaDMbSepyxitWnHO/b0fRpzSlvqfElMzm
	 QmEhp5jw9/SpCSAbdPQAGBmzmFmLlhapWdyaXzjCnMHnZI/dxeOA9NDzK/5RZ4rU9mEX5xKrtJ/4
	 Eup+foITnNInC6m09ZUi26nwJbGAjJ4//1i5wYl4BNTiT/68NXIL8W17W+pAHXFAC/VRUJy1frnp
	 MqKbQf76PjQrY3Qu6qHgtJjHU4ElYK9VvmJyJfIRkmPcla9AEz1wvvqL3CFM7gM3HmauQOi9GWdG
	 FtHnPC1ds48ALW+j2CGspJU4lfF2XQTxNHt6KkMlOWhFk0//pXaCcxBdU2OrGVCATcUNt5yrxgxA
	 OtX9s50z9848FE+1UjllhInwJwbUlYIhRkCWV/st89LVBbkwcHx2WFM6m3bozME11PMtmJfbdLD4
	 JUy0GjPG5cPlofkpe4ZQrID5P+2z7/CnxU1VBl5VWyoTJLZd+KXahR9m9HFZERcVRAnXaOI1wvRW
	 sQYIEVR6w4/5MolZAgivwW0R0RvFKgiV5XJFy9d/oDhcAyjvfXactMpUqIShbOqT4qQ0wt4WkD3q
	 1Y29neQYwtUo23OjntrNDR7pKjPLuFud4+a10F7deEd5EEXI66/jp5U2cPWoKvQjZWnPqRDVC98s
	 jvUpv6m4N0RM+YwKDhWWCq+ZxG+MWGYWnV6niiO7I+/fOzG2rFASQ2cRTkurLMhCJ2rRiEToenzv
	 CKWV5oDy1F+tC90ifmxYOdgD1pCrtK6tqvuOV09ns1RUDV0tkpVFovSs34Q+ftyQbbKDPS9vJy6U
	 YSpcol2GcZXTAQ7VpWoGDrdwHoN+i18Zh2XMzltg==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Zhu Ling <1536943441@qq.com>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	andy@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	chenbaozi@phytium.com.cn,
	Zhu Ling <1536943441@qq.com>
Subject: [PATCH v1 3/3] MAINTAINERS: add entry for Phytium platform GPIO driver
Date: Mon,  2 Mar 2026 17:51:47 +0800
X-OQ-MSGID: <20260302095147.2483-4-1536943441@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302095147.2483-1-1536943441@qq.com>
References: <20260302095147.2483-1-1536943441@qq.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32379-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,linaro.org,bgdev.pl,kernel.org,phytium.com.cn,qq.com];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[1536943441@qq.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[qq.com];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,phytium.com.cn:email,qq.com:mid,qq.com:dkim,qq.com:email]
X-Rspamd-Queue-Id: 27A771D5CD6
X-Rspamd-Action: no action

Add maintainer contacts and file patterns for the Phytium platform
GPIO binding and driver files.

Signed-off-by: Zhu Ling <1536943441@qq.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 61bf550fd..164553f86 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10963,6 +10963,16 @@ K:	(devm_)?gpio_(request|free|direction|get|set)
 K:	GPIOD_FLAGS_BIT_NONEXCLUSIVE
 K:	devm_gpiod_unhinge
 
+PHYTIUM GPIO DRIVERS
+M:	Zhu Ling <1536943441@qq.com>
+M:	Chen Baozi <chenbaozi@phytium.com.cn>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/gpio/phytium,gpio.yaml
+F:	drivers/gpio/gpio-phytium-core.c
+F:	drivers/gpio/gpio-phytium-core.h
+F:	drivers/gpio/gpio-phytium-platform.c
+
 GPIO UAPI
 M:	Bartosz Golaszewski <brgl@kernel.org>
 R:	Kent Gibson <warthog618@gmail.com>
-- 
2.34.1


