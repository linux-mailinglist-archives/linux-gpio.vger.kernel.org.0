Return-Path: <linux-gpio+bounces-36712-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IIUJFIrBGoDFAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36712-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 09:42:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 445E952ED08
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 09:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E832D305E618
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 07:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB19C3D7D61;
	Wed, 13 May 2026 07:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D3/bKa1B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cbb6DZm6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF4F3D75C9
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 07:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778658090; cv=none; b=dpUcapsvrsVzX11rxoKo57Xictxk16D4t22nBVNjI76MkXXh7ZZ/QpGK2zHqdzn5SvAYkPvMMpB0XA+0NLIxSMg19Df8du/jg1S8Xtclt/Yi2HYK1ewWBUE6lxtf5M9K6yVR6ui9hMKCO0mfAsGjMVGZFyWLVm0oUTm+QrwoCYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778658090; c=relaxed/simple;
	bh=xCnf/imRGH4q1obkO1MlH19qzgxVocXERPbyCFIU7YU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r53slYNL+OHI+VqRSiu6oUv88EtcCzJIfjIVTWtCLlpTRgpCuZeAeeRFUVBU8u6Zi/DJsnyeId7gUG5vUF/pExhL9rQy21VMlEm+53d0BeLgjg/RdjQb8zxRQ3qCO4njnuUa6lD5Ga+OTo7dOQaEbPfE3pipet7gj2hotH3VNng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D3/bKa1B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cbb6DZm6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D6FISx3324658
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 07:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zyoxgNBhioj341juMXOOUmnwbSXVmNDzn9vYvf/i6bg=; b=D3/bKa1B442ssai5
	AqkS5xSuJcBHlAUbbi4UZdjo5MC0D+HwBn2iPQHwSy+qyrZlriTIbPIgqkCzZ1i+
	K+H8iql4MhBCrL2tEAOk09GG0L+AjfWAlrL/SlLKVtJt/BPG5KGYCRKxFNSY0R9y
	E7F/iNrNBbrKcnt1Tyq3oSqkSYGiYptpyY5qhJtRPdmNCGJpp0jboZaTVffzWpzS
	NdxhODG54McJ7aKSWH2ZOvBUNqkRpL891K7DFw/Dvw0/k9CGwOHWHoUWnphgCi0y
	paRkNdHmtw//lGnj3V/ZD1hhBDfip/IyzdlpjY2CSGMVoHn7IruHAPMpWObkmmnM
	wo+bhQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvd8bnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 07:41:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fbc49bef6so97786921cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 00:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778658087; x=1779262887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zyoxgNBhioj341juMXOOUmnwbSXVmNDzn9vYvf/i6bg=;
        b=Cbb6DZm6UTTZkN+r95053f3cc+SF6DFXmaWEbLdIQuPpJk8p/RldpRwQ1s7ZZQiB+8
         sv5IHxcynFhRiUwf3PG3kvOC40vW9yuVXVuGfIc4Kgg5Gr06ReUglCcEIGA6RiEcKCkz
         eJTERY/oPKCDLpMuM2fGEZnghGwGW2jNzPLLb33StfaoWdI8GShMxafei3FRp3Q8HAKl
         YiengwZkhmeMWEXF4RWqHlJjZndAKgs+y80rRxXOgKoGzDL/cWLVCNGLBMPD4Up91+TQ
         CRwBBfoOmEOvxzAFNHZDl/Px3TP04VWiAI7uLWCJBPrtk3DSyVRzU+W7OUbbwDiChVzY
         0Jug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778658087; x=1779262887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zyoxgNBhioj341juMXOOUmnwbSXVmNDzn9vYvf/i6bg=;
        b=JkzyCG8mCdCdqMqhiV902U78XTg38XV2ixYbCW8zIcKMTLxY46IoNSuRX1Ntp6Axy3
         J6lFB3737F8YuijR2shhdVUAWkSjSSWInkIZHbsmsAOOxl51l4YwC/2gicvhZ43W0tPO
         0k7q9s7+mN2/Vlqo8GN8A4rCGcqksKc7RyXOUxutt+dkc3yHgCuJvNRmTmjeZoUqMXrm
         FRiTlFhG2gNbKrElyKa/eDi4tfkbFCvAXMuZo79/mrPri9I7MhoI7vVNXH3DbbWon8KJ
         l5F7jVIV9oxWTPJLfKQAOXvCxUTT9HWH+GJacAzUsoY4ZkKJZteNqTiqGlCYh7biPI8T
         mQag==
