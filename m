Return-Path: <linux-gpio+bounces-34466-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EB6ALOPy2kuIwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34466-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 11:11:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C156366C15
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 11:11:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 04C19301EF09
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 09:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778F13ECBD9;
	Tue, 31 Mar 2026 09:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O0Rwd8tV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="csUgc8OZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B36B3DCDA4
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 09:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948263; cv=none; b=iTAvzyQ1SGtwSZqP4WfQk2eY2S6zrlfDg0b16RR+k6IYkm622jU7dvxHCKDv7Z2Vm/E+w0/kaOrABWwaQgE1il6w3LPkuasJmU19+vw5licqDM64Fp85ESvdFjyFwfH587N1wt8+J49lFSLdVg0ta7iztC/U0LGQRGZGdjPcnlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948263; c=relaxed/simple;
	bh=vVoq2g9K6Gk4rWjpyColK9933RhDDhxL609/h4+87yk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lw5GkucY6kgrzcu0W+8ZpcLF6VWhTMQvQy2INcw1GiPAU0Br2AO4/dmVXW9g9ilHNaV5QIjUje8Q+qpbSoAh7G4mcL4DgCRLA75K5sCkArhBdAoNuB8VFP0kLBqWPTTKEyNA7NioQ1DDHsZVnb4gg107KpfS4OqCLwTf3DiWZpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O0Rwd8tV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=csUgc8OZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V8Aw3Y058150
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 09:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JSpuvvcloGMrG66yfGK5yegYI7xNngjDRANNlQWkaWU=; b=O0Rwd8tVtn+F4sgd
	5t45365WubVTdakkxtcJu07LxAG5/ZFJ83ZEJQVW3oCc3xFpmIc2mgfF44jk/57k
	f47Bv5di/r5yLbMNp7XdfBA3qdLLakFDemG5U6ZEoz1P/p+AYmXgGe03TvMLN7M+
	pkQBWS6VMq4c0vOssCeIo9P8G7AfHkHPVKuc6AX04tp5ihtHFs31I0yg4f889MBe
	uNaKY62Q7ZPio9uLGzQ8SIqtCXGKrKRz+nNqWvS3jnZ6l31AuKzlzMaE5ig58bOA
	3gL7p3vkZjgz6oUNEkRPGs6dyxPjcybkQ/5OT8hBgFgfpq2cqbhQONM7nmwrqDkg
	i+Jmvg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8ahkr8mj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 09:11:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509044f54aaso172352601cf.1
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 02:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948260; x=1775553060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSpuvvcloGMrG66yfGK5yegYI7xNngjDRANNlQWkaWU=;
        b=csUgc8OZxTgrFfAHvSwR0kQEzksk/VgNWs+adhpA4wNdsap0SgEgb8+38l4vbO021k
         NB9U8TU2T3EgjmZf87DOc8I+VsisP66EfdYXiAaIOafmK09ABrJFxINzfYbX719eg2Ag
         md/ffDEABQrTGeqXhO5ZMTx18nHTmaUWXaJe34mFwU05dLI1jy+yiNnsqbyPES27c4vx
         b9MlOqEp2oReGHRF4fOE5Ow59wR0D5srZ8l/WMy/zWxLyfODAgJ7LSzqCWj/pfm6ImaQ
         teI8otGRn1X7gzsmdFz4q7hzn95wKyxoleCrVZtuxyc5oRztdDnMa6p11nCgFMtMrk0H
         r8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948260; x=1775553060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JSpuvvcloGMrG66yfGK5yegYI7xNngjDRANNlQWkaWU=;
        b=kmctE6rQM7jc711la2IvuTFz5G3Vr+i2+WMu77mKri/wXbvjI882M0eMnE/+R+HLmQ
         Leg/1W9aKxTLb8TslJpjiwbuyAwj6yMJi+BSL2OqnMl/1hSW71arM6eKHGBvfe3bdsBl
         Es0jsV5jpcRvrPGEa6w9yrAVPOouTUq2lnqZK3lGjQZsJXGcY+TW2QhAEfa8SQ3mU6qB
         mHWda+Ti9hesBBRNnhjcZz41jVGvhqAlMnCjgkZ6Jj8KXTi4kfmCkWk2x1M0rSS3Ok6y
         dXh0JPIqGUbwXZSls9r3+4VhG/AE9v5SBQ60vXCVZvCZ8VMaVjn7wfGTGTjWIA0G5MFF
         AOJA==
