Return-Path: <linux-gpio+bounces-35549-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDepARI472mD+gAAu9opvQ
	(envelope-from <linux-gpio+bounces-35549-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 12:18:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E29F470CF5
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 12:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9E93D303FA5E
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 10:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463983B6352;
	Mon, 27 Apr 2026 10:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RRECkOSq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KgVBL7s0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508543B583C
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 10:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284904; cv=none; b=gpzMzjh+7P5kM6Svpal+9iU3d4fCL6+CV3m2kMeVIHPCvEFOdWT31EDWJgOp81iGqDnVjnhNe1kz53h94JdF5JWtgWSrjigJHp149byCmx2NGpa+i0kPTmaFxV0ohhIwjmNlSL8MnYcpHjrkPE+rM8WmhuuLyD+FycpPVdwQ5b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284904; c=relaxed/simple;
	bh=VmmO4qp9D9uqRUDY7NNT3+l5X/ukLWsVmoA+H8XHpHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bolYyNb93GXzUSHyOQNITxQV/qReY6SSq0qYdlrsLvlVtDGd0B70/0BOLNCXjibIhpHnVBSRhMPs8m+53Z1aP4nfQLScb2F+7GRAlIM02KJIWJD/biEVU9F35nV90JlyqOUk7uIYqAthpsG5YJ5VspXI7p1UlRLkUd0/sTPcC2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RRECkOSq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KgVBL7s0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TIIn861493
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 10:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JtaQpe253eJsHvP5zeIkziv60Cb5TqeInvdoSH2fo4M=; b=RRECkOSqyqX8GGjm
	y2XRfUR2gk6fXqHOt2a5IJW0gM9qfBCX+LuyoqXTNyEialK5KPGULx6jKL6alnGW
	JqY++KjXAaX62QygQDBBL36QnktkrWwHkUVeDKSKUV4Do/ftP5yd6cCHcm5dnDH/
	YMXznRpmt1AUFONuQN2e7csoKaaBrmkizOFgNbiAAj88fpkcbEJ8/kPgwQSPKwil
	5wA4gV4HSWj4tFc/tp+fV+Vfb/ZQiuGu6ZsD+w5JpqujvGuh8XaPfbQDPQfV0yn2
	j57QRq8bZT2tQnfQz9RW1KSCsntMmU2SCtxZnE/kc9/VE9eQXn4yYbG3GPb4QhNG
	21GPpw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnpw5ms3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 10:14:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50f13da9684so94369921cf.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 03:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777284897; x=1777889697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JtaQpe253eJsHvP5zeIkziv60Cb5TqeInvdoSH2fo4M=;
        b=KgVBL7s0zWhpDaURdpTXKvuTeFL9HfFHVDyeQpZOqSBfPydrle+OoQMHU8bAI0k4TM
         7nlTPHNnUNkQ5uwJL+KCs36ErOEC+SszX9VX67hXN8Pf/ScQIDFTzpW6zuOle2c7y0Id
         2Cb5nlMzAXx8T0ACAeKroHBmCPpL5PBrDOb5zr8zt1ILfDUp1XzfJAeh6Kc6W5KvUDHP
         BCmhaJTY+uvdYtygGJHJ8QTljblKOQZDY9ll0WVmwqYiNOPjYnuzZC83XbO5XkKho9Bp
         DU4tOJO4Q0qw6XfX/qHeCSO+kFKkLzTPDEy0NuRY1pdAkhiDbvKLFlsTxgGGkgb+l7bz
         t5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284897; x=1777889697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JtaQpe253eJsHvP5zeIkziv60Cb5TqeInvdoSH2fo4M=;
        b=FuWT3x+QYF3PgdJ/8zP+mPRu79R1PnGH0eg/iuHdsTMx1CTw1DCrLBAY//hIZEklpE
         4YEI/lsynRpPfkN5WHW+4EvZgAQWikF7pg8UE+wGgOEp9kyAmsZNs6N/eWjTLTWSRko0
         eHEGO55XhO37AmUGbhUyYqus32UC5vjuGDDeAK+Dx/9l0Ti5cYyLGHVkAsL3HjaeRHRp
         UtxmGgpURiXyGcCb9HLLWF72KoX3L9ifkNYex7aWh5k+ihLBFZVDkla6h365xk8Jumgb
         pNKgokGpFqdOeB6jT8LeHDmNHL0Tp927UcCBvSZ+zCQTuRRcGMN75IlAB6AIgsfgnRM+
         dB9A==
X-Forwarded-Encrypted: i=1; AFNElJ+r2Fh/W4uZvJvCYpyuStRvBCmIllBKmzXeNuD1dF302ZlyoHgUfiF7MKiZrmfZy6lLeiq+AY3beDru@vger.kernel.org
X-Gm-Message-State: AOJu0YzkfdDOeBYeDIo7itcbithHOuQLgUaWdN+mP9GJeE/P+MQMUIG8
	HgZlTT7RzEwa+3wMnrMJS+9aUhg91eTy+vq+Fd2y4YB+H5KqGdJyjxN4pYKHIeb3Nv3zoVInVwK
	zaWDeBAq6hqkK12cfGqlsm5y1eMFYCwfL8hw9bWHRsJ429e/74tys7Gku06CChe7U
X-Gm-Gg: AeBDietz2FpkYB4Du0wgGhKiOR7KwWvdrzdVWrFddpLzaKghDSGaByjirCa2Y0q+jQ5
	hEjeG3I2RvrfYCKniV0A6dzu8uHaIisxfNO0CtKvssCkUQoncYf1YXUbjqyw+XKyWvAdgRLhLGj
	IgSv3MDqqWfPai/4aeNRrUfksOCTdqOGCKLxUbKSg5yd1NIeKQROddTHIp8Lxi/gvAr3NjrKP5E
	eDQYjXTpagdPpQNsW4/RB/RGtIRw64XAJRlpg0zEbT86xuy1VShP5ZieRzGYT8OjjQV51jBGvhE
	db5Re0qsfhVFLe/i4vhT6xm62oIjKiZzx1688qhvanptFzLQgU2l3o/ZPCuT45SEfLKJz/jtzB1
	ilGLucqDyQo3R3whpNLjM5HDzrqVqxlqCp5qoffEhTkJZSMxqM/IynafKUsuklA==
X-Received: by 2002:a05:622a:241:b0:50d:83d7:686c with SMTP id d75a77b69052e-50e36bd4e7bmr603678251cf.31.1777284897370;
        Mon, 27 Apr 2026 03:14:57 -0700 (PDT)
X-Received: by 2002:a05:622a:241:b0:50d:83d7:686c with SMTP id d75a77b69052e-50e36bd4e7bmr603677961cf.31.1777284896903;
        Mon, 27 Apr 2026 03:14:56 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb74c789sm235103445e9.5.2026.04.27.03.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:14:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:14:34 +0200
Subject: [PATCH v2 3/4] ARM: pxa: pxa25x: attach software node to its
 target GPIO controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-pxa-gpio-swnodes-v2-3-86fc24b9e714@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1389;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VmmO4qp9D9uqRUDY7NNT3+l5X/ukLWsVmoA+H8XHpHk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7zcVF262VXdTwZHMNI8avyuJsAR0h23TRHPFv
 qns6fdj0SKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae83FQAKCRAFnS7L/zaE
 w1iuD/0UEtdioGyNBA7WpCYyMyJt4pvWzpZzpzqmiE3kKSQMybw4T9q15gYIqNwg+m+KZB1L7lw
 qL6LZ2TMB9zpRdt3YOQQ45xHBdUy7CvxqeMhhvb5by2uF9zh9FmLiy0bg02cBIVZQExM/awVIxj
 UbWqEeuXolZw4iGaWaLuCBuUbx/U57b10CitOxktqdhAiz8ia1TWLOkgqIJA6VWrgyEGF7NRRs/
 O74+C07ua/cCtydQ2/e+vnLZ3TrhfEslSrvFNZ+eR5V5W1QtL9u8EhRKK4n7l3ksLKV6fGDNsx8
 P4d+AfcKeW7KmcgyHiHr6vDHN0QMA/xEmFo5dO8giPjkhs/b4fvFi6xOL4kWeExEnYjtdS/2Z1f
 lPQ17rBOzlw2riByT9oX3WGXmdxof7/gPwQNshvPIM4qPsAy6Gn57tXq26nEYhet3PZFx4DTcHa
 gMEEaLJCdN8VDN7qCBQJ+E5nKe48Jl6impJVH0FWavFHpAFMHmMZYptJygKaP8bNHOkqF4StNte
 SEPdZbs1NrhVIDfgeQim/4QpR2jb6rC6560ylfoguCcNrAH+CsmDuwjiFDTxF+5vVQODrUvKs4i
 0PoPUh4hZVUtUClT0CQ0ELo5Rv8/duMyuKb02f2l/DMgZX9lVkOfVn2HBWdQoW4op7V4VTHxK6S
 hTyEMdro0pu+eoA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwOCBTYWx0ZWRfX8AX42zKAA85/
 N0OkpXUx92S5TU0UD3/63b0XXTcAcQWW+mb1KPjTthOkvevTh2z/OVU4Re74WqcyMY4HLOC+m8S
 mK/kt+GQPJ8lWN7SwR8or33hbfXQ/6tCaI9aw/kLFfGe8sX1rtw78Iu4cGqep/eSn4etyUVJBA4
 iQvEAquCIkYvd5i96QmDubDpR4q79RQCBHVZJL3kp1YBqzOafNeTQiFY/cg86GXmrN8duyDwDyp
 narNPzdOux8tlXkJrGm+1Ogt42zPjmhfsbt9s1wQvTqe3w+VCHwDc52/lLpfMFA3RxZimLCE4Xn
 dAczMFldDfkO3M7z+8Uzytktd84HfmPSCGU4bhZpJsMcSzlyF5DXs9Xu1eYGn4cD0ogELM4x4/0
 0zplt9IzlVSM2UB/MasbRoYqJkoGbKHq5a0TAq+dC2hocLn4hFf6C4LBSlMnwMJnHSRrL+JIzsG
 hJCRyyZqjIxwZOY1E2g==
X-Proofpoint-ORIG-GUID: edE0HgzGdsMriRNFohgLQcGmS1X6DGdR
X-Authority-Analysis: v=2.4 cv=RaGgzVtv c=1 sm=1 tr=0 ts=69ef3722 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=quDaMypmeenIOiKoCAoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: edE0HgzGdsMriRNFohgLQcGmS1X6DGdR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270108
X-Rspamd-Queue-Id: 9E29F470CF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35549-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[zonque.org,gmail.com,free.fr,armlinux.org.uk,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
 arch/arm/mach-pxa/pxa25x.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-pxa/pxa25x.c b/arch/arm/mach-pxa/pxa25x.c
index 70509a5998142ec6b9c484e5f094751eda6db6cd..6875774f2cae1db4798d18c813f445bdc31b15de 100644
--- a/arch/arm/mach-pxa/pxa25x.c
+++ b/arch/arm/mach-pxa/pxa25x.c
@@ -179,7 +179,6 @@ void __init pxa25x_map_io(void)
 }
 
 static struct platform_device *pxa25x_devices[] __initdata = {
-	&pxa25x_device_gpio,
 	&pxa25x_device_udc,
 	&pxa_device_pmu,
 	&pxa_device_i2s,
@@ -240,6 +239,10 @@ static int __init pxa25x_init(void)
 
 		if (!of_have_populated_dt()) {
 			software_node_register(&pxa2xx_gpiochip_node);
+			pxa25x_device_gpio.dev.fwnode = software_node_fwnode(
+								&pxa2xx_gpiochip_node);
+			platform_device_register(&pxa25x_device_gpio);
+
 			pxa2xx_set_dmac_info(&pxa25x_dma_pdata);
 			ret = platform_add_devices(pxa25x_devices,
 						   ARRAY_SIZE(pxa25x_devices));

-- 
2.47.3


