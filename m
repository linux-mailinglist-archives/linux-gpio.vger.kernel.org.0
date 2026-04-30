Return-Path: <linux-gpio+bounces-35923-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOzxD/5R82lOzgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35923-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 14:58:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F41A4A30D5
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 14:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 01DFC3008D34
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 12:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B2340B6ED;
	Thu, 30 Apr 2026 12:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RkF850Js";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TKh4v3PC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B651F410D24
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 12:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553863; cv=none; b=TMjc5bwyuamywc5f+QBtnXbPg6oUgiTKElEdIZI0jB1aRu3WFF537UWWsy9XzavdExXe71CZKQpdOqW/aYqfEXdUE59PFZ6h40nOIEIIUwEinSlmVbrQ+ZFFj8SZToy6fXiRitYXApCzE5tPETAfMFujGRn9SxC0tkZC65nsc4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553863; c=relaxed/simple;
	bh=sRwwAiKeMHyO5SvmHLhg3nZFiqSlWPc3/8KyY9B0WvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hMa76gxiYft9ztAszKw3dnsDSRztnHgitYIvBqCWRLoHCpjgRSICbjvvIurkNbCL7/2Nli93UywZp2o+f6xvBWJuWjJrv9WPTpl3LstTLkfW3VFjWxaWGgdF6g1PkjrmOwle9hwqe7lLmcsiRNtLPMmaSj4uf60GHPuRbkiHyPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RkF850Js; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TKh4v3PC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UBLk5Z256087
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 12:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HmmA37b9V70llXw40BdHRQqoaqXVueLY/PN1wGIlYwc=; b=RkF850Js7XMgA5Cu
	JNTjxIT3Hz4/1ZdSIO7YR6npi9Ugdx2ZFJD69rdNo0UGpszh6t65V6/5errE0FnF
	zRnb3/iWY2twpkmUG5dETg3kD1U4e0qE8AzXIoM1gmx1yvadiPDA5Y7Lnuykl+NI
	FaxVPiELBXMWFAwxbdjFG6wECZOdmW5L8/UK6eZk9CyLheQBf9n7XlsKZYYQi37I
	o5tjHeIM2ZTGy0fD7Nq+McWVnFMccyawBQzEc36ntg6yfHoGgTU+9YWD+orcfR8m
	s3hprkvrVdtp5oHCbLjcGDnPGxEakfRpF3eimqEvz1OfdBm9CTy/uh7EdwNWVkVR
	6BZe6Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dun71mcnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 12:57:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8ed08aa4so23534861cf.3
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 05:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777553861; x=1778158661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HmmA37b9V70llXw40BdHRQqoaqXVueLY/PN1wGIlYwc=;
        b=TKh4v3PCCitXz2ZUIJJHBqG5NeoKAI+yXbdF5ojw6237ltHOQYM5ohJ7pqBEPS36oM
         cIbixhJVWc8K0nZUCf6jxoz+S5xxHV4tsNgo0eoEFWlIQXHgAwt6UCC0Uq6SmLzngyJZ
         xb0L+4EaQqeEOqYmzgzH0s0xy1Qw3sgWeGfUShyRFfIjsXVWggMioCepH7blOllpspt8
         a3tRMeInjoiEHvVFfXFXzwMa8K1bG9vJVouzo8p5y5BUOhdrhteI067b1mgjvU6l6yxv
         glGZ09I4HOFW/yHUR/UMfNqCRwc2aSh9bumgbTPeHEGUW6PEx31hPxARyjybXW1nAql8
         8LNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553861; x=1778158661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HmmA37b9V70llXw40BdHRQqoaqXVueLY/PN1wGIlYwc=;
        b=FOgqpyD8ew4ie+HFsJbGgxxTqg1y7D0SQ4A71neQY7R9BIG8unYfXCjWKjttdGlNIf
         sJKOEqS/pLAB7ZOn0ZdsykBvPAViKSKO6PVlWLR/39RVm33TEy+iRH1l/iXwW0L5fj6X
         0UhqiYmRhThk526Mt6hWWzG5OjrOsGcIa7ajWqi8wRiEFkSFtvYgAqdKzPvoEItE2BoK
         lleDNL4DYkME4qprUAkD/HO9oqEC67IOsPp3Y6dM4WBLF4bZ8QEbIZARGXsa5wdo9ppl
         G+3KabxMLvsIi5OrSomUfMyIYIpttlvJuQLhDnbaMF4eIH1TOMl42JYuBCemgLi/llQ0
         4dhQ==
