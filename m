Return-Path: <linux-gpio+bounces-29789-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CDBCD5736
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Dec 2025 11:05:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 694373074824
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Dec 2025 10:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002153126BD;
	Mon, 22 Dec 2025 10:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o2+1r3KN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dHpO17W1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C188A30E852
	for <linux-gpio@vger.kernel.org>; Mon, 22 Dec 2025 10:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766397707; cv=none; b=M5Y2A95bWY7RNPshRuWWPNeWMvzcyybzO4+Isq4WxH42RRIBt0Pm3iN6RPPRXilQe0Tya5+QOFNS3FqD/IriN+tJwY5c7uPXPF4v+d9ISRB60BOfiaFrM7t7jYBbmi7SRjncTUxi9qZ+fz9W0jFX80Auxt2FlHxIXBM1KrJVpgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766397707; c=relaxed/simple;
	bh=zSx8WpjDsRV858h7FCxvPJSyX6no5aqsASmnYiLXZ4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h7hr8kpmFl3jKWLnhUPQzLcsdUNwzPQWX3x23WxJqZNH5UkFAGU3XF2Y7p205MW6Vmtp6OzVhIAoDDFj9uK5GmA9eDoMyVtUmpxslk3our8UmBtlpoPpqA2uf0MKucB13LoBqvamign3vcVaf54decdrGf6AyEvYdSWwsTvElMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o2+1r3KN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dHpO17W1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM7lfx54091253
	for <linux-gpio@vger.kernel.org>; Mon, 22 Dec 2025 10:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	deKGZwnEGuy6HeY4z4IFpGSqx9YafWG1O1S8CaouEC8=; b=o2+1r3KNxWx30otF
	X7yU//m8m/kiMK+ZO0+LsMTBp/v9trTSbxI15ZJQAhs77NbrxoLL9HrAlmEf8DjO
	p4iZGa0NQlJaOPE3x0qi2G4fLPzORJdphVwoR7l4AcnSa/45fa6IEEVnNuWjn5ZS
	J/wC+l0Ya6EzbHZZ+45Ixc18QAjA/ggEVk4FBfgMwr0Yp0DUDzSvqx2CbYcxEG9V
	0GXpizD15f/zLB0Lo0Dr2ZJoSxXxNflImbwuNI0NvWHOCloBJfp1jNEZJ3SSYpKG
	QOcPtVB5+GHgBgfd7zTFEQUWlNAtpxWKyBOp2PrAX+WQiVJ9lde0SJPnn/kyeD+W
	6wpIZQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mux4khe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 22 Dec 2025 10:01:44 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8804b991976so88733726d6.2
        for <linux-gpio@vger.kernel.org>; Mon, 22 Dec 2025 02:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766397704; x=1767002504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=deKGZwnEGuy6HeY4z4IFpGSqx9YafWG1O1S8CaouEC8=;
        b=dHpO17W1ysBOA+ntVXb73pGwMHFOBqXVSJVbQlYvoaHtJhMutxlL3sRvMQG2tZuiDa
         ic9OeHychq834SX15+H8uXWXfvnMSx0Epbf/vZlBlwQSa4r8zQSRiIG7cXxNkNESDVf+
         raYiFVRw+z83eGKLLi1xpxHYyJ6eI7yuHWKvdVMOfgdr2cnAd6OtWs9JY21pGJQ7FU+F
         FQ7Du2QNdwDy1zLcMLdpJAXKY96p46uvkqsYQcc5tClurq7J2y7ceyt+DgF1MTdcvoLM
         9envaiUoDQ0TMclhIHZhtaFBPn+97mGbhZVdT9kqtP3p+D6S6pWMhnm/r7l6pDTKeQZT
         ELmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766397704; x=1767002504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=deKGZwnEGuy6HeY4z4IFpGSqx9YafWG1O1S8CaouEC8=;
        b=mcBQaEmvZxrLJh055U8majbvUfD3QHimqhOQT/53HAYPokAuZVONukH11uBzfHju1S
         cYDJEovt4aiH4SoBjvg0WZyVjgW1MZ/jS41VRoZ0pMKterSNe/b0aKD3iismnGT9NePj
         S6TlEnoeAs1l/dBSJ+Fz3MFZoL3MvAn0qIe4FaDiz7uRPZK8LLUvd7HqkIOuLaW/MxJ9
         JWuyIgSNn9vPkfAfPOYaj7ktuHCcwWCJ1XHYNEi6Gdgi2B7iZXTWk8z8sdh53Ulqasxl
         YDRg5mvEAff9aBnVdT8hbzDMbzqTiCEgC59UjbxPOtL88Y0U50fHVF77GKh7y/BvaiP/
         yN1g==