X-Forwarded-Encrypted: i=1; AFNElJ+wmUa2T1xOmyqWjAeF1fod1iNpysBwv9oBmz3PBqWUcbpIsVmmXK6OctQZJUN9vXa5OOom4SDyeVWJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0rQd1pYGUOYSrXd5LjnbnPhQs1rWJ1x7V95908fKpP6wXxYY4
	uFdPIHjK7PnaOFIsEQrpl1PClMsfXtZy+doxeCzAjqhI8ju3cU+xdSfqwN2Doj4pMWb5hNi2rGN
	ggWMPHRCicj+hyc6EvXHl4z5ovKAwtF88174AZ50cUvUfXzLxAMuG3lumEoD78fO1
X-Gm-Gg: Acq92OFBxS8DuMvuky7mivyLgq0K53/91qIoYkvYXtfco2x2udDxud3ZefvQVdPyzgX
	mKqzMEHq8YaYN60HV8xe8aVM9RBr8hqJBTUmajuOvtaBp6NVzG+e8/ttYPky7wbW6PTW8KnNLYB
	Zk+glA2b1V0S+3gPVP9uIUBrOSUhP+SXkPXQA85EnCrPnYMRxpvwCDf/Y7ZqOnxP7D7Zax9pknb
	2Bb/tAD57bwvccgXNrARXbpjiksty4WH1PxNfgnb/vDCWd/L0q32wAx+xRwnwJPq/eOA0y1XPup
	woo0OMD8+ZAGOr04uB41werMyOjgBCnnCFHUJIP2TdLAlCF6PDrGrOWv3YqEOI2tqV1cgvkKLxr
	L7UVzQAz5ZL0+plzH2dkauBlCEJ5FcQ==
X-Received: by 2002:a05:622a:1e0f:b0:50e:631c:c38d with SMTP id d75a77b69052e-5162ff612e1mr23640411cf.46.1778658086917;
        Wed, 13 May 2026 00:41:26 -0700 (PDT)
X-Received: by 2002:a05:622a:1e0f:b0:50e:631c:c38d with SMTP id d75a77b69052e-5162ff612e1mr23640181cf.46.1778658086437;
        Wed, 13 May 2026 00:41:26 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce05f41csm48999335e9.5.2026.05.13.00.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:41:25 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 13 May 2026 10:41:08 +0300
