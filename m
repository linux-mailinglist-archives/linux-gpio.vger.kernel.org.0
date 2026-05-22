Return-Path: <linux-gpio+bounces-37372-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFqLHVdkEGrvWwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37372-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 16:12:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0765B5F00
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 16:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EFF03096158
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 13:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5518406270;
	Fri, 22 May 2026 13:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nA1008es";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FI+GtCPd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94D6409DFD
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 13:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457355; cv=none; b=gnga/jxs/mQ/UzoFsbEeuLPK6N5PRbLJXjcwzoemADxBLjOhYG85PCXs/EIOCcRHhJlGZXnAaQR6ju4mXwhuhf71bu3jpW5hFVIX2WFCXQ76Wxom3z1KM/MflYIUtv1P9+/wFJla5aCLJXFRretDRgnZqNS/l1UFL/hamz09Rsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457355; c=relaxed/simple;
	bh=7YnHenPV9LU9HH0oXXRrIPZLMPovAnvfYPI2d8UeBlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FYRotVE6AHGNoOB6305gui2cGkFKQpc8EmVeYD7gzRMstZmv0daxOFIRRXdKbzz8we7/m95P05vJmbqLxUqaYaihEoWGvnKcycrTBF0iNIvVWta+E6hgq82nColsu5Hmuioq7TErx39OdYZNj9+pijEAJbuXEqmoo/VMNcbcaPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nA1008es; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FI+GtCPd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M96VmP3532232
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 13:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gpOoi3K+3WVMMUDmiIwOSuu1JgGomDZPzYqit1n/jaQ=; b=nA1008esADISWpvt
	Fm9V+hDJyd6gdf6/NXGwEu9WXoDfqDHGn8eZ/NfBkNqJKtzvAwUXyfU7qezLgZjy
	1fFkljCIjJL+fnkBCylbEne3QTmA7blWrgYckzj44jxZlnBR+34l+Gts37gj061g
	NLWUuVQSGnqGHSHpOOHpsuG09sGklI4tHZA3kEvpJfaN2wh8drGkzrtM4x137WiP
	iNdAK2GdXINSMDIaIOoPbC34n0KN6GZpyWYkcsfdZXWoM7/EEv2Ufzg9KgPgrrWl
	bXy7un3eTe3Te3jXC+uxb7Hh0hALi3rppBjYJ7FOv7l0jFrTGN5M8UQeil4bKMnn
	v3jE/A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea39gw95u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 13:42:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516ccfa109dso4595811cf.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 06:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779457351; x=1780062151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpOoi3K+3WVMMUDmiIwOSuu1JgGomDZPzYqit1n/jaQ=;
        b=FI+GtCPdUuVq4mugQ22ogYD8Tf6usZOtpfaRxeKc3hBRESYb4rEXhHX/Nas9a2vTjG
         si3ibtcUahmWN8chdRQZlOt0tsRgqtSnFOQyHFRod8U0YSbmM78I/wIAOpzlv9u45JiC
         PlCplr6BnljuJ0wmH6JXZOIULNsbZXJjILIlB3aFb/EOf9Pu7GcxpGogM6VeaIp18qXT
         xkNwTVLSuCuRl51up4RpitXm4WdgRntsp88Zxm9fnIO1iuWk7I65epAINQv10z1NVjyM
         /58JDiCemvif8JRhxenYf13KpWLkiPmmdb2JqH/6tkonzajWAtQ3rfuFKeIxmdNVuhip
         ppYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457351; x=1780062151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gpOoi3K+3WVMMUDmiIwOSuu1JgGomDZPzYqit1n/jaQ=;
        b=rRATSiS5f1I3IQqmarqOvr8qx2/cV6ZYAktrjvsdL7hqNVzpGMhi+XllCIU5fYUss9
         8pauin2nGBKLUv030gHFw2iST7zpL4/nKmlaE/dpkzej6/jjJaMOe4b91l3Fc72nzMFh
         oJEYBCOF0e3CaDtBe8uobpMRhv3h6jF5372ZRQ3Znr/sQlHxmmWGgQnWnYNDgB/+ceTR
         wodIKwDkfY0WegWtDD94GDxhxZ062SDhg4jrPCLgAmLLYkAlyGqQ9FABol3jnoH61nJ8
         Cc6nbGN7KjfoTtk2PYYsdZqpoHIrxLusGt72gg1zzlTMcuAdlWk4dTaR5OO6C60rLlUj
         bClQ==
