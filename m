Return-Path: <linux-gpio+bounces-30344-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC58ED0A59D
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 14:18:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EA333147C5F
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 13:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF8235B149;
	Fri,  9 Jan 2026 13:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ADQ/1r3W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LxLNi40R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DB535B139
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 13:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767963609; cv=none; b=Ik2otxOD/tMSjsi6EyV+Tng0Ckb1SJu/8fhuHqNqHnfs2OVgihqEJ1qCKgb+enVNYMqGDkkmyVdCLEWgQJZx2BHhlzoyHJqsFXXSCfBlhybMikXVVLxG9B9uZIwzKmDs84cPZBDQMesRdHQ2TCKWT+PsY+7hMpzDXLOxCZCKKv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767963609; c=relaxed/simple;
	bh=AoYSof07LJuwx9YwgPOZwudYeFwPsQuiF7zswpVp0FU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h0zviyU1VitKQNZjO243QiXqkHrF/XW9ZP8zKcGUcCcA+iTQZdlszKbvGERlak8OWMK58CekOq/4n9HVNcGgC/gPZQPamqm2sA48lMv3eN59WZckDyh9MBkpPgafDkmActH0s4+b8S40Ujyfrw8svgROWW0MU6uJty1HIOJ3Cqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADQ/1r3W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LxLNi40R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609B2sSI1062748
	for <linux-gpio@vger.kernel.org>; Fri, 9 Jan 2026 13:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bLWZSG5D+HfIsLR/ch5F8xvfZM+jPpbhjuS
	a5UqrWj4=; b=ADQ/1r3Wy2Ioa9FKJrzXmXvQwZ2jyJxQNpKxxr668DYrMHxVbxA
	HpVKOOZKwKqjeXxi8t2sGjGi+POwhWEaTFBTGPGBGgj3KSiRwtTVTefcgYmHmcnU
	1lh23qXN1PS1erk8bw0uaFLBVnYeP7Sze0z2QBO/kExFp47bOj2nXNZqObaGDdqM
	JzowP/0a6Pj6wDEw0wDOOxXoKkLgV+t8CtsBIo3sfaaPiz25F1iSzuDVRcYeHQf3
	VMsOlaEP3ayVlOW9yhBVQnypb9GNCN+XmmMg+NrKOK5dpCPZgLfrXALBvzhG1g3J
	/hplhw0nSgXaFNXukG4hOhNf10ak+fDdQyA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bk0f689eu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 13:00:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8ba026720eeso1094244785a.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 05:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767963606; x=1768568406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bLWZSG5D+HfIsLR/ch5F8xvfZM+jPpbhjuSa5UqrWj4=;
        b=LxLNi40RnuRRbvKpAXnzXfIsS7aHHm42WcmrdYtQ15QQmytlRJ3/ty5BDqPSad2bmF
         dwKHlDgC/NDwR7ItESiYTlvE9QTHwk9OH8MNPv5yrLI4U3Z0IcseF4rTlVLZvTwUV86u
         PYhWMoP6LQCd7r2c0cxxwk9e1J3UXIkFwZGGRjh8bZ73+zmRiopuiIieto4BwaWXe7YP
         lfFmMZKyJ5/cD0TIZGtcMb2RD0HdZ1CaG0C7vHYuM+ufgWSU9nepDflSHwP5hacURpgP
         TLRp5WsiWYAQ774h7BmU0SduvgACqxuR7RYAqcRxrvwCMnXQd6felKsiJXGWxAsPAWmQ
         RTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767963606; x=1768568406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLWZSG5D+HfIsLR/ch5F8xvfZM+jPpbhjuSa5UqrWj4=;
        b=gU3jWRwiICglX04olK8jaATS5m/2+HVHWqXLmGRDHDLZA/xnSy8ebdgyKHIFCVmdWU
         efhG7AFa73OgIoVL4KpV6R+Wnz4iNnF6Q5scHHSn72AttGCrzNPgBPD8qfBVtILwewhZ
         z0eZ8YCkKbU0M9c5Jv/+CNa8tvDZMC+32AkWQW/sUXvWpOS8DEd7Bun4+mrnZaD8nvYa
         ruSHCLg+RjC9Z8jthBBY5lHfN8ZGzJ0IFP4XnV9/QB6zNmw94Qe3e9YXJ+4GArq2m/FW
         4ThiFdkVqN2hLWVBHKRXgOipHueVsonG2M+gHhukSDsqA2+FpI7COrqqO1+acy05/lWj
         dXJw==
X-Forwarded-Encrypted: i=1; AJvYcCV0b/V2iUH0xUQrM6zyJAqw60gLZbDeiJ2DYha5W5fxot7O82O5D/kPHxEouQAVX7ywn9HsPXBYZby8@vger.kernel.org
X-Gm-Message-State: AOJu0YzA7+xKkvH+blRK1oSiXE3FUUkqaykdsojY4B/Nspgo1VWOTk4W
	gwiWDFEZOSMvIUnsLqFIf76FRp3GQjORHu59puCWJuLVwLLPqMQnFLd3Ci3TvjcQLSHYB1IOaOa
	iZeEsCnhXs2i+ZFdnZoNZFSjEcRqDgkPA9/SxFjtXtKKfuwJO9yePvtZmSc5/xNHK
