Return-Path: <linux-gpio+bounces-29753-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4EFCCF573
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 11:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5109F301860B
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 10:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54BCC309DDD;
	Fri, 19 Dec 2025 10:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dfb6VnVo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iN2t1WpK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A13306D40
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 10:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766139126; cv=none; b=OCiI3KiNUQkqWjRSD2ABeDe9LvB3KLZ4fxPhrLNciV9ynA95deGCVIBRrjDfaQdvPRozHaiCNhkOyKV89k1uhrXThQ0XrXwzDXlgB3izlSBMpUvmyeJrl4QQcdlC07XWXl9QJRgR6O+0cXQCoZSEU7f0mNBjVLsYJ0797JjYYkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766139126; c=relaxed/simple;
	bh=5qG992duprd04+w1UB0QY0FMcY8BPgFL5D7DrXqV7f0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yl8pYROZgWGhfnvkMxYhkM2idN0HUgORMXwQvuwG8MMve/aEqx2vkA+AgQZZxniak5Hrpl91UhDfMlaFU2+1xgzJ4ej5fr9Isf8SOzi++feX70dUakGB9dXlgJPmKctuXFyL4A12566sKT60jkMOkst+Qe99Mu/xwILXT8S4saI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dfb6VnVo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iN2t1WpK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cLKZ3976261
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 10:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3IDPx0z9gonIKpAudg1HfQLLk1WHlUCJuXDV7vFQm18=; b=Dfb6VnVocYk2+T/k
	LWkQWiOsZbC5NpilKGZAmHw1z42Sq2p9K4E06H5gd793Xw7OHM5cCCCvUxY+2Tg3
	oBfDCRDwjRd68Yg3BOSc4jXxx12xKdpK3MNxSVQHxugTHkK7x+BXzZ7oFIaZ84xB
	ZTcdSaJovlVJYSBlMjxebTNVT5UT0/Kfo+u3ZI/4ox/8vopyK1p2/+LzuWHk/R3Q
	W3L4ycnd7dRYriVZN6nANEtfCx1UIdDN1Uc2KWiZ7ynEXRFzRXo/k/EyvxTpxDG0
	EbXBBo7GDru8OdToSlXziNniFUJe5T3w16e8MvzzNDkt/yIYYa7xM6f3uCwRYqkv
	847IEA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2fj6n7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 10:12:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1b39d7ed2so33788451cf.2
        for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 02:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766139122; x=1766743922; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3IDPx0z9gonIKpAudg1HfQLLk1WHlUCJuXDV7vFQm18=;
        b=iN2t1WpKDxNMvfAMA/+uQgv5N4QwIJW9dDZpMUHgT/MUALct8jK4XBtD/ogXGC2MXA
         OLjQQOVRtNnr3fe4KbOfM8YVHeXafu/Fa0ywz0utSRWnoMhkZnlG6N9j9H3L9foMe6gt
         rP2wS/3jPJtlGWAcz7LGu/KoaShE9Cin+/K4e5gW3JHh1it/5NaEDr+zRb2TvI/b5iVk
         NESdR5Ls8vZuJ0lwW9sxB3qE22i4a45od32+TakuGIDmvndxIw/saiOepDjSv1bdmob1
         1XgdDeg0Hr3XsWfXeiHb2ckax4tryBKE7plidfzD7i/L4W/nu0vR8K1ZbNE7z4dxBrOV
         fKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766139122; x=1766743922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3IDPx0z9gonIKpAudg1HfQLLk1WHlUCJuXDV7vFQm18=;
        b=wp3JBtx4w9aPHLSb7caq7LTsvoP7g18GXvB+JFqbXlI8I2TAPuyWFpkBhhr3xdfuE1
         mdJlE3I3XkW1Aq3RKw7Nn+gTqM3qI7tsgdDtNLHZuopqkxb51dxQNj1sGwQNr7SfdmyO
         94X40BKv87v3ylHJs6O/tIEO/GPD3hv0Ikx711c79+vjLsWTQHxo3KtFh0A0LzZr9wTo
         /FRCZC9YtE6jz40FWmKk12M8Rbmz4ip5q/EEapnuw4Uynz0OqR1gmEJ21rt4DxS0/dZZ
         d/CuW9aUCV/A4i2PRkhR1axXeFux2f8ywZpJpF2/ir+v8ogmVEXezVHULP/OMQLoyuP7
         JxWQ==