Subject: [PATCH 2/2] pinctrl: qcom: eliza: Merge QUP1_SE4 lanes in groups
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza-tlmm-group-qup1-se4-lanes-v1-2-1babc6118829@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3320;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=xCnf/imRGH4q1obkO1MlH19qzgxVocXERPbyCFIU7YU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBCsfh0M/fgXqonPVUSzN4prfKfvyhj0SvnfmG
 2uhBBL3vIGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagQrHwAKCRAbX0TJAJUV
 VqG/D/0R4MeiQ0lvgO1/2GtI7WBaFNHLKrktCuAG+oEZtVk79yd3t4bIR7JP/lvmnpFlMKG9uAw
 H3wY+j00vwVhLDu0Sw/ONuWIQqW9EZvss51OOVTXt1orD/LoSzwDEFVdvOCD2FdwYPwECgeiYMk
 hYtwwRGJNLgbuSKycmHIyq7ViJDRxD6rkG6LMqau+6m/sV+I3bSNeoJ9CPIMBiU2k3yLc7pQuXO
 z4Cuf28Les4FIR22DNhcq2HvgYhHpkMUo15rdOVKmBE6k9RJBzACS5DGlIc8Y0zw/uzIRhty1GY
 sQ2Lpse6RVOFQ6PxRGoKXea4+/SD+ncgD2FxHDyvgm2VyD+T5LRmo1qeitwoJ0uZv1sJstiGLJN
 6u0SaElIoKlxBrhKXbsidZgZ5XSOvrNL84J8GOMUnUTDai5+PUnaZBYk6I5jUwNICjL9Y2x7Wbo
 an9L3VQd8YFIQ0BrABx0omw2TyUWAjjcZfkWJku9RRX4D5L3UxHyFYbvE2Vs/Xk4nqRIHEhOzt6
 uLAL5AI7BbkY/VYzKRaySRT8jZmuhdGgywWfDMLMhHOD4tYbHhCrcD4ceib3Rx9YPjd/Nb57rUt
 dSqfNIMGQNygonO2qqBWnpQzD1WXjFMYuaJTDruIQO7qc4Gmyc5wzZBtalmJzFDyXSoJJb6ZVQk
 n04U+xoxzFMO/4g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: ZAGqrrkiRHfkVNm77V5_C8g-erERindu
X-Proofpoint-ORIG-GUID: ZAGqrrkiRHfkVNm77V5_C8g-erERindu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA3NyBTYWx0ZWRfX5pSquRKNusMI
 HJ4BinYb8APEwbXAeGKpqlMsI2fAwfLr7dUwvjZyP91MOvqsEgy/x0k1NVh1GwCWflD2AYxXqu/
 lO3NG2IViVyTqwwwZARwdzoWxgSgwwQfL90X9GvE1UFajYsqoToH+RLDZ0A9UvN7vYP4FqIGkig
 EIA59xKz1WmZ9g2FW712HjpNTjopUGOZ/UQoG3yY/KgwftaTaGRmp7gXVojmaR4M/xnt50MqBK1
 RBrmJgV2FHzauILUvfUDnIXF75Id1KjuD+37LiHBXpa+aMTyoJ7ImScXH0kueYpl5umd66vHQKF
 u3bbjNeUQhnCKyvqz3brojG0jwWjG5vV7/pEpWXTWawgaJ3atkzu5pVatBaDRo/7skO1FA+8qn0
 gWXVUmcDtdNZBJRi3uxQXJl1urzJ2ZWjwQbvYby1/HLs/xN0EbYmZS7gBd+/aXxeclfEAA5TeYS
 nam9n0HPWjqcFRqmJvw==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a042b27 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OwIBgurHg3-afsiYUj8A:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130077
X-Rspamd-Queue-Id: 445E952ED08
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-36712-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

QUP1_SE4 uses GPIO36 and GPIO37 for two selectable lane pairs. The
current driver exposes lanes 0, 1, 2 and 3 as independent functions.
However, since these are usually configured in pairs in devicetree,
it makes more sense to merge them into groups.

So merge the per-lane functions into qup1_se4_01 and qup1_se4_23, and list
both GPIO36 and GPIO37 in each function group.

