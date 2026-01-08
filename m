Return-Path: <linux-gpio+bounces-30262-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF10AD02882
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 13:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17A9830C2C46
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 11:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836F641A043;
	Thu,  8 Jan 2026 10:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ax1AkfTl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="altKtsCl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8876941A039
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 10:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767867807; cv=none; b=uzGMwzlzIN+tQObqIqvu4gyBjhXuZtXSSzZooUpHqP+FFcKG3oQmzx73wu9MGWzjwLwurVKEeTyFnZoHjQqVSATcCgQOveTmmUOfO1P3vcSb1yqezejtTB/Q2gEwu7h9gwc7mgHzsxdN61pc4djP7rlVUdtZDVAyj2MGpVDBu9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767867807; c=relaxed/simple;
	bh=Ftr3IgGvbpnHB7xGwFYCub+vyYQHOzx6FOuUh7ewxCY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FggiBC3cLLH1vKQy+stW7WHQjN7N/YKAgMhEFBRQ1up+yAYMHRBi0ZTaRFjhbL0Cmok7Kj+m++AwuW5vxc9ZmEXNSIisGjm0TQjOVEVUVfyx0leJatdpP1Pl6am9pcGR4AAGyJ3ycddojiOhxKSL16B4/7TYd+vZlefL+JuKDyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ax1AkfTl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=altKtsCl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6087VNED1837905
	for <linux-gpio@vger.kernel.org>; Thu, 8 Jan 2026 10:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=D2jE3DOpAX74BnaJpKPiQEbPatuIX3G9k07
	QCxvKRBA=; b=Ax1AkfTlIFgO49TyjtU32o4Yjy6mFAghVHIeuX3Tjfp7OO8U+Pg
	FFD9GMn5IfDPueIMJwlUQpjpJtny85LnymtO5EW/Apq6eqKZWydwcJ+3s0ryAD4P
	BVFpoMlBqyrmVpvUmNb+er6eZLIHUgM5W0wbmmDl9aCyEdRDaIVjANDKMo6jz6j5
	pcIEHMEht449jQw3RddHB3ODYX34JwIR41k4FrAaWB6s1DUiPIwL4p89QIRUuToH
	KzHQciv+Gty5AChzVBdBRnm6bo5Zpvdqd6rwDJlxKnuKXj0/YTtLsM3yWGoiQxbY
	/6DkdLWxwsgw63FbsIBvV2vIOZNIT+kuQlg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj8920hvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 10:23:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2194e266aso734777685a.3
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 02:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767867802; x=1768472602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D2jE3DOpAX74BnaJpKPiQEbPatuIX3G9k07QCxvKRBA=;
        b=altKtsCl8VPN7d6xkUalzRrEtvHF2rIjTUkO5GkyXbL0r/UwB0CSmQ1W6v+wehP5yI
         hiGUWg71quaTh4vMPxYyHdn8FFLLbOu6cumlBkLBs+edaPb2BgJr+MxW6ITK40T9zqFL
         D0c33ejfVpQhaIm719wIpTznQXQozW+NXS3osfZfo1odOMTbeXgWfKLQu3i/jMkqjmPq
         4ZYvuLhm5qFUnEhrF/swlWfs71D3i3LpK6yZLahkEdV7xWN6l/kxH7+JyR/Phw9ZI3VT
         MJkwsMatKFEFnkpavSvc5Qfhnu+HRk2LiObjUGsAASCNuFUNj00rSnsLpOJAurZU93bl
         g+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767867802; x=1768472602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2jE3DOpAX74BnaJpKPiQEbPatuIX3G9k07QCxvKRBA=;
        b=Kw8G3sqQszJtwOtlgntv0QQS2hiULusHzp+CLpqROwNsMvOFhkI650OAXDjpcjhlV8
         CLOg/7ufZ9ucSHeTh+IVZTPResigTcSWiipGk2SjKGcp8Tdm15qm/+8G2JCh5gXLj/1m
         A8pnxzGtjQHhy22CMyxjrfhIOWVM0kdEdEJkKoK3dGEtQJI46SxEG5KhBTIy/EJ+01bt
         YrqNeoHEPNY0QPeqy6rHZQnDFZUb7vNctskA87ReQM0AHNPM55a6IOb3VphCRssX20la
         I5+6qflvqEfgcM3ECZfKrsYKKsZ6ZOLLsT7rgpiVQ0MbVTNZC6rKM9bY1Ss1DrpB9BIY
         Ve9A==
X-Forwarded-Encrypted: i=1; AJvYcCWcM+ohc4hbZSzN446IAJoDT5txoy4sb3qokbw8JvVBg09UtVw1mJYFLCjflYh7sZHDB8wcrBcN0NjD@vger.kernel.org
X-Gm-Message-State: AOJu0Yzco1rufyQnGZgWRrWPe2XZUdoaekLhlH8hK7V8hNl1LvRJfPMd
	bAsv+k1SFgT2iDm0OoNFcG8+cW4/O3+68eIOKPKZqycEyhmgS9GckPC+CunathkrsaXNCCxcgXb
	FM19tlJbtp7NLUMMugjaIShoI6koo9q7K4YOMGoGdCvYNG/Ej6tZdQ25cIHNFcue8