X-Gm-Gg: AY/fxX6qCIIdCJtR8/1VIq03lDDq+QurRoz208/Ux4wvJwQt45JXUgvTO6RBJZQTkW2
	hkdp00067tDj7oyOrStlgPDpGJFy5bV+tpv6tVYu2SQLc1KaF9lpaVqhXiAQZWtcNYruW0lPOKz
	86/0HHloGCC2eLNzg7oO0zZ/aFtLK2IFW5loB16k3n0JKibJbxAXD6sdSanX8cMMBw+I+tBY4wY
	3fTKfcFj8AIumekrZJCpthkP7sQ1ZC0OS5d9cxZUueEFGt6uOJmYN5JceN12E1FFrnMJ8jEq7jM
	2scnQYvd6Lao+/Q9JCyeO5m8+6M/Q9ERlVpQjulLbD/4vG6dKj5x3Kl7MZr2mwcuZhfO6CyZvAF
	Vb0WfzW0AR9M1FRyW94DP6lORqIta3tR8xEY2CQ==
X-Received: by 2002:a05:620a:2a01:b0:89e:f83c:ee0c with SMTP id af79cd13be357-8c389417b88mr1357495585a.74.1767963606240;
        Fri, 09 Jan 2026 05:00:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIgmf8j2GJD7tbApvV03PhCPHsk82hYfoXl1s/ES3AXfg4W8Dx3sel1eqkLhSsZQNVn/M/TA==
X-Received: by 2002:a05:620a:2a01:b0:89e:f83c:ee0c with SMTP id af79cd13be357-8c389417b88mr1357488285a.74.1767963605466;
        Fri, 09 Jan 2026 05:00:05 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:4b2e:be6e:9187:bb3c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0860f5sm22098938f8f.0.2026.01.09.05.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 05:00:05 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Michael Walle <mwalle@kernel.org>
Subject: [PATCH] gpio: davinci: implement .get_direction()
Date: Fri,  9 Jan 2026 14:00:03 +0100
Message-ID: <20260109130003.25429-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P803RyAu c=1 sm=1 tr=0 ts=6960fbd7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=fk1lIlRQAAAA:8 a=5SRzsYhri5PzZX4v2xYA:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=U75ogvRika4pmaD_UPO0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA5NSBTYWx0ZWRfXwuB2U+K598eg
 SGUQP8Pigrp60R6CCyCwO0O/sj/tVqQCsC3gIGkYXsW0kbzE7IBf4shuFLwwZPaZPytvrGx1o+g
 XDYwrp5OpgOO16dgp40XDY97xwbXUxS+RYYnt7k+tnAP6JzEVSoZtuGW8mVBayfeWDKrSmNnmJW
 L7TA+L+3w97qvgMHaeZyerIRouYAOVMJGYcS3/o11bgLZQbRTlXIlVKRd6SXO7P4ib1NUzA3zD6
 HskW7HedQG7sJCz3I5wg1oaeBTOBzcFiIIwdC30X5u+vDcz0YwIfgkMgjfAMg4jOEYh0wfST+ok
 QyWhK1+W8Wt3kmQQUmwZBfzFftEqsb5Q6wYBop7ynlW03NuyD/cQMVs6r5LjE6rnNM8ktSGfEwZ
 POvDt3UFlkbrwje2pe4cEbML9mAmDhn5hm6/I9Pc6bxdmyT6LFZ6677ZjErWOS9ZHnltc38oBgZ
 fz6E97wpR7HbakTlB6Q==
X-Proofpoint-GUID: mFXY706vgvKNj3OASI0ZhecGj7AdDJon
X-Proofpoint-ORIG-GUID: mFXY706vgvKNj3OASI0ZhecGj7AdDJon
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090095

It's strongly recommended for GPIO drivers to always implement the
.get_direction() callback - even for fixed-direction controllers.

GPIO core will even emit a warning if the callback is missing, when
users try to read the direction of a pin.

Implement .get_direction() for gpio-davinci.

Reported-by: Michael Walle <mwalle@kernel.org>
Closes: https://lore.kernel.org/all/DFJAFK3DTBOZ.3G2P3A5IH34GF@kernel.org/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-davinci.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 538f27209ce7..4604cda9a32c 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2007, MontaVista Software, Inc. <source@mvista.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/gpio/driver.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
@@ -109,6 +110,22 @@ davinci_direction_out(struct gpio_chip *chip, unsigned offset, int value)
 	return __davinci_direction(chip, offset, true, value);
 }
 
+static int davinci_get_direction(struct gpio_chip *chip, unsigned offset)
+{
+	struct davinci_gpio_controller *d = gpiochip_get_data(chip);
+	struct davinci_gpio_regs __iomem *g;
+	u32 mask = __gpio_mask(offset), val;
+	int bank = offset / 32;
+
+	g = d->regs[bank];
+
+	guard(spinlock_irqsave)(&d->lock);
+
+	val = readl_relaxed(&g->dir);
+
+	return (val & mask) ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
+}
+
 /*
  * Read the pin's value (works even if it's set up as output);
  * returns zero/nonzero.
@@ -203,6 +220,7 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	chips->chip.get = davinci_gpio_get;
 	chips->chip.direction_output = davinci_direction_out;
 	chips->chip.set = davinci_gpio_set;
+	chips->chip.get_direction = davinci_get_direction;
 
 	chips->chip.ngpio = ngpio;
 	chips->chip.base = -1;
-- 
2.47.3


