Return-Path: <linux-gpio+bounces-35835-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMgNOyMG82nawgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35835-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 09:34:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7060E49EAD0
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 09:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA667302452F
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 07:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 548CA3DD51E;
	Thu, 30 Apr 2026 07:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YkXGUqc0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AGnpajaL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62873D7D84
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 07:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777534469; cv=none; b=dx/jcY/1NLsDF0tEts7GqBUKTF5P3Lb6DmO3fooU6Nd7v73dHGLxSnvH9NpoM6+1l/v0lG11H8Z2ETwKNVTf2JSj9K9gCIQ7Pie2JuBc94Tb8Q8bkIY3LxmzIkZc3KLN6a0YcYnV1EVrX2UWCI/cykw/nAwrf9V0BKE+1Z6XGD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777534469; c=relaxed/simple;
	bh=ftejCI4cDYR15DURdSwoo+KUTTkz4glwgHDYbKITpyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LsrQCPNalZ75cAB4uJAIfYagfQ8JvR13lESb5o3et6Hfry9ax1vgSyty92p5LbxqiDrUIBXrmhY90h71uqn7bub6/zWExmV/ezA5JIpV5ReJlokXgE2suLica5xRQ2NqeCjb3MrznSAonyMmZDifEq1ARxCdg94IuqXyuKfUPoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YkXGUqc0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AGnpajaL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U6Ahob2533827
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 07:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U1lg30DyGHdc17+B9LzqWTA6Lt4/KitzUTkvawVH9l8=; b=YkXGUqc0UwwFKQda
	PE1GWHQR2rLBvZZuCvHXOt537eZxo7bpxUkuhu/01yPufMEdgsCS46y3dh2vjshm
	yOBLMyqduCPu+m8TK48Ct32cK7HWZLIQpgsrW8Kr/mL3VJr2dBJAYN32bWr73v9a
	sV6yeNJB6MkMuCvDr5qzEshW9EcHuZBSM6XNx6mCL5ZOB9zodEy76yVbvSS5o7Z6
	eTpCVHLQ/30HKkVVJ9vYAZmXpuqMLLXRsi33P0AIgfYjEVQApvfjQU13xzkm1aTE
	KU7qJ14v3rNPnlFNoG1sXF4CE8vXEYqBVY8TZ4uxqjOr/TkOg7U7cl9289PmVSeM
	xpbHEA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dupe92hde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 07:34:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50faf575af4so12945821cf.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 00:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777534457; x=1778139257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1lg30DyGHdc17+B9LzqWTA6Lt4/KitzUTkvawVH9l8=;
        b=AGnpajaLlAqaHH9EQX2in9CzyIyIvN2OzhTDs/pf6TRE9/HQbDz8vNsFqackNwhQ7T
         IMloXvno0aERnnbpq/HPZEKpbgv5RBYa1AR/EbI6ZWGQZ9osiGFerSY9vdr+YLpZ8M+g
         pHlo6XaMKFdh1n8wRCnwSTSdI+GH1yEoyXAup4WAyWNu/SLgJP7WIrYGkyuQUShQKZ0u
         su3zkP/KTzB01ixAmJBFDME/mDwFp1Xykd/cSTwUyAC1uFWy1tUPSRZONrJpEz/9CVz5
         iw888GMsZ1+O/9G3r1CFcAIZ/BBmdWavduf1Zpr1kpJF20besdnQdZBjhyVrnu3SueHS
         C5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777534457; x=1778139257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U1lg30DyGHdc17+B9LzqWTA6Lt4/KitzUTkvawVH9l8=;
        b=GJAsoKLJJa8tFxyR8JITZWHWhQKjgKvxgYYH167palRziSVHYsDiNu4UWMB8B+FpdX
         AzpNUerzvnyWABPlZHmSmSMQzEY9Htg3xHNqJ7/4xOhwTr/+vZR1cHZwHs+reGLIrsuI
         sooRif26+CnqRIEVpTPX5STTXA87AzwtOmrZzm8/Z+yDcNLNPVbEy7lHT/RUq94BSYBT
         cQeW9+UvFi9meCQyOAwwf4EM5Q6ctqhvH7G7cvTczH76RIasQG1TUdEAUu+wAZVtf9oF
         SlltM9OYous2DJ54e+hBRfKHCr3sl3KlGmp8oF5hwiyubII1IpvimZJRoD8+JBA5KGcS
         W5bg==
X-Forwarded-Encrypted: i=1; AFNElJ9wGK/VWu8frPHCCa+dEp9QYQDy1DBi6hxmzbZ97Oy1jT2fmKg2JYpWAuGXRLlyFkm8b1JbejUZp/wq@vger.kernel.org
X-Gm-Message-State: AOJu0YzuMZRYvjf8qUgyDgPZDMXfE9RcgqW24hmu6uBrP7E4Tk+feLxO
	n8UCVcgn9n2zS5kD3X9DRcNfQ7Q47plSjjlRG7U0u1KT31IulDizormLvr2gXqlQOB6Gt5vjasq
	c5RucrVr77c38MiFAArWDIXzjm5xKlVhNVXVinPJjjnh1Hn4QU7Se9/WVkgAds+3E