X-Gm-Message-State: AOJu0Yz5EnUPVjEKAEaoUXj7pbaaRtX0OQpxqVKFoq/pMz4uZDGTA5/W
	dZSI0Kd6neDXDdLNHE5dLRvt0dIG2VAoLkXV6BuNCnXoM9HilbjCo8D9bRnS4VuOzrdRSYY20sN
	pswOZUfrmN8+Nm1CMiCRdZMTN/OApgATxmFilMu9p8c2MF66RwuYefC2/roPBWF0Eyb0rYpMl
X-Gm-Gg: AY/fxX6LPiARSLvYgiDAe+qQk42KAHR/yjxo9EM1PFqBn/lYCrpKebJ9y/dbRF+KsI+
	rqhkffCi3RLk/JwAxL6+kSGfO4c0QCY5rMihPQR/j/HmST1XIzWQRl/j79I5Gv8aiXQ4cwzd6CS
	N4tM/alCseEMTUlouZgne47P1buzY48mORb//SanEUx1Ez/7UQ2yrRccB6QT9sIbHCPv9QvRp/z
	vq57qjfzNsL0mz+sz5n3SEqVBFIE8194i1rY88hmJqyrwwPqCDzAsCdhGPbq4u3BVVhQId6Qo4f
	ncnUuq/gxN1ptQshtanvl/BuTZmrAxvIWek41lT+waUc6AxZjRXjaA2YAJfA0HCZ1S8QeTvjXmB
	jwuqKMFU6hN3RP4IgYOs44yWO29LpQVC23++yIh02
X-Received: by 2002:ac8:5058:0:b0:4ed:43fe:f51e with SMTP id d75a77b69052e-4f4d61fb029mr1325041cf.39.1766397703600;
        Mon, 22 Dec 2025 02:01:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAVYe55WuPnaOv9H+zNnX/8uHgI8UllPMU19v/u5GZ88+3ZBE1C2wvqmM1mO1AuVCVjOZMXA==
X-Received: by 2002:ac8:5058:0:b0:4ed:43fe:f51e with SMTP id d75a77b69052e-4f4d61fb029mr1324571cf.39.1766397702953;
        Mon, 22 Dec 2025 02:01:42 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd86:6812:7564:9961])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432613f7e6esm8174665f8f.21.2025.12.22.02.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 02:01:42 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 11:01:28 +0100
Subject: [PATCH 3/3] gpio: shared: allow sharing a reset-gpios pin between
 reset-gpio and gpiolib
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-gpio-shared-reset-gpio-proxy-v1-3-8d4bba7d8c14@oss.qualcomm.com>
References: <20251222-gpio-shared-reset-gpio-proxy-v1-0-8d4bba7d8c14@oss.qualcomm.com>
In-Reply-To: <20251222-gpio-shared-reset-gpio-proxy-v1-0-8d4bba7d8c14@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10280;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zSx8WpjDsRV858h7FCxvPJSyX6no5aqsASmnYiLXZ4E=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSRcAUDr7lOx6aSj3Iv71LNCP+QMj9/xGO1WdH
 AlR4KV+x8SJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUkXAAAKCRAFnS7L/zaE
 w0i1D/kBMZbEbfwrrKwjsjWMCI5mlD0UFGqCeS+THAXX9l03uxRunvZ+1+v+n3bBtILy0soZcue
 FtaQVnhqIxNPMxkUWzznsta+ii22HHEUjSF6s9XsPROpdP+vZdOWOZiCg3f2ItJSbsD9IlT3XyS
 rGAZh9Ov1k1IhbNRg6IocVjN5QrgAzXvbm8h3jq6Bo3bYFoGQGVlkfgTYQmgG95C0erOkMKFupo
 zJAtJzfX85cMdFPrzG0o+D6GBVoReNUQQ2b0NiMO0W0aPtZb++boWsugCkrVZ8sfk3QTqwWZDoR
 AjnqpVTNxgC2dt11cV8aDG5LxLYT4ge32qpjR3UC/nm6ecgeGUdeyz+KO+s0s1fOzljUhB1cjLZ
 Ey6xmIwz9tHoKW9skRfuLw1zenps3FV/5eChBABzU6h9CCcMFcMbRpKIr22E+2WHJMCWsiqASEi
 ec3HNKpgcPeRLd7f4pkLGbzfPJYJgay82z2EmPPalMXy0FtKcxJ25R37+5Qji0yPcQIId5R5q+H
 1oVRueYJy5LPN4R05Ff186NYCMpDv8Ue46aoD+cIjPegsvI0QtSnE9t4hYfFVwJSWrQnvKim3tb
 a86vPwkRF1D2xzCtDeSUq57RFvpeechJUb+Qm34DTZwGhzbto/3Rpp+ozaSiHX8Z52zvlNIvCBH
 1l3jTv1GRvTEwFQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: vxgxW0uOlBMo61GTNH-DQx78C5Y5hBnJ