X-Gm-Message-State: AOJu0Yx5hWLSHhWpkPsckDZRSsSesD67N7BQ27wrjbGJx+TuDN+T3Hy/
	znsBw1CY7k0rsH/iOYXcgJGAhyyCKPx9SKTTP4tN4H49gHWpfiAxOzBDbRzVV2cr3CP21Vq6q2v
	HRC611gMn2D/bsFDmKLk0n2u9S5Mtgv2H7L/SqjUG/S5wZQYWvpGxa1EUK03CJoCL
X-Gm-Gg: AY/fxX5eNUmGXKeRSV7yzrbk86lGOll5ebdouFTL/nWel4DYyfGrz6kOHG+RJxGE3vl
	93NumMFLV3xkP6oPij3RSU8o3KohEFrPPZ06zJw93maS2KC1WFq3fZSKFQc0A3EAGb9e2w7rTWh
	PeeIB7ax/JGg98oKSdFs7HytAt+OxhPpvziinarwEYdh2sT0oM6ICz61lDMTytbfKw3v/ab92aW
	/BJ+iQOsWW5AcJfr1S2jSBtB7wck9wHbmfbUAK8pjH1WflBc5f3rSqJtRxXEi/R9egoqUhRuWxR
	9ZL4tpOAaS2oE60aSU+peDWRSRsrWgc0rf/gZxKjW1b0CcFWSE63XUfzj5blxJKRp9Ur5LJ7joi
	MHhvhsJUe4oToDSknu/U2ysccZOoHS3rxx83rB5H1k2CQ766SkJuL2vcy08KOiNWjKmz6
X-Received: by 2002:ac8:5742:0:b0:4ed:66df:8023 with SMTP id d75a77b69052e-4f4abd06713mr31926241cf.30.1766139121824;
        Fri, 19 Dec 2025 02:12:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0l97mx7gRpuBGwVkELAb9IZ++QtMUYrYZc71BAUyZzA/39KQ8GeAH6JeAS+KeFjHkPHqXug==
X-Received: by 2002:ac8:5742:0:b0:4ed:66df:8023 with SMTP id d75a77b69052e-4f4abd06713mr31926031cf.30.1766139121314;
        Fri, 19 Dec 2025 02:12:01 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ae2dbesm197282666b.29.2025.12.19.02.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:12:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:11:50 +0100
Subject: [PATCH v2 1/3] gpio: aspeed: Simplify with
 of_device_get_match_data()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-gpio-of-match-v2-1-5c65cbb513ac@oss.qualcomm.com>
