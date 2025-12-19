Return-Path: <linux-gpio+bounces-29764-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E36CCFBEA
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 13:17:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93C4930A9DF4
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 12:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234083242B2;
	Fri, 19 Dec 2025 12:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oAoU70eQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YrMWqG8r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125A9320A20
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 12:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766146406; cv=none; b=Fayuax7j2PpYqxtXIuziY3IZIEmVzMvvY4qu9MxQLvJwnyKLTploRCkX0ebRELSjU1SHi6V52rFCtz+D5EdQYVAp0zlhpXl+eRj3x35vfbivHE9IfSXnHpBZn1TVkbX4r4xsSADFWDYutAMZrKCckq8xmPOSp+Ef4SOZz1yI5Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766146406; c=relaxed/simple;
	bh=kQh9fxqgF0kkLwllXs7yncT1rqd2kM3SqX3A0JVP670=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a70jQxwtn0BXjS5LTWoszidHJvfT32nkj79b+tRlW5Qvjxaebl+QOBi13P3m1ZoKggbS6JVG5JBoYNV3+PHsVZsXgRYsXHqsU0LzxlUn0IDt3TAhBE9Qc1AvP7n0D9UsihaFIrAHkdd4KLhLi97mMVg0tlEWUDLuwSjcvHrCt/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oAoU70eQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YrMWqG8r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBkLwf3976182
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 12:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N1SiMSN4YFI47fVa4EmdLS4EUY7t39OCz7eP3piX5/4=; b=oAoU70eQ+UKsqRJm
	9h4Me6M810ZDhXVcAmgP6QH2v72cm2idRcRE3KBX0EdGiZvxFU3AqbIKkovX35mn
	/DCRS0tx4VqC04kxXHy2BggVAK94/CdnppUmvlXI+27BUxRcenP6OFLBzfswqRW2
	0HZmBfCJWab3sazQHINHY+OMXQn8BI5WFhcVgoTIj33XFAWjretSRO/XU/obAo5P
	k4xGS6YjwoP0kq3a8BrP4pp0wackkmHJEvbICILodiJ3BXjKkPezW3jjvSU8Y8rr
	eXyCkuZJU2bReVBq5Zq/5C31J8PPYl5FcNAbAb/A393tULWPvtTeETw3SVdlZfat
	Xyfwwg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2fjgtn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 12:13:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee1b7293e7so54010711cf.0
        for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 04:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766146403; x=1766751203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1SiMSN4YFI47fVa4EmdLS4EUY7t39OCz7eP3piX5/4=;
        b=YrMWqG8reWc8mIVU9mPwetHO9ImU1ENcn2DjwUy41bVAr+LxnM05X9S4LUCynuYhUG
         Vs/dFNJBbL4Xtvk2hJ8rXH6OcAcYLIe7DmCoeNcNfx9rA4vDtnIrTFsqNvBcEDejBljE
         78xoUtsfgiCf++pc0SdlBsEW8wjGZiuSX5fsL/PXAwD/VFheNj72nNxrsHlNBlyqhfcj
         tlICPNjHdrceAeqkPIlHcg9g4FMCbhUJMXuuZ+8mDEbidw+IoTYxPhXuzWWM22xinIRW
         KKox0F6zabn1ze4hO5qUMAim7Y22C7azhD4wcdwU+GLhRg8pnVeWwPKaBjcH+9tRoEti
         t6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766146403; x=1766751203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N1SiMSN4YFI47fVa4EmdLS4EUY7t39OCz7eP3piX5/4=;
        b=wqp9FDz05R/P+VlrcAWeOkJQiLFnGBrIWJ8khHAcxfMD+fHVa5bn8XH3A5bJM5DJpS
         5nHEWV5z+7ypUrCllhBZtJiz4Ob0Hjt/ezVhehONelqmEsbHYEWh4sy7U4N5ZN56IOs6
         B1378RjeMXtYUerFuBQqiii5hcj5ZMONX3Cr+sHY76NH1yzsdI35gRCSzH2CGUROerOr
         Tjsy93aiJJaNkJH6qDV0DPMNXsq4tzEjwhRW2tL16OH5zla3+CK46zAdOdy9KcECxZYO
         OFZh8k0QNGf08WrU5Tp4pFOwU2dXT405arJyXeaxL+pArwA8nCdjgBJ9Yq9tLyozObvg
         Kk0A==
