Return-Path: <linux-gpio+bounces-36711-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kELGG3UrBGoDFAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36711-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 09:42:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 028A352ED4C
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 09:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 850D830BE42D
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 07:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C713D75B5;
	Wed, 13 May 2026 07:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZ2qjVW3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WL3craRl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980A23D6CC4
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 07:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778658088; cv=none; b=JT0mlbyodARUNMGznZAXqXSe1e7bbjMkXgBwV1NeOmI7TjxNjj9p9EoTLLHHQmbK8Aqp8LCCwgAg/QnrKwJ1Wjgr02gEKcYTkc6NFeHI8G1fIZ0FpWvUC1K01wdp+eKrxc+pGpgqUQarA/3+ANI5LXRWl5/BFZScff7S4Wk0nIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778658088; c=relaxed/simple;
	bh=Pferc+ZEMwLRTtESKCijkeUWu0UTlJbwY7sFQbqf3e0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MobGST4fxYNHX7BGA/ZSmINr+UZ+taNMMGA8rhpflLizez6ykRFdmt1SES8heo9Y5Y+Qhgw13e/j59DGs9wFfUJ8N9IK+WWLuomXYd1VGSi7HOhTIDxDm2V6WcF3IqLTg+S4pURdxvIF3/9kcAQkeBQ8lOHvtMvDjKHOyRd4FoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KZ2qjVW3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WL3craRl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4p7k82932908
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 07:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mQL6KOptQ1Zbzs6vUVgPkwvTMBUI/KGMh/4OxtWl9t8=; b=KZ2qjVW300F2pugW
	Wym7u8D5A/06U9FCNhq48qAIemRewtXmuXZhnYEriTq5eyY0UBOgfGNVIJhzeLdI
	4+Y0KW8Oz9pq1vNUvNI2KreWKuo8EsIE0PgkTwFQOHJof2RHMsYcenOQs1PFaTck
	PWUZKWJHkm0sGxNjpV7IPpMrrgmjnDTuMTcTTbimfn0vMsHsQvdU7AjrJGhcjmkV
	tTffW7m1m/FHWfb9GaH5t7b1pk3oTgv+arDqYh9eWx/dar+tEx/JV8RwENPwVKmm
	YwPEtoGBFdrwMeuyDg/pa8mFbXeIlegh8XNrMTUvpNCUomMPTD2baMzKTV6R9DV9
	eROmOA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4319va84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 07:41:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e2592ea3bso37309811cf.2
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 00:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778658085; x=1779262885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mQL6KOptQ1Zbzs6vUVgPkwvTMBUI/KGMh/4OxtWl9t8=;
        b=WL3craRl4MabSrmXeeYa3vSM39Cd7pV11Yuxltv4MBwQWnWnuaXgu0KLulUbwHQFFk
         0dD1SioARNUwh2rd7dDzYB/8Yw6nzLtwEL2JJvnNgb7znEp5oM/TYTV5DQ0Sn8GwGEXL
         WV5MMJMlHdLIaCrPyrENovXLfJCGiQQVGXXhIXUahtnySN+rjbsTDeNZ0wOVp7dXM0qR
         2Y/blsclmjyBtLMwpd+/qwuTobXWzzk954N/onVnBFV98OTAp8p00vOL7HHpCWXJ2bSX
         Y/UfcJEE40fP7JIAlR4y2AVi1o6piKya6hdF4Zc5vyANDUpnk8jOwKJBYsgfayNuboNH
         q3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778658085; x=1779262885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mQL6KOptQ1Zbzs6vUVgPkwvTMBUI/KGMh/4OxtWl9t8=;
        b=MkvtUMA4QNcrXTeY7SmjPz2glaDMbxbnow4+H1K5Z8uIK6NRVRprjkx/6pmDv6GL8/
         WWttZgC3br6VBwZUWEOZEypko+4kdXDeKVJVWl1qnRpbuS+l1FsrVEW3SmLimGySC8jn
         CQQrdRvaFwCAjZGgUh+fgt9/8asfKruyltQQ200ckSXFXVq2yLqbaXQkRFxIoV97cnid
         IUuCiTEuiiC1eJFjyJimizSXuGPR7jQn50Zd0ETg0b21ziyF2OHSmbgkHgup++1ySWnD
         Icc6F+D9PI68RwX3MFxD96LdmA6b2/hTliueznLG2fUwBmH8iAHH+3KpKMlic3QX4M9b
         Ws3g==
