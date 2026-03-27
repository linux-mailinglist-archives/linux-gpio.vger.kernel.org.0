Return-Path: <linux-gpio+bounces-34286-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPlWKt+7xmnoNwUAu9opvQ
	(envelope-from <linux-gpio+bounces-34286-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 18:18:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4322C3482EF
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 18:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 708A8307CC3F
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 17:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C21F3EB7F8;
	Fri, 27 Mar 2026 17:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h0j/bNBH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UVd7hVd4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D74C3C73F6
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 17:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631810; cv=none; b=ulJqnFy8CmTjxGNqCyaL7gaOMpuXllMKRQEISEwZpKgOLkvFGi2ygV9TamXG4mAocQCXqM0r6pzTD1xmjhmxe6RP2oM58cBr68Bz3JOas7D1BzHPTkzOZJyQR4tRjacWEQLe+RZremtFoszuaGPY/qCYnSng52WjhpIE55Oy9xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631810; c=relaxed/simple;
	bh=TjXhaoKmSDIiIZQX8QuSEeIHcoRENi4atdkCLLu6oh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gn0RW+r5qMfocArwMSCuA6PfIaZKSRzL39y9DA90u4Qg/eBnAJWmoTL87zC1kChBFsGPPpWBDnA8YR9YdXQMWSqAMV7NcAhuGaZPphkXCiMa4E9DP9iBxHSv87rrVn3K+ab/u0g3HyoOEKvWA4WiFM5pfdXlViXCScYHutKpyeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h0j/bNBH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UVd7hVd4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhhpq2769894
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 17:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I3HlpRnu8yaDAgSI1HzD3rs9meU1sUjz/+4S9QWVEGw=; b=h0j/bNBHjtRzloI7
	ofv+vumMHQZaqzxTgvm6VaPOg8LADjDhVVa+yZcTQiIBqzZJQTwOeZq/fn1/MQnW
	BlSCZCD/GJn5IqGLJxQ5i2hQfCO6bwn8NfW9pfo0YuRwuqZtyDkDjDHLR8BoYIJa
	wu2WTdjh73j9uc89jHryz+4LBQJZZyI5fftxGV+RnYPyq4/+o2Jzvmxvrb8NvY2M
	iLpa6F7O/LelL4x2DDNOd1tBXb1aGC6a4F/ZMeGNUCkmVkicL9ROr7RlOwVieSxg
	fTddS/2ygvVPocQm0nYXCD+2T6EkzV+q2e2m8YAuv9JuxTZqG0jREeXp07vbAL6M
	S5vJHw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxv40ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 17:16:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c699d8caaso4216578b3a.1
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774631806; x=1775236606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3HlpRnu8yaDAgSI1HzD3rs9meU1sUjz/+4S9QWVEGw=;
        b=UVd7hVd4W5oNHQg/CmRltLjyOFmWtNMXDCoX5rB+jScrghdkV/fCLaCukHxOOu7xKT
         JeNRMlzCAinQkirFLh6oNvFvXnvaz8qZ7IuX6gEFNMIGVsm7EyUJ2jXcfvSUsoTvPuOj
         2zSWqd+/IKm+Exs8FvUZQRUiWQ35tQ9Q1Ps/IT/5JpRn9s2uI6zfy6sgU3i7nJUtp7PR
         f7GbKl/FOedxe9OlyFwnle5xu05u0rqCKm4s68eWq4SDOdWVC547AVeNc1tgqWIG4jf2
         RunDPBw9h4BJfJagnZ2stL4sYyeHhDftASME5itVKK/ZNz0KW73CFWiSr5ac7GrpIop8
         G05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774631806; x=1775236606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I3HlpRnu8yaDAgSI1HzD3rs9meU1sUjz/+4S9QWVEGw=;
        b=Afwk/59Azuk7T/HCRA6U0UbvE/DG+QQgzYGqqJ36WC2FoSPAVHybaGlMUD4GHDtlIV
         bga5AmWg2sgbdQrifkCbEyqNZ2Vkz5MrDnaoR0fsvgQEJtdcbkgqyFUIRLGIAI57l0Hf
         zaIEzZ1xv2flvEOo5wVBJ0/LWriz6yxzsTm/0WkbTlbfnQaLyydl/UmJKHvDCAH6XdN3
         SIaREyNUE0OWMPz9KUtWY6ln5073+IsD3PUEGFqtIdwzemmmBzXJJpoxGKZm3fZSwUxq
         7ZRNVvgtl/6gSX5pVFa4GL+6Mi3dU+dXSZ+EOqipShpo2JfmkwmBE9i3HbQZYmqAs2mo
         f68g==
X-Forwarded-Encrypted: i=1; AJvYcCWxXZzx3I4o9n217gW0ebbSvR+a2NLN2zGL7L8xTTgofNNsLyl3bCjm6/SqoXgiUUXgh3XQ/RK7htrS@vger.kernel.org
X-Gm-Message-State: AOJu0YwL4/CKmtcYBlODlxkZnrCNmwKE7u6L+/D8XN8lX80swu+rNkfN
	huKfG+utAQplu6XXPntx59r1tImImrgZv+cn0U/0AN1FGBcuWaQMNoRNhJQ0c3LFYjsQ18WP1ZA
	kPL4GdQot6Gn4JHah2PyAVEt9GVsyRmZDCyuRQze/knllPGsNVApVc/IThQWnmoTI
X-Gm-Gg: ATEYQzxPjDUdKJL93as581ixzoMY4ri9u2zm9zZzWVoGAnrZXlMnZZEeKVJakrWnf4E
	BUkwJg7NcL3o5FfWaIxkL+AO7/+kdksNZSLo+k4mi5U/AiV1ZHUjl3bfbhqFXJSNQw2ZO2GQqJ5
	Iqf+Cd//7LUrUprfhHzDACSaNtxJEGrECHZ+Gk8Yu+m1uCC/CwpPFEefBliiPa9cng/+Gr8cVnx
	vlOu3C73ubElXzMaGCY+5I7hxrkualyiPqnQfAlxeAGulRtFOm+DJ4O17l7xNr1+u7VqQP53yxX
	CGjJG7BYK70pVsZP8XuUzZAR2Id5nl4eUZbLk+QdnvHGmRmsrBBcqGZUKCFWkigv3q64+QOol+k
	8h24GJt21qJ9qmgTicU1rbjC/QTIA6IL1lH7xkGmPPRPPpvEM
X-Received: by 2002:a05:6a00:27a0:b0:81e:12f1:d8a with SMTP id d2e1a72fcca58-82c95ebecabmr3497784b3a.34.1774631804982;
        Fri, 27 Mar 2026 10:16:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:27a0:b0:81e:12f1:d8a with SMTP id d2e1a72fcca58-82c95ebecabmr3497734b3a.34.1774631804113;
        Fri, 27 Mar 2026 10:16:44 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c964f9e9bsm2531517b3a.49.2026.03.27.10.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 10:16:43 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/2] pinctrl: qcom: Drop redundant intr_target_reg on modern SoCs
