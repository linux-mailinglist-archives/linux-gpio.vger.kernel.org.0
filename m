Return-Path: <linux-gpio+bounces-23409-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C57B08EE0
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 16:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47BD9563970
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 14:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361282F6FAD;
	Thu, 17 Jul 2025 14:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjGN1Juh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9188A2D4B62
	for <linux-gpio@vger.kernel.org>; Thu, 17 Jul 2025 14:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752761424; cv=none; b=fhvXfyISU+96/BTTJRVpndlPMcSVBaRhXJdaDhx/m1z88jhudlHGZX2pZ+sOmEfF91hbieacS4btwLOv1eAeeVjOdUIFs5oXoiBt1fsKW6+YJ3iQTrwQN0Y1rmUiKbMfbJom3uTjifTzY1z72NJGHmj5J6vFA8BBJmNWLyddR/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752761424; c=relaxed/simple;
	bh=h5BQC9mByxJDY26rU4tjCerVWmoNcd7LyS6Ii5OUcRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tNUQSwGQTuXLBbFp3uz3zQ4WblkZY7hoDmHm7Il0KKnLtzMQBsfSxB90p1eXswl1fBUU66ukHa1RvSN7mXH0tORrToCUQgTjvi08yyehnX4UXfA9hf1BHk54o/iMFJ5ZWewoPUOMvDn7DmBkfGzafpo51xUtS4Cgc1jH/qk6Wc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjGN1Juh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCtQ8q032390
	for <linux-gpio@vger.kernel.org>; Thu, 17 Jul 2025 14:10:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CP6Jzze8Me6
	quyVOR0tDc8eWtyKvcOPnSUsVWLWiMeI=; b=JjGN1Juhbvrx2DCkK48QI84KfNJ
	h9kF6Hp/RYpRTMPYyB0QbwYnxcTujmCSxGb8xoQ9m5ge0BFuvYyljGg/diZTOyuU
	k+M0Fc29hkezz3K4Aw0KzN2K2TbWCQlFYXgoiQd4XUa+W3/TX0qj8Io/Rq2P5DBr
	Mffyp2YK/IvKy4MNTkS0FNYjub6IvCqMf7VZ7XJRMrJySBs8cC+dFu62vPiAintT
	9TtDtDKQfAunyjvekbt0hwU0mt2mDCCCD8bvFUjX53a74qWkdXxMCcv0M0+a36x9
	DLXIkvBAakMJA6AE/U7Exrn2t93ojlEfofJvQ8Kpdae9zCrPANLe0PS+ZPQ==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug3882rx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 17 Jul 2025 14:10:19 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3df2d0b7c50so10220115ab.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Jul 2025 07:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752761407; x=1753366207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CP6Jzze8Me6quyVOR0tDc8eWtyKvcOPnSUsVWLWiMeI=;
        b=ji0kE1XhtmCzgcdw6c0KQnso3PRy+uPDZBjak3Neqi7BPDHVf6kd+adK7qNrGxoZzc
         5Sc1odZZK/HMf8P/UwQrINVFzwtUHfpLEyhUWOfdv0fQz9T1NibXVGWVPNAVkZ+OVahl
         wsNxDoMq4XJt9k30lnM1AMUES67q1A/kThQ43FEfxne9eYfKj50GzFqzMfwQINvWZ+K/
         bDc7Iwsj0xaEhyWsyK2fK4B04nUhLrILSFHYSb7rTrYpnS8Ln15rImeZNzw+PGCNnk/7
         73IdaXhHmdvducBM1hUZdvg6yQK9aqQR1bmBlsg9k+F+uHadeJ+jrqHNTxK03DB/Bsrq
         m7xA==
X-Gm-Message-State: AOJu0YyjTd17twni3n9uaz5WdnaKdJn0bsWchUiZSBBTGlGaMiGC7BHw
	nG+/FiqDBc4ceiyjQd7Edd28Z8IHB/veNsi9jJgwvF/kse7fp9tA5LapzDEQSlkvOXweiJ94B0c
	SEFis8vkN2lwdcQA8RpTKLrG4RMRPPDyVg3bGE4Hg/6G47dNLedseNAvd/RlVIs6s
X-Gm-Gg: ASbGnctyO/SCh3Q7006tGPdZkkPMEVRjrMQ3k6gtIfBelTNHtPqA+8GF/ohr/kIYuzq
	a63fOe2+TFqv1uPG8q5dqfJH/KE+qumHCE6ShWOYVBswqR2LG7UQv8HUDnPpCi/4oigfNkGSSSk
	+PEd+fOOQcRMFSYdqgoAVAal8oiZW214YYVcf6Gk+WiFSZIblP2efk7Cg9p5Jdp1RGPj1zibRkD
	IegaDJdoqyBKHwq6MHWdU4HU7VDCfe9UyoV7fg77kCcVc5E6M+LX1gB5xjat3+aS8ui25s/GS8N
	pXfohJf5dWTiMvIHZJyKNVX/T/NFdhk8QQwmnyO20lVPkQxyvzwMHRWkbd9/5gJjFg==
