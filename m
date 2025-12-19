Return-Path: <linux-gpio+bounces-29762-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 434F0CCFBE0
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 13:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EF7B309C2E4
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 12:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4AE631986D;
	Fri, 19 Dec 2025 12:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ArDOwSQo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L5jUqJyf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFD431B11D
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 12:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766146403; cv=none; b=Ba+dMU56yYhom9IcqH9MCovzxr4c1rGfw9MjS+GRzujHyIZpFnJVwxmsQDkNya9z1fl3I7itPEIgbYDq251zKb0TOOcLSmGZ9Y6EN8OZk57jPAcxDFvnh1vvRh22v2zE5gEOC1GinonyF/6W7xd/1yN1eV0Mp0hX96ymsnDHyOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766146403; c=relaxed/simple;
	bh=o9Jv/NWCSX0lI1ltggb7kobdggWkS+H54pSOi5S7iDA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hhdCdPAce8optI7VWdZtr2Iaql7R/cwqO3qesjhSPBG5pGFQKj7sYxcu5chH1asEjxPpfSIgUS6r2GjL2B97q3U8N1x4paRTQxR6ar3b6F8YvAMgC6CTCyUWUYiAZj3P9U7Vh5A6cHLzgDyUCLbRpTegLuK2lnrhniem2Ld/O8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ArDOwSQo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L5jUqJyf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBEDHY3999392
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 12:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z2sMzTB/9S9jACJVAZhu8V
	6NoQJ8NfstFRgn4YsuRPM=; b=ArDOwSQo+YqI3EHenFVl5aRXCnr4AXDFvS8idW
	YlO5MDSIwCePpkbUS8iBjxeEvlYlIkhLu0ZpUshwIKfqy7Lpa3FRhql9WuLWxtPZ
	if39TDV/R6vYHFhomHWqInc6l4Yd588k+9DzuTASCm4zMNB0NUeeDAhRqYy8NKHq
	iO0PkpiR+LDGinas2TuEDhQ654Z9MzPZIYhe2K1o/ATpCNF9Gnuu/FqAzHLr6z3G
	2dkagBsZssQUN+s82A2zxGTmvGxzxT2mdSTttZlLGqToDYr4OZrEZdzQyeu3afMK
	SbORA2cy6rwU4aDJ4LKaaF76qevNz7q1aWZgEi9h/St9k9AQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r29jkyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 12:13:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f4ab58098eso22246991cf.1
        for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 04:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766146400; x=1766751200; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2sMzTB/9S9jACJVAZhu8V6NoQJ8NfstFRgn4YsuRPM=;
        b=L5jUqJyfTZL7lBQgvcLnvhOwpyK53019m6X7M1bvo/WU7Kt+MsnR9E8u6PaaIB+E6O
         +LmoIJtJT0TnAyDDFFYUhOt4YgHdfyW8eT8E2SstZxpxOd373J3/OInfaIy79PfgMxhq
         GutHUxWcXUIuaOp9UVVgrk073Dwg+ypxdiW5vCN3TSws0OWJHRkvU05kuVRIiTfS/bWC
         WhqPm31busuRNNxeZRbsHzGw31z9hoPnHhiK5Us4JEPzMS3sVxiU0gmhy8ueqUzJz0Um
         9VgX/Cl3+i20MU1wGyRIlk7UmcsTAZEA1I+3DFHQ1MOy/IKV135L+jisJ9A47jduw8JX
         c8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766146400; x=1766751200;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2sMzTB/9S9jACJVAZhu8V6NoQJ8NfstFRgn4YsuRPM=;
        b=p7o/ZHJvi/31tkeUZq4MPcwFPF0zxnR1O1cIgmNLTx3ZePN4O6qbDi3hSk9miBfdQE
         Xj1xUwczFclfXsB680IwX+JC6FOnEgtVFSxGY75Dxart3DW+oiDJk8rhf4tlhCsRVnBs
         eOb2mtV7dlamR1ZS41CiyD24dyTHh56bp9TPXH0vs+aYt3C0N6HF67zKjrdq9AzqsOOU
         Yw3M/rskIL3ohGpp+tOtLdZ21JZXn5eveZENHYOkCVwECMLywlPmZ9edxQi0VDXv838N
         eCYO098sMRgYqzxMP7XZEDBqtF0R88A68izq1FrMZl16QTJ+Vlc/68BlvNT+QMKqsAS4
         hYVw==
