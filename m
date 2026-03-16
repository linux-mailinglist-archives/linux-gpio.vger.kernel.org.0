Return-Path: <linux-gpio+bounces-33485-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMKJLR3Ot2miVgEAu9opvQ
	(envelope-from <linux-gpio+bounces-33485-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:32:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF622970C3
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:32:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 86F7230300C2
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C6638C2BB;
	Mon, 16 Mar 2026 09:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fls/pYtN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e+8enuEo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8E03890F7
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653471; cv=none; b=d2xaYOg62LEOhQCCYASItDoilxqORy5EfoHmM/LMUFo+qkV9D+UGhXutYRTR1OxfK7bGV9q4XM1W6qiZ9T23RRNckKtQYCERWNV66hFY2dwz3zkWT0Qrr2flN5N7BxlLnLdfRg7pHghW9Gb/2fLu+G7jG8GJLsn7BFE0pomQ32k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653471; c=relaxed/simple;
	bh=BPoT3vJe5UM99YteO55NLMBb+avBawz9IxczOZcS3N4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uGFCqnYqYqgoUXmDqnzLLiYvd7ngaJ1gniOCat8f9/hHrpuqMK6HG4xN+hEC8miQoAfd0MVTE2fWz7xttqLUiAYMSb1yGs+FESDlUbTboNrJv5TszNS5wOWPqmhFSM3UiW6IJCneRHWUG/6dHQaqCR1yjj9U7voa3eaMuWIw5cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fls/pYtN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e+8enuEo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64eMT1282091
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:31:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K69Kp9cQB7p9Q2MDLwnsLRQ0w9xfjUxp4opUu5vBsyE=; b=Fls/pYtNr8rObqDd
	u+CgMODK+g21jjFbyTLsPSu57+8Z57QYEcykaK6C84wYaoqobl3j9PgURgAWW5Dj
	bqtIJfzr9EodWXbxkiM3fSaYoebA0IOuer0Pz3YI3VoNhWh5Gl++hpIrllI0CsAJ
	Zt5oTiEd6y3xjmtW6vzV4aYrikvTtaKindpM7Jjl5/a/ayfqZpwXCbn5p/EKltbD
	8vIKz9Rd3qHBN4OlRKNYCq9NxYn7cZDd35Ys8Tb2fHBr4xrqWG0xmnUA339JETb6
	tF6/8J8FnTjRbKegpQSKvfXFs6VVGXxE6sSK6J2ql+ZEkU5+JIdEqITTfteneBj7
	dKfNcA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc4y2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:31:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cdb995a1bfso2789295285a.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773653468; x=1774258268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K69Kp9cQB7p9Q2MDLwnsLRQ0w9xfjUxp4opUu5vBsyE=;
        b=e+8enuEofc/8sogBJYl2g0xsRkDrk7sARcl3ghzk4awfQhL2nkHmsiPqlyDIsR9r4c
         09N+YYq/C2oA7yhn70epBEwDA0cEvzAS7ID4V2Vnk65Ft6YmwimgkduUpX6n0i5JlTow
         JgS/ghkqpHsvGj0gYxEDBb54GpmLRZokDji1Mc7rB23ZV2GnpOGDURZxds7niiO3yfW4
         gl5SC3vWdLPLCUzpH33VzVFUW+U42c1C/R8YU8XY5CQCHqIwj8UkQIOMvN7huXUvdXJh
         b5Czi2edD9PNYyj6qRCg5bWmaz+1djAjqupJy2BvRqjcAm8H2bPZyHMNQHnJSscwIj/V
         O1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653468; x=1774258268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K69Kp9cQB7p9Q2MDLwnsLRQ0w9xfjUxp4opUu5vBsyE=;
        b=qH0nXGR9heOUeaeVuJERQZmNp+bXa1hqg+1VJgGgHbeIg3TmVf0ZRheYvFOWDXZHj8
         nN118qFlrz66+409Gby79QBo6ztAaA/1xf2YXWxDWYZQ6CZ/fxD2Ge965Qw6sK9lTEfQ
         fp319ya0dp4I1/z4z5tWLEV/c45nM4KZqIsBzQ7OiEPwQ+XJuJxHtTaj/dRvzHLFDZLM
         I85MnAdW1TQYCt3+a1XW1ow9buKUKrGQibeQnghmF2I16/n2PLws+HcC0p45u4qsSVO6
         IPB3GNHw8T8VubB3JkdM6S4rY67gFvKjXSqxg3v5GiJAasioxEF8g5aqgO/r8YDezD42
         i9Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXEL9D6BDSK/M4zpQIFOlpxiymj4kOXcqJ2D6aNJ8sy9zZRl81v4yqaHtsA6jVmpRc7O/3EzCwt1gt2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3Lvw6YWN9T5YzyezLENrT4T10s/+msbKthE+qjJ3B04DE2QOl
	6n5qiwTEX5Jj5iQSY3wzA/1yMP7GP/87J4ks7lm2lesKMmewqXYMoCEERne0BS/hCSRJfDSoU4r
	SXtL8kleL/D5eAFWRj1MpVSqa8l6Y3QlYG9WP8FaydQPk2EBUedXZG73wl6wdm8WPxUYmWH+Z
X-Gm-Gg: ATEYQzxspHjx4R3N6lhsaUT8Dn44yhNYldhzrFHIrpvAMiQ4cvfSujUbR8ne4Z9tgaH
	6d1I04FOB3ZjmHNy4T8+rKMcvmWsiQVJ+zb9UrEGwQ69ep756wbqPYyGdYzBi9W3P+rgBYaOqfP
	qnlvbQOBUGktAUhUeS5ZwaLq/3QfdwtlJ9oqmYOYj8fPTXZlwuQoeToYCU5KJ0uWPeHkXO0GH/A
	Zg/Ztb9FJf3AESFDmyMmOTqUBFAqdGkN2dWVA6xV+Utg/6n3LraSJmHwlrk2ktgCsxu7IKoMPtm
	BN+EB+OdE/C1cmtiUiyHXLEWurR1aEWmOQvy+EYtwUlI3JqDr521RQQbo4hC2A+1UHD5357TCGf
	EP/kaZQyF4vm7jx1n1Z/z12T7TKWHZXuo3TAsgJs2QHqDHP2ChUCe
X-Received: by 2002:a05:620a:1707:b0:8cd:7ef3:7fb7 with SMTP id af79cd13be357-8cdb5a1c145mr1659237485a.1.1773653468387;
        Mon, 16 Mar 2026 02:31:08 -0700 (PDT)
X-Received: by 2002:a05:620a:1707:b0:8cd:7ef3:7fb7 with SMTP id af79cd13be357-8cdb5a1c145mr1659234985a.1.1773653467974;
        Mon, 16 Mar 2026 02:31:07 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19b936sm43930688f8f.5.2026.03.16.02.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:31:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:30:50 +0100
Subject: [PATCH v2 3/3] gpio: timberdale: remove platform data header
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-gpio-timberdale-swnode-v2-3-ea0078066871@oss.qualcomm.com>
References: <20260316-gpio-timberdale-swnode-v2-0-ea0078066871@oss.qualcomm.com>
In-Reply-To: <20260316-gpio-timberdale-swnode-v2-0-ea0078066871@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3723;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BPoT3vJe5UM99YteO55NLMBb+avBawz9IxczOZcS3N4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt83TIEa88Us328EXh7obhmPC/SI6GDCtTZ5xy
 JJOyAgfpgmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfN0wAKCRAFnS7L/zaE
 w0uwD/9AgIdsHEYoohWLcgxnZ1FatStptOrpgb8a3H1gb6Yd3GDFk2SO5PSF3FkKdPjSDs2TQKE
 ZL9GL4ficakNsu9ja6cbnA2+z+4fZPG2dLzh8YkJ7Xh/mKGXRhisZar6R94VRzQ0za34UiUz6q3
 9Y3UcIuW8xXF0tH3OF4SJTao4jXR9JGy4stW+n+Xj1sBLt4KceBzfpq4V4EXOpPqLXqcKP2lzvo
 EezFwL5lhmFlxoSXb5vJvvVQ7cwwkXYaWGWGUaM68RBBLQcZdIVMmmVQi4yk1NDY0TJKNbrwCml
 WQdS9htaB6QmHiEO/1a4kS72jDm/Y+in6wwfeM45+c2rFG2s807WGnKMQLlz1f33508hTwgBPRD
 SaadiIgGna/WTJN/iq1lCkFDbg5Kuc/+4xakr6GMTkUnNdbxqm0G0FKw22bFhFgCOQjdWW6odxd
 vU+yeVzhiwbJCawWai30oY5Wy5hhQgANzCU2osrpZgXjsKsuk8y7MdYnEMyqokaBrUgJVjQ9pEJ
 qqch9xm2Pd6c5Q1T6JqwfLKTeLtYC7zYaaKgbncQmTshERx8ehamBH9CPQ7YtwTIZfczhScN25N
 zZudHjE0mHMuZGusxddz5MFVlOf1UR7Ffu/Gi371vLuch8FsCrOuEhpzECwTtu1sWCtPv9SUOUQ
 Ec52Ga1WwJW2bVQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b7cddd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=kr4-LvAjgXvljQpeuXMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: W-_O3l5IRDK1KtlCaBD7SYdfDffw0kiq
X-Proofpoint-ORIG-GUID: W-_O3l5IRDK1KtlCaBD7SYdfDffw0kiq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MyBTYWx0ZWRfXw9pGhiPH5OR4
 b+cdGB8lILpwIwMToUO8z2ngH8HIXMr3Supa7qx1/JbDs2yGNqm4ynU3puuNlfYoCf+XQL7TQ/3
 B85UEAQym0j/bvTq+VCGbCr7p0/BHr/KEiJkOcp7goUYO/cKX1gy82X5YnDI5h+zhD5MNcLXqd8
 NCmG51KURL7Xd5Py3vY+o2GtcGaYFt9BA1gRpTPrS8H8hIeq9hzOdkOhOUXm8gk2MsCkU/DJD7k
 hTDwe/cMhAbBJM7x8+tzg7J2o9hPJbOAVQVstVmrsoGTB/MCc9GIK4gnRGFwNmVfzDwa3JgRQ1d
 DROgBzieQjcBIYU2+yf846jTJO3NItnqacQPnCevwWdweXDpVb8DSsxtu+wxac14lwxRy5IDdLg
 q3RcFi3t6lCOb3K1vz1VWjeYlzNniqouhz+/TflZwnCRPfZQkvEmDDo/IwyFFUQr28ZpJlLpXsf
 /OE5OIxsc2K4eQjhVBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160073
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33485-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4AF622970C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With no more users, we can remove timb_gpio.h.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/mfd/timberdale.c  | 17 -----------------
 include/linux/timb_gpio.h | 25 -------------------------
 2 files changed, 42 deletions(-)

diff --git a/drivers/mfd/timberdale.c b/drivers/mfd/timberdale.c
index 8d7dfeaa76258d02e50528e39c4f7125d9201388..77d00d19b07050997b1d1c6e96eec0896a5a6867 100644
--- a/drivers/mfd/timberdale.c
+++ b/drivers/mfd/timberdale.c
@@ -15,8 +15,6 @@
 #include <linux/property.h>
 #include <linux/slab.h>
 
-#include <linux/timb_gpio.h>
-
 #include <linux/i2c.h>
 #include <linux/platform_data/i2c-ocores.h>
 #include <linux/platform_data/i2c-xiic.h>
@@ -174,13 +172,6 @@ static const struct resource timberdale_eth_resources[] = {
 	},
 };
 
