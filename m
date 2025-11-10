Return-Path: <linux-gpio+bounces-28290-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE87C45D43
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 11:11:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C4913AAD1D
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 10:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F6B302CC7;
	Mon, 10 Nov 2025 10:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l+SJX6aV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RnuqgJ8w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8045D3019C4
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 10:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762769469; cv=none; b=VW3G5+QJoVlQTPoYZ1Ni8GNmxv/MoQnuaLO5NPRdtJz+w1bhivHPi27iZ7XjyS/7OtMGSCaV20omLkzze7TAHNdM/p/4mXgOPD3FL891eN7AaqVJHdESihu11SyDcuX+6v2VCFwVZ5m3RiqHMX7l1SBjD7dmgAGSV4KjyBEEGks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762769469; c=relaxed/simple;
	bh=2WR4DjVqzWLaipfohKrAz6ozR28pmkslqPBu5RhQgXE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u4SK4zr2YLpHWZlNA92UPZbe2PpGlGrMOKwC+x4vKRTmMmdTFf4tDp4nqis7drR7l2caCt6gkritHMOuMNFFUpRhjlyUViRXTDsUlGqrRsvU7j+i5CIH1czAFC4FkVCMaYCGQImr1/2EqY9tcsuUCka1dTuMaJ/U/RuABGvFDZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l+SJX6aV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RnuqgJ8w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA37akj2166660
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 10:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kkJRZx/9fd+
	C31qggYZ67ZVb5QG9K9z0NjsxhLqSeck=; b=l+SJX6aVXFGrA33RIPukpfdCMGt
	lCqxHG+MSetzSt/q8JPXBn+hh5bEQrVWSVNziOdRrUViULSKkRBCu3JWEwfoMW6/
	eLV2hvx0n99ulUSGFV2ST+EC+2vpAkdWFywCtQ0JbKQRgksD5lEEgmcz81zFb9e7
	o0PozdaOKuSFBgoJZ/9Y9+dv1kIkUzYDZiH/o0Z1rEYptstPIR75SDZULltTXvp2
	uWLWJvPNrkXRribGwu0DzJQZKZLJAZHy1AZEcEN8j/o0ZF5IybZmBBEv614EowEL
	NFl1LJlRkMlTcg8w/gFP8Vo+KhwYISlipn73kFFBR619yomipdYQkxwpWPA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab7vcs4hq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 10:11:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297d50cd8c4so57504485ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 02:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762769465; x=1763374265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkJRZx/9fd+C31qggYZ67ZVb5QG9K9z0NjsxhLqSeck=;
        b=RnuqgJ8wb8YtVt7MDQVrpK2evx+sYsgT8JgTLPvnOBp/zqna9LT12E4sRc1xRzMhyt
         Sfah6Yq03AqULYP9+Bn1B+/hCCF3w6Lsqq4Tjtbirys9p7HIuKGMV6/ERAZV39zwYyvV
         ISryKa/RGmtZbQthsO1FZeDowUj0FJXu2oz5Cih4jfKCGrVoR7OVnALx7qti1mT+iecX
         8hoXhyYaqNSd4LN+QcJ2ZF22n7dJzAIioC/wPyUpQ5Bu03yo4J5LxrlHRByGqogjSFPe
         UUxDkqD3bDXrlVDz36ojQIMgcIt0V4i013E0n2p9p63QPlEsWoqjcx7qkZ4vyPh3Doje
         x5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762769465; x=1763374265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kkJRZx/9fd+C31qggYZ67ZVb5QG9K9z0NjsxhLqSeck=;
        b=l+SvkJp3B7wcOnm8AHa2La1b1nq7LkchU5xsfNcH9DKdViqjbozpvTxzIQQAsPuu6P
         wl0SjBaAT7krMS2mCGSV+xydxKidQVLcB+oMlW61Ihfab59Jt9IucxNX8VObrUXPvjaa
         wFUbgoEGj21g4lLNyRT83knNuYeh2ba1xyyh3lozhI7od8vPrfL51G2TtH5Hk3xrvJbU
         K1g+Ii0S2Z48yGJd9Gq67lS8FKRr7VM8IRXaFy8McEK8JtZQPKiId3I3E63OQvz36xNP
         ml8DI16ZB3d4HiGRG5eqZErXw71cIsjS33revo1EXnkzOHHVOTNEma1ONJThRomzxzzi
         6vCA==
X-Forwarded-Encrypted: i=1; AJvYcCXwX3eVSxLq1aiSPK4I4y+jK9uyhxsBlBue0itk6uwRNaSiKhZjiS4PNUQYT6CINkY1HzlUsVHZN2nq@vger.kernel.org
X-Gm-Message-State: AOJu0YzemirrjrqT16XaRbkCReA0cUjhNmwCR7KN233nKB2V5HP61fAe
	a81LgAyb7atJaFbJKzW61j6rUOeWfmr0a+NcKcIt5DRrcDpNWyWELFkaeFy5vW99qAR51ACzA54
	4x4CoROdMUyO9XNs76/NnEWDWkl5XsNPmVJUPo6mpIIawae+1/EXovfYBwtsyPZHb
