Return-Path: <linux-gpio+bounces-31330-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBIFB8ybfGn2NwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31330-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jan 2026 12:53:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73325BA2EE
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jan 2026 12:53:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AD31300EAAA
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jan 2026 11:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A389536D512;
	Fri, 30 Jan 2026 11:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FV99+joY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TwDlMYg1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4422236E464
	for <linux-gpio@vger.kernel.org>; Fri, 30 Jan 2026 11:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769773985; cv=none; b=MdTS/6jOvI15614EJJ57atXkz9NuhCn3MFoQjoe85XcIjZNJZa6IpU9oti6Tjn/rQigwZhIXo7B8O8fib2cji1omhILKBy8lvstV6ZV9oacdnwdY/4n7Rka5/alMAeRgIU0p6kO3PekAe+9EzXC6LgVYcm/HDoXUHrvRM4n62wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769773985; c=relaxed/simple;
	bh=hAjAoaycStcIB0uVOYATMfurg7DSPoAyHfAGLS0jJCU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rP9iJNjOfHcyIdiObem6AOgqbWUIpaAleqZF9RfXXSo2eA06TInxrrLzg0R4K5NvUwxL87uQPslwP0CSsOohWkA7tHKNMJmmNPGe1GQEkX5C4iXp3bY2zB+l1/9nb0vH4D1V5g3X4+xdRNwu1LmuLpC+dWUZ4+xsWo4qknL459w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FV99+joY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TwDlMYg1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U9V2IW2675459
	for <linux-gpio@vger.kernel.org>; Fri, 30 Jan 2026 11:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/UV7Kff6Ua9fg1jcURS5NPwBgdlLcX7SOgF
	ADHW7XyQ=; b=FV99+joYXu2F/F29GRRpAQBZ5xyCIxTPsUTJY5YAqYv1QWe5cEw
	oRfbP8L4mTELYChpdya/yShW+C4zgCArnslsjrb69KLehMksMy/Ay62P+TloMX43
	wbUQFKHbAJzLwHQ8ApmBwozSWBOcZEY0YU0mDDnS5A2wUphJlDMb/i58ILeUOse0
	6M29qXeEQwQWuuoq1fGAQiQ3oxdtYKRdCTmxF8uqOBkMhdN5hoetWi8of+NDfgOv
	sMvVNZp9BbsZ9kCyZ1n6HcgFtCzQ+XWcl1tglKdQ/JiJDvAaoFfZYVXxqOqOKTpp
	RcVKynxd1l8D9jXgrbKnApxVcZBosD2FCTw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0t340da3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 30 Jan 2026 11:53:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a289856eso843392485a.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jan 2026 03:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769773982; x=1770378782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/UV7Kff6Ua9fg1jcURS5NPwBgdlLcX7SOgFADHW7XyQ=;
        b=TwDlMYg1qt7JVrKVggu4731c2yzzqtaOKJrv2fdLVEEnlLcR/gell9nK8w2em2HpJe
         V2OZoMW+UNVjwgbkvhfOBM0PIwnb56pcSrt7mdPoakjtlnI6yKIVX94NLzxoHjnWRyB/
         x1Ec0nZZgifAcoMkGe1DON6rcMgdocXllYzi2yKGTsRkYtZPmWWXyCjFNojXQxyk1Glw
         dEzAzThzOwSxxJ2ePhVwqUwAbyf4L40WUgY1gwLz0z1a2XCBc1WcC6zgd4uoMIV0mGS6
         Frf1of3FFxyCDpDrZAFub7iL6zEQVFmFL0YHCTuohhb5JAIoux/ZaRdvFiVoFH/tg9Jw
         r74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769773982; x=1770378782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UV7Kff6Ua9fg1jcURS5NPwBgdlLcX7SOgFADHW7XyQ=;
        b=PoiZ6nhhMImV5ZwXETC7o4GpizdAPoROLNAeOqtlJ22iCdPqi8XraYZ3n3fJU9wpkF
         xivh5AJG6IMFVUQOfK6X8cr2RuP3e85fnI9YE0Z5ouN2EBIQ3v5p4ehqQ9bPSbrWSmNQ
         pvjIqqxYtT7YdXgqpbOQ1jFTOkIHkBISS60ZjEwDlRJ2zafwW2aRZfdBuQ/lWEes1eX7
         FT8BE7/SqicbYoEz64nCxhsBLp16wPJnn9g8JdmAQMNdWGn6FUcY8XiDb92sxgMtGouC
         mzb/ZBxFxO818Q29xKITOdcbd9exZe+rQ+1BIdn92gvq/9x9WkZ+X7h/ujtKXhLIwONt
         Q8Xg==
X-Forwarded-Encrypted: i=1; AJvYcCWKkQLu2S0TVwrkLZ/dzx69lrKpH1+DgV8B8SqDUg/+O3iHhGUkqz0pEdjc4MgTJPqh+N0ZolmA1JaG@vger.kernel.org
X-Gm-Message-State: AOJu0YydrdcxNdu/MJAoRKC+CoOKiwVVNf6KgtTeba8a/qt7lJb3XMp2
	GiSXPJ8LETi9ZgClJg0ZOGgeIiZ1MCzF9mpLGcZNQGEAChJnfxFBShBMC/mCWP5HlDWFK0CgKQb
	F0dqDBeESTv9VzZp2VAsP38HSWQCNbYZwFWXq+CvmXtEDyKlUoAU9th5fCpEpgWyb
