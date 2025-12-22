Return-Path: <linux-gpio+bounces-29787-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B180FCD5703
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Dec 2025 11:01:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E472A3002494
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Dec 2025 10:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5757C3126BD;
	Mon, 22 Dec 2025 10:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dn4Mv15F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HtbmcDpG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22B2280A5A
	for <linux-gpio@vger.kernel.org>; Mon, 22 Dec 2025 10:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766397704; cv=none; b=DfQDTTMOVxoe9EABt6NfbneEFYxbBnxY8OOx8gwdJk6ikY3GlqNwD+2uUsk7I6Rp0tuHP6JgVQudfchChWah4YgflaQw9Il8UF6cqA4FgLAc2gIUyjjGmXOF1axCGiVvNb+aQt7YcKthGt8ksTzKN6z79wKVsn/wtgWon0nfbIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766397704; c=relaxed/simple;
	bh=OqHedWdRA9ym7zNDd+PhhxDu2MrS1xv4QTzYUsBJBgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nvdlhxp9/TOV57NpXX6t17VW0Wt1iHRNvbN2GXlJiwJI8HlvNLhFmLGjtLwPfhVGBl0SNL3+dQzU7W1r8xUnIGaAWKqdd3bzq1GpzURq7vnWTl6Py3dJL7t1+loPTF7pkkC0iM1n83RMFIAYYQcs7rD4gMlMuk1XjOJiKgme7SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dn4Mv15F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HtbmcDpG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8hXLV3962870
	for <linux-gpio@vger.kernel.org>; Mon, 22 Dec 2025 10:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ivclPZ9+7tXkAG77d2CX6IaNMBqBxCJ5TBU5QlnU1vg=; b=dn4Mv15FfJIEPnpp
	TL5IiWPSvk9sp+DG+DSGazlkJtw5XMouMm85YrwAIBBIIbpU3KAM5Tly4G9j8mTq
	lDMmNLi2SA51hueGhaSR8WumQenWUHm6bJSsF9e+W4hJDtKen90OY9x61bwWd3qI
	Kt9RhFo5X5ByDVSSWCshdvAvELoG37jBsjOD1TLZymPgibca/+4eW9HHB/eMeYUA
	GTNM7mIbUQjACIq9dZZ0H9kT90o5YFs04+YNg4Hja7luYbigDR6wCqsDXNkjjSjK
	2scgR996ePzskB83+e8ijRP15s8d7TWZVS7CvFqx84VoMjFIYn/8SvQ+KagiWIjk
	3ww0Bg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b6vk6haqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 22 Dec 2025 10:01:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee3dfe072dso99874511cf.2
        for <linux-gpio@vger.kernel.org>; Mon, 22 Dec 2025 02:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766397701; x=1767002501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ivclPZ9+7tXkAG77d2CX6IaNMBqBxCJ5TBU5QlnU1vg=;
        b=HtbmcDpGR2rQ5fIc77qKfnSKbt590AncalRRN3wUTD5vJhyI5NDX3Jjmhq37ROtACS
         ud7sLkT77kdkJ9KKdriO94xDaWi/x25timKKAw6IFdaeM0BUP84jVi540E5fjj0D0kpN
         zTaAA+YOagdwzPKyXxh8rNPqo5TPPHWbdnFvYL2+2LdGux0Mb9DHiN4NF/FyMg5myG3u
         Z9n2t5Fz0SZfjwDPUkxdqBX6L6qV8qCODcW7eZpRg+HAhUwCc9ijBHJfByeVUhCP25b4
         Sk6E4s+Eh6Fly2JdDtWV9XrBMiDXlRJR3Y5Fwg1a0egyY7ED1kR+H6RSS99mSef59EcG
         ZWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766397701; x=1767002501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ivclPZ9+7tXkAG77d2CX6IaNMBqBxCJ5TBU5QlnU1vg=;
        b=Whcy6cwzYpBRA1u4RJx/AZWvPtxJnRtbgW3dSA3oZ8/5mMzD0Q6tGqNIgsTB2paMOj
         IlfvSsw4vGFUUWNHBMMATUDx932pAPtDoPN+IclZeDl/yYK80rxUQzGGJJZ89JqA5T31
         ECtSEbihrw8gDzrlM52GpgKzfDHfrgS/zR8feqyLCj5iXkoq+H+JcJ22MtzB8t1rVjoJ
         1tJs1aYDPs+uZclSTvAFxa4Mvhf0kw9WGvgkWFDJTJ2M6CaMvK5g2VOMePA2/RhVZU+U
         bO3XcFiLGyurk0K192Ar8cOWcRVaFQkpPn72QDcSYZDQ/n/yKqR1eK2VPnOsIG4SXjcq
         XI4g==
