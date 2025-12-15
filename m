Return-Path: <linux-gpio+bounces-29565-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3574ECBEBAA
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 16:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D8C7D3011BE4
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 15:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 250F62BD5BB;
	Mon, 15 Dec 2025 15:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GHxT/2B/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hu+wZ9kQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8CB29E11A
	for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 15:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765813597; cv=none; b=n4IjXvYGaJSaUv0Yt2V6HMHrud2QTE7K0KPrMgGcJ0zj8fg8TFSgG1JOe7rhpaWKE7+mnKSja6A1tjMuwav6FtJ0CM6/qGDu3IQ/KSnG1ZyZi5sk+JKXb5LQzVciuQMw5pnGkVvdJjmy89WI1XdekC78HYyc8QAdFG7V0LQRAjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765813597; c=relaxed/simple;
	bh=i7HTV6k47P45ObdvvxS7eMjZZQEjI6MJNjKdvk5f+FI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WRcC+eBISrlESmDZ6FDxlsLhUzdYql6BVd+2slz4PTpkgSiZnfop9XPodVg/hDrAPsjQ9KD291CS7fhSzYsx2mul4bqRpSFB/NCgGnX9dMyvuNeBtgTO69wfC13+lnZjQuAJKnAfvAGrZ+kI7I0OOG3vwO+iXAa0n1rKcmj5ZZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GHxT/2B/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hu+wZ9kQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFC5LsM367095
	for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 15:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VN9hm8flaXJlAMoKWsCfoolm2x7byHy2J4n
	I/XIKGkI=; b=GHxT/2B/vp4ORFiWD6ugwf+7jBhquCwUl6HOfG6iwchwrWRPZbG
	SjHUmZcaqNgMADgoBuXqCxh3ZPFM3j9K2kBzsBaC134QOpCov0FYmmhqpwetFpXQ
	NfhP2xtc14+QlSEd00XQczfjI4SGGzg9Fwh7uocNGoIDRAoOBekPhYtHkfs+Rumx
	BiFXstgKJH1sgmMOacblHXOgmHK0X3ztWwHkBoOPM6nioanrz/l99iz0nF2AICtd
	yvh7LmRyViS9/0knxT2C5RPxyslH77suKVUHMJUieHJ8znJJcHeyA+EJQ28Ha5zq
	iEJlhfp7MckR5Wn+TX7CTvDVqCdVCghYweQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2j1c0n8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 15:46:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1d26abbd8so76821161cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 07:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765813595; x=1766418395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VN9hm8flaXJlAMoKWsCfoolm2x7byHy2J4nI/XIKGkI=;
        b=Hu+wZ9kQM6nMOexwDfeCTUVHtvAeYEjmGl3bMOQ//SMnU2OMoTXHYt3uOS7M7oOJXt
         NPzXpx/1upiwjN8juk2Tc4zr0Bndm83M6p+lzsI3fvW2v3ozLRKhaeXdJLNXQrSOOFFL
         MMX9kJnxJkM9zaDaN6+GmRMYdWcoHrHbIuZAXW5mtzVJ2lc4ualSf+ehj+2EB3habYNr
         Sr0LXkg0R3TLjg2izE+B0pw85Upp+fp1gui0cbwhKx+hbfisZVijwO74ylgqDLEC1Z7u
         b7KaeDq2PgB6xHvBXJbR+fObnNcNxokZbjrWJO12S1jvi7bsGjNmemZSRCK36syjXN5n
         7N9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765813595; x=1766418395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VN9hm8flaXJlAMoKWsCfoolm2x7byHy2J4nI/XIKGkI=;
        b=seBXIxq+elzQnmgPRhPY3SFphKuxJkeDmQgL99CR0aKq5yGjKtKgsdQp7PlNjCUYRn
         1sza/F4qAzgv/wH1XGnyw3vBRNB5T9medENN0M0ZbdJsNICo9LX7gsNCTc8r78W0asrr
         NCUnbONopw+eLubmReIW0BIyoVG77ykVVLbHz+CMVHnX3jW44GykeHk88YClGdrbZbqK
         ozHj2a2QxC3n2nlCVcct4Hj1zZYe8fLT4wAsAslBMlsSLrrAe3k4dZ7fk+QJqxsaOwLL
         CdEcGoU7t1Mjs0t7odELB9mU47IDuCegAGhWkpRGD/v+dmzURneEV1uxQgiPsDNKOSkz
         71Rg==
X-Gm-Message-State: AOJu0YzPEuSlGn4Q0aGH5TcKxY6Ly+bd8AcpSh5ycyHZiHI36B8YYlw7
	GWyoPKr76AUhymcHCXYPXbjRFKKGkfR+CnvWCg5hO/iIDyVOBLYwqBjVFeoyw5er6/yP1L1HvTo
	qiCP0ltqgzcdJt5s7gDiS7aF+G2hf8TwwPPVkstW9OFyWQgLOnq1tLpb/aXTZjCYm