X-Forwarded-Encrypted: i=1; AFNElJ9B1v7WUYW+dmWcUHOktYk5MsSCkVDXxtky9MXED5tDzFgHjs/kW9iauipShFC1deMb4z4yoyQNzvSn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5C9s/EVzatWGCraEUqf4Gsf/NNRtbjeq82lc39PzkvaBHPFWE
	lOFd+wqGQvPtm8vfzVvnfY6r3bK9PaEYT+omdsIDxNEY9YsnzZpgrtmqqMv7XYLwYWJZr51yDLb
	HeRxIGgljISqEcps5ZesK208l4iRDyrF02WTVvlb91JvXVnjfpBWFbDD1S+IGvCio
X-Gm-Gg: Acq92OG4BOD1zE1ai//PYMMLCrw9qqNvMFTyzRZ55DeEBvv1gxVu2KIlJY+7Pus3VFj
	kxbjLodHUC7H5t3gEo/pzGJrO/xWfiH3KI/ssYPvqHKY2Bfsb2Oy6YgmIvcjwgv6TsJwS5uaP0R
	R8fV9V/ckEJQ2ZSg0pNhpH79qQq0w5pZwNgOEs5dV+Eq/RoY5T7W820J4L1U2W9JxtDTryQgrQ8
	m4uP0H9oU2dGmlLwyUsfBEIffNaEn62/s+LAQxFWD/e5POAEntCR69YF17AA3rjvuVsDbVXfUod
	abAif4iErUJbvDPTX6LX8QDbhJL1R0pDhDC2kdUC3F/i6v0G5Pn0mprx5mh64DLWUlS4XloonDa
	6UX4QYgIAZ/xzpHtTPKusPOLWt77xrg==
X-Received: by 2002:ac8:7f0a:0:b0:50f:ae60:25ab with SMTP id d75a77b69052e-5162fe3d0d4mr26373581cf.12.1778658084916;
        Wed, 13 May 2026 00:41:24 -0700 (PDT)
X-Received: by 2002:ac8:7f0a:0:b0:50f:ae60:25ab with SMTP id d75a77b69052e-5162fe3d0d4mr26373241cf.12.1778658084381;
        Wed, 13 May 2026 00:41:24 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce05f41csm48999335e9.5.2026.05.13.00.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:41:23 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 13 May 2026 10:41:07 +0300
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom,eliza-tlmm: Merge QUP1_SE4
 lane functions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza-tlmm-group-qup1-se4-lanes-v1-1-1babc6118829@oss.qualcomm.com>