X-Authority-Analysis: v=2.4 cv=EvnfbCcA c=1 sm=1 tr=0 ts=69491708 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=M5bBm4G_KRvUKlQqVS4A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: vxgxW0uOlBMo61GTNH-DQx78C5Y5hBnJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5MSBTYWx0ZWRfX1d99UuOo7nSv
 MpQKESK7ZmzWVG+App5AKU9RukG/sr4UzbdY060zSBpw5wBd0uiOi2o+QVvfxOoMqDYlWHak9GI
 8XV6V0rcU1bm8uwjrPOWu5eZxthi2IFg53nvBg3EnA6rxIDT76+Hw32jkZIN1iTIYD6s0rhb49W
 ry8OmS8jMwU+WOkPPhKNRnsNDcwmA8I698K216Cby6CvpNmhlw5EMdb1s7Dhiv71toRjaksF6gH
 q/qd2aYtm77/GuiqAnlPZWkodHq7ceW3P6J/zRinRLp75WxmQln0LRVaK+CJuE2yRwCDaatVGCn
 5PGOWIoOsByDAPYMztdt3Do6EZLBeUKeS1N0SQ8+ON5AzqQrz8tXqcSExcjsC2QUwYtmBxO/V2o
 rykDIiXQPu4+yUTFfuo9pO1KUvK3fc6XJ87fhvX6Ij4c4p8xjrPOJBA0eYfIFSenFd++ptAABVZ
 cFCQ/QorgN2jn6mfKBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220091

We currently support sharing GPIOs between multiple devices whose drivers
use either the GPIOLIB API *OR* the reset control API but not both at
the same time.

There's an unlikely corner-case where a reset-gpios pin can be shared by
one driver using the GPIOLIB API and a second using the reset API. This
will currently not work as the reset-gpio consumers are not described in
firmware at the time of scanning so the shared GPIO just chooses one of
the proxies created for the consumers when the reset-gpio driver performs
the lookup. This can of course conflict in the case described above.

In order to fix it: if we deal with the "reset-gpios" pin that's shared
acconding to the firmware node setup, create a proxy for each described
consumer as well as another one for the potential reset-gpio device. To
that end: rework the matching to take this into account.

Fixes: 7b78b26757e0 ("gpio: shared: handle the reset-gpios corner case")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 182 ++++++++++++++++++++++++++++++------------
 1 file changed, 129 insertions(+), 53 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index f589109590c7c6bc9c0c1828ea15ab9003846523..baf7e07a3bb887dab8155078666a15779e304409 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -76,6 +76,56 @@ gpio_shared_find_entry(struct fwnode_handle *controller_node,
 	return NULL;
 }
 
