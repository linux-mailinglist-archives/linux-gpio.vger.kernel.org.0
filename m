Return-Path: <linux-gpio+bounces-37335-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIWICQQkEGqsUAYAu9opvQ
	(envelope-from <linux-gpio+bounces-37335-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 11:38:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A315B1505
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 11:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCD19300C032
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 09:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9473C1F41;
	Fri, 22 May 2026 09:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wz2mdKoH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cEHCbGjU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC6536DA03
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 09:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779442591; cv=none; b=JgnCpPHbFYQjhzSUnllVxYcWbYFnpQ0nmiP5V/ZpFtJqLSRI2Ydx69uFlJ2robaAnYkG79hTfYBv8SwmFRB7ctyW2Yjo4XUtXbAqJ6KPYf/OfOylg9i4vr3oNSpnoUfRkZd06CVF0Tfk4WfSAUSySfyiHGOeDKqqVnF7rjrkXhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779442591; c=relaxed/simple;
	bh=BV0S823fEbiEONSLnh4hH0X/gKnoK6woEQn3Y1nXYxI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pxqQ7tdGzBUurZAYRFNb+ufJTYTca9NM3pxFUsdZi2Mq4lJMJGzZqn6BgHKZ6+LRAiIi0T5q7LOU9khDPkai7ViSA7fYejM7O7pMjFaMHvdPTnwHsCp98o8IWMwI0fmUwNXyGlpPJmbAI6wFMZG6zB2O7RC3UyLUrTywFHY98aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wz2mdKoH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cEHCbGjU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M901Y43005132
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 09:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=t9fXxKn3Uj24ek9NXY3T0FtlAKJglumuYH5
	7DZ32CX4=; b=Wz2mdKoHKXOb25lpvaCVtuqXuxsxTsZ+9YwZjipQU+tiAYd6Hyg
	WTLHyA1Z/iJj6MFQH4KVHcj60vRw3rgmxmFPnKBEDmLPzRTT8XawBEuMTHzJaTxx
	zS0AHd5DT7JzMSleufBt5QlXHGvmTDF0kQ6txNIkcYGbfYH3VKFUuZO5uK4cg8yG
	rOjY0LsYjsVKg7hm846YGKUqVJQF+BDB0FJ7M6WkEmrKRizkqhz01mNv2Ux23ak+
	YL+EU+08ta4Ev8PT+9h64qEJFLTxEf7Rla65w1bEu5OFKvTgHFsqpAW9FCXw4od9
	oFU2bSr+qDUxhhe9ZcOHYc3M+qJ+JoS8JRg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrt9bp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 09:36:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516cdd89225so29978671cf.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 02:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779442589; x=1780047389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t9fXxKn3Uj24ek9NXY3T0FtlAKJglumuYH57DZ32CX4=;
        b=cEHCbGjUVECh5xfcbreGCKF8GdBsgvyg/iR481xJNNCSOWdB/MiOsXk1iN23uJG72t
         IcZwWUnGZto8uKFrMkheDzUJvxaYgfINx6GnL9b1HAuwVXPHn2hAR5DDAOhaPWjnctK+
         TqUkLx/gQr4veGZ1ajDPo8ZK+4tLFIfalmTCoN0e4OIsDUoiT6hmBZXUJ31yNxCzzbja
         CNOLbwpQT5+LVfhFFWKHROYgCKgOozeZVszdOXN/41l8o0VgjQnE4UFkIpOSDmF2IJd/
         Fl9L1CAjnLTU9Klu+RqM9bABGbIjeQ+jvq4jbBkoO7CrkJhHXLDTX60SQrfmZIIgJSbw
         vLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442589; x=1780047389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9fXxKn3Uj24ek9NXY3T0FtlAKJglumuYH57DZ32CX4=;
        b=WNcxLNqfgLUa9ZIFtt1wguINofcZGSNF8fVKUu7LAUwXBOCLwYaHiQiYTOczaEj0Hx
         H3qvkz9H+YVKHaHngCPkamwdJ90tFqGnQca3psr+iI/5QPFcbHolW+naJCnL4ZnESwJS
         NrAFXwlD9OVIAgNpwHvVNjhNGbwDDozkv4LghkcQRMfXvUPnW1prkqRly67TOLJajy7X
         nGCBV33W2/LPEAyyJ5MUgDjoTZ8aCAofqJTEOzNwAerXaNT2rycS7EYJXTLqr9eHTwtN
         5FX6/7D/IsiJCrolL8Q/rkj7iA0sdmoMX8B6xMQWGuEKN6t+3sXhSAvuLLDung8xjkSV
         1ucA==
X-Forwarded-Encrypted: i=1; AFNElJ9MJQDdTyajMP7iXuOCiP9Lxm1rekCLrak/dcG2pwGzkSDC62QeTzxuxjc6NMFXfJJ2pcSx98QdUhUM@vger.kernel.org
X-Gm-Message-State: AOJu0YwvIJBbhcWtoTx9wDvg1A3HdRu2J7OWymJokOdTEOzkvk+pIxOI
	Na/S9e69Hspw4qSZRHunrz8XO4B/Yj5g8NptBwapwyNsgEJof87xPU8hJp3KcGAYVbVI1I6RaH8
	yYfHr8FVoB86CiIsBY4fV2dCLWWic1zQV/B+I5KJ3g3WUFOh7kOTF5e82V1q/MRG4
X-Gm-Gg: Acq92OGwo75paDZGx+few31lW3PXwn2e4QQ7besazmaoaG2YM2RGwe6spXfQMM3VpTz
	C+Jzl9pItyJ/fpf/RmJZfcWRqbP1dHTOPeCVRBvKYuDGdbqSBByJmjwwTCkSa40w9p5LM1UEk9U
	00ZVMdZecwv3h0qx9K2qEFiG3uyMO/pRwWQueldCya7UHWlHsBERPagVLkFJOg25OSUaCT4hESX
	4767byO5rFCYTiU11eH+pIPEDuMRj/w5S+TgAJsPFByc0j5HKVhiFx3CGTyUaLAOWj4/QLiwTM+
	nueW+b4oZFFIx+rb4LH9ah0A1DrJM0byFV57g6uzqLsJNljmJcrwKuc719SULNeMk1ZXAnvkXLS
	WaiREIVp7TrtFet2nW3YJjEN6o1atO9uCo+sQpKrBKOb/aHw6
X-Received: by 2002:ac8:7d02:0:b0:50e:42ec:ca7f with SMTP id d75a77b69052e-516d4419a20mr42827881cf.18.1779442589126;
        Fri, 22 May 2026 02:36:29 -0700 (PDT)
X-Received: by 2002:ac8:7d02:0:b0:50e:42ec:ca7f with SMTP id d75a77b69052e-516d4419a20mr42827711cf.18.1779442588688;
        Fri, 22 May 2026 02:36:28 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d493dfsm2920500f8f.23.2026.05.22.02.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 02:36:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v7.1-rc5
Date: Fri, 22 May 2026 11:36:22 +0200
Message-ID: <20260522093622.24099-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a10239e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=ydHDWRyBP_B_bGc9ZDIA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5NSBTYWx0ZWRfXxIVo0zMvnn8D
 e98vOkfQHvs5tImmvrmHKCnChXSjVyfXgrjZWxHn86uVN/VwTObsDjlWTHrUnqw7ed4thkpTBO1
 5WXGXNCIF4rCwvSUxgXSTAo8hJk2uMkpMdEvBMQbFFTP/1jptNz9D3cbz4bfX7BQD3/d8xtNpOt
 N5q+ftdLgCuDeHzaWPXt6zWkJ9Mc+AVJR/yO6hQBEdA326mgmE/BTxgge6mbUl/zNHdvru1W3rI
 ZCcFsKMtXysc1wkyuB2pLFJbukjxZOkOPkbVT9rpZRG7Z95PTw+PxElOuOYdp9m+RHjyW1V3beW
 F+ErUOjhWhnj2snBnKPVwRcp18y5TWsB8YIpz6xsWHTDr5MZjMc4zpDFjLd3MSdZ5pJUrLRb6p0
 s5CRo0RBhdmsczD0tQWOBw/Jr25IsklgkYpf3YkZU0CKYrNeylDkU76E5xLnXt6Vg3jxtn9Uwvy
 aa2avbuBnB8n8+ue5HQ==
X-Proofpoint-GUID: vqWrm9fllqAGnjpq4E7B1SjZbr5xzQ44
X-Proofpoint-ORIG-GUID: vqWrm9fllqAGnjpq4E7B1SjZbr5xzQ44
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220095
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
	TAGGED_FROM(0.00)[bounces-37335-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
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
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 76A315B1505
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Linus,

Please pull the following set of GPIO driver fixes for the upcoming RC.

Thanks,
Bartosz

The following changes since commit 5200f5f493f79f14bbdc349e402a40dfb32f23c8:

  Linux 7.1-rc4 (2026-05-17 13:59:58 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.1-rc5

for you to fetch changes up to a4fa45c1d980bc2b9837f469119af24a9304a1fc:

  gpio: virtuser: lock device when calling device_is_bound() (2026-05-21 14:36:07 +0200)

----------------------------------------------------------------
gpio fixes for v7.1-rc5

- propagate the error code from regulator_enable() in resume path in
  gpio-pca953x
- take the device lock when calling device_is_bound() in virtual GPIO
  drivers
- fix software node leak in remove path in gpio-aggregator
- fix a potential use-after-free in gpio-aggregator
- harden the GPIO character device uAPI: check that line config
  attributes are correctly zeroed

----------------------------------------------------------------
Bartosz Golaszewski (6):
      gpio: cdev: check if uAPI v2 config attributes are correctly zeroed
      gpio: aggregator: fix a potential use-after-free
      gpio: aggregator: remove the software node when deactivating the aggregator
      gpio: sim: lock device when calling device_is_bound()
      gpio: aggregator: lock device when calling device_is_bound()
      gpio: virtuser: lock device when calling device_is_bound()

Stepan Ionichev (1):
      gpio: pca953x: propagate regulator_enable() error from resume

 drivers/gpio/gpio-aggregator.c | 15 +++++++++++----
 drivers/gpio/gpio-pca953x.c    |  2 +-
 drivers/gpio/gpio-sim.c        | 11 +++++++----
 drivers/gpio/gpio-virtuser.c   |  9 ++++++---
 drivers/gpio/gpiolib-cdev.c    | 13 +++++++++++++
 5 files changed, 38 insertions(+), 12 deletions(-)

