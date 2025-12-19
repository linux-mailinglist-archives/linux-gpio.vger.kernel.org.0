Return-Path: <linux-gpio+bounces-29754-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A51B5CCF588
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 11:22:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 691C23036957
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 10:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F5630F529;
	Fri, 19 Dec 2025 10:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GeF5/jDR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pe7WqEbJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF3B308F35
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 10:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766139126; cv=none; b=sP5olDx+BtKMTcr+8+TcydSOVR1q/ZfCjTZzxFARoqRWXSpBOa9oCdGHJPIQgjYhMNg/Rlk8Ay21DBUhdzbnFsyzRtyISli7J5RmbPgG3Lg9UYm1gI1olFq0s0v4peShf16+Vx/DQDhQDzTC2hfCBBpFpvQKqDbMzg01oj+KUPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766139126; c=relaxed/simple;
	bh=M1I1B7Udnpxw3kqOUmTDz8mzC1Q9PDPSdhxdkZyTeg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VRAbbv1vQT+FFJjHEq48OIN9E99pSH93+P02jhYwuuOBsnsD5EX+ZVBaMJa3VhEZ57q1dhWB76zQnj+eKwu6Ib23zbrQ82Hh0Utr0ZLDmYDG/FZSjaFsTgvIdi1zq9Zj1uzdF/Aj5q6R8Y/VfEd/qrFWWHX80l27ARW4nnehXnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GeF5/jDR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pe7WqEbJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cNIK091968
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 10:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e11O7WAtQq0V30sjydUBQo6QneVAGBPiSxZEi7Evnj4=; b=GeF5/jDRzvlTX5tk
	KBeH9RWWuiWLoNcy4OQ0l5vlkkUN2mr9hTQRTfIwV7EYaZWgWpO4Ton/fzyJIYUM
	+faUlY7hnMJlOq0i4fpga/eQ4ZQ/zrWfasFDIF0vyqtKnz4/tHgNoL7TeW5lPdTM
	XrxvU9wwp0PXGU1mT7x2tcKBqHZGtYgCcezB5fLp2+UE3K9gs/Hn7wJNsRkLEEer
	ifcfw1EbWZHqMSLyqGUFAKHnSEIvOumcPY9LDKgdufupaaAze5i4aH429Rn/03EB
	FrM6zGfdfPaAwfpZmWniuqkjRfSTamxX5CMShKG4eR52WsDrRFbyVAeMEEmADSGs
	qxEY/Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ea8cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 10:12:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4eff973c491so35698191cf.1
        for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 02:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766139123; x=1766743923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e11O7WAtQq0V30sjydUBQo6QneVAGBPiSxZEi7Evnj4=;
        b=Pe7WqEbJzNJsX+W/G9C0/XxvDUnxms2zpky0t31KFX4P7z0mpAm1lz93ZlmProbskJ
         9dipjDMnD7/VxQcJ5KhtHmNG5C4lsa/GGV4uqNTXMMDU+c+DNunpy7DOcparZ0OXy+vl
         H/cCX8DcfFhbQckXOGeXPB0d0xTpNqLKzcvzAecbLJoq8zKyTMCsCcgKkiaDfKkwmq5p
         EpElC/frFrfRGcMkyOXvnEf11uB+t8AdXYf1fm7+K18B6I9U8jqkeP8op6kaAHMolWkZ
         s7t0WiZkJmjw2pjdauDEZBYYIedkIU2TVGoSVwizPOQUCWmSkxF+RGzJWnjmkUUOS9f0
         7IqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766139123; x=1766743923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e11O7WAtQq0V30sjydUBQo6QneVAGBPiSxZEi7Evnj4=;
        b=IUS1VWgIwapuhIKP2TYdF2jm+1rLmEfwGBGDMZV6yL9Fol6oSlGRyYa3ThC+8aQZSd
         o0C9RowX4cD0UTCbkJ5HAeOQmu13Uaml91xsWghCBUSMFSCqFflpviBLJ3hbb3xPDVNq
         qwmdamLhEPT2CXTzxcH11LluiG38GHenTkAEtEIiWoNvS6563CMubrDE5JliaWzUWzwg
         Y7tyarLpgB+9DgJbYyG/bVZOQ1QDLPDn/dlbRxjTqkKABJQzBQLM0hk7Ddix8HeZTE4T
         YLjrrgpwNNmRxOqbv6bF+QceKD8lqulsIMRhF43bjzYu2Y01R/HvGWLqKi51aXCwg3/6
         aJZw==
X-Gm-Message-State: AOJu0Yzf1JRVH8DZPO7lixU080/iz0Zs/YXIDJzcs/3LAXqKyx8OqA5U
	sE3TTLxGgsXnfLP0grE4yKTbNL3LMC1zeW9CtQ5xrDdWQ6Nlh7MgKktSTwcbxSPWgLspn9JC6aq
	8uZWh0FxGHor3eT8pi1hpxkrXC64RNJiuFmWtvMmeSe8/pJhSFeUSpM6VBw39ZrOp