X-Forwarded-Encrypted: i=1; AFNElJ8RZElqH4qK0W5404bg99+ivMKJkfRkYAqKZSnv+zKGuQ4ZkgdGF/eafxmrMhYoa8SFWKJyj9vO/v3V@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo2e4s7iRJKDjKnnIpb5shPvbP5hgJw0B8IccT2+gzeCcl1AlQ
	D5L7b4t9Qmuv7z3ZS7WpEwMyF1lg7VwbpiU1kH9Z7MlCDDSYmQhwku2oxa3betYd8q2AIOwnQr/
	ii6DInmmTzuyPaT7s1tgmPBNNRW0VhrKzwfTY06jZvVoZ3Lf6DG/m4BJIc2coGY7C
X-Gm-Gg: AeBDiet8apvIbl8dJknhaJnL1+tAk+eyJfDhSws5nWxj4Q1PjCokXN88zcWSUTZpuV8
	4u2xx4aB5zMANaeKzQB35I9VXRk2sdg5VP7Fl/TBG6P9PEEKeZo9GkBSqVokJ9skRvDHzwphdM7
	RALvmr7LSO1hoF4J78/vSmM/Vrc+xVF1iN0xOOOAxuyeW2hXGrqbHsY34kXeDYeVL/KHK3ZA1ts
	q/G3QRl4zez7LjnC3zGqweejalLSo2/ed5SsbLvgOG3TC0o3mSRskcUUYUCtl4+999LVnvNDcOB
	0LkgoG+pY4pimQKVHc1QQIH7miVq0OBaHol9WxR4rNDR6BeEnt+CmwxhooX25zOHxT9nZXUdMI9
	ppaH6x1KEcLw6FgsYEC4/V5AaBAE1eZrPND2tjoJdsPqKoMUUUkFRApe6pXXnmA==
X-Received: by 2002:ac8:7f07:0:b0:509:4198:5468 with SMTP id d75a77b69052e-5102aad8c0emr39477941cf.8.1777553861182;
        Thu, 30 Apr 2026 05:57:41 -0700 (PDT)
X-Received: by 2002:ac8:7f07:0:b0:509:4198:5468 with SMTP id d75a77b69052e-5102aad8c0emr39477491cf.8.1777553860659;
        Thu, 30 Apr 2026 05:57:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:85ad:7a05:49a6:88be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c326873sm41899315e9.34.2026.04.30.05.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:57:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:57:21 +0200
Subject: [PATCH v3 4/4] ARM: pxa: pxa27x: attach software node to its
 target GPIO controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-pxa-gpio-swnodes-v3-4-5142e95f0eca@oss.qualcomm.com>