X-Forwarded-Encrypted: i=1; AFNElJ/9+5Cc6ZuMphVAt+1D/hitPkm+SkSYvylLg3AObYLAm979wqHQK871jCSMFBarfszcvEtPKwtxnqdt@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8zESrlh66LqFRwTQp2EMy3ehkKE/MVvKochAtKDeMl2Cd5dPq
	iUCCk1s4t8k26hVx2jUI6R31X+fTRE8dh14R+DoQ+eyFfn2F3Kk7GMLWeYe7NOAMFtU1+dlSZlc
	mAgR15Nq50JzAvOy93LUMu2CtdEXdVYMwP1scPW81WKdP2hovOwLlutzqI8QnWwoyCPYFBkxR
X-Gm-Gg: Acq92OEjPNsmqggSF6QZA+x3e0opeCmp/YOnCHdyD8T7Z0LE3I125GbP2ov00jYrXrN
	W0hPnX84p+lKswK2eNGYwwflWzR7Bqj74XW/UuHMSnhdqsUpcL1//vSIaX/jOtX3vUjmHTtoRKE
	zPu/7oT092/r7xrBLvYZLH+LO5ojzZ0d0w/DIXY7FzBfpH9BxzFIffd2CF0/rqe4KZEgsNNCbVA
	sbMCYOb5p2m4BbOJW2rQDYTwMi1QoWkFwMP5gstgno6jxCEUpLvTbRZonj1x50mL/yTYUZXHURY
	kAStFZB2aR++QgT/Xty51os/i0g5jcbl50YrRzrJ/uhHyQcg6Su985nLQVrH+75HUX7Tdhzhohi
	6Ku9ZiXPkk97dn5POia7QrItmlHiraqOvUrTZk+V7Fe6UKjuM8g==
X-Received: by 2002:ac8:5e0f:0:b0:516:41f1:9203 with SMTP id d75a77b69052e-516d4645f53mr51222931cf.38.1779457350881;
        Fri, 22 May 2026 06:42:30 -0700 (PDT)
X-Received: by 2002:ac8:5e0f:0:b0:516:41f1:9203 with SMTP id d75a77b69052e-516d4645f53mr51222331cf.38.1779457350359;
        Fri, 22 May 2026 06:42:30 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9f548sm4886546f8f.2.2026.05.22.06.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:42:29 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:42:18 +0200
Subject: [PATCH v3 3/3] gpio: add kunit test cases for the GPIO subsystem
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-gpiolib-kunit-v3-3-b15fe6987430@oss.qualcomm.com>
References: <20260522-gpiolib-kunit-v3-0-b15fe6987430@oss.qualcomm.com>
In-Reply-To: <20260522-gpiolib-kunit-v3-0-b15fe6987430@oss.qualcomm.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12281;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7YnHenPV9LU9HH0oXXRrIPZLMPovAnvfYPI2d8UeBlQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqEF0/d6dc86rvhkptlS2ysBrl3Fx3w9H7T4UiV
 mrxNR4Iw72JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahBdPwAKCRAFnS7L/zaE
 wwSED/9WDi6ixUviG4At3jGPIVH66nIjISTqQ1fqWtkf+PfLdqiuNK7An7drg20Aj3GfFVImmng
 sHxxojcLIADuu9Y2qdf3rvx6aGFO7PPmPrQ4EScJ7SATRfwtiCuGo2+wq6RCDBuAsVekLazQi6K
 ln+74qA7+z7yWYr9oVdX17mae9LkEZwmhv7I+BJBuDs+z62FIGenns+pVVnVH48jKy1e/lLgg5w
 mWextdgniq3LPPMPH1Y4czTkonnPR5JBM4MHdWgud/3fESDW64saVDxiU4FcaX3j4ObzhEFZ9JZ
 eBk4Q+VjMIyeMyNjyiNG3yMkF5m1DFjW+e9pggaeOAUW9sLkFO9ZJwaaen6cwibGZAleW4ktBaW
 p9E5QCaYPbBXdEFC3ZJPeqTCpl/blJYPLZgSKHb75r8McpI0Vrm722RBYzVuBEC0hVdCzwpHaQ1
 7qcMrEeHk7SQvjLf95eQMCvG+Ml/Vq8JV6Pb0li8sLyzniu759hroTTlXSm870GyDHrs4SC0pHS
 aDZDamgLhNogV2fo8MPEPGZNmIAoLz145jVlqlAELZKcQA3D9rWCyE9HH/qAsGcbMCZIbpoT4Jm
 U26ClM6GwaT6YV3X7MBN0dG1nZZw7KZBOZiWByK21+U1g/A4jMmv+/A7Je3ZrR2HcbzvrVMq2gI
 VvJyy+3bVVXfP9g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Yr8/gYYX c=1 sm=1 tr=0 ts=6a105d48 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=kd_SSO-Pc4bEN0uSuqsA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: VM3rJTvplTJIgXFQDF3gunlvZqz81b21
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNiBTYWx0ZWRfX19rRLU7Kkjs5
 b/x2pSoblVbMhd9TO5xzfv4M6TwTnPq+epNDTWaUMc7PM5H4Bw3MDIODaUzWKKDGHzXKGm9gKW8
 GIIE6Zjg2uizzn+IDDBaQ9SKyfTS3WmwdVeevoNyvesXXnHTFTF6cAX8eGeC07cVgtT/XPNoGnR
 ULakvUs43oichJiiJCXEwO7JOPFZRk5saTrMJCCXgFKG1uuWvvy3kQcovLQCf9RoPzfT6PL43mi
 rtCvxFFYVgODJ1x/AjLwmi5kzQ9o+pO2ccOMHeq9/hF7Tma91U2l9VwGpdkSTcS4w0MBJN9V54U
 TrzzgPLyuiK7kT7maFl90I9sow5y1kpRda1pHzolrOHJDjVtZGOw6xcsQM0j95Sx30dBOpqqLGZ
 D6BV+yIe0de/pjEC0deYYBhkERcOL8epaeie7YF1FSlDXHeyI53JQ4rD58fL0jQF3Zsv6geH0dV
 W8GJFz+0uEhYf2JXKPA==
