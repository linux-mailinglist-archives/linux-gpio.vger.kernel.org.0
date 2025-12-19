Return-Path: <linux-gpio+bounces-29755-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED45CCF597
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 11:22:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C767A301C3DA
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 10:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2339A30F816;
	Fri, 19 Dec 2025 10:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ffOtTXfu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OmBw0lc3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70140309F00
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 10:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766139127; cv=none; b=eCAEKAJIEul+FHoVZJkLa5JAoJFIc1RHzA18z4L+ly4BrF3w7o7MPeEwDwnlEZTTIYyngkwMWNXqc6TXc8PdmOzLfwouR6uI0zmmtxWuBiGDRXeGj0vWMqsYBlIDN9vWquxUL+Kr/Vox4CXzbVIgrC+lxQK3/0lUiTdTv8KCIVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766139127; c=relaxed/simple;
	bh=bWc6AXEQzSRq4zuby2A5YtN+WTOqqPth6RtesjMEyLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e5q+MDRSgH+yt0fUpw2v3eJte5EbSa8KnPFDiIb/AE1tnFsgLZaZ+snN/2A+2xpmnZoitQ5l5NDvBbHl78RM52z7Qk9xOtMUMivmjhxSIwkxEvrc9wekvTFNq/3XpOKvQ3ZaAgr5bCaeyDhur4oBfgiKXswSVZsZBhZEW+ZpXbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ffOtTXfu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OmBw0lc3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c1Qk4145311
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 10:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xf6jTbUm0qoyYu8gm8niL1dyfimxXVsufFdZ/b8qih8=; b=ffOtTXfujRW6VmN/
	cfHoFdkk+8CHUBWVmPYKg7o8aE7I1ZuY8N4fnbHjpVU2Nh0uygRMsrcM1wkikVZx
	FX7euVdaCfOcr8vjTQsvI9p1KEk4TuDwY1sDBIP6svocPwu5EYBfTXePCV8su1N4
	LYdShGzy5H6y5ofL4W9pybFjdIdWUWegsiwDdcDVX7E/+OEMwAsJi+Z3/WpcnXqW
	AWSC+C8d+ozmpjLR4n9M/xcQxsci8VahzdRJyT0M5w5l7xFHxiakjBUulzCeAqNN
	fV5mvY7/8oFNlsx/JeysK83h7gg5Df46wqlSs9WtgE/zaBt5QnDllvK0d2w4q07L
	HyWNcA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2dt9en-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 10:12:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee416413a8so16434771cf.1
        for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 02:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766139125; x=1766743925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xf6jTbUm0qoyYu8gm8niL1dyfimxXVsufFdZ/b8qih8=;
        b=OmBw0lc3KaobEaPPkY5NyJrrotwLInmF2YxPhjLlogGunlDhwfsacpnq0Y7xhD+Db/
         J3GgYx6i5F7ttjmkRgPYx6QsuGPADfLI2Sbw9s6XuBmaKvy94vwJ52oDUMnw6obCb68M
         G8X6HBxlrdLXgeHHve/TiiDH214MfQsF48dXxDWnDUmbDlAYpUCd5TRQDMgmtpRUYdcB
         F/Rlg7pWmIr2NvxXLkofrPFiRANT6TOQJdNIEKw4RumdDINSdOM4cVPgohQZaTCdR+Bb
         V9tupHTZ1xZ/a9nIZMdKT9xh9gL78u3yS4EUdL++FyyTLYaqW1lLCCGzdGgWC/IlzNhw
         3KBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766139125; x=1766743925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xf6jTbUm0qoyYu8gm8niL1dyfimxXVsufFdZ/b8qih8=;
        b=a518jaBo6RY/vlcfP0isIhtHj/JZcdwuBFLGHttpT7BS7JVikPlHiUxVDzZE1hS3pP
         seJCScC5t4Jm2B27ZwsURTga/x5rPlNX7uKlRDCwO5gNKAsyiIne/QUM4TUw4aRTDWiB
         l3aXrCJUnJEloKYys1SVBFBiRxipxHOotMgSuBY08RDWsvoAvh79EvtHSRhCVN3tccM7
         fXf9m6crBfbRVO23oXStxqvvJUCMJzLdrg7p0bedwyBVdfpBqkD3/NwLKQ9je/YxPZHd
         YrKfVK4wgUQzutSuIsvHuQfpSV4FsnQ81LwiU4ZpLhw6fhe0Fx0TWSg7kNWwViC9XpDz
         qM+g==
X-Gm-Message-State: AOJu0YxBmZjTWs20HwaSXW8Vs2hI5aO/dKAQr5PEJze1GqnbpTZevYXT
	fUQYN+RrlNU2IF3mly2r2DUIANYgudVuDvDugZfwNXH2BDBtt6YunqUBQLbgKPtSmNjxOolRAYL
	pUrdjeKYgZVAWI4GYmkz2Na8X5F84dqfGryoa2SNOGme7PgSbWpFYLlaZsbX5i4js
X-Gm-Gg: AY/fxX5dx0KNLBzwK3YedwuFXT3lf0qU5RS/sqTV+PLo/JN/w+b9izO7BRyaINn478S
	u61CuKjiJ7t/Lh2ZN8WAPlIrBOW8gYBqOAlP2R2hHis8F58T13HjNBJUo7gj0zFPcbTTo7gU8gU
	AcIM1k/bI29m7rJ6Bv1hS3C1g3R03BjSu25+p6J5aeUfrpUYGybVvmOS7FaTqPSIxegPiomaFM3
	+Hh6J8OmINlTe/yZjU/nVezboW1CPi0mLsgfmykDO1BmNQQdyWfNooeqr309IOVlMyDZ/8SnmHM
	iEQL0Ow1/8eu2oESoHTzQOHAMB2IzZW0Iy8cJTB63OGHb4Ok/GupmrXMCBjnc7SuZrPf9jhsySx
	C7oN+0lmgZL7RVHBWLlUdVvi1yDaMHDe/7t0YZte0RRq/LlxgwBjvzcV897lbAMWjfsM0