Date: Fri, 27 Mar 2026 22:42:40 +0530
Message-ID: <20260327171240.3222755-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327171240.3222755-1-mukesh.ojha@oss.qualcomm.com>
References: <20260327171240.3222755-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=69c6bb7e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=fg8pLS6Fh3hz09fDWi0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: h8-5tjXdBbsrDwOYThsZzpsNq-_yCyv1
X-Proofpoint-GUID: h8-5tjXdBbsrDwOYThsZzpsNq-_yCyv1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEyMCBTYWx0ZWRfX90gEo3Chkbo4
 RFaYvAMnUwY/T00cZPAQd3jtOTuuNvBrj8Ef1qiAJxFW4UrPbqrsQVJ3BY6YW+e3kTP3yWZkDMi
 rd8I6aUojQasfCXxldE+qHkKYGf5Hsk+34H2pXsaXgEK4NC9UyobpOzUZ/BIrmmh9aSRtqT4Jmi
 Avrf6djxFH7NDZRs+08qZJnz859ag5EhVfD+x5XbiaAIIG5Vqda4QpZHJJ+I2SCE3uuQnAntpbN
 onap+3GvXU08JoBtP8LbA1IIEHZoHfhlHu8Ng6JQkD4DlJlu1xVcK3Oj+w4Ny6FFg0lLiyNjJWQ
 fh6H5K2cSp+VCg0bUU3RX8AdL0avFl6Hi24fk9sSlKWwxnZqKqUVz203xt+TmchqG1xD3M7priR
 2AtAiea0qKtKkB/zTUsIUKLTCFPm1BGKeW2PEEPz6o6oUZ5q5zm119tt4r86lNvocwq3W2yiDvM
 ExlIkJKs8dB9rg42n9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270120
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34286-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4322C3482EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On all Qualcomm TLMM generations from APQ8084 onwards, the interrupt
target routing bits are located in the same register as the interrupt
configuration bits (intr_cfg_reg). Only five older SoCs — APQ8064,
IPQ8064, MDM9615, MSM8660 and MSM8960 — have a genuinely separate
interrupt target routing register at a different offset (0x400 + 0x4 * id).

Replace MSM_ACCESSOR(intr_target) with a custom accessor that falls back
to intr_cfg_reg when intr_target_reg is zero. Apply the same fallback in
the SCM path. Drop the now-redundant .intr_target_reg initializer from
all SoC drivers where it duplicated intr_cfg_reg, keeping it only in
the five drivers where it genuinely differs.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-apq8084.c   |  2 --
 drivers/pinctrl/qcom/pinctrl-eliza.c     |  3 ---
 drivers/pinctrl/qcom/pinctrl-glymur.c    |  3 ---
 drivers/pinctrl/qcom/pinctrl-ipq4019.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq5018.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq5332.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq5424.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq6018.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq8074.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq9574.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-kaanapali.c |  3 ---
 drivers/pinctrl/qcom/pinctrl-mdm9607.c   |  2 --
 drivers/pinctrl/qcom/pinctrl-milos.c     |  3 ---
 drivers/pinctrl/qcom/pinctrl-msm.c       | 20 ++++++++++++++++++--
 drivers/pinctrl/qcom/pinctrl-msm.h       |  6 +++++-
 drivers/pinctrl/qcom/pinctrl-msm8226.c   |  2 --
 drivers/pinctrl/qcom/pinctrl-msm8909.c   |  2 --
 drivers/pinctrl/qcom/pinctrl-msm8916.c   |  2 --
 drivers/pinctrl/qcom/pinctrl-msm8917.c   |  2 --
 drivers/pinctrl/qcom/pinctrl-msm8953.c   |  2 --
 drivers/pinctrl/qcom/pinctrl-msm8976.c   |  2 --
 drivers/pinctrl/qcom/pinctrl-msm8994.c   |  2 --
 drivers/pinctrl/qcom/pinctrl-msm8996.c   |  2 --
 drivers/pinctrl/qcom/pinctrl-msm8998.c   |  3 ---
 drivers/pinctrl/qcom/pinctrl-msm8x74.c   |  3 ---
 drivers/pinctrl/qcom/pinctrl-qcm2290.c   |  3 ---
 drivers/pinctrl/qcom/pinctrl-qcs404.c    |  2 --
 drivers/pinctrl/qcom/pinctrl-qcs615.c    |  3 ---
 drivers/pinctrl/qcom/pinctrl-qcs8300.c   |  3 ---
 drivers/pinctrl/qcom/pinctrl-qdf2xxx.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-qdu1000.c   |  3 ---
 drivers/pinctrl/qcom/pinctrl-sa8775p.c   |  3 ---
 drivers/pinctrl/qcom/pinctrl-sar2130p.c  |  2 --
 drivers/pinctrl/qcom/pinctrl-sc7180.c    |  3 ---
 drivers/pinctrl/qcom/pinctrl-sc7280.c    |  3 ---
 drivers/pinctrl/qcom/pinctrl-sc8180x.c   |  3 ---
 drivers/pinctrl/qcom/pinctrl-sc8280xp.c  |  3 ---
 drivers/pinctrl/qcom/pinctrl-sdm660.c    |  2 --
 drivers/pinctrl/qcom/pinctrl-sdm670.c    |  4 ----
 drivers/pinctrl/qcom/pinctrl-sdm845.c    |  3 ---
 drivers/pinctrl/qcom/pinctrl-sdx55.c     |  2 --
 drivers/pinctrl/qcom/pinctrl-sdx65.c     |  3 ---
 drivers/pinctrl/qcom/pinctrl-sdx75.c     |  2 --
 drivers/pinctrl/qcom/pinctrl-sm4450.c    |  3 ---
 drivers/pinctrl/qcom/pinctrl-sm6115.c    |  3 ---
 drivers/pinctrl/qcom/pinctrl-sm6125.c    |  3 ---
 drivers/pinctrl/qcom/pinctrl-sm6350.c    |  3 ---
 drivers/pinctrl/qcom/pinctrl-sm6375.c    |  3 ---
 drivers/pinctrl/qcom/pinctrl-sm7150.c    |  3 ---
 drivers/pinctrl/qcom/pinctrl-sm8150.c    |  3 ---
 drivers/pinctrl/qcom/pinctrl-sm8250.c    |  3 ---
 drivers/pinctrl/qcom/pinctrl-sm8350.c    |  3 ---
 drivers/pinctrl/qcom/pinctrl-sm8450.c    |  3 ---
 drivers/pinctrl/qcom/pinctrl-sm8550.c    |  3 ---
 drivers/pinctrl/qcom/pinctrl-sm8650.c    |  3 ---
 drivers/pinctrl/qcom/pinctrl-sm8750.c    |  3 ---
 drivers/pinctrl/qcom/pinctrl-x1e80100.c  |  3 ---
 57 files changed, 23 insertions(+), 138 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-apq8084.c b/drivers/pinctrl/qcom/pinctrl-apq8084.c