X-Gm-Message-State: AOJu0Yx8brJ1TXwpC4LHS+oH4ifsy3Wc8ZC4hDqq+UXPLAgjlIccfXbJ
	BBHQtMSjCFqGmhC9QatcY/J3PgGfPpp0WSTfoVQ8Uz+kE5Y84I5+6yRQ9SHanZa7WMnzXtV/Uvv
	qqBMe6yL27+iboA2lGSel+P/aktc54+gn+8cCxQUTF0I17sGqfxM0gxZDpxQhc5lu
X-Gm-Gg: AY/fxX5Q/f5CYPFkTJY8VL1Mr4zbpyBnQUm7TFTTRUOkIetgLEUPUeT4PlGgGAUiG8n
	lM+Xy6larcud5uaL8JvT1VD16ZyZeSVKq5kTuF9xYlcNLL+lbXN9yPfjLysB54v18bKcTVwlDwl
	nhJq3Y5Mlfj6bB49ASvvGXDtB9bYvwsn0qTnEjslMSbJu4ZfG5L7xRJGNk8RvvS7C3kxeNj9WxS
	rwBtSZZ975TtG/qy1OZ/wsDJLcwUGOUHeVLqTeYOq8IqkOVU6dPNSukRs2bBkcTCsA5lO/0zTkI
	fBGLAZIyt1Bavq4rPGO2zwL9PFlXVdTDbBcg7SC9zs7XBEh/kKWVoEbdqif/M5YBRWP7+kJ69tK
	0LHS/xHoWCobZedFblYKBJnMxx4H2VG5rHdx35MFG
X-Received: by 2002:a05:622a:1f8e:b0:4f3:5816:bd8d with SMTP id d75a77b69052e-4f4abd97d0dmr156561871cf.62.1766397700467;
        Mon, 22 Dec 2025 02:01:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6gzZ5mv/nT7hYMmIxkUp6imgXoYjQLzF9NQklV2tTdBBM5dgkY5uuW4BC6tI8vS0X6Djsrg==
X-Received: by 2002:a05:622a:1f8e:b0:4f3:5816:bd8d with SMTP id d75a77b69052e-4f4abd97d0dmr156561301cf.62.1766397699880;
        Mon, 22 Dec 2025 02:01:39 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd86:6812:7564:9961])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432613f7e6esm8174665f8f.21.2025.12.22.02.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 02:01:39 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 11:01:26 +0100