X-Proofpoint-GUID: VM3rJTvplTJIgXFQDF3gunlvZqz81b21
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220136
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-37372-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[linux.dev,davidgow.net,gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CD0765B5F00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a module containing kunit test cases for GPIO core. The idea is to
use it to test functionalities that can't easily be tested from
user-space with kernel selftests or GPIO character device test suites
provided by the libgpiod package.

For now add test cases that verify software node based lookup and ensure
that a GPIO provider unbinding with active consumers does not cause a
crash.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/Kconfig         |   8 +
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpiolib-kunit.c | 358 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 367 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 00fcab5d09a4294ed778cea78af5867a0f6e481b..0306005fb7d65ae85905e967b9065fd74db753db 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -102,6 +102,14 @@ config GPIO_CDEV_V1
 	  This ABI version is deprecated.
 	  Please use the latest ABI for new developments.
 
+config GPIO_KUNIT
+	tristate "Build GPIO Kunit test cases"
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  Say Y here to build the module containing Kunit test cases verifying
+	  the functionality of the GPIO subsystem.
+
 config GPIO_GENERIC
 	depends on HAS_IOMEM # Only for IOMEM drivers
 	tristate
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 2ea47d9d3dca948e1cdc46965e83b0e1b6de5f70..c66b6dd659b16b80b6bb6b15fac3e3f462dec596 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_GPIO_ACPI)		+= gpiolib-acpi.o
 gpiolib-acpi-y			:= gpiolib-acpi-core.o gpiolib-acpi-quirks.o
 obj-$(CONFIG_GPIOLIB)		+= gpiolib-swnode.o
 obj-$(CONFIG_GPIO_SHARED)	+= gpiolib-shared.o
+obj-$(CONFIG_GPIO_KUNIT)	+= gpiolib-kunit.o
 
 # Device drivers. Generally keep list sorted alphabetically
 obj-$(CONFIG_GPIO_REGMAP)	+= gpio-regmap.o
diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
new file mode 100644
index 0000000000000000000000000000000000000000..380b68f879e55433668353bb88067d561142a5bc
--- /dev/null
+++ b/drivers/gpio/gpiolib-kunit.c
@@ -0,0 +1,358 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#include <linux/fwnode.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
+#include <linux/notifier.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+
+#include <kunit/platform_device.h>
+#include <kunit/test.h>
+
+#define GPIO_TEST_PROVIDER		"gpio-test-provider"
+#define GPIO_SWNODE_TEST_CONSUMER	"gpio-swnode-test-consumer"
+#define GPIO_UNBIND_TEST_CONSUMER	"gpio-unbind-test-consumer"
+
+static int gpio_test_provider_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int gpio_test_provider_set(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	return 0;
+}
+
+static int gpio_test_provider_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_chip *gc;
+
+	gc = devm_kzalloc(dev, sizeof(*gc), GFP_KERNEL);
+	if (!gc)
+		return -ENOMEM;
+
+	gc->base = -1;
+	gc->ngpio = 4;
+	gc->label = "gpio-swnode-consumer-test-device";
+	gc->parent = dev;
+	gc->owner = THIS_MODULE;
+
+	gc->get_direction = gpio_test_provider_get_direction;
+	gc->set = gpio_test_provider_set;
+
+	return devm_gpiochip_add_data(dev, gc, NULL);
+}
+
+static struct platform_driver gpio_test_provider_driver = {
+	.probe = gpio_test_provider_probe,
+	.driver = {
+		.name = GPIO_TEST_PROVIDER,
+	},
+};
+
+static const struct software_node gpio_test_provider_swnode = {
+	.name = "gpio-test-provider-primary",
+};
+
+struct gpio_swnode_consumer_pdata {
+	bool gpio_ok;
+};
+
+static const struct gpio_swnode_consumer_pdata gpio_swnode_pdata_template = {
+	.gpio_ok = false,
+};
+
+static int gpio_swnode_consumer_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_swnode_consumer_pdata *pdata = dev_get_platdata(dev);
+	struct gpio_desc *desc;
+
+	desc = devm_gpiod_get(dev, "foo", GPIOD_OUT_HIGH);
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
+
+	pdata->gpio_ok = true;
+
+	return 0;
+}
+
+static struct platform_driver gpio_swnode_consumer_driver = {
+	.probe = gpio_swnode_consumer_probe,
+	.driver = {
+		.name = GPIO_SWNODE_TEST_CONSUMER,
+	},
+};
+
+static void gpio_swnode_lookup_by_primary(struct kunit *test)
+{
+	struct gpio_swnode_consumer_pdata *pdata;
+	struct platform_device_info pdevinfo;
+	struct property_entry properties[2];
+	struct platform_device *pdev;
+	bool bound = false;
+	int ret;
+
+	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = kunit_platform_driver_register(test, &gpio_swnode_consumer_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_TEST_PROVIDER,
+		.id = PLATFORM_DEVID_NONE,
+		.swnode = &gpio_test_provider_swnode,
+	};
+
+	pdev = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	properties[0] = PROPERTY_ENTRY_GPIO("foo-gpios",
+					    &gpio_test_provider_swnode,
+					    0, GPIO_ACTIVE_HIGH);
+	properties[1] = (struct property_entry){ };
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_SWNODE_TEST_CONSUMER,
+		.id = PLATFORM_DEVID_NONE,
+		.data = &gpio_swnode_pdata_template,
+		.size_data = sizeof(gpio_swnode_pdata_template),
+		.properties = properties,
+	};
+
+	pdev = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	wait_for_device_probe();
+	scoped_guard(device, &pdev->dev)
+		bound = device_is_bound(&pdev->dev);
+
+	KUNIT_ASSERT_TRUE(test, bound);
+
+	pdata = dev_get_platdata(&pdev->dev);
+	KUNIT_ASSERT_TRUE(test, pdata->gpio_ok);
+}
+
+static void gpio_swnode_lookup_by_secondary(struct kunit *test)
+{
+	struct gpio_swnode_consumer_pdata *pdata;
+	struct platform_device_info pdevinfo;
+	struct property_entry properties[2];
+	struct fwnode_handle *primary;
+	struct platform_device *pdev;
+	bool bound = false;
+	int ret;
+
+	/*
+	 * Can't live on the stack as it will still get referenced in cleanup
+	 * path after this function returns.
+	 */
+	primary = kunit_kzalloc(test, sizeof(*primary), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, primary);
+
+	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = kunit_platform_driver_register(test, &gpio_swnode_consumer_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	fwnode_init(primary, NULL);
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_TEST_PROVIDER,
+		.id = PLATFORM_DEVID_NONE,
+		.fwnode = primary,
+		.swnode = &gpio_test_provider_swnode,
+	};
+
+	pdev = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	properties[0] = PROPERTY_ENTRY_GPIO("foo-gpios",
+					    &gpio_test_provider_swnode,
+					    0, GPIO_ACTIVE_HIGH);
+	properties[1] = (struct property_entry){ };
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_SWNODE_TEST_CONSUMER,
+		.id = PLATFORM_DEVID_NONE,
+		.data = &gpio_swnode_pdata_template,
+		.size_data = sizeof(gpio_swnode_pdata_template),
+		.properties = properties,
+	};
+
+	pdev = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	wait_for_device_probe();
+	scoped_guard(device, &pdev->dev)
+		bound = device_is_bound(&pdev->dev);
+
+	KUNIT_ASSERT_TRUE(test, bound);
+
+	pdata = dev_get_platdata(&pdev->dev);
+	KUNIT_ASSERT_TRUE(test, pdata->gpio_ok);
+}
+
+static struct kunit_case gpio_swnode_lookup_tests[] = {
+	KUNIT_CASE(gpio_swnode_lookup_by_primary),
+	KUNIT_CASE(gpio_swnode_lookup_by_secondary),
+	{ }
+};
+
+static struct kunit_suite gpio_swnode_lookup_test_suite = {
+	.name = "gpio-swnode-lookup",
+	.test_cases = gpio_swnode_lookup_tests,
+};
+
+static BLOCKING_NOTIFIER_HEAD(gpio_unbind_notifier);
+
+struct gpio_unbind_consumer_drvdata {
+	struct device *dev;
+	struct gpio_desc *desc;
+	struct notifier_block nb;
+	int set_retval;
+};
+
+static int gpio_unbind_notify(struct notifier_block *nb, unsigned long action,
+			      void *data)
+{
+	struct gpio_unbind_consumer_drvdata *drvdata =
+		container_of(nb, struct gpio_unbind_consumer_drvdata, nb);
+	struct device *dev = data;
+
+	if (dev != drvdata->dev)
+		return NOTIFY_DONE;
+
+	drvdata->set_retval = gpiod_set_value_cansleep(drvdata->desc, 0);
+
+	return NOTIFY_OK;
+}
+
+static void gpio_unbind_unregister_notifier(void *data)
+{
+	struct notifier_block *nb = data;
+
+	blocking_notifier_chain_unregister(&gpio_unbind_notifier, nb);
+}
+
+static int gpio_unbind_consumer_probe(struct platform_device *pdev)
+{
+	struct gpio_unbind_consumer_drvdata *data;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->dev = dev;
+
+	data->desc = devm_gpiod_get(dev, "foo", GPIOD_OUT_HIGH);
+	if (IS_ERR(data->desc))
+		return PTR_ERR(data->desc);
+
+	data->nb.notifier_call = gpio_unbind_notify;
+	ret = blocking_notifier_chain_register(&gpio_unbind_notifier, &data->nb);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, gpio_unbind_unregister_notifier, &data->nb);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, data);
+
+	return 0;
+}
+
+static struct platform_driver gpio_unbind_consumer_driver = {
+	.probe = gpio_unbind_consumer_probe,
+	.driver = {
+		.name = GPIO_UNBIND_TEST_CONSUMER,
+	},
+};
+
+static void gpio_unbind_with_consumers(struct kunit *test)
+{
+	struct gpio_unbind_consumer_drvdata *cons_data;
+	struct platform_device_info pdevinfo;
+	struct property_entry properties[2];
+	struct platform_device *prvd, *cons;
+	bool bound = false;
+	int ret;
+
+	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = kunit_platform_driver_register(test, &gpio_unbind_consumer_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_TEST_PROVIDER,
+		.id = PLATFORM_DEVID_NONE,
+		.swnode = &gpio_test_provider_swnode,
+	};
+
+	prvd = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, prvd);
+
+	properties[0] = PROPERTY_ENTRY_GPIO("foo-gpios",
+					    &gpio_test_provider_swnode,
+					    0, GPIO_ACTIVE_HIGH);
+	properties[1] = (struct property_entry){ };
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_UNBIND_TEST_CONSUMER,
+		.id = PLATFORM_DEVID_NONE,
+		.properties = properties,
+	};
+
+	cons = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cons);
+
+	wait_for_device_probe();
+	scoped_guard(device, &cons->dev)
+		bound = device_is_bound(&cons->dev);
+
+	KUNIT_ASSERT_TRUE(test, bound);
+
+	kunit_platform_device_unregister(test, prvd);
+
+	ret = blocking_notifier_call_chain(&gpio_unbind_notifier, 0, &cons->dev);
+	KUNIT_ASSERT_EQ(test, ret, NOTIFY_OK);
+
+	scoped_guard(device, &cons->dev) {
+		cons_data = platform_get_drvdata(cons);
+		ret = cons_data->set_retval;
+	}
+
+	KUNIT_ASSERT_EQ(test, ret, -ENODEV);
+}
+
+static struct kunit_case gpio_unbind_with_consumers_tests[] = {
+	KUNIT_CASE(gpio_unbind_with_consumers),
+	{ }
+};
+
+static struct kunit_suite gpio_unbind_with_consumers_test_suite = {
+	.name = "gpio-unbind-with-consumers",
+	.test_cases = gpio_unbind_with_consumers_tests,
+};
+
+kunit_test_suites(
+	&gpio_swnode_lookup_test_suite,
+	&gpio_unbind_with_consumers_test_suite,
+);
+
+MODULE_DESCRIPTION("Test module for the GPIO subsystem");
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>");
+MODULE_LICENSE("GPL");

-- 
2.47.3


