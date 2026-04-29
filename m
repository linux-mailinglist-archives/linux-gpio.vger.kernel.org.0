Return-Path: <linux-gpio+bounces-35776-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEzJH0q88WnmkAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35776-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 10:07:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF340490FAE
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 10:07:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E8D0300D689
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 08:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E493A5E94;
	Wed, 29 Apr 2026 08:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hnWAfWRl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tz7UehIt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F7C27A462
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 08:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777449800; cv=none; b=pal70RwYXw5l528WbW8kUAfXBbBEK5vDwm8z/9ZMN1jc9GaDwCDBSEewfCbC2cqWG/L41vD/EIcFSr6YkxmM/28EWx1Q+3FU0fJuvThrmm5FPDn0fMVmm8n71icj/uBl+aHsL9xkeOfV1XnvxClAYVOFa+Shce48fSMnnC+ETsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777449800; c=relaxed/simple;
	bh=BoaLaa1wA9P09UOaG+CkT5qtDoaagn5u+5xwFllVc2I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E7tlMStaNltQjTQQSZPuUHVTOAkHgh6Av+W3Gd7xoaa/BpWyDVfUbbq/ywk/jGUcRV2socV+ERp/0ahhFS2af0KEKHaDrxBOZ76xwXN2LZBMJ8rkZrjY25w/zxuqQT1xRfbLQw9vkcpM096UgFKkg81XFqgInk2QeOPevQLy+qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hnWAfWRl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tz7UehIt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T7Kofw1882242
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 08:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ejloV9e6x6pBdw4iy1tDN2MzjQ7MqEkXIrl
	6CWjGGoc=; b=hnWAfWRleyBQ/QAmNIxXsOClz82Wi4JwFiD1LM0O3E/UjCN/HNm
	gKpnxdwznz7lT2FuyshBkwCRIOAGAHMqv8QIc3gNqK8g7TWRraPfoDIhtm5CCVTu
	76gf+LJZFh12eJ3vCY1BFv1K69rN5xNcswSqttf1K72qm9XOmaTdQjvRRlTvtLjz
	c1WWVgM6ANl8Mc0Ff2lTeDBmD2cC7GZseM6ZdMjvIGLTeaZQ5TqrboJ7QUVUPTb6
	0zolILIZmawZlZLw5smZGmKI7PnBwF8lFMobddPdXTlO6cuKxtK+g1C3qGtwDJ4O
	C5EJCmATGQOw+AEWxVKYa/ZOZh/sxMd/jnQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dudh3r7db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 08:03:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50eb8bad331so114197561cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 01:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777449797; x=1778054597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ejloV9e6x6pBdw4iy1tDN2MzjQ7MqEkXIrl6CWjGGoc=;
        b=Tz7UehItWatFmMrCYUjH4SHbOkDOOyQF9YJWwhaWjRYYKM0ysKn0tQWZPLncVBVxgL
         UKR534xMVaDS8bf/THaU8kFbO7XZ3n/8sZwZrQbrOWCPfMKej6bZEVu+v8TOWSvsVnZX
         uufuLGjqu2DdtaqkN+AoQi/WN/z4Rmc2xOhAU+aaVJdg6Ce72iKPpH5eRwgce2m29l04
         ysL/Gr2SOR+1VUfq34tiY/L9CnZ1FCpJZi/grWCSxcyLVaSemiiZFz8QKK+RmU7sXBw0
         3i73c7/xSvf089l0lsoOgznyN64Pr44UFhGmxFPYZi5ZotUbjsa5LHj58FcrNM5Sm/DY
         8TCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777449797; x=1778054597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejloV9e6x6pBdw4iy1tDN2MzjQ7MqEkXIrl6CWjGGoc=;
        b=A0Dgotc8OJnr9mUTpckuqoSN9PJkOmogw5k3BDwnGxVXVNDAFh/fg1CXX+yM+S4lGQ
         C1k8Q8Afwo8SWg/5LoVei5WpgYoFkVg1a59tkKMCCezde6aWe8f3QbL5GsAcWvjrwbL0
         11gKi/JUHU721oSvU86Mn96kwIqpJFmwS2ZvEtxlmq94Ra/CATC+397teOk8Y92PQ25D
         5bRmyCgUR4YNTCH/+BHzeVdf8r6dcf1Y4c332ACj4SpG8K6PwNTbFBmrt5Cz0zmK93jC
         ZCn8+/peJclGiVyiA1xxJYqyFGa54HMcriVVnY9cthuFViKY9/1zEKKduIoeUOqvra1O
         JDSw==
