Return-Path: <linux-gpio+bounces-34636-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NV8Mvevz2mXzQYAu9opvQ
	(envelope-from <linux-gpio+bounces-34636-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 14:17:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA77393F8F
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 14:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B2C8F3015149
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Apr 2026 12:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1BA71C84DE;
	Fri,  3 Apr 2026 12:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bMQlVPnQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d63+pzr+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436A715665C
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 12:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775218673; cv=none; b=ZTJKMlVL6acrgt/Gnk1w9XsmQg699zCT9MJnrjpU0JHoxTPm3mXmzVp01SF+YpJrGKOx7+68DWd6U8UiThbibfmVfvJFdEgdErH/u3rJPMosTJxg6E6gc/pIUrYlQG6Diw9R5Iwij+93ySNN1GC920REvmNgAvoawSmqG0GHIaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775218673; c=relaxed/simple;
	bh=LkxykMNmD/UzagHkXsZeEOi48t5ewU3G7Gk0qERSokY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qj6aPkQ1KkOfh06gehLDWUizcreo7MHK3cfAsAT/IpvWEKzmZGMKff0ZSkenlhN8WybNFS5ClC8YMQauSrq3lPozzfUHOCR7mNwogQQ71L8NPVDZ3XlXGLbsXfwEAmB/IdQQ6bI5AddoFOrn0fSYT2Alg6pXDtoPCPbBunZdlDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bMQlVPnQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d63+pzr+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633B1fSH1453615
	for <linux-gpio@vger.kernel.org>; Fri, 3 Apr 2026 12:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LqPPhGqAfu4rMeWH0TBiKS
	X4xIe6+yGOiuM9BnuKBmQ=; b=bMQlVPnQVx9fr2RGrv1WLpJNeBVsTE/E8lSi4n
	X/fHP5NRttW5a3ypKI8giGBhsELxFw22fdY8llP9+so51fyZCG3ljkDFGkKtzOHx
	IlNkFb3Ce0Bi+13OVVrJNLCK+SSsSvfTa65bpc8wP6QkIm84Fm+JlSr9Vt8H/Qzu
	NqEULRtCyqzA2HwaV0vfB2ls5Fqx+eRsalQvx5aWBbeEXy4bOJVeK+gPbCf4SESB
	RWzDt3K+9R2+fX2dfbdLX2AzY/K0FjNiD3zPcj1Nl6+p0YTOXHd8PbEmv4j2qewM
	xCqnkDeRyoSO8weDXhSb4XxwTNFDRykroY7LHGZ3NtnIVM9w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dacam85wm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 12:17:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d63962d83so21267821cf.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 05:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775218670; x=1775823470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LqPPhGqAfu4rMeWH0TBiKSX4xIe6+yGOiuM9BnuKBmQ=;
        b=d63+pzr+9inwd5gG9rpw4UhrUZGxyuSiOzuvpouCrNZASw0CnBrFLRGGeADhHqBq7p
         Yu3iG3Aj9HSsJjyintljwsTBukdUGct38d5kgKl3EX8qxiN6JdK4a55iOzEI2SnPZrRT
         qYnPci9XfLrJBzeC90GSAputIHYEIMWJtu3CD0SZFTMBeVQdb0ObsmdbD/HugIO5mYqz
         cG2nopjFi1X6vYV666tXQRD+iAwf5V6ZNj1AxiGNNyWPDm/tzKGSvUJtlS7I/0NWL3kO
         yYA9MwQQOci2XTZz09/ql2NPqKF7bZzny5fqc/lRBXpe/1w2JvmHG+BR19axj0gllqFV
         fcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775218670; x=1775823470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqPPhGqAfu4rMeWH0TBiKSX4xIe6+yGOiuM9BnuKBmQ=;
        b=YoQ7m5j6JTsFdOwTbcHRg0Dx47Iy4Cw5uCWDjH/sivmiAGKDeBgiFcZCfImFPyw4oe
         10mqOSG22+OEjeo/YNYFAp1KY6XkOD6dWRsJR7AdAXhu8IrZ6kLu4ypqgQtC9EFM+A2X
         zQWdCrsABvCPmRSM3FMMqLMaDO8ObBYVMXD0g5fYQy94cLJC9SM9FoUB8t3/JFiQY+w9
         l/HMp1OAC9WrloCdb5tnqLyY/FTfgjxdynZeoMwed7bHJ5EykGI9szoZQDbmgC4T3IVX
         r1v45jWC2QvU1nU3pb2so9GxE3+k3cPgayiaNzD1hykG8LJRVyExeqRrAIauCGrRC68G
         kj/w==
X-Forwarded-Encrypted: i=1; AJvYcCWdRA7nzv82V1Vw5LdbYmHB1OAlocAUUHur5NLeymPQo3nF+9FgISCzgdbZeFgIKD0bGRo909pBXPw1@vger.kernel.org
X-Gm-Message-State: AOJu0YwrlafKN6V7DwAifdPNxNux7oYEc+9P9rmzu0PBnh+ezD0W9Zmv
	C9DqJ8KLPKYtdfHxVFz+xoXlTCkfBjdzsCSpd6y7QMa2yyBaiqhAC2/fUL5R2bv/NPQrQ5xHOx0
	8d298BLkjyz56MUY1dsvXGD2QTQyPg4M4oYtmyBO8C+gfCnt8ym5AIrtazZ2ogup8
X-Gm-Gg: ATEYQzzEBnHFuR98EZZI2TjEas/4Sg766zTKAXkJPWUYK7tlb+jP/OUZhkyP9EYoyKy
	EXw87urmqLMHpTqPD4brYVrVG3ZKhgdEDYnyBovpCCvRqb2kRVRXvDeissq6nrK0R8/PKTT9m3B
	sSBTQNVMREsZrI8Cx+oLzgjIj4aikwl++1kJUxA7XTj69nUO4+zFl+8bqoGqX5Y1Q3r10Wf+MeA
	judjndl6YIqpRbTZssy2x3Wlpq6gxHEAKN59BLTiMKVeH36kJXQZFxsbSJeLQghoUS8sL7bL8K3
	E+IgV6eIa9yqD9oh5wh5f18DnOIfQmBsepFn5ZmGYpjZyr3rh9Aaeuh0nGB9iZwFPy2yqawAicd
	pSoJbGMdHCTTVBF+vtDJEpqME4qCU2XZSd2eMCoY/JXltwwDjdw==
X-Received: by 2002:a05:622a:a18b:b0:50b:22ad:6197 with SMTP id d75a77b69052e-50d62adff92mr34153231cf.11.1775218670354;
        Fri, 03 Apr 2026 05:17:50 -0700 (PDT)
X-Received: by 2002:a05:622a:a18b:b0:50b:22ad:6197 with SMTP id d75a77b69052e-50d62adff92mr34152891cf.11.1775218669921;
        Fri, 03 Apr 2026 05:17:49 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:129d:59e8:f7c9:47ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e9630ddsm251626315e9.13.2026.04.03.05.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 05:17:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v7.0-rc7
Date: Fri,  3 Apr 2026 14:17:40 +0200
Message-ID: <20260403121741.18145-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _4ivDXWDlI3l8t-U6-4jIU2hUkyLBxi3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEwOCBTYWx0ZWRfX+lHI5tXTvYay
 xXCGkpoSrBFszmQAZwvjpThstnCT/9hGxWixpbEViTy/7vYe22+6IVEn20jKLjTVO02XU4AHhcR
 Byr1lp2HkmI9Wk6JoPr2AWET7khmmcr09jV0sESmes1GfIkgfDFTjcXtEZuecVqBcl7pJJ8/JEf
 lC7r28IezD6JKbkz2RuTFMj+emuKsWdSZjRa5Elf2q5U2QDfrs9gQbTMko/uUGg80DA6gdr5J2Y
 LeTpEj/XZLooAXgxaowhkRxVnVQtNhIhIKpDeQ+9dvQ6IQOsdD60P3mlFtdqDuCbvSyWqQFoCEz
 rWHSoWhPSDzWA98vuiBnJSjE2dbnrCvBlApqkn/rVPki45qJVqIrsGNsnv2UZ104Pn+tOONdEO3
 93z1akqvvadqRUx2xdh5aIeCEB7zMJxUOJRqAFnCPpa7X1t5zkc6r54tvqUEYJNcoiVOtkxbh0/
 60zZ77MzJttM0a0zrWg==
X-Proofpoint-ORIG-GUID: _4ivDXWDlI3l8t-U6-4jIU2hUkyLBxi3
X-Authority-Analysis: v=2.4 cv=ULXQ3Sfy c=1 sm=1 tr=0 ts=69cfafef cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=k0vPc38Y0uk8dxTUGMcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030108
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34636-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CBA77393F8F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Linus,

Please pull the following set of GPIO fixes for the next RC.

The merge you see is because a fix for GPIO core error path looked
high-right and I queued it in an immutable branch for v7.1 initially but
since it didn't trigger any regressions, I decided to send it for v7.0.

Thanks,
Bartosz

The following changes since commit 11439c4635edd669ae435eec308f4ab8a0804808:

  Linux 7.0-rc2 (2026-03-01 15:39:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.0-rc7

for you to fetch changes up to 6b5ef8c88854b343b733b574ea8754c9dab61f41:

  dt-bindings: gpio: fix microchip #interrupt-cells (2026-03-30 10:22:33 +0200)

----------------------------------------------------------------
gpio fixes for v7.0-rc7

- fix kerneldocs for gpio-timberdale and gpio-nomadik
- clear the "requested" flag in error path in gpiod_request_commit()
- call of_xlate() if provided when setting up shared GPIOs
- handle pins shared by child firmware nodes of consumer devices
- fix return value check in gpio-qixis-fpga
- fix suspend on gpio-mxc
- fix gpio-microchip DT bindings

----------------------------------------------------------------
Barnabás Pőcze (1):
      gpiolib: clear requested flag if line is invalid

Bartosz Golaszewski (4):
      Merge branch 'gpio/dev-init-rework' into gpio/for-current
      gpio: shared: call gpio_chip::of_xlate() if set
      gpio: shared: handle pins shared by child nodes of devices
      gpio: shared: shorten the critical section in gpiochip_setup_shared()

Felix Gu (1):
      gpio: qixis-fpga: Fix error handling for devm_regmap_init_mmio()

Jamie Gibbons (1):
      dt-bindings: gpio: fix microchip #interrupt-cells

Randy Dunlap (2):
      gpio: timberdale: repair kernel-doc comments
      gpio: nomadik: repair some kernel-doc comments

Shenwei Wang (1):
      gpio: mxc: map Both Edge pad wakeup to Rising Edge

Tzung-Bi Shih (1):
      gpio: Fix resource leaks on errors in gpiochip_add_data_with_key()

 .../bindings/gpio/microchip,mpfs-gpio.yaml         |   4 +-
 drivers/gpio/gpio-mxc.c                            |  10 +-
 drivers/gpio/gpio-qixis-fpga.c                     |   4 +-
 drivers/gpio/gpiolib-shared.c                      |  57 ++++++++---
 drivers/gpio/gpiolib-shared.h                      |  11 +-
 drivers/gpio/gpiolib.c                             | 113 ++++++++++-----------
 include/linux/gpio/gpio-nomadik.h                  |  12 +--
 include/linux/timb_gpio.h                          |   6 +-
 8 files changed, 124 insertions(+), 93 deletions(-)