Subject: [PATCH 1/3] gpiolib: allow multiple lookup tables per consumer
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-gpio-shared-reset-gpio-proxy-v1-1-8d4bba7d8c14@oss.qualcomm.com>
References: <20251222-gpio-shared-reset-gpio-proxy-v1-0-8d4bba7d8c14@oss.qualcomm.com>
In-Reply-To: <20251222-gpio-shared-reset-gpio-proxy-v1-0-8d4bba7d8c14@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4564;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OqHedWdRA9ym7zNDd+PhhxDu2MrS1xv4QTzYUsBJBgo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSRb9DI/jlNEdf3qrEDnkgENS8HBVq9+pfIqax
 O+kiD6PecaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUkW/QAKCRAFnS7L/zaE
 w3ZjEACImO1/KvFJKGi0BYWWKzyzNVmSLTuATe0rWlPPmoHL9YCY7ikB0ZV/MofEcIJvGHtJRJc
 MoxbiGAc2rdOsBWVfjju1tKyccWg0FVqIjIZnspa1wc89NxwNvw7LFaWNXnsyr7UvlKVnpJO8kc
 tqJLkb9mx9Ly0kWGr6CiKMEmdPqHHea47cdZSXRDMk4fjfb6LYNSfS6pH9jx4rvodIafQJ1WRlA
 NOGmNsKoJIJuWLszaOnYy0dL/IgOJIo/5eYBrkiMK4IlPAU+F+OcpP05q1OqOkq70W57hQxfk7J
 8zVg85agIwBjs9KPITZQKLYvPy+CcJ9DGrCwNTKcyRRtFqBXeW6h3AMZQ2hJx3MYrczZZRYNoLV
 yLRd82rz/ps95RU6kBdp6HSRImAAMDCulYvDgaqZxNGeG5xDlA4HIKh9dr0xmAPEx8LQQKhY+mX
 KGSaNQKFHS4qAvKonBXLlvoW6t0oZnxwNjxfIRzMLWKrEZzU9s8z5Jy7r3bxxw1egfxk2aCpl3E
 dS2w/vNBrLFQrFG35hcDQZKVCTujD+XIbcsXi+juexNPKrebGVd8Qlnr55ugAEQpbXGckOft9Rq
 Ht2rtGMTdccQiA5NAdieRFSsKxnFUH+rU+PGE/gwoopnIfIJreBWmYTdHDe5uOGRaYba7srANPU
 haJgHpgNWlamtUg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: V1HOLgbSuM8xEoDX1njBIjNDj7Vxz3h2
X-Authority-Analysis: v=2.4 cv=cuuWUl4i c=1 sm=1 tr=0 ts=69491705 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sI4iXw2iqjXbcpY1YxEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5MSBTYWx0ZWRfX998B0kBzpz0H
 fLFgWmzHsRRofiDrvvPhEDZpYWPV6pwTuRTJATrRBUFUw/kiym1J582rWDqG3KGASENSIEYVrth
 pH9v6QTUmIYIJ67KpAwtizrQwbgNbK5QimqYQ1EvW2+306BOufCb6zt8dl8NsTXZL9rVNM7Ud2r
 cWeiLzvsNYtjzWNJtL2rWJ5fVPxTTP769mh7OKdW3H9roXp07G/p0ZFNZqnMklhBEURBtdl3OvS
 rOFSwb5k1MHLKxj+8Da0/Pn+D77Gid3vAaN1WQmwe2oEccP7GVA9te8HBEHMlnXojBBWhDy49+G
 6ZaqTzIsnUz5DiB+6SYXKlqeKOOYcRJbnaeWvMOWNTHEmXIn+xl4lIliN8DZDyeQTXlUGNpvQ+f
 afQI7oLSEuK6iUO6oq2xBIpTYXBeel8lM/ZmsIruQwrGi8jK5390omB7FLavN+TmHqrRNc+1G88
 EM0v4vbDyEAsI9m33SQ==
X-Proofpoint-GUID: V1HOLgbSuM8xEoDX1njBIjNDj7Vxz3h2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220091

The GPIO machine lookup mechanism dates back to old ARM board files
where lookup tables would all be defined in a single place. Since then,
lookup tables have also been used to address various DT and ACPI quirks
like missing GPIOs and - as of recently - setting up shared GPIO proxy
devices.

The lookup itself stops when we find the first matching table for a
consumer and - if it doesn't contain the right entry - the lookup fails.

Since the tables can now be defined in multiple places and we can't know
how many there are, effectively limiting a consumer to only a single
lookup table is no longer viable.

Rework the code to always look through all tables matching the consumer.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 91 +++++++++++++++++++++++++++++++-------------------
 1 file changed, 56 insertions(+), 35 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 91e0c384f34ae5c0ed61ccd3a978685d4f72e867..6d583b3b07bb5c3e5886ced53deca7cd02460890 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4508,45 +4508,41 @@ void gpiod_remove_hogs(struct gpiod_hog *hogs)
 }
 EXPORT_SYMBOL_GPL(gpiod_remove_hogs);
 