X-Gm-Message-State: AOJu0Yy538Mfm0J9zhHF+7/FGAaVGVZFvP10k5wdhzVklCogzD2gRK64
	AyI2mL3eS+Rvq2wnXbiI7+eOIMzczIjDIXJk3ut9tt7YwDFbM2WdBzgQ9kLBFOBjwAhTKdfEIgW
	l7PQ+8FI/RsmUHkV/iAlr320u3lzu1y8Y1UyPedJ7DTRN0+R+10utZqhGzn4/KHKl3cgZ0T5V
X-Gm-Gg: AeBDietFwZ9xD9xfmxMHsV2+cAiGENd/vlQ84iWL57PT0zLgUAHXItjloEUhzsgl/nR
	tkSsDZSZg7ncrWgvR5/E7MDgYDsBpvn37Zgam07WDl1DuHAxaKpBdwYO22MjiwJaq1cq6SngJmL
	IDx5c4Pa9EgZvPTHJTXrVTX2cHVVX8TRZeziLAPyWcd4x4oFCWW82tm5/oDi0OxLzG4g5UUHIh7
	tbSJm9pNkEX/OlTwtTG4/XUejGEJgflSbleGN3UXk5VuP+UmsU0zwtKOC3m8PUGE6FKGXKgkc71
	3uxrDE4Ob0btxVB6ATRqplbDWKLbLmwTBRiDzQWyeSglvlMGv5iJEI1UZkQZTqyokQH43A7O0np
	PAmZUkxh/aKOxUzInJ4fdUojq67cSbbN7Qzmm9aSoN4RZxczNkS+xWYWQ5iyR
X-Received: by 2002:a05:622a:145:b0:50f:bb11:df41 with SMTP id d75a77b69052e-5100e1f6136mr87427891cf.60.1777449797174;
        Wed, 29 Apr 2026 01:03:17 -0700 (PDT)
X-Received: by 2002:a05:622a:145:b0:50f:bb11:df41 with SMTP id d75a77b69052e-5100e1f6136mr87427481cf.60.1777449796744;
        Wed, 29 Apr 2026 01:03:16 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:668a:d11c:cbb3:a94f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7bc79ab4sm41758785e9.9.2026.04.29.01.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 01:03:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] gpio: sim: add a Kconfig dependency on SYSFS
Date: Wed, 29 Apr 2026 10:03:12 +0200
Message-ID: <20260429080312.15561-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jiepeGx9Mzhvd2R6VPR7mCE4fglK0JIf
X-Authority-Analysis: v=2.4 cv=A4dc+aWG c=1 sm=1 tr=0 ts=69f1bb46 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=LuPc3Q0RfqcLugTSN9sA:9 a=a_PwQJl-kcHnX1M80qC6:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: jiepeGx9Mzhvd2R6VPR7mCE4fglK0JIf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA3OSBTYWx0ZWRfXzcxBfE2Iu2nn
 KqBwr7Y7Nb/xekHaIFuf1VgwbQno+k/UYsJwCXs66y2RbKoBaOIFnAA7+2MbDubmPvOfYIb+8f0
 eL6Ls+cLNEF1hjHbnnUKBL7NO1XRuf5O4jrdlRjjAOZKyY0OhWY4+AbwSaua/TQyu5Twk8W99ze
 5nQAs0KqjGvnhyIav6J5Lop7fA/mnXVAbRYsZ9LmpblmqYOq7iwWfjzuefFNuPTacABnWcNEFq1
 Z03aK2LsppLu/fDEBoISaNMzXU+6mxXtE9m02Z6Sy8auM3SeBgXLtR4ePifrQfLX6rNQeVoFWYY
 xs8rw5x6VXMWA5u8ziijMxV2yQxrbdeyt+OTL64NoX9hNV/y5jQ25bZ5uUGMx3IzEFutzgSA/FD
 VVCxo29PWmAboEQeowSJvEhgeEqMkPi95VrLDbHzdnseGOjO7eYA/2xl73VxEub9vIPFHY+XANh
 W+TvZaVyQDIQsi8UyZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290079
X-Rspamd-Queue-Id: CF340490FAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-35776-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
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

gpio-sim is unusable without sysfs. Add a Kconfig dependency to its
entry.

Closes: https://sashiko.dev/#/patchset/20260428113439.9783-1-m32285159%40gmail.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f86e25da964bf..626173d1731e1 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -2060,6 +2060,7 @@ config GPIO_VIRTIO
 
 config GPIO_SIM
 	tristate "GPIO Simulator Module"
+	depends on SYSFS
 	select IRQ_SIM
 	select CONFIGFS_FS
 	help
-- 
2.47.3