X-Gm-Gg: AY/fxX6g2HzUAHYXEbyu23HMWkcH3vuayy+HBp2OMMR9iLxLNsfiGRe+4rGk47I311K
	94vhwOiQi4wXzMKwPHKanh1oAx+XPAIJg91SsAKJKyx9JRANnPiC55KKyxtgy/QGdMP+QZ1B2t5
	cAPAVfUPWAcBNTuuf9zxjVf9ojOxUV8nlEiRYlNFF3e0YuLGNpcPXJ19cxd0D+SIiyw5S2Lse1u
	4YzHhnkDGbYXJflRlYog0/tXF2h9TKIcsM92ho7b3loHbvtXwyMG26jLGrpZHLEqK1i9IN63yPh
	vDY6jQRvjQKIsSUe3p0wZzUBzwQhL23k+l7IvArQrh2eE/FbpDJw05OO8NEd7VYKwwqkEYGG9xi
	rSCqCuvdFPwUyYxulzdk1wsQgBhVE763g9TjYhAw=
X-Received: by 2002:a05:620a:390d:b0:8b2:74e5:b36 with SMTP id af79cd13be357-8c38940bbf7mr774852985a.68.1767867802149;
        Thu, 08 Jan 2026 02:23:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6bhWWJawZsOJcxowrutES32Z5Bx2kDL4bbATPF80TkLboG5Ysx189zsCeAz3aQsCgHhNmkQ==
X-Received: by 2002:a05:620a:390d:b0:8b2:74e5:b36 with SMTP id af79cd13be357-8c38940bbf7mr774849985a.68.1767867801771;
        Thu, 08 Jan 2026 02:23:21 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:2dfa:dbd0:9cb3:22b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f69e802sm147574825e9.8.2026.01.08.02.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:23:21 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] gpiolib: fix lookup table matching
Date: Thu,  8 Jan 2026 11:23:14 +0100
Message-ID: <20260108102314.18816-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M45A6iws c=1 sm=1 tr=0 ts=695f859b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8
 a=EUspDBNiAAAA:8 a=aiDJYg_SX6YcQUpIuH8A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 3ZucTPu0mzIEvRwpTcyw1FCC8nd0cgoQ
X-Proofpoint-GUID: 3ZucTPu0mzIEvRwpTcyw1FCC8nd0cgoQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2OSBTYWx0ZWRfX/YkDG7I9xZ9t
 KQVdFY5lj9Njjx1FDX2QdmguUisxIG1lEth1MPzkJaBowD9JqCM4yOTyxJQjcKYr+6sFtl3ie90
 KuTCXDccBH+tf2zoQmrFwdp0LNO6vZCkcg4qAAWKMlsXrtWlGO1aedRjxtsMjKDoyDT4wUAKoME
 YKlDTYwAOY8475biYocAXIfCwHGQUT4cNaDxPaBHrvdBspAQkWMF1+GkL/GD7/TMkJ6bR7a9cfL
 g0nnbFJqhSqKgAyPsi+KoGb90+h675cANjiUt968D5q9pR0ZtIL1zMSmvOVLudh5FHpVUq/pami
 TxML9f+1gq2xCCeaZ1YZHOonfdvCplJeVONUtCLIzSQnjTGbAbcmyHxT+lOxUe4iWhG18Po8Cd6
 4mZ8k77+7uS3UqcsIhFF+EaPngUWPpcwlvnNSa8+/WAFu7IQtzwMWxHLK6nn8aIaKQQW70YxXe/
 hqQMvSNbrcq6eXmIuIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080069

If on any iteration in gpiod_find(), gpio_desc_table_match() returns
NULL (which is normal and expected), we never reinitialize desc back to
ERR_PTR(-ENOENT) and if we don't find a match later on, we will return
NULL causing a NULL-pointer dereference in users not expecting it. Don't
initialize desc, but return ERR_PTR(-ENOENT) explicitly at the end of
the function.

Fixes: 9700b0fccf38 ("gpiolib: allow multiple lookup tables per consumer")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/00107523-7737-4b92-a785-14ce4e93b8cb@samsung.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fc382f43f9fc..0a14085f3871 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4602,8 +4602,8 @@ static struct gpio_desc *gpio_desc_table_match(struct device *dev, const char *c
 static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
 				    unsigned int idx, unsigned long *flags)
 {
-	struct gpio_desc *desc = ERR_PTR(-ENOENT);
 	struct gpiod_lookup_table *table;
+	struct gpio_desc *desc;
 
 	guard(mutex)(&gpio_lookup_lock);
 
@@ -4619,7 +4619,7 @@ static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
 		return desc;
 	}
 
-	return desc;
+	return ERR_PTR(-ENOENT);
 }
 
 static int platform_gpio_count(struct device *dev, const char *con_id)
-- 
2.47.3


