Return-Path: <linux-gpio+bounces-34252-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPo8MkNkxmnnJgUAu9opvQ
	(envelope-from <linux-gpio+bounces-34252-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 12:04:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 398D23430FA
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 12:04:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01B8C3186D69
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 10:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7BE73E51F5;
	Fri, 27 Mar 2026 10:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="en+0P9g5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HbrBbmOP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA4B3E4C88
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774608570; cv=none; b=hKZaOU6LsH7chOfDqaiYKLM7DjHbS5lm3zfh64CjnvwtSa700tCWeLWxONBaSj13I7koAydWJI8PPwUMnXEYgAbE8JHH7rnGSAlrKYhBrHqEmKSUcngrv2XUnM9os1ugEcQWMfI5uecATcM4/yZJldSSqax0aAoaWKqit3sWz/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774608570; c=relaxed/simple;
	bh=Kmsr3j0JE36Tm/+YyuAC1ZvyKLbnbUPzhwV7mlwOZjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jE4htG6R7+OQ9rYo8WwFg8gYx0+9TojmeGoQ1iGaW3EqpXH+HgX9ktyKzfKXED3lufJ9IKOhgibV5z144+/BPntPudF2ggXHxEhmJE1bspJ+JVLc0pOECAUlC5NkPHNpIT6RO/J3wYYvU7P1kLmRRPQIMQBGtTkhm2qJp9rdl9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=en+0P9g5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HbrBbmOP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vtKI1226378
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bEIqsG7nb9uSNg7wYY5hsYCtaWJroii1vgC5sQZP0rU=; b=en+0P9g5zRu+aU9s
	AEePAS5jEyOJEgmgEHsbCninhZN5xEfmK+1SFFwhWjqkyVIQG7ZwFcFQJNYB3voU
	LaLxyyJ3whphC+Z+2iZQV5OQhd8WD6Cg0yWzEmUvflYilXECauVKNH7yev253rBY
	pOuUC3c3YqWvcQJjh61ryCoSh7djtt1ZzgV8UXeN22Yzptv7/eRlgy6VaTmEwYIt
	7Q7E9tR4tLTvJsjs/yRHaCJVwHQcxUBDoBz1BilbV7JAHeLxjrtg9VJFE0bfrwS1
	a5Wyxvo/Q78MM35ZjbP+iNzh5QBPyuYSqAP3BoWQeC7A4exzY+Y1sTdEZJ/8KMuq
	NK8kDA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59r1b776-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:49:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b878a8c07so23054311cf.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 03:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774608568; x=1775213368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bEIqsG7nb9uSNg7wYY5hsYCtaWJroii1vgC5sQZP0rU=;
        b=HbrBbmOPejwdWVkGV/pilAMeQj9EVptYggCKPWXbfh+CuU65hFKepOtruIUIOqu8Rw
         iUiAhXeV/D+1r9iM1r2kgN7r1Vz3pM4hRL8v3jLxs9XlIlEzvXku0i1NmoIlbHsYnocX
         ilNjedXCh/Zi1AUECwzTJBA6IGgkLDM9mSZsV45uJsmhpgDv1cm7BZTYHhB5TkG0v9pb
         3dKnG3pqXTfRX22qyPQ5Ada6SEGOLcUwfqbzfOaEnCdULBZBBizp8As/aJhEU2wcPVUb
         MPeY1e2SnB1YRjq0AMmjDrRBDaFo2nuBvokktJHTAGDZHdUoB3CyxjiFVe937FShvyX7
         WKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774608568; x=1775213368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bEIqsG7nb9uSNg7wYY5hsYCtaWJroii1vgC5sQZP0rU=;
        b=GUtcwQmzXxNUD0STPod/ajpyQlLKx4UgWlMbLEzoTWZXxkIx9SeAfYH1HnBaNX2XGq
         m1qrsA+HaXEgU+nAXVgCgdhxgllOz/Us2JX2n45+9Fjqlk82r+LC6z9aumh1aeevJBch
         WbPgCjf3FRSFgNvIFpNOtyQ3ZPSUzJ9Ec5sjtb9X9hStRRdTNuQaadGU6mDrigNovkW0
         TB0BN3G0qSAdyxR7eMtqv0Hr5V4qPBFnw70CSEP5W1VpHBCAkX5ASbnpZkqm+hrDKxJ0
         Ufos9WiWl4arbuw3JHV30xpDz6EbdsNgIIozZ4SbwHin+0rm9gRiffKIjjPOnpU4FTr1
         /t8w==
X-Forwarded-Encrypted: i=1; AJvYcCVZlmNieo2P79t9WHuIEbcpSQS/MspkfU3xN1S+xqi7SmGR6L8nPG3pWdrZZR1YwkkzswKPexeJDKkB@vger.kernel.org
X-Gm-Message-State: AOJu0YxHiIANZ7uFgDhXbWRC6RGEHxLjI9zcYLXBDmpEx1hYqel3pFq8
	A/0+EmM5oYThu8R1Pis6m5EOkJk/0d5dV8I8Ip0w9c9bXXEW1XpiTy1R8f3fZ3ylZjnWflvX6/Y
	SX8ZmKT8rQBcBFJM+FscVyb0csEy+mxdZYkVR2NWxkUJRyyx/3LfSNQB+xqMqOdoj
X-Gm-Gg: ATEYQzz+1sRESMxbRsNKDsO5THS3r99kvRdSh3LLTnxtV0sJpC/wSrgntV2DKTbQ+/U
	aV9LMo8re4zDZaQK1BrWcJ26FFUCvkZU/0Eh8ujRZfptOdg1syDCMy8OztFIaQpqQTw10/BrrPq
	/IIjOh/RlNE8h7fK+J1XLv7W/a+L7cJXd6yCPwxo2zxffeLxE+fye1F+pWs+Xi+8zHNv1LtWHCX
	GCd9mV2XiFS7WQZWb+dlRzjZHS3mtHqCphRnkKGX8Bv3z3IqfHAD6O66lkcemE5HFSFKj9paotR
	5tFR+LKXoJoLfM6pXGkcU77rC+va59DJGVl05eB7dNNpLWVziI84Uc20YdlArPk4YWGp7X2Zsv/
	22wiMo1lnJYoIMSuiOMCO3q5jSc+TELgnCoMfAK5m5hM4qrkgtc4=
X-Received: by 2002:ac8:5cc7:0:b0:509:44c3:5ffa with SMTP id d75a77b69052e-50ba3976808mr22685271cf.52.1774608567607;
        Fri, 27 Mar 2026 03:49:27 -0700 (PDT)
X-Received: by 2002:ac8:5cc7:0:b0:509:44c3:5ffa with SMTP id d75a77b69052e-50ba3976808mr22685031cf.52.1774608567122;
        Fri, 27 Mar 2026 03:49:27 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:94ec:a3a:baff:9151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e5f0sm14989445f8f.4.2026.03.27.03.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:49:26 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 11:49:10 +0100
Subject: [PATCH v3 4/4] gpio: timberdale: remove platform data header
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-gpio-timberdale-swnode-v3-4-9a1bc1b2b124@oss.qualcomm.com>
References: <20260327-gpio-timberdale-swnode-v3-0-9a1bc1b2b124@oss.qualcomm.com>
In-Reply-To: <20260327-gpio-timberdale-swnode-v3-0-9a1bc1b2b124@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3779;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Kmsr3j0JE36Tm/+YyuAC1ZvyKLbnbUPzhwV7mlwOZjQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpxmCtcnpfO7LtQi5rWAatC8lo09H/UFXOYIdDF
 R39MVbvRACJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacZgrQAKCRAFnS7L/zaE
 w9+WEAC0lP/aZiH6Lq7TrN6XI4e+/EuNn7pOVi757ejEmx7PRKrcHYgMwarY6USiN64YLd1FUTo
 eSA391o02ii0b1m9vucejM1gf1nFUXPxokPFPQkL4+TSXxUdLsX3v1TM44p4ptRXmTMRH1UYmN0
 X0rUodFodjxP/VJXxJBcQd9Iqd7c5Ma+Ll9csPoNuo/nTLiIdRG+Zf46SwUiEcrZz4cdrid+Omq
 3ts8vZsSnVKps7A9v2mdlJ8mNhGPms59su3nUSXIenxlDGqHK0LrQTlsS+zfNWtsK0D8cC6NlaH
 zeaZK4sL6/klSQZBi4DMKTdyJ77qwDCw2WQG9BGwpW7POlGumK9QagFdxTwJpJuS9Ep+2F9CQFB
 FhsgiUGQHStytrrT1kyjZnIRhaFKu0BgjfOHoY/6xjVfmuC6CE+n+A+BKkU25vC7nEV0mGa3b/0
 +DElPLuUB+RXgBxVgw2vCrKufZoCTfI0S4xcb/S4zqYBRBI5YkfRz+BJwxtCd9V572ODN/h1iWx
 kD4/AmauxpxTLSzl6LdmhP9mJhd4G5W4A20E7KEDJxiRPACziiwBaDUcaa1v/nZTHdSDXCytDS5
 ola1FyOj389FtnV0tBnQ2p6fFXys+a+EjkVosYdZJw1IBVtCuuv9jiqyVr310epO70WWFED5jp2
 F1ghMHnz9KViwTg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NiBTYWx0ZWRfXw0JozNa56Uan
 ezEOl9HSMpf3cujaX1dTMag7nw75m7KuMcJvz4pObSI2vrWS5UroKnHmFI/daAcdWKtecC94ezd
 qDzQkan/EVcGF5J+ifctWXeo35GAf+Yjx+9W12aN0PrkLAkQ55c3xswqd+Vgw3QcyDupznF5Yoc
 tIkyZWGWvKsrmRBmeccZcd4UqacbzErOlYeex4RSA6/L0SJ2O1uhakfjvNgBcQ4b7wXmUNlqcZG
 EATP5yIHW1uS2PE/LjxwBkOhnYTPHeHUhG9KvN76NMrnH3vFXUvXKG4tjeNNI1CgZyCqFAqFJx/
 vXujmQUo81nK7xmobifudavutnhQVCbALc2FULIYhGSyiPxqWaaI9Amtp7s3yYcN9wCI6rfWoVy
 LLBZrwE45kaQqc9CsjXOvP73MkVqs7P+LoWnhAqGI6PdR00goz8IVC1Ya78afFuYEiLHhZCaIpS
 dEx/LhtjT05vTOMFulw==
X-Proofpoint-GUID: UzipocYyq5J_yLyvnN4DTy05AN1dRHGL
X-Proofpoint-ORIG-GUID: UzipocYyq5J_yLyvnN4DTy05AN1dRHGL
X-Authority-Analysis: v=2.4 cv=JaCxbEKV c=1 sm=1 tr=0 ts=69c660b8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kr4-LvAjgXvljQpeuXMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270076
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34252-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 398D23430FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With no more users, we can remove timb_gpio.h.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/mfd/timberdale.c  | 17 -----------------
 include/linux/timb_gpio.h | 25 -------------------------
 2 files changed, 42 deletions(-)

diff --git a/drivers/mfd/timberdale.c b/drivers/mfd/timberdale.c
index 0ab3da3d6818e2108694dcf73f32184a167b701a..e75e1d6851abe0d68d7a8089aad561845d4f9339 100644
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
@@ -178,13 +176,6 @@ static const struct resource timberdale_eth_resources[] = {
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
 	PROPERTY_ENTRY_U32("gpio-base", GPIO_BASE),
@@ -406,8 +397,6 @@ static const struct mfd_cell timberdale_cells_bar0_cfg0[] = {
 		.name = "timb-gpio",
 		.num_resources = ARRAY_SIZE(timberdale_gpio_resources),
 		.resources = timberdale_gpio_resources,
-		.platform_data = &timberdale_gpio_platform_data,
-		.pdata_size = sizeof(timberdale_gpio_platform_data),
 		.swnode = &timberdale_gpio_swnode,
 	},
 	{
@@ -469,8 +458,6 @@ static const struct mfd_cell timberdale_cells_bar0_cfg1[] = {
 		.name = "timb-gpio",
 		.num_resources = ARRAY_SIZE(timberdale_gpio_resources),
 		.resources = timberdale_gpio_resources,
-		.platform_data = &timberdale_gpio_platform_data,
-		.pdata_size = sizeof(timberdale_gpio_platform_data),
 		.swnode = &timberdale_gpio_swnode,
 	},
 	{
@@ -532,8 +519,6 @@ static const struct mfd_cell timberdale_cells_bar0_cfg2[] = {
 		.name = "timb-gpio",
 		.num_resources = ARRAY_SIZE(timberdale_gpio_resources),
 		.resources = timberdale_gpio_resources,
-		.platform_data = &timberdale_gpio_platform_data,
-		.pdata_size = sizeof(timberdale_gpio_platform_data),
 		.swnode = &timberdale_gpio_swnode,
 	},
 	{
@@ -583,8 +568,6 @@ static const struct mfd_cell timberdale_cells_bar0_cfg3[] = {
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