+static struct gpio_shared_ref *gpio_shared_make_ref(struct fwnode_handle *fwnode,
+						    const char *con_id,
+						    enum gpiod_flags flags)
+{
+	char *con_id_cpy __free(kfree) = NULL;
+
+	struct gpio_shared_ref *ref __free(kfree) = kzalloc(sizeof(*ref), GFP_KERNEL);
+	if (!ref)
+		return NULL;
+
+	if (con_id) {
+		con_id_cpy = kstrdup(con_id, GFP_KERNEL);
+		if (!con_id_cpy)
+			return NULL;
+	}
+
+	ref->dev_id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
+	if (ref->dev_id < 0)
+		return NULL;
+
+	ref->flags = flags;
+	ref->con_id = no_free_ptr(con_id_cpy);
+	ref->fwnode = fwnode;
+	mutex_init(&ref->lock);
+
+	return no_free_ptr(ref);
+}
+
+static int gpio_shared_setup_reset_proxy(struct gpio_shared_entry *entry,
+					 enum gpiod_flags flags)
+{
+	struct gpio_shared_ref *ref;
+
+	list_for_each_entry(ref, &entry->refs, list) {
+		if (!ref->fwnode && ref->con_id && strcmp(ref->con_id, "reset") == 0)
+			return 0;
+	}
+
+	ref = gpio_shared_make_ref(NULL, "reset", flags);
+	if (!ref)
+		return -ENOMEM;
+
+	list_add_tail(&ref->list, &entry->refs);
+
+	pr_debug("Created a secondary shared GPIO reference for potential reset-gpio device for GPIO %u at %s\n",
+		 entry->offset, fwnode_get_name(entry->fwnode));
+
+	return 0;
+}
+
 /* Handle all special nodes that we should ignore. */
 static bool gpio_shared_of_node_ignore(struct device_node *node)
 {
@@ -106,6 +156,7 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 	size_t con_id_len, suffix_len;
 	struct fwnode_handle *fwnode;
 	struct of_phandle_args args;
+	struct gpio_shared_ref *ref;
 	struct property *prop;
 	unsigned int offset;
 	const char *suffix;
@@ -138,6 +189,7 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 
 		for (i = 0; i < count; i++) {
 			struct device_node *np __free(device_node) = NULL;
+			char *con_id __free(kfree) = NULL;
 
 			ret = of_parse_phandle_with_args(curr, prop->name,
 							 "#gpio-cells", i,
@@ -182,15 +234,6 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 				list_add_tail(&entry->list, &gpio_shared_list);
 			}
 
-			struct gpio_shared_ref *ref __free(kfree) =
-					kzalloc(sizeof(*ref), GFP_KERNEL);
-			if (!ref)
-				return -ENOMEM;
-
-			ref->fwnode = fwnode_handle_get(of_fwnode_handle(curr));
-			ref->flags = args.args[1];
-			mutex_init(&ref->lock);
-
 			if (strends(prop->name, "gpios"))
 				suffix = "-gpios";
 			else if (strends(prop->name, "gpio"))
@@ -202,27 +245,32 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 
 			/* We only set con_id if there's actually one. */
 			if (strcmp(prop->name, "gpios") && strcmp(prop->name, "gpio")) {
-				ref->con_id = kstrdup(prop->name, GFP_KERNEL);
-				if (!ref->con_id)
+				con_id = kstrdup(prop->name, GFP_KERNEL);
+				if (!con_id)
 					return -ENOMEM;
 
-				con_id_len = strlen(ref->con_id);
+				con_id_len = strlen(con_id);
 				suffix_len = strlen(suffix);
 
-				ref->con_id[con_id_len - suffix_len] = '\0';
+				con_id[con_id_len - suffix_len] = '\0';
 			}
 
-			ref->dev_id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
-			if (ref->dev_id < 0) {
-				kfree(ref->con_id);
+			ref = gpio_shared_make_ref(fwnode_handle_get(of_fwnode_handle(curr)),
+						   con_id, args.args[1]);
+			if (!ref)
 				return -ENOMEM;
-			}
 
 			if (!list_empty(&entry->refs))
 				pr_debug("GPIO %u at %s is shared by multiple firmware nodes\n",
 					 entry->offset, fwnode_get_name(entry->fwnode));
 
-			list_add_tail(&no_free_ptr(ref)->list, &entry->refs);
+			list_add_tail(&ref->list, &entry->refs);
+
+			if (strcmp(prop->name, "reset-gpios") == 0) {
+				ret = gpio_shared_setup_reset_proxy(entry, args.args[1]);
+				if (ret)
+					return ret;
+			}
 		}
 	}
 
@@ -306,20 +354,16 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
 	struct fwnode_handle *reset_fwnode = dev_fwnode(consumer);
 	struct fwnode_reference_args ref_args, aux_args;
 	struct device *parent = consumer->parent;
+	struct gpio_shared_ref *real_ref;
 	bool match;
 	int ret;
 
+	lockdep_assert_held(&ref->lock);
+
 	/* The reset-gpio device must have a parent AND a firmware node. */
 	if (!parent || !reset_fwnode)
 		return false;
 
