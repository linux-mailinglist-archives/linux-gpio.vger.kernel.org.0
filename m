Return-Path: <linux-gpio+bounces-35922-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YF9TOO9S82lnzQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35922-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 15:02:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4CB4A31AF
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 15:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1962C30697EA
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 12:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567AD40F8D3;
	Thu, 30 Apr 2026 12:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="huT4BWk+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NVLN0jm4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF33240B6DE
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 12:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553862; cv=none; b=E7jmcrJqYS30gC/i87LyTU+XdH4FGNCYErQ/ggElLy/rdop0XR13N4cZ7joUWK1NHKIqBF/dc2wj6URdlyMXJCSvUr4d39UNHOj2ahNUx1CWmMb80hvWrQJ+MdHpiXF5VZ0qR5/6JUWNhoCfpjKkadd9psTgOA5u5HqoDjphmCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553862; c=relaxed/simple;
	bh=fRUFhZvs9BFNojESgfGSl4j79htf5MaPeOpkhlIGhsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YZ5Gthpdk662sV+6+yAAoqnaQQT+ZVFJlIIaHb/8RkeqsQ/9EkDX5u7ysT0fyuT3R8fzLvlYvgVm8/yHVy5Iz7O/pB8RRU7qD0mVW2qbZB6JLNDwFEIDhRR9uWzx+oe/ovxoCqg4n8Pj8AKbufmicmaGQp91gXHKv+4YVHtUyPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=huT4BWk+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NVLN0jm4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UAFphA3729385
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 12:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pZdAtV2YZsBb0hQKMGQt0w1Ml8ZD/VcTTQjpNBpL6SU=; b=huT4BWk+ZQURIax9
	z2kSYBLRdcHGQXwEisMnn5JSkee1w/VC8q+AUabNFAxCOZCm5BiTKekgwRXFKsj7
	p86YBfHWhROLXtlgFqnguDliCGR1deblXMWaFVp5r5eSZaHdNV+SHrj4nRHge9lH
	+TB2zMWnh2OnFGc5I7EBRlcm/uHWnRry4wp62qrwD/fqnBHAsDVExSWJhSret0Q/
	QMvuVH2XjiLt0wUkjaCFGz/QwjTUZukc7sTXcIgmk45Cq+D6Cd8FfqXwblCldSjP
	CSx3CY1E6w9xzw+35/uZEU2NYoE1GpTi86wV+/GFUH/r+XR6gA1E5BNVioDqafcI
	Vd0Shw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duy1wa8w5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 12:57:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fb3c7b989so13402721cf.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 05:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777553859; x=1778158659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pZdAtV2YZsBb0hQKMGQt0w1Ml8ZD/VcTTQjpNBpL6SU=;
        b=NVLN0jm4oGMuVm3KtwzRZYdFVqutwinY0NrUYZfWkb+zaznqoLNf72eDZ5m3cvwRnz
         zGn6aqb+P8SxvEozcWURu0b8J6+C+PFqBZ+goGnHvz2zy9hMPmRTvYvkrU3eWduxniDG
         mifuBGnOiiO6s/xFlb8uhD76Meo3jVidK6XHCW6RUE55In/zQUcNbNmimS8x9U98qVKl
         6xLjQFIHjzrLwnmZyk+onhX0WIUHQLortTFlAwU3KVkIF87u1tgnRrgJsZEM66TaMXy+
         iA/1Z0q7/KXf6oTZrRtVufpMy0e1Qo3+3KQQZ+rRCHPc2CZyUrBLfPqRUh7DlHKH/jKd
         bbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553859; x=1778158659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pZdAtV2YZsBb0hQKMGQt0w1Ml8ZD/VcTTQjpNBpL6SU=;
        b=SlPDSy5asI4XuhHhEafevKoQhiixOYh0481UPwIAYvQwq4noQqsaWajwhmor2Yxhuh
         3dRFz6xMdUmvF0UGlqnrK+uPowuEaRnZgoVTdpSi2q75f3CmRNILBQHMU9FLsmqIVq6D
         5khhhCCXg7zh7m9igyOWJaF64w2vbGrDFbce9g70h2JrREoMC9WEj+B7AnVVvle+Z+Td
         DTihl1sZ2h8FiSgOPRKJ0tsS0koFiNqAoVhjKAqrvVPe4rP2BUyphDJdF2L+Bxw5Oned
         b8ukX+h9ZwDoQZ37/CSlJJClwYf2aqy0+jDBQZuSLRFWRTHgC6PuMNqUExjprmRMMIdw
         EZQg==