index 27693cd64881..9fdbe6743512 100644
--- a/drivers/pinctrl/qcom/pinctrl-apq8084.c
+++ b/drivers/pinctrl/qcom/pinctrl-apq8084.c
@@ -343,7 +343,6 @@ static const unsigned int sdc2_data_pins[] = { 152 };
 		.io_reg = 0x1004 + 0x10 * id,		\
 		.intr_cfg_reg = 0x1008 + 0x10 * id,	\
 		.intr_status_reg = 0x100c + 0x10 * id,	\
-		.intr_target_reg = 0x1008 + 0x10 * id,	\
 		.mux_bit = 2,				\
 		.pull_bit = 0,				\
 		.drv_bit = 6,				\
@@ -370,7 +369,6 @@ static const unsigned int sdc2_data_pins[] = { 152 };
 		.io_reg = 0,                            \
 		.intr_cfg_reg = 0,                      \
 		.intr_status_reg = 0,                   \
-		.intr_target_reg = 0,                   \
 		.mux_bit = -1,                          \
 		.pull_bit = pull,                       \
 		.drv_bit = drv,                         \
diff --git a/drivers/pinctrl/qcom/pinctrl-eliza.c b/drivers/pinctrl/qcom/pinctrl-eliza.c
index 19c706137f81..c1f756cbcdeb 100644
--- a/drivers/pinctrl/qcom/pinctrl-eliza.c
+++ b/drivers/pinctrl/qcom/pinctrl-eliza.c
@@ -34,7 +34,6 @@
 		.io_reg = 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = 0x8 + REG_SIZE * id,	\
 		.intr_status_reg = 0xc + REG_SIZE * id,	\
-		.intr_target_reg = 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
@@ -64,7 +63,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
@@ -89,7 +87,6 @@
 		.io_reg = io,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
 		.drv_bit = 0,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-glymur.c b/drivers/pinctrl/qcom/pinctrl-glymur.c
index 2da3b513d31b..9838c7839923 100644
--- a/drivers/pinctrl/qcom/pinctrl-glymur.c
+++ b/drivers/pinctrl/qcom/pinctrl-glymur.c
@@ -21,7 +21,6 @@
 		.io_reg = 0x4 + REG_SIZE * id,                        \
 		.intr_cfg_reg = 0x8 + REG_SIZE * id,                  \
 		.intr_status_reg = 0xc + REG_SIZE * id,               \
-		.intr_target_reg = 0x8 + REG_SIZE * id,               \
 		.mux_bit = 2,                                         \
 		.pull_bit = 0,                                        \
 		.drv_bit = 6,                                         \
@@ -64,7 +63,6 @@
 		.io_reg = 0,                                         \
 		.intr_cfg_reg = 0,                                   \
 		.intr_status_reg = 0,                                \
-		.intr_target_reg = 0,                                \
 		.mux_bit = -1,                                       \
 		.pull_bit = pull,                                    \
 		.drv_bit = drv,                                      \
@@ -89,7 +87,6 @@
 		.io_reg = io,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
 		.drv_bit = 0,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq4019.c b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
index 6ede3149b6e1..c5f0decc3eb3 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq4019.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
@@ -242,7 +242,6 @@ DECLARE_QCA_GPIO_PINS(99);
 		.io_reg = 0x4 + 0x1000 * id,		\
 		.intr_cfg_reg = 0x8 + 0x1000 * id,	\
 		.intr_status_reg = 0xc + 0x1000 * id,	\
-		.intr_target_reg = 0x8 + 0x1000 * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5018.c b/drivers/pinctrl/qcom/pinctrl-ipq5018.c
index cbf34854f882..0698c8f0110b 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq5018.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq5018.c
@@ -32,7 +32,6 @@
 		.io_reg = 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = 0x8 + REG_SIZE * id,	\
 		.intr_status_reg = 0xc + REG_SIZE * id,	\
-		.intr_target_reg = 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5332.c b/drivers/pinctrl/qcom/pinctrl-ipq5332.c
index 239cbe75f198..26a7a8c818f3 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq5332.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq5332.c
@@ -32,7 +32,6 @@
 		.io_reg = 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = 0x8 + REG_SIZE * id,		\
 		.intr_status_reg = 0xc + REG_SIZE * id,	\
-		.intr_target_reg = 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5424.c b/drivers/pinctrl/qcom/pinctrl-ipq5424.c
index 67b452a033d6..362ad88a5386 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq5424.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq5424.c
@@ -33,7 +33,6 @@
 		.io_reg = 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = 0x8 + REG_SIZE * id,	\
 		.intr_status_reg = 0xc + REG_SIZE * id,	\
-		.intr_target_reg = 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq6018.c b/drivers/pinctrl/qcom/pinctrl-ipq6018.c
index be177fb0a92d..cc83f9362a85 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq6018.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq6018.c
@@ -32,7 +32,6 @@
 		.io_reg = 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = 0x8 + REG_SIZE * id,		\
 		.intr_status_reg = 0xc + REG_SIZE * id,	\
-		.intr_target_reg = 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq8074.c b/drivers/pinctrl/qcom/pinctrl-ipq8074.c
index e94de9083314..64ce8ea8f544 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq8074.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq8074.c
@@ -32,7 +32,6 @@
 		.io_reg = 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = 0x8 + REG_SIZE * id,		\
 		.intr_status_reg = 0xc + REG_SIZE * id,	\
-		.intr_target_reg = 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq9574.c b/drivers/pinctrl/qcom/pinctrl-ipq9574.c
index 3ed093ea8eb9..09223eb166c9 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq9574.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq9574.c
@@ -32,7 +32,6 @@
 		.io_reg = 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = 0x8 + REG_SIZE * id,		\
 		.intr_status_reg = 0xc + REG_SIZE * id,	\
