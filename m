Return-Path: <linux-gpio+bounces-30351-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4989D0A831
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 14:55:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46C18302A96E
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 13:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB53835B149;
	Fri,  9 Jan 2026 13:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m97Fgm70";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d+V/vFpc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F43322B92
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 13:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767966744; cv=none; b=XmxPIoX4hmfCmeFwLtApFQ8lezzgCu54s29LbXfdnVdS+lWKrIGfJzK85kphTS1LrmAesxmvPrlSNakypJ8gk1KlhMUOlChp2L2fdmRMxDhD0QYp5pvMyyPClAK9syEgdp6H3bFfQgRTUNGq0WCykVlHDLfdRBOaIxkHbJermsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767966744; c=relaxed/simple;
	bh=KrvBla/JirEaghvseumcByhjB5L8NOjH46XBhmrwSbM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=umYNPDys9e88vnOdRtODbnq9i4+Kar0jb12egrNgFCoTiKQq+SF4mymkBOUkSIcs547YNCSrDsX/dBSzSmACEKFEvB7HTAWJ5AJQlYCakDEEXAlJPz6aOq/n/XU6ClHYyemXdJ1SsAreP1/zSeq7HPWh1f3s+bsEO5eBpWQUVw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m97Fgm70; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d+V/vFpc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098VvS43727355
	for <linux-gpio@vger.kernel.org>; Fri, 9 Jan 2026 13:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0gAXeQ8bf/Cf2YSt5r9BXE
	qKe3k9xXJTjuTh2aE09d8=; b=m97Fgm70n28oKPjy4+5ANnV1Lc6+tQtpw4pxht
	kIrXVEfyIa5II3T457kS/JYKB0OyRAgbre4ag1M86IPQrJx9HthnonlIguLXRL4X
	hL5trCF9DinRVyeEeant3rjN27x3aVd2dXb9Y6at/bdOmdmuOpKutM3uWimntxC/
	+cz2d1SCkjOJE6CrIpPq5tOKoSgQfIc7gwpp1sej+UdvZoSF4je2vTevak3uhXGZ
	6yU/qs1ItAvn7yVcgmgiIwARTHjJzzs5TQi8ADeEd2RiqMvYe41fsRIlQ2BbTcUF
	AoAWayJlURU8STTr6AAiagnTs2a51gJVHmF17wflHql0wAdA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjpmkj8g7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 13:52:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2e19c8558so988240785a.2
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 05:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767966742; x=1768571542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0gAXeQ8bf/Cf2YSt5r9BXEqKe3k9xXJTjuTh2aE09d8=;
        b=d+V/vFpcEHN2zmHpEmbeOrYS+V8MxOy6d9TSj3aVM+r5e8kY7TkPFQFaF+GTYUr6Wd
         RkrrT+RLPhWsP6UZ7lBe16Bfm/cSHafzbNkwGK/JS1EiSA7aWG4r4u9cUlznBDqW/m+/
         J66+apJp3/StXxpJWMYTU8xngzqwLZbB0tEINiibZQ6DUz9zKywAHc0JJJcXN1dr5npH
         XMgQjuM1RTCSdz7N/BOP29YG3iEkf0Y3C7DQyqeSotaLKeBsHnnNcqnijcnYMpUQUEMd
         sCQHfJYSKvpfJK1Fn60hxDRBQiTN946LDtZawrd87OpIb/zBV68ilfJAXZsUuI/el8Ml
         6i8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767966742; x=1768571542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gAXeQ8bf/Cf2YSt5r9BXEqKe3k9xXJTjuTh2aE09d8=;
        b=j1NZ3mrm89sKtmpE7YYCbAl7gItbju/nnsa9HdFGumBhQPtATJSPobS0CQNf3zhsgg
         +aY0Ph6tl68vS32as5z1xM4B6Pt/yK1PpJbwwLG0sO64fbmjEXJSl/9ucObij70MkVCQ
         FFLT0fBpy6iMyNoyLiTkF5YHufN9sNVCrIVF0NlEr37EvfYZXTAqrbgM3+0naF3fCkiF
         oGvKd+AaBdU/ucPSbbS1RYuWEyuRgUWdHfXvVNSN4nmE7ZCwGWoswUptWygEzSv6WDiy
         EQWb9/aPRPFkdZ0W+SrtSzY5mUA2AThNpD4Z7F0s8Tvp+FQ0+KgioalWUmpzISR8++8A
         yNjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvckdWOnJ0sFBrfA5FRTZ4NDpz4zIJTpYT+2T0A7wce66L2YaVb5IhF6/L81lDn0WJxt+6ciMsalRM@vger.kernel.org
X-Gm-Message-State: AOJu0YzhpIoP/wmasDxSmNKSgRteGpMsGHGIU3qeFY0t3SR8dppMAljC
	+J59En2PNURrh4JxzpU0CVtlriJcuQIcomxFopc+GrurZrs1snYQQtt2tNZc++MJ1rM9kvKGZzQ
	6L/5wFJNP5mcH9vohr+TyYuCHP4WEh6VO7lfhBwJEubte8TDkvLBto0crkv/aqEPH
X-Gm-Gg: AY/fxX6FK5Z7hy3vUJQ2db6pNw/zj3NLFhfycY2w9CIkySeuj/5XlS8MxvdHCg15IXd
	W+ac/W1LSp4v3Wz/HVpRPejQjqjpb/hf+wUJ+iuCHjFCQJsPs5dJVa1kn8rTWdBgzqEcN9G2q2K
	2XSS05UDuc8KTT2cQGzsPqQS2ynE9RnD2L/AA87KPtmYFz6I/D9sU/QaM4GMyPQAOlr3ZFA3dfk
	23zeDbkETafH2ALRzYrvklHmJ/r9otfX6IEpYegBtBGIwIaCRZAVDszlp1+pODZSGX6mQuOg50N
	xd1X6C0vxihjMQBQp08lDS/v7179DAaot9T7TwHqtYdvOEEvL41E9flG79p8Rpcs6IwBVAA7jab
	IxO+t/SSaWpR33BFzU8K3kILFI7iFuTs+rp/v4Q==
