Return-Path: <linux-gpio+bounces-29765-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 420E6CCFBF5
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 13:18:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5091330B5A66
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 12:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94CC3254A2;
	Fri, 19 Dec 2025 12:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iNr1hU4l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d5UR0s1L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DB43242AA
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 12:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766146408; cv=none; b=iNh/Xllj0jGZgbMbVF2PEKOz+l/OGijSRGzIub2NRvrfgiY8TXe0LEzCNY8hetqx2QcRiOOb7wSL9Y6jfnl5xbsaO6p5dbpNrI3KMPwh8iO0kqg/zoVB6P/+Ssbe+ed+euN5Puf1J/FEhJ89IVik32Z0t5UeLUHCC5XDOfyH5tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766146408; c=relaxed/simple;
	bh=SAxPbvwDZoBTjv6FbalCU3GUYht4QxIdHt0ObCI8jYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PpBLVOp7y+xa/gMXq++dqij4VWpShOlgxZRiQJSRwYzh/3zr5t0W0hSVVs9/tXGQHV799ipdfbzYs5daCnNCgVW1zHDFiVTzbO6VsRwQvTk4RLL/syZq4gNhSzCf97mM90cQTl/L2znEuOckMl/oxQbcrnOiv1KDOfkKrWvOMfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iNr1hU4l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d5UR0s1L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBRBuJ3939133
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 12:13:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3XYtkw+nSvqnasmCmZa85drCB060RxRk2PJNPFTL4O8=; b=iNr1hU4l7X6cHnFT
	R7c593Nb9OPsn7XLVFIX9mAzJlNGcLSRLtyQ5/xhSn+o8gAX6i1WWJPcH2nrIJC9
	sK7d+oVdvt6HZrHvHaHcImGOvrzHL5v8nGvoB6wAGJ7RiopmUadqdqPnbPnMXHsC
	TvaYJR2iMNIgMzeIfqsWZAbnKHZeidsDSS3IpmfzpI6TfEeHRLS+lRFD8aWWwPvr
	GpB6XSVysekBH1rB3g68Lt1Jl/1+lozdlht/PUuKFQQgSRIWyjDYLFocJg0eWjBh
	So4Ao3ZgurCNH5OdyGpUk8ow9QLo7v7lcKIZvfYOsdCF4MINyUvlJLzoxqgC2riD
	OsoJeA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c2km0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 12:13:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1d26abbd8so41617001cf.1
        for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 04:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766146405; x=1766751205; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XYtkw+nSvqnasmCmZa85drCB060RxRk2PJNPFTL4O8=;
        b=d5UR0s1L+MdSX/1Ya4B2g4pDtVxvf+qaXKZLuoyF8tIruyOXWp/4DMH49QZAYjNgIy
         6TxqaZ5MDYtC7fvCaJMTDdqEl79LyeygiGhGxA3ba6XYyoOIfg6kIjgXmOaqk/uigF4l
         rJKOIH5MGdiXj4Os3JaPMNlRjO6c2fUynAf6apzbktTIPOu8z+D/Kpk0B7WUfUgLtj3V
         vEYHmDbJ4A0gzUcAwlayAsPWcD8wfWBSqYspwc9NBgZ+bQy4I+2aZ0wn5r2xB4Viuqo7
         23yq+Jnno7sEDUQ2Mdh4mxTZq0q7dovg84wh0lb+fOOY/Z08tU/LkpvyvTuiFilaHgPh
         PFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766146405; x=1766751205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3XYtkw+nSvqnasmCmZa85drCB060RxRk2PJNPFTL4O8=;
        b=Qs4ijHGNr13JpFpxuRCHXpuJwCTe71phWy2x5NlG3rF2gauy3iNM/kMiCaThgHu56k
         sGEuqzm3cQDvZszpgQ1QTe7LDtXArRHCSxDhs26q92jxVVTjRXG0+npabaU4LRYw+oAc
         pnrXCw2t71NZc2yT9di1FmiKHoSBU4kWQpc1mNSgjvALdJwxusx9qpeyuVQwZQ2bmeA+
         0cD0jlm9sgSD2m9zq3qSZ6b8O8+FlmCkOkmK27D16BrqTI76NCqEDBAglASQEwgwmj6B
         WKHMXQPdGip79oZXWgD6GCr93oSuO4QHdaDdhMBThjJWHAasqQCj0Wsg07DrdX6Y4Edy
         AD2A==