-		.intr_target_reg = 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
diff --git a/drivers/pinctrl/qcom/pinctrl-kaanapali.c b/drivers/pinctrl/qcom/pinctrl-kaanapali.c
index 364e6d997337..5cc45b9c55ab 100644
--- a/drivers/pinctrl/qcom/pinctrl-kaanapali.c
+++ b/drivers/pinctrl/qcom/pinctrl-kaanapali.c
@@ -34,7 +34,6 @@
 		.io_reg = 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = 0x8 + REG_SIZE * id,	\
 		.intr_status_reg = 0xc + REG_SIZE * id,	\
-		.intr_target_reg = 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
@@ -64,7 +63,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
@@ -89,7 +87,6 @@
 		.io_reg = io,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
 		.drv_bit = 0,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-mdm9607.c b/drivers/pinctrl/qcom/pinctrl-mdm9607.c
index cef330547ce7..5794b0a11010 100644
--- a/drivers/pinctrl/qcom/pinctrl-mdm9607.c
+++ b/drivers/pinctrl/qcom/pinctrl-mdm9607.c
@@ -225,7 +225,6 @@ static const unsigned int qdsd_data3_pins[] = { 91 };
 		.io_reg = 0x4 + 0x1000 * id,			\
 		.intr_cfg_reg = 0x8 + 0x1000 * id,		\
 		.intr_status_reg = 0xc + 0x1000 * id,		\
-		.intr_target_reg = 0x8 + 0x1000 * id,		\
 		.mux_bit = 2,					\
 		.pull_bit = 0,					\
 		.drv_bit = 6,					\
@@ -251,7 +250,6 @@ static const unsigned int qdsd_data3_pins[] = { 91 };
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-milos.c b/drivers/pinctrl/qcom/pinctrl-milos.c
index 19abd5233a2c..74b5253257af 100644
--- a/drivers/pinctrl/qcom/pinctrl-milos.c
+++ b/drivers/pinctrl/qcom/pinctrl-milos.c
@@ -36,7 +36,6 @@
 		.io_reg = 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = 0x8 + REG_SIZE * id,	\
 		.intr_status_reg = 0xc + REG_SIZE * id,	\
-		.intr_target_reg = 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,				\
 		.pull_bit = 0,				\
 		.drv_bit = 6,				\
@@ -67,7 +66,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
@@ -92,7 +90,6 @@
 		.io_reg = io,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
 		.drv_bit = 0,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index e99871b90ab9..45b3a2763eb8 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -98,7 +98,22 @@ MSM_ACCESSOR(ctl)
 MSM_ACCESSOR(io)
 MSM_ACCESSOR(intr_cfg)
 MSM_ACCESSOR(intr_status)
-MSM_ACCESSOR(intr_target)
+
+static u32 msm_readl_intr_target(struct msm_pinctrl *pctrl,
+				 const struct msm_pingroup *g)
+{
+	u32 reg = g->intr_target_reg ? g->intr_target_reg : g->intr_cfg_reg;
+
+	return readl(pctrl->regs[g->tile] + reg);
+}
+
+static void msm_writel_intr_target(u32 val, struct msm_pinctrl *pctrl,
+				   const struct msm_pingroup *g)
+{
+	u32 reg = g->intr_target_reg ? g->intr_target_reg : g->intr_cfg_reg;
+
+	writel(val, pctrl->regs[g->tile] + reg);
+}
 
 static void msm_ack_intr_status(struct msm_pinctrl *pctrl,
 				const struct msm_pingroup *g)