X-Received: by 2002:a05:6e02:144b:b0:3df:29c5:2976 with SMTP id e9e14a558f8ab-3e282e65b56mr66949345ab.14.1752761406712;
        Thu, 17 Jul 2025 07:10:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwLDzrUusnEpv0HUYrf1+V/UgFGINfO9sa196Vx7jwWsOTv7qAHuTrm2DCVfwE5RzjtmmlSA==
X-Received: by 2002:a05:6e02:144b:b0:3df:29c5:2976 with SMTP id e9e14a558f8ab-3e282e65b56mr66949015ab.14.1752761406251;
        Thu, 17 Jul 2025 07:10:06 -0700 (PDT)
Received: from HMOMMER.na.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90c4dsm1391452366b.19.2025.07.17.07.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:10:05 -0700 (PDT)
From: Harald Mommer <harald.mommer@oss.qualcomm.com>
To: Enrico Weigelt <info@metux.net>, Viresh Kumar <vireshk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, virtualization@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] gpio: virtio: Fix config space reading.
Date: Thu, 17 Jul 2025 16:09:10 +0200
Message-ID: <20250717141000.41740-2-harald.mommer@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250717141000.41740-1-harald.mommer@oss.qualcomm.com>
References: <20250717141000.41740-1-harald.mommer@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDEyNSBTYWx0ZWRfXzcYpM+fcNgj5
 yR64Kkez48+pkwg0ClwAuloRP5R4xZ7biidvWOcsZvqz5mJ9u200Hc1f9H3Ma95+P3SGd4QjtVm
 MxTufXjlu4EFK9vbRZO1OiL4nCIcYYeJ3m15YIy6q7Q1iTHCrNE1KSOzxyCvR72o+iAJE1LdvEC
 xIGjbFr3/5s4lDX9aUbMh7cNgeaNfRnprc6bNYDnb/E6lLXLZMm1xNib93OD7xSMQDn/W7oDoB2
 WVxkD7biZ7TTPB+pPE9JLNMXcSiD/hAl1KsLSTP5XDXYjJGXEDN+VdRGcFLRXYu44ExYayWU/nb
 q77rucuE8hE0Mf81MKBY5YCiKNHeTB52Xny12SIxtfV6CS7QC8CRh4I9BwKjtqOb1RUR2r4V+BZ
 gyLfPYoTYyiJWc1CJ2c/kx9XIVOzXwB9iMDqBwPs+hZjYtKBJ7wT+6dhtF2PpX7D52ZIeb03
X-Proofpoint-GUID: -5CG_mpMJ0Y0i4oc54aAhY9Mzw8FW1PL
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=6879044b cx=c_pps
 a=5fI0PjkolUL5rJELGcJ+0g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=x8YHxakxDffKOoiCecoA:9
 a=HaQ4K6lYObfyUnnIi04v:22
X-Proofpoint-ORIG-GUID: -5CG_mpMJ0Y0i4oc54aAhY9Mzw8FW1PL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170125

Quote from the virtio specification chapter 4.2.2.2:

"For the device-specific configuration space, the driver MUST use 8 bit
wide accesses for 8 bit wide fields, 16 bit wide and aligned accesses
for 16 bit wide fields and 32 bit wide and aligned accesses for 32 and
64 bit wide fields."

Signed-off-by: Harald Mommer <harald.mommer@oss.qualcomm.com>
---
 drivers/gpio/gpio-virtio.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index 92b456475d89..07552611da98 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -527,7 +527,6 @@ static const char **virtio_gpio_get_names(struct virtio_gpio *vgpio,
 
 static int virtio_gpio_probe(struct virtio_device *vdev)
 {
-	struct virtio_gpio_config config;
 	struct device *dev = &vdev->dev;
 	struct virtio_gpio *vgpio;
 	struct irq_chip *gpio_irq_chip;
@@ -540,9 +539,11 @@ static int virtio_gpio_probe(struct virtio_device *vdev)
 		return -ENOMEM;
 
 	/* Read configuration */
-	virtio_cread_bytes(vdev, 0, &config, sizeof(config));
-	gpio_names_size = le32_to_cpu(config.gpio_names_size);
-	ngpio = le16_to_cpu(config.ngpio);
+	gpio_names_size =
+		virtio_cread32(vdev, offsetof(struct virtio_gpio_config,
+					      gpio_names_size));
+	ngpio =  virtio_cread16(vdev, offsetof(struct virtio_gpio_config,
+					       ngpio));
 	if (!ngpio) {
 		dev_err(dev, "Number of GPIOs can't be zero\n");
 		return -EINVAL;
-- 
2.43.0