X-Gm-Gg: ASbGncvIGvpL0kb5dac9ZPEoFSF2Trer8fQof66HWTNs5S3PkqhkHSMwdvIs2Ay5u5s
	YVtrkVS2HXiyguCOU3L1QVWphZu9vdMTufDiaga+YVkBIHtHF3ywWdqwMYn8PPGyIIs6A3WZPzF
	HF/X+zkc+amwWBW6mbmFaM1PmiMc22aZ/XooT4qCR3sm4IukPHxLN8c6MJlGLQ7Nnb84cSmzj1d
	kAzDUBN9T+MsJ0QtJCW4pMNQCenI8Oe27zWHKqnaXUPFJ1wBm94YVCnB9WjkRrer6fET/NGILe5
	eY69mbXC2vIZ0Q454zSDc2o9+AJ1jVXHL+bRA8WW+WRHoU7ICz9JQOpTq1Vg+LIl7nS+zkU1RvK
	BE9aYYhtXdG+8kWhR6QXgHdrE1/bzJuzs
X-Received: by 2002:a17:903:3850:b0:297:c889:ba2b with SMTP id d9443c01a7336-297e56d90edmr98518235ad.33.1762769465272;
        Mon, 10 Nov 2025 02:11:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2alIHlrUF/ZT5w1aO63skR9wFfyTa+slzPpROyleCSAlu8xHT0/ebsHdOdwu2mfVfSlNY3A==
X-Received: by 2002:a17:903:3850:b0:297:c889:ba2b with SMTP id d9443c01a7336-297e56d90edmr98517825ad.33.1762769464693;
        Mon, 10 Nov 2025 02:11:04 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-297f2d9c971sm60180395ad.55.2025.11.10.02.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:11:04 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, alexey.klimov@linaro.org,
        krzk@kernel.org, bryan.odonoghue@linaro.org,
        jorge.ramirez@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, psodagud@quicinc.com,
        djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v1 1/4] arm64: dts: qcom: qrb2210-rb1: Fix UART3 wakeup IRQ storm
Date: Mon, 10 Nov 2025 15:40:40 +0530
Message-Id: <20251110101043.2108414-2-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251110101043.2108414-1-praveen.talari@oss.qualcomm.com>
References: <20251110101043.2108414-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA4OCBTYWx0ZWRfXy6vjfAMkCBvN
 ovhmZGMQoQGoDP9K/LhdbOlGv8p+OByfkn0SZnRH7lYUhd3OWUVFfFVomGo/fvOCAwGYt2e3ipP
 1/S8yDRp5l7LSieyHcPTKcb9wLwgzKgnPCc98dJT4NYLgaN649ftT+jNk/kBfXpE55uljRa/IXt
 A9IHay+YoK0sHw5diiowE5AIam6tVHcz0qGTTwXtdFJGtV7ZfQty+I+skwETcDwOeh4BJHZgFpQ
 MQKIM5WXD0VDTnMgR3IUGVi3OerkxHv6wfHhHJeM/8eOwsvPEOu0PsFhaP6Z9713L58zYggXenh
 iWLWU3abKCSyvb+S1sM4IW7L+fZjWv8/jfI4YoxD3KHsd9HhTRPCxeSI6F5GbF7Gb+wdGBODXkH
 VU6A1im2Nm7NwuaRsyMSEu7vmR9JxA==
X-Proofpoint-GUID: y7-SzQMxb2BU0uMBoHbXIasppCqqDaJI
X-Authority-Analysis: v=2.4 cv=E8HAZKdl c=1 sm=1 tr=0 ts=6911ba39 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KS-gEAZ6-5rkY-btKooA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: y7-SzQMxb2BU0uMBoHbXIasppCqqDaJI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 clxscore=1011 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100088

For BT use cases, pins are configured with pull-up state in sleep state
to avoid noise. If IRQ type is configured as level high and the GPIO line
is also in a high state, it causes continuous interrupt assertions leading
to an IRQ storm when wakeup irq enables at system suspend/runtime suspend.

Switching to edge-triggered interrupt (IRQ_TYPE_EDGE_FALLING) resolves
this by only triggering on state transitions (high-to-low) rather than
maintaining sensitivity to the static level state, effectively preventing
the continuous interrupt condition and eliminating the wakeup IRQ storm.

Fixes: 9380e0a1d449 ("arm64: dts: qcom: qrb2210-rb1: add Bluetooth support")
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index e0e362b140ad..1b9ca957a94b 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -704,7 +704,7 @@ key_volp_n: key-volp-n-state {
 &uart3 {
 	/delete-property/ interrupts;
 	interrupts-extended = <&intc GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
-			      <&tlmm 11 IRQ_TYPE_LEVEL_HIGH>;
+			      <&tlmm 11 IRQ_TYPE_EDGE_FALLING>;
 	pinctrl-0 = <&uart3_default>;
 	pinctrl-1 = <&uart3_sleep>;
 	pinctrl-names = "default", "sleep";
-- 
2.34.1


