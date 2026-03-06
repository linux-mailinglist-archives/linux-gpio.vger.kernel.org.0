Return-Path: <linux-gpio+bounces-32632-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PH0K4KIqmmjTAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32632-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 08:55:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 166D021CAB5
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 08:55:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70BEF3023DC4
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 07:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A80A93750D7;
	Fri,  6 Mar 2026 07:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="Fl+14SCU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B09370D6D;
	Fri,  6 Mar 2026 07:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772783729; cv=none; b=YcFzR1US0w6xxRTFWuWwotbqBg+UvEJY3acfkc0IlCpDvEpJUcaIcxt8AR+cBwrz0ZNLeuwdXe+f/ZbIa2DaAosWSMHmX0lWAsbLWAPs8iYiVaUlx8xq4whqhpeQIdLpxtIJoAwzZrs5tKAEtyQZcqVsuT6pPW4ex2EyZ4N2pX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772783729; c=relaxed/simple;
	bh=qx1+0/Bp/AKY+5X6DCWqAFbW7tmmELNPUi5FSKLFprU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nkV7FQdrz75iBdIhavJgtrlDLLqtShI11e6aKH5mM01h3SLAtYpYwXTQ9mtiT5GY8/z81oiB0MLtDfieBgQP2cgwE/+4ptH+CGWR+hD98DNYTlA3LUC+Axwf0PMnLUyvS8TM0ibL2+MO5meN6kLCU5WJP/ddJCbU95hO9jg2sMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=Fl+14SCU; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6267qj9wB2977150, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1772783565; bh=l5rvWd0k2xpP7GL97y96percGRFgA2G16AsJIxxaO0g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=Fl+14SCUX4qeSoxNLeKvmSeIiXqa5YjA9AScfEspNMUm5alqg9IVd/foQd0gvbEit
	 iRv7HxH95NZ8lZG8ZRCs6Hnm9nMwsv3rYqUzbiFN0HnBp7B8Cvl+ODjHC7YAhr+sGq
	 /kejLo04/CTNlEj7Pj2gH848rV80yrz/ql5SSQ/qKggQn8Umb0+VnUbTFe28WP3Sig
	 FB/3R7km+PWcFFfEhw05HE0yYmBM2iD+S3cqRARYAlzafrN987UeXVKt2LasCRdsJp
	 4bYHKX8q4yEY6VtBuJIov5NoqsIEahMqUvu253EmxAXpnCwPoZcBFTCFZT54m2ZxZ7
	 5V1algWrM4+pQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6267qj9wB2977150
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 15:52:45 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 6 Mar 2026 15:52:45 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Mar 2026 15:52:45 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <bartosz.golaszewski@oss.qualcomm.com>,
        <afaerber@suse.com>
CC: <james.tai@realtek.com>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
        <tychang@realtek.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v2 02/14] pinctrl: realtek: Fix return value and silence log for unsupported configs
Date: Fri, 6 Mar 2026 15:52:32 +0800
Message-ID: <20260306075244.1170399-3-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260306075244.1170399-1-eleanor.lin@realtek.com>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Rspamd-Queue-Id: 166D021CAB5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32632-lists,linux-gpio=lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[realtek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Tzuyi Chang <tychang@realtek.com>

Treating unsupported configurations as errors causes upper layers (like the
GPIO subsystem) to interpret optional features as hard failures, aborting
operations or printing unnecessary error logs.

For example, during gpiod_get(), the GPIO framework attempts to set
PIN_CONFIG_PERSIST_STATE. Since this driver does not support it, false
error reports are generated in dmesg.

Fix this by returning -ENOTSUPP and demoting the log level to dev_dbg.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v2:
- Add Bartosz's Reviewed-by tag.

 drivers/pinctrl/realtek/pinctrl-rtd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index eafa0d7bb19d..41e7f5c2bf74 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -456,8 +456,8 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 		break;
 
 	default:
-		dev_err(data->dev, "unsupported pinconf: %d\n", (u32)param);
-		return -EINVAL;
+		dev_dbg(data->dev, "unsupported pinconf: %d\n", (u32)param);
+		return -ENOTSUPP;
 	}
 
 	ret = regmap_update_bits(data->regmap_pinctrl, reg_off, mask, val);
-- 
2.34.1


