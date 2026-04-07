Return-Path: <linux-gpio+bounces-34796-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0L/tBNP91GnOzQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34796-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:51:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 824313AEA86
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 757F530088A8
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 12:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EDCC3B4EAB;
	Tue,  7 Apr 2026 12:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oa4LhJpT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q4SlimyE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A7C3B388B
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566288; cv=none; b=pPFXKTQZFjadNFHOKLFWzfEWELPkfDUIRBa+bzG9PYvhmNy5RzdVbGcS8fd1tXcOJ8IgWjN+sZi1yJXolGpDDJ8DQG7rMSZcOrLi5JezUO0MQkkPD7eiQ0AXWpbcezXsAZrN6Bm5pOSnyAfeXUCQf166Bo1+WCuyJsQ/TDIdvcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566288; c=relaxed/simple;
	bh=dSTWhOmuRV9flaZmvs9eCfy73fzuWZGOREvzXPRKFyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=flQ15hxg3Ma5iZqNSkGY8aZZyos+7jcXfaBy8jj0Lj2M+l8mvRI7x2w3jMrVdM+20pML/w7MNQ2zfWH1CuflTTajlBT3y3Rjati+VlY6B4DwVQ8FrBwU3fuyvxoIQbbkYQa8nszpsyWW0j6PC3Do1mA5pVBum6MBcU6PMwBARyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oa4LhJpT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q4SlimyE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376dw2s2328763
	for <linux-gpio@vger.kernel.org>; Tue, 7 Apr 2026 12:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XmSwynWJpYNAehyKgQbzVoEH//lgSM42SZ5pe60YH08=; b=oa4LhJpTJLNH8pa3
	8GVqOx/Tw0YD2HFtS1RgcwZoXt8tNNuSOvCr6JPqzprredjGuMsYidl8b1Fd2KNH
	enTUdRPU4rydXMfVRZVFweSjRK7cu7OvEoCQcLpsHyAMmDxuz5oE7hjDR+WBfQil
	ucnYo+N6NnA3q4OW+C6MxswBusRnnW9x5J0c2Q8S16z6DDo2/+2/UFdOEKosvc6b
	rw4ej34s63IAIWAvRh45QvuzEZiLonXHTTF8EbK5vBF+3U605c4Yv5E1axv8ftdY
	b47PnZciac3dcDonnS6Hsnloz4zZlDfTU/8Gx8vB1W2ndsG1MiGozgAjGysSbwRD
	FJOThQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4trbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 12:51:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b802961ecso63835511cf.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 05:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775566285; x=1776171085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XmSwynWJpYNAehyKgQbzVoEH//lgSM42SZ5pe60YH08=;
        b=Q4SlimyEKjyEIYF2ntjS3hMTUn33unfAZAryJo2yEb1Cj79VvVGE/TNjxgcT4fD0Q9
         N3eaM0Q41Q/ApwqnUzmwkdKl2Cxs7SsLWKaPVQ8G2CzOwkpgXCCQhAgiYUwed6AtJezE
         1NpSjOwRwnUqtNQRs0Nn1DzcBfHO5PdvURxMszDv0U4jpW+gdEqhn8jqqwby8MWQpzjV
         ykj2eMimbiyDBfmrr+XsR26PkKPTrl35LLAD3NaYb2J+A0btZZ+yJ+irWK29/X+Botyp
         pnVjpjXLrO6SOT4VnnWjImJHtQj2NmHV/frAwL0Gn2K5tZt7EyhFetIzT2XsnPvsL0NE
         hFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775566285; x=1776171085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XmSwynWJpYNAehyKgQbzVoEH//lgSM42SZ5pe60YH08=;
        b=E8XBnhYR7HNUu3jdknnqN9ZvLkfb0+S991AIvh3EGZAfmblpz+i3s2I+oT9CJT62Hz
         FYrYrPzGNA5M1BR9gPaA82uAaGisYvDI0WEBu7ggxvUwddOJDYWv0pkrtyJ3wfAdGrDD
         2vGaKKM8zwBR0Hy6VMccZqNA+AzUP+AMXKVYasGXzBx7asaBvHOKdd29AWvW+gSc+f8I
         pLGTLzRUF5I3OluAw9TjnmpOiSukr9O6QAyQsu7n8K2hvhjWOpw65nEX3B2PrZ2QyUaU
         JTgaFI/4EDrQgYIJZEbUW+oshUxwc6av84TAtia3wEknlR88ipN+rJXBLOwp0EkTRUrI
         qj5g==