X-Forwarded-Encrypted: i=1; AFNElJ+UOP1r0PxfPafjnLNZTybcP17DVfaFKEYQ/YEvTsCPJG9Nyu7X57dP5upRIk0V7eGvwPAo6G8j/RfR@vger.kernel.org
X-Gm-Message-State: AOJu0YwM+rYffgADyNcf7sVXC7AWuKkyjVdAh0jcieX5UGzt2fPuHB7V
	PNikQ+6/v+5HShkEvXUwjQEMoiyJ7cFrhFhi2BQF8NabtugskcEGSgLB/MwrtsqanXgHv9M+T5x
	Zavt89jTTwoUeqDRyl8wdcIeXEmCAZzX7k5a7d/YRDQx5Ux2bhTDMQbl4kNuY9i3e
X-Gm-Gg: AeBDievOtoi//XZGnt9do4jhuXzndzGbHY1/eyMA2RR/Cu+bkJefNzDAI32jo5+gLmm
	fRpyYRr98DjPhclwkJGRW/Sg1Ky9IltfdG7g3QHQ3h9oSXHo55aMCUpskvMaGyqAUWT25cxOe5I
	k/d8ikrRBdZhsQTntp3PBnwyhbwVr2CFM2yNhrAc16wtMg1RWq48Cjf7gNSFjQw5c5t6EBe3RzR
	81Pl5e3YsrhxJmoNERYWAv4EMrnq72tT+CFvtCas98BqFok41f5NzLAo9L60Vp+RSvlTO4XWSYS
	iRt4U+PC7qb7MVdum2vSTmEyHqDt59q/MgbE8HrLSKSmBrom291Xivhvb2ZKryp+7QLGmdTG4mn
	M7buJlcCAZtSJwhy7xXeDW6YiZzDyzKRjrpefIPVS1bctoxk0NsFb2lGfk4HpeQ==
X-Received: by 2002:a05:622a:1356:b0:50e:ca38:e220 with SMTP id d75a77b69052e-5102adff28dmr39936771cf.45.1777553859344;
        Thu, 30 Apr 2026 05:57:39 -0700 (PDT)
X-Received: by 2002:a05:622a:1356:b0:50e:ca38:e220 with SMTP id d75a77b69052e-5102adff28dmr39936161cf.45.1777553858768;
        Thu, 30 Apr 2026 05:57:38 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:85ad:7a05:49a6:88be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c326873sm41899315e9.34.2026.04.30.05.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:57:37 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:57:20 +0200