X-Gm-Gg: AeBDiesnzom68qWeROP5miiQOS+u758VMZiTCNu/wnAoeF7h4AQgNyjLr1Hsg7MyIZj
	6JwLVOXKnt83l6ihT0PfS9lRe6N99e/gYITNHB+6x9F8UdlsPeD4spgRJ/OQo41Au7s/smBFch5
	QwkLuLkX6j5/tsHE2T0oRdL1EI9+AGbny3Uk5CqMEOlFWnU6Uivqg/IoJxtPVae3c7BAfPvJ0j2
	Jesw9tz0p2nMJoWAy1tCLJjR1NMLEZJlgvpovN/vn6nIUoCEdD+e77htrz/TIdCj62wwIIX6mUb
	R6J3hbJHFUWjf85zwaaJwfPjcDWslYj5MMOZPqocwn9VNpn+QvBi8BJHi0arFUZeY7x32Zse0Uo
	dIGTiaAumGq95sDpneLFV2UTuZ+3+uydcBwM61fIMPRGbygqNIQ4eKdYtaJgY
X-Received: by 2002:a05:622a:2296:b0:50d:abc3:eed5 with SMTP id d75a77b69052e-5102ae1dd37mr24163231cf.29.1777534457250;
        Thu, 30 Apr 2026 00:34:17 -0700 (PDT)
X-Received: by 2002:a05:622a:2296:b0:50d:abc3:eed5 with SMTP id d75a77b69052e-5102ae1dd37mr24162871cf.29.1777534456853;
        Thu, 30 Apr 2026 00:34:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a:f446:21cb:22e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6bafsm76132625e9.2.2026.04.30.00.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:34:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 09:34:06 +0200
Subject: [PATCH v4 2/2] platform/x86: x86-android-tablets: enable fwnode
 matching of GPIO chips
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-baytrail-real-swnode-v4-2-767bcda6667f@oss.qualcomm.com>
References: <20260430-baytrail-real-swnode-v4-0-767bcda6667f@oss.qualcomm.com>
In-Reply-To: <20260430-baytrail-real-swnode-v4-0-767bcda6667f@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4114;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ftejCI4cDYR15DURdSwoo+KUTTkz4glwgHDYbKITpyw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp8wXyNbrBg8v29GzWwZQSXhoATQ3VfPNhBQPyX
 CBTZhwb0VGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafMF8gAKCRAFnS7L/zaE
 w74HD/9R4T00RQB0nP0oxJY0jbchVJlzM2HQLvTUIxu3XYf2kbK+9M5LCXFZDn6pP6shJQG8qg9
 jvbNZ48V+8pTQiu2nRdH5ofy4TTP97Be12edItD9zYZc3BZyaIIfoREEHbyOOXcNxbijgu2ZXgK
 aDnFxWjXdxmcJP3+44LmtBc2f66btigvbsfJ0bqpA+kXXU+pFBtW4do7ukRCaGucdQmblYoufqX
 aFul+BFkxk6RW4b1C1jMkOnsI57vXPULWviGGg1koW2eTe/uFbexumZFhUbk3lo0nZFqVQXeKTy
 w1QBbtvIGl07Q1FFKbkbuzNvJerte0vlk2XaTvUnOlqNViiKDhO5dJpPWYQT/Fl0lbJ07uv5yhc
 A7HAcqvh0fSpG0of8UbqGjbqxuRiZM+E4H8S3qIZXfof/N5D0WDZmfbNSLZVfsqz9gJwSBv1uja
 aSf/DmIUIvwc8Nq5HINCUozUGe05IUEvmVUyNfxIHkpe3JzYgUd+LNSMKGNXRx6ePOF1tSsQlOH
 4hzKHjmxsFkDi5IrYsP+BChzM7/DIcso0+CtHzTNy1fzq9x73NgmvHhL5plWj4KkJqSVDz9q7py
 BAbKRhko5Ya21J6x1Tg7FjUR0qHOE6OQUOmwLRRZ99r6LSdHxzDlZDihR8wbZyeP42Kh0pJQ1qI
 oz35jL4OLjuxAVg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: P2topx38LiWyVgDFMUDGrLsnR1coh2WX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA3MiBTYWx0ZWRfX4kx76UiGjsEj
 zXEWqk082kbwcD1yx34sYnf8UMuGIx88E83tRlo+e3KN48OpC3je1p2z1CSpCJfWgZrX+xzEaK8
 qTVxM/TuhjLcXsAXcdomFH5l4d6I+qeL20conrW5PlVI2Ud86ujxj+zyNyf0lX76hz1qNlD5PLB
 TLricF9R77sdHP4RdYDuH/5Hos69x5FNm31nmzTJdpZzEuECwblX86n9Kfl3LtMFz7U2wIHyCa0
 usHogHVAlDO5Ojf/fm/c1JbKw4WhjaVl/oHcXzMiqp3790lJzRasf7rO7Q9orNrKw70wMDgo0t7
 78mE/VTleRJXFthwALJ8FAT9P9qI5VeVD+W9ndV9SHcTDKiWV53wS1TjpeXD2zRsnxtSdJxXrWk
 Ja32y50GKAIiUZQc6Hix+ehZcXyaGVJOJ1jE4egHuhVYL5A3LmMcy8+/mHvp7NZrvLnrlD0NKx5
 puNV0g9yVzvj/XDDjiA==
