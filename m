Return-Path: <linux-gpio+bounces-34430-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YC/yCmxzymnG8gUAu9opvQ
	(envelope-from <linux-gpio+bounces-34430-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 14:58:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A9335B807
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 14:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FBD43014545
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 12:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE8B3D1CBB;
	Mon, 30 Mar 2026 12:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HF9dji1y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9yL3FxG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687673CB2E5
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 12:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774875031; cv=none; b=dOVI3Z5SfmXavT4wJj8vX7PY6lrM/3JpwEUIzREiHHTIi38JC/Ye7NiGxOD0omRaXk0yqhprcdXfUz6f5i+/ivCmOyLuvOU650vfagHT5ycQr0NG/NpBRTnqFDVtbO5OJozpDk7q0ZrK03o1oO+/vZ/yalbasCcsCUxwa1TYhCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774875031; c=relaxed/simple;
	bh=6ukMGi1dOM7H1RJIO1+XFMmMGOmdvskGm+mtHi25/Jo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HsWoshLJS/It2HkJ55rggoVDJmxSPF2/GB9zVgtegNyGH3LgZCl3r23GcZy8axhi94YhSAyNe9J4VmNWDcLQUGKgoaxk/nnojAWP3cYEGgfaTN1efKhwOuJxAj0c7KceBq2u0NoK6zAMu6eqMyDaCGN8dFQlvS8HU7Drv9+8ATA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HF9dji1y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9yL3FxG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U8Px032458333
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 12:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PpZADUCB4OQy/TYu3TcgZ3NGqxxQ/snhg+D
	t8VRDEQg=; b=HF9dji1yTmWV05nvbSpXqr+2ORGoqv8TLzeCs1362xjCGbqrDea
	CCkxZgger78mXexeI7a4qfoO0QMUJRKltJpKPyQDLVOpLgzuVvsms49escc+S++S
	/ihxD1IHe/FiU+ZbYoRvlCU4pXwP6u7mLHFu6nk7MsdhiYCyccek+JGYVbvBegpI
	oIAdaV8pw9+BTBVovHRKMsi0nd5WWVwBab/Y1cnSh3WthCfuaC8uxYzmZjaww+fZ
	gEhhFHpDXXtIZlpHFtyTz0V6t3TVkBrc0jPvN8NePXE9mrUfl7+WdDAo0dl2KNz8
	MaTSE9w9856u74X5TfI21xA505di+aTkCEw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7nnms45y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 12:50:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b802961ecso54893851cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 05:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774875029; x=1775479829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PpZADUCB4OQy/TYu3TcgZ3NGqxxQ/snhg+Dt8VRDEQg=;
        b=B9yL3FxGTiSR/qAV9tqwdMIZt+QWf82ef0YQ4uaXSfX87kf616a3a2LZA2ZQUuCPlT
         AHSLVNbT4xnjmHo3jDGn1MJoatjK+kFKnPbIgv70qTZP3OCodjbOdraj0IjlHHFXe9J/
         +Vu5UzRNKqfDpmluJcsGf1MVHMm2HR6rZBmKjyvwQJr62dIsxeB69atU5xAY/b4QOCFL
         hHiJvIuvXfyA5nenF614+USfkBpuN40+IxmYD8Ub0rus/I5Y55NVU4jIYJ3ejereuNJN
         wGnoA3/HkGNgTD+s1ola5qfBIgZRqLcSXmymOacOXrwOUOl+uq1HiNZ6SPbLTLR4b/MV
         ueAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774875029; x=1775479829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpZADUCB4OQy/TYu3TcgZ3NGqxxQ/snhg+Dt8VRDEQg=;
        b=Pmc6/pUORQBnhfy+HS5zzHDhok1pZihqEaoVmnoGbo8oardnPsKqMvLGnvhOnvOOo4
         z0f22izT7iP9a32PLFjEhxePf9YWbPFSbP+KEiGhzRw1IawGak+FFt0jaPQFg/gE2u2o
         mOQ6R/m8qOQ8E0DjFGMbkX7QL6paSLpMZwgA5XG/4jDn6TSswl8InVfyzIVp615iBqD9
         iWuVyNkwmPYriT9rBbj9A5tyc1HB0bsLgsRwh8VYclqNgkrr1uB5IZT0UTRCTY9qSOqu
         6vVfLPW5G0ir1QpXWN4LLXypi+EkX8bGtcsCAt+erPwRYHhZvLMafsbcjb0NdlYWk17q
         /rtg==
X-Gm-Message-State: AOJu0YyZ2v2w3euV4aa776G/g9sIhz4DoAxrjuzIst43wNAUupS/kxR6
	nUaQa0YirgPwuc84wCNyIvZ0t+GTlSiGRWngx59MWMOVPmLDfA+IWXPMjgH79CkWolzDIFpwkqT
	gurJR+5kW4SsrHYN2SVTqQeFVZ06FBRCk45JzgxKYb9h4Si8wS9phBFDDuS2Ja21f
X-Gm-Gg: ATEYQzz9kaRr6Bzu5MrgYubYiCfArOV4g+aTfYyBsBKVLiTmMDTDKyGbHK8sFp2ZUyV
	zWp5DJiaw+7EGdgDr2yZwYXAaEeYgxUXWGivt+AxxftgL7eqFBcg+Tfp1ZuXq1ChO/yr542cdx2
	aWuKXMStXYL1NDC6IuZ2QjmtbExJ/2s3Ut1HBbObCvWmE0WwFSd1X3lVV1mN1ps3iqMs8IlWI5z
	iTCJpGYRA6NA2F0djKoOhLk5/WYZNNVfuIYVH45wGn7CoQQWDimjTO8qDBg2MbKJHjeQretvtnO
	x1PcF3WUwdSo9ZD1lpohchp+tPHqXnGxRpMtcUKKP/BteI8FqtZSkQ9CeC9y1KaF2JcgL9IRlmN
	DE3nAv9WYIsR5tOv13BrYDi8zF6XzXMkbkIqTxfgUoI8z713bj80=
X-Received: by 2002:ac8:7f48:0:b0:50b:48a6:6ba4 with SMTP id d75a77b69052e-50ba394aecdmr178427801cf.48.1774875028730;
        Mon, 30 Mar 2026 05:50:28 -0700 (PDT)
X-Received: by 2002:ac8:7f48:0:b0:50b:48a6:6ba4 with SMTP id d75a77b69052e-50ba394aecdmr178427311cf.48.1774875028138;
        Mon, 30 Mar 2026 05:50:28 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:e931:8d81:9955:76ef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2628sm20586509f8f.6.2026.03.30.05.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 05:50:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [libgpiod][PATCH] Revert "bindings: python: replace PyModule_AddObjectRef() with PyModule_AddObject()"
Date: Mon, 30 Mar 2026 14:50:23 +0200
Message-ID: <20260330125023.109789-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwMCBTYWx0ZWRfX6Fauc5d13EXe
 7b9UK0ONsuzd3ZWyna4Vnks5HT6vck8Qig7MeKHtbCeathDsUzW2TgMF4d6uwmJboZFBl5qQFGI
 2S6RfUYQ8ty2U0Y5yHtx/bVzJxmhZGMgDi31mITI1zHP9ak91mU/ZZP0nNmR/JVU1XmaYKXX99N
 5GSmidftm3xJdDD9UyMZZ34Aa9dV8Fp9w8tuI8e/vV1MFVSL7z2eUZvwoM7Stey4kQs9MDaWQfO
 yGlvRrZ84Pz7VqVTJ34iZlIsuUZi889kQ6hyJ0TkpXe9GzZeQrF/ib6Wkmb06cNMQVL/Q4pcIyP
 aPRbXDdvlhQfLeWmre4o3jM/G1dTsTmrhpiSSevZMtU0s9wbxo0b/625wwcLkyvzD3D2KgNRkH4
 g+UykCgRnWcMo6VDi2tleEDTSRf8YG9dqIYxmxBdGeApYncfdOVn+kLi9eDMebjgMP//m+flh7C
 92oj4rDe/YUrt4Jazeg==
X-Authority-Analysis: v=2.4 cv=M4FA6iws c=1 sm=1 tr=0 ts=69ca7195 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=Sh2bVfM5TGQ-TsvmeNwA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: QFYlD5kjnHHR4TsiHmApxV3B-h5GORd8
X-Proofpoint-ORIG-GUID: QFYlD5kjnHHR4TsiHmApxV3B-h5GORd8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300100
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34430-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 85A9335B807
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This reverts commit b436d05809b17ed734d08a36a8913eb687506433.

Commit 950ff3d1b300 ("bindings: python: drop python 3.9 support")
removed support for python v3.9 and with v3.10 now being the minimum
required version, we're now free to use PyModule_AddObjectRef().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 bindings/python/gpiod/ext/module.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bindings/python/gpiod/ext/module.c b/bindings/python/gpiod/ext/module.c
index b456190..25c252a 100644
--- a/bindings/python/gpiod/ext/module.c
+++ b/bindings/python/gpiod/ext/module.c
@@ -178,9 +178,9 @@ PyMODINIT_FUNC PyInit__ext(void)
 		return NULL;
 	}
 
-	ret = PyModule_AddObject(module, "__all__", all);
+	ret = PyModule_AddObjectRef(module, "__all__", all);
+	Py_DECREF(all);
 	if (ret) {
-		Py_DECREF(all);
 		Py_DECREF(module);
 		return NULL;
 	}
-- 
2.47.3