-static struct gpiod_lookup_table *gpiod_find_lookup_table(struct device *dev)
+static bool gpiod_match_lookup_table(struct device *dev,
+				     const struct gpiod_lookup_table *table)
 {
 	const char *dev_id = dev ? dev_name(dev) : NULL;
-	struct gpiod_lookup_table *table;
 
-	list_for_each_entry(table, &gpio_lookup_list, list) {
-		if (table->dev_id && dev_id) {
-			/*
-			 * Valid strings on both ends, must be identical to have
-			 * a match
-			 */
-			if (!strcmp(table->dev_id, dev_id))
-				return table;
-		} else {
-			/*
-			 * One of the pointers is NULL, so both must be to have
-			 * a match
-			 */
-			if (dev_id == table->dev_id)
-				return table;
-		}
+	lockdep_assert_held(&gpio_lookup_lock);
+
+	if (table->dev_id && dev_id) {
+		/*
+		 * Valid strings on both ends, must be identical to have
+		 * a match
+		 */
+		if (!strcmp(table->dev_id, dev_id))
+			return true;
+	} else {
+		/*
+		 * One of the pointers is NULL, so both must be to have
+		 * a match
+		 */
+		if (dev_id == table->dev_id)
+			return true;
 	}
 
-	return NULL;
+	return false;
 }
 
-static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
-				    unsigned int idx, unsigned long *flags)
+static struct gpio_desc *gpio_desc_table_match(struct device *dev, const char *con_id,
+					       unsigned int idx, unsigned long *flags,
+					       struct gpiod_lookup_table *table)
 {
-	struct gpio_desc *desc = ERR_PTR(-ENOENT);
-	struct gpiod_lookup_table *table;
+	struct gpio_desc *desc;
 	struct gpiod_lookup *p;
 	struct gpio_chip *gc;
 
-	guard(mutex)(&gpio_lookup_lock);
-
-	table = gpiod_find_lookup_table(dev);
-	if (!table)
-		return desc;
+	lockdep_assert_held(&gpio_lookup_lock);
 
 	for (p = &table->table[0]; p->key; p++) {
 		/* idx must always match exactly */
@@ -4600,6 +4596,29 @@ static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
 		return desc;
 	}
 
+	return NULL;
+}
+
+static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
+				    unsigned int idx, unsigned long *flags)
+{
+	struct gpio_desc *desc = ERR_PTR(-ENOENT);
+	struct gpiod_lookup_table *table;
+
+	guard(mutex)(&gpio_lookup_lock);
+
+	list_for_each_entry(table, &gpio_lookup_list, list) {
+		if (!gpiod_match_lookup_table(dev, table))
+			continue;
+
+		desc = gpio_desc_table_match(dev, con_id, idx, flags, table);
+		if (!desc)
+			continue;
+
+		/* On IS_ERR() or match. */
+		return desc;
+	}
+
 	return desc;
 }
 
@@ -4610,14 +4629,16 @@ static int platform_gpio_count(struct device *dev, const char *con_id)
 	unsigned int count = 0;
 
 	scoped_guard(mutex, &gpio_lookup_lock) {
-		table = gpiod_find_lookup_table(dev);
-		if (!table)
-			return -ENOENT;
+		list_for_each_entry(table, &gpio_lookup_list, list) {
+			if (!gpiod_match_lookup_table(dev, table))
+				continue;
 
-		for (p = &table->table[0]; p->key; p++) {
-			if ((con_id && p->con_id && !strcmp(con_id, p->con_id)) ||
-			    (!con_id && !p->con_id))
-				count++;
+			for (p = &table->table[0]; p->key; p++) {
+				if ((con_id && p->con_id &&
+				    !strcmp(con_id, p->con_id)) ||
+				    (!con_id && !p->con_id))
+					count++;
+			}
 		}
 	}
 

-- 
2.47.3