X-Gm-Message-State: AOJu0YwLCAMmA59rd+ix7t46+W9zyVXeSnHa2tB0ZXNrdJbBIN3vIZDE
	kHueEjyJMhWB6PJvmJTYM/eSv+vDAp4qv/4JXswzr1AxQW8ud5zZrVXCEBuwoXS+i8VsnmZ1HPv
	Ben4F31tb+bJcNLFZr8JWr/z9TFtCJB02YMt9uXw6WCcEZyHe/9uFmU/Vfp5HcqJ0
X-Gm-Gg: AY/fxX4y/7oelbNjGbRZPeiHzAYY6sRNj1fiq3wcdMdLXfxQJDac7ejJGlCIlnkb73E
	6i83QLULEHK8NrSag6MIR+fWdsiwlEAgcHrYSp3k2aPwHACzDMqM26YyCcUmwE0mLFJjItsO+7I
	sKvkRLPDipKCDoxQI3bK32xKuOVg2utl7YKvPEjQaRK7RlByqCZmingvTl4R84dHbnPksG+yH82
	LlRiqDE5W47071aiFClH/Jae7cIFIPnwWXyAJyb/3GUU7j49q+Plc0HZahTpJCv9t7znAAkNKXX
	8QGZ6hCK+aLNySmAhZu9uKZZeEU7zwgOVj28n/v7urEEnmcPjjahgBbCSBfJPmgkAlTmbkvZnQy
	YEacc248tLOIfWFbmbKJviEBTpRnW9Yh6xh4SOiG0O5Ol+MVi9eMAF63+Y6o2gxKP1g79
X-Received: by 2002:a05:622a:2610:b0:4f3:4cde:1660 with SMTP id d75a77b69052e-4f4abde3adbmr36403121cf.83.1766146400053;
        Fri, 19 Dec 2025 04:13:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERo/Ph6jiM+hTOtV2Dbe7tgk55zLTZeLf6OTGFkErFMueI5t7pnJZbd6eZydQNrO7sGnAu6Q==
X-Received: by 2002:a05:622a:2610:b0:4f3:4cde:1660 with SMTP id d75a77b69052e-4f4abde3adbmr36402541cf.83.1766146399533;
        Fri, 19 Dec 2025 04:13:19 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f48606sm220309466b.62.2025.12.19.04.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 04:13:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/3] gpio: Simplify with device_get_match_data()
Date: Fri, 19 Dec 2025 13:13:11 +0100
Message-Id: <20251219-gpio-of-match-v3-0-6b84194a02a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFdBRWkC/3WMwQqDMBAFf6XsuZFsYiztyf8oHuIaNaDGJja0i
 P/e6KVQ6OXBPJhZIRhvTYDbaQVvog3WTQnk+QTU66kzzDaJQXChEHnButk65lo26oV6JmQtcmq
 alhcSkjN709rX0btXiXsbFuffRz7i/v4rRWScKU4XRKV5rkw52El7lznfwZ6K4qsLvP7qYtepU
 FTXCqWm0oWQPZ56IDeOWRqotm37ALnb/DfwAAAA
