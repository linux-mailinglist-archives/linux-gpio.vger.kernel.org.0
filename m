Return-Path: <linux-gpio+bounces-29763-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAC3CCFBE6
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 13:17:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57667309F4B5
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 12:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3C9220F49;
	Fri, 19 Dec 2025 12:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hSY/Ulyj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KZVJfndA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784FD2459ED
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 12:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766146404; cv=none; b=h4dArHCtmpBWWN2da/BbvfhK5HqCTagiXv5nTuhpK6zGOe2oc+6RN216LuBXswmaCgAPDzPIAIHj7Bw1dEdaIYXHJAVf7iHjDfOgDzxmi/JixlTg/N8zCDqiL5i6EQR1u6NOUiyDG1YHuEKMN6ybMopLmi1ZlsBGBww4144q1b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766146404; c=relaxed/simple;
	bh=ALFcaNrjkTb0yqu5k4foi4OvdSHKHGr16rJMG/50MO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RvSOrQUNwJcD9NZ+71Cg+PZxt9CREIbTSORzJFcPy4AcPc19VM0Zuu/3kYO5M6kbW3/JcIlE9YQfk5agF6lhzsvae3HDNedO7x936sDwTwwNtEWuM5/xUBDkMZryqM0BJzCC/MBGkpUQmJXsYZbFCfnV83AJlLDH2iwpuWlIxjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hSY/Ulyj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KZVJfndA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJB87Nq4000448
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 12:13:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cpKuuYddT/35x9durSm7BfkKTaEQ/oAbHtPUZNiF0xc=; b=hSY/UlyjNX3LRsgs
	PbgGdzteVcbM+wm0pe5N8oujULHxWNRFD3VEyHkYEDH8575IUn6m44szYkj1U7tN
	qzJfBevMwpd8xcykmXD2ciGEDDaXVW+ekq/Lq/a+GVpiKC2iyq1ACaesX+horS0o
	rzt9V+WUFbKhwConG4kDKz4/a3uwmwuLlGeKT/OpSuCGHNWqLxZIsg/R3DP6Cd1V
	zdn26rt4yua6hWgLHDln1PUvQMIFs4/RbmCR366AomVye452LsPe+HUbgmFMHfCq
	cyeYFKJvs5NbI60BwDA34PDkffbd/E5x1G3lyEoI6uUk54roeP4ZzfP6dmjHtwuv
	BPVldw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r29jkyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 12:13:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4a5dba954so29603941cf.0
        for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 04:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766146402; x=1766751202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cpKuuYddT/35x9durSm7BfkKTaEQ/oAbHtPUZNiF0xc=;
        b=KZVJfndAsIjhWaLJMWIcZclQqB2oppiBv1YgLj1K6uT0JJJUWuBxAxpcddDoFV+Ucw
         x3fOfx9BKgsVFMFwq1LtlkDJhd1cpV5SAHS3JNFfbuooCmg+67+vefGrAGo8y4W5V69K
         MeItKLj/gdsqZ82RbZCwcP8+nYQdfd+iworid1q5dvQoxT3d55wmeMJGoszIcA+4diul
         o723SAcf/v9LhFjczHoeWD3pxj1P/hD0jaoqguTi+Jhfs7Arifz+D3UCoHweGGBFqzkG
         bQVuvMxTwS3IC7ZUcH2Mpmrz7I0J0++OLWbKNqvgsyrFjlFHo+kK9zRP0Njz0CHOLva8
         3ydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766146402; x=1766751202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cpKuuYddT/35x9durSm7BfkKTaEQ/oAbHtPUZNiF0xc=;
        b=o8Z1wA94l2AnopMsS06jIXg+IRzfEP/BV+0DxwrlttZIyT82nD2JuU32vZWX511dyC
         e1M1G4qUZSabgVJyei3o3NOF8NmIFQeW/JAqgPz9ksilg7raq56IqV78Bpx+yMSos5/6
         BVzOP9p+LOyR2CSG6PpMgWK1IIC+LGdycLZY8wTWdSEZSLAdw6ttxfj9dGmIBN0YhrE3
         X2OqrGtb0R7/YzdAPoIF2Thye/xVpzvtm1eb57WztOe1RfTmNgt3MB0yWTk+IbeEYJrF
         OJFptg6yz0CiJ4sa0h8rvZfwJ8y3bIj0cV2bcCH3omEj9u/WtsY3hKf65sb+ZJBbgInJ
         gY5g==
X-Gm-Message-State: AOJu0YyYtM6QIm5FRitjoWO4TzzZOG6mUqR2yRp3ZwjbOSwzzYNucXBZ
	qaN5r4Inux23ZKQ2+j0YiGMI8tRoSB4mxjn/lr4IC6FqqT10hCKSnD9VY9FtQLr9CaESikPzY42
	clLNq8hFOAmrpTO97gF8KQk4fDYnQtTo9MuQRUDrd9di5konb12TGk16FLgdSNZ6+
