Return-Path: <linux-gpio+bounces-31702-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HoNDPLckmlvzQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31702-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 10:01:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C77141CA9
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 10:01:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8220D3037E66
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 08:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6DE427FD44;
	Mon, 16 Feb 2026 08:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQjgrTM3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i9KmOq7z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6305F27A92D
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 08:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771232327; cv=none; b=DwTPirDafvnk56sivQvEwAI2DOdh33jywzOi8cU4uz6/bCDFErIPpFXmiGfcnBXwR2ot7HUAaNZJECFI9ZC8gfTHlLg7hLOiELK32sojwsJGy4IA0sbuYtVQU9SMTKhDTvMyayIpjLvkfLSuA4D9JW0pgMX30jgil+Nfyvm9d8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771232327; c=relaxed/simple;
	bh=0U8icYBDf630T8DU2qdo3kgX5Lg23xfrrtgy78RLV0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u2htsPJYVncNGrKqR3epYxDLThXE7s5mrtHUyR5JPLVITna/yw3P/5zkM9wkVNpLw3Ie4jRU0io2nbEopkXK3W7z+HmN9DCdw7gBqFdQiqylztbiIYSXinBqhltKZMwWwonK/17U6hVEOF9/wTfJhwnZYr/4sCD6db29qLGu1NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQjgrTM3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i9KmOq7z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G8gZCD2803382
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 08:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ve0dKftnpeWLaov/J6pXpHdnguB/y05Hfka
	R49I6Mwc=; b=fQjgrTM3MLto83YDna+kWxl38L8/qHmwsQahhxg/xmJS21mPJud
	qzodSZqs0ViNhYAOrmwFF4y6uCOLb7TMA7Zz2OuLsdoZ09P6my+6g8s+qosxJou6
	o4NeTNWGrVXn/e6cNjQ7HdDb42YrVhLYLc0wpKqhJmrGkKvdnjfsbK23tdN7kFzq
	MRGu2GcoAbinI4fo55pRPvwDcyC6BACfiVtYVLHQHvLpqFclRbn/veRKcIkLemew
	n7P/dlXX8wxhQ/vae1wKmGpsvNbS1y+/zT3aSipMhfgIE973EmklmN/y+n+fQNBb
	kz4wMslQr6jnA61G52vQORR9FKDir2LEZ2g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxug18q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 08:58:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb403842b6so1918586885a.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 00:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771232324; x=1771837124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ve0dKftnpeWLaov/J6pXpHdnguB/y05HfkaR49I6Mwc=;
        b=i9KmOq7zRS0SKrcFJDfJMuGv/jCHJy5sLZf8NnPcTNv2OKPaLl2rlt8bT0HJpIgpmo
         IgtD3/J5+HvFE1obGwjW8J1FwVRvKm9wrm74B48Yw3I+DGL/l3N6qq/gVYmxeb9dI/4H
         UWt6qbHBYA3y6oeOyL5aR8u3oq0Nm5SOgUC62fXi9HB+jCQhZlxp+M/48Ht3G+0M86e4
         foOhGk7PNiu346jjv6nhgjsRabafN7h15UE7gw6Ho101QcWQJao4I5e2/bGgG1OC8x1u
         B6/pMAAvyQLHAFG4wvG/p3cuzDE2ah/vfImpAvM9FXkAn+QQYxxah5Bzn+jyvQIRcnjS
         Mdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771232324; x=1771837124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ve0dKftnpeWLaov/J6pXpHdnguB/y05HfkaR49I6Mwc=;
        b=tGN+AVHoXlMm7FBm6Gf5m5IB+oWnrdfpZlaVTqavvEzwEZ7VfrnZZIS6DBHkJSwVV5
         XuxzDPD5USBC1jVq59i5zdvsECIgS8prYJBS/P3mdVILver7akkF0z/XcgDFMZ9CUexp
         kDAGim0StfggnAdwSEWqez9VkxQMKMznXRw2kX/AJ/2roJPPy48m4SqPWt5HPaDGmfTv
         ycMe+8XDf9rJ9rBSw7qL1dgOJrM0Ji7qvf36YVjsaPdK7HzME7OZSM9Oy1bLW4TqO/a/
         2GN1WlMCDEAC1DT9Oq6vJln6FicZKJCCpv+xtVzLBMIYOwxMsaj/mVW6N3JdD3q6KZJe
         to7g==
X-Forwarded-Encrypted: i=1; AJvYcCW2GHHP09Qgz2fJpljAhBRuE4dSREU+2IzMUDOyBFqpHFdF1EqaDd2YgdmUOtlosyk9IhC73w6QkwQ5@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc1P4SI0YwstDNbV2CKFEeIcTrZROwwE79eiIlEBUQF9FMGXCC
	ic9oJQoeNfb96es0YUQ7fQsuGFu5ZmvvEpxMJOqUElY9tiJ2PHCngv67o34teNySdCe4iNZosSr
	WnrJPUbVBpmg474k1O2/7bWNTkSPKCryfd5Ykcrq8oEGtz/YXNUefAmZdfMBIqACDQVAF/P4L
X-Gm-Gg: AZuq6aJrZ6sbcHzU5KuIw48Sr7Wp+SOTyw9smDkJTByfw/jNB1gnLJ6x9/b0SA+92YO
	QOK0ppjaXsAfqpJ3VpvBYcXDrZuqPN+ioN7KBNHqjOhROeWHT/QDJOfpqX9dwsWM6GlF5wMTnkk
	pbkKCdl96WfMSSxMX4+BqCDs6d4XRLOM7zuo+OvSggzraO3b41vDRGCr9nByFA8xcC5Iq8+Uvdx
	Sotm1LjrVphYtz7aLLVA2QYes5pONGF2fVafUIdLC9MXViMGES2VSrONgH54MvzXDV3He9vFz3g
	RUJxZY7Iq9fHG6xOArwl5aCrcJVpzj8VEL2Fx1TSmVjlvJdihyPtI+tSsCczNJXucGGb/FgfSkH
	JI0fn5CXJLlfLJqyg8iXANfFQlwkcyyWoNWvktw==
