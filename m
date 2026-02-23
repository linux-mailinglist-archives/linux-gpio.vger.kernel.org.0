Return-Path: <linux-gpio+bounces-32054-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNClGGCOnGmdJQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32054-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 18:29:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8585E17AD45
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 18:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BB2D83049CB4
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 17:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2A6330B06;
	Mon, 23 Feb 2026 17:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g4bEPcjb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bNolqhMO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D66E331213
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 17:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771867235; cv=none; b=FXG2RemWtDHFYeTsfjtMUfZHbjOiHSQksivDyTrs4aP3nmA9oLVKW69lxQMtiyvu9VgctqhaDqyVqnO0GrmhRkmZUybwY+9GvpXGc/VBlpyP4Lehu4sOWu3jHP1yWsrPgpHO8e3dCI8I8R1qO7oDiCoi7MhP9zIaMFlpCge9fxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771867235; c=relaxed/simple;
	bh=R5vyUoxzMKZBr/4OKZ1zuAgg1NQZEyG40i4c6aD1424=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KsF8cyOP0reI8QWnuE4zpFh7zGAaKC0yIcmTGmZmGqvKdn1TUFzaeGi2R0QQVeb5lu1c6J9b55dVu2/D8e5RvDC8kcD7QM0L6cdPxeypwPePgZXmYKdLzh8t1Ztf98qQnktJ2UUrJPghJ7fk5dQ8RLZZB60ANQf+8CCLV5S0crY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4bEPcjb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bNolqhMO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAWD8d3732709
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 17:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mUgVAINOURDQvrKq3PsyBB4PRlaSvdw0zwk
	bxHvqzps=; b=g4bEPcjbuodmPKv9OPbx1ns9rryZ/Imb78+aj6SD6O2bcaD9NkK
	JjtDLiUdxwuyUp4nHyGT+knUX5bjjOlz6kgkNE5GedzNW4Nzj4A+AP9+BeUjl1wr
	JuxG8ABZcNr/GYoIjCRIske458Bcogp2gPmdw/qvGsJ4JgAvyRIwIpA59DICQ5pe
	CS5I/zoMX6X+0UOB4fuzbyiH0w+A/6oMnhvuYoIV/ScGMHOQquPpSyI2k3SQffTT
	Z6VyRX6rVEp9SAwAfu3Gl1fHR6CUngcyyq7UfCySfzenOidfH4HY8vKhiDbleNTY
	PokjtsG7Sz4WfNL8EhmxTjwTJtX6ex/pO6g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn7t98q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 17:20:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71500f274so516598685a.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771867231; x=1772472031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mUgVAINOURDQvrKq3PsyBB4PRlaSvdw0zwkbxHvqzps=;
        b=bNolqhMOQ9DD/3/pTLMqbpvU0GP+YnE38gJJTEBY7r12rrSQYq4cOIPLOx3nnqkbK4
         h7XWutJ3o1ggKtKYsCv+907hXzEgKoS3LSgZ0mIR8XK/bEV/e/Ydk1+IQH4AULYQqAh4
         NBUS+DI9H/g9YXfbLkSsE7qG5zfC6FSS81vEBomcnB6VgHgd3QmJtKD7o9hIIu08C5R9
         9MojhorR+qm+h3FGLn5YmsgjaorwTHjhpx0b1dNWNcCXlS7XdBrFJMhF3NDLwlnei9s6
         ouC74PaGloFiR0FMMnM5mKDbOxwd6UQ0vVrz4oDZ0lqdrAx3MdX3X9ntd+8iVIdsi12V
         uZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771867231; x=1772472031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUgVAINOURDQvrKq3PsyBB4PRlaSvdw0zwkbxHvqzps=;
        b=K5GpuUGBCSjtObq49EmHltWw2R8X/4mFq+CXgVco8isexdx23Iy4PDbCK1b67QSRuo
         /tyizpZHTUdSIvW8Q6ZtYNMcrupSkIGTAClB918Nrvv4ojoBrzhU6OJGz8aq7VEYHVRS
         Tb5TTfr2PygJEf7GdVi8tuxIKKGp/DFeOebkRFA17cQGUQQ22PlBYIjFrj+9uQvkCqAa
         fH2cc410TcIzIl/dpCLRq3WfZSeAx1pPDd3jfoUN75TUuMDpOAcAS7T/abyz1Uhl2Caf
         soJWzkt3kEJgrQKxwwbkNnVUw2jcYLLVpaiBGFXUXwDcR3byJl4PMizxBF3tYGGyvIqs
         h7FQ==
X-Gm-Message-State: AOJu0YxiZFO1BOMvXHhhRHNNNkq31m2zlCzz9Q7d+BiXvh3B4MItKgcg
	HAiOqUEh9HG4Tv59A0HC0gVMr9p1Kitc8YDt9KFFrOOUcsCPNiPQ78EjT9gxQO8mxQ1BGwfePAH
	ezPdF+IqupGTf0yLmJp6LSY/hcp7gfYgBDvRxrGqAFQq9pzx/UnvSy9Qs86+X7pYN