References: <20260430-pxa-gpio-swnodes-v3-0-5142e95f0eca@oss.qualcomm.com>
In-Reply-To: <20260430-pxa-gpio-swnodes-v3-0-5142e95f0eca@oss.qualcomm.com>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sRwwAiKeMHyO5SvmHLhg3nZFiqSlWPc3/8KyY9B0WvM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp81G7lsemaAhQGwp8DzE1EQtKgjLCcc03NHecV
 9KWPYXyr+6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafNRuwAKCRAFnS7L/zaE
 wyiaD/4osK/VCN1KShAl8KxL/e2Rzik59VUzrVYEeeA/Kxc7mzIwe1Fs+cVz+u4Q49XV+mNnPWX
 xSy1jgS1hhBTMlj/ykWCAGg8hH1VNTZv5HYy+60SZp2vNawMfqc3oHQKhSBurXskc3xzpCZqpy2
 f+1zZWTGEgt/+dvp3HN9JExqTmQP5YJblqa2PcFtM2rziR4tNhgBQYYychfUBUrrRzpDqvlwxuY
 CdpG0YKBCuvHgVHfiQHWI65rBVyGmiLZ4niVoOLzV9YwIjwVRh3J7zw+Ta1t1HjgSXFatsczHCC
 Fd5jijciQgFz9BBS4W7zOwqdY1FpUCyv1adWjYH7kfmvskygkI5Z1gogZ+pAkdv4MS7cTr5trNP
 J+gUZM5rKD8dYcxVj5PbazyJn2DPpuShYaQLdl3sHNGjaEScDBcldJmJjCR47unYykNDP7URFmr
 CXtsgBsKfSVwJ9pH6oHH30MnPjPYgn8OxktXdOxJzyacfM6oFC+/aS/l7KaNVfkIkZAI/byCkjq
 vgiIbbb4Q/U5nzUuBpij0xeAvrS71d2lYldDHEiKVJOrgaVGwhYoF0LuCrRfdAsarS7e+nCiLvG
 4ULFZJZVFg7afHnKKlZ6NNSDkYgPvp57ZrtWl/yxYg2JaouK5TqknsLvnmK9VdbhU8oy8Xdw3Kh
 PTviyD0n6ohQ5oQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: gscX1pB3fbF8W7c-OzZkP2xR5EDW6DTZ
X-Proofpoint-ORIG-GUID: gscX1pB3fbF8W7c-OzZkP2xR5EDW6DTZ
X-Authority-Analysis: v=2.4 cv=TvHWQjXh c=1 sm=1 tr=0 ts=69f351c6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZhlRKAb300cTtwB8qGQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEzMCBTYWx0ZWRfXwx9GB8BxGfaB
 U6ByCeOdctxOlk4sl8oYEpEyhSndZ47m4LVPCVMdOyDlLrrrCnb6qW8oHpLF5bN1rqxovkX1Rng
 w0UQZYNrzLqBFHzm+xyAOTAYsfvvP0MuY7shFOTKyERkuXne64YPdE5d5Yxu22XN4MGZ8d7fEjQ
 QVnkk/Ja3Zdi4V2u2ZsLmPqqTn6AVdNsjAaxPydttOOsM6rZ8ffCmAfxPOoHLwqUG+P9rCG0VdD
 YXWYy/qtPr1Dkguix5lN+l4KJ0m4Dhysb6oTkCVYhtJKKOeauBUvf6IaZxS+X3CVq9sar3ToSLk
 aDEqpSfT1HB9idMivKMlQ0zE0UO+kKLN4tcv7IuIC6+czAdw6Rp0Kt9K4XJZQA3QVAhGOClGzb5
 cbwbslWp8Nm73X2P+aa97cm+bVxJT01AGKTkF1S179DWDxcz3vd4dTmpc+OpDSWhg6szf0ZlhKV
 f9q+oRDP7yEVJ5IJk0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300130
X-Rspamd-Queue-Id: 3F41A4A30D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35923-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[zonque.org,gmail.com,free.fr,armlinux.org.uk,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Software node describing the GPIO controller for the pxa27x platforms is
currently "dangling" - it's not actually attached to the relevant
controller and doesn't allow real fwnode lookup. Attach it once it's
registered as a firmware node before adding the platform device.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-pxa/pxa27x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/mach-pxa/pxa27x.c b/arch/arm/mach-pxa/pxa27x.c
index ff63619790383859ba111e3efe7619aa6cbd248e..49c677f2dac156445447ebdd7a99f3463a762d20 100644
--- a/arch/arm/mach-pxa/pxa27x.c
+++ b/arch/arm/mach-pxa/pxa27x.c
@@ -342,6 +342,9 @@ static int __init pxa27x_init(void)
 
 		if (!of_have_populated_dt()) {
 			software_node_register(&pxa2xx_gpiochip_node);
+			pxa27x_device_gpio.dev.fwnode = software_node_fwnode(
+								&pxa2xx_gpiochip_node);
+
 			pxa2xx_set_dmac_info(&pxa27x_dma_pdata);
 			ret = platform_add_devices(devices,
 						   ARRAY_SIZE(devices));

-- 
2.47.3