References: <20251219-gpio-of-match-v2-0-5c65cbb513ac@oss.qualcomm.com>
In-Reply-To: <20251219-gpio-of-match-v2-0-5c65cbb513ac@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1476;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5qG992duprd04+w1UB0QY0FMcY8BPgFL5D7DrXqV7f0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRSTsHKBoTukEuIPZTVcHUflKv4jxU/jlrejPj
 o+LyWzJA92JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUUk7AAKCRDBN2bmhouD
 1x2hD/9m6Mjy9pvXxQcUsoScFVlVTm2XUP8CZNDyTxQFBeRTYCvdYGz6sUinXcE1aLbjsjp8dge
 nJViBjuaMMgRHw7MazkKB6rZkuYS2qWw7BVroOiKvzFCiAUl5R+GUXB7MyFC2SoYjNddrXC5hRv
 HMhco53HKj8uhLDSXpd/nidu02HGOyPmytRbFqpXL3wTFwv+2mc4ylcmjqpCUVGmsxmMchd8+TV
 f5RQi490gJSx/ORDN9Px1XHP17O04KaX7lezsS0lJusuCHPYJ6G4vbN7G8EDx2ynBlOaGOkUw5F
 R91hcnmqBx9FywIhbHxtOxmh5tMMRteRV/hibT3YXPQ3jte2lRvqGrJdz/lDY/INLXiWxG3Pn9h
 C+NjTopoPbdRCoIa/SFOwrvgHSj+cn4Ft+x4JRdCVojJgNX3fb0VBZIYncM9h5NIIgU8+8G+7vX
 vCA7nyv8l9wZKtsQQgg2wPtPdOVHBtXsw85n3GoXgIU6p+TbRZAZS093M8hY8pMuN36Grz3ygh0
 tgRFetNcDp4PAfRviDpZULwldfbgDiGEa65/IhvgDNY91kQc9UhRqDLWSM05mWas0GKduyzYRuu
 lJ75UZiOtwGScCI1AlLeOeE//DzFel59LsF2yCCppnXNeReU2eyc7r3HlGNjzFyCbmdFuf9YPjd
 GcDDNhb/+sLkiqg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=NODYOk6g c=1 sm=1 tr=0 ts=694524f2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=AxvInAFV_DmKQgZoSDEA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 3oRRYhDkWqjlkfelRNdbb6inUdO_d5XE
X-Proofpoint-GUID: 3oRRYhDkWqjlkfelRNdbb6inUdO_d5XE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4NCBTYWx0ZWRfX2zgjwmCP/pVP
 gSgCeQeMxEB/oRC7cKoJgKOuPIQzh+2wQ74KRKvQvZGfkU+1wlPDOWPNzL9ZceIuZOfwhdEikIG
 d4kzFiOI0HgW9jchyISfkNbTYuBVuBeQJDlBBXdacDTCr6t7PGdFI00BuFHPL9AxYcVganes1LL
 zjXfNAcO3f3PT6Nmfk+duUq8onxx1gg1i9qMhMbi22OTFxHy7Bwa1zbyAmya9lDuetf8Vem3eYK
 wmenuKWJHGnIQLPyMtSbcgAQHjcKZaW9NSFEESTEA/mNGX6E3IgaE7YNDd2mHtXAcs++ezhxPIo
 Lu8Xc80eTjGYuaPsXnVCakC5Ds77UszqKWahlN5Q5h9UYXW+sLSwUBC+TucfJU4lJgPp6hiRXgI
 43KgYWE5VDiWm/R208TcPHZC7oPyS2OvF6VoDyglHISlpPz8/LNsJtIxpjJZ1Bm23T+aYdzUxw1
 sFokGxswMrdZzNzKl4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190084

Driver's probe function matches against driver's of_device_id table,
where each entry has non-NULL match data, so of_match_node() can be
simplified with of_device_get_match_data().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpio/gpio-aspeed.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index cbdf781994dc..9115e56a1626 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -1302,7 +1302,6 @@ MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
 
 static int aspeed_gpio_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *gpio_id;
 	struct gpio_irq_chip *girq;
 	struct aspeed_gpio *gpio;
 	int rc, irq, i, banks, err;
@@ -1320,8 +1319,8 @@ static int aspeed_gpio_probe(struct platform_device *pdev)
 
 	raw_spin_lock_init(&gpio->lock);
 
-	gpio_id = of_match_node(aspeed_gpio_of_table, pdev->dev.of_node);
-	if (!gpio_id)
+	gpio->config = device_get_match_data(&pdev->dev);
+	if (!gpio->config)
 		return -EINVAL;
 
 	gpio->clk = devm_clk_get_enabled(&pdev->dev, NULL);
@@ -1331,8 +1330,6 @@ static int aspeed_gpio_probe(struct platform_device *pdev)
 		gpio->clk = NULL;
 	}
 
-	gpio->config = gpio_id->data;
-
 	if (!gpio->config->llops->reg_bit_set || !gpio->config->llops->reg_bit_get ||
 	    !gpio->config->llops->reg_bank_get)
 		return -EINVAL;

-- 
2.51.0