Subject: [PATCH v3 3/4] ARM: pxa: pxa25x: attach software node to its
 target GPIO controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-pxa-gpio-swnodes-v3-3-5142e95f0eca@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1107;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fRUFhZvs9BFNojESgfGSl4j79htf5MaPeOpkhlIGhsA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp81G6Hc11QA2pqfvg89qy6KZ8N5nAcR0hzj92F
 WkPoJ6UqBWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafNRugAKCRAFnS7L/zaE
 w85tD/9a65DSS/d1E/cNu8ujITQPYlKFFSyHz7++kViUZGR3Vi5oTWwQCUCaEICfoobxP9/VHXh
 ZIFeeprix7a/LfsG8G/Z0tnKh5yIQutno/xHw/lRkyPi9jF9xUDoOaJGqCcpdTiFYElOWBH9cvH
 5oyMe8ynkGumU3zKXyf1udvrRrQ0OEfNUECaMosvF6Ni8SQAonf4oMsLxJh3mKRy7u8Y/xUvgzu
 0klAkbQ62UWH/eWSLrYUO9cx80Lf60zd8JOL/TZpfaCqUbnjYaDC3Fvfz4bF80gWG8KZR7IkN3f
 txiHYghUJsyR6xgcw+8hG5UtoohLchvgTGkliK3YH7LYDZvRErppY6k1xjb2kBpXA7ZdQz2wnNC
 FNXApNktURCOEHGtlKBOvk7EBCAO1wf2vP2fj9ChGtoYwQsj2Fn+vuxh4C5aVl23rWiTvOtimc0
 qxYsGj0vvzREnk66Clw/+5ESDgmsWVCLFmHtNNQqaOAc09YKLEUMy3RDKu3QHjvvZ/lA2QFaovK
 aawM14c6YCJ29/dRFzes6hIxNVaaTJDCh8eO2PSWhTxg1OOfSPzhQTSL0bJmMFF8CVjlYKOVyje
 H5SgC25ipG5CFTtU0hSof+s6io9jIZpkWUkay2IdhugDQwwx9bMTnQ3BFBt2bGQ/vFq3ZQgWBj+
 eDJBqANVY9IDRbA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 86KyBRxHWqC9A8rPZFDTLdCeHzi3hBxa
X-Proofpoint-ORIG-GUID: 86KyBRxHWqC9A8rPZFDTLdCeHzi3hBxa
X-Authority-Analysis: v=2.4 cv=DPy/JSNb c=1 sm=1 tr=0 ts=69f351c4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UqNyx7J9nSqjioJOR4EA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEzMCBTYWx0ZWRfX28UxzAkzt7cM
 WD5hhY5tmJhY3Ie3nFKCTotPiISvntj/75CEAx/O5xTAtKjsLeVfe6zUquMXhF6WNC8V08oOWwj
 rMOEFrhKlWXGlKMAh3pRWd5M2lrnCYTIJkKeFzIp8zASMkb7/S41UC+x1/lw5RfMlPuVblfeYBG
 ul3fQIa5IRhJT0jqBXV+r6M33pNQ8oHvPmdviw30quOPEnUaB/TlxgUgzC5Ic7yd3T0Sfho8wNj
 maO/SD+DTvpFMKLfenbb5eI9WkeP+D397BphAlP+byiTDLwR1srvKZx67b2H6S9cQJqclgAr44S
 bsjvhPc0NqhBCiOyj83XQicqceDBCiq9RstaZ+pDZYR/+Te6vTKo8u7RA5dkQdUB3brT01kzEKP
 3FrxZvKNyMsMbmDZFrmwajJT+8kLPu98XZD8foxoKXwqthPbBngA63WzC2mO3W/xKpQfEZxyZJQ
 mb2LgeAkTmKJPp+kLOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300130
X-Rspamd-Queue-Id: DE4CB4A31AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35922-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[zonque.org,gmail.com,free.fr,armlinux.org.uk,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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

Software node describing the GPIO controller for the pxa25x platforms is
currently "dangling" - it's not actually attached to the relevant
controller and doesn't allow real fwnode lookup. Attach it once it's
registered as a firmware node before adding the platform device.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-pxa/pxa25x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/mach-pxa/pxa25x.c b/arch/arm/mach-pxa/pxa25x.c
index 70509a5998142ec6b9c484e5f094751eda6db6cd..a4e878be004a09a6ee464c8f09e91be249a224b2 100644
--- a/arch/arm/mach-pxa/pxa25x.c
+++ b/arch/arm/mach-pxa/pxa25x.c
@@ -240,6 +240,9 @@ static int __init pxa25x_init(void)
 
 		if (!of_have_populated_dt()) {
 			software_node_register(&pxa2xx_gpiochip_node);
+			pxa25x_device_gpio.dev.fwnode = software_node_fwnode(
+								&pxa2xx_gpiochip_node);
+
 			pxa2xx_set_dmac_info(&pxa25x_dma_pdata);
 			ret = platform_add_devices(pxa25x_devices,
 						   ARRAY_SIZE(pxa25x_devices));

-- 
2.47.3