X-Gm-Gg: AY/fxX5CKo7awxFWRdN2XpcjoGncIhBD/iRbnhuNX3EX+7e5UswJLqWPu4/iGL24c4D
	M9f41Z5Er3V368JLQoiLwco0Rogi+wdNeJvcZNwGF7QRvOA3zWZ3FpRFahoWjiM3neiReJKQ6zF
	8HELKR1GvUr+wNlSEDL8BW4yOd6t/O+5IBgovI6lAQ2iesdPVo/l5Cq2o0VdwQJ85CvVJEQNqQe
	nOmaSHmmv3ASHOMN1tgd8iK7rPI+5jFZWow7ZbaDMcjXKrK9wfHmtY61nQD9W+KdiKd1hwsfUwf
	V47HgEGCkFpj93rVPGHkrA/knruYb8Kw2chyDeet1cVw8Fr4owb5x37hJhxnWzx8nq/pElpI4qy
	Kqr0V/UzbfhicDi3puBwetS1f2HDoK1p0Qnr8OqaX83ovCsD3g0JYHwIYAczQsyNzknJa
X-Received: by 2002:ac8:584c:0:b0:4f3:4379:1ba8 with SMTP id d75a77b69052e-4f4abcd08edmr29079281cf.10.1766146401716;
        Fri, 19 Dec 2025 04:13:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMZuy6OJt454wVzJl9NiQKiuM8hDeZh6vCyymsGnhdSh6+zZ4FAuhdp9gWq5mTNSCE8zMgzA==
X-Received: by 2002:ac8:584c:0:b0:4f3:4379:1ba8 with SMTP id d75a77b69052e-4f4abcd08edmr29078941cf.10.1766146401288;
        Fri, 19 Dec 2025 04:13:21 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f48606sm220309466b.62.2025.12.19.04.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 04:13:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 13:13:12 +0100
Subject: [PATCH v3 1/3] gpio: aspeed: Simplify with device_get_match_data()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-gpio-of-match-v3-1-6b84194a02a8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1473;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ALFcaNrjkTb0yqu5k4foi4OvdSHKHGr16rJMG/50MO0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRUFb0KKYMqc0n6u3g4Eb8w6rsjVgT9ppWrE4X
 /pWcHDcPV2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUVBWwAKCRDBN2bmhouD
 1w0PEACHjq8HZk2ogKTIKiT0XzhFTKeRnhQNUWlXhuuIdHw57FqpYXNOlyB5uI3W2PjErBp2hmw
 fnDSESZEL8yPbc1PaIl9MM2fdzw2qfcmLeDUxqHaz+/jX6YPG917XRga+q2uY0kOdV52fP6v5Or
 jXSJftdeIbmj/ogFmMQdMLOUXTVnlSrmH33MidZtlIT6tjdzq/B5o8Rc0gW4jL91klUL9zdHg/T
 MRphban9QNoHJvL7DAynuv5fkX6LzwpoLc5Cfg7x3TiwFAuey2NghjJP+UPwVe/IX05ZUZBWWNV
 MgsVrxcsSew1ui9D73QsT9aOzfxaYpDfZkTEifq/nH7SE+dJGVHUy/M12Ef9KPlFVR6eezKV5GT
 MpvsQxYtTPM1yv+6akJBVKbfv9BxQMakzIgcMrk23xW3yeVGDkcZxbQxWdur4FsBeVkqrxl9prI
 UUAYRkCMl3M4Que1OQSCVXV0a+h8/JVb4JnE5F+7H4/+bG6CQ8b941/2+sFASknoxXFYLnOHI11
 WOK5/7TDxj2UZlqUEcFZnMZRt7UK5xdIT5443y6XCJ/EmeEsrluxnRuRFa/zRr+fkVgpMOK5hh5
 RvFaz7cORvl24YOswZO6O2ELRaFLt3zPubfd+gvabUntk8hM3WVC0hGBJiLUizRAzurDx7gisee
 /jIQTovdion8pAQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=P6c3RyAu c=1 sm=1 tr=0 ts=69454162 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=AxvInAFV_DmKQgZoSDEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: GtTaHrh_lexjRYDP7drDLVswQ1iLi_ZG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwMSBTYWx0ZWRfX2Xing/ImJ/4o
 Kb5h0MKXXIAlF49UOgxZaSsPhN1p4M+KraI7hKdN+EZlkJSdRh/aju2axyNu2udh0kdWnJK3SHk
 hE0drjqD8fhQkfCZfraDPQL89k27kIJORDg2lLQo4aXSzjG8KI4/NgjQeJzmJcx63TzISONGdDH
 yS8gOZ6nuXnd6fF4f93QlLTWCvCnt5Jrl77i7Ndt5GABoHHCbX/e5zr9oVw7vYLFvm71U2EnNwn
 dAVWa7ZwwVQv3EgwVhJmpLsbpDbNoIFHXitGkqF+3KZQ2PyzFXIABF+wrJWAf9A1Csa96Wj+vIV
 fgERXUOP+YGDTiQwaoH/0qQmO15OM16mppTnn/+wfMg/C5zcVIDnQUU884qpTs4gti+16tjQ1IU
 /VT5xl0SJgSSkTmR7cuzqhYNF7uvdKria0oLI2bWzUddAuAXwrAi8aAuFlzHig3sEskwVXunGBL
 pHJ6/QJeAqjXMKsOXyg==
X-Proofpoint-GUID: GtTaHrh_lexjRYDP7drDLVswQ1iLi_ZG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190101

Driver's probe function matches against driver's of_device_id table,
where each entry has non-NULL match data, so of_match_node() can be
simplified with device_get_match_data().

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