@@ -1078,7 +1093,8 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		intr_target_mask = GENMASK(g->intr_target_width - 1, 0);
 
 	if (pctrl->intr_target_use_scm) {
-		u32 addr = pctrl->phys_base[0] + g->intr_target_reg;
+		u32 reg = g->intr_target_reg ? g->intr_target_reg : g->intr_cfg_reg;
+		u32 addr = pctrl->phys_base[0] + reg;
 		int ret;
 
 		qcom_scm_io_readl(addr, &val);
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index 4625fa5320a9..a4af279f748a 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -52,7 +52,11 @@ struct pinctrl_pin_desc;
  * @intr_cfg_reg:         Offset of the register holding interrupt configuration bits.
  * @intr_status_reg:      Offset of the register holding the status bits for this group.
  * @intr_target_reg:      Offset of the register specifying routing of the interrupts
- *                        from this group.
+ *                        from this group. On most SoCs this register is the same as
+ *                        @intr_cfg_reg; leaving this field as zero causes the driver
+ *                        to fall back to @intr_cfg_reg automatically. Only set this
+ *                        explicitly on older SoCs where the interrupt target routing
+ *                        lives in a separate register (e.g. APQ8064, MSM8960).
  * @mux_bit:              Offset in @ctl_reg for the pinmux function selection.
  * @pull_bit:             Offset in @ctl_reg for the bias configuration.
  * @drv_bit:              Offset in @ctl_reg for the drive strength configuration.
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8226.c b/drivers/pinctrl/qcom/pinctrl-msm8226.c
index a81aa092ef12..d27b7599ea83 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8226.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8226.c
@@ -282,7 +282,6 @@ static const unsigned int sdc2_data_pins[] = { 122 };
 		.io_reg = 0x1004 + 0x10 * id,		\
 		.intr_cfg_reg = 0x1008 + 0x10 * id,	\
 		.intr_status_reg = 0x100c + 0x10 * id,	\
-		.intr_target_reg = 0x1008 + 0x10 * id,	\
 		.mux_bit = 2,				\
 		.pull_bit = 0,				\
 		.drv_bit = 6,				\
@@ -308,7 +307,6 @@ static const unsigned int sdc2_data_pins[] = { 122 };
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8909.c b/drivers/pinctrl/qcom/pinctrl-msm8909.c
index 544a52fb8f3d..8fa922d89101 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8909.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8909.c
@@ -33,7 +33,6 @@
 		.io_reg = 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = 0x8 + REG_SIZE * id,	\
 		.intr_status_reg = 0xc + REG_SIZE * id,	\
-		.intr_target_reg = 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,				\
 		.pull_bit = 0,				\
 		.drv_bit = 6,				\
@@ -59,7 +58,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8916.c b/drivers/pinctrl/qcom/pinctrl-msm8916.c
index b1b6934bb4b6..709c5d1d4d0a 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8916.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8916.c
@@ -307,7 +307,6 @@ static const unsigned int qdsd_data3_pins[] = { 133 };
 		.io_reg = 0x4 + 0x1000 * id,			\
 		.intr_cfg_reg = 0x8 + 0x1000 * id,		\
 		.intr_status_reg = 0xc + 0x1000 * id,		\
-		.intr_target_reg = 0x8 + 0x1000 * id,		\
 		.mux_bit = 2,					\
 		.pull_bit = 0,					\
 		.drv_bit = 6,					\
@@ -333,7 +332,6 @@ static const unsigned int qdsd_data3_pins[] = { 133 };
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8917.c b/drivers/pinctrl/qcom/pinctrl-msm8917.c
index f23d92d6615b..d1ede4891703 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8917.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8917.c
@@ -333,7 +333,6 @@ static const unsigned int qdsd_data3_pins[] = { 146 };
 		.io_reg = 0x4 + 0x1000 * id,			\
 		.intr_cfg_reg = 0x8 + 0x1000 * id,		\
 		.intr_status_reg = 0xc + 0x1000 * id,		\
-		.intr_target_reg = 0x8 + 0x1000 * id,		\
 		.mux_bit = 2,					\
 		.pull_bit = 0,					\
 		.drv_bit = 6,					\
@@ -359,7 +358,6 @@ static const unsigned int qdsd_data3_pins[] = { 146 };
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8953.c b/drivers/pinctrl/qcom/pinctrl-msm8953.c
index 67db062fdf56..02ea89f5feaa 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8953.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8953.c
@@ -29,7 +29,6 @@
 		.io_reg = 0x4 + 0x1000 * id,			\
 		.intr_cfg_reg = 0x8 + 0x1000 * id,		\
 		.intr_status_reg = 0xc + 0x1000 * id,		\
-		.intr_target_reg = 0x8 + 0x1000 * id,		\
 		.mux_bit = 2,					\
 		.pull_bit = 0,					\
 		.drv_bit = 6,					\
@@ -55,7 +54,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8976.c b/drivers/pinctrl/qcom/pinctrl-msm8976.c
index 345539b9e696..906a90778b97 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8976.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8976.c
@@ -35,7 +35,6 @@
 		.io_reg = REG_BASE + 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = REG_BASE + 0x8 + REG_SIZE * id,		\
 		.intr_status_reg = REG_BASE + 0xc + REG_SIZE * id,	\
-		.intr_target_reg = REG_BASE + 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
@@ -61,7 +60,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8994.c b/drivers/pinctrl/qcom/pinctrl-msm8994.c
index 94e042d1f4b2..ecbe6b91d1da 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8994.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8994.c
@@ -33,7 +33,6 @@
 		.io_reg = 0x1004 + 0x10 * id,		\
 		.intr_cfg_reg = 0x1008 + 0x10 * id,	\
 		.intr_status_reg = 0x100c + 0x10 * id,	\
-		.intr_target_reg = 0x1008 + 0x10 * id,	\
 		.mux_bit = 2,				\
 		.pull_bit = 0,				\
 		.drv_bit = 6,				\
@@ -59,7 +58,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8996.c b/drivers/pinctrl/qcom/pinctrl-msm8996.c
index e5b55693d023..73b07a10a957 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8996.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8996.c
@@ -33,7 +33,6 @@
 		.io_reg = REG_BASE + 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = REG_BASE + 0x8 + REG_SIZE * id,		\
 		.intr_status_reg = REG_BASE + 0xc + REG_SIZE * id,	\
-		.intr_target_reg = REG_BASE + 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
@@ -59,7 +58,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8998.c b/drivers/pinctrl/qcom/pinctrl-msm8998.c
index b727593af34a..dcf11b79e562 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8998.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8998.c
@@ -35,7 +35,6 @@
 		.io_reg = base + 0x4 + 0x1000 * id,		\
 		.intr_cfg_reg = base + 0x8 + 0x1000 * id,	\
 		.intr_status_reg = base + 0xc + 0x1000 * id,	\
-		.intr_target_reg = base + 0x8 + 0x1000 * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
@@ -61,7 +60,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
@@ -86,7 +84,6 @@
 		.io_reg = offset + 0x4,			\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
 		.drv_bit = 0,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8x74.c b/drivers/pinctrl/qcom/pinctrl-msm8x74.c
index 202bec003e96..ff432ec5815a 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8x74.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8x74.c
@@ -344,7 +344,6 @@ static const unsigned int hsic_data_pins[] = { 153 };
 		.io_reg = 0x1004 + 0x10 * id,		\
 		.intr_cfg_reg = 0x1008 + 0x10 * id,	\
 		.intr_status_reg = 0x100c + 0x10 * id,	\
-		.intr_target_reg = 0x1008 + 0x10 * id,	\
 		.mux_bit = 2,				\
 		.pull_bit = 0,				\
 		.drv_bit = 6,				\
@@ -370,7 +369,6 @@ static const unsigned int hsic_data_pins[] = { 153 };
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
@@ -401,7 +399,6 @@ static const unsigned int hsic_data_pins[] = { 153 };
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = 25,				\
 		.pull_bit = -1,				\
 		.drv_bit = -1,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-qcm2290.c b/drivers/pinctrl/qcom/pinctrl-qcm2290.c
index 38200957451e..3b28ac498885 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcm2290.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcm2290.c
@@ -33,7 +33,6 @@
 		.io_reg = 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = 0x8 + REG_SIZE * id,	\
 		.intr_status_reg = 0xc + REG_SIZE * id,	\
-		.intr_target_reg = 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
@@ -61,7 +60,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
@@ -86,7 +84,6 @@
 		.io_reg = offset + 0x4,			\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
 		.drv_bit = 0,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-qcs404.c b/drivers/pinctrl/qcom/pinctrl-qcs404.c
index 0b8db2c7e58a..1048a7093b2e 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs404.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs404.c
@@ -43,7 +43,6 @@ enum {
 		.io_reg = 0x1000 * id + 0x4,		\
 		.intr_cfg_reg = 0x1000 * id + 0x8,	\
 		.intr_status_reg = 0x1000 * id + 0xc,	\
-		.intr_target_reg = 0x1000 * id + 0x8,	\
 		.tile = _tile,			\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
@@ -70,7 +69,6 @@ enum {
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.tile = SOUTH,				\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
diff --git a/drivers/pinctrl/qcom/pinctrl-qcs615.c b/drivers/pinctrl/qcom/pinctrl-qcs615.c
index f1c827ddbfbf..0ed4332d989e 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs615.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs615.c
@@ -43,7 +43,6 @@ static const char * const qcs615_tiles[] = {
 		.io_reg = 0x1000 * id + 0x4,		\
 		.intr_cfg_reg = 0x1000 * id + 0x8,	\
 		.intr_status_reg = 0x1000 * id + 0xc,	\
-		.intr_target_reg = 0x1000 * id + 0x8,	\
 		.tile = _tile,			\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
@@ -70,7 +69,6 @@ static const char * const qcs615_tiles[] = {
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.tile = _tile,				\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
@@ -96,7 +94,6 @@ static const char * const qcs615_tiles[] = {
 		.io_reg = offset + 0x4,			\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.tile = WEST,				\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-qcs8300.c b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
index f1af1a620684..852cd36df6d5 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs8300.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
@@ -34,7 +34,6 @@
 		.io_reg = 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = 0x8 + REG_SIZE * id,	\
 		.intr_status_reg = 0xc + REG_SIZE * id,	\
-		.intr_target_reg = 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
@@ -62,7 +61,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
@@ -87,7 +85,6 @@
 		.io_reg = offset + 0x4,			\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
 		.drv_bit = 0,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-qdf2xxx.c b/drivers/pinctrl/qcom/pinctrl-qdf2xxx.c
index 9ecc4d40e4dc..3b9edcf8780b 100644
--- a/drivers/pinctrl/qcom/pinctrl-qdf2xxx.c
+++ b/drivers/pinctrl/qcom/pinctrl-qdf2xxx.c
@@ -106,7 +106,6 @@ static int qdf2xxx_pinctrl_probe(struct platform_device *pdev)
 		groups[gpio].io_reg = 0x04 + 0x10000 * gpio;
 		groups[gpio].intr_cfg_reg = 0x08 + 0x10000 * gpio;
 		groups[gpio].intr_status_reg = 0x0c + 0x10000 * gpio;
-		groups[gpio].intr_target_reg = 0x08 + 0x10000 * gpio;
 
 		groups[gpio].mux_bit = 2;
 		groups[gpio].pull_bit = 0;
diff --git a/drivers/pinctrl/qcom/pinctrl-qdu1000.c b/drivers/pinctrl/qcom/pinctrl-qdu1000.c
index 7c535698a780..5125df7eb127 100644
--- a/drivers/pinctrl/qcom/pinctrl-qdu1000.c
+++ b/drivers/pinctrl/qcom/pinctrl-qdu1000.c
@@ -35,7 +35,6 @@
 		.io_reg = REG_BASE + 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = REG_BASE + 0x8 + REG_SIZE * id,		\
 		.intr_status_reg = REG_BASE + 0xc + REG_SIZE * id,	\
-		.intr_target_reg = REG_BASE + 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
@@ -61,7 +60,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
@@ -86,7 +84,6 @@
 		.io_reg = offset + 0x4,			\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
 		.drv_bit = 0,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-sa8775p.c b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
index 53f28b9c49ba..e9a510d3583f 100644
--- a/drivers/pinctrl/qcom/pinctrl-sa8775p.c
+++ b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
@@ -34,7 +34,6 @@
 		.io_reg = REG_BASE + 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = REG_BASE + 0x8 + REG_SIZE * id,		\
 		.intr_status_reg = REG_BASE + 0xc + REG_SIZE * id,	\
-		.intr_target_reg = REG_BASE + 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
@@ -63,7 +62,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
@@ -88,7 +86,6 @@
 		.io_reg = offset + 0x4,			\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
 		.drv_bit = 0,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-sar2130p.c b/drivers/pinctrl/qcom/pinctrl-sar2130p.c
index 4a53f4ee2041..1d1b5de4eefd 100644
--- a/drivers/pinctrl/qcom/pinctrl-sar2130p.c
+++ b/drivers/pinctrl/qcom/pinctrl-sar2130p.c
@@ -34,7 +34,6 @@
 		.io_reg = 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = 0x8 + REG_SIZE * id,	\
 		.intr_status_reg = 0xc + REG_SIZE * id,	\
-		.intr_target_reg = 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
@@ -62,7 +61,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7180.c b/drivers/pinctrl/qcom/pinctrl-sc7180.c
index 3eae51472b13..01cfcb416f33 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7180.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7180.c
@@ -41,7 +41,6 @@ enum {
 		.io_reg = 0x1000 * id + 0x4,		\
 		.intr_cfg_reg = 0x1000 * id + 0x8,	\
 		.intr_status_reg = 0x1000 * id + 0xc,	\
-		.intr_target_reg = 0x1000 * id + 0x8,	\
 		.tile = _tile,			\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
@@ -68,7 +67,6 @@ enum {
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.tile = SOUTH,				\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
@@ -94,7 +92,6 @@ enum {
 		.io_reg = offset + 0x4,			\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.tile = SOUTH,				\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
index 44e09608aad0..f22fd56efd89 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280.c
@@ -31,7 +31,6 @@
 		.io_reg = 0x1000 * id + 0x4,		\
 		.intr_cfg_reg = 0x1000 * id + 0x8,	\
 		.intr_status_reg = 0x1000 * id + 0xc,	\
-		.intr_target_reg = 0x1000 * id + 0x8,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
@@ -59,7 +58,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
@@ -84,7 +82,6 @@
 		.io_reg = offset + 0x4,			\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
 		.drv_bit = 0,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-sc8180x.c b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
index d9f9e3dd9dd1..062cb913e5ee 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8180x.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
@@ -60,7 +60,6 @@ static const struct tile_info sc8180x_tile_info[] = {
 		.io_reg = REG_SIZE * id + 0x4 + offset,	\
 		.intr_cfg_reg = REG_SIZE * id + 0x8 + offset,	\
 		.intr_status_reg = REG_SIZE * id + 0xc + offset,\
-		.intr_target_reg = REG_SIZE * id + 0x8 + offset,\
 		.tile = _tile,				\
 		.mux_bit = 2,				\
 		.pull_bit = 0,				\
@@ -90,7 +89,6 @@ static const struct tile_info sc8180x_tile_info[] = {
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.tile = EAST,				\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
@@ -116,7 +114,6 @@ static const struct tile_info sc8180x_tile_info[] = {
 		.io_reg = 0xb6004,			\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.tile = SOUTH,				\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-sc8280xp.c b/drivers/pinctrl/qcom/pinctrl-sc8280xp.c
index cf8297e8b8f8..4056b9fa32f8 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8280xp.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8280xp.c
@@ -31,7 +31,6 @@
 		.io_reg = 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = 0x8 + REG_SIZE * id,	\
 		.intr_status_reg = 0xc + REG_SIZE * id,	\
-		.intr_target_reg = 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
@@ -59,7 +58,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
@@ -84,7 +82,6 @@
 		.io_reg = offset + 0x4,			\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
 		.drv_bit = 0,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm660.c b/drivers/pinctrl/qcom/pinctrl-sdm660.c
index 687d986de75c..ab0368653d30 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm660.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm660.c
@@ -46,7 +46,6 @@ enum {
 		.io_reg = 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = 0x8 + REG_SIZE * id,	\
 		.intr_status_reg = 0xc + REG_SIZE * id,	\
-		.intr_target_reg = 0x8 + REG_SIZE * id,	\
 		.tile = _tile,			\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
@@ -73,7 +72,6 @@ enum {
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.tile = NORTH,				\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm670.c b/drivers/pinctrl/qcom/pinctrl-sdm670.c
index 486b72edf7b4..533b87c39cd5 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm670.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm670.c
@@ -37,7 +37,6 @@
 		.io_reg = base + 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = base + 0x8 + REG_SIZE * id,	\
 		.intr_status_reg = base + 0xc + REG_SIZE * id,	\
-		.intr_target_reg = base + 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
@@ -67,7 +66,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = -1,				\
 		.drv_bit = -1,				\
@@ -92,7 +90,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
@@ -117,7 +114,6 @@
 		.io_reg = offset + 0x4,			\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
 		.drv_bit = 0,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom/pinctrl-sdm845.c
index 4cf8575797a0..b5ed2311b70e 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm845.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm845.c
@@ -37,7 +37,6 @@
 		.io_reg = base + 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = base + 0x8 + REG_SIZE * id,	\
 		.intr_status_reg = base + 0xc + REG_SIZE * id,	\
-		.intr_target_reg = base + 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
@@ -63,7 +62,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
@@ -88,7 +86,6 @@
 		.io_reg = offset + 0x4,			\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
 		.drv_bit = 0,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-sdx55.c b/drivers/pinctrl/qcom/pinctrl-sdx55.c
index 79a7010b73f1..3e87f5927924 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdx55.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdx55.c
@@ -33,7 +33,6 @@
 		.io_reg = 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = 0x8 + REG_SIZE * id,		\
 		.intr_status_reg = 0xc + REG_SIZE * id,	\
-		.intr_target_reg = 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
@@ -59,7 +58,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-sdx65.c b/drivers/pinctrl/qcom/pinctrl-sdx65.c
index cc8a99a6a91e..4e787341b2a2 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdx65.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdx65.c
@@ -33,7 +33,6 @@
 		.io_reg = REG_BASE + 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = REG_BASE + 0x8 + REG_SIZE * id,		\
 		.intr_status_reg = REG_BASE + 0xc + REG_SIZE * id,	\
-		.intr_target_reg = REG_BASE + 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
@@ -59,7 +58,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
@@ -84,7 +82,6 @@
 		.io_reg = offset + 0x4,			\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
 		.drv_bit = 0,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-sdx75.c b/drivers/pinctrl/qcom/pinctrl-sdx75.c
index 4078d83d818c..9a7e359dbd23 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdx75.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdx75.c
@@ -19,7 +19,6 @@
 		.io_reg = REG_BASE + 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = REG_BASE + 0x8 + REG_SIZE * id,		\
 		.intr_status_reg = REG_BASE + 0xc + REG_SIZE * id,	\
-		.intr_target_reg = REG_BASE + 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,						\
 		.pull_bit = 0,						\
 		.drv_bit = 6,						\
@@ -60,7 +59,6 @@
 		.io_reg = 0,						\
 		.intr_cfg_reg = 0,					\
 		.intr_status_reg = 0,					\
-		.intr_target_reg = 0,					\
 		.mux_bit = -1,						\
 		.pull_bit = pull,					\
 		.drv_bit = drv,						\
diff --git a/drivers/pinctrl/qcom/pinctrl-sm4450.c b/drivers/pinctrl/qcom/pinctrl-sm4450.c
index d51e271e3361..83650f173b01 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm4450.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm4450.c
@@ -33,7 +33,6 @@
 		.io_reg = 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = 0x8 + REG_SIZE * id,		\
 		.intr_status_reg = 0xc + REG_SIZE * id,	\
-		.intr_target_reg = 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
@@ -61,7 +60,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
@@ -86,7 +84,6 @@
 		.io_reg = offset + 0x4,			\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
 		.drv_bit = 0,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6115.c b/drivers/pinctrl/qcom/pinctrl-sm6115.c
index 06700685ea2a..234451fbf47b 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6115.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6115.c
@@ -43,7 +43,6 @@ enum {
 		.io_reg = 0x4 + 0x1000 * id,		\
 		.intr_cfg_reg = 0x8 + 0x1000 * id,	\
 		.intr_status_reg = 0xc + 0x1000 * id,	\
-		.intr_target_reg = 0x8 + 0x1000 * id,	\
 		.tile = _tile,			\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
@@ -70,7 +69,6 @@ enum {
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.tile = _tile,				\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
@@ -96,7 +94,6 @@ enum {
 		.io_reg = offset + 0x4,			\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.tile = WEST,				\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6125.c b/drivers/pinctrl/qcom/pinctrl-sm6125.c
index 5d3d1e402345..2cf9136860fc 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6125.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6125.c
@@ -40,7 +40,6 @@ enum {
 		.io_reg = 0x4 + 0x1000 * id,		\
 		.intr_cfg_reg = 0x8 + 0x1000 * id,	\
 		.intr_status_reg = 0xc + 0x1000 * id,	\
-		.intr_target_reg = 0x8 + 0x1000 * id,	\
 		.tile = _tile,			\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
@@ -67,7 +66,6 @@ enum {
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.tile = _tile,				\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
@@ -93,7 +91,6 @@ enum {
 		.io_reg = offset + 0x4,			\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.tile = WEST,				\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6350.c b/drivers/pinctrl/qcom/pinctrl-sm6350.c
index 220fb582cac9..eb8cd4aa8a97 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6350.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6350.c
@@ -33,7 +33,6 @@
 		.io_reg = 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = 0x8 + REG_SIZE * id,		\
 		.intr_status_reg = 0xc + REG_SIZE * id,	\
-		.intr_target_reg = 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
@@ -59,7 +58,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
@@ -84,7 +82,6 @@
 		.io_reg = offset + 0x4,			\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
 		.drv_bit = 0,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6375.c b/drivers/pinctrl/qcom/pinctrl-sm6375.c
index 08b8ef6efaf0..d4547dd9f21f 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6375.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6375.c
@@ -34,7 +34,6 @@
 		.io_reg = REG_SIZE * id + 0x4,		\
 		.intr_cfg_reg = REG_SIZE * id + 0x8,	\
 		.intr_status_reg = REG_SIZE * id + 0xc,	\
-		.intr_target_reg = REG_SIZE * id + 0x8,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
@@ -62,7 +61,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
@@ -87,7 +85,6 @@
 		.io_reg = offset + 0x4,			\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
 		.drv_bit = 0,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-sm7150.c b/drivers/pinctrl/qcom/pinctrl-sm7150.c
index 78dd8153a4d4..a01437c37525 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm7150.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm7150.c
@@ -47,7 +47,6 @@ enum {
 		.io_reg = 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = 0x8 + REG_SIZE * id,	\
 		.intr_status_reg = 0xc + REG_SIZE * id,	\
-		.intr_target_reg = 0x8 + REG_SIZE * id,	\
 		.tile = _tile,				\
 		.mux_bit = 2,				\
 		.pull_bit = 0,				\
@@ -74,7 +73,6 @@ enum {
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.tile = _tile,				\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
@@ -100,7 +98,6 @@ enum {
 		.io_reg = offset + 0x4,			\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.tile = WEST,				\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8150.c b/drivers/pinctrl/qcom/pinctrl-sm8150.c
index ad861cd66958..0767261f5149 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8150.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8150.c
@@ -43,7 +43,6 @@ enum {
 		.io_reg = 0x1000 * id + 0x4,		\
 		.intr_cfg_reg = 0x1000 * id + 0x8,	\
 		.intr_status_reg = 0x1000 * id + 0xc,	\
-		.intr_target_reg = 0x1000 * id + 0x8,	\
 		.tile = _tile,			\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
@@ -70,7 +69,6 @@ enum {
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.tile = NORTH,				\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
@@ -96,7 +94,6 @@ enum {
 		.io_reg = offset + 0x4,			\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.tile = SOUTH,				\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
index f05361f3100d..f73f3b052de4 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250.c
@@ -44,7 +44,6 @@ enum {
 		.io_reg = REG_SIZE * id + 0x4,		\
 		.intr_cfg_reg = REG_SIZE * id + 0x8,	\
 		.intr_status_reg = REG_SIZE * id + 0xc,	\
-		.intr_target_reg = REG_SIZE * id + 0x8,	\
 		.tile = _tile,				\
 		.mux_bit = 2,				\
 		.pull_bit = 0,				\
@@ -73,7 +72,6 @@ enum {
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.tile = NORTH,				\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
@@ -99,7 +97,6 @@ enum {
 		.io_reg = offset + 0x4,			\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.tile = SOUTH,				\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8350.c b/drivers/pinctrl/qcom/pinctrl-sm8350.c
index 99949b552021..377ddfc77e4f 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8350.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8350.c
@@ -34,7 +34,6 @@
 		.io_reg = REG_SIZE * id + 0x4,		\
 		.intr_cfg_reg = REG_SIZE * id + 0x8,	\
 		.intr_status_reg = REG_SIZE * id + 0xc,	\
-		.intr_target_reg = REG_SIZE * id + 0x8,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
@@ -60,7 +59,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
@@ -85,7 +83,6 @@
 		.io_reg = offset + 0x4,			\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
 		.drv_bit = 0,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8450.c b/drivers/pinctrl/qcom/pinctrl-sm8450.c
index 9889fc5dc2cd..a1d84074ea49 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8450.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8450.c
@@ -34,7 +34,6 @@
 		.io_reg = 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = 0x8 + REG_SIZE * id,		\
 		.intr_status_reg = 0xc + REG_SIZE * id,	\
-		.intr_target_reg = 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
@@ -62,7 +61,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
@@ -87,7 +85,6 @@
 		.io_reg = offset + 0x4,			\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
 		.drv_bit = 0,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8550.c b/drivers/pinctrl/qcom/pinctrl-sm8550.c
index 10a62031fdfd..cc8fbf4d5e84 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8550.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8550.c
@@ -35,7 +35,6 @@
 		.io_reg = 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = 0x8 + REG_SIZE * id,		\
 		.intr_status_reg = 0xc + REG_SIZE * id,	\
-		.intr_target_reg = 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
@@ -64,7 +63,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
@@ -89,7 +87,6 @@
 		.io_reg = offset + 0x4,			\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
 		.drv_bit = 0,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650.c b/drivers/pinctrl/qcom/pinctrl-sm8650.c
index e2ae03800206..ab41292e3b4e 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8650.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8650.c
@@ -36,7 +36,6 @@
 		.io_reg = 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = 0x8 + REG_SIZE * id,		\
 		.intr_status_reg = 0xc + REG_SIZE * id,	\
-		.intr_target_reg = 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
@@ -67,7 +66,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
@@ -92,7 +90,6 @@
 		.io_reg = io,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
 		.drv_bit = 0,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8750.c b/drivers/pinctrl/qcom/pinctrl-sm8750.c
index 6f92f176edd4..4cfe73f30fac 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8750.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8750.c
@@ -35,7 +35,6 @@
 		.io_reg = 0x4 + REG_SIZE * id,                        \
 		.intr_cfg_reg = 0x8 + REG_SIZE * id,                  \
 		.intr_status_reg = 0xc + REG_SIZE * id,               \
-		.intr_target_reg = 0x8 + REG_SIZE * id,               \
 		.mux_bit = 2,                                         \
 		.pull_bit = 0,                                        \
 		.drv_bit = 6,                                         \
@@ -65,7 +64,6 @@
 		.io_reg = 0,                                         \
 		.intr_cfg_reg = 0,                                   \
 		.intr_status_reg = 0,                                \
-		.intr_target_reg = 0,                                \
 		.mux_bit = -1,                                       \
 		.pull_bit = pull,                                    \
 		.drv_bit = drv,                                      \
@@ -90,7 +88,6 @@
 		.io_reg = io,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
 		.drv_bit = 0,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-x1e80100.c b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
index bb36f40b19fa..a9fe75fc45e5 100644
--- a/drivers/pinctrl/qcom/pinctrl-x1e80100.c
+++ b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
@@ -33,7 +33,6 @@
 		.io_reg = 0x4 + REG_SIZE * id,		\
 		.intr_cfg_reg = 0x8 + REG_SIZE * id,		\
 		.intr_status_reg = 0xc + REG_SIZE * id,	\
-		.intr_target_reg = 0x8 + REG_SIZE * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
@@ -62,7 +61,6 @@
 		.io_reg = 0,				\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
@@ -87,7 +85,6 @@
 		.io_reg = offset + 0x4,			\
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
 		.drv_bit = 0,				\
-- 
2.53.0