X-Gm-Message-State: AOJu0YwtedEEC7JqCKUxm4cRrDMa3JeY+gpU/1NmMCv5AMWwZpk0HLEC
	zYr8sij/N349aM9wUhW4uegurA3u7AgDSs0HlwbU36TSgxND/nyI1VGi8Kepq8X8zJKAMn0fcXb
	Zs+ML7jyjxaK9XwedeaVnx3jofVWw5/qX9aArA6FeSw5iGlCdJSD3JMLYZDKBXFk/
X-Gm-Gg: AeBDieuZqo604ZQGne4CMtaTOUimsiuhnmQKcYn1IT0vHC5YjawTBVjWT9i+Uokc1V8
	Z3PnRoJhpRC/KD1FNoaXohxZBkOMMJKmFhWtnmh+tNHPtBmlNF2oW4NIe9HFXCkIJBkeLLCvc2i
	c1A88DNvcfSHSjHlsI+Zt39ockAGjX/KcquA63cRdKMHi6vWlpFUZcrAwPY/xcc9W0JsA6yUq4u
	mNBv581UpT5USWMW9HcMlqIGhXEDITEYpmZaMXylLG3EFPhWa/eZ635CGYLzvlcMKqES5ecZcJG
	KCwMcxJzOZGUD/J+UvqMxZGqNoqxM7rvDCkM2Oy5JebjEkcK6lm8XaXxkg43A66/fzt7fPAbBQE
	qw/7sSzEtKDfGr4CeODXPOnEbpZx7mCETEZ0tFNBRApOhVXPeEFM=
X-Received: by 2002:a05:622a:138d:b0:50d:a5d5:212f with SMTP id d75a77b69052e-50da5d529d6mr23504451cf.26.1775566285301;
        Tue, 07 Apr 2026 05:51:25 -0700 (PDT)
X-Received: by 2002:a05:622a:138d:b0:50d:a5d5:212f with SMTP id d75a77b69052e-50da5d529d6mr23503971cf.26.1775566284894;
        Tue, 07 Apr 2026 05:51:24 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:b36f:5370:5f91:2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83682fsm577526505e9.7.2026.04.07.05.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:51:24 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 14:50:00 +0200
