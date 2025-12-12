Return-Path: <linux-gpio+bounces-29465-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4A7CB7872
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 02:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 93060300387E
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 01:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15925248880;
	Fri, 12 Dec 2025 01:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q3yQYO72";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XGqsQ0tz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D542153EA
	for <linux-gpio@vger.kernel.org>; Fri, 12 Dec 2025 01:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765502074; cv=none; b=kqPLHV6RYiS5dJTEgh02KsOEnGzCCvloyHTfqNunnCz76MDlDyVuPxY2865vXYQpo/wnbztbFYTR0znGfDnfiP0sAzQjeCiLsKgD7HbnmEcjqCFlDSCMFX/eGvKyUc1ZNn6Lq5bbCZkEPXmdJwcYpcFn/2kYLlJBhC3akEE5A18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765502074; c=relaxed/simple;
	bh=S20uW8x02lBXbXf+h0JBgkcZWct3qL5C5DW4g49oy4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P64Hsd5CjqCyylhCXfh8mBiqg7+A8+vaDl/Np3DXxs8P6fuNFZi1sjN5ZqwSQhSl2Tx+3GRuZXuySqnZbQh5aNTzTm8dZ7W9B6d+2tXdN0t2ZgB0W72LDG2GELBoFXMROFl28ABKq68Qa0McmkwiccbknCfNGOGspO337dC/a54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q3yQYO72; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XGqsQ0tz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBK9Aeu2456133
	for <linux-gpio@vger.kernel.org>; Fri, 12 Dec 2025 01:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GMzGVg0OPA9lqJefNfDjB4KZvucDCggfw5d
	7axO2bSY=; b=Q3yQYO72KsEe6tcXDtWyLZpGRepaOdOwcP4mkjsowviqZVq3n9b
	UY4ZZhUxLSbnbb1kKuxEkjDS/DtW5nn7qfZQ4KI+0DFoBISb1uC4XWlWl6np5xCK
	ko3IHZ5UEvU5TyY86wZehaqfX5AqyFnCcIYb+ayYMXPYIFv7Rm4EN5XCIfoi5/K0
	oUEKIoVUbkGKAqmvyhvGxbaLlYRQTQOXLgKaxAFEXyuiDY79RT4kL0lqg6ZjFsrh
	PtGc1FrybEe+eBqh2s1mHsL5HRPRD4xObz8SS7ocd3whiKmZhats2xa99/Q2bEnh
	ZerAq3icbgKkQgg2rfK0piUywYT7rfPPI9g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b04r8rmqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 12 Dec 2025 01:14:32 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7a99a5f77e0so980087b3a.2
        for <linux-gpio@vger.kernel.org>; Thu, 11 Dec 2025 17:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765502072; x=1766106872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GMzGVg0OPA9lqJefNfDjB4KZvucDCggfw5d7axO2bSY=;
        b=XGqsQ0tzUwFM+TGXpysFYNTDnRUyBRZSYr1heYpi636LtvHSN0TxobgGZvTN+QbBNn
         LP5nPCUDuFZ8ScPOnvo5tzRKIi45KHW/DNp5thGS+bZGOi2TdteNq2dnIf+DvJ0NFkpt
         gVIOhM5dQneQN271alHYafwbZl4emk9QpD5BrSga/0v2p+dgNRFVJZ2rcjW3W44CfadG
         g0JNy1OLHxPcpWsDPfxv3Qtm/f/3VwPK31EiidpNcwnW13jdzz+78AxSNqEVpn+14vaX
         OwqGZsoND1iwrrQh54PlwL8ErGqaHhRP+FJLWnLunuiNa4FinDv/Qk5COI3EFlAsnWqL
         tKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765502072; x=1766106872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMzGVg0OPA9lqJefNfDjB4KZvucDCggfw5d7axO2bSY=;
        b=r92Pchw2elnvT8Oxr3+dhOWCJ5+Roi9gJyj6eIhpxednhCTHSS3j59SoIrLugn08w/
         9oWpTdO6rDqlCMzOKzEoCerCyUUCDrXMQYHzpn7BI5IXbX0/8lqeXkXvnEu3VK6v64Uj
         a16bLye88Q8RNnt0P1FKdzvu415I9BRoe4AtY7Jf4c0rt9JOfy0YLDT3Q8nL+Uztk6Jw
         +vlT8vLbnmy3nVwxDlieiVZMTNL9QyHeph8xHong9pWfZXbMFyVUvrP2+Tw3i0kaGm9g
         M33lGTHfEPaCTzdz37zKidU5HIe19tdWNJ9pjxM0sEij0rda5rhkRM1l8fiPqCKipMRo
         SMWg==
X-Forwarded-Encrypted: i=1; AJvYcCXeIb3/2WQQBCJ164eJIToAqdGEm229r4l4uDKmco80hrvCB8Rrvvv8hpPeuUpRf78g3j5AFAJxEQxl@vger.kernel.org
X-Gm-Message-State: AOJu0YxODadO4qIvC1xqj8awqKi+KqHRvqc/Ff+m0AWFR0xFOYrJaU5y
	1k07o7HOBTkbkDTXKc8Tkr5UC2Va0MJVz2cCX8tPopG5+g6W0UmliOm39auPB4iz3+BZ0hk3YDy
	QpfwjrBSb4njXbIMMR9qlQLXMsy6K4wTAU1/zpr2F5crwJ1hR5VkTCpmZgha07Iz/9MV4HnhH
