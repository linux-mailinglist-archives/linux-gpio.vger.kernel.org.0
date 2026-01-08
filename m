Return-Path: <linux-gpio+bounces-30271-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A577D03236
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 14:48:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32DF430605A2
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 13:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0310048D26F;
	Thu,  8 Jan 2026 12:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HRUoivgc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GAWKjmjs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A9248C8A6
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 12:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767876769; cv=none; b=lO+o2pfYSCuUbNrzHVFoH27597YqNwCKr0oO09pcOq6uEo0kaFS7ql58xzK/wccaDh+B880BQbGNRB1bCl6qJbY3rOH/95PEETNYtAhZsbfbauXT2zoqbnbC+FQAyVM7DTdKbIuSsaDD0xdZV/HSd3uElBc8AQgaMW1DDt2AsbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767876769; c=relaxed/simple;
	bh=zN4QZ36PtRskwZvfJFdU6pKse4rrqa6VYQmA1e9BOsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sfKXMb0WvUIeY257w27iyU5VuTmS4Lo8jEakFyRguqs4QMEdLNhG15JUn6zdRC5R24uRh+vsXhdzlb2mqZIX5i+riGxiu3TeT4qvybiC+ehxVuCeHHjyNoVw/mDpI6g8pBNDeq037c7odILKwctUr/MswdPcBsxtydw0BB5/+pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HRUoivgc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GAWKjmjs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6087VNcj1837903
	for <linux-gpio@vger.kernel.org>; Thu, 8 Jan 2026 12:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=X3g6li6ZPF5ZFaXdwdNKYxPpaQSacGjqQOQ
	a35QXp1s=; b=HRUoivgcGduLOTGqiZPti/j3NtkIpjV2jquxmYg6JV1Dkzj7cHI
	u6e9D2I69pH1dHlJc+Ekk+FnAhPN6APeXX993RTEc9XCjAeT4jEyEB6F0H+iMq6N
	rqYTy51i8xbS4RmESEzstDCMgFR/ESI0DLF8NggoCGnH9MROT4qgr82Kn/8YHnp5
	JVHhjFASE0Thb7QNT7ZyWV8M2Minn2uDTOhuUBzy7a1lUnOrZFh3SdIaqbxwHJu4
	a9NixEELQtoVjYskj8l32X/ffHATFo7OqbwWpLQBH1RGUdSXI7GEx3Ax1uIR23px
	W6kl0ITI0sJpXlPCwSGdqxTiRSWJFi4LUnA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj8920y4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 12:52:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b9ff555d2dso876718385a.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 04:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767876766; x=1768481566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X3g6li6ZPF5ZFaXdwdNKYxPpaQSacGjqQOQa35QXp1s=;
        b=GAWKjmjsTmt25XjgiewSo4qQjUicBDYSLw9j3uqmvrR51u4xdWxPcLjGgpmJKq+p1a
         TigaMsDxYdXtyPzhswQC7yUG/Wr9nMsYfz38hd0AK/5lunwNjcUD65IKSRaF0WJNG5oB
         ODVieDxqkWkPs7/JXgFkvF472fE+T9uYQkpR4+mz1iYFuruVJ4zIkAgwbaqVZ55ajj9C
         rcw+I59stURocBKeaEPEBgIwzhzsKlG2TOgMlZnyHX5Sa1uWzd1jP/1Zjx5RtovjhNKm
         cPPJZgvnYelJ1bxKRj9xD8YXoiLDVhiU6gzN3aIl4zp+knWn3t56TjYBcp1H2WJeA1K2
         LRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767876766; x=1768481566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3g6li6ZPF5ZFaXdwdNKYxPpaQSacGjqQOQa35QXp1s=;
        b=aQlKatdM85RT6OQwSvcHQyQn/cHpCr+yd0d1lfRKExAJgkAFcVw2C0Jk+l4dGYv+yg
         8gHCFp2PZr5wvHQz6ljH/944ivey+QeirQNEOFAX5fndDC2/UA0h2z7y7hpa+DcrTbXA
         j6N1Yajpuf2PEJZPyHjLwqlbYBnNJrVxwcNdLEliYg/3yYGcElizobmPbYaCDMOSM3M0
         t5w92Rz71gaPm23CaS99xzWsW4D4ZU5UCpsuWq5iRKhrLPrwKJSzKggsKIyjeDD3NTMP
         k02RtHGCRvtBotlzYwr7FabSwkRuSh8t/O+lWsCk5RuupTjhphNeWwtTGEoq8f5/E7+I
         Uw+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXB2QbopTM8hpaAmY2XgbA2oRErYl7BfhDCsqWwjcGcCajFhhuQW0t3se9NDb5BsvDSHYxRjPf9SvtS@vger.kernel.org
X-Gm-Message-State: AOJu0YxLKY7ABoo9L8lY0neQxhbCXI4ITPuorx74wWnOiVkD++Sz3575
	0kQPQdPxQTQwSzz5wIkfiLCFA1DC9EFZn7XdoAHCwfoe3sLAGwFBjt75KLTwAYPKRaB8RZx+8Ie
	SkYVgmklt7l0bQwNCqScx+Z+WNSxlGnrcj6hmEmu24nwWG7XnVobn5BICr8R+Cjbh1RsAZMvx
