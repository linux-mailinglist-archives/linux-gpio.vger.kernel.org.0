Return-Path: <linux-gpio+bounces-37069-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJ8WLG8gC2reDgUAu9opvQ
	(envelope-from <linux-gpio+bounces-37069-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 16:21:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5350C56EA1D
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 16:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B0C130508D4
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 14:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01881481FD6;
	Mon, 18 May 2026 14:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kv5Ok+S6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ES67cN6R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0471848BD24
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 14:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113811; cv=none; b=hjnIaZPIY6M8UqljrjHlrdXZ5erwBJrlglt4faDxV5uP8M8zECSRm9qbsf7uRXsGEP50uOfT0BvUR8pvXw+tFYeLyjCyOnOxLimfCc3BMsQFvYWW7QAYshEI9VgkaBP4ObQVrWNbCq7+r6j4aNQy10r3HQi/W3AQdbIBNBxuHBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113811; c=relaxed/simple;
	bh=BmKFZ16woToo8VTwA3cT9gFAnZXIwnot36eGFq+4CeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QoTjGLyvKqTodeYK7EMjYgfz7oYSE6+VekQ69fMNQ4saMPJKQfrLsluG2Wvn8mw5eKhYrntRTIfBRpbfbHqhetglDHhk5mza7lzmNdrueP8j0DgGJorh/mdcNhSZGZoUK2Wq/1oi4Dld3XGuw6a9hMzhcRb+qFN02CJRnESNeKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kv5Ok+S6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ES67cN6R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IE2Q242892643
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 14:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pd8ZAERHCpbOlJVrvmsk3jHZZ7KVbOqxjjh2kOkwDyU=; b=Kv5Ok+S6yIA0rERr
	2I6FxbSwH6gZ684PrpYWS1whxz9nmSuE/3p4wLSoD/X8jkBXM+RvgIAMNV3dTdKS
	DJpP1FNPrvUzTrTVJlqYxuKRvdn/vkhc2iFKSCMswbx/zd4xTGzOIDZhE+pFFyLp
	gziqSb4i5VFqgp+54vwNlDsJ0BHwRDxYYemSx26xEz4Z7SKaRh5oUg0R69e1xtZP
	WJYiBx4KlHknntF9eD7+o/3I2eXiWiMVZef/FuvE4BLOfKTiS08zCi/EHy4cxjTh
	AlcfQKTfFtWXo1ZSIoVZx4x58w7R3hO/FPDjY21EOMzz7ZNumRSR8MX4/7XBfvcj
	pMyq5w==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xk19kw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 14:16:49 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7dccdbdf5c2so2909381a34.3
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 07:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779113808; x=1779718608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pd8ZAERHCpbOlJVrvmsk3jHZZ7KVbOqxjjh2kOkwDyU=;
        b=ES67cN6REmhFwrJLDAFJfjSm8OZZNdeDsQJpw+upw5NDavgiAT4PbbFbDLIm2glEWG
         Tokr+uj0tb07wKSNoCPal8274kD53mGelnaj4zOcO1pMQtF40dWCHaUrlEkBrzRYXuZ7
         fONZ6wQ4NZbLfuhlSzvYANk5HcYbPI5Hkw7KJp2QkavSlksy1EF16KwDirR94Bgce0Mc
         eO9wnyh3BopFrwo5eZOcO01Vp+d7o4AuzRr6f0ymgaLwWwlPcMNJw1DTx2X1iwwKBU91
         zrbg0SCyBuJKweGAhTR94nazdQUUdsvqnp8j9beu/L3wiJmd68M4DOEd+VhDbe26UvMK
         7i8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779113808; x=1779718608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pd8ZAERHCpbOlJVrvmsk3jHZZ7KVbOqxjjh2kOkwDyU=;
        b=l73qFU7oolKrjHTyZw9UqOz1WyR6KXAj8oSu1QBlKC0KnEiPtIAp1ew5MxCF1ajrRb
         7cpqI85ei5SHRRG/K/a6RoKQDwrVXeOu+BH8984f5zkn2hRPsIIKuJb3ZYzOXPvoje9U
         Odetl/9xLLBYo5kwpaEeLKqFhHgck6HKO1byCuXshtKtOm9bfltOeGLmk3Btm55ZI6h+
         +1hRABSWLeLIO0tTFGUu7slmTdqhTKgQB3pTa7KmZwiI6Twv0uYp8nhmKYNE+I3ZUowu
         gyOF/CoqgqcknDHp77hQjVVSr4A5dHrDQ8ZbnQWgTAF2QsKOFOJ0iaQxVQukt2tew/oM
         B+lA==
X-Forwarded-Encrypted: i=1; AFNElJ/UrfOPKs5SLduOOrzXwPMx+WVfuwanQ5c2RJOX/eaOjF8Au4CD/0zvkEkEcE0zHRvH3KgKVjuosziZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ/YcepiGD6zfeJ66HUDrmtajfwZTDowYyfRLAuEAq5FsMwdVl
	HTTNgTiYv2GGq/g7Egsj7h44d5DKqV6m6XrDnlKkdmrVrdzf2QGjkF0uZC5EWmvi+yLCJ1jFVAm
	GZNhX012muWaP5ls7DLBeEhVEPDramA7auTUX7TF+N4k7OuZ5l+sLoXahpFXVA1WY
X-Gm-Gg: Acq92OGw72U9QsvbRJHjz9JYjxkUXpXYK0tNqmrORcyeB0IezMvvzy+y02bNcRwUOkH
	WD1AB+DTNnmKHkaS/XXvK3brxfjToZ4wD+kHGqW/HzQab5cxqCr+nrfVbgcncnItv7zRaWVodcg
	M5EO54dFRDEfrFBEw+n+SBAH+kHqCTI2du7TY1JHA3OzQixUzGV2ghQ4OiQ/33aAuQfmy7l+dIf
	dfSoXrNPEUrz/w4WsKT483u/2pPpYGqoUnlQfRM/RQhDXXeF7LDY96r9+NEeWmXJuOAKXAgKGU3
	Ja77BtDee3kpuA57GImDyuDvWkcYk5sUE7g4bqvZSlOkyEloPIcFqmD2n7hHP6JztEnfDziy7fm
	EBGAQmoxyzjJzW/ykA3PvErNzMQ/VIXvD3MMzJwI02RFYZ4heow==
X-Received: by 2002:a05:6830:6688:b0:7dc:c4ae:a689 with SMTP id 46e09a7af769-7e4ea081258mr9858885a34.2.1779113808138;
        Mon, 18 May 2026 07:16:48 -0700 (PDT)
X-Received: by 2002:a05:6830:6688:b0:7dc:c4ae:a689 with SMTP id 46e09a7af769-7e4ea081258mr9858812a34.2.1779113807579;
        Mon, 18 May 2026 07:16:47 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1337:b6d0:456:372c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaa2949asm119371225e9.1.2026.05.18.07.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:16:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 18 May 2026 16:16:30 +0200
Subject: [PATCH 2/2] gpio: add kunit test cases for the GPIO subsystem
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-gpiolib-kunit-v1-2-131ec646c4df@oss.qualcomm.com>
References: <20260518-gpiolib-kunit-v1-0-131ec646c4df@oss.qualcomm.com>
In-Reply-To: <20260518-gpiolib-kunit-v1-0-131ec646c4df@oss.qualcomm.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12340;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BmKFZ16woToo8VTwA3cT9gFAnZXIwnot36eGFq+4CeE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqCx9J730mYv54PYpt7ImWUfS4BmcvQFe7aqfQG
 Ox3enF+2MOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagsfSQAKCRAFnS7L/zaE
 w3ozD/9I47UCpa4J7TaSEJOPXRqRTxIQZVKVmTNugs7E66r5nPQyLflg0TMbZ8VfoCMFk6HTV+K
 bTvuBmVf7cZCI7weaYIz73SRhULCwy7h3/FsuorniPcwBHxJ+NvdZ+ctZsavMC/Nat1vQZHPCt0
 R7ixP5WmILwnbZnxCuxVkn//XITrPQ9QF7eZXrSZtcLdr2Rfj9kH3/kKlfXNEK002P2UsJaBrxa
 HZmN3SeuZzC5C5UaUWN/6FSqPKKbzz/NWyQf10oIIutwesZktrsLEEChOiCkq8AMHLbyV5PzjwP
 To+3UlqALvk7sdQsgVn4nJ2EjKETuzQCYvKe1jA+hCL09tSzxekCVWuqYJm4Kfa26V7Nx7Ne3E4
 FqmGqdNZVMq5uOtFySlJoKyNeagM6jij+xJ1hCGPlPy0eKl7jU2yxva7CK1PYHWyxFxuldHRt/z
 RV1r6v2iVcO3rS1axyt94qNUIhDTQo9h3qaWyBDY48bhBMA2bStKAEW7Sfvelf902LZpccg4dsB
 /nhMKcj6Mo1RQH6QZ88w7Lgv+EUOeJnNz/acm/5YMRlfpBBHQ0qA89lyKvI2a1Opgez+77r8Uli
 ZmaDJn0ZzpRTVMR/9n+yVb3SHrox/LpKJo56EP/4+35uNgfIxXaSThHTOa/3bKrOYusoLeTvi1K
 e0r6Y3TeG0qdOkQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: G-7g5NIVfdbaMP59iH8R1skH1s_whwCw
X-Proofpoint-ORIG-GUID: G-7g5NIVfdbaMP59iH8R1skH1s_whwCw
X-Authority-Analysis: v=2.4 cv=BICDalQG c=1 sm=1 tr=0 ts=6a0b1f51 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=kd_SSO-Pc4bEN0uSuqsA:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEzOSBTYWx0ZWRfX7OXDGlYoj/+e
 PP3gwyTeIrxznO/55BvaGWgl2+cQcXwtvCpfxk4dtONNN/mYDH3S5eeHR/YCPyjMg0NobTbmN4P
 GVFTxyCfxqTu55bq2iQzYUM5zQQXByIsvJhPykbMhLm9JRHjqjH3dy0Wp4i5z3OyNAKmz97bTs+
 YPwg6f8mhzQIcPT2KXnS0JTVsTGfzy/aPt99xIiQ73f/wS/waMLZhkE04q7V9xZUAZdNgvJ7OYF
 8TL7egjxx3msvC4MudFZPigmB12M6kTCwTDY9weGWOkcP6NORIvq10lyegS7lbaJZkq7l1YrAdf
 ML9z38vID9VodkhJejgcR8Ve1agciaJz8VyL3YCXAspmWMJ5UMYU+nEDWT8TvwQPj2tZ/6pDv/o
 p4yTuN0ySBOuRLKe/Okst8mDQKOrAzgoSErZgza28ilgIGPEJPZTxK8Pg7kxOOQcl4af2ETJdh1
 32NKGaVqre14J7aY9RA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180139
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37069-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[linux.dev,davidgow.net,gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5350C56EA1D
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
 drivers/gpio/gpiolib-kunit.c | 354 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 363 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 020e51e30317a8574638bbe31365a3cf49591641..2ed9ba8d9c12b0fec9f6fa3fe6077f5588bf719c 100644
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
index b267598b517de089cf6339d837264f1d09e275c0..b01163c6a94db1aa21d895fb897e87be62b816e4 100644
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
index 0000000000000000000000000000000000000000..f45ba72362f82387d7e345fe57c6ae976265ff9c
--- /dev/null
+++ b/drivers/gpio/gpiolib-kunit.c
@@ -0,0 +1,354 @@
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
+		KUNIT_ASSERT_TRUE(test, device_is_bound(&pdev->dev));
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
+		KUNIT_ASSERT_TRUE(test, device_is_bound(&pdev->dev));
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
+	prvd = platform_device_register_full(&pdevinfo);
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
+		KUNIT_ASSERT_TRUE(test, device_is_bound(&cons->dev));
+
+	platform_device_unregister(prvd);
+
+	ret = blocking_notifier_call_chain(&gpio_unbind_notifier, 0, &cons->dev);
+	KUNIT_ASSERT_EQ(test, ret, NOTIFY_OK);
+
+	scoped_guard(device, &cons->dev) {
+		cons_data = platform_get_drvdata(cons);
+		/*
+		 * We can't have KUNIT_ASSERT_EQ() under the guard. Despite
+		 * the lock being released automatically, it will complain that
+		 * a lock is still taken during a test abort.
+		 */
+		ret = cons_data->set_retval;
+	}
+
+	KUNIT_ASSERT_EQ(test, cons_data->set_retval, -ENODEV);
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