X-Gm-Gg: AY/fxX5Ebs+3+Zg+p8gIYwC6wlSURAtXm260Mb6UzbasrPRKOkugGMvKq5dfpztcYvS
	VzvHMh5W+4JB/WHQFyYQs2QEv6BTu58iddq8G9LhQMiDAWdTJQIKokXLE07tnWl4IVnhuSB0mpf
	FeHCZjFNfJ4XhHOXvJARlmmGS15uOMaMnCc3yx6eBV2tDS3zU4dPQU/L+RFSn8DBws78YTKAzsB
	uYB2/hUQ461Ut65dqONz4SNPcuQCkJQRRv4YVilkUMw4NO0DLUMLnOjtl0Q5NyNHt3nPq6X3r29
	ftiwWbbTClNKXE/NZEFqe1In+ZknCX6cVmxE3Cv7gA5o6D1nPWzvkuTvoEAIGPS6G+gxjZ6vFO2
	x0O5hr+4tX3gpKb4YG/RsZjTqCHNV7L9W
X-Received: by 2002:a05:622a:130d:b0:4ee:1bc7:9d8d with SMTP id d75a77b69052e-4f1d0467029mr119416781cf.17.1765813594582;
        Mon, 15 Dec 2025 07:46:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzwhYBddmY792geA2ZrLUAETvcShHFsQm73K1o17VpiJkUAlh0wB1C4+D2At55N2iaoYXOFg==
X-Received: by 2002:a05:622a:130d:b0:4ee:1bc7:9d8d with SMTP id d75a77b69052e-4f1d0467029mr119416291cf.17.1765813593925;
        Mon, 15 Dec 2025 07:46:33 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:9230:746:c30b:f2e5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4af065sm71408105e9.6.2025.12.15.07.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 07:46:33 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] gpio: swnode: compare the "undefined" swnode by its address, not name
Date: Mon, 15 Dec 2025 16:46:24 +0100
Message-ID: <20251215154624.67099-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEzNyBTYWx0ZWRfX5KghIv8v3cRW
 XrwT+myfUDVpn0N6d6ykjkyvIp/bZZ8jz914pg7DT/BnH0hHLaA3z2jamYCT1sP7eMx51gZwLhi
 7KzCbNjBAht074ojKGs+gkT0Nedx/Hcz9Nu8GobF98Nl6ueInpVNqlNu/ddyjJL5wpb1RX/XlBg
 bkajSsXO1gla0Ygo9Z71WceO/+xA0Mr85CCu6NJ/LdzRORBCV5iBcQLw930ihf8RSVKtcedCk62
 NVGAlhghpQqfvN8Bzf8mosqpRwcW3mX9RidjTRLIkeOezs3EQg5dkA/ZLdgKTUpy3cKhQX9h9Lm
 6Tm3ySqfFSFPM5dhLXx4zorTIq3q5Mr1CDJdqP8PPlEY+0PaewXW00NIgSz16wqk1LdF4ZyFvSI
 IpfSklf5+kbGs8f5uPXI4MFxVbYaHg==
X-Proofpoint-GUID: xj_DHtwk9FRXyIzln6tSr0yPJhnIV0qi
X-Authority-Analysis: v=2.4 cv=ceLfb3DM c=1 sm=1 tr=0 ts=69402d5b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=esFB21bSQ0nGF8Mf3lgA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: xj_DHtwk9FRXyIzln6tSr0yPJhnIV0qi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_03,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150137

We know the address of the underlying remote software node referenced by
the GPIO property (if it is a software node). We don't need to compare
its name, we can compare its address which is more precise anyway.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-swnode.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
index b44f35d684590..54bad9e88fe5c 100644
--- a/drivers/gpio/gpiolib-swnode.c
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -18,19 +18,18 @@
 
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/property.h>
 
 #include "gpiolib.h"
 #include "gpiolib-swnode.h"
 
-#define GPIOLIB_SWNODE_UNDEFINED_NAME "swnode-gpio-undefined"
-
 static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
 {
 	const struct software_node *gdev_node;
 	struct gpio_device *gdev;
 
 	gdev_node = to_software_node(fwnode);
-	if (!gdev_node || !gdev_node->name)
+	if (!gdev_node)
 		goto fwnode_lookup;
 
 	/*
@@ -38,7 +37,7 @@ static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
 	 * primarily used as a key for internal chip selects in SPI bindings.
 	 */
 	if (IS_ENABLED(CONFIG_GPIO_SWNODE_UNDEFINED) &&
-	    !strcmp(gdev_node->name, GPIOLIB_SWNODE_UNDEFINED_NAME))
+	    gdev_node == &swnode_gpio_undefined)
 		return ERR_PTR(-ENOENT);
 
 fwnode_lookup:
@@ -139,9 +138,7 @@ int swnode_gpio_count(const struct fwnode_handle *fwnode, const char *con_id)
  * A special node that identifies undefined GPIOs, this is primarily used as
  * a key for internal chip selects in SPI bindings.
  */
-const struct software_node swnode_gpio_undefined = {
-	.name = GPIOLIB_SWNODE_UNDEFINED_NAME,
-};
+const struct software_node swnode_gpio_undefined = { };
 EXPORT_SYMBOL_NS_GPL(swnode_gpio_undefined, "GPIO_SWNODE");
 
 static int __init swnode_gpio_init(void)
-- 
2.51.0


