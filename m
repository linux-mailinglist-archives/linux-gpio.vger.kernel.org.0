Return-Path: <linux-gpio+bounces-30345-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D0BD0A6AB
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 14:29:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 41D0530AF55F
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 13:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40B935B13F;
	Fri,  9 Jan 2026 13:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oCrtvARm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y0VqHEs8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CED2DEA6F
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 13:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767964119; cv=none; b=FUqb9HBIFwUOzsJy35kMD0mDZ/uR98WwjzRtTpCx6wJTNti55nwbdGgzg1A7KVfnSYWr6uXIVva99gZ1RIhzGtJGOF9kk+zXe/jLgSG3hR6m3T7IeLGXjUaVEro15P6DB0kpb/hknPBHAza4L+fFlAmw8uqeD01ehBVAqmyC7+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767964119; c=relaxed/simple;
	bh=ejRlnFkx8oV4uZJNEJppKX24INSICLo81zD+mi1j1Nk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fWM84NA3Qv6OJzPgz0uS7CGN7KRoMhlpzrkqx/Jzc2oysbKEh8AAG9j8gA19VyOcMKIqKyc85tvWMMngvdFV/s+y0oAZR3TqJLUMrT8UwLEbXmsfYt8TJnqtiA6giwdsksi/i3jj8KxVTWAGNpgcJ+LJcB6bWSyzJ2CbJ9+agHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oCrtvARm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y0VqHEs8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099NY2V3324857
	for <linux-gpio@vger.kernel.org>; Fri, 9 Jan 2026 13:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FuH+O/FoejttwuGxuzSH5M34uWVfsmXJtgl
	MrClXvlA=; b=oCrtvARmfmpLRldrL9tSKxjrr1fElURwLZTtXnjxKIna3OChoR9
	V+exbRIeQmGAx6LVt9aLpvUj1TEt8ZI3zvzf+k56O0aa+Ugpn//qsF1c3CkuixZ2
	8zkgctHOZIHY1BrNQUqpAQUcUMFJe4NivhLRBxYyoeEt3QQPFlQgRZyN3JX0TpXR
	wpaP2nM8s1UajwpO35o6UAXqEBULqvnRfX9BIqVEec5bFELHqgak9A/JRXTaCTOn
	dZvmqnZP++LJOAuLn+VUnXPxOFl+qRfUEik2aMFvL1O0W5dm/EuGHqshEBKVeqWT
	++YhoxuGTHrYld6TVL4nxbO7JmrmHMc+9HQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjrd6hvn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 13:08:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c38129a433so1045287985a.2
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 05:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767964117; x=1768568917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FuH+O/FoejttwuGxuzSH5M34uWVfsmXJtglMrClXvlA=;
        b=Y0VqHEs8lilnMlObpZwM4oVq2o951wUvgAWKoABEzfkz+tubvVcp/VJss7pIknmD73
         wlG55SyLURD2Y+WpOpXvDPeL4efcYgiJehBrKXHsa2usVEHhutOX55TbOCDUv0ju+TnW
         KllztKhn8fSLgLB/67UYmVbn/BosHrBA78yz6frTDikckUzrcqu4nVXjWVLF3IFn5C5n
         Al+4n1u5P7zJMus1wnkfjHzEMzN6xIYdMPCIM38IWSF9ramnJqQoiB+/tsMnUc4qwizq
         YXe+9JwqoE2T6d3lgSk/JBSBdUURREkxX1EAVX0nm2zxoZrKkkTisdIolbMGoUMjgAnt
         eo2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767964117; x=1768568917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuH+O/FoejttwuGxuzSH5M34uWVfsmXJtglMrClXvlA=;
        b=VuuBhNaWHZsl7SZwjONQPbl5X7fDomDXh70LrbdqHAOTyYJmA84NLI4Hq9NaFlwiO0
         +NvMF5xPDY2z3AAHPcB77W5QJoTW94vPIbQDZV3ah1kFGUz02c+mmzV8dzVy+7jJQgHJ
         CuKh1i+Hxq3JDm5Pbrz4WTk+iNKvFb1l/n7XRipQn9+BURZAdg7ljQrZVENAoXF/uGCh
         C8sDPb38OOzYVurvI3mM9wsUei1JMJy2AVZNCmZJ9t1xqYS2hKRgp3M7GGXcankc6zfg
         mLAUosQ3acQoWnK4jcxl1UMUTw/gWcktDtEfFcefdgeLnize0lgrdD8ncyrXlJudiqNU
         GSwg==
X-Forwarded-Encrypted: i=1; AJvYcCVsj5BNG7X1hPh+CHN5CJN+W7e4FnHGhIbeEIWY2kVbCy8+2KWW5YhT4djCk+Ilq7DmOa/mqyZJ1BOn@vger.kernel.org
X-Gm-Message-State: AOJu0Yww09ix7eMsyiVVtgTnC+7LwrApNZE1F7/Cw5CEZrwdnOWQumFF
	r1RRFa2vVXxuWhHvkTwXzfTHg4AA4auLTmSWx3ZgT+FZxgrLXy4jtqQ84Wr1BgIcUbifL0QSi3P
	XT+5oq1G1PkK9m/HfU5Wnxx/rtgjVh0j645Py2VqWypa1JH+gva6CjPoQEYyIiYqn
