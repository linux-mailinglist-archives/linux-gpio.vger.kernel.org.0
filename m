Return-Path: <linux-gpio+bounces-31519-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGjIDr5ciWlY7gQAu9opvQ
	(envelope-from <linux-gpio+bounces-31519-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Feb 2026 05:04:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B7F10B7FE
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Feb 2026 05:04:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A1CF3005D24
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Feb 2026 04:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2858123D7CE;
	Mon,  9 Feb 2026 04:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NNLEUi3M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XtBdHtt/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BB21CEADB
	for <linux-gpio@vger.kernel.org>; Mon,  9 Feb 2026 04:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770609849; cv=none; b=rx6YnT92gC45Dxp/NMk5tsedQs9QUbhQben8V3L5GgLsmT0jEe4qHkpY23scTfhCrbQaiLgndgdaNSMhinKzarF2NbQ/dgZCWaDQ2yiNtg9bMYlrIB+gg0CBmyEdwJ4h3elT8veF1akFpBUbLAxs/Se3yazFiTvc0JLJnvWnG2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770609849; c=relaxed/simple;
	bh=S8P8GRl4vzx2iQm31lys8wN0JTN5FQOi60Q20yLqfbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ewW4KVTCfvFWjBHdPRkHh+23yTiEMG+y7GY1gJhWEPl5PJrbiNgEUk7JabqYrlq4+jjxK3f7FLwnMZgehxkzFGJmi15Y58zpzjrGXYIdh6ljeoGJQWox6HgwuJ9TEMh7U2N2u8k5lSovV/fXUJ9atmEueyuSXEHRbofoFaS93HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NNLEUi3M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XtBdHtt/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618AiTnR487927
	for <linux-gpio@vger.kernel.org>; Mon, 9 Feb 2026 04:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=y8tsalU24isrNEjsLLCx+X
	AoZSHueatt6o40Tkkj0uU=; b=NNLEUi3MlCma3VylHUdIld6fT7Vm+WmC2H6grg
	WsjaaEiTsccuoZ1KqSDhp20zakYHv4uKQ19K6r1TMyZ8fq5Kv9yqYCIki1nUA64o
	ZeAIS/eCQFVogz5ZuX6mD/UuW8iDVHiHWTMIvZ/CcHGkovpFdhZgl1n2kXNMFxBG
	Mr7x713k8aO38iv3bxSYTIG8icok2cgnKeL4CGO/rOlQtnATnzClJz0KWElFUyQ0
	wZMU7NgyQwvCnvz/YG9x3Ye8UwD6nqcXKcA8TxIdHSsda5Q9Eig8/LCFaatnM3zT
	tLV+xokRrmpIzcslHC64cHlOQBPYhnV+KjFGQ22PDwb8hW6g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xamukew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 09 Feb 2026 04:04:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aaf0dbd073so6905415ad.3
        for <linux-gpio@vger.kernel.org>; Sun, 08 Feb 2026 20:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770609847; x=1771214647; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y8tsalU24isrNEjsLLCx+XAoZSHueatt6o40Tkkj0uU=;
        b=XtBdHtt/8b7jxGlSK1BJjfbDKUdNheSqLUw8/B5BWrGQzTZS5EEjbgkRILCXDd7K1N
         QxYZ2Z0qOBD6xOviWEjj1Jw/wNfEc1JB64i3t39JPDxCjnE7U6s5INnf6JwpKIimVXmO
         6/R6u+fUn8SLI/RizUSh7zPvLhk2WToRf6VIYB3JTQikucaRNWCec2yYDWb++Vd9Qtq1
         EEMjG9VUKXXV5e9VpVERrGCMeoa6AKZmyqvSptRdFncBywyTzns7HxOxhUzcar07lqtA
         GkGOYmyj/2qZo52xBTxGc8Bgs2KE87DloMGJ2J07nUrEMu/Jm1AcHVnDza+glkGLs9Dx
         n4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770609847; x=1771214647;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8tsalU24isrNEjsLLCx+XAoZSHueatt6o40Tkkj0uU=;
        b=UIv8vaqEQ8seiuYYaxLfq50ZIvMo+tslA42Zg61w1+G4F2VJaA0eOnQ2Ts+TTftMvO
         KjwHRqM5PB9FjayVoqZgkj1TChBsjfGGjQ6SiOmmVRvbLQVrfePuVrCbkNTVe0Zc+eYu
         8mxvpysv/Q6zGICwb0ESKe71pvql31MZJfPprgIUFv8Ei1h29fmR53U1Rt+49GJr3k5f
         R8oRnqobTXNuvKtx8vRHHTIXDJ9QWu3Bcy8n3abpvVH4K0T90WP3gxkX0o+vUjoI4hxv
         pxMsAOW77p9TVqL+ZOh+WlKBRYQejTlKSZrUzDuDGMtYlzE3p3eipgFKtbRhyNmHgq8P
         5IQQ==
X-Forwarded-Encrypted: i=1; AJvYcCULf5BciUrIJXcBW8KtByxEZWqKVNqEYgqznQbOg8lnH6RKaphi434nYdUorwAup8xZg0tRoarfD1fc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8soFJrOD6z+voKBEGqteEGf9ynLCZb/QmDrDYV6plo2CzDaL3
	1mXCqj20htrJimym/jHHzl9kqfdcRgwNikhnSUHXSRrtlVHWfjVtk9BMQiXxArjHpS5GEgT3yvI
	XDanj+iTqMeqcshyPd8r8TM+qK2I9dE61bM59/mMGNAipYR1RxmKCLsHMfJqC2dgD
X-Gm-Gg: AZuq6aKm/oZUgqn01Jn+9Dh0ss/+z3JFiix6h/m6DaDdotl/SjqwSz8yrSxSFY/oLkq
	dgXK1eSUfawQBBtlCVOwgRkGgER7a7JbE0fDOcmw3QI6f69YlArB0yPEJaKZiwnPGCq+c28PxYh
	L4nb4saHj9ieqIx7SN87aUYNa8bwxwHz6ynm0WBVcaSo652YdCFw7sKZpGPkzLvKXNpQHhMui9Y
	rSNdYtrtP+eq2EMSv0ECJaf6mhAcIq6qixiq8Jqiymv6Z30byXZtGlGjcg5WUgRpfEAv1fpwhcb
	z5kLJBUzVHigcltFyCv/zVuYc/7+xd6Th7jxwapV4Yk1Hga8jCROCmWe8Bx15+SaI4hSCEpZjNK
	hh1utd7+NMIiwWEGGT8SpSVoV8wBBhKE0LK+/iQ==
X-Received: by 2002:a05:6a20:56a3:b0:35d:b5a1:a61d with SMTP id adf61e73a8af0-393ad0028b1mr9997610637.26.1770609847423;
        Sun, 08 Feb 2026 20:04:07 -0800 (PST)
X-Received: by 2002:a05:6a20:56a3:b0:35d:b5a1:a61d with SMTP id adf61e73a8af0-393ad0028b1mr9997590637.26.1770609846926;
        Sun, 08 Feb 2026 20:04:06 -0800 (PST)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb61e4a1sm7456041a12.27.2026.02.08.20.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 20:04:06 -0800 (PST)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 09:33:44 +0530
Subject: [PATCH v2] pinctrl: qcom: qcs615: Add missing dual edge GPIO IRQ
 errata flag
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-qcs615_gpio-v2-1-ff15114d837a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJ9ciWkC/22MywqDMBBFf0Vm3UgebUK68j+KFBOjDlSjmVZax
 H9v6rqbC+fCORtQSBgIrsUGKaxIGKcM8lSAH5qpDwzbzCC51FxywxZPWlzu/YyRGWe0t+dOWyk
 gG3MKHb6P2q3OPCA9Y/oc8VX83v+dVTDBlFNWqka51tkqEpXLq3n4OI5lHqj3ff8CezL75K0AA
 AA=
X-Change-ID: 20260207-qcs615_gpio-7b76c94f6921
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770609843; l=1368;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=S8P8GRl4vzx2iQm31lys8wN0JTN5FQOi60Q20yLqfbw=;
 b=UISo3Fs8z34g5h2Pl0rwOIoilDPhLSgOjE0PCOMfnwsj6wpgg4l3gLnGcHFTtG2VK7EKAPga+
 WzNYWpflnTpBXlji5GknJaxk/9cD5/HMSwBWE8l47abPtmrLrhF84aH
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: 2HcvV-464pMVHrVnJEl_veX9QmNORheF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDAzMCBTYWx0ZWRfX5BVBVk2Cwxvd
 f74KykQ1XaaZBSwvrX5jKwstpBK3sAsFWXYleDxJOpMFE1pUwu+HbnoXvjwcsoQtzgr5/V1C3No
 cWct0GAuou8aRAm2fsrbNt7ostYBllCRnxkBCUPobOH+1oA/AqL87HB88L/K6aPj2FTRXFbDeaJ
 uBM4eDIEUidtL9c+UjN3aKBE8ZqZnzbCm7RZHobMoJjlhrxyM5UoTX7Cx7yh//gIJ0AxtWdRaPZ
 c2235jjAEBl6UNU3+MsfRlU66D6XDkJfR7nu2yQZ8euwMpIGaFJfxf+T/tY54CKz2jUx97Ll1kD
 SSSaL8FZG+tZerf2eXtBeymFpYqFahu5ShKFzjDS0LGFy8TdBm4qLswlX7Y6pj2gmNJ9HGQTVe6
 aZcXI0KtmfWgRnfYx/ULQGSDYMHxjYvFNCX7TSfgIAXjrnjqm0zJkEdYCw51kZhYVWmgrBh3QUF
 0mRLnaxEDyQ0qTUIyqA==
X-Proofpoint-ORIG-GUID: 2HcvV-464pMVHrVnJEl_veX9QmNORheF
X-Authority-Analysis: v=2.4 cv=Or1CCi/t c=1 sm=1 tr=0 ts=69895cb8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZsY2b3GV9AaLsb3Qm6IA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090030
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31519-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D7B7F10B7FE
X-Rspamd-Action: no action

Wakeup capable GPIOs uses PDC as parent IRQ chip and PDC on qcs615 do not
support dual edge IRQs. Add missing wakeirq_dual_edge_errata configuration
to enable workaround for dual edge GPIO IRQs.

Fixes: b698f36a9d40 ("pinctrl: qcom: add the tlmm driver for QCS615 platform")
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
Changes in v2:
- Update commit message to reflect HW do not support dual edge.
- Link to v1: https://lore.kernel.org/r/20260207-qcs615_gpio-v1-1-3b3923a3bdb9@oss.qualcomm.com
---
 drivers/pinctrl/qcom/pinctrl-qcs615.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcs615.c b/drivers/pinctrl/qcom/pinctrl-qcs615.c
index 4dfa820d4e77ce8157a3503ee8ec6e426b54e030..f1c827ddbfbfa59d03ddea560eca36ffa997aa8d 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs615.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs615.c
@@ -1067,6 +1067,7 @@ static const struct msm_pinctrl_soc_data qcs615_tlmm = {
 	.ntiles = ARRAY_SIZE(qcs615_tiles),
 	.wakeirq_map = qcs615_pdc_map,
 	.nwakeirq_map = ARRAY_SIZE(qcs615_pdc_map),
+	.wakeirq_dual_edge_errata = true,
 };
 
 static const struct of_device_id qcs615_tlmm_of_match[] = {

---
base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
change-id: 20260207-qcs615_gpio-7b76c94f6921

Best regards,
-- 
Maulik Shah <maulik.shah@oss.qualcomm.com>