X-Gm-Message-State: AOJu0Yyus5TYdUzgik7Z14cUBbYqIY2K4Jc22GE+kZV4QFxZEHiF+i6K
	AfSijBJuUltu3sZ0d5QbCod9OmJaTiMxi0KrcvX3IkNbEZySCbYQLAYcRe/Q4iOe3/KfRZ4MCg+
	NuNK2YDhpcx/h5TDs75YQ2ZLUYgEJ7ktr5Hi6UnytP433aOjOyKnqqQYJ5xAFyWus
X-Gm-Gg: AY/fxX5iGEL0iHtv/tiz30yy+PIIBVt+y4fsTd9++XOJl4hrBVm5CJROYSevRpNQuUE
	3Qld8BsoAz4cYsRLFJ26Fx82XJHB5L/FrHtH2g4UEKXfdfPk9rO2iCs9m09jlPgNIJvrd1HvsZC
	+Cx7891PcuZtw93WZk1PVSjLJym+Ip+TMMBdqlTpxKyVQLbycc7InD5sWT2XO/6RqWJ2jYc9WoF
	6djBxQDdamcNBAVSgfvT9V41pCCl5hGqYnUb5+NOhwGCead4PhbDZvt+O6A7i3YVW4XrvgG7qkr
	XBtGfcBlxopKdbFKUpFnGQDeUdJpjAJS8ga1Uas7FjBFVMau29q9UXhujALIQDrZ3WqS7WcIATz
	62apcsnp0uYaIuZCvA2lLqMpjAJ3sXh+CWoppaZjB2y0a7tYUrqpGcEezOnxxsy5eUw6x
X-Received: by 2002:a05:622a:40c4:b0:4ed:aa7b:e1b6 with SMTP id d75a77b69052e-4f4abcb8c61mr39213341cf.12.1766146403266;
        Fri, 19 Dec 2025 04:13:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYPcW3PfPMaYa5ah0lfNmydmhG1OoCxBqy4V58pqAmy3pqVEKIRr0KG4hKAWOlE4QVSR+jVQ==
X-Received: by 2002:a05:622a:40c4:b0:4ed:aa7b:e1b6 with SMTP id d75a77b69052e-4f4abcb8c61mr39212871cf.12.1766146402846;
        Fri, 19 Dec 2025 04:13:22 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f48606sm220309466b.62.2025.12.19.04.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 04:13:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 13:13:13 +0100
Subject: [PATCH v3 2/3] gpio: creg-snps: Simplify with
 device_get_match_data()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-gpio-of-match-v3-2-6b84194a02a8@oss.qualcomm.com>