X-Gm-Gg: AY/fxX5LRG//kQMtFlLX5CI1mYtUVYX+dGqhsisczQDLcmmlA6FMdJzB0o7ppzR5A5s
	Drzhw0ehsZy/CTlDdbd4PGyZJqWi8QZtC8UnCZFnevVHlwoUz/ZY0BCzpnJXkElyQCyjdsTfWxK
	NU3atYPqO1SevDJ/78/oLWs4nxedPwe5I6EMitubmfd/UW/mmk2VJtvPqzeHGbFqwUQU5ZBp8ST
	2XLWkQ5x+ZRdwgKgxtAIBcdjX1TfYQZt0t/bPWkJzx33IEypCDlJXcRaFoVEsBxkHzBgBvIiHCs
	h0D+0C+SPobruXBXl3O7L6ODY0WcGfnBdH69VRfAIVAktxoc2WpDEr4MLYEvjbyzOa+XDzB8TTj
	UE7qoCxfarTdDWY/J6zRnRMuG4U9x8c9ifIQsS+dE6cM/raCFzYAaIXZ6MIgDVtIE
X-Received: by 2002:a05:6a21:e081:b0:35f:9743:f4a with SMTP id adf61e73a8af0-369adfb32a9mr368782637.26.1765502071696;
        Thu, 11 Dec 2025 17:14:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzQoRG0pix6G3prra7UDpr97Ol9yv9o8eicT/jc9Pv+bL9CURM9eO2Ew+Z3013hN2YvKtkuQ==
X-Received: by 2002:a05:6a21:e081:b0:35f:9743:f4a with SMTP id adf61e73a8af0-369adfb32a9mr368763637.26.1765502071216;
        Thu, 11 Dec 2025 17:14:31 -0800 (PST)
Received: from brgl-uxlite (p7838221-ipoefx.ipoe.ocn.ne.jp. [123.225.39.220])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0ec080cce0sm546125a12.12.2025.12.11.17.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 17:14:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v6.19-rc1
Date: Fri, 12 Dec 2025 02:14:18 +0100
Message-ID: <20251212011418.6945-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e/ULiKp/ c=1 sm=1 tr=0 ts=693b6c78 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=cRv1ukX+bdz2y/k5ONU6nQ==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=DUeNkbUvdf5hwRQeztQA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: Qd3ZWqRe0vWo2JffzL8XCsilLfqhrog5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDAwOCBTYWx0ZWRfXyGkS1RJxmz/g
 zpQxYTU35XAQX6O0BboWKRbHrEBTpbZ1qHAnpUYVxo0sYwyGMr7b7y5Q9hCXUb+S6ZtlWCtL1f1
 XMSLJDMBePOiqaPmeE1Ebqz9HSCa3IP3F3F+/blPNmXWbzya6isHC6+BN1O9G0tX1cV6jJkBytW
 +/50fVEPm2nxXirlkFIpP+zz9wJrW/U75n4TBjOBu/+pkb2UjS0QzJPmVrhmkCC1R8pfj6Bs7aP
 m2r0nH05VFFsDiNDhMVml3m5KlaB2khwNYGnwG6HQ6lIzJYl1ADKsOvk6CsY+Cz1w3LD4T6+Uo8
 7hMod9eQNyBzR+SlxZjnFXojFoKbwYDa+ZVzyr80gdbEahektC1zfRM9YZXsQt/ExZtrffnmifK
 eAOfTviY4GXBLQqintOdT7SAfyjcXQ==
X-Proofpoint-GUID: Qd3ZWqRe0vWo2JffzL8XCsilLfqhrog5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512120008

Linus,

Please pull the following set of GPIO fixes for the upcoming RC.

Thanks,
Bartosz

The following changes since commit dae9750105cf93ac1e156ef91f4beeb53bd64777:

  gpio: loongson: Switch 2K2000/3000 GPIO to BYTE_CTRL_MODE (2025-11-28 12:59:00 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.19-rc1

for you to fetch changes up to ea513dd3c066074b12e788114b45e0f2bda382cc:

  gpio: shared: make locking more fine-grained (2025-12-09 07:16:45 +0100)

----------------------------------------------------------------
gpio updates for v6.19-rc1

- fix spinlock op type after conversion to lock guards
- fix a memory leak in error path in gpio-regmap
- Kconfig fixes in GPIO drivers
- add a GPIO ACPI quirk for Dell Precision 7780
- set of fixes for shared GPIO management

----------------------------------------------------------------
Arnd Bergmann (2):
      gpio: qixis: select CONFIG_REGMAP_MMIO
      gpio: tb10x: fix OF_GPIO dependency

Askar Safin (1):
      gpiolib: acpi: Add quirk for Dell Precision 7780

Bartosz Golaszewski (5):
      gpio: shared: ignore disabled nodes when traversing the device-tree
      gpio: shared: fix NULL-pointer dereference in teardown path
      gpio: shared: check if a reference is populated before cleaning its resources
      gpio: shared: fix auxiliary device cleanup order
      gpio: shared: make locking more fine-grained

Johan Hovold (1):
      gpio: mmio: fix bad guard conversion

Wentao Guan (1):
      gpio: regmap: Fix memleak in error path in gpio_regmap_register()

 drivers/gpio/Kconfig               |  2 +-
 drivers/gpio/gpio-mmio.c           | 10 +++----
 drivers/gpio/gpio-regmap.c         |  2 +-
 drivers/gpio/gpiolib-acpi-quirks.c | 22 ++++++++++++++++
 drivers/gpio/gpiolib-shared.c      | 54 ++++++++++++++++++++++++--------------
 5 files changed, 63 insertions(+), 27 deletions(-)

