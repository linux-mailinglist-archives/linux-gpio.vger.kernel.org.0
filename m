Return-Path: <linux-gpio+bounces-33328-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGqfOrzis2ktcQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33328-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 11:11:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E41E281328
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 11:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFAF531C51A4
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 10:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980B138657C;
	Fri, 13 Mar 2026 10:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bFD4cwkG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b6H9SKF/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4150E37CD57
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 10:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773396425; cv=none; b=UKcagZAVkT+5vdRH/nKhJOo93KpnoQf1IpSDZ32Tu21SMYzxMChMKDGawvaAvWqQW62O6yt55VRHtrHoOyctmixS/iBOVJ8Mn1IVlUljslAgSD5U+WtQcIyOWaWoQyMpAW4/8SGK4X1kIa6GIQ2GUna9OpeU2AbuNrx8G/z3wRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773396425; c=relaxed/simple;
	bh=vtYgj3pRFAEJgXO8tmiPpsBwzR6F7meKUDbxCrmOSPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TJuLxFf8XYL1/UJiX9Jw9DeVACyytzuT8LyBkWgSqx+LDYoLsMStODDqCRSEU1WgPp4e9gJ4eH7BShSNdkiUQXxHCA7xgyO9Lm99aBOQ0WLg0ppT6V5Jn1lKf8VoqGT8nEYfNJMptOMJGUJ/cwZ/Te4nD9xzmvTIZGuO4yKeahY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bFD4cwkG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b6H9SKF/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5taHx3229811
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 10:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b+rmSxh+Bkm9V2qCr68zFEAym+UB4P8yeghB7A/oQJo=; b=bFD4cwkGcSJKBCH5
	G07DWaURYKWgIfhj/K7YwRLim9bHX3NnaIl+NUrlrdHQi/f6Db7L5cmTsv6gjjkq
	QtgM5FVKz3MtBeXOSGkXUNe4NCJ88xaT9GdZbPffV4HT7SQIN8DwYTP6I7aZNx8o
	aahKbBlKanQfGzvr/uQwPpmoKqFKPIuttBFFhCm/DFihkTroZyhQeKJP3f181ZCg
	7OIpJ58JfQilJmkUW12cX+fsWig76k0sAcAZvlsEI2eGi/cdBSmMNX0Lyt0Rhqd/
	wFgm+q2aOZ/6V2J/xIrisMdtBpOxsics68zxkwgu4qs/JKtlb8oJNKi5+90oCXiJ
	gJGDag==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7hns6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 10:07:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd80c4965aso1329406685a.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 03:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773396307; x=1774001107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+rmSxh+Bkm9V2qCr68zFEAym+UB4P8yeghB7A/oQJo=;
        b=b6H9SKF/CGBEoM0Cd2VjjY2redEzQtfbKiBV2uyhMbaPuOOpHWJrGnczzwCxZ1RE62
         18c+BaOdlO7kzHyvkXUJ7lntUq/luwXrVD8tu7i80DjsK9GmNzHyiVSHk5y/3tPSrS5u
         q3ehYbPJJ3AC5xl553dUklzJgryZa2FnpLQOHAk8f8OYP6EL5MKSCqv3uMHuWym1jCoS
         0omCASnBBGhxRyUNbVk87vDtYdc6V4/gz/kuviX+z3gShPceCl4KQhR9diYhnARPRkzQ
         jIeVOW6ErtA80nGg57+r94y2uxfGSZeQdnP44tc4pyYV+mvFbEZBaZ9UZkUI0ZKBs+fp
         bb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773396307; x=1774001107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b+rmSxh+Bkm9V2qCr68zFEAym+UB4P8yeghB7A/oQJo=;
        b=dpNBOxSp/kbTYk686d8Regt9wpCeeqaan4F7qlBEEkFHNPokUSgYa3y3wVbQJikixX
         h9kiVpeb/eoJI/J2zL2m0aByakD33hSenm4HeEu11M0UD+nnxrycv+ox5g/DYIuB0i8X
         C+Pb2lvV3uPdrqd7HqdiFvZo9Rv7yRlCto87T4V3iNQCau7fN0y9SmRXTIgU+nBrNXzp
         9jtDVCN6CNQPU5oFy0dLJ/0hRWB/gHx5CQK9Bj35KNjjExC/lKM1ymlozZwbSoLMlIb1
         Mr1Yz9DfWbxtUchVflrlk3eSk7fuAnEXyN9EFr8fgw+yY/671U9q7UibK7ta8NR9gNn2
         uFkA==
X-Forwarded-Encrypted: i=1; AJvYcCVbFl1pcAzJr/VuRRa82ZzPitbxLSEGiyYXz6ivgIOGHt4hs9ZPMKm5Sr2Q20ff1ZxyhFeTKJ8cf8dc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8l3XT3LB/Dxm9EbHNqrlUPpjGmZRaTmc56EeeEBM4fJAXDOwE
	az8vyLiMBVqNKrL+ql/L8iQhRpPN3uPZFDxaKLwByhMNg/a85hYjRmCndL+ZYjyVTSCctQk503m
	X75iBu4MkNuMH+2eAksYHHXV/hsFuNAd3nc1JjjJxrf+lSWW1aldgIBvjBY0qQ2UH