X-Gm-Gg: AY/fxX5fCCqOtFwg6+0L7Zd5UZ/oBL8ePHBeBv5XF0HTWSrFbp5mFf3QfAHSo36DhSg
	0hEo0OYmMxP1TP64/TDKNyVc5FfBDP3mxcijmotblYVAotcaACsTvj7CUWQilTgjlGpB9lXq7Qt
	x+zal5O+SQlU5BsKjOVeRkSerceTaZL2G3PyZwnIIttojZYDqyEqAF8GH6DckKuX3m1WvfizIT2
	EPE6LSPltgfEHXTL2J91fa3V8+QrvYJP1s4UfIAd3mzn1OA68HM7v4mEJ/Z71Tg+WBGSzYL97Zi
	7G8+RyzufgpH/oXeGw9xncUa2Cpj79gJvciwjhhgcirqi6ewzo5b+RIRPg8zmqu6FRP7Gh+1wvT
	RiXaG+jl5WgQ9mox5NB9MoObJ4r0aDdN/lrRNepM+Ibj4LCmH5VfQIy5KWAbc0r2yk3+E
X-Received: by 2002:a05:622a:10b:b0:4ed:bad6:9fbd with SMTP id d75a77b69052e-4f4abcce28bmr28251851cf.17.1766139123142;
        Fri, 19 Dec 2025 02:12:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYPgSaCcmPuoSfgXGVgvOFCxSBDDQbQDNSQ7Imo07pG5M/eJ4s1sl+/JwMksm25q0myLjohw==
X-Received: by 2002:a05:622a:10b:b0:4ed:bad6:9fbd with SMTP id d75a77b69052e-4f4abcce28bmr28251701cf.17.1766139122704;
        Fri, 19 Dec 2025 02:12:02 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ae2dbesm197282666b.29.2025.12.19.02.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:12:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:11:51 +0100
Subject: [PATCH v2 2/3] gpio: creg-snps: Simplify with
 of_device_get_match_data()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-gpio-of-match-v2-2-5c65cbb513ac@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=M1I1B7Udnpxw3kqOUmTDz8mzC1Q9PDPSdhxdkZyTeg4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRSTsTLtOg852rwGRRm63SKoAk11EUA/5yATfQ
 DO+VbDO5TOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUUk7AAKCRDBN2bmhouD
 19BvEACXOJ82lmOwWQMSgzD0/7AV53q93RIe1/uPbkJ700ZIodWgSNwvAQOuJL2t+iJjswOoa+5
 g+KiL3++EVh57qeKMhDO+yZddKJ6FmBBk54v2TYk//064TQLXKrq4uMMrpVAGNUTgdr4Gi5VuTn
 hSbJC+UO9+DqrqjV2LhTfdgKzfcY+eo3i2cECkxN4bt2o9afuPvaDF5tm3Dfd9RT6NeDx7ZIWo1
 jltnNlPO1kBiAyXo5V69KRadK/kq2KwNE7p7Ff8SOgUM/T0yzhLiLWnrEmcA4/2uyylVsf68LgS
 GXAo5JqGkrsUFhwEPqkYrtJWatupgA8Hoh9ihAlQZYOQ8+28a1Y7ynm+cTPJjpf30cefaQoAFj4
 oPNqT4X8N9lQzYREgZX3XP8fa4hQy3aoDPeL8CCmSR3eqq7zZAXWuKXDaiS7GC0rFh2dpQPx1nD
 HpYt6mxmFi99aEZ4Q9nuS+0+hiVhhUqaT0TLTYUAnuz8tsqnGPLLd8U+xkcUe6v4+QHCgtHjOOS
 n8RPq4/pus8WSdRRqeXiCgF1Xd3gtn0DukbIqFOnU5XCIFdtcp38X/5P/UNErhukcsol9d54//V
 O4J987p2MsiD4NhRY/wzcJ9pYnlb2ElML30pODiLxUti7Z391ROqFczfNaRqOt2rjC2ziiZV/g3
 BrFenai+e+qKnFQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4NCBTYWx0ZWRfX/hYfJSi3kx87
 MSx55qg9NoHOqBe8Oy5hyP0p7qvqtk1RDoSlDNFqi+bLGCfqHYFz0boxB1xBVov8hxkFEMdetvp
 6WHwc7W71aMlQxio/OsV/PXQ9fvIqk+QiQtJ8rxKGcbS/Vhjgke+gZNo/useofh4ghGXlJ07ACq
 dLh5Y5KHWByudQyyikzzwcITdfsD/M/m+yz0uq9o7X66lvjd6t2T1XIB6AzC8MUBgU2KpfZfaWN
 2aznyY0rE36bTYZhDlbWef0ByVhCa0/6ikkiMlu7d1WCp1lOQLKoeRxdpDwKUcux9YWg5aTB/QU
 9e7ShVipmrsA8WNYk/EjCsD/079ufe/s+GYhyTkgLTWAWWc7mjDFQ8mSgrJaXj0sIli7f/1RmVw
 wpShS0N69ElFncthCQ1acnt2WwuunO11o+QKrHB9yscBYrQgncTdOpqwMNWzkOVUstJzsft+iYl
 FXmWNZr+nanDwSjfZKQ==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=694524f4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lsN0KVCTPuDBfKR-m84A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 9R0i3wzfj8AF-Zwqg6a0VdVDcn-HOyEO
X-Proofpoint-GUID: 9R0i3wzfj8AF-Zwqg6a0VdVDcn-HOyEO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190084

Driver's probe function matches against driver's of_device_id table,
where each entry has non-NULL match data, so of_match_node() can be
simplified with of_device_get_match_data().

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


