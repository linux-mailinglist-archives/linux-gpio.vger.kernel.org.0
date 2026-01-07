Return-Path: <linux-gpio+bounces-30212-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A6FCFCB23
	for <lists+linux-gpio@lfdr.de>; Wed, 07 Jan 2026 09:58:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D0903015D12
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jan 2026 08:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351A92E8DE3;
	Wed,  7 Jan 2026 08:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cGPo3Ny2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bj2SBxsI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8582639FCE
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 08:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767776323; cv=none; b=WYKzfg6IRuuM8GsRGTX8Kw/isABMSiWz3Ef8QsoIe/5EM7aqBGyzuabDWJ4JX/ElidRDKT3AilpIIEFuS4Kl93usSSFouv23P/k2IvpzKTEtbtoTcK14IEM/RlWQldhXV9LJkeLOheMliEfI7DxND8iWSv5avkNORZqJSYtDQf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767776323; c=relaxed/simple;
	bh=sjlN4pR9R9fEnwmcTRS4xZJHRowWfmiEakxeNh9KN1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FfMWEa2Vsy9CQmcXZf0lfDsdEfCykeUKA5K4JwoOe8wugMD3Eg/5umRJvpZW6kXiC6N2b7lgmKD2YFA8LU3OvU2U4MldhGqGTakBccWyhhvShCaLz5rtpi+bx5/r+y5mnk8DVrtpQXKj/lD7NTiMGzzFlRSRGcQwDhfpdc2D9Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cGPo3Ny2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bj2SBxsI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6073dGAk4091593
	for <linux-gpio@vger.kernel.org>; Wed, 7 Jan 2026 08:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cqkCNcY4K3V+l8wWDpRmocDU4wuSqzLH/Pv
	8p+vDVrk=; b=cGPo3Ny2LmHSDLkDwzZ2xkMEe1cSrII1+pJTmMSfIAzmtOKIzNV
	O4gXpdChMulxUalo3KasBYVwSO9XiAx2k0V1F6LNTEI51NCpAFFCo5C/AP9RRpdX
	bex0q6WQXUz+kIm8hKt4YdsQgUxs/CitE7fZ4cNmuXt8hOQ5gVjxSVrXKK/sjJOy
	KN36G8EddNGpSiF05kam47+72zE3nEjl9uDIdell7BsSYMJW53umVWdAbwHWMK/7
	mDQZszUY/4p19gB8+dWTJGT5HOy/Z6N23PsLTverWrJqYEjoXCl/gBfn4IAtq2h+
	gSx93M/cL8Q0kwGLx88w2W1g98QDY2j10wg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgyunbspr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 07 Jan 2026 08:58:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1f42515ffso52603521cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jan 2026 00:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767776320; x=1768381120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cqkCNcY4K3V+l8wWDpRmocDU4wuSqzLH/Pv8p+vDVrk=;
        b=Bj2SBxsIe7xi6AQBoQsDsdrmsY+jeqs1D17Z4Eb+OvSoZklcnGCpmY1cbmXPKQEsI+
         uNtZHngxPCoPtvc1vj7ovt0Ms3AQRyQIjSNRvUZ7/G0+BMGyxVW30+sM0bpOfqTZ30pR
         1bubEZsYnTcj77/Os7+MCNDzX85bxh9/tipdtC1jVopBqhw2DbFwh/TE+eiVYmwfF4+C
         oYf7z8ooDDiBJr26jsDGH+CMxclZj8NHDi3D9Exkx8p4GOXTJB70FEGCS3vsKcDDI9cx
         PmJLDteC5TRo6mIX+fYTFJGjIhGv727QiCpZeU/k7iKQerM8spw+rwrIWjWgi1ZVfnUt
         gk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767776320; x=1768381120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqkCNcY4K3V+l8wWDpRmocDU4wuSqzLH/Pv8p+vDVrk=;
        b=xJ8nghZjd2YWdtXnH02VRIKHzFqD8jpB0Wxo+a46U4QlfYk1KjL/Uc5FoC2/MDCLBr
         k1Lvi3O+wGyZSD39YG0fB1uh1FaX5frVHTLvmbwmsp/SW1DQ5t4eGxiwfcQbYKkag4Xn
         T/3KmMpglXO7eduYxqr/0M7pUyTLeffH5V+5CPFCBzmF1xEgrMZ/EmlLWrFjH57yIKDV
         3sAtVhqcJ1Nr56CdzIA0zO/aJ1U31PRtHVks73M0WqGOjKN0vr99JXWJL66+4xhpANGh
         66UXruW7huT9F3Mwn7WmD57ldip8IqkejFbby/m8y/vI7zNXlIQR++anV0G/akb3tN8U
         76UA==
X-Gm-Message-State: AOJu0YzJNM6Nr6hHPtBbGNcYvmwB5rUsUaPUj/d2wgLHn1wL5rPfbktH
	o45VHksq0y8EztJmJVfS28J7haLuV5IkhUXHzwUboMb3fGZOTKTla1JpJOyEy5Gm/uohmWDZ0LX
	tjz0hmPQGA4nIEcn59vBWqu1qsQqEigmFKZ1JBDwk0RmNWR5fUvF+97VpA6d69F2K