X-Gm-Gg: AZuq6aLATRIva92rq8x4XGp092uHabhN6pxdsX4VAJRa6EadAmUHtxmQQjQeD0Yw0Br
	tdgM6dVmxvK8amLCWSD5e4JMqH1ciMU7/3QgXGizOgyyJRXKaRODV9qsrEB/LCUUAu0r+Y/8wYh
	zAHuZuSBwUr/QB2XhhbkAfzAKeKKpdpmn0tMbjELyqELZMsUz8LM3fP+3hlXLyb4GBI5q4yDkvJ
	WKk6m1WWDL5lhu0Esmkbe4MjHZczMP+KEKIFMezcOWbHiCWbucjiJVPX0YS+GV4SxUgNozg5eY8
	RdH8Ts7pZ6vECEcpo7ewDDmB7yf6+WX7EdQbdrXFu8cncVlDEIp5RVXuKEDgwzV0ZJdzWbzSUyF
	1NaXj97onO7/N64Fu4faX/VhTW27V0v91wTOjj3SGAH1Mp52M1g==
X-Received: by 2002:a05:620a:190a:b0:8a2:e1db:f442 with SMTP id af79cd13be357-8cb8c9fecf7mr1186197185a.30.1771867231015;
        Mon, 23 Feb 2026 09:20:31 -0800 (PST)
X-Received: by 2002:a05:620a:190a:b0:8a2:e1db:f442 with SMTP id af79cd13be357-8cb8c9fecf7mr1186191285a.30.1771867230405;
        Mon, 23 Feb 2026 09:20:30 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:2ac2:9089:69df:f2e0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c09897sm21030868f8f.17.2026.02.23.09.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:20:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] gpio: introduce a header for symbols shared by suppliers and consumers
Date: Mon, 23 Feb 2026 18:20:06 +0100
Message-ID: <20260223172006.204268-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c5OmgB9l c=1 sm=1 tr=0 ts=699c8c5f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=j6jmTg-VOEBk01pMHWgA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: h5AM8-w6AV0I8W8CA6CoBZ56Txq-qxmw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE0OSBTYWx0ZWRfX7pHfAY5FJs0B
 tXg33wL73K0YQAiyncL5uRC+riemqqzlGWfK/7latoesGbTqkoZumC6xYfDxHmdOsbv/8VPRa9h
 U9b7xFiNn8P7aT6hW0ddZr0HOXhK7jQYjFPabQnWLNgW+9abR9tSed39puR+hSWql+9SZznWqff
 M/dri4W9QXInmAZcETepLJVd3HvaBH+S51pY6PFPLFRos4ew2dzxTAW/NwLvHbdyo8A9L2EoVQQ
 IaYmZCn1RocEs/RvuotFkOJiE5oFjpWJUXAsi8M263s960OgYvWjZW9+1fvwDceBZeHgm0uWlW1
 e04vxgbU3FFQ802D/PJcqUvc8sItrBDlM6/g0PIjQzHl6KcygThgdh95fmjmlV/2PK9DS9hm++s
 sR2m8zr8SgJQbwh7fXQ30r43GAQFxOL4a4TLoPJffuPbCxs9uMTPAi6RDLWH3NOzFk7ibCKrfh6
 LWC8Vb/cXv8n9QVelvw==
X-Proofpoint-ORIG-GUID: h5AM8-w6AV0I8W8CA6CoBZ56Txq-qxmw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230149
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32054-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8585E17AD45
X-Rspamd-Action: no action

GPIO_LINE_DIRECTION_IN/OUT definitions are used both in supplier (GPIO
controller drivers) as well as consumer code. In order to not force the
consumers to include gpio/driver.h or - even worse - to redefine these
values, create a new header file - gpio/defs.h - and move them over
there. Include this header from both gpio/consumer.h and gpio/driver.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Andy, Linus: I'm no longer sure who proposed it but I've had it on my
TODO list. Please feel free to take credit below.

 include/linux/gpio/consumer.h | 2 ++
 include/linux/gpio/defs.h     | 9 +++++++++
 include/linux/gpio/driver.h   | 5 ++---
 3 files changed, 13 insertions(+), 3 deletions(-)
 create mode 100644 include/linux/gpio/defs.h

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 0d84085829186..3efb5cb1e1d16 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -6,6 +6,8 @@
 #include <linux/err.h>
 #include <linux/types.h>
 
+#include "defs.h"
+
 struct acpi_device;
 struct device;
 struct fwnode_handle;
diff --git a/include/linux/gpio/defs.h b/include/linux/gpio/defs.h
new file mode 100644
index 0000000000000..b69fd7c041b28
--- /dev/null
+++ b/include/linux/gpio/defs.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __LINUX_GPIO_DEFS_H
+#define __LINUX_GPIO_DEFS_H
+
+#define GPIO_LINE_DIRECTION_IN		1
+#define GPIO_LINE_DIRECTION_OUT		0
+
+#endif /* __LINUX_GPIO_DEFS_H */
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index fabe2baf7b509..5f5ddcbfa4459 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -20,6 +20,8 @@
 #include <asm/msi.h>
 #endif
 
+#include "defs.h"
+
 struct device;
 struct irq_chip;
 struct irq_data;
@@ -42,9 +44,6 @@ union gpio_irq_fwspec {
 #endif
 };
 
-#define GPIO_LINE_DIRECTION_IN	1
-#define GPIO_LINE_DIRECTION_OUT	0
-
 /**
  * struct gpio_irq_chip - GPIO interrupt controller
  */
-- 
2.47.3


