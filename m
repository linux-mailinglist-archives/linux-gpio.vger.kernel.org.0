Return-Path: <linux-gpio+bounces-30233-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9392DCFFB38
	for <lists+linux-gpio@lfdr.de>; Wed, 07 Jan 2026 20:20:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 26CF03003B0A
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jan 2026 19:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F93130ACF0;
	Wed,  7 Jan 2026 19:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oowc9nJb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jw+oUvZZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805F8248F68
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 19:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767813626; cv=none; b=V9P2EkgyhJTpKIJ/+Qfma89MprWba1stF4iQE+ogc+PBSU0ArSPtwuM+p2teSIJXRmqCokNcvv+0BvbVOSsbOasUyqTKMRcmyzgvlBGU1bH9Z50IPPdU+HQ/p6xKkG4Dj8KkL2UKs6PAmwZdWOu/olLLC+b5UJVyZT1s/X1UU+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767813626; c=relaxed/simple;
	bh=znFF51lG9Fr1m7CgHCrtTF8fOom1lHPV2oUFjMGzTRg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DR1H6+OeK12OsKAaj/s3vQYASDZmIBZ4L3wGULuIa7EpaSuvFYNexjEpPlk5UgNHpC1rgIW76mxiqooCSPKiaO1qVfOJM3z7yIlpGDP5/ugdFJ+1WmawdfVmFvhpcSkDNy5cBjXXeXahGNBA74TgAadEcVhuQsLotHJGTaMsdyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oowc9nJb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jw+oUvZZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607I8FbZ2988489
	for <linux-gpio@vger.kernel.org>; Wed, 7 Jan 2026 19:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=j5vgp+4EtJJpI+bJYrlUdNbHlLrat1ZzfEa
	oB50hUeA=; b=oowc9nJbask6qOaFVIvQwjInAQvFJZMitQwkDvdFCAHAhTbX0mM
	35eKeNvC3BX7NyJtZT4w5D8Mn7+BqM4PfKA2dS8tkr+XywbycFttCifmi4hGFhcW
	VUo05uyEksyd97nCR0zJiYiaxXLJQhEn5MbCnBR5WkzedGLW7LWotyfCIHMCtzxQ
	u8bMwZ7DtJt+jjw6uUTpgMzeBL44PjtqcoKE4elh9DZQU5rCf0ppDY2MN+h8Jw8D
	p1+HyjwdTXlbcXpfvebOVLl3plRE6dwkDbBtIZ8HJVfVhzmArAzCJ1Ikqcz/ShUS
	Wdr0JGqUc7r2RVTHJ13nNKqqvuI7EVzwQFw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn2nsu47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 07 Jan 2026 19:20:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c314af2d4so2041162a91.3
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jan 2026 11:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767813622; x=1768418422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j5vgp+4EtJJpI+bJYrlUdNbHlLrat1ZzfEaoB50hUeA=;
        b=Jw+oUvZZMxx+mQTLkgEnDszGLU+HgcQtUjuN07NED5fiRmbaSRrbhamrXCzI9edCeR
         7L/Z6gqn5jNR9cspDfSRNAY77SBSevtC0X8DVxkM9JY4WFDz3fjjA+gfLWzzKbtU7cuQ
         ANOgihKoDI2ZP4BLWhnxPpTw/5M3uZ9KVVtNkwclwTmcOA355U0nvlPQyTpb7eov3Rze
         Ht8hneuwFCSrYryuZH0IF4S0CbMgkP5Gg29sQVNRLzWWM6AoK/Kwkt5d0pwkV84YACSR
         t3V/xYqWi6Xqb3dQpVpxSprBgv0co78VUJ/XF8AvOPDoZAL4/EewdfNUju0ajuCze1U+
         cpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767813622; x=1768418422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5vgp+4EtJJpI+bJYrlUdNbHlLrat1ZzfEaoB50hUeA=;
        b=c7hhZB1z8pL7Gn3ispa+B4eOpItjlTQVQFsPPFvF+gOSNPQL8njsyl1Dycm/MZ4eXm
         mIyOabtBgc//X98jykqG7b2rr9gzuVnsWZdCTQSHSCBcMn1XyxOe5M2gMCFPzaxSQs8M
         GW2f08V0Ju5Sk8GXJyZc5O8MNSitDO755yNBcylN0aRSmhXwHtJlX9iZO4Yl/hgERpgv
         xoL+CtXdCmY7Too7txZ+Do1mtunvko2DM9D75VhwUcmLI42gdc4no5+wDVy5UWOmOzCt
         iBg3Xpxvo+AEmVZnDUBdXz86YGVoUXIbwY1Q8Howl5GlAKAXgENNLH+qUuyy11I2Zzwd
         RjiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWH2kmjAs6GRnhaDiVvdxAEKl+AAqVPKqZsiKgDkynOVWsH/FUkHiUn0puiqXUzuWDUVIPyr/OCOy0@vger.kernel.org