X-Gm-Gg: AZuq6aI8G2TjQQwKfEhbocpl3dBW6uorgQqdkYSq73+vb/ELygORl9jHL2USZX8M9xZ
	U4XN0xMT2alZM4O2dAc6eWGzWW1UT96VVwpk7/uEK8Qd/0g8OgyL/nmKBxFYhFZFKln7n/ysTSU
	4u3XGQ6ijpbXU0Guh/ndgUSSaqydaKD3v2X+iGAxYuwDDLBt3bSOvz20yDt7+MJKvr6WTEq+6oV
	Orl/z4PTU2NDgAMBG9u+ApIowX2RLqWPHY97liTTqyDSsB5c/WCbCZqRBdPe+DEUBWxD7oO4fhu
	GVLCyD2Jrv6HLymxMhd63/7Od0RClL0tzRXa4IVeXbo2MQW4TLE+2sJ5+I9A21qTtvUtVHdskpY
	w5aVE0hXGQxJcTKZXaBZSD5fgGMZHtBad84ttNg==
X-Received: by 2002:a05:620a:4713:b0:8c7:79d:f91b with SMTP id af79cd13be357-8c728aa5797mr757731685a.6.1769773982445;
        Fri, 30 Jan 2026 03:53:02 -0800 (PST)
X-Received: by 2002:a05:620a:4713:b0:8c7:79d:f91b with SMTP id af79cd13be357-8c728aa5797mr757729685a.6.1769773982018;
        Fri, 30 Jan 2026 03:53:02 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:ad93:52fc:1871:c54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482db623407sm23439215e9.0.2026.01.30.03.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 03:53:01 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v6.19-rc8
Date: Fri, 30 Jan 2026 12:52:58 +0100
Message-ID: <20260130115258.24843-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA5NyBTYWx0ZWRfXywZaNulZ87Fo
 5fw6efPM/IxFSopRSZTpnB80mXya0IPy3TTple+WoFdtNi5A9/mX3M873JQsAcZbh3VRnbXkZ5d
 y9GiGFAyeOa+OaTHSYf993CdZcL675wZd4gIQS7YJtv/6RechNXt8LJw/8kczG9EEJuH9vUFtWT
 AG5wf0ctlFegOevDdxEWnwF8m7i2SQT9SNmJ0Qu7DmTamLLN0yW3Oc175qKO9tsf7x6KpB2Rr6W
 LvI1BSXqsLCWU5sM628e9SWnWM7LQPXk9NeY7HMaI7N/Pc/tmArMynp/A+Gh6uduxj2z2Z63t9U
 LfLtZ/+B/WuP4/6nuih/TWRoFpBSXlYXemcWS76sXTtp1+/VPAiPlEyNZas909Q5FgJGD8VsCh/
 xcxwltROJqzPiw3wauCDsBBw/uTrSMzeKUdU3CxymIU6Z4uUyJBoLMdO0AGJPPQ1yj7VNDRb7Ho
 xXYjXxDzm1VRrRb1E0g==
X-Proofpoint-ORIG-GUID: RGLAGOG_3Fmyb4MxQcCMY3RZXAwR7ppg
X-Authority-Analysis: v=2.4 cv=QfFrf8bv c=1 sm=1 tr=0 ts=697c9b9f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8
 a=mhgX8rirUExWjY40x4wA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: RGLAGOG_3Fmyb4MxQcCMY3RZXAwR7ppg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31330-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 73325BA2EE
X-Rspamd-Action: no action

Linus,

Over the last week I received quite an unexpected (for rc7) number of
fixes but they are all pretty small and mostly limited to drivers.

Please consider pulling.

Thanks,
Bartosz

The following changes since commit 63804fed149a6750ffd28610c5c1c98cce6bd377:

  Linux 6.19-rc7 (2026-01-25 14:11:24 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.19-rc8

for you to fetch changes up to e64d1cb21a1c6ecd51bc1c94c83f6fc656f7c94d:

  gpiolib: acpi: Fix potential out-of-boundary left shift (2026-01-28 15:24:09 +0100)

----------------------------------------------------------------
gpio fixes for v6.19-rc8

- don't call into pinctrl when setting direction in gpio-rockchip as it's
  not needed and may trigger locking context errors
- change spinlock to raw_spinlock in gpio-sprd
- fix a use-after-free bug in gpio-virtuser
- don't register a driver from another driver's probe() in gpio-omap
- fix int width problems in GPIO ACPI code
- fix interrupt-to-pin mapping in gpio-brcmstb
- mask interrupts in irq shutdown in gpio-pca953x

----------------------------------------------------------------
Andy Shevchenko (1):
      gpiolib: acpi: Fix potential out-of-boundary left shift

Danilo Krummrich (1):
      gpio: omap: do not register driver in probe()

Denis Sergeev (1):
      gpiolib: acpi: use BIT_ULL() for u64 mask in address space handler

Doug Berger (1):
      gpio: brcmstb: correct hwirq to bank map

Martin Larsson (1):
      gpio: pca953x: mask interrupts in irq shutdown

Robin Murphy (1):
      gpio: rockchip: Stop calling pinctrl for set_direction

Xuewen Yan (1):
      gpio: sprd: Change sprd_gpio lock to raw_spin_lock

Yuhao Huang (1):
      gpio: virtuser: fix UAF in configfs release path

 drivers/gpio/gpio-brcmstb.c        |  8 +++-----
 drivers/gpio/gpio-omap.c           | 22 ++++++++++++++++++----
 drivers/gpio/gpio-pca953x.c        |  2 ++
 drivers/gpio/gpio-rockchip.c       |  8 --------
 drivers/gpio/gpio-sprd.c           |  8 ++++----
 drivers/gpio/gpio-virtuser.c       |  8 ++++----
 drivers/gpio/gpiolib-acpi-core.c   | 21 +++++++++++++++++----
 drivers/pinctrl/pinctrl-rockchip.c |  9 ++++-----
 8 files changed, 52 insertions(+), 34 deletions(-)