X-Received: by 2002:a05:620a:390d:b0:8b2:74e5:b36 with SMTP id af79cd13be357-8c38940bbf7mr1451906585a.68.1767966741576;
        Fri, 09 Jan 2026 05:52:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPCQGOOutzGqug/8WZ8nlMi+rYrNoXvX3Cv0heRRj6+MG8OrBrT9W9MJOcOSFq44Gzdp+VKg==
X-Received: by 2002:a05:620a:390d:b0:8b2:74e5:b36 with SMTP id af79cd13be357-8c38940bbf7mr1451903485a.68.1767966741091;
        Fri, 09 Jan 2026 05:52:21 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:4b2e:be6e:9187:bb3c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5dfa07sm22468376f8f.25.2026.01.09.05.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 05:52:20 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v6.19-rc5
Date: Fri,  9 Jan 2026 14:52:17 +0100
Message-ID: <20260109135218.31712-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YNiSCBGx c=1 sm=1 tr=0 ts=69610816 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=kOcde2gI6Mb1oPXbj8QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: uSaQHQkkRd-M9ED8R6HidNypY9WPRo62
X-Proofpoint-ORIG-GUID: uSaQHQkkRd-M9ED8R6HidNypY9WPRo62
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEwMyBTYWx0ZWRfX1BsCX0/aeo3+
 U7e50NXpqz0QycjVCjs2fAqoQRoGZ1ERhaXT/5NA68X3gTtH8GGR4yau7GlwHX/MheLlb+525FM
 hG2bUIZkcasLUSjhlP//XMcFaMVaAhESuUX0354HAlNGgeyuzuhCMMifDW4WB8/kAb07xMeK4tO
 hYwFu6cw2W46+FcTKRf9hB+ClRd+iqODeiRXzPuVtDmfOUbMP1mPSndofvv8tAZMhFeCiMVGDL1
 5T3qPBQEp2+/nlLnkU/c1q0gvJPMZ7+vP2m1k/WgMMpzmeoX8K2ksi8xG4KatcSBpVjJSq4dD0u
 VRbPGVOt4FX3CXgVq8O8QKlDzLGmC7IdlfzYwO3SBJmWkfw+zS1sJYwt7M55iT4WzQqtm4c8MHm
 1ZQHwHTlXOdxeL2jLwYWvWdUDsJ9N4OdlX5hoBSor+sxTzhKlxxc2Do2QeAdxIrJ1aMt54gUViC
 QEmimFcPL5XhzVlsRBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090103

Linus,

Here's a set of fixes for the upcoming RC. There are several ordinary
driver fixes and a fix to a race between the registration of two chips
that causes a crash in GPIO core.

The bulk of the changed lines however, concerns the management of shared
GPIOs that landed in v6.19-rc1. Enabling it for ARCH_QCOM enabled it in
defconfig which effectively enabled it for all arm64 platforms and
exposed the code to quite a lot of testing (which is good, right? :)).
I received a number of bug reports, which I progressively fixed over the
course of last weeks. This explains the number of lines higher than what
I normally aim for at this stage.

Please consider pulling.

Thanks
Bartosz

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.19-rc5

for you to fetch changes up to d578b31856cec31315f27b3ba97b212e4c6989b3:

  gpio: shared: fix a false-positive sharing detection with reset-gpios (2026-01-09 09:56:46 +0100)

----------------------------------------------------------------
gpio fixes for v6.19-rc5

- balance superio enter/exit calls in error path in gpio-it87
- fix a race where we try to take the SRCU read lock of the GPIO device
  before it's been initialized causing a NULL-pointer dereference
- fix handling of short-pulse interrupts in gpio-pca053x
- fix a reference leak in error path in gpio-mpsse
- mark the GPIO controller as sleeping (it calls sleeping functions) in
  gpio-rockchip
- fix several issues in management of shared GPIOs

----------------------------------------------------------------
Abdun Nihaal (1):
      gpio: mpsse: fix reference leak in gpio_mpsse_probe() error paths

Bartosz Golaszewski (10):
      gpio: it87: balance superio enter/exit calls in error path
      gpiolib: allow multiple lookup tables per consumer
      gpio: shared: verify con_id when adding proxy lookup
      gpio: shared: allow sharing a reset-gpios pin between reset-gpio and gpiolib
      gpio: rockchip: mark the GPIO controller as sleeping
      gpio: shared: assign the correct firmware node for reset-gpio use-case
      gpio: shared: fix a race condition
      gpio: shared: don't allocate the lookup table until we really need it
      gpiolib: fix lookup table matching
      gpio: shared: fix a false-positive sharing detection with reset-gpios

Ernest Van Hoecke (1):
      gpio: pca953x: handle short interrupt pulses on PCAL devices

Paweł Narewski (1):
      gpiolib: fix race condition for gdev->srcu

 drivers/gpio/gpio-it87.c      |  11 +-
 drivers/gpio/gpio-mpsse.c     |  12 +-
 drivers/gpio/gpio-pca953x.c   |  25 ++++-
 drivers/gpio/gpio-rockchip.c  |   1 +
 drivers/gpio/gpiolib-shared.c | 249 ++++++++++++++++++++++++++++++------------
 drivers/gpio/gpiolib-shared.h |   4 +-
 drivers/gpio/gpiolib.c        | 136 +++++++++++++----------
 7 files changed, 300 insertions(+), 138 deletions(-)