X-Forwarded-Encrypted: i=1; AJvYcCVAP/6VyKuFiz+6n5dbFHO1lHLK/z8ZX4KjWVC/hQC7/kUK61py+YSYBfsYQM1khxRmatPsYjFVEQW5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6L4LLVd3t5M9HC0rmu15sw/oF/MISD0BRIqjdpFeZ2oWIEdCQ
	df0Nag6ovNKpBJWrOzzoacHggi1ZXYDniVqho1Ru6/489rXnQpRl7hztE0wxA1KFtlEn1biCBOE
	kr/PgPGwUp/u18f6PHYNx5spguO3CInXmoOhlQraJFGLlHryB22GBnicUigv7/JWD
X-Gm-Gg: ATEYQzwuRAX90/kdMZm74L7S/T36UJfjQYcFnm2Z+YoqK7gKIritWBBb5v6mBhK8nBE
	8PsSUJaylaJIrEfTzvLwVELDRQxke2C1J7hsDqGxh3teYbj5UTrrFj7yCfVRPYGO/tj81MGcLWW
	tYBn1h2zZq47dEENl/nSKdAFKhyJUDQfI7HybQgM5Zhwl6S+d2xa4kWjNLPUvWx/G2u6ePRuHkM
	N2jdf2jHn9YWjo1vOiD/lpKD5TDqM+PSaIdcmfnizP0RDJN2aCo1Qckejx26XbvlBEzwDFCPlTc
	rYjK8ezRvmZXmR7JGytClGeTY0kVL+OCQLKA4raq8GSaiZNhrcMTuviaVKEUz7hdBmPv8kiuJl2
	r8bwIfrPrpGDsgJXBgfEKsGa0dpHRzDCA3PE6RQppvEMg1HXEuIw=
X-Received: by 2002:ac8:5995:0:b0:50b:4f14:cc with SMTP id d75a77b69052e-50ba38323efmr209386821cf.23.1774948260486;
        Tue, 31 Mar 2026 02:11:00 -0700 (PDT)
X-Received: by 2002:ac8:5995:0:b0:50b:4f14:cc with SMTP id d75a77b69052e-50ba38323efmr209386401cf.23.1774948260070;
        Tue, 31 Mar 2026 02:11:00 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:29fb:516:a90f:8dda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21f1749sm25974860f8f.14.2026.03.31.02.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:10:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 11:10:47 +0200
Subject: [PATCH 1/3] ARM: pxa: spitz: attach software nodes to their target
 GPIO controllers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-pxa-gpio-swnodes-v1-1-f66d86d10d8d@oss.qualcomm.com>
