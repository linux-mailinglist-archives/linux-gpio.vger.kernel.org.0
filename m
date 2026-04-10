Return-Path: <linux-gpio+bounces-35008-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GZnNR/32GkYkQgAu9opvQ
	(envelope-from <linux-gpio+bounces-35008-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 15:11:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EE93D7FDA
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 15:11:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A271303BBE5
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 13:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D576A3164C5;
	Fri, 10 Apr 2026 13:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZzQizyou";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MObjb6NF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86391314D16
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 13:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775826316; cv=none; b=ZnZbYtpcUuYZ85yfwFLNNB7Rfwp145hgorqJyN7DAHnvhEUhYfXF/nWxyobQ9F/I19pCCEaa3uIkiLe7bXFf/ZECBZCGR4QrG8D1hdm7WaQ4xGvxHyIEfn4v5LM6NlAQv981pbHVTVl6wlWgHqr+3/Sn3VddISLS4emitExtHok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775826316; c=relaxed/simple;
	bh=v1WKkbTNzuGJnWXiDHEXgh523eXI61Yj4tEY2tsMGp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d+1lN5MNjVnOH9VDgSmNdRxkKVs+G0Q9jLg2DulEVrLVUBazWv/MH/aqKmVp3YnR3PqRBdkRuP4NpOPHV6rqBad7+/+2ge+vk5cQJIV+yprzXQINaCOD0J6zhQUaW1Gf/w3PycQSEATZ4yrbRDo+P/8v4IJGIcgY2gn9JPKPfhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZzQizyou; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MObjb6NF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AAjepo1925716
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 13:05:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ct0X104iLElKowYrfBtaaKUBw6k//aKWwwbkwbYnMlU=; b=ZzQizyouKxOj7eUR
	TrKLsJVmCHGzlHU+ObSntif3x+mSaifPmnUzHf9gtI5VkJL8Ab1uQRzun8W2uU7o
	CzDEPHLBdxHjqtuCtBSJ1qxhJqPHk5aebf+u2gXh/cVjaGkJaB8rTJEYQ/+sXgcF
	xTdVWMlwJmSSWvm0PaGE2GuBHU2SeYv4QoZs0pZsCcReMGn9P93C/G9xsfBGVt6d
	3vw2PXX6Yss35zeWSSSVP3uJKEq46EDaexAaSnYtBbiUMEu9YssdFcIJRMwxQfXT
	4c1+GbEbBErMt6L1FSE+2vY1Oph8+2AE25sbdw8LhNSe9MVc/00cRZ8JSis3CW9x
	GD/9tw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudjsey0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 13:05:13 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-68582ad07ffso1574469eaf.3
        for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 06:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775826312; x=1776431112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ct0X104iLElKowYrfBtaaKUBw6k//aKWwwbkwbYnMlU=;
        b=MObjb6NF6HZ91yYrnCm+SfTm+p2OAbgUcwRfABGWQpT/5eaMqxGBl3ZYnA6ddm+iB5
         oC8cU5SggGqZZhTyq9pQfPslC9SBLkfphmZhqL04fs1gnmlxBUSoMrQQzXVmCSF+GeqR
         YldKcR5VwGY1CxYx0h+EvnCkAmJD51ybIgIBT1V3cJilJkjL0kLr7/NCvIDYGP0IY3t4
         2tdI6qsFP5XcV8//UmxtKB4TBh4YfQR40ohuNlVV/JsnrPZy715k9AZWMdqW5EleWtLG
         YRV8M5N0KYBOistCA+NBQ6Rto+RbLHGqYbdptyG4I5wYrmtyVBc1I4a6asS1Z6fgMas0
         dQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775826312; x=1776431112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ct0X104iLElKowYrfBtaaKUBw6k//aKWwwbkwbYnMlU=;
        b=JZH0BwmkJ9qTV2lOI5pM0K4tNElBTLjPkml2IMPGTNKp6+I+qhqw1WGacfbwtNBaHa
         KnRxAWzezuIeQxLdBiZBNhNLUvsCxEqmxEBVv6ZLI+oChiWrdOQY6cOcGWrSkUd2KCRy
         mfiqDAkYYV0D4BgazASAxe58LKtslo0Pg1FzIDd4anLNUgPFXVist4no1JpCSOjraFOh
         c3QzySow2apytnwvG5MQq+K7gfuaxiWnCb7K/QqafWSfBcy1mJFDWHdwmYfZS6zzbIS7
         XhowHRWxVRAod7hId0APOpp4cUVdmGmqKfqWFNTBvLDoUA4yCBAdDqGE2uYO4lEN5mCP
         0vXw==
X-Gm-Message-State: AOJu0YyUj/qIY7Rl3vfvT1GddgETo0VL4xiHEWAJ3Q6aYTgJZwZ15Xcr
	oICOdsKHK8LaVlbSuNY6nT7BUt3Dhutgty8wlLj4ccYNE8IXHMtARzryEirUfA3GmHTr6xXEcia
	7Z3oFMlqLYt+bqeEFM6xPAiygutFYEocTihMMqmfQn9D2wsikiYfQI18xUj8mbjd7
X-Gm-Gg: AeBDietZz6YHTIgdMqpcN2fjGXG3LaTwLVC/8wif6nlwvb7rNC98mkpZqkhXiJpFPDF
	NLtMXumdjIp9hgjR56sIa0zXg2TQj1jx3x4GLtuuL07v6FhZ1FZQmtzZis+AuR5gOh2uP1qxzRN
	wyFt0UTzIa8rnx81wqH7kfX8BG84x0DaOGLV4UkRYw3NULTdHkAmVcUwGQdWawwvo4deLNGeGrn
	pFLF1Tu6ePH5PnQBcGMmi3my/m90U7X7JKTHHz+k63tvjvrtOQbOCGc/JpxObCHKz8iNesSflQU
	f/E9wlYsxsYXja+hJB5GhqoXgRqMMBF4TfQ+8PG5dEh5ivlcY9RmYJEoZxJYY6sbWFX6rCGvFjx
	xiftMiD/8PmNnPcUzjbZ6LgOj81MPDqEx9oSQ9Qc4UaXP
X-Received: by 2002:a05:6820:f031:b0:687:6b:9bf0 with SMTP id 006d021491bc7-68be596a68fmr1446330eaf.2.1775826312201;
        Fri, 10 Apr 2026 06:05:12 -0700 (PDT)
X-Received: by 2002:a05:6820:f031:b0:687:6b:9bf0 with SMTP id 006d021491bc7-68be596a68fmr1446257eaf.2.1775826311405;
        Fri, 10 Apr 2026 06:05:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec07esm7694865f8f.13.2026.04.10.06.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 06:05:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 15:04:58 +0200
Subject: [PATCH 3/4] pinctrl: vt8500: Enable compile testing
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-pinctrl-testing-v1-3-6f708c855867@oss.qualcomm.com>
References: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
In-Reply-To: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, Joel Stanley <joel@jms.id.au>,
        linux-realtek-soc@lists.infradead.org,
        James Tai <james.tai@realtek.com>,
        Yu-Chun Lin <eleanor.lin@realtek.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2546;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=v1WKkbTNzuGJnWXiDHEXgh523eXI61Yj4tEY2tsMGp8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp2PV7euszaR8Gmdeu5++cpU5XJM5Syz0Pg715P
 yY26qxUHTeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadj1ewAKCRDBN2bmhouD
 18LwD/9YC/NRlFpzIIOUW2EStYSQlD9cd/XeuabDzqY1gNQA8T17aTwNbQq0OH14Z1WMLxlw4Yp
 rsp6yQJuF9mktdynv+cNkpC25n89c4j67EtZPKLwaXxrc33sj5xJwvJyFG3WZvat+oBvT0cR8aN
 NAsQuKLXJq0+wwfHSscLf1an7safGGAV2YtpWFrmnQp01MYGhyLPa5xqieGQkl+sRlahFsHclvL
 fuxNm4+goyCx/WHPto5DeRzq0+qOjcnrHwKKlcc2yQm4BDzCBDv5S5IcwtpONq+RayvW6OH/mJ5
 qcKTv6yh2e5+uD4vjJERFPBeTfCb+pPaRvjaUo0LoiC3vhPOru14i4icXJPDkS0NukIQ/nn0UXl
 ljLdinOe92uAj+qPJlSTPJ7Dthgq04026rrtHNc7iOOKSI2UdBPOL9XR1v3F1KYXCe0pjHQQgXt
 BOyuyO27scgSZu0cr4UyIr5nCaBq7uyvbOtsP+n0Jxi/rq8YNL2+ExePu+aGxDPZmL9H73xgG9v
 tt/OnXPOR1KE371DPwvUXZbzlSNG99fkHTPnmtudI7Q0txM1x75FUkEXoPAdpmQZPcPwnBltiAj
 ONnypah+0Xgn8JpjmGCieqbU/2OyfXEDHs3/fEzwqZjpqxa9gh+Voz3oHvMDG0qjWpQD80BV4Nd
 4NWItbY3Vlp8e0g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=X+hi7mTe c=1 sm=1 tr=0 ts=69d8f589 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2GgY1jd2P1PdBW9LpxUA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-GUID: 8Jp1d1sHU6VqUYCHbYjyc9nAM-jcSNvR
X-Proofpoint-ORIG-GUID: 8Jp1d1sHU6VqUYCHbYjyc9nAM-jcSNvR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEyMiBTYWx0ZWRfX61ZvyPRL8QB6
 BeBN4UqU0W9bTE3WQl0LOnR2LE0ORRuPiovWsokpushHiFc6dmmoS7/kq7lTpwbkiQn83Jy4u0U
 q0Y8G8kVFe2UCtBTM+XbYVeBXQxyf1U+xRHRloty0z8bLUV9O1mDqAg0r+HhMqWZYj4/b/g4FcA
 fAZaZt/W+L7Yjaw1sUmoOH5EeCkJ9o0hvEXnSpMgforBwe8mynhBPFG3aWe8vEHhsscsr5vMqfD
 dQmE9hoElQe9913q2R4VvsIKJsbkYyDFmbaqG65v7oPrnWo/oppTSDpS3qFJAe8tReRwLychqkB
 9QtSA+Sym28++/uXwjOBqGhQg8RKVb1caoHgYiEvmgWJ9UhmcE2Zo1tJwwnWXF4NgCY/vR8/Gsq
 6WZbzXUzVWIs9zz8SNXsaqSSn8Xl71MEFDsmq4N9P005njFRXBeDw9uzu7lSLdH8wP5iPqI2JDN
 lRxpl7uXWBWUEXmcLwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100122
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35008-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D3EE93D7FDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable compile testing for Realtek pin controller drivers for increased
build and static checkers coverage.  PINCTRL_WMT uses
gpiochip_get_data(), thus needs GPIOLIB.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/Makefile       |  2 +-
 drivers/pinctrl/vt8500/Kconfig | 13 +++++++------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 9320ffae5f31..78135ee963db 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -97,4 +97,4 @@ obj-y				+= tegra/
 obj-y				+= ti/
 obj-$(CONFIG_PINCTRL_UNIPHIER)	+= uniphier/
 obj-$(CONFIG_PINCTRL_VISCONTI)	+= visconti/
-obj-$(CONFIG_ARCH_VT8500)	+= vt8500/
+obj-$(CONFIG_PINCTRL_WMT)	+= vt8500/
diff --git a/drivers/pinctrl/vt8500/Kconfig b/drivers/pinctrl/vt8500/Kconfig
index 2ca00b54b7a8..1a40c153a82a 100644
--- a/drivers/pinctrl/vt8500/Kconfig
+++ b/drivers/pinctrl/vt8500/Kconfig
@@ -3,16 +3,17 @@
 # VIA/Wondermedia PINCTRL drivers
 #
 
-if ARCH_VT8500
+if ARCH_VT8500 || COMPILE_TEST
 
 config PINCTRL_WMT
 	bool
 	select PINMUX
 	select GENERIC_PINCONF
+	select GPIOLIB
 
 config PINCTRL_VT8500
 	bool "VIA VT8500 pin controller driver"
-	depends on ARCH_WM8505
+	depends on ARCH_WM8505 || COMPILE_TEST
 	select PINCTRL_WMT
 	help
 	  Say yes here to support the gpio/pin control module on
@@ -20,7 +21,7 @@ config PINCTRL_VT8500
 
 config PINCTRL_WM8505
 	bool "Wondermedia WM8505 pin controller driver"
-	depends on ARCH_WM8505
+	depends on ARCH_WM8505 || COMPILE_TEST
 	select PINCTRL_WMT
 	help
 	  Say yes here to support the gpio/pin control module on
@@ -28,7 +29,7 @@ config PINCTRL_WM8505
 
 config PINCTRL_WM8650
 	bool "Wondermedia WM8650 pin controller driver"
-	depends on ARCH_WM8505
+	depends on ARCH_WM8505 || COMPILE_TEST
 	select PINCTRL_WMT
 	help
 	  Say yes here to support the gpio/pin control module on
@@ -36,7 +37,7 @@ config PINCTRL_WM8650
 
 config PINCTRL_WM8750
 	bool "Wondermedia WM8750 pin controller driver"
-	depends on ARCH_WM8750
+	depends on ARCH_WM8750 || COMPILE_TEST
 	select PINCTRL_WMT
 	help
 	  Say yes here to support the gpio/pin control module on
@@ -44,7 +45,7 @@ config PINCTRL_WM8750
 
 config PINCTRL_WM8850
 	bool "Wondermedia WM8850 pin controller driver"
-	depends on ARCH_WM8850
+	depends on ARCH_WM8850 || COMPILE_TEST
 	select PINCTRL_WMT
 	help
 	  Say yes here to support the gpio/pin control module on

-- 
2.51.0