-	/*
-	 * FIXME: use device_is_compatible() once the reset-gpio drivers gains
-	 * a compatible string which it currently does not have.
-	 */
-	if (!strstarts(dev_name(consumer), "reset.gpio."))
-		return false;
-
 	/*
 	 * Parent of the reset-gpio auxiliary device is the GPIO chip whose
 	 * fwnode we stored in the entry structure.
@@ -328,33 +372,56 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
 		return false;
 
 	/*
-	 * The device associated with the shared reference's firmware node is
-	 * the consumer of the reset control exposed by the reset-gpio device.
-	 * It must have a "reset-gpios" property that's referencing the entry's
-	 * firmware node.
-	 *
-	 * The reference args must agree between the real consumer and the
-	 * auxiliary reset-gpio device.
+	 * Now we need to find the actual pin we want to assign to this
+	 * reset-gpio device. To that end: iterate over the list of references
+	 * of this entry and see if there's one, whose reset-gpios property's
+	 * arguments match the ones from this consumer's node.
 	 */
-	ret = fwnode_property_get_reference_args(ref->fwnode, "reset-gpios",
-						 NULL, 2, 0, &ref_args);
-	if (ret)
-		return false;
+	list_for_each_entry(real_ref, &entry->refs, list) {
+		if (!real_ref->fwnode)
+			continue;
+
+		/*
+		 * The device associated with the shared reference's firmware
+		 * node is the consumer of the reset control exposed by the
+		 * reset-gpio device. It must have a "reset-gpios" property
+		 * that's referencing the entry's firmware node.
+		 *
+		 * The reference args must agree between the real consumer and
+		 * the auxiliary reset-gpio device.
+		 */
+		ret = fwnode_property_get_reference_args(real_ref->fwnode,
+							 "reset-gpios",
+							 NULL, 2, 0, &ref_args);
+		if (ret)
+			continue;
+
+		ret = fwnode_property_get_reference_args(reset_fwnode, "reset-gpios",
+							 NULL, 2, 0, &aux_args);
+		if (ret) {
+			fwnode_handle_put(ref_args.fwnode);
+			continue;
+		}
+
+		match = ((ref_args.fwnode == entry->fwnode) &&
+			 (aux_args.fwnode == entry->fwnode) &&
+			 (ref_args.args[0] == aux_args.args[0]));
 
-	ret = fwnode_property_get_reference_args(reset_fwnode, "reset-gpios",
-						 NULL, 2, 0, &aux_args);
-	if (ret) {
 		fwnode_handle_put(ref_args.fwnode);
-		return false;
-	}
+		fwnode_handle_put(aux_args.fwnode);
+
+		if (!match)
+			continue;
 
-	match = ((ref_args.fwnode == entry->fwnode) &&
-		 (aux_args.fwnode == entry->fwnode) &&
-		 (ref_args.args[0] == aux_args.args[0]));
+		/*
+		 * Reuse the fwnode of the real device, next time we'll use it
+		 * in the normal path.
+		 */
+		ref->fwnode = fwnode_handle_get(real_ref->fwnode);
+		return true;
+	}
 
-	fwnode_handle_put(ref_args.fwnode);
-	fwnode_handle_put(aux_args.fwnode);
-	return match;
+	return false;
 }
 #else
 static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
@@ -379,12 +446,20 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, const char *con_id,
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {
-			if (!device_match_fwnode(consumer, ref->fwnode) &&
-			    !gpio_shared_dev_is_reset_gpio(consumer, entry, ref))
-				continue;
-
 			guard(mutex)(&ref->lock);
 
+			/*
+			 * FIXME: use device_is_compatible() once the reset-gpio
+			 * drivers gains a compatible string which it currently
+			 * does not have.
+			 */
+			if (!ref->fwnode && strstarts(dev_name(consumer), "reset.gpio.")) {
+				if (!gpio_shared_dev_is_reset_gpio(consumer, entry, ref))
+					continue;
+			} else if (!device_match_fwnode(consumer, ref->fwnode)) {
+				continue;
+			}
+
 			if ((!con_id && ref->con_id) || (con_id && !ref->con_id) ||
 			    (con_id && ref->con_id && strcmp(con_id, ref->con_id) != 0))
 				continue;
@@ -471,8 +546,9 @@ int gpio_device_setup_shared(struct gpio_device *gdev)
 			 entry->offset, gpio_device_get_label(gdev));
 
 		list_for_each_entry(ref, &entry->refs, list) {
-			pr_debug("Setting up a shared GPIO entry for %s\n",
-				 fwnode_get_name(ref->fwnode));
+			pr_debug("Setting up a shared GPIO entry for %s (con_id: '%s')\n",
+				 fwnode_get_name(ref->fwnode) ?: "(no fwnode)",
+				 ref->con_id ?: "(none)");
 
 			ret = gpio_shared_make_adev(gdev, entry, ref);
 			if (ret)

-- 
2.47.3