References: <20260331-pxa-gpio-swnodes-v1-0-f66d86d10d8d@oss.qualcomm.com>
In-Reply-To: <20260331-pxa-gpio-swnodes-v1-0-f66d86d10d8d@oss.qualcomm.com>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vVoq2g9K6Gk4rWjpyColK9933RhDDhxL609/h4+87yk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpy4+dty3ESXbcrc1Nw3rSHCB+DuRDOqGw3iWfs
 oAuYg1DnYuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacuPnQAKCRAFnS7L/zaE
 w0jAEAC4ONnzjkcvHbfSnMBVN709jON6TbgFK66Q0bNVBSjHLK+TFYiZIyNSebweny0Y+fix6xr
 1cXaHRQ5TPTcDrI+ggb1UdOXg2JbcgvCg9bOGD6fhPyMX/44cIV25d1qzBtvsky55HCjjlS4j2k
 s1/qBw5EJ/WptzmSuFtDHEFlPSj0ZNOltBGnOkMZXVoWyFcrJ0lV0siLqYSQ6K5Rja44dH4r/+B
 M1qDjawyDRi/188U7BfAU+6SuHU9KV0BiG8qeLW8xBFMp+Hk1KTYZGhmBXIzfxnCUQvdYdOe6AP
 m1qupLwQHA2vumpeoOiXboAno2l2Qk110KZ/R1FaKHe1RMfDcolRHWfMM/iR7HRjtiGVG4VfzIa
 wzhq0aKGD3FOQGvt2848ZM/mZ2P/N25hzHTcNFBNVSlkFNJr7hcUa9an61fKNq81t0Q1mnmAP29
 G/IvbA2IWN11xwZOREedFGVSyEInumpjOIzx0TDfmaaqmkYpajWbR5+qJ6d+RjRqdeBYvr7zPqK
 v+33AILVnOXe8ot7of3ZiL4pPEUiq6NlNlxAJd6ZNWVnW4GYkXj2KTMF2q3aA2at27Z6DjV/4PB
 hd0255sb8MPC/QvEARhCC6WR1eS8SxUn2sVXGWm4peUQPYq5PTds8epRhHmcQ/M2sbxqX86PHrK
 O5VtqJYCaSBsUqg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NiBTYWx0ZWRfXwnbCG/aQy8f8
 4aHQijoGuHH8djoA9NjPe7Uq99nx0hLN2FMeRGnHOfes5my71/ZLUfkjR9db/nYwA0c3GIPAzva
 hl+XMFKA8huqvzgx/yO4TxQ0Hi1NQG2Uzg4/E0RZnxdmjK7HxSiUNNYxfBXoFCNz+FpHQ7tid81
 g9dy+Z0rIsSHPYmPouixBx/F9zBLs91DepIGbCxseGKwjWG8oSwwNOXS4YZX5BQy+n5U3xnQm6E
 AaUeaDhhtJoWCCLaCtqjw36AiCdBxi/XA+tdbCNBuBBWrnaNUFyI5QCpQelqyMm1H0e9yt8UXG6
 2lKVmEr/nEwcCGpX06gq7qYeHxX1JN/9j7ZuqyEnNj8DP0UWI+MeHucLVQgwPTULPW67uHRPLrO
 7bACMotkKRp0TTljn6yTK9I/cCaZr2Q5VhW7PZFaoCiKQRFpIvoCboRu6EZv9ia/FDhVQjsjb7I
 LNroQZGWCDXlbj9rEPw==
X-Authority-Analysis: v=2.4 cv=K4wv3iWI c=1 sm=1 tr=0 ts=69cb8fa5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ta5-_S-aL4JQErPj6J4A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: iHq3ylxDEdYlP7R9dNibZs0A35VX3rOh
X-Proofpoint-GUID: iHq3ylxDEdYlP7R9dNibZs0A35VX3rOh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34466-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[zonque.org,gmail.com,free.fr,armlinux.org.uk,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8C156366C15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Software nodes describing the GPIO controllers for the spitz platform
are currently "dangling" - they're not actually attached to the relevant
controllers and don't allow real fwnode lookup. Attach them either by
directly assigning them to the struct device or by using the i2c board
info struct.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-pxa/spitz.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index c0b1f7e6be87411359b0020257ff12c73bbcbae3..99deb672999c675c25c9d03b0320618f571aa0c5 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -204,11 +204,15 @@ struct platform_device spitz_scoop_2_device = {
 
 static void __init spitz_scoop_init(void)
 {
+	spitz_scoop_1_device.dev.fwnode = software_node_fwnode(&spitz_scoop_1_gpiochip_node);
 	platform_device_register(&spitz_scoop_1_device);
 
 	/* Akita doesn't have the second SCOOP chip */
-	if (!machine_is_akita())
+	if (!machine_is_akita()) {
+		spitz_scoop_2_device.dev.fwnode = software_node_fwnode(
+							&spitz_scoop_2_gpiochip_node);
 		platform_device_register(&spitz_scoop_2_device);
+	}
 }
 
 /* Power control is shared with between one of the CF slots and SD */
@@ -988,6 +992,7 @@ static struct i2c_board_info spitz_i2c_devs[] = {
 		.type		= "max7310",
 		.addr		= 0x18,
 		.platform_data	= &akita_pca953x_pdata,
+		.swnode		= &akita_max7310_gpiochip_node,
 	},
 };
 

-- 
2.47.3