X-Received: by 2002:a05:620a:170c:b0:8b2:f29e:3af8 with SMTP id af79cd13be357-8cb424803cbmr1103463085a.59.1771232324650;
        Mon, 16 Feb 2026 00:58:44 -0800 (PST)
X-Received: by 2002:a05:620a:170c:b0:8b2:f29e:3af8 with SMTP id af79cd13be357-8cb424803cbmr1103462085a.59.1771232324228;
        Mon, 16 Feb 2026 00:58:44 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a74704sm27012348f8f.16.2026.02.16.00.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 00:58:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] pinctrl: amdisp: Make amdisp_pinctrl_ops variable static
Date: Mon, 16 Feb 2026 09:58:39 +0100
Message-ID: <20260216085838.71518-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=954; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=0U8icYBDf630T8DU2qdo3kgX5Lg23xfrrtgy78RLV0Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpktw+E9efH4zDSSHNokFbdGHIdPhjYIkhOA3mm
 4gXQz9q5VWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZLcPgAKCRDBN2bmhouD
 108LD/41hLeQINQ7hWE/bBT968ESjmE2Ja7Rx7CzBRtfEGciGXf2+Q/3QhEgy2/tqKFS8xnhTas
 JHga7sY0QRFaF39P4sSAy1S5v0je7Hf1vJj70fI7/vZ6KKQCLKskYJ4W2LtiSnE3bSAOXDxjNNq
 W6GuzV84X00pJ0j+hNEHpOlaahpf8Sn3M9hH8MjbaJhjI/a5q6TkGJS1y6oC8he4l+I3B9iFfTQ
 W+b3pehH4F/WJ8OVvieh71IPDgEG0OPfZBz/8tmynOuQBq2SE1/4bjSJr1fL/pLSRPo1kcwu7Oe
 fIDFcODgKWE3M6W30pQiKCWuYAG9CYRS1dv1SEBpBMnxBL83esgChn/kRX3GHc6P4jM/nFmzta8
 T4xklNrWcDyR8ki2C5Po92hp7A3p8yTXcEvvRBxBvScyzhMMio2Gqjunf1Bxn3hfpSQQJb7jS3r
 ZYNyojIwAqfHJNWUAiOtyzmcx+1S5fETKs/+cZs/XOZBWpYfCuIuZIE7ku6VEuXHuWGnErKm4aW
 9micWmNOJ34q5ArQYNjlOf2489AFtcCmg+1oAWDo1OAOvemYjh+aggO/ubhpJuNRnoTExb5WzvN
 8xKq2Si4ubtqXN16+TR5nQTlDczPZ7OkM+GL92dygQRTdhO7lr5JSDa0eYVDz6c5T2s9YJAVszp I5oFounPoL7ub2Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: inrPTDulaEgcg9Kv-9omwz1toK82cFjb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA3NCBTYWx0ZWRfX2Q9Y5yLW/TDt
 YHxFZDVjiMD29fQIgjsVoqdObFwOuX1eqFVg1I6JvUD2z4MEYAtYEKFbavdLJSShPZanj5vxYxC
 mtnxmvvMcoCkkWE/ZUiQEZ6jOWLyk6uvAwjeVYdTLBrDwHbe2dMKMf/dWLzklQgTDcr/c++e4O1
 SDV7t2eJEmY8yMoEc2/yCkz2oIIaINLvVPOa0oBdD+Qyv12MpXWTbgK4JgJ/N0ipdwW8x4ChkbL
 AtyRAX/M7s8gz/wg9KoMuhg55nm28o5jpPgrB+07LyDKrmxcu/JEVFC0eo5Mh0FFg7aCF3UBM7x
 2Iw3vtiREyEoLJ/N5Y6XENl0c0r0arc84cdQxM1YIrYJ0Gnjw/jOnPhzZXHoOkxehSgTIQZ/WzR
 LJHHP4KeCTfVBpXXwelX5vS7UiCHVkvSILxPXNrLV6DwwHKeZJqFCmw9agB5CAWJRd9YXOP9Lq8
 6CfLLZpYnhm02nIJ2YA==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=6992dc45 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=qwspfZhyocm73jcesWsA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: inrPTDulaEgcg9Kv-9omwz1toK82cFjb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160074
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31702-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A8C77141CA9
X-Rspamd-Action: no action

File-scope 'amdisp_pinctrl_ops' is not used outside of this unit, so
make it static to silence sparse warning:

  pinctrl-amdisp.c:83:26: warning: symbol 'amdisp_pinctrl_ops' was not declared. Should it be static?

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-amdisp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-amdisp.c b/drivers/pinctrl/pinctrl-amdisp.c
index efbf40c776ea..e0874cc086a7 100644
--- a/drivers/pinctrl/pinctrl-amdisp.c
+++ b/drivers/pinctrl/pinctrl-amdisp.c
@@ -80,7 +80,7 @@ static int amdisp_get_group_pins(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-const struct pinctrl_ops amdisp_pinctrl_ops = {
+static const struct pinctrl_ops amdisp_pinctrl_ops = {
 	.get_groups_count	= amdisp_get_groups_count,
 	.get_group_name		= amdisp_get_group_name,
 	.get_group_pins		= amdisp_get_group_pins,
-- 
2.51.0


