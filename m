Return-Path: <linux-gpio+bounces-30651-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F9DD3058E
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jan 2026 12:26:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9819F3015972
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jan 2026 11:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960B1376BFB;
	Fri, 16 Jan 2026 11:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QBJK9mMB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TWdLdi3M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093F435F8C9
	for <linux-gpio@vger.kernel.org>; Fri, 16 Jan 2026 11:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768562782; cv=none; b=o2QwHdgwleLscO0J6W7hxfvyiyL3/0rGOt16zwKdh9JG5IvriqtXZhpd/9yaRii+Fixnf1ZZBv6b/L5SiDkaciQEL1H0/siqjhZqhoP7D5aF30p6pQjBafQTmJKekyvsWKPlJLBmpSwQo2oZrdolQVXtMmjt5UT3W6N5WfC3zWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768562782; c=relaxed/simple;
	bh=z28P/GaFk8PnNmspW1QyRUVAOiSk0omEmrRJdXLy0js=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lvRW39mlkpfahDKQZjvhBZSXXeXjlxfK8S2TztLyfavM5mwdgcQae+hVXW0iBsbus6KkpC4iaAk5sEeGIWGEXkklkB+E4EGMpXLa+/2UKJsssy1FoY66xaOoA3gKilO8iHoNCEFRz/Ya0Jt669q67yGvWCxnNUm7XaY5OlEf78M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QBJK9mMB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TWdLdi3M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8IK522615163
	for <linux-gpio@vger.kernel.org>; Fri, 16 Jan 2026 11:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mMbxbnzEqEIbX/IouRCUNZi6EiKILkRoJjb
	f2+FTNWI=; b=QBJK9mMBrgiVM8o/XFgE/zy/nuX4y51ev4gkd8rfPiTdkYQYGpz
	+CAbTEMUgQq+8nGoNAb7oVdx8cvZHtcHuVO2rIpg9ozTXoxPckmeACZbAUtkiPzC
	LeiIkrArOerHbVGXxwDy3LPjHaaeWOmbdCYDsDuYnryN5AU/u67lfvHTnaldT0yo
	FhIiCtahTpi1MNZfH4187gTCFh9Vgyk/KXkW7EnnrZFxi6NV+d1D0PEbbJF3G4aL
	+bUZyWHbW5c8fVck+oHjXqapBpMGJjwMboHXMmXiflWrhvGpelp5MGE0EPBDuIsB
	PKZYE5aNzfAgBh7sYu6TfIbK2isTPFxmxWg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq977t0nm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 16 Jan 2026 11:26:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2194e266aso503387385a.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jan 2026 03:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768562776; x=1769167576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mMbxbnzEqEIbX/IouRCUNZi6EiKILkRoJjbf2+FTNWI=;
        b=TWdLdi3M6iBIese3BhXRgJ9KMKbS1Hchqb5fFKHHzd+5lCRZZb8NTQfn1lDID2OUQC
         m1c+w94ZcIW3+hBBGgBAK0dpMGvX7drd05/hn8MS6ZIlGhswDEUzarSfK8TrD4uaO0oa
         y27xV3/fvnVDJur5ef8OHj6rAspnsdzoCvnpG1FnNbk14SMLREqMTb4CNex9uuRvPYD2
         nnMcsFdBwRtWPEt57c6vBo4k4iwS4I1zBYG0rBcFZ6Lxm2KBlR+Q2vR20AwZkdKv5pOL
         qBUeK1BU4ymCdfx3OQ3nz0cmQCBWI6glCodDYacZzUOdCu2wkspfQYOcUfUaWgP96cUq
         DWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768562776; x=1769167576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMbxbnzEqEIbX/IouRCUNZi6EiKILkRoJjbf2+FTNWI=;
        b=XlsIVr0hEIOwf83450sGqDHjPdcFXBhR7F6PXX4cn+KCk05hKj/+Yin1EQZ97k0a1i
         2pZPEnSM425rhm9X7Yif71QJcd/ndRFlHB2Y9YUB+IbGIjFAYfIWEBRcJ5AZfX+J5UbH
         5Bt4hKRLQGrXs7qYIElmGmSNDyXR3gfPap5irR1hLRLAE5o8cU0p9tDogEQ7m1NlejIy
         6EB0xvQlB+JcKHGGkafqcjXTih4/xm80ytYM9kL6c2V3yom8AD30ssrHU2O5u14UqcYm
         vvJfwSBL1/OPP4dB3qcGx0cQQeoVP6xuHhkd3ZazvSzkP3phkfAdsWLiwaA7H7Ciclqm
         kSuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyM6IzFxDL34ciKtOuF0nqoJtf/TSWZ3Ndw7fJrwZrN4DodYr21018pbUBJQbdg0d7RfOcb0YAmaz5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8PD55WOjuuRcHDXo51aSDlh1nfEhUMStliEtjOIMR2zufBvqS
	XZ6Q/pCswbvOd3aInFCgHb9FeTrPHpaDnGcP6yJejJ6fs0t9ZgdxjxGlDNdpKiWmbobIUx2d5GR
	d8rmwJcvsGm0EMWB93WoNI2sbdraNNrJoTls9qJgoV0wwkuvi5d/x7dZolR0AylGJ+3Vhqh7W