Fixes: 4f5b1f4e770b ("pinctrl: qcom: eliza: Split QUP1_SE4 lanes")
Suggested-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-eliza.c | 32 ++++++++++----------------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-eliza.c b/drivers/pinctrl/qcom/pinctrl-eliza.c
index 636442d0afed..da2fead23aa1 100644
--- a/drivers/pinctrl/qcom/pinctrl-eliza.c
+++ b/drivers/pinctrl/qcom/pinctrl-eliza.c
@@ -544,10 +544,8 @@ enum eliza_functions {
 	msm_mux_qup1_se2_l3_mira,
 	msm_mux_qup1_se2_l3_mirb,
 	msm_mux_qup1_se3,
-	msm_mux_qup1_se4_l0,
-	msm_mux_qup1_se4_l1,
-	msm_mux_qup1_se4_l2,
-	msm_mux_qup1_se4_l3,
+	msm_mux_qup1_se4_01,
+	msm_mux_qup1_se4_23,
 	msm_mux_qup1_se5,
 	msm_mux_qup1_se6,
 	msm_mux_qup1_se6_l1_mira,
@@ -996,20 +994,12 @@ static const char *const qup1_se3_groups[] = {
 	"gpio44", "gpio45", "gpio46", "gpio47",
 };
 
-static const char *const qup1_se4_l0_groups[] = {
-	"gpio36",
+static const char *const qup1_se4_01_groups[] = {
+	"gpio36", "gpio37",
 };
 
-static const char *const qup1_se4_l1_groups[] = {
-	"gpio37",
-};
-
-static const char *const qup1_se4_l2_groups[] = {
-	"gpio37",
-};
-
-static const char *const qup1_se4_l3_groups[] = {
-	"gpio36",
+static const char *const qup1_se4_23_groups[] = {
+	"gpio36", "gpio37",
 };
 
 static const char *const qup1_se5_groups[] = {
@@ -1312,10 +1302,8 @@ static const struct pinfunction eliza_functions[] = {
 	MSM_PIN_FUNCTION(qup1_se2_l3_mira),
 	MSM_PIN_FUNCTION(qup1_se2_l3_mirb),
 	MSM_PIN_FUNCTION(qup1_se3),
-	MSM_PIN_FUNCTION(qup1_se4_l0),
-	MSM_PIN_FUNCTION(qup1_se4_l1),
-	MSM_PIN_FUNCTION(qup1_se4_l2),
-	MSM_PIN_FUNCTION(qup1_se4_l3),
+	MSM_PIN_FUNCTION(qup1_se4_01),
+	MSM_PIN_FUNCTION(qup1_se4_23),
 	MSM_PIN_FUNCTION(qup1_se5),
 	MSM_PIN_FUNCTION(qup1_se6),
 	MSM_PIN_FUNCTION(qup1_se6_l1_mira),
@@ -1412,8 +1400,8 @@ static const struct msm_pingroup eliza_groups[] = {
 	[33] = PINGROUP(33, qup1_se1, ibi_i3c, host2wlan_sol, gcc_gp3, _, _, _, _, _, _, _),
 	[34] = PINGROUP(34, qup1_se1, qup1_se5, tb_trig_sdc1, ddr_bist_start, qdss_gpio_tracedata, _, _, _, _, _, _),
 	[35] = PINGROUP(35, qup1_se1, qup1_se5, tb_trig_sdc2, gcc_gp2, qdss_gpio_tracedata, _, _, _, _, _, _),
-	[36] = PINGROUP(36, qup1_se4_l0, qup1_se4_l3, ibi_i3c, _, _, _, _, _, _, _, _),
-	[37] = PINGROUP(37, qup1_se4_l1, qup1_se4_l2, ibi_i3c, _, _, _, _, _, _, _, _),
+	[36] = PINGROUP(36, qup1_se4_01, qup1_se4_23, ibi_i3c, _, _, _, _, _, _, _, _),
+	[37] = PINGROUP(37, qup1_se4_01, qup1_se4_23, ibi_i3c, _, _, _, _, _, _, _, _),
 	[38] = PINGROUP(38, _, _, _, _, _, _, _, _, _, _, _),
 	[39] = PINGROUP(39, _, _, _, _, _, _, _, _, _, _, _),
 	[40] = PINGROUP(40, qup1_se6, qup1_se2, qup1_se6_l3_mira, _, qdss_gpio_tracedata, gnss_adc1, ddr_pxi1, _, _, _, _),

-- 
2.54.0