-static struct timbgpio_platform_data
-	timberdale_gpio_platform_data = {
-	.gpio_base = 0,
-	.nr_pins = GPIO_NR_PINS,
-	.irq_base = 200,
-};
-
 static const struct property_entry timberdale_gpio_properties[] = {
 	PROPERTY_ENTRY_U32("ngpios", GPIO_NR_PINS),
 	PROPERTY_ENTRY_U32("gpio-base", 0),
@@ -402,8 +393,6 @@ static const struct mfd_cell timberdale_cells_bar0_cfg0[] = {
 		.name = "timb-gpio",
 		.num_resources = ARRAY_SIZE(timberdale_gpio_resources),
 		.resources = timberdale_gpio_resources,
-		.platform_data = &timberdale_gpio_platform_data,
-		.pdata_size = sizeof(timberdale_gpio_platform_data),
 		.swnode = &timberdale_gpio_swnode,
 	},
 	{
@@ -465,8 +454,6 @@ static const struct mfd_cell timberdale_cells_bar0_cfg1[] = {
 		.name = "timb-gpio",
 		.num_resources = ARRAY_SIZE(timberdale_gpio_resources),
 		.resources = timberdale_gpio_resources,
-		.platform_data = &timberdale_gpio_platform_data,
-		.pdata_size = sizeof(timberdale_gpio_platform_data),
 		.swnode = &timberdale_gpio_swnode,
 	},
 	{
@@ -528,8 +515,6 @@ static const struct mfd_cell timberdale_cells_bar0_cfg2[] = {
 		.name = "timb-gpio",
 		.num_resources = ARRAY_SIZE(timberdale_gpio_resources),
 		.resources = timberdale_gpio_resources,
-		.platform_data = &timberdale_gpio_platform_data,
-		.pdata_size = sizeof(timberdale_gpio_platform_data),
 		.swnode = &timberdale_gpio_swnode,
 	},
 	{
@@ -579,8 +564,6 @@ static const struct mfd_cell timberdale_cells_bar0_cfg3[] = {
 		.name = "timb-gpio",
 		.num_resources = ARRAY_SIZE(timberdale_gpio_resources),
 		.resources = timberdale_gpio_resources,
-		.platform_data = &timberdale_gpio_platform_data,
-		.pdata_size = sizeof(timberdale_gpio_platform_data),
 		.swnode = &timberdale_gpio_swnode,
 	},
 	{
diff --git a/include/linux/timb_gpio.h b/include/linux/timb_gpio.h
deleted file mode 100644
index 74f5e73bf6db67170817352415ca58b415870886..0000000000000000000000000000000000000000
--- a/include/linux/timb_gpio.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * timb_gpio.h timberdale FPGA GPIO driver, platform data definition
- * Copyright (c) 2009 Intel Corporation
- */
-
-#ifndef _LINUX_TIMB_GPIO_H
-#define _LINUX_TIMB_GPIO_H
-
-/**
- * struct timbgpio_platform_data - Platform data of the Timberdale GPIO driver
- * @gpio_base:		The number of the first GPIO pin, set to -1 for
- *			dynamic number allocation.
- * @nr_pins:		Number of pins that is supported by the hardware (1-32)
- * @irq_base:		If IRQ is supported by the hardware, this is the base
- *			number of IRQ:s. One IRQ per pin will be used. Set to
- *			-1 if IRQ:s is not supported.
- */
-struct timbgpio_platform_data {
-	int gpio_base;
-	int nr_pins;
-	int irq_base;
-};
-
-#endif

-- 
2.47.3