Subject: [PATCH libgpiod 09/14] tools: gpionotify: fix memory leak on every
 event read
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-treewide-fixes-v1-9-66c9744a56a3@oss.qualcomm.com>
References: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
In-Reply-To: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Kent Gibson <warthog618@gmail.com>, 4fqr <4fqr@proton.me>,
        Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1035;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dSTWhOmuRV9flaZmvs9eCfy73fzuWZGOREvzXPRKFyI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp1P27mQsp6izpuPZo1CSysfZ2YigSH3DHzBTGj
 xxu/knqbIqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCadT9uwAKCRAFnS7L/zaE
 wzWAEACTMg+OEuDUTzZDhXgcDr0EClXTUvHyVhHPE4sIZFx21F0WzqW8d+c1o1S8TcoYdtca2Oj
 YUv9Gn/LwMjRpVsjk3Cjh1QzaEF7D4gs2NCU50CQsL0BQd8z7WMG/2eNOyyebvpAhiFEVPloABF
 LJzSjlFTLQ4vVlXi6tHo5Jkx5guitDLn5sAafjXWKUwTgFxZ1OORD/FQaxX8qznX4Kcer09mMyG
 iwwlLYSwhM/NNwgMFWkLdU5qR2a85aTV1ardT1P7Q2xjqPeVW7+alA/SNR69V5iN9dHRJ120Iw5
 UtGLABnTNiQEWnSy94TIKAbot/qbp/iKShy8w0keV1A+2hBV3wnG0ii9imcguhaYlPAjPlI60B8
 jGOXUcjQgACWaJuwALeHnXjKvw/lfa2tT5vZhVJYxSL60vvzYoBD+qC/Bm6rCjiwtV2TJqAQmn6
 klLx9JvwtvuHGVjOrL/rLzzRjkMg1ZCI8kNWcftLRhHykB1CSIQb6H0siGhFko0gXy3b1i/4sIa
 YH4olZU0bnmc+zgqi+Hx8qdJJoY/sTyUiz8yDoA0szNMYSdewLPsncblOgu/iJhavPcaNmLlYI4
 9GzfwFstIz/pCdKS9kVEB8WH7u3fHM5EhTsKbIubgwkOplWj6gKeu8I6+anvz/50POtcFTQ9TYL
 YCU26RJ42MpBjKA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMCBTYWx0ZWRfX+WS87yJh+1Do
 kCy4oMYhA3u4KqkJXkbt+nfMkDtTZrnh4pIOdJd3r6P1yANBwokgVigfL+J3jEXpq5sVpmJeMxe
 eSJi7rSfCgtV2rJMnUUWBBiDQFmYHkkrq1Z/GnZYRnrmhJNaBtyjA4rXpprtLx/RlLJRvCQIAvJ
 kZazLnVZV/NmVTDs6MAHzj0tM/cDUO8g/DKUGpl8rKjMjo1a/PeGWF1BTEOgAqAYtqK1iPfzJWL
 E0Cw1Avq59SzkqmNOvWEu515qKJgTj/UrrO09jt9syiBtQrkpSlZ/ED71r14MMMFvbw4SMt0VyB
 dxRwN/mtwfu/ak6L3yrOMeR0QV9c6dlL59F0q8km/bgNrk8wiKTaK40+o01BSA4Or9Lks/YMNZe
 2W3qiGQS/JaEKgeZEei4tHUPz0tlmRwG1AF/OaR6h7W/NdZSilbICb+MA8WVFIJmMSMIfpJfDcl
 el5rJ3LpQS2nMjNC0ww==
X-Proofpoint-ORIG-GUID: vBXvFhnbH8Er3rZ-PSCrnTiY1vY0vqVu
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d4fdce cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=pWWi9S6lJXXfAGg3oU8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: vBXvFhnbH8Er3rZ-PSCrnTiY1vY0vqVu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070120
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-34796-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,proton.me:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,proton.me,xes-inc.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 824313AEA86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Event objects created by gpiod_info_event_get_event_type() are never
freed making gpionotify's memory usage balloon indefinitely. Add missing
calls to gpiod_info_event_free().

Fixes: 5f194b001ae6 ("tools: add gpionotify")
Reported-by: 4fqr <4fqr@proton.me>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 tools/gpionotify.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/gpionotify.c b/tools/gpionotify.c
index e74ca9631db055fe697c2d803b33c4328e5c67f2..b8759573db711e4cf449c8ccc9f43d2b4c7785ae 100644
--- a/tools/gpionotify.c
+++ b/tools/gpionotify.c
@@ -447,11 +447,14 @@ int main(int argc, char **argv)
 
 			if (cfg.event_type) {
 				evtype = gpiod_info_event_get_event_type(event);
-				if (evtype != cfg.event_type)
+				if (evtype != cfg.event_type) {
+					gpiod_info_event_free(event);
 					continue;
+				}
 			}
 
 			event_print(event, resolver, i, &cfg);
+			gpiod_info_event_free(event);
 
 			events_done++;
 

-- 
2.47.3


