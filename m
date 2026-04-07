Return-Path: <linux-gpio+bounces-34798-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uP6MFtb91GnOzQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34798-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:51:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 149AA3AEA97
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CE9C300B870
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 12:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B153B4EAD;
	Tue,  7 Apr 2026 12:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IGBkvgfk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I6BYMF8W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7503B52E4
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566290; cv=none; b=NSdnp+I7n9aJ73MxuptCBPdfBFyFxJJjyzIHwjmJu34P5gS7YoqP+HSbe9oCZeIDGrqgHxNsOXRFypkce/XTGzSk/6z2IxaFxHF7RLgFnacpTSHxskkPdxP9G7AxPuqx2S4SEx7TwMkkXdYLD8P3D2grc9bfzgl2KrfnquGO9fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566290; c=relaxed/simple;
	bh=rwTQZp247DVkPKRKLHBvS4N6o3/RPzgQb8+VJxVx0gs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kkAtXprefr4hcPVctuoZIH6lO49LFe1pcjyt+Ok3K3r1rL2KggaeMqg5KRmeRCWiRZDFPskB+EVI36ZSnpO3wDxoisuaIS85rZ6pP6i9WjgTTi3IojSKUJ6+lyycnsZDlpG8yHa9+QD4fuE38njW+6ULlHoMSwB7k7Eq3bKZTU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IGBkvgfk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I6BYMF8W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637BbFs71584596
	for <linux-gpio@vger.kernel.org>; Tue, 7 Apr 2026 12:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jDuNYb+49nTmwlzK3so4m2TM+Sc38SCmwkRwAhnplxA=; b=IGBkvgfkwEnQ64AU
	v304pg1+jszidZmKdzGLMHXV2SqkHrcyVjIrjt7rEVyTAb7zG3Pbi3aQWq28SV4v
	pSicbp22hvCZZzXCvjmBdJnm1GyTOh56uUAJYjovQG4b5G5yTJitizCMn1TFDgOX
	+pMJltgC/Dkkf7tLZtiWBKr9yF0ZirmnelpqpL0hrYxjCHtB/2nqPc0wASClK6KH
	r4adKBgS0BuPE+MdTrFqf47IW2EA9kJv7QC1ufucQ3/bPEXsfB1VFW+zzRDuMwhF
	83PppdG7z++Lk5u0oK7NbNfOQWAV+eCz99Q8+vaZHATnLP6acmXxhs5W7HAZH61g
	futoFw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr9ts58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 12:51:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b44f7b7bbso149331581cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 05:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775566288; x=1776171088; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jDuNYb+49nTmwlzK3so4m2TM+Sc38SCmwkRwAhnplxA=;
        b=I6BYMF8WE4niOoDhe+JQV3xv56Fq0XbgXa9Y1vxP38DfIQcgr/P2HTuKKWcPoEzwIh
         NtVD2hs0wmMyf0bfX1Bq/KKvSTXjZd8Y7DkTFp8Wati+Zyvc2qCyE8SkRZjvvFS4Qynh
         YYwijNY84+5xXJypUzqmERLjPwbCGQulMF/qofHH+RdiSEH2rLugmiQGwsPx8qBM1EU1
         CWcTacGDbzcl4FwVanNkzgsLto96vmeG1gIFJvhHJBNUeG5nEaiZLFHQJw6osGPv1TZa
         GwSyPVOB8UNFExxdJ4nqRCswD9vDB/gudesazhoqIy5dwml+VjSiIdwU8FGGtkOLQfTN
         pk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775566288; x=1776171088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jDuNYb+49nTmwlzK3so4m2TM+Sc38SCmwkRwAhnplxA=;
        b=Az46pvV2fgFN2lDeLgtdlWQS2eJTmyu/alRGsnqMU8BPwcTPE44ytXEfgCuVIP3+3P
         tomkC6sUxkEj/Zr5/AAVL52ET8GdLjm6K1FRM64h6wf9/2CwMVHY3FcxbUuTHbMwod/j
         fqGOUJa8HhLE+h3pSn8orCBYBeWJEOUxDaHCTRG+O7ON2h6VtYGNhRl72lUfAyU5qa22
         ey+GWT6nQ3d3O3kb2juR8iZxUM7cvSKavQSpTItZ2xEz3g471LFrgN+xzFVE5aIYqbmJ
         SjIy5Zs1gNgQm3CCDe6dxeNV8HAAIAJaYDd6LY3/4QSqAmGd9Rj2GBtxq5I9TogNJGer
         rIZA==
X-Gm-Message-State: AOJu0Yy4HudDt1tiA5mmyuO3UE9twMuAcqif7QeHaV2h6CEzYuP+gUr1
	Zf9Hc61UhU+H9DHQWzbKtes/8E0+PwdRy6feJncgI2+C6EAtzWXID9E5Rem2/8rR5wFRnpLgsuo
	fEK+Qpml5GIP//d3VZToOswqCNqJyvvHdDw/tx/XAYxhmnfDBValv784RAXNUrY8F
X-Gm-Gg: AeBDiespPMvnik3FNrqOb7apVYYF/en1LhG3j/qu6bXIidWN7P3Hj/sQgDQvEhXN5ya
	SpAbdB7XFivWz9w8B3zC2XA1gnG/A+dwkTQz+SiZNhxBqcLlR/6BFFB3l3muGYqb8kuR2OZAHii
	ZqZSozevaoYKFxb8HcY2EaEW5AL1PORYjcxIZed5VVLDIVWTkjXS/FcwmfvL32stpCW9yqoeMRI
	4OBtFfUMIchKDqSp9aDCn1V775v9Gz7qrafsLtQh5bzyQTI6OLNmXTkxGXEPeQ0USamSDvrZJXg
	SXkK/xZgwi06i+xqjHj1Jof4joUDhUglVUl6BmRMwBswq7iD3hULmBLN5p7JRLrIW7rA7Gfqvbg
	M01bT5VurEZHpMqiw8efJJ9TwUYMDK0QuVaONP4pJ8DoqTL1FBEI=
