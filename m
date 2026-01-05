Return-Path: <linux-gpio+bounces-30157-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE56CF484E
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 16:52:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BCF70300818A
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 15:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5F8315D23;
	Mon,  5 Jan 2026 15:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/w4WMAB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UxIFf9Mw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CC230748B
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 15:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767628350; cv=none; b=Mz8lgrrH/qjFHhBhOlOVCNqujfN+S+wNpiR0gbrDuKbo4nP4jOQzDC8ho98qBGL4TXEvbfHvqvHjpb8wedwCCooZwW1trfFpRBXTVSt9kofdP8Ey7+6EWDxN4WsP8Kc+44+2EhxHe1eL9voKgQwK4MNdbdzDnusRT7AWQDBtWqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767628350; c=relaxed/simple;
	bh=+qHREQZb/P8yRlR6ZEGY3Tlp5BRmeK/Y2vvYqkUUZAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gKzeiwKXx6HHGUJwrZbMDFSt2OmxJToFvW2DSOlPnK25VXDNSn0zjma61TUYt/3ACYikRlM4DoY9ohqgRc/FSwjNn0mEHYEIuqSAYhu9DPDVlK1jSqqTkkAkDH2+gx4ORmVLSBf8tSY8R1nwBl6IP6pLszIKmmS7/V39VDYqGZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/w4WMAB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UxIFf9Mw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605AYtor937219
	for <linux-gpio@vger.kernel.org>; Mon, 5 Jan 2026 15:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tmZmM1DrqJyOHUhXesLJRUeqjEH4qTmC0C9qc/Ubah4=; b=E/w4WMAB6CwtciSF
	oxoujuv0Ycv6aEHWUgvWOoEJMojmv0NeIp9nueVYCGdPsO+Y2KhDZ6AsMqPxf7Vw
	Lo+5utTN54Mb5g+RqZOltuOaXOW00OZiGytYtmHIHo4kwxvjgwnxB5+fXpKJZeAK
	QkKw3FTGSg5KxWQodI6NuB1Bp4McHMD79G8zMM7EZvEH4BpYFbXLqVtzRsCHqYUH
	DXJXRtM0booo1yZfHKrRRTe3VB/tuGhp7Pcj3T0wOyEmuUT7KdKqgnvHl9JHYHoB
	iha6SZbfYifQo9RRJqwERJ7E+p7+kQaPlTGao2Lzpz/rQQJzx+9g5PUR6JyExrMr
	/JRygg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgbnv8t8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 15:52:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso758481cf.3
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 07:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767628347; x=1768233147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmZmM1DrqJyOHUhXesLJRUeqjEH4qTmC0C9qc/Ubah4=;
        b=UxIFf9Mwsf9Wjmo9iPWpBkc8066+L28TR0B8/ICAQhkxLIMssjpDVdiAYX0/tNl9E+
         DHsJhtBB9n36kXLQt35fti6Qsf3FTIc9aIr6aEQcjZp1PCYkj+JsAlbQ9uiAMnUaDovh
         PjAsrDAejYBwyZgDeKtcfEoR/VmhtiBuzRW4VDWbZUbLaOkxjLwl+bndhLSVHaX1BFDg
         QuGkmOlY5URzCJrpX1Px5S8WafLarhCA2XP7Se+cTCw7z1P1WDHPejsb1bAKLAwAGJHs
         Shrzl1D7pPHI80S7no2AWY9LKsJrd+Jdr8u07OSQ8M0ysUn3bVM/XqNjJN/RlFHjfD/E
         GDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767628347; x=1768233147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tmZmM1DrqJyOHUhXesLJRUeqjEH4qTmC0C9qc/Ubah4=;
        b=Jhzwxrsoau83SXVKcv6Jg8WwVLs3JlJGwUe/Lei1XNWr7VeN9xlDl5h1tuFaCuoymk
         /yzFlCOlgV2vQmcvz0xJEjdmhkPFmnI1zIDjRg3P//Zptupq1E20xEqClOPlCRVSG1FI
         sESBkGwvk6vGJP6ZJ2oe5oI6vzHIn4qvYvQozcgK1gnyfEKcU3J+EFp8ArkTEN2M9JH6
         hCAAHSrY8hAz0GaIgJ/zmYxqeXhMnfGw/i3gQX/fLtW4mKZCylX1qtFhgQxzn/wRq2yg
         +gzYqUAkx/LCQHg61wsNexYHRpuvScSsPIDZsVTEswXGp00Ca5F6nNoocPKg+i+yYZSd
         XutA==
