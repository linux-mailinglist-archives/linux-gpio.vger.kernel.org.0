Return-Path: <linux-gpio+bounces-30979-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNrsDBVFc2lEuQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30979-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:53:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8451D73A70
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 146833024A7C
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 09:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C86DE33F8A2;
	Fri, 23 Jan 2026 09:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="POFBQ7NK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XJB7ohjr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A18924B45
	for <linux-gpio@vger.kernel.org>; Fri, 23 Jan 2026 09:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769161896; cv=none; b=nxl48jbynxdRZ5fZX0/R8nXlZ0RXiiHrK01QhOiDL7H0IIjbrxdpCEk9F1UGfUU0TCYyVrSNQrt2AdT5R50QNNuyczyXAF7cL+tpO+s8cHYadtmeFDZukI7TcExXYcHHWh+HpiAcgKVSoV7mahPZ0lcsMVGclc+tkpakrNu1PHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769161896; c=relaxed/simple;
	bh=V1mVHtVhA48bn5s7zSjY1RiDmEmr3bdyQKSjLk2lEkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WId/+mOSxbsaLmU+XKaSi4/ZJWtqsX8UYCwpBbpFfbfDxqE9XR+aiCTGsKHbyWw1OpgPVkvUNdelYL2QKZbo1Z7oQOhZ+6f7085IGe1QIcP8xBz0TJqiJV/iVyN4p+p8QpdfOxMy9iKzNXvv1j7tVEgSqrEJdpEjc8vkWaT/qkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=POFBQ7NK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XJB7ohjr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N7W7tt2909018
	for <linux-gpio@vger.kernel.org>; Fri, 23 Jan 2026 09:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NRv1Use63DYh95iwBNothYStCu1TNSas2Dq
	QphtCZrU=; b=POFBQ7NKhJLzBRwWQbenFQpTGJsSwsj73aeAt7fQFkbas4878y+
	2K0NKGkA2ItsKot8cjjR+l1a2+fqkD0bhm7bcSbq1OSVTUJ0i497RPc5hg330Llt
	xkqlsFxMqfsISXkb7FUiC8cSAIrm2sBOIgJrNR8JRZXZkg8n4rAClwf71Zd6KoMa
	JiR/ZIAWpO/Wn8pCe6eL1usGV9+j2O4La3flm97u7O8l+iVecTFlbi/3X1E0wzKv
	8bQFZCCe1/Ao+0RsKnbtWtduf+uYPHz7glHkTsbtoskFtGBi23nkFPppB/ulqrFE
	l6hDEJx5L7a8k2GpA6N1w+RSi3MbZVWlAUg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buvs1t3yp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 23 Jan 2026 09:51:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52fd4cca2so580142785a.3
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jan 2026 01:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769161886; x=1769766686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NRv1Use63DYh95iwBNothYStCu1TNSas2DqQphtCZrU=;
        b=XJB7ohjrbFL2hJMaqBLYYuDT1Duu0z+TubPDQ0lxXUCi8pfi8QS2Mj8satuc3TYaMJ
         sme5XVBi4gi2ZMnJTCWi2JGX5whxoChWe51WfHPc+OTicTUo+LSXpmhFIPpC5iOoL+QM
         g41B5DYuyUIN0Aig2KzzJPBeTCg1azEqDvxSmaqSSjaS4XXHH9zuO9HoU8822QUxaROu
         KwFoWl+MH7kcHOxgJiEkmslC+nwCh71t9SB0gE8jHKOVuHLs/EsSZKIen6+PQYkr3OzV
         e+M/olPs+X/dnq3g9866Saq7+aXrG5Vhbpbv+am7blQAcwnk5GyZYOm3g6Fpg+ujrMy2
         0YOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769161886; x=1769766686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRv1Use63DYh95iwBNothYStCu1TNSas2DqQphtCZrU=;
        b=OUaHU5cDH6tf0ZTO9O0ZjcKK9YGjFpGNCajB8hCC+6Tuh5yRsBuLNFtRtVUeJ37Qsa
         w7QNPehSPqL+prNAhke2CPCls6ruE4vd+lepLPBxA4r3xwMUxT65OxEK+uVfhDeHl9wP
         UK4zfAy+JwYkC1kFsIHhvGv3d9jsl/kp5v4Ek/2x6/wR3f0AJ4NW/aBtyNV6vlFZQ73W
         Z+woYHAJYmCYN6CxevMUyPxlOaKdVFD1y0kgGr4gJjw8ps1iasio7LPVd0s6n+93IBv7
         OcRjgmr/qwAvRBrxAQkfnaFn5oqc8wtpEPynlsgpvqjGf791LFDNsXiuhUiMyl7/8cH0
         UAfw==
X-Forwarded-Encrypted: i=1; AJvYcCV9bL1orhb0uJ8ZD7KEoQ3NVwciPQ8+v4uzOJ3IJFCmDk7ggLEVPjAGdJmB2u8T/hMWaDYpMedOJ3uG@vger.kernel.org
X-Gm-Message-State: AOJu0YxFFcxRw+NYlznGGVwjE1Nzg74p81nQk+CxIUsqqU15cuI2FO4u
	jmvxP+yrJFfyfZYI3YGV3G49yKybviWHxXGsV4mM1Q+tcQAp3f1k9xxJ8klYfLcGGYO4lTJTz9F
	+N4F3QRExtg+J2DSluHvlAdgCXtA9BPgmIJkqq7eg2MD0+gauyJomBJ7g/mbqAJpZ