X-Received: by 2002:a05:622a:4d06:b0:4eb:a3e0:2fef with SMTP id d75a77b69052e-4f4abd608a4mr31870821cf.39.1766139124679;
        Fri, 19 Dec 2025 02:12:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGDTlX0iU36lVyLN46KKkoi/rMtiwt+794nHbi6MbHilGuWk3Az/XiiMKPtVYE7ZtJKns2Yg==
X-Received: by 2002:a05:622a:4d06:b0:4eb:a3e0:2fef with SMTP id d75a77b69052e-4f4abd608a4mr31870641cf.39.1766139124235;
        Fri, 19 Dec 2025 02:12:04 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ae2dbesm197282666b.29.2025.12.19.02.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:12:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:11:52 +0100
Subject: [PATCH v2 3/3] gpio: zynq: Simplify with
 of_device_get_match_data()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-gpio-of-match-v2-3-5c65cbb513ac@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1283;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bWc6AXEQzSRq4zuby2A5YtN+WTOqqPth6RtesjMEyLw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRSTttsAJdpejjeAUj4NiuzzKgYQZACMFLFx+C
 +szUIlcq5uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUUk7QAKCRDBN2bmhouD
 19d/D/9ZlneV6zdxdZpH6ooBKxvcs2CfFE4DmO2P6QlNgRQFQngc0HtgVS9m7dRDcQeHfG6yrbO
 Vh9Rzj/M5JyX8L/WBMguqLMiyRlFoNpkaUFAz+dNZzmrDfKl/MBveRe0PQQv4Lju73CzKa+imn2
 jcMHjgbnI64nDc6uvBL602+zdp3QtvV9lC+5j4FCxgqP6YPuW2GC/EDfhliHNS7BXWB9xLjHtQz
 hRsv23l0QVX9IRN9hqCpHMJIXLjJbP/IDwF5YdVcWOC+oI2LNNWrMzgQh+RSJzDn2AHXN69mSx/
 hXIeGz+2ISormsVP6vbw2GcsduTBMSsHnfBoOEnMkbQjRS93Ug9YPULPNW7WZx1thrufKKeHwnC
 xAc+07Ui3nN/M2BzVG5WBAoknrjCwel6npD4XsBkCsIOcvbW6SVhNLiLSfbekXKjbHLHJvgzZpZ
 Qhsl+/Dpo00lHz4g1OTF3GjXiQHKjU6FLX7MYYLdekNym444BwaQVusQe319Ed3R8gTXZTAC1b7
 hJSokvPN0cidBPcOAuPxxdYXQaNDgJgeQ7mE/3OYgEZfqJ9wLGk+qSYaKkRbOga3ZJ9uNM7OlGh
 W+zi+8HzSLNECK+gOiziR410YSFabLi6BeSuRF4vVxd0yt/d6U+MbdLcdvH6+c57e1VZS6g0Nmv
 VNNg20P3w5Ech0w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: i0tuRrraIwACyHBW237hhhTy2ru7IF0V
X-Authority-Analysis: v=2.4 cv=A7ph/qWG c=1 sm=1 tr=0 ts=694524f5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lsN0KVCTPuDBfKR-m84A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: i0tuRrraIwACyHBW237hhhTy2ru7IF0V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4NCBTYWx0ZWRfX39RQnXce89Pq
 +3dh0VpGdP2wwFoRv84PZ9avv8WtNHeEG0z6Z+gQBlkTGACIjgMy/BvlLskrq7Rr/cwrPr9oDlH
 IfmZWoeSfDK88TK2rnWNqE3QPzwo4fdbPpp1IPrnhTh60cKmA1HIEcAEZqnTbVj74YVg66KgOKT
 fI6esoCLJQXIer9rb/cTpkWFrwdf/ZZcwR3+m3ubW098n7MTTJcy07Fd46Hu6SIMknlVibvJ+yz
 ky7tNMBSi+tsM1RzjD/1iuyAjMSiU5SvzI6fqWgs1LFVVI5i9dv1DbIoZsX6usZdJQepklF1mVP
 0sriJIloWqG/oAsaBxwHNbfhBPibzDctO8L08CpVUzenEdtEnn1m2PhvqGv5ONzCDnnGbhPGhni
 TaS2GpN+6nxdgd9kPaAaee/fhsyikplY8p7xRstEY/t/P345uFIzVENSFOLDLaptJIgGrszx03+
 w9HXIgi9vPn+3KLJ7zA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190084

Driver's probe function matches against driver's of_device_id table,
where each entry has non-NULL match data, so of_match_node() can be
simplified with of_device_get_match_data().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpio/gpio-zynq.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 97780c57ab56..d69773318888 100644
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
+	gpio->p_data = device_get_match_data(&pdev->dev);
+	if (!gpio->p_data) {
+		dev_err(&pdev->dev, "of_device_get_match_data() failed\n");
 		return -EINVAL;
 	}
-	gpio->p_data = match->data;
 	platform_set_drvdata(pdev, gpio);
 
 	gpio->base_addr = devm_platform_ioremap_resource(pdev, 0);

-- 
2.51.0