X-Gm-Message-State: AOJu0YykSDBB6gQ378y9TjR77sFpSJkGiulq0p7FwWJqwTNyFr6ECVfA
	ldvpjTCobcjZ8F3kMPFW5RQxf/VrDuhABu7LQIW/HGjRQAfsCJv7JHNmvRbbzIHr/4aUShyyQMk
	FE3ZuGo0xoH3t7a0/3g24S3rYOrsC+oVosiPYsAskGaOj+cF/K6VWfbgQplEJqoGn
X-Gm-Gg: AY/fxX45fdvFY+WB4gb+KXq1gn5xRDM8S4u4V+q22wNs+xE+GpxntfF5ViqqP7nthP8
	YIy4hNA2zcI1BWG4NSl0NFIRxqSKxEMo+XAIbnHNRm/0p+qctFiB2tnCBzx8vACtCzAYoiHPeT+
	GBe3TcFKCpJkTTdVHiKUtW0kyUEjfgEQQyJoPT75XZ7PNPSZ2iV2AJl3jLUe2MCAl37B0f5kPv1
	YI0sZJhaFWLE1Y804e+dim8Jwe/KiEql3K+LM4Xq9kFd8X/Llv/P1W4j3nzJOmFTrRquRqTZF7l
	6BZgpHLUWn/baj6aY2dWUyE7n7KLJ7bvPEYHU8J7Y1xysprDXTAdOPGPXU4bQMy4HfVUTLIEt52
	6c/NbBFA38+Kkd7CXimOujXv3OeNGzsfgdqOj3CM=
X-Received: by 2002:a05:622a:230c:b0:4f1:ccec:84b0 with SMTP id d75a77b69052e-4f4abd8e6a7mr738539271cf.57.1767628347172;
        Mon, 05 Jan 2026 07:52:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESrQPU+ex0XMdSXC2wrNi5FBE9Ooh6rMeVkuBd31Ao6OaBT5kQNsfwQubq+Anynsuj7mMHIQ==
X-Received: by 2002:a05:622a:230c:b0:4f1:ccec:84b0 with SMTP id d75a77b69052e-4f4abd8e6a7mr738538921cf.57.1767628346622;
        Mon, 05 Jan 2026 07:52:26 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dd3b:c635:dd06:9574])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bca56a24sm202757f8f.33.2026.01.05.07.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 07:52:26 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 16:52:08 +0100