X-Proofpoint-ORIG-GUID: P2topx38LiWyVgDFMUDGrLsnR1coh2WX
X-Authority-Analysis: v=2.4 cv=PvmjqQM3 c=1 sm=1 tr=0 ts=69f305fa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=k_IdGrc-7EcYSgGcGvIA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300072
X-Rspamd-Queue-Id: 7060E49EAD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35835-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

In order to allow GPIOLIB to match cherryview and baytrail GPIO
controllers by their firmware nodes instead of their names, we need to
attach the - currently "dangling" - existing software nodes to their
target devices dynamically.

The driver uses platform_create_bundle() and expects all required
providers to be present before it itself is probed. We know the name of
the device we're waiting for so look them up and assign the appropriate
software node as the secondary firmware node of the underlying ACPI node.

Scheduling fine-grained devres actions allows for proper teardown and
unsetting of the secondary firmware nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/platform/x86/x86-android-tablets/core.c | 78 ++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index 021009e9085bec3db9c4daa1f6235600210a6099..8fd0cffe351577182f31c90c104b616cec78c481 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -13,6 +13,7 @@
 #include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/dmi.h>
+#include <linux/fwnode.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
 #include <linux/irq.h>
@@ -360,6 +361,76 @@ static const struct software_node *cherryview_gpiochip_node_group[] = {
 	NULL
 };
 
+static void auto_secondary_unset(void *data)
+{
+	struct fwnode_handle *fwnode = data;
+
+	fwnode->secondary = NULL;
+}
+
+static int acpi_set_secondary_fwnode(struct device *parent, struct device *dev,
+				     const struct software_node *const swnode)
+{
+	struct acpi_device *device = to_acpi_device(dev);
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	fwnode = software_node_fwnode(swnode);
+	if (WARN_ON(!fwnode))
+		return -ENOENT;
+
+	fwnode->secondary = ERR_PTR(-ENODEV);
+	device->fwnode.secondary = fwnode;
+
+	ret = devm_add_action_or_reset(parent, auto_secondary_unset, &device->fwnode);
+	if (ret)
+		dev_err(parent, "Failed to schedule the unset action for secondary fwnode\n");
+
+	return ret;
+}
+
+static void auto_secondary_unregister_node_group(void *data)
+{
+	const struct software_node **nodes = data;
+
+	software_node_unregister_node_group(nodes);
+}
+
+static int auto_secondary_fwnode_init(struct device *parent)
+{
+	const struct software_node *const *swnode;
+	int ret;
+
+	if (!gpiochip_node_group)
+		return 0;
+
+	ret = software_node_register_node_group(gpiochip_node_group);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(parent,
+				       auto_secondary_unregister_node_group,
+				       gpiochip_node_group);
+	if (ret)
+		return ret;
+
+	for (swnode = gpiochip_node_group; *swnode; swnode++) {
+		struct device *dev __free(put_device) =
+				acpi_bus_find_device_by_name((*swnode)->name);
+		if (!dev) {
+			dev_err(parent, "Failed to find the required GPIO controller: %s\n",
+				(*swnode)->name);
+			return -ENODEV;
+		}
+
+		ret = acpi_set_secondary_fwnode(parent, dev, *swnode);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static void x86_android_tablet_remove(struct platform_device *pdev)
 {
 	int i;
@@ -391,7 +462,6 @@ static void x86_android_tablet_remove(struct platform_device *pdev)
 
 	software_node_unregister_node_group(gpio_button_swnodes);
 	software_node_unregister_node_group(swnode_group);
-	software_node_unregister_node_group(gpiochip_node_group);
 }
 
 static __init int x86_android_tablet_probe(struct platform_device *pdev)
@@ -427,9 +497,11 @@ static __init int x86_android_tablet_probe(struct platform_device *pdev)
 		break;
 	}
 
-	ret = software_node_register_node_group(gpiochip_node_group);
-	if (ret)
+	ret = auto_secondary_fwnode_init(&pdev->dev);
+	if (ret) {
+		x86_android_tablet_remove(pdev);
 		return ret;
+	}
 
 	ret = software_node_register_node_group(dev_info->swnode_group);
 	if (ret) {

-- 
2.47.3