X-Gm-Gg: AZuq6aK9M9LYmUvWdTE1dDdnMAeumUoF02cyt5aXS1X3rV7uh3HwuEp3XPVNIUpZuxx
	95uoqeE4YQOh9FmiTbA+JK/eP+7whLVYiqKbCshyfc5ETRXG3YtrlInmk8yI6lWhTJsJXV/SoZW
	Dw0KY1PPZycXwyrO+kVSqWxanrD1wCCWsxP4IOLrvjTKuN4P56u5R7xJC28r61xThezr99iJTsj
	QP7NKEDFZU0MOi9CuSsi9dwzdrnR3jIy/bXSE0hq75sSekcUy+Q371brO3V6hNlsOtfD8Rc8LpP
	W6t7CkBUHTpQJvbzo8Zy0Qg3K6u6nKJO6J3dsWSYR4fwlUv69G4xxrK4CfFn/V71m1q9qA5yB9b
	XClng/Kx0iKH6Nu7kqq1fpVgtUPOGDNw7+sQZVYk=
X-Received: by 2002:a05:620a:1911:b0:8c6:de6f:8994 with SMTP id af79cd13be357-8c6e2e586c5mr316170885a.78.1769161885903;
        Fri, 23 Jan 2026 01:51:25 -0800 (PST)
X-Received: by 2002:a05:620a:1911:b0:8c6:de6f:8994 with SMTP id af79cd13be357-8c6e2e586c5mr316169785a.78.1769161885508;
        Fri, 23 Jan 2026 01:51:25 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1c86:c19d:d843:dd83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbaad79sm16401025e9.9.2026.01.23.01.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 01:51:25 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v6.19-rc7
Date: Fri, 23 Jan 2026 10:51:22 +0100
Message-ID: <20260123095122.13589-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: n-DLv9BVBe7AnJOtwl7cMV7t5Ugx4jAZ
X-Proofpoint-ORIG-GUID: n-DLv9BVBe7AnJOtwl7cMV7t5Ugx4jAZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA3OCBTYWx0ZWRfX6kwWR6Y323gG
 oAAdorFZqfsBWjhQo3vIMjROEbinvrObdGBYfeeego1ua5ue3YZ/rMRXC0MOz0NoUKGIUYgRf0i
 TCvqC2QJ56paTLPaghbl8Fj8Mc70xsxhv7vdap8pNbU7BaVkzD7HaB0+DNlLPbEUFhEk99l74nb
 p65hKtUHO9uCN5V6Okd3Wh9edAUGdi+SB0KT3DQFKlL5P3/NthtH6+1zaybslU8VyDJxnxq1lxY
 z5kWgJkaKd64ieQoGrIi/TxUPvPW7FgG+Ffm2Yk1KtKGgnhB6AzowBQvKVAw+4tPpfgXVF7+Umr
 RDzN5XrcjWGQMy07Klr9helEvnOuFvfDGhW6jJ17Tp2jP+L431a4Cxrf2xnoeADQRfQ/KjMRoZG
 IXKZikia0B1dBaFr1lPEHG9cQSlZE8lUeEtcnxw2t4VXZExfMohLHYM1MwmKqLV0N/x7IAtVUHp
 G8mfLVCwrz6mk9ll3Yg==
X-Authority-Analysis: v=2.4 cv=faSgCkQF c=1 sm=1 tr=0 ts=6973449e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8
 a=jKNXT_YlsLnMlnp3WyAA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30979-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8451D73A70
X-Rspamd-Action: no action

Linus,

Please pull the following set of fixes for the next RC. There are some
fixes to resource leaks in the character device handling and another small
fix for shared GPIO management.

Bartosz

The following changes since commit 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7:

  Linux 6.19-rc6 (2026-01-18 15:42:45 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.19-rc7

for you to fetch changes up to 4918cc05137cb347686462923ab3fd249ef7899d:

  gpio: shared: propagate configuration to pinctrl (2026-01-21 14:06:17 +0100)

----------------------------------------------------------------
gpio fixes for v6.19-rc7

- fix resource leaks in error paths in GPIO character device code
- return -ENOMEM and not -ENODEV on memory allocation failure
- fix an audio issue on Qualcomm platforms due to configuration not
  being propagated to pinctrl from shared GPIO proxy

----------------------------------------------------------------
Bartosz Golaszewski (1):
      gpio: shared: propagate configuration to pinctrl

Tzung-Bi Shih (3):
      gpio: cdev: Correct return code on memory allocation failure
      gpio: cdev: Fix resource leaks on errors in lineinfo_changed_notify()
      gpio: cdev: Fix resource leaks on errors in gpiolib_cdev_register()

 drivers/gpio/gpiolib-cdev.c   | 12 +++++++++---
 drivers/gpio/gpiolib-shared.c | 16 +++++++++++-----
 drivers/gpio/gpiolib.c        |  4 ++--
 drivers/gpio/gpiolib.h        |  2 ++
 4 files changed, 24 insertions(+), 10 deletions(-)