X-Gm-Gg: AY/fxX6N89ZtdsAryKU26SeVi9+LthyAHXPaYcUTuY7b+UEmXt8bXsG/pCliZUf3hq/
	8/0pUSiivLJw/Xnn0VUNUr2wmIcJq+vgd0mP8dXmXGkPdtPNr3LtPzqjV9di0K1idPjTzoKKH+K
	yyyfVPw75rIcOEm9W9N7le3kC0ACXffeVDgqVcBcK0cdR8KhFgK+qconVVzmNO+OF4EVVKNJiI+
	xnSKYVGDiAUHKd19U0wjXwssA6ij5JPiQ3uCsfwNnW+Z+tB1GmU59irzOx8v/a5kaIICl/E6lo0
	2u4hymI/T7IyIpGqIg1Zzxjs17PPV7fDRtJGo/vCeJe9umW95ZL7vNSC99XiDAaDegyDBaW3cRw
	Mk8R61wCTnsVM+FMxyzsyjy+XXBgIcjRK0fZrDoE=
X-Received: by 2002:a05:620a:4083:b0:8c0:cbd8:20b0 with SMTP id af79cd13be357-8c38939cf33mr1354547085a.34.1767964116545;
        Fri, 09 Jan 2026 05:08:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOIa4aahvs+F4IA0pVzNSDreb10X1tJjxH3ASrtlZu/Erxr91L45K3ojN0lZLbwKJ3Z3HVYw==
X-Received: by 2002:a05:620a:4083:b0:8c0:cbd8:20b0 with SMTP id af79cd13be357-8c38939cf33mr1354540885a.34.1767964116050;
        Fri, 09 Jan 2026 05:08:36 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:4b2e:be6e:9187:bb3c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0daa78sm22465245f8f.6.2026.01.09.05.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 05:08:35 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Keerthy <j-keerthy@ti.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Michael Walle <mwalle@kernel.org>
Subject: [PATCH v2] gpio: davinci: implement .get_direction()
Date: Fri,  9 Jan 2026 14:08:32 +0100
Message-ID: <20260109130832.27326-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA5NyBTYWx0ZWRfXwK3Ic2Opn+1U
 N1uqYmx5WEspo7yuntQYAHwvY6IvIJAzrAum7QgVR9iseMwS1viJGFBMQ6VPrOuLe/tVGnGAqQc
 QdY12JRn4kiJyqG7bAucN23W4LtfddDZ3S096V+FtSQAV1lW6IDYf5ghj/GGxFWC2rnEZcj3fXL
 0vY+DVugiWvU8W3ReyGuMWeovEs4BjrzlGWEb8Sp/zh7EqyRslV7FOIIPk93V2MP12D5UjvqcKu
 H1mvyGs6am2foG/+H/2eu00uja/C4ug1ub/ia0woxNfSCfMTvZ0DkxChKRVdvzy1Z9okcW7jsm9
 xsqLms/7Zs2iRpodyR7uf3WDC8SetQb1G02PpNPkjfoklNpv0tEbIXPP1Ms7es7Qm6Jq3VunnUi
 fHTFRX2kOz7Bd8YUH3DEIbN5DOXHfiOiGyeenfmN7/vhHLLLCtqYfFXP8MaxjuyhxVEzN+C45sP
 Pgk5AbTkM2CVdHfXhYA==
X-Proofpoint-GUID: A1-tES9VOPgNVZ4ofPNvlqPZAMACOlps
X-Proofpoint-ORIG-GUID: A1-tES9VOPgNVZ4ofPNvlqPZAMACOlps
X-Authority-Analysis: v=2.4 cv=Xtf3+FF9 c=1 sm=1 tr=0 ts=6960fdd5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=fk1lIlRQAAAA:8 a=EpO4oYFsiGmJhOSXWBoA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=U75ogvRika4pmaD_UPO0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090097

It's strongly recommended for GPIO drivers to always implement the
.get_direction() callback - even for fixed-direction controllers.

GPIO core will even emit a warning if the callback is missing, when
users try to read the direction of a pin.

Implement .get_direction() for gpio-davinci.

Reported-by: Michael Walle <mwalle@kernel.org>
Closes: https://lore.kernel.org/all/DFJAFK3DTBOZ.3G2P3A5IH34GF@kernel.org/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
I sent v1 too fast and forgot to Cc Keerthy. Sorry for the noise.

Changes in v2:
- use unsigned int instead of unsigned
- Cc davinci-gpio maintainer

 drivers/gpio/gpio-davinci.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 538f27209ce7..97780f27ce5b 100644
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
 
+static int davinci_get_direction(struct gpio_chip *chip, unsigned int offset)
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