X-Gm-Gg: AY/fxX6H2h5/pBU74iJLtITpQ4er1HNdb8iqaW+fCJ5yH5fyu4KW93iJNwfMpHHcAPk
	uWupOSaSC1GwYwr1C6bYdOb3JIsdYYfo4Vs4/zhY/YSz84qbejvSb1x25Dojg6YRzt7B+wSWqks
	a1CCU7rc+5I3teBVzAkabg9Bt2tK2lgkeH0W5vC/L8X/9ojcmUmhZhpPOZiheALYQ3RWS+3HDIH
	Hi3PcXX8PAL5ftP8C7dFiASpsoqDJSxQlTy5nxo1Xwn91i1ACTGJwyihhdn4ydWUDuYV1Xzyi3t
	LznSicaXkYqycm20wfE0SSPnBgc7S4ho6eBhz6s/WI2zCfAUc6BIgJujej/JkzH5gfuFf0hytJT
	kQZcaMnBr9t09H5wFPvHUrhsfckL0KHfwYoNv3Q==
X-Received: by 2002:a05:622a:15d0:b0:4ee:1c81:b1d5 with SMTP id d75a77b69052e-4ffb4a3e880mr21245181cf.46.1767776319762;
        Wed, 07 Jan 2026 00:58:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF96OGcUtEOM4Psc8sgo9R3lRhIlXlER2V5kmLltVS+fsOjqHZzhW6w2qIoFsaCy9urNg/bvg==
X-Received: by 2002:a05:622a:15d0:b0:4ee:1c81:b1d5 with SMTP id d75a77b69052e-4ffb4a3e880mr21245071cf.46.1767776319269;
        Wed, 07 Jan 2026 00:58:39 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b90b:ec1:e402:4249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e19bfsm9145792f8f.18.2026.01.07.00.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:58:38 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Jonas Jelonek <jelonek.jonas@gmail.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Thomas Richard <thomas.richard@bootlin.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] gpio: line-mux: remove bits already handled by GPIO core
Date: Wed,  7 Jan 2026 09:58:33 +0100
Message-ID: <20260107085833.17338-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3MiBTYWx0ZWRfX6KNyQuEfHYOD
 ibsokG1B4Kq5dxKby11biJXeGK14m4TzYhE82RWEIpp1R3bhSXvQnJ6RBM7sIqwuelzmc2uD9zb
 4MHUUJZNVH0jkCIaJoe9lAr4KY5eXI/sLzPS/+xQYt8zWc3M8lEiiMKy7JUGDtrXWkzcT8RLRuD
 wDphamwPCfRDt9mcDBAs0LyeD1/em4tCNoWq7FSzZZ0pLyRikKayBSgBDcmaWo1BVsmRzvYUDgt
 CGw7KYaaBuZRFtY2lyQlQMiwFvi2Atl3kOjJkAf956OuCh6Mcqz9p8Lp5fXH13DCPuH6XRZqojd
 yk9HceNJzFGxgxiVHMbHtwemZG8pUgq9lVF92bc+HCclBvwrvHigfBlsMNic3PFtbHqQBZv4Eck
 90WDiGxtK9SgQoVl+vlAf5vzvTMMdSxhfmwGx7POyaIFq3Fa/yysVBZrcDPb+r5sX5Zo6Vx6lvq
 SUdRNw6WcppbMBgQkoQ==
X-Authority-Analysis: v=2.4 cv=YqIChoYX c=1 sm=1 tr=0 ts=695e2040 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VzeXDgSa-F83hufpAqsA:9 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: m-tLJLBvVvTocPQpTLHP5nt2_jlJTXNG
X-Proofpoint-ORIG-GUID: m-tLJLBvVvTocPQpTLHP5nt2_jlJTXNG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070072

GPIO core already handles checking the offset against the number of
GPIOs as well as missing any of the GPIO chip callbacks. Remove the
unnecessary bits.

Also, the offset check was off-by-one as reported by Dan.

Fixes: 2b03d9a40cd1 ("gpio: add gpio-line-mux driver")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aV4b6GAGz1zyf8Xy@stanley.mountain/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-line-mux.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpio/gpio-line-mux.c b/drivers/gpio/gpio-line-mux.c
index a4f384306218..62548fbd3ca0 100644
--- a/drivers/gpio/gpio-line-mux.c
+++ b/drivers/gpio/gpio-line-mux.c
@@ -29,9 +29,6 @@ static int gpio_lmux_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	struct gpio_lmux *glm = gpiochip_get_data(gc);
 	int ret;
 
-	if (offset > gc->ngpio)
-		return -EINVAL;
-
 	ret = mux_control_select_delay(glm->mux, glm->gpio_mux_states[offset],
 				       MUX_SELECT_DELAY_US);
 	if (ret < 0)
@@ -42,12 +39,6 @@ static int gpio_lmux_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return ret;
 }
 
-static int gpio_lmux_gpio_set(struct gpio_chip *gc, unsigned int offset,
-			      int value)
-{
-	return -EOPNOTSUPP;
-}
-
 static int gpio_lmux_gpio_get_direction(struct gpio_chip *gc,
 					unsigned int offset)
 {
@@ -80,7 +71,6 @@ static int gpio_lmux_probe(struct platform_device *pdev)
 	glm->gc.parent = dev;
 
 	glm->gc.get = gpio_lmux_gpio_get;
-	glm->gc.set = gpio_lmux_gpio_set;
 	glm->gc.get_direction = gpio_lmux_gpio_get_direction;
 
 	glm->mux = devm_mux_control_get(dev, NULL);
-- 
2.47.3