X-Gm-Gg: ATEYQzy6fiyhAXroWSa1ij3Js9+sPv3PPnLI790ycNNPII7IjKMVNMI9BA1v7NxbAkc
	iVeeb3zi5mmiz7op51oO7VwT2rgTLVVfnvBmqdP7g3bCAGBx5YpYNictAdm+jNaNUDl5cbnSrdW
	/PMYFlzqpSFV6yzVxDAlHp4OApUobnQ23b0ZEXhwR0JTYBLqBUv9OF9apR1YdMADvrjNAL0Yzhs
	rrIDl7m7wrhgV9HSvC4YG9eAwZsAII0z2SrHgs7z2Xv3+Ckrh7womj1WdNIYPhZANZOwhVOY/nt
	Ar+LG53iuSu1gI8BvNzX+7SbLxPK2nP60JsTBMHEd2IIjOIsDnqRA4m2zv/6ohcEV07R+KhYVA+
	vlUuGythNcT+lCp5aeFO4ScAiGOZK1jmL7nRj6Q1IEpCQq890pnTC
X-Received: by 2002:a05:620a:1a06:b0:8cd:8bfb:a48 with SMTP id af79cd13be357-8cdaa84bfa8mr819635885a.28.1773396307487;
        Fri, 13 Mar 2026 03:05:07 -0700 (PDT)
X-Received: by 2002:a05:620a:1a06:b0:8cd:8bfb:a48 with SMTP id af79cd13be357-8cdaa84bfa8mr819631685a.28.1773396307029;
        Fri, 13 Mar 2026 03:05:07 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:840f:d4e5:5fc0:62f6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e9179sm194215785e9.3.2026.03.13.03.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 03:05:06 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 11:04:50 +0100
Subject: [PATCH 3/3] gpio: timberdale: remove platform data header
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-gpio-timberdale-swnode-v1-3-4df2e9b1dab5@oss.qualcomm.com>
References: <20260313-gpio-timberdale-swnode-v1-0-4df2e9b1dab5@oss.qualcomm.com>
In-Reply-To: <20260313-gpio-timberdale-swnode-v1-0-4df2e9b1dab5@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3663;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vtYgj3pRFAEJgXO8tmiPpsBwzR6F7meKUDbxCrmOSPA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBps+FLPKTfltF4iBulytwcxBD9YtsYPFaVFsWKq
 ATFvS1R0y+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabPhSwAKCRAFnS7L/zaE
 w7cDD/9EcF6O8piICfmUVT1LjO2Hp6qnjun1BouFO/7B2kzOary3Qs9Ds/xnpQuAUla27vnUJ++
 ZrRgMmSujQhAKg0ds5GvwDFL1VFDJsr9D94Fvblv2WPe/DmyQZ6qYpv4btRgn0e8zoeHzceGYLM
 gyWx+AKX1atGHfi1mb+lrex4GQIveiwjgRNHx5kci9hYZ9YvkziVB55UiEyEACJBMnwnFJPH9gK
 n5KJsLsh5ztep3u5HSoxAWXa+NYabG4xX4htswd1A55VVl/OEiV5TePM0AxgIsPF/Lwe0C5kZKW
 yVFBi8AiOESA1ZRek1BMqJ7lYjiial8mEbEk5S4+nWJuW7/HjDSFQ2N0K2TQefTcuBRHqEfhiUq
 7u197Yw7N3BMFYUsKc27jV4f6TP8CXKjWRQ8DWWu2s284jWEHxysX9y3V2xkMG2vT/ZYsOTI2u3
 1bZWbXmXbN/K1YZKenQ+uF61KUnSANwi+EVqdvInrOLSBxFZxV2yq4DLU2f+IWcpW+NUA57pIJ4
 gtfQMgwVEuX64Ak0dlczL18DHEsijTeHA+BoN/ZnVti4vTBJO3IINjKLmuQ9QM4DAsskwajOzhN
 ck1MJWOfggAY9qm4dJJMpYVggzfLZeBsYe0XkVy4wDAN84PwAACCUXpq21kuDzTCeqQxcpWyMIi
 Y7WQCncPv9mkCQA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 8puyNYXdrAm4a0lGTj9M2Xm4PBZsdDMj
X-Proofpoint-GUID: 8puyNYXdrAm4a0lGTj9M2Xm4PBZsdDMj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA3NiBTYWx0ZWRfX7talB1ule0HD
 mN+ea6zHSmO+hznABiW4u51v2sGlZD5bv5fzDmLinEOSpiPtFVKyKGjoRvdNqL1ZFaPIdQ6ChD9
 6AcseAMcbNWKNGv1fJpGr1KKiqKowJYLbWCpqte3S+LY5Oqr8YHIapF78IaVEa5CKWkV4p6NSE4
 ZU2zQwlKYMazjOwXJvuumsu+xHtDHX4wBOGnfBtFL6MTMCF9EHGDRjf6V+HJ20MfNFNVlI34Bg7
 56TMxDg6hHbgoNakplY0FFUcIdLtOrwdKYcHfvl/OZlAgiHb0ZkXUr8FPRB3/hCOfUFwQAANNmi
 nQX/aTgzzNtwrwtgRtRyEZdxFgiHtRsXOIPjDtn6VCoxTIgIFLw3L42Abk9Owk2gHAo0VotSCon
 2pvV3GDARC+xOVJW601A9F8jaB0f+6Aby8VewOOR8iAlihKGd3iTJfH8C83kT2j/yevqkLQEnDk
 mIvMMcaqijx+oxQDP9w==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b3e1c7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=kr4-LvAjgXvljQpeuXMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130076
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33328-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 5E41E281328
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With no more users, we can remove timb_gpio.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/mfd/timberdale.c  | 17 -----------------
 include/linux/timb_gpio.h | 25 -------------------------
 2 files changed, 42 deletions(-)

diff --git a/drivers/mfd/timberdale.c b/drivers/mfd/timberdale.c
index 2d76b6b58f9fa9a6f8b1b96d143d6724f3cd503d..9ea12dce384d75e5f77f72d23a78c56d64d5ebd4 100644
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
 	PROPERTY_ENTRY_U32("intel,gpio-base", 0),
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