References: <20260513-eliza-tlmm-group-qup1-se4-lanes-v1-0-1babc6118829@oss.qualcomm.com>
In-Reply-To: <20260513-eliza-tlmm-group-qup1-se4-lanes-v1-0-1babc6118829@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1688;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Pferc+ZEMwLRTtESKCijkeUWu0UTlJbwY7sFQbqf3e0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBCse5bUxO0y47PsAfFr4oxJD8AUWbbS4cw6Zq
 CxkaeMYbAKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagQrHgAKCRAbX0TJAJUV
 Vkl+EACrAZXdTCyAh2bMijOya42VNK9eg76WtcwU3sP4mOm4rofiJ9XoCb0dIqKaTMYpJJdo5o5
 QoO6HbsNsv2xTYAFL1xtOXcQIU0Pdvq0SU/hpWq0N5C/UPlhmn+0m+Zs6xYMxYsvm17KNLaPqJT
 yqPO6Nd2x5guaXWipdfn3N8qJAME0lbJ9T+6ZEh9MVcA2WRhIfCe4p6ML2HpSUwYh9WNZwcZ6mq
 L9vBy7jjZFGcIVMdQP7exn3iJbikGt+ZEEY8/iJS7py4bj1oW2tADIkcpZRtJexbWGQjEz0v0ED
 hi1gIhRyBmcERvD9DJ40iA7S8pt9T2AEk3JwPPwljkAoPBHf9FL0qfoWHDtTn60j82QwIEEaw6L
 V81YV6gNUm59EoWoQKZr4GuDPq0Wj3t01Ywnq/JOcqCafS2gK4iuHicf43qTv7dBzjArAyGZmDr
 IBOl774Cklz8ju12JtGlskdpyTJtB/s3SZpiJOHX5koOar0ToA6T0CVY/kH+Wa2IbvBsljld1WV
 PoH8UR2kwtbLhCCJaB+3Ox21DGrqE8MUL8sj6A2r7VPPRGNxQjxeoVDrrqIGP3lK5veqe7Bn9lH
 2YgeYXNNj1hz25e7S81sVZd/oM8g9IrOPBmwEZqZxsxFr5Zyw9/eRyI0snEcMJf6zumwd7/Kh6n
 qOpbZ3T1l1B40ew==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA3NyBTYWx0ZWRfX5UzpLWeWhn+t
 bzhp/At+RJi3fcLPcLkDcMDhQdiH2DCap6+7wWip5KqHE+DV4e+X0TSwcByVnoCAWF2fP5d9tef
 pB432mkdUczbc59rYzmXkxc7MUDEmest01p9iTJhxCUzGSy60T10CNqDyOfho/1oP4LMDYQFdF2
 xQ2gNjGITJNcobsXx6fV+9sraECldoHHg2XplPoUhiN8+9L2/+r4m17VTNbMgrZ3GsSoDoBWZVh
 j91wLFNosRooYHJl3bgjq8xt8mYWpnPQBl8eXf+00K3pX3/18Vb4uKM9UFOt6o20r0tp3J7CQND
 a9uqvijJozVrnC/RzEnjYZZg6yzn+UuNwl6+4yINhdbN6IkNU+ZNv7TikVk0jPpcDkyqTLThfe/
 KRZx68pUt8A5tB5guTj/wodPCTMFVSokWo6db60ui4h4QBVSkQ+SyYAM6C+9r/j9N+du2hDW38Y
 DdZLVwYEMe32pk9LCQg==
X-Proofpoint-GUID: rOj5hL1ABrJHEhaljn2jJO5is4Syq3jx
X-Authority-Analysis: v=2.4 cv=bp98wkai c=1 sm=1 tr=0 ts=6a042b25 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IQVVlPdFdwmH0zWU5b8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: rOj5hL1ABrJHEhaljn2jJO5is4Syq3jx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1011 bulkscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130077
X-Rspamd-Queue-Id: 028A352ED4C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-36711-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

QUP1_SE4 uses GPIO36 and GPIO37 for two selectable lane pairs. The
previous split added one function name per lane. Since these are usually
configured in pairs in devicetree, it makes more sense to have them
grouped.

So replace the per-lane names with names for the two selectable pairs,
qup1_se4_01 and qup1_se4_23.

Fixes: 1bd5c56253c5 ("dt-bindings: pinctrl: qcom,eliza-tlmm: Split QUP1_SE4 lanes")
Suggested-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
index fa0177529277..aaaeca8e7bb7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
@@ -88,8 +88,8 @@ $defs:
                 qlink_little_request, qlink_wmss, qspi0, qspi_clk,
                 qspi_cs, qup1_se0, qup1_se1, qup1_se2, qup1_se2_l2_mira,
                 qup1_se2_l2_mirb, qup1_se2_l3_mira, qup1_se2_l3_mirb,
-                qup1_se3, qup1_se4_l0, qup1_se4_l1, qup1_se4_l2,
-                qup1_se4_l3, qup1_se5, qup1_se6, qup1_se6_l1_mira,
+                qup1_se3, qup1_se4_01, qup1_se4_23,
+                qup1_se5, qup1_se6, qup1_se6_l1_mira,
                 qup1_se6_l1_mirb, qup1_se6_l3_mira, qup1_se6_l3_mirb,
                 qup1_se7, qup1_se7_l0_mira, qup1_se7_l0_mirb,
                 qup1_se7_l1_mira, qup1_se7_l1_mirb, qup2_se0, qup2_se1,

-- 
2.54.0