X-Gm-Gg: AY/fxX6VYWcvdhOLIoEWEWoyZZ/+oWZPL1ca3E2IirfVGe1olMch0bo81PTdFJIoCHE
	/VdTk9HqXN2PC/hWUj8MkZvB0p8wTa8jmi2jhY2xjLzLrkqzbcp+lz7Hxwu/gv6iXbzmJplG1ke
	WAvI1ts0xJA2KKcXwrOtZcQG4USP1Qtq7wMQSNf2gjA6W2bjfhJRBYXpTm80cZO45VqLcZ0Ba71
	3/ecdg17SKPSAv59IJ/w5JG+gqLu8tMxn+ycw3EjxLLecmhCK29P+Kt/mQUU1mns9mdMvPHjuo8
	hdEeguRUYYsguaBhwDZ39msNvYzxw9KKg2u5Ii5yrPrM3PfULDYg0OPC0Z3seevaPIhyyzBoM/e
	1n0uQxAnap2tT/o0Zb29bO5PJkjoqLogk8oUl
X-Received: by 2002:a05:620a:700b:b0:8b2:eb2:54e2 with SMTP id af79cd13be357-8c6a6765168mr333270285a.47.1768562776058;
        Fri, 16 Jan 2026 03:26:16 -0800 (PST)
X-Received: by 2002:a05:620a:700b:b0:8b2:eb2:54e2 with SMTP id af79cd13be357-8c6a6765168mr333268085a.47.1768562775634;
        Fri, 16 Jan 2026 03:26:15 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d1c:5bb0:db13:fc7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f429071besm92731975e9.10.2026.01.16.03.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 03:26:15 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v6.19-rc6
Date: Fri, 16 Jan 2026 12:26:08 +0100
Message-ID: <20260116112608.11227-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nbOAVTdhKGzUgmR9Fzg_luKn1_MpXiEO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA4MiBTYWx0ZWRfX750cApNnbQe0
 oBraDRIgrIOJYChh/VmS2quKu4XZsCai77mUVQIcg66Y+rMZkhZhQ0UIMXJ+MRnOWc7SECcMFb0
 MVbOzGg5x4/NiliVpUfjs+FxYHrLdokLm/4BUOr0fl0KcNjGLc5nk2kpEg2mDnRypZwlCdf3yqv
 TVCGRUOxd/AztrH9Tx6+/5ZQAbJbvSzmfJoEDiOXsvG/QepNaPf+5N6xcSoaE2VHbi/5RXYwvau
 WQsJ1h5WjJYQFGsLKYNwsOCwBo74U88Eb59ryOo771gEwb7bxUTtxy2LnwbBgECSD/bH57HaKH6
 lg9JwO4cCvhvij+HV+JGHHXIhA013yUXoMjfQszU110krK4gY8WVoLlTmmLEtkSLTLWYHjO65/X
 I4IsyRYZz9Wary655JXb0zzS29H/5XyM8oNrajbzf9Xi52oBpSJYeSFqxcUPKHBTL9vDJXT9fhp
 DLQlKjV86NJkwf9t1Ig==
X-Proofpoint-GUID: nbOAVTdhKGzUgmR9Fzg_luKn1_MpXiEO
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=696a2058 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8
 a=u_3yt6rmNsB9PL_VMhsA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160082

Linus,

Please pull two more GPIO fixes addressing an issue uncovered by the shared
GPIO management changes in v6.19.

Thanks,
Bartosz

The following changes since commit 0f61b1860cc3f52aef9036d7235ed1f017632193:

  Linux 6.19-rc5 (2026-01-11 17:03:14 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.19-rc6

for you to fetch changes up to 471e998c0e31206ff0eac7202b2659698cf9b46e:

  gpiolib: remove redundant callback check (2026-01-12 09:35:04 +0100)

----------------------------------------------------------------
gpio fixes for v6.19-rc6

- implement the missing .get_direction() callback for gpio-davinci
- remove redundant check in GPIO core which can also propagate an
  invalid errno to user-space

----------------------------------------------------------------
Bartosz Golaszewski (2):
      gpio: davinci: implement .get_direction()
      gpiolib: remove redundant callback check

 drivers/gpio/gpio-davinci.c | 18 ++++++++++++++++++
 drivers/gpio/gpiolib.c      |  3 ---
 2 files changed, 18 insertions(+), 3 deletions(-)

