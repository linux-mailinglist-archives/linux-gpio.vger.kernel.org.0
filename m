Return-Path: <linux-gpio+bounces-31497-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPcYBN7qhmmCRwQAu9opvQ
	(envelope-from <linux-gpio+bounces-31497-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Feb 2026 08:33:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A7F105221
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Feb 2026 08:33:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E97B630071D6
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Feb 2026 07:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0592FD69A;
	Sat,  7 Feb 2026 07:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iIWLBI/W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ReB1dKBt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED819254AFF
	for <linux-gpio@vger.kernel.org>; Sat,  7 Feb 2026 07:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770449624; cv=none; b=HFBc9e+6+rR5+fKVUDzYBwjIzlAVPSbfYcr/WXgyJ2iGVk+Feua6yJw/FbRq6qKHHLlnHecAqP7jwRdcs5b3SCoHOhVb3R1Al3MEX817W3lEBFrOyU3AHKv30/YBQN/HK/tvK3lGcOHJzWRm2XfQdZQ1uOjLmmrLIW9JaDKnLHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770449624; c=relaxed/simple;
	bh=L6b7srp2zfdvGfLWrsOwUX96UiMx8N/BzUd2H4tkeYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ii+zEvvvDxU9Pg21OocaP1mYivEYABHLhXd0rvhTWZwYaZVJh3Cwqz6fpk/Xu2BxzfI0eXCuZ6rRx0NZwlEAKwxeEXpDpvvwDoOEg8CuU89pFXm/lezxh9uCibPG/b/oJ6Q5XLTPIfSaoD1kmfVKCMSYQfLAjNO8xvoFYLlqFPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iIWLBI/W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ReB1dKBt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6174NAZ71117443
	for <linux-gpio@vger.kernel.org>; Sat, 7 Feb 2026 07:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q/AtsU7lehUZW1o16Af+9C
	YsTOIOZGH9FN97uHMyINg=; b=iIWLBI/Wdt+tpFkfDBOBtetH+eVeONCb7IKmS9
	B2kvkkrW8osNNdG968o4NlUXvb023/0gHxyEvQbpr0T4wQjWoAGs+MxBfEK0cZkW
	N01EZN1JgvX3EsAIOdJcqTOKJ7YPLweIF0AFry6RnaFNF8GKTWz1ucBhHRlIwq6l
	n7KIgY4scIwGYCWMR7fmwcD50OOfZwrqMvK22zIZ62y2o6BmBFOJbwQEdg5EhObu
	fdDVeQmiR+TSQTSb5rBlHLMBb4nnbCwzgY7WxBqG2Ja1sO+dywPQCGaxgSvaVhxT
	s0ByNJrMe+cfNz4aRQjF+ncz2+kaUEj1N3HUZBNhi90QtWHw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xamr8um-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 07 Feb 2026 07:33:42 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c337cde7e40so1787564a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Feb 2026 23:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770449622; x=1771054422; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/AtsU7lehUZW1o16Af+9CYsTOIOZGH9FN97uHMyINg=;
        b=ReB1dKBtT2BiU5OvY3wMQtL4i7ksDPc2s5cYRhQMaTEeZ5Lx4Ls3bHBOvz+QOmnbxt
         NUCfCtNjnV+VGiDFJ8OzhYyWZmTia4Oy9aTMBKqkfrCFt+wvgsBLqQzYmMyHG1M0dQbJ
         r6OGxKJtCM5s9E71apU3130u9uTM08AYXMo5pkxjjopxxECdq0UEhjoMpYdVfNn51ek3
         8NTPsAahcGvH7ntRkj3PpMe9a1tgxiON6A6fd+oDBrPoF9icT7+symJAIHLaBh5mhf8A
         S45kHJwGVL/QEIOswXdKd+nuRMOCpEp7M7aIgrZ4ApmJD+adEBGqifKClCszpRrpAuVn
         mUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770449622; x=1771054422;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/AtsU7lehUZW1o16Af+9CYsTOIOZGH9FN97uHMyINg=;
        b=XFXMPYSTEabqdVwChSCb3XMl0t5GuVZ2+e3x95QHVOYRzuuFCTZce25ERpvbJrQIDb
         hwnQojLT8gMPz/+1HENSJUHa0rixj+EookhE6lmW8wZkb1hxw6VnkvGtTtMWFhQ5/Dvf
         9b7N+nI/opM7SiKu18lXHDSmVLV9WfmK7iLblK2I71EDefIn3IaIcjNU8bVlV6ETA27W
         zwJB0ggA6s0XGLrGKzsdOqTyByAybnp1oLIfgPb3deGrDdgkWakmqboAAm34XIbIULpv
         8+W7ptGp/NDZ/SQikv4YixxH9CuhDm1sWW9oWp6X0cXVUQ3B808XOIM9ohtwRlEWj8dY
         XVaA==
X-Forwarded-Encrypted: i=1; AJvYcCXSV9UjSyMyg+9+fHHOJmCfXzcZ0Pu+XXcfvmcTZ4PH9snYrqlt8Hg/DrlRm60bS/6VWgyEkmzRKu1Q@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr2H4yIoLXjcrEb/Iope7+KC8r/HQUajEQ6mBAnuueoTT7ZowG
	kGQvxqRf+cmBqvo4osxVY2VNLHI6jdBLgERi/ARolo1C6Ixb7N+tMiU0Xys8FyJGgHwq97AcUYz
	PU/Zqyf0R6JjCR8mChybPR3OOzMZA5+nMk3tyVTlM1SH0Ow5r5SjQa0liSXRjZy5v
X-Gm-Gg: AZuq6aIEgX/BB1xRRd0GEorWe/lElSoqQ7YVbYUvf3BuLGMz61wUaprX8jlzGGb0CbO
	9xatWXZ5C1NCfjjA38RhYLsGEbZOlOJ7JzVV1f7n27VjPLuX5jXVGbnyXVYxcfCSVIZUhQjXnSM
	oVdg/jpNlE3gGqiwdHpGM2X4j8nKxX1KxH/lk+dotS237bt7zmEPQ0gRzZ0dtnp0kh35w0zh4Ve
	V7xRKukkuFIwqH6U32PI2SkqbWNo9BnqHAAshn+172rJuExKAw57g4Cm8ZXmy/xezwFeoZloNVz
	khiVuxgDBHJ3Og5F26hYAyrqkHvTna75PvTkPEuV5DVOmczKKZrePmTd1sPm1KLZiIQ/xHY+6OI
	U6zCeMgfgYA3q65R7JftXMR04uNixyiaWCkJaMw==
X-Received: by 2002:a05:6a21:1805:b0:38d:f97a:6f1 with SMTP id adf61e73a8af0-393acfff543mr5981626637.27.1770449621756;
        Fri, 06 Feb 2026 23:33:41 -0800 (PST)
X-Received: by 2002:a05:6a21:1805:b0:38d:f97a:6f1 with SMTP id adf61e73a8af0-393acfff543mr5981602637.27.1770449621176;
        Fri, 06 Feb 2026 23:33:41 -0800 (PST)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6de0128b6esm766689a12.26.2026.02.06.23.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 23:33:40 -0800 (PST)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Sat, 07 Feb 2026 13:03:30 +0530
Subject: [PATCH] pinctrl: qcom: qcs615: Add missing dual edge GPIO IRQ
 errata flag
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260207-qcs615_gpio-v1-1-3b3923a3bdb9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMnqhmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIwNz3cLkYjND0/j0gsx8XfMkc7NkS5M0M0sjQyWgjoKi1LTMCrBp0bG
 1tQDZuh8qXQAAAA==
X-Change-ID: 20260207-qcs615_gpio-7b76c94f6921
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770449618; l=1117;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=L6b7srp2zfdvGfLWrsOwUX96UiMx8N/BzUd2H4tkeYM=;
 b=QS92xaR+LDhwEr190hWxz43YktBizBunQsRpzRG+0C8MWiLKL3TqbgohfthbWYO1u02tnVmwx
 UGFnerSLjuUCKRnHX+aj0lyGvsI78o4b/Y6K+DFBspPr5YHdar6b6si
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: 73B_qh1lmTQAJDq4mqpbcDp8Y0z0ZX0g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA3MDA1NyBTYWx0ZWRfX6a8zu+HCq0Y/
 3gC5Ni04dT7E/ltNrj8nOtiG2XEZ3zJKQ2m6E9FF2YoXpLyo6v/poY8u5mURu9qUe1NVYgiBlMd
 InH1K/gGzyJ1jxxy2D2mN8kYgfUNl8vj9nNAqebbzM5qJHtGJk4WvBBmOTmsiG0dUWHUUyx8ezc
 4iCo68QN/U/EStQQUGn2ewbImdmOumjvy8Epg5s7A0YkhVMrFQURTry1ZeOmHuhSy88EWOuoY8b
 G6Lpaz28KiLORpRWrXMfGovIBkDsSRlbvL0ybHCQJnwT62NOG2FIievyve5MiZWfQoBuZShtrGR
 C59etaanJ5cpozA6MU5dlfzIHlUHCT+8IZ+8LwZ695XeSFkJv0brNeLbUNJNsplO8NNAD8/1AV5
 GcwUD4w6rXTDNcoN5C5d63Ybm3H/OTbfwbKZbpahaFCnMqjKWKKyvCRojEs09HjTsPdcSp6OAO9
 5Quoun71uZbKS38k3Sw==
X-Proofpoint-ORIG-GUID: 73B_qh1lmTQAJDq4mqpbcDp8Y0z0ZX0g
X-Authority-Analysis: v=2.4 cv=Or1CCi/t c=1 sm=1 tr=0 ts=6986ead6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=TuXGLObN7G-QNExUmHoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1011 suspectscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602070057
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31497-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 97A7F105221
X-Rspamd-Action: no action

Configuring GPIO IRQ as dual edge breaks as the wakeirq_dual_edge_errata is
not set. Add missing wakeirq_dual_edge_errata flag.

Fixes: b698f36a9d40 ("pinctrl: qcom: add the tlmm driver for QCS615 platform")
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
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


