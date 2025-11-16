Return-Path: <linux-gpio+bounces-28547-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDE2C6195F
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Nov 2025 18:17:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 225C33ADCB4
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Nov 2025 17:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8072E30F81B;
	Sun, 16 Nov 2025 17:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aq5AqNd+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JKvtkBP+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F91E30F7F7
	for <linux-gpio@vger.kernel.org>; Sun, 16 Nov 2025 17:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763313447; cv=none; b=KzHx7VcdOvEu84AnIQBWyk8mdQcS6Dqh7pyrE75NTQp0n4Lbwmm8qMZyZTw0+LilHGdKrMdZVWsJp6QTDgLoDBUn8tzsKAfqXCU8NakSSfl79BqMqMrf+qA803xW0KZMWPicMMaAadpEmKit4R8Jyxwpd+9IkARvYRhUeL/2PvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763313447; c=relaxed/simple;
	bh=jnszFHmKNM1a9F0cXTGUxupAHwO4OuJVmszVfLbqIIc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=douQbs6mN/FppfN84lpxQ77hyOHRfHeo09BzgGjMl1OMbTPdmu2h+cB7DRQPV/+MGYJZAcyGa2WfHfdpJA+ed59MvWKwY5Z5r3UDQbWSW0rWnFVpRL+ZkwDjAhZqmh+XJfBESLFhsuYmRMKR74D7dmrICv4MUmlQ4KJl+edf3AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aq5AqNd+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JKvtkBP+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AGAEDGs1079120
	for <linux-gpio@vger.kernel.org>; Sun, 16 Nov 2025 17:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1jl2ispOdO9La/5OQRAP02bv6sdNxLuaFxM
	tRQznV8w=; b=Aq5AqNd+SeupZPjpqfBrkc+yVyKJ7fHnv2qrq1sxEUlhQ+TsDtE
	Vu2UgzW1fPeiuljtcnXgTpBQpQvAhcHZWOI/GLJ9CtiTSyqY//BIrh7rSnkxK7vQ
	+ix5ADGgMDEh1TMn+WXAUVh+Bhdk/N1o+JzAubXCq7rtQ3sD8/8RsJRLdMeZZ1Tv
	53pyGcnh8CrKec81SGV0RULOp3dsZelSp5w2SRRNE+d7jQgUu+3MbosuyzWNjET9
	dHp3YUWnjsGzQtYQCM7C64F6BZCGgLeCN5ebsvcCGsHsOsyySPgjm+bJFjs+uFLH
	LaKNgWj6YNANQe+TMzAWnTJA8SbRvplPZWA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejm5adhk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 16 Nov 2025 17:17:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2955f0b8895so52245515ad.0
        for <linux-gpio@vger.kernel.org>; Sun, 16 Nov 2025 09:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763313443; x=1763918243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1jl2ispOdO9La/5OQRAP02bv6sdNxLuaFxMtRQznV8w=;
        b=JKvtkBP+Mv6n2piaIw4SYiQE7scb/ahT4mGZOI7NufkJiitQP3uUfj2kS6yyBBsq3s
         LoL4n3Y4ZcqGqwK7RL3/Bhg+BZT8NOrlbXXVHrUWRi3UYbYZZ5cE9d0AYvLSeIaO3caM
         Hu60/126+elJioJeYXi0vOGqD6fy691yDun5ZsdoiQf2yfJ6S1ywVCWn/nu62163XWqU
         mOhxGo4CnD87CUySrKJDLfEZasMDfB9t3pAWVcXqBS5Jn6oaL3io3S/IBekZPqZIGKSm
         w0nnKH+yHC0ZYtsHUWcz7WGZQVbK4yZQhbHN+4TyS71wSaG8uixRrYMOxiDFLhHbLM4A
         mSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763313443; x=1763918243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jl2ispOdO9La/5OQRAP02bv6sdNxLuaFxMtRQznV8w=;
        b=nU9/uWuzNnj1OnA4b4XE6Hwk8RH/+QurF7W+JuMTcbt1A/y+NmzO791vsNXCHCBkAU
         uhNIsMQaL12h4JIIp7eEX5ZXLEdIrHVeFAmzxpgN/VqdSPXN839bAWcBn8AISIIgH7m0
         E12ls4XZePoltyEKP2LoYZ91AcmZbv4hyjqfa+KVzLZcpXFuJv1hxrxyY6SF88KK9nXB
         G8JtE00XtYbcMubyFsYUqbKk/zIy59+md8BDj78MwLJBOmQ9HY7b7TrJgpWVjDd+2yot
         atBNw/fZsqn9iIX5zcyXu+UMGgy9vsXjJ3ZStyV6HgcQhl6POxPNdjCO+rqHWVQt/Jvu
         M/FA==