X-Gm-Message-State: AOJu0YxOHNCecmekzyjehPkSJpPF4R6kk9lxO6SM+ND9MzTwhTU3LWpH
	PWwAL8H6iZomMx0Fa4QP/ie4Q7qaHbw/ZcDWhNpPmianbKapQ8tDoYui4DCih+h5qiJmfjw232j
	+Esu882THg5MaGqUaNMYFfehQeDg6w9nzqN/dxG+KuStuZ+ZBZ9DoGtz7eBl9nGQb
X-Gm-Gg: AY/fxX7UFKElvan43N6WE+iMdnGgKwYd+WEnk6aIGSyhtJ2RG5qY+WWj543HgfhwnS6
	Xw+BlPHbkRoo5beqBkRb0y4eEmcnC5O20/QSm/JVlhZQy/zjwLlWcPH9/naw/4SRcvl2eKlXqB9
	6FTgK3ODES67ZpJuIvl6LRVVn4kFhSGKbBUnHPdpWT+Eo9f5cbKDPlGhtHu21pMCOyufuKHhQcD
	/pAXdSa7wREOgcBXU4hMZMExZFFBvL9KJCqa9IV4LbXTVRX/g8nbg+58J/9l6gh4m79n6oNEDSh
	CUD6SjvavaGeJbfwNa7nuiWp307hi/bSwAr3T6euRRBqG6db5ylXvpSAXSr3xQK8VqBrlb/yHRi
	vMKQFbOnDUbgmBs36++vwQOoqaFCrrM1Kimt2Oh9SDMgT7Gs2dask7sVNSlceuoc1IQXn
X-Received: by 2002:a05:622a:5983:b0:4ee:4128:bec0 with SMTP id d75a77b69052e-4f4abdca2ddmr32270191cf.69.1766146405163;
        Fri, 19 Dec 2025 04:13:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMGQ+d3otw2nAPUGtegOYZpq5fCuoKczEdq05H59+XN5udCj/HZS+Tj+OrbXthiwOmCJlIYQ==
X-Received: by 2002:a05:622a:5983:b0:4ee:4128:bec0 with SMTP id d75a77b69052e-4f4abdca2ddmr32269731cf.69.1766146404760;
        Fri, 19 Dec 2025 04:13:24 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f48606sm220309466b.62.2025.12.19.04.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 04:13:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 13:13:14 +0100