Subject: [PATCH 1/2] gpio: shared: assign the correct firmware node for
 reset-gpio use-case
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-gpio-shared-fixes-v1-1-76d6ff0afcd8@oss.qualcomm.com>
References: <20260105-gpio-shared-fixes-v1-0-76d6ff0afcd8@oss.qualcomm.com>
In-Reply-To: <20260105-gpio-shared-fixes-v1-0-76d6ff0afcd8@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1267;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+qHREQZb/P8yRlR6ZEGY3Tlp5BRmeK/Y2vvYqkUUZAY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpW942kZ4tjdvCUkgyNFY0kp4MKy4qf3s1UwrbS
 IRSBkTtk+6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaVveNgAKCRAFnS7L/zaE
 wzWaEACk+oeX63bl9AQZYpFgGr9xVQ+PqEwEShVa6HJdDBSA/td4s5KM4KUQbPAhqUvkLZA2Zkw
 mZQ6pfD7C7Du2LAhaQYQHl8ZB8Wnw9AH0IsjnpGQ0A4n1aB5eBFoS/1tvOkvZSUkW2/YyOn2hVu
 Rl78XwRb5tzb2omlEXkvSPbefZwi6I81oj7iPIkKCXd9Ha0itv/+GXzCTy/pM4XAk9jFZbmxYo4
 N2mp/OuixgUhGmCDwIs0xgsFkXVq30hLKJ834e/8LekhK6Vdsi73qPe9y2bVyqrE448ygzSKpgk
 VRPUJZ/G37hYA++Jc6KWujUvE3T8E5ImRuoMWbRKj3es6wY7AqO0/Ti2S6+KQXO/AmfRJIShUSg
 r9aSDo+nazBLxoiOnA67hIquGWAd9LR/bBtzhvL/+s/zq7oiJVP/oyIAjAV68VynpRIghyaP9sv
 LdjTKKVyrZvloKq1uU8qfd5+frLQ1fCFlvUyJFmmaCEz8E32hzAyYPCQZsox2YWebrmCkmmfGYf
 pdbOhYJNtYehW8fnwdgfTEdGeCyQJJmvSWpXfjUx8jK5ue+UWRK17VwXUp6kaWtwrhPIMMU1Gxi
 HdgO6YjdKEh2sjRIkv0o6bVjwa6tpfp0r05hdJWUEdrg/4K8zyNKdOPmBTodqn1VnKQKugkQ+8P
 aiPbcK/rWamGZ5Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=695bde3c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=0jxSSTtIkrDbntYdqkUA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: pn0iPUpoGRvo9NLAoRCG3OahccsGJXIt
X-Proofpoint-ORIG-GUID: pn0iPUpoGRvo9NLAoRCG3OahccsGJXIt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEzOSBTYWx0ZWRfX+tGgIxqNksG9
 VTiANYy/3nmLau58mMWcLVLtw8QZfZcvP/A9DdrRmOStEXymahLvtCJzzwzctOPbKWxrAhjmHSM
 d2tjWO52wqHJC8CGD64Tj9EAInGZhSO2/5O/L7bsJtUnCQ0WUyffH0k5U/KVucardJbmqV7/VW8
 Ro/nHjUjCoz86mQ9VUyXMLhkDXm/EjR+91QeDfThippe5XWX2MjAzIAC7GkkKnhJ80VCuzQEfcw
 eF790OlfHIU9iGV7dFYMFTnzPQHLlhmWOALPioP1Rg912OBGtmHxYgcoso6Lki+XGknxZjmsSL0
 nlH+AHTeao/hpKy92m4ujmMoQp8c+5mhFhlbnADwga0qnMPgtsDbj04zF8fBXvUUu8pbIbF6yQ6
 8DoEGvdI2HFVFQFjXbGEZVvXt3eTYbvta5OO35PMWq/Q0MljgcjnQ+/vaE2GoZ55CjW2KUxrBVm
 68IjjVkPehgoAwd9dMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050139

When we defer probe due to unlucky timing of adding the lookup table, we
assign the matching firmware node to the shared reference for the future
probing. However, the fwnode we assign is wrong so fix it and assign the
one associated with the reset-gpio device.

Fixes: 49416483a953 ("gpio: shared: allow sharing a reset-gpios pin between reset-gpio and gpiolib")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/00107523-7737-4b92-a785-14ce4e93b8cb@samsung.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index baf7e07a3bb887dab8155078666a15779e304409..a68af06a6cc4e1e33946d7f200cecd4d3dc066af 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -417,7 +417,7 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
 		 * Reuse the fwnode of the real device, next time we'll use it
 		 * in the normal path.
 		 */
-		ref->fwnode = fwnode_handle_get(real_ref->fwnode);
+		ref->fwnode = fwnode_handle_get(reset_fwnode);
 		return true;
 	}
 

-- 
2.47.3