X-Forwarded-Encrypted: i=1; AJvYcCUAhFhK8UtzlLvEszJZI+A+OTdChnuX91WmxuebtNq2U/ulOsB5EywqFYZr/HUl9cLp6q2IwuZAkO3+@vger.kernel.org
X-Gm-Message-State: AOJu0YxHWhTBxZOY5b3r+ab1zpP3CbeemCDIFnR7H8tFMCqrLPCBZE4u
	QR9SsXsJosARDmdRC1LnSD/mw66VnCNzWs5Fz9PIk+HfKKuIrersIrPvft/bJnjfryXYj2wnccH
	RXVgcuQYgD9Blq4FoTBaHSCAZm04gGOpMn+o5BwSSqpd/no/iGOQRMx+BplOVFQ7l
X-Gm-Gg: ASbGncuTfJtxHa4CcxhNfZgkh032YvhlugrqtuYS97xZdmCCiPy+2iaCJj/f1dEmRBN
	9fhfPPIniSvFMo4PEdCC0DF9jsuLjDT5qI4tIRfoUK/odhlV3GtbHGDL8gkNUD2Sg6Cp5RsWBix
	HG41EfZEq54fFlzB9HyGfhhpoHkkVUMM4/aKsonbYQzVaLMFEFWQD/aJbh6sPR3fAa6UtyNRrOq
	xqwIIdEdO6EA2/3yU1Ilqgvph/V+g6mYj/YBEIYuutqvMw1I0Lwvfbeiy4P5L23uu8u5e/9etAJ
	z948BsaNdhba8L+I8YCz2WR7Kob+X91+wDkvvHC+du4zKGJJwANg8cGMtA2UlL1ZgthBlSidyjU
	fVol9qgPv/tFMuFYk+qKUj0WyPnFQU7DP5XQ=
X-Received: by 2002:a17:903:37d0:b0:295:55fc:67a0 with SMTP id d9443c01a7336-2985a4b04admr154190025ad.2.1763313443320;
        Sun, 16 Nov 2025 09:17:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHk8MyWeaDy5xJlFGfVzLFXZP9K3vQI78np6fV/wBn7qbFqtjl6F8oXUYRft86A2WLaOraRDA==
X-Received: by 2002:a17:903:37d0:b0:295:55fc:67a0 with SMTP id d9443c01a7336-2985a4b04admr154189785ad.2.1763313442831;
        Sun, 16 Nov 2025 09:17:22 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b1055sm114415105ad.59.2025.11.16.09.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 09:17:21 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        ravi.hothi@oss.qualcomm.com
Subject: [PATCH v1 0/2] pinctrl: qcom: Add SA8775P lpass-lpi
Date: Sun, 16 Nov 2025 22:46:54 +0530
Message-Id: <20251116171656.3105461-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE2MDE0MyBTYWx0ZWRfXzsbVEvrUfAzl
 dlk7rZb85IslxhcWyVhc7LkCioS1icrxa0s8Uo/mKMs/jDC9Rg7YfmITx/A4KNDfHyCpTTBXv62
 skTdTMxbw7fq/LNXz6cQdAiof7eScE+jQkxNRSJQYVxNhMS8Shvjq/JuigqWHHcaiX+753uRsXw
 kmY4PlS9VGZn8LqwJT2nR2cz+4X3nPn76P1EGIVVYZlBkRPyLkp5ta0k7ibHjK7jWHridCO4RJV
 L6d6fks6Y9q4y80VmWHV01rakTPHOL7z2mabA3Fuk8CUJM/hhNZgybLKaPELKG/agioncWBHDeX
 ZEyfHprgLHOE9wH5I/AKe/9r1Wc3GxHz5ZgmsvSPuWjNrnhKAa0MunhKttueqM9rDvpcTdamPXC
 soXwYvkilT5WLzQ7DRrBCpqcEQrsSg==
X-Proofpoint-GUID: X21cFSHhvKu9GDsOPR0t29WVms0KNnKD
X-Proofpoint-ORIG-GUID: X21cFSHhvKu9GDsOPR0t29WVms0KNnKD
X-Authority-Analysis: v=2.4 cv=Pb7yRyhd c=1 sm=1 tr=0 ts=691a0724 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=lAFZS77bQIXJJI-DYKkA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-16_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511160143

Add pin control support for Low Power Audio SubSystem (LPASS)
of Qualcomm SA8775P SoC.

Mohammad Rafi Shaik (2):
  dt-bindings: pinctrl: qcom,sa8775p-lpass-lpi-pinctrl: Add SA8775P
    LPASS pinctrl
  pinctrl: qcom: sa8775p-lpass-lpi: Add SA8775P LPASS pinctrl

 .../qcom,sa8775p-lpass-lpi-pinctrl.yaml       | 106 +++++++++
 drivers/pinctrl/qcom/Kconfig                  |  10 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 .../pinctrl/qcom/pinctrl-sa8775p-lpass-lpi.c  | 216 ++++++++++++++++++
 4 files changed, 333 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sa8775p-lpass-lpi.c


base-commit: 9823120909776bbca58a3c55ef1f27d49283c1f3
-- 
2.34.1