Subject: [PATCH v3 3/3] gpio: zynq: Simplify with device_get_match_data()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-gpio-of-match-v3-3-6b84194a02a8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1412;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SAxPbvwDZoBTjv6FbalCU3GUYht4QxIdHt0ObCI8jYY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRUFdS1h4j4pt1sNkG+hGyJGJFGsvNTcB3blMZ
 rNX8gjvmSKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUVBXQAKCRDBN2bmhouD
 18zpD/9AiimGe5xpPQ48Kpf9MK48t1Iv5LXlngybCeYtF63egJQgavqmurypnZmJ5UsqdmpZNeI
 VNpeXZ+sie8aJrF6q8zsfX5lASEvujZg5t5KuguPsC6mBrXw7TOai3MUAkcwQKTrJA2DEedVwS6
 eoBY4OuLB6+vlDlVq2hV+7Ny5eq50BYT9TUOtMxmY9aFDSDISUUFPMS2IhvazmrTQC6WRUbpr3E
 swDTycu2CyZacncDe+/pN3eaObaNkd/3usuGktzd2qgKiDQkrNNj6fiv+D7KRs/8+SMsnxiuAJ5
 E8qtAtjqyIP+mAjYBQ/Wy2848YdmPoe/X/GTZ7wNsr6AquG2QpbYlvCtaMY1Jf0+Be3zqNQiXNg
 zE31249qxQK4t4vtUhTwbF83DsF1I1zLW/Wil4wDnTAX0sUn0zmBjzmFfh/lW1kzRCDe6xCjDIy
 GXXZP766qt1J7syee9eXYS1R2Nrqd1+ei5kO8d2MrFceF5E4WtJ7oehCBlw50eN7s5jQLSI/jkc
 cTZf7StzG97LFhTe02ucaJ0wqCi3PX+BD1YF+trrU8SGrna2x/febfv/VjTmIuNbHTrCNg8bC1W
 IcZf3O4Ykv9AyR8cd6KCS+LKc99dWOgzR9dO3f9ZrApkMWbuyjPg1BnUSUX+quQDjDLSJ4njy2m
 0JwSRIcLkfPXXxQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: Gw5ZxgIKaB2nxxE8nr4U4NosBzgN8g4J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwMSBTYWx0ZWRfX88iDtnz1rTkW
 j2xjeigFavY6FhTfnVzMynjHKd4x7b1aAuX9w4G1hjTPjwGlNig85SRhiUY5NN9HRybXsH5WlNY
 NVhkPzSo1FzJPUWsc/id3nO/m/6pD544VrIh2HePmgptvQVjhHDX/vFx9mP6Zd9ps34D4Cp4bRu
 b9x5p2P+j7VayyBJDIGHUceOt5hn7BcKCOt7oDQJsgV2SN9dZpYBQnxiqP2GpGJSJx12KonIgrI
 9Vtscp2RmbOvwrexaF2EkZnh4BkoWHU2d2xWdibJuwSmgrBBlFS6fGN1IuFqeTIDBQpfKUk1+wS
 Dao7gnYjS8nzMAQoBw8a5Q01W46wa6eLvuYajSDcEQppYu0U46bX3UIqEcol7B6i3A/h2HWmTgP
 Da8Uv/UYe4DMmBmWO9QeVtAL8eCjjpV1rxOHoIbFRM6z85waS+Hxo6jn1+minoeBwl7PhEpf6uG
 yB3GtIwaFdSO8qveOMw==
X-Authority-Analysis: v=2.4 cv=feSgCkQF c=1 sm=1 tr=0 ts=69454166 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ZCGY6Re1LpNA-TmytnoA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Gw5ZxgIKaB2nxxE8nr4U4NosBzgN8g4J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190101

Driver's probe function matches against driver's of_device_id table,
where each entry has non-NULL match data, so of_match_node() can be
simplified with device_get_match_data().

While changing the error message, switch to dev_err_probe() so error
path is a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpio/gpio-zynq.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 97780c57ab56..571e366624d2 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -903,18 +903,16 @@ static int zynq_gpio_probe(struct platform_device *pdev)
 	struct zynq_gpio *gpio;
 	struct gpio_chip *chip;
 	struct gpio_irq_chip *girq;
-	const struct of_device_id *match;
 
 	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
 	if (!gpio)
 		return -ENOMEM;
 
-	match = of_match_node(zynq_gpio_of_match, pdev->dev.of_node);
-	if (!match) {
-		dev_err(&pdev->dev, "of_match_node() failed\n");
-		return -EINVAL;
-	}
-	gpio->p_data = match->data;
+	gpio->p_data = device_get_match_data(&pdev->dev);
+	if (!gpio->p_data)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "device_get_match_data() failed\n");
+
 	platform_set_drvdata(pdev, gpio);
 
 	gpio->base_addr = devm_platform_ioremap_resource(pdev, 0);

-- 
2.51.0