X-Received: by 2002:a05:622a:2292:b0:50d:6b06:a44e with SMTP id d75a77b69052e-50d6b06aeb9mr216908021cf.17.1775566288003;
        Tue, 07 Apr 2026 05:51:28 -0700 (PDT)
X-Received: by 2002:a05:622a:2292:b0:50d:6b06:a44e with SMTP id d75a77b69052e-50d6b06aeb9mr216907581cf.17.1775566287557;
        Tue, 07 Apr 2026 05:51:27 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:b36f:5370:5f91:2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83682fsm577526505e9.7.2026.04.07.05.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:51:26 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 14:50:02 +0200
Subject: [PATCH libgpiod 11/14] tools: gpionotify: free pollfds on exit()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-treewide-fixes-v1-11-66c9744a56a3@oss.qualcomm.com>
References: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
In-Reply-To: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Kent Gibson <warthog618@gmail.com>, 4fqr <4fqr@proton.me>,
        Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=716;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rwTQZp247DVkPKRKLHBvS4N6o3/RPzgQb8+VJxVx0gs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp1P29DNU6Pqhavt+CGaur6Hxu38Q6KjzMIp9tO
 DRC+ewS0VOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCadT9vQAKCRAFnS7L/zaE
 w4YVD/97zSLQ6tYc4Z6M2/RJcFNCaP09gqh9QJ8b6KOEREHxlRucGsvrE9g3FWaJK9YfhzjIsWP
 sbqcp+nqB08JhSA7VcSrKnsogcK4gkX+DKYz3FA2e/fyyn3/cGjS4lyCQc0NylnLmZmuFs7isQC
 qSKdf0yaHCBPC49JZACiv6jwqHFj1tyTOLKuggHHNDVuvVe0N3pn2kJzV2/ck/e6xaeqbZi6gRB
 /0Osj/OsS1bOji8RdZGOFnz/58RnFwVIEQxkm9yvl9yMk6VndhElZ0USsluj9eDxTuubqru7Xeq
 0l56gB+wV0TJSrX9KI6IGXmGZAWbID5WOUTitUz1tClOOOgcd5Eb3dcc1yojt28ZOUepkSFTbm5
 IUYziSnz+I/4iYPxxN9MviyfM3OPfFNumeeJH3rkpwgQLzDpRpti0Qw4YyOgP8PQfn6A5hWQe/z
 5pYjIljSIZ0O2wq015s913Tb3mfdBmZf4HfQriqruYYb2sOHQ1E9QxHzNWeYDDuIj9nbEGqvGbE
 x8gwg/8+DmhYQnO0H4lx8ip+YSNViK/71nI/HIHG8H3/R1Zs//sQCXufkZw7STPMfL/ZsOPPv9i
 cHNnrlu13y0xKDbfeJwjiHcQX4kT+1SwoY9Ei/FpgjqZHAYgXwtYSwRFp+oT/N/TuHLyllOddkI
 oAf2IcFUlO49edw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=SMdykuvH c=1 sm=1 tr=0 ts=69d4fdd0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=k_vs5qcyFoCbxttJhvYA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMCBTYWx0ZWRfXzxzOVT938dHF
 /bVWKc9hKUnc2vsImRd6H3hGzlo8o3OjOdXsaC5OuRfE78uZn67Wd0AA4+6DWfSLeu4GOLSZOeT
 F8c44J69/RW6g+psT3C9S/OlmVaNO3f3lbDTCBbDt9kMPURi205pDlEU2jAmCXHKi6B80jfxsFS
 GvXSAjtkgRlndGsgaQIDgJtwZg05aSO/HS4eVGHTkYx6tCUnU0/hVteFggUWF6LAfjIunOYrp4+
 TnkGJChjcHtW4SWrNp1SjkF/e/0ln+sYyNQh+tZZibsTLM4tkqaqqis0smxKpn3yPaExw/BSFAS
 wgP6yRpMS6QAMAgy8/7TtPX1XkMhbr1MiVo03AHJQspq//betB6x8U/LMqhAzOfTJ5M5rT+/Guh
 JBkiVIS6xxtyO6I/iOg8LmfHe5SRQ15N67YUoguC8zj9Nip47XEMm0FzE0QuY9j3vXPmJ5ibkUO
 F7R6p3UgAYnYoIU3AZQ==
X-Proofpoint-GUID: cqGtQkl8DJHnG08CTyw_cwpQYlQTcL-i
X-Proofpoint-ORIG-GUID: cqGtQkl8DJHnG08CTyw_cwpQYlQTcL-i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
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
	TAGGED_FROM(0.00)[bounces-34798-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: 149AA3AEA97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is not strictly necessary but it's sticking out in valgrind report
so add the missing kfree(pollfds) at the end of main().

Fixes: 5f194b001ae6 ("tools: add gpionotify")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 tools/gpionotify.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/gpionotify.c b/tools/gpionotify.c
index c8c835dc970c5bd0d2eb1836470f6f6bfc2edcd2..a6f82fbee0ed94b73635b724fa53216f4155101d 100644
--- a/tools/gpionotify.c
+++ b/tools/gpionotify.c
@@ -467,6 +467,7 @@ done:
 	for (i = 0; i < resolver->num_chips; i++)
 		gpiod_chip_close(chips[i]);
 
+	free(pollfds);
 	free(chips);
 	free_line_resolver(resolver);
 

-- 
2.47.3


