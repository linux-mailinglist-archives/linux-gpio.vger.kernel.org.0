Return-Path: <linux-gpio+bounces-35550-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJyMJZE672mD+gAAu9opvQ
	(envelope-from <linux-gpio+bounces-35550-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 12:29:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A03FE47107C
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 12:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B495730462BC
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 10:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB05A3B6364;
	Mon, 27 Apr 2026 10:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HV+CBUaa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aGx9v/ha"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C293B4E94
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284906; cv=none; b=ZdpTEn8nvHwxh5IkG+pHO/6Y1Z/zwqzWUF0ix0bHABTOdAt1GK+uewbvL0Tk8AKWHvIdrG6hGYBblrgz8cqleAFjuLLuBbJDUv8jSa5od5m/rfWOjcDEKiiNzMz5pJJYNAjWSBV1/xAGWuwca6c36/huEMcaLdArIjnUxyQandw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284906; c=relaxed/simple;
	bh=QUFXBzpkBmtSJp6dEvH4Bwph1Q3gQ0ja0Z2WYmUkQsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IsENTROyZYFXxuZW7fpxgHAtYYNpNd4wlvXcHkc0lTa6HP57Iew9i+U0JlH+CLPFgxtQ0W06asU3XXyxwRbpKy/yQeld1VYem0G2IOT6ktoQNMu2cblgIXfZmGW6WrnraYO4m8ih2kzNxKRWKFr8ocknGnLIXL6kVR9WT0jX/Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HV+CBUaa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aGx9v/ha; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TFZ23682546
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 10:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NnFC+THpzuBRYuI1QSSHMrOlp6CZ6opXo17NR8e9HW0=; b=HV+CBUaaexEgtjky
	3pmkSzER0s5JSHcZeuqQrhwwwBg3gdJBu/ooQ8QFvGtsDaZOcSd3pf1BTLvntian
	nW/394YQ9/VKcUcjN27DIIJ9vHUaLih4m//YKioPNtwSSTx6Du6U2/wg3SxbVFJO
	fwBKxErySXHzbKS6dCi0wqrlJAt2GSMwidRSGIq+wYsIodKQbx/hsCSaBWTh+kp7
	qTrB7NYYniYYj3xVIvanA7/A4ee7lBrr+Ym4BcsOyklB9jnmhX3qWBsqy/uANTEt
	V9IzJRSjQylMoxRMlgpk6uc750buGps+pwyrf4sw+rx8eULoProl1KvbIz3qQ7xR
	PlBdOA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnmr5m7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 10:15:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50df4c130dbso166850061cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 03:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777284899; x=1777889699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NnFC+THpzuBRYuI1QSSHMrOlp6CZ6opXo17NR8e9HW0=;
        b=aGx9v/haSRrAun7avWWCDTwP6CYvkAT8axgwaOmO+ULJ0uO5uIQNHLzJ2zGb3bK1YS
         SlksA+klLeMomZGrlfYAtMfvFLrDAzVyj5fLH8jjh2IpjbbeyX6ljsZkkLstk49IoVyc
         B8/KrUjPIr1cgPqnrOo/St8a52yAt67pdQYUMPA6KR7BGjXG4CisK64Z6mFrxdZG6w3V
         W8bc+sPbBbe2EJJOWIX7yf0L3KEUQuDn4OXmDM2CjvwTkssMoK1DMpCH+I/YsNN3s01w
         8EWyGZ7ntpKALA58Dx1IUVbHf626Wyc2PUt7V1z6C82ynuGdKcNVnax9aYD1TOt8lFRt
         aKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284899; x=1777889699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NnFC+THpzuBRYuI1QSSHMrOlp6CZ6opXo17NR8e9HW0=;
        b=X48SbcutPHJieez0VGAS/xWsQiszvtB6dFklPKaJVNK9V5sO2lzAVKdTpSQYQUk90s
         vOSASUXCe101r39DoDNJ9lNs2SNmocQyLzxJtqDwxT7VoqM6JnMw8SEnn29a05E6Ns2k
         d2c3ZGO4jSLVL3IOjcWEK7BGE1JV58WWJYaAWjg2UA1IQrcIYZ/+vRer9aZYwyN2GsXr
         QC03e1JjX54qYbHE5J+OkuJcewdcvcVnTcsR2TrW9G4xHQQJ566DY2n8tlNWRIinMfPg
         eey5m3gjfWVqdr796x3I53u0ZJNAO6iKpCvPSlaO0aAMEGSoSIwY0QmH8Zj6IL9eAYRU
         EKDA==
X-Forwarded-Encrypted: i=1; AFNElJ9hcN9Wfq+jjiBN5JcHcaBU2AR3kX9dA8HMTF678NImukuwB3UPj99PIdDF1syfWjgcAXz+k55frAbf@vger.kernel.org
X-Gm-Message-State: AOJu0YyJDqIL/XxOExs0us3wab1eeq663m57qspqwdpft0S4WNOH0GtB
	geudBh72MFdkX+w7Z+XeJOJa2CNQeVsQbqUT+DOcEfMAT2F8sTN3e4mA9EZID6LwEGfakWDVbFf
	38IIZ+5ZTifBKM7kq5X6fUZzL5O5iIqUvuazblUrOycHjN/LICaFRl92nM+IpoNlb
X-Gm-Gg: AeBDievrndQNBKp31Tw3UEOnt9ekuwh1rBUGmCfdvqb6NNj1XySF53ljuOCDk9bjuiM
	1owwC9g1gdtvzhZpH2DcKSe91ZWcerU2oRF7Y1+3j9K3FRR0qsYcLYsJe2dyCAyJXVM7fTd8ImV
	UJc29F0tFZ+atKNDW5o1iNbZgZeajSdjGvrc+f3g6u7GeEfqEC4cxhGnY1a4VFtB0/QJ8kYpWAn
	BAW8tIDxaC+WG5JHheTFW7smcCkxjsgNOOLpDYgRmUVmjg6cHtQyu3PB7E6tGTQTOuFrp+H2PKc
	VZyQfi514emmtrYfCcEWRBlKbVLRgnjtS3TbylEnyK6wiPzscqu3WGGVa3go+hahSqp6hWASEfa
	gUKtbmm8A+vzQJtGg5O57WS2UaLHaSegmDDYiEHnP2NKx67ElZBUv2BH+/C8RPA==
X-Received: by 2002:a05:622a:1189:b0:50b:3128:9916 with SMTP id d75a77b69052e-50e366622c6mr541353411cf.18.1777284899580;
        Mon, 27 Apr 2026 03:14:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1189:b0:50b:3128:9916 with SMTP id d75a77b69052e-50e366622c6mr541352981cf.18.1777284898987;
        Mon, 27 Apr 2026 03:14:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb74c789sm235103445e9.5.2026.04.27.03.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:14:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:14:35 +0200
Subject: [PATCH v2 4/4] ARM: pxa: pxa27x: attach software node to its
 target GPIO controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-pxa-gpio-swnodes-v2-4-86fc24b9e714@oss.qualcomm.com>
References: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com>
In-Reply-To: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1410;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QUFXBzpkBmtSJp6dEvH4Bwph1Q3gQ0ja0Z2WYmUkQsI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7zcW0gzVXClN5VVOTRxa+RE5TCaXuqQP71OWt
 hkwwqRXAPOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae83FgAKCRAFnS7L/zaE
 wzOlD/9447Zai8Bs5wxsjdHZK9N3uqso6J3LYdYllcbS6cniDTtAP0pJ19XuWv/X+WMmsuehLfd
 TpsAK0rSkUaVbxICaSPlabuq9oPrHIliU6uISSQuthbFbUlWAdKEPd7Ra7XTsqad8Ide0mNN7zt
 Tv6r/BvCEB6HJs+dCE4tCn/PyeiRrngePZb/QI57coZsQRKJmG+++jxeCw6+afi/8mHuOV7wWsP
 u3EZh8mBSpGTxVZC6Crhstn9DZ6p/IgHOQo6oVofrRuNV85cEvT/has+IdwJIZzHS6kcMdraIZZ
 kQ8tqy30oCTzcfpI0mgMTpVHKAekYEZ0N4PMqzqif8L7n//56M/oe5HyHFKR/Y1aglO0DLTv8Hp
 ZWsF52sSHqRlj8KCGF85WBrpPSPuRqtQj67KXrMdjnMAfiIASFjLuzqY8Q0a3c8Qbmeb2DcPbM0
 7D8zi//6Z3ztZ0EWM2uKLt9HO7dqUxCdivrWwLXHg2uf2U77BaoE2aw/PAa4YoRvxiZMYnHCKTN
 dwyMqUB3Dgg84hFxmvAtsXBCzKJctRyqIU9AOmYALh6Xkh25zwOvteXN5rf3Rks5FLwgtQoibMI
 yDRsIsb6UsH+ZRuWh6jmZgvay0S3VHWoQ8BgrBrHekqXBHg6W9SBSdB+RD+0dYNepaupMjB09r0
 qj6wG3ALSRM15sw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=aqCCzyZV c=1 sm=1 tr=0 ts=69ef3724 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CBFrsqW9wnp9SfA-JgMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: KuoRFPqnweDZCbcPPR6TnfKeaWSWQVEv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwOCBTYWx0ZWRfXzLJZKm53Ph+6
 JIgv9A/rgdgE/n3Chk1DO0sztLwLBuqzmL8HVZMuhSjOtM5m4tqJqW3P+xVXXa8iZmVxj9bOpC7
 bcfOgu5vyiG4MXHZmPRC131zyDnsSGH0PwG7Qt6b+oPlSUZ5QPnD3YORI9ez/rQS00JUfSvAtWZ
 z2iUv90dybEYyLhTRPPOnbpNjpOmAPK+O0i0RM4xDns2tHhtFOrtLUo/osGHpDmkFELnj6qZszW
 QsikjAwoYvFOjetO1Hg7QZKjdcTSKyD1oo3SrsljiC0Xs7kz0IReAbd5OcRfYImprnva/h8XFAG
 4X1mOcr9PrGnNspmG8Fn8OQb/ASM7s3sK1bE7Kg0CE6imu6bnKWF11l2c2s2vMWUVM++LQRbyYO
 PlDs757tF3qokl2SIyTo9I1kSZ0eueCeTk28YRPn6KE71K/S0G/pG50tMVRS7FPUiRVeJNqMVz8
 LXwINDe3b8XB7CWNNhw==
X-Proofpoint-ORIG-GUID: KuoRFPqnweDZCbcPPR6TnfKeaWSWQVEv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270108
X-Rspamd-Queue-Id: A03FE47107C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35550-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[zonque.org,gmail.com,free.fr,armlinux.org.uk,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
 arch/arm/mach-pxa/pxa27x.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-pxa/pxa27x.c b/arch/arm/mach-pxa/pxa27x.c
index ff63619790383859ba111e3efe7619aa6cbd248e..bacfd50939fd447ffa11d398867dea7fa638988b 100644
--- a/arch/arm/mach-pxa/pxa27x.c
+++ b/arch/arm/mach-pxa/pxa27x.c
@@ -277,7 +277,6 @@ void __init pxa27x_set_i2c_power_info(struct i2c_pxa_platform_data *info)
 }
 
 static struct platform_device *devices[] __initdata = {
-	&pxa27x_device_gpio,
 	&pxa27x_device_udc,
 	&pxa_device_pmu,
 	&pxa_device_i2s,
@@ -342,6 +341,10 @@ static int __init pxa27x_init(void)
 
 		if (!of_have_populated_dt()) {
 			software_node_register(&pxa2xx_gpiochip_node);
+			pxa27x_device_gpio.dev.fwnode = software_node_fwnode(
+								&pxa2xx_gpiochip_node);
+			platform_device_register(&pxa27x_device_gpio);
+
 			pxa2xx_set_dmac_info(&pxa27x_dma_pdata);
 			ret = platform_add_devices(devices,
 						   ARRAY_SIZE(devices));

-- 
2.47.3