X-Gm-Message-State: AOJu0YybYF0xw+WoddpFCa16JgEl1HuP6bSPSNwYlV0txc0Klhjf4T3K
	U10jz/2vxvHu907FHFiFuYzUlHddnRJwgrapeg75j9xyIBsGB/uerhsZVmgqPrruahn8xFV37R7
	eo1lrgBdxibb+4GSvGPPyv6PD3T4LBwONwxTU8XOfXrMzil9lW1UEmAhZ3pSbJcwD
X-Gm-Gg: AY/fxX6EqtgtnL1vCsL4RXUp5BxrlpIiQgLQMRVyUprvGo1epvW1T0EyR5RiRHa/azm
	XtKRkMoVx1UIcM4nKcUvp8za5Qt2CaoqFvxmqmbtOExR2O0xdJ8b0BNhviXsLR/76pmeiq3g1Vw
	60YpZCMMApg3RSWKbmr1y7rB2CoKlRR29BgJBs4rHYOwmNUXkn22Ja0K/YVhD3RM82A+wl/YMWt
	zzqdsSG5kmFzdTHdlhRg4Kt8DNfZAerx0nkOqe1AGhXZWxEj/d+JxK0sz9OuQV64CwB9zq84q0p
	+xAdf0fc4vxquh19WoZXzncYm1CEwe9ppiE+36i+lgg0x0rwaygXXx7vSIEyRPwfbgghIuYu9EC
	fNtjIkl0fsE8WZ9IMKZtb9Kxt1neSQJNEIhbNoi9lOQVgew==
X-Received: by 2002:a17:90b:4ecd:b0:336:b60f:3936 with SMTP id 98e67ed59e1d1-34f68c4ff5bmr3575562a91.12.1767813622070;
        Wed, 07 Jan 2026 11:20:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzjww7nsn3I9Bw7LLLNAxkdlK1gXIoP7XnWvOwhflCW00/WqrnyLFxKqjEnsv8MdGjQ7iBdg==
X-Received: by 2002:a17:90b:4ecd:b0:336:b60f:3936 with SMTP id 98e67ed59e1d1-34f68c4ff5bmr3575545a91.12.1767813621569;
        Wed, 07 Jan 2026 11:20:21 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f7c4141sm5756375a91.6.2026.01.07.11.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 11:20:20 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] pinctrl: qcom: Add SA8775P lpass-lpi
Date: Thu,  8 Jan 2026 00:50:05 +0530
Message-Id: <20260107192007.500995-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE1MiBTYWx0ZWRfX52u5ELTEr2Uw
 m5cFTEvb4JzkpdwR1Ko5O1P8pSl3lAADRuhoUVABG+U05vrk0gvvt3dArNYjX5XiaK8xwIwA+iG
 XXR0l+KcP/0TqoD7lYEoRdqklFv/szcOrJDm15O/rOLz9GUfhQFlG4ntl5ecQe3khOfw4Koghi7
 5MX/t/ipVrvWBme75nPIarN0MHVzgBxGgZypJXr+X12lepgmZizAzKmZvxE7na8ySANXQ8hQDJF
 Y4WKIKzk4D56Ew6hB2Xn0nJY2Bkwc022KXanstJfPcmEWSQE50oe43auopgWIt1WLdeNJswnVsh
 3EcvcMYWO0PknvK5Qm4slPjI1TIIENk/3SuqksvAFM/4GQhaSg8vZzx3mJj2FvrBZ6IcP6O9VCY
 Zb9dZ8JPxLOFIssJW/f6Qc6dVCqv3prEvYKdPWx15mVeU5EJwtN5IlOHLpkDVCAchH4iBUATiXP
 tFHNfdo9mLU/yRhgs0A==
X-Authority-Analysis: v=2.4 cv=CYEFJbrl c=1 sm=1 tr=0 ts=695eb1f7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5uaU0eOrlHY_0w-MWb8A:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: o1yMzHed06QzfCcT2-1FKLhpwGDaL10t
X-Proofpoint-ORIG-GUID: o1yMzHed06QzfCcT2-1FKLhpwGDaL10t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070152

Add pin control support for Low Power Audio SubSystem (LPASS)
of Qualcomm SA8775P SoC.

changes in [v2]:
	- Fixed dt-binding errors reported by Krzysztof and Rob.
	- Added proper slew rate value for wsa2_swr_data GPIO, as suggested by Konrad.
	- Documented Monaco compatible as suggested by Konrad.
	- Link to V1: https://lore.kernel.org/all/20251116171656.3105461-1-mohammad.rafi.shaik@oss.qualcomm.com/

Mohammad Rafi Shaik (2):
  dt-bindings: pinctrl: qcom,sa8775p-lpass-lpi-pinctrl: Add SA8775P
    LPASS pinctrl
  pinctrl: qcom: sa8775p-lpass-lpi: Add SA8775P LPASS pinctrl

 .../qcom,sa8775p-lpass-lpi-pinctrl.yaml       | 112 +++++++++
 drivers/pinctrl/qcom/Kconfig                  |  10 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 .../pinctrl/qcom/pinctrl-sa8775p-lpass-lpi.c  | 216 ++++++++++++++++++
 4 files changed, 339 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sa8775p-lpass-lpi.c


base-commit: f96074c6d01d8a5e9e2fccd0bba5f2ed654c1f2d
-- 
2.34.1