X-Gm-Gg: AY/fxX5sKRWuuiK5w/zInTdJYnB6ibIdm0eyU/br/PHYYArTbabq5JjgtfbtENArsHp
	nRWVLnlFe5osTupYazIJ4q2QMNj2ulqKUff+CkmZWZgQKome3d/14UknvhtF1Sa4Ks6bLb+m63y
	fHYDnIk0IlfDFyY/ZeH/pmTZ4o8KecIVtwlnGi8haTkNZFkACRBjFg4H97+WGGArjFIsICRZfsH
	ANTpYfDtaDB8qS9PeDf7LuqwWrhK1aJ68crrhdECokKueI1+OZkJ1PaxwrvJP8BJH/rZD68jNBr
	oJ8CKYIzSFBrzZL/pYZ1LYXkPmPqm6tkGOYkrMyxfNznQTfNRT8fUCCBtHPquYZ/P8FNO00EIqm
	QFjZm/gzug1l5UbczU1VQGUxi69Y3/zfg10FEwQ==
X-Received: by 2002:a05:620a:45a6:b0:8a3:9bb4:9e4f with SMTP id af79cd13be357-8c389384911mr728007385a.30.1767876766384;
        Thu, 08 Jan 2026 04:52:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfP6gl+LWZnodnoO5Y3d78hTSOSGuJ10ccdCvgVCbnTIWQT9YKaCrv5euQIrmgSpmf1ZriiA==
X-Received: by 2002:a05:620a:45a6:b0:8a3:9bb4:9e4f with SMTP id af79cd13be357-8c389384911mr728004485a.30.1767876765935;
        Thu, 08 Jan 2026 04:52:45 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:5171:301c:72f8:fd25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f69dsm153652465e9.1.2026.01.08.04.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:52:45 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] driver core: make pinctrl_bind_pins() private
Date: Thu,  8 Jan 2026 13:52:37 +0100
Message-ID: <20260108125237.28092-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M45A6iws c=1 sm=1 tr=0 ts=695fa89f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=JPZ21q59wp0sLTGT4yAA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: c1l_-0GhQcKsPMwfeD8LAOP6eg0ecGP_
X-Proofpoint-GUID: c1l_-0GhQcKsPMwfeD8LAOP6eg0ecGP_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA5MSBTYWx0ZWRfX4L2M8MQqrQ2H
 QQIMvQN91GPl0Vt2GtHFOApj6+4GE4f28i4/ovE9S7u5+guZHS0ANqCxsmQ1m1lAiwoQLaL2sHv
 ID66VZSIYZ/8U3wy8V+PjMyE7iIwU8+N5UXR5OI+APgDcv7CtJR+6PV0dxif7L18E+RJjsghGF3
 FCYcXTEP6HDXt1yOsdbqQCoGjK5pQicpwwXfWaMW0nH++Erv7m5+XwQfPKcds65sxZOrmyha4dK
 zymZ0QXnGd2WSbOO8m3AKJ/+LNlymM4AgW5VShjz0RBBrSR28udautLZ7jPhAkyIWP1GmUw8fg3
 MuMilWKIOCM3LEygul3UvVw5JecN3mtdKcUfswT9LZQAbt8nn5Rtdo1BoTr2TWGG+KLf/ZXZdTs
 MjWEz+PBaSRF04dgtGV5zEdPSG5E/T1pbZWgIydJJ1aDkgUn9rfZqwLOyjC4C+HvVz5zRmLCzR/
 2ko+jHWtRfOr/hUNnwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080091

pinctrl_bind_pins() is only used by driver core (as it should). Move it
out of the public header into base.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/base.h             | 9 +++++++++
 drivers/base/pinctrl.c          | 2 ++
 include/linux/pinctrl/devinfo.h | 6 ------
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index 430cbefbc97f..aafc0adbe77d 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -289,3 +289,12 @@ static inline int devtmpfs_delete_node(struct device *dev) { return 0; }
 
 void software_node_notify(struct device *dev);
 void software_node_notify_remove(struct device *dev);
+
+#ifdef CONFIG_PINCTRL
+int pinctrl_bind_pins(struct device *dev);
+#else
+static inline int pinctrl_bind_pins(struct device *dev)
+{
+	return 0;
+}
+#endif /* CONFIG_PINCTRL */
diff --git a/drivers/base/pinctrl.c b/drivers/base/pinctrl.c
index c22864458511..6e250272c843 100644
--- a/drivers/base/pinctrl.c
+++ b/drivers/base/pinctrl.c
@@ -14,6 +14,8 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/slab.h>
 
+#include "base.h"
+
 /**
  * pinctrl_bind_pins() - called by the device core before probe
  * @dev: the device that is just about to probe
diff --git a/include/linux/pinctrl/devinfo.h b/include/linux/pinctrl/devinfo.h
index bb6653af4f92..de4228eea90a 100644
--- a/include/linux/pinctrl/devinfo.h
+++ b/include/linux/pinctrl/devinfo.h
@@ -43,7 +43,6 @@ struct dev_pin_info {
 #endif
 };
 
-extern int pinctrl_bind_pins(struct device *dev);
 extern int pinctrl_init_done(struct device *dev);
 
 static inline struct pinctrl *dev_pinctrl(struct device *dev)
@@ -58,11 +57,6 @@ static inline struct pinctrl *dev_pinctrl(struct device *dev)
 
 /* Stubs if we're not using pinctrl */
 
-static inline int pinctrl_bind_pins(struct device *dev)
-{
-	return 0;
-}
-
 static inline int pinctrl_init_done(struct device *dev)
 {
 	return 0;
-- 
2.47.3