References: <20251219-gpio-of-match-v3-0-6b84194a02a8@oss.qualcomm.com>
In-Reply-To: <20251219-gpio-of-match-v3-0-6b84194a02a8@oss.qualcomm.com>
To: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kQh9fxqgF0kkLwllXs7yncT1rqd2kM3SqX3A0JVP670=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRUFcitFmh96JIq34IbMP3prMi1Qv439mdn6P6
 pO/55cXvQ+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUVBXAAKCRDBN2bmhouD
 16G3D/9MR2b44uM01ef1M+Bm/4qifQ4xOiNZUWkSJhnzHwxwPTJcZk015ecjjs0wHCt/CVuc6fg
 JMbTbHa3QqUzrOxOFOgNDndX2Cwbm/0TxMsRSejmUrLApdeywMx22tOEjr619KzQvR84+pquTHb
 dA4LnsD3ft3RVOIWUs9ozIeg2/Hyd8EcBFTPkqave/fazJSiiqGaAdRyyiufvd4U/Ook0amT4o8
 NWWUEH4FYl2OrH+3xdxNBCHJowcAP5T4kD1CsqjR1YXdnQH8Nh29uC+RpLbi8eQoLSklzhEw0fS
 vgo4OPfMu0legugoBTtIbMj3xfZ5D5xFb+YHQJdg0flH9gxnDOUdqFNewEJMypm9Eu97ZVBojsC
 tErUii6TnOqWBtpN4jFlMLA5ogxVaU+Kxfl3BLd6TN2O67TDyQp+hsAhPpttaAqjU7X/h//20LE
 jddOb0qoMc1a9X/EBlwF3InjSKaRYORz753RXJpyhwiKvXabTXOAPoYW3eD2XKlFip7kaDKE7ds
 FFoGZk5pJasjNXEE3hTphHI4F/yhooWkgFrliK6XzUpkLa5LgtHd9tPqZGOkywqpfPTX+qR0W4z
 2bRo8r1oCorUGiJLFexpdADlS3Nag8ER+7RWolfxUsgdrO+Xaxh4Uv7uAqc2IZVui4hLNHOeHGI
 uyl0hgYwVIMYcbg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=NODYOk6g c=1 sm=1 tr=0 ts=69454163 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lsN0KVCTPuDBfKR-m84A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: WoeyVpWTxxhHJG0ZqXhhYss4F29NWAJq
X-Proofpoint-GUID: WoeyVpWTxxhHJG0ZqXhhYss4F29NWAJq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwMSBTYWx0ZWRfXxAU8GLnWWL+x
 ZMGLNd0kNsjls90JS2t3xeY/N/T2yBaGUwwQ9UVeZtYWFGEC19f7LcXy4M13mR42WiSi9HS3UO9
 tAyMt5H6dS2ZzdmZ7A3YETqgpMb9BLfaBqAxcyuEO8Q3JEJV3UbPVb3H3A5SLUtyJahlbPcQOIH
 HteI2+NNabcY4PoT28lFjHz/6HaLC4Tvilz4rPFLax5rjTNssLQp6U7sjaJ51npRcvuZ1PHPEqw
 EHJYO0oeAq49Gv1ie/p+UqqPEg9lp5lE6qnas/ojVKYIH85A6IibqmP3C7/kiLrKz9SEhvLtlPw
 c6GAlzugyunIzFz2viybJhHx5B4cVGhSf0gPxZZb0qiQaj/+OUOasNPUJ9n9e4VGbB1A6Q+TlSi
 l3hS+kEnqpvz48M928RiYFlBkh/dOqDQi51e2bY0T8SfBvzE2wmMhPtivNCrSaxEmjl+UAOse2E
 XJf/MkRJILu+jYASxRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190101

Driver's probe function matches against driver's of_device_id table,
where each entry has non-NULL match data, so of_match_node() can be
simplified with device_get_match_data().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpio/gpio-creg-snps.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-creg-snps.c b/drivers/gpio/gpio-creg-snps.c
index f8ea961fa1de..157ab90f5ba8 100644
--- a/drivers/gpio/gpio-creg-snps.c
+++ b/drivers/gpio/gpio-creg-snps.c
@@ -134,7 +134,6 @@ static const struct of_device_id creg_gpio_ids[] = {
 
 static int creg_gpio_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match;
 	struct device *dev = &pdev->dev;
 	struct creg_gpio *hcg;
 	u32 ngpios;
@@ -148,8 +147,7 @@ static int creg_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(hcg->regs))
 		return PTR_ERR(hcg->regs);
 
-	match = of_match_node(creg_gpio_ids, pdev->dev.of_node);
-	hcg->layout = match->data;
+	hcg->layout = device_get_match_data(dev);
 	if (!hcg->layout)
 		return -EINVAL;
 

-- 
2.51.0