X-Change-ID: 20251106-gpio-of-match-23b24cddf063
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1312;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=o9Jv/NWCSX0lI1ltggb7kobdggWkS+H54pSOi5S7iDA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRUFaRqV/DUlMw8fX+TWIjWGlMWLDl+PLXbJWM
 PI8W6v81kOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUVBWgAKCRDBN2bmhouD
 1wHSD/4laLKLg1mpSVorDo7erTjdp2WHh38g0Vj0eIyj24YNgOJdUk0qoUTsKrCB0nY6WINjASI
 CAGRWtIt1WrGc3bOyeBHMGG+dtZVvlg6kWZCoPJVhQ2IJqHV/qA8tp2uCmbIhOVe3lcPli7HwJX
 kPa98jcYg4jRCh+icpj2vcsxhV28Xq/NYvK2XV1Q5hN7JqUIbK/V70ai7Et9lFdA0RxswBfknxk
 hti/IbEXwBlS29fnehogQ3qbFEG8h3Dj872idkVkje8t+WL5T7/Q+gb+SlvTHQa4qTzdBaNbRYo
 w0XchMTB6ZWlvlxGWxy5QwLAVhYbyH0raZM1S0tTLjZEvvVc3IVNshMXJ9w0ZIkqYOxs+1HhHcL
 WrrRfpUvz3eH5+/PWk7au0E23m4XULDvTb3LgU+5Xdcbk2YTh+5QIZQrpkZwvFcBpd3TWXb+Okg
 Mfibq375CJGIHEoJkORfMstfHKI0hIEGr2VK4q5O44Ui4120w0pKBDun4IHp8z9nTUr14UcbnxF
 kTUW45m8bkrDt4Uui9xMgLJHCYmrlUt2Q/Oe0nKNTcoda6M2D0z++AgnP+wCR7uBAvHy4ldTOEJ
 f1qVGoKqbvBkKBbQ/V+EvEg6jQLj+EGQAOFVORKS1EYQQvj1IFwxZZ6lXxtgQ4SDuh06alQRmus
 ZPG4JowMyTN4Dxw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=P6c3RyAu c=1 sm=1 tr=0 ts=69454161 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=g6xpqFGyBtyTyoyyarcA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: uMO2_5gKs32Kj-PNCXnOc6-7mhG2zjz2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwMSBTYWx0ZWRfX7i109x48CfB0
 SXWDMIsAVJVMRukc4NE46I0jJq/jjKhLne470qfnzqwf4++TkREYV6VIw6mIKdY8OAShqrMlH+n
 7ElKG2hRVarltNdN8qRB5oFEPLrqpJEgalDng3YVBOyo2PftMxrt8GaCwpGB3Zq9d0a9FcPRMfB
 YBsDyCaS/8duPKtiz+1n63mEBvorTic9V2HKh/czbq4gQs2603R3fI6GgSjTQsCBAOk7wSLIXgV
 5EFEKs+Y5y2JgTsBvLxdhmyOYax/bE7jMkHsMZIvamL8iumo/fAL/jaFDgFiwKZCe0Igj+CfC/7
 790k035PA86d/GB0ZGPsF9zWTOmGnM/lKxWXCbRKuQojyOa9936H3KDpxU9VMzhnrgTB9U7nAD0
 S8OgfAWVJbYvG9Q0Qe0/JOkyjzoIFwPgf8/CY0wDkC+Sb4lejGIOsYHwm+IJC9KtGR56AmDxJCS
 +Iw4TfzBSUbp/gBdw5w==
X-Proofpoint-GUID: uMO2_5gKs32Kj-PNCXnOc6-7mhG2zjz2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190101

Changes in v3:
- Fix subjects and commit msg -> device_get_match_data
- Patch #3: Use dev_err_probe
- Link to v2: https://patch.msgid.link/20251219-gpio-of-match-v2-0-5c65cbb513ac@oss.qualcomm.com

Changes in v2:
- Drop applied patch
- Use device_get_match_data() as suggested by Bartosz
- Link to v1: https://patch.msgid.link/20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org

Few simple cleanups, not tested on the hardware.

Care has to be taken when converting of_match_data() into
of_device_get_match_data(), because first can check arbitrary
device_node and the latter checks device's node.  Cases here should be
safe because of_match_data() uses 'pdev->dev.of_node'.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      gpio: aspeed: Simplify with device_get_match_data()
      gpio: creg-snps: Simplify with device_get_match_data()
      gpio: zynq: Simplify with device_get_match_data()

 drivers/gpio/gpio-aspeed.c    |  7 ++-----
 drivers/gpio/gpio-creg-snps.c |  4 +---
 drivers/gpio/gpio-zynq.c      | 12 +++++-------
 3 files changed, 8 insertions(+), 15 deletions(-)
---
base-commit: 26ac2c4153a2c543a4ef3dee421b46bedb0f8f0f
change-id: 20251106-gpio-of-match-23b24cddf063

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


