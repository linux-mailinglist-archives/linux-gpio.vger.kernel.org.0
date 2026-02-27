Return-Path: <linux-gpio+bounces-32259-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMjTEWNaoWl2sQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32259-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 09:48:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF8B1B4A94
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 09:48:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A4B23063B6B
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 08:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661DA3A1CE8;
	Fri, 27 Feb 2026 08:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ao5JyQh8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VIoYRKn9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E022D2D249E
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 08:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772182102; cv=none; b=LT9eps9ZU3BWkMJ1Hg498Gi72w2GJtLMq3rBkzYQ1WEcsWHAld75QwxSO0inXnKX4d0cSLNeEMB6mlXKCNyUwsit5FLxZeBx8E4Wk+kjvptufDDhDXHXtH1Sjw0z9a9/yYXBsnP9pGR1d0Y6D+aqcyCcNUzPeabOM5aBKsE7c2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772182102; c=relaxed/simple;
	bh=d0wP5Gs+W0TLrJ01+88UdJqIuVLf3HvCLZUGr9e82eo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EtxX6SyWxT/m807N+m12zMSsMwYrmNMzH8A+LTz0c7GJfl7twAmTf2xL06n+sGObM2aQZ+kqMS2haNgJgiaJorknxmylXMzzoj/hbtIarXePnWTz4JlwEgzZl2CbtPsSrV9fVvSfaBGO23stwJU/pndkKafmif3TpnBbZKo/ETY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ao5JyQh8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VIoYRKn9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K1hh2353432
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 08:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TGpOjxYuH6TclDYOSEKbiIV6mspw+jPhyMH
	HzUAKZf8=; b=ao5JyQh8XDJeY7ourTgIbGlEjyAlhDrIr2YM09aneu/Ksy7TiWi
	tEDo7PTLbD+2VaCEAH6Trt6Vx99v1UPDhSJMGq1nCeGZRWBkZFixpI0iC2hUyGGz
	h0nheAt9A+0vFwkjyxJ6PcuZikVzgowZLO0UPvPYBtzaGwYRUfMqK0vk068rU1Ml
	Whp6lt0zR7XYZmE9eOdQcXJ6bAoni4Ukm4F+Lvi2VXo0BBEOkFgGUVAaxUOJZ1aE
	cNeXKB5xbzKWp1u8yDx2zzlwjwNRMfdmEYqmOVEcvVgxHx7XUxDleGhKSOEAJE07
	rXwff/PuLB98a5FmfFtMgT5UB5WiEAFItZg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjm8u40wu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 08:48:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb42f56c4aso1619368085a.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 00:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772182098; x=1772786898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TGpOjxYuH6TclDYOSEKbiIV6mspw+jPhyMHHzUAKZf8=;
        b=VIoYRKn90OM7JZEqs2sPKxo7HNF3gg+RrhQb2etmr60TBQN1OuRZIcRYD4FF0US4W6
         pUlzr2zgogAEdtOchdYpxjTp/M498abCcRl7XPrd5R9aciuV6lsrBenmt5GBpwC/flwW
         znSk51lH+NkOFrtotGD6yarGbZrYzfL24b2jkaugV1g9kAia9ZnqcsjRV5Q3vc3QYvRL
         AO1d1v9Va5XHZwBP+C+KiOR+8lBETjshmmT2CxXhLZOyvmjp8yrubryRmvin2JZU5nGD
         SHu8ZaTbxavtjkJQBGlL1Y1IZRjqBFXnSiGJ5j3l6LLD1OrL9KRW7Gr1ln24cPlMSfSl
         Pidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772182098; x=1772786898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGpOjxYuH6TclDYOSEKbiIV6mspw+jPhyMHHzUAKZf8=;
        b=EmJ1qcXVwWfWRXivmrAG65tP7b3IfraEyZGeLINWhyEs0CQCuNbmWa6JP8eCtmjjGe
         4/ajNmHgRtBJ6pF/nh94UB3blyyRZXU4tAd7Yva4V6LAcMITRD3b/IjB34KvLOjpGUPZ
         4CbFo1ZcxNxYLuR6ZDq/4nKC55fG1SxX+H32AzKVPno3zxfPynFtT/5LzxE7MyZOnMyC
         rxY+LUdYRysHQPJ+613Taa58SSe5dPHtoKxBco8qGRx4nxtb1TV44QCfwZ3Ts0Oup7lh
         8gPlK54jk7MI3PKeAws3Xe4ceOCUyI0YkI+b/XHsR/wV6nLVF//XtDY6bElquC83nrEA
         Ewxw==
X-Forwarded-Encrypted: i=1; AJvYcCX1g/fzyyoVYGCF+L8qLcIsFp42l8hstUi6PKWA5ut5AsEOCqqX0MsToAynz0E3LYlpjlOU08vuMn5p@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd1vgI6PmKNFGlDQVFQ/6reFXP6ua136YjVF3uOH09Fy+OiDV1
	iNFPHQktbYJ4IU+OuXwil59d45oB/rdcShs1EitoHlZbnpozULo2Ywy6kHWknvjyRuO1W1jrPEq
	v2mBRGaDwHXZfLGV3fXeBmsTiavxA5RTQjghly99d5Vs43w7mjIA4bNUYLCH2qsoR
X-Gm-Gg: ATEYQzwVtAZ7f230Rq/8DUSfM70SRFiK4GvTEy3kwr0gtvqyrzSrIsluDdwO+d9Jxfc
	LX5HdNT2XEnOJxgokJSs9eor6vXq7QQyssKBp4d0jHbk+1RNFrjPDM1sCY3oLiB1rjgq+NrLaP0
	OGvSSzzU9W0JKEG5BMxxQJ/S6A0XT8sUd9SVJyoXIe2LQ+s3Q6+O916Ci9RU5E04Et1IRkSQa35
	EsRAye+nrC6BFd6WEjob+T3sqX7ddSUNrY6yHF7RJwu9gI6UG4impCQ9HuNunLkDl2PgrAlDFgp
	AuC2rBZF/EqOUp0Q3HFFsdciGYQOuUWHkqYQltPXO7GX3RtiLX+2GeFrfSwApe2LQWfGLJ0SsNM
	o/GZIA5mDUUKXxmdzRL7bD6/P5LRA6GyjKu6Ha7pab8NWG/LvlDg=
X-Received: by 2002:a05:620a:f0f:b0:8a2:234a:17be with SMTP id af79cd13be357-8cbc8e56ccbmr214914185a.7.1772182098178;
        Fri, 27 Feb 2026 00:48:18 -0800 (PST)
X-Received: by 2002:a05:620a:f0f:b0:8a2:234a:17be with SMTP id af79cd13be357-8cbc8e56ccbmr214912485a.7.1772182097685;
        Fri, 27 Feb 2026 00:48:17 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8bcf:177b:d085:ed57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd75dfaasm178560955e9.12.2026.02.27.00.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 00:48:17 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v7.0-rc2
Date: Fri, 27 Feb 2026 09:48:15 +0100
Message-ID: <20260227084816.6898-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA3NCBTYWx0ZWRfX2vVkKeZAEuMM
 aeusz5KklRXQIUq4J3x8PrzKGIdxjWCfLsR/cAXPxAUmpgBmgosrdForwjdZIKtaHSlc+RRunfY
 ACncTXTsTojEDMMT3fxC3uEm50tq3ikE2+tgybTxOb3N9+XxPIxNF1c2s55LOOxZuMCPUvmkyCP
 mbZVv7rGSe51VTXitP2yCXWwEpQCt7qRdu/av1M+cDpdtFc5MOV4RdeJZteMRBTFi9DgoOuN2MD
 DD2vMiZ3Y3QKFU/eGjulIW3w4Am3Wn4hdVqv7txd0SKgllw5SmD6g24UM4YaaagQuhZfoLT11oh
 NtTUtC1zqXQqOq8OHDNSaodI50FPU8GoCWTVYbEPHL4XaRS2e12UPbhI3CNO8nildESmeXrx2PD
 6/jTuiWiq2zGi9wZIUqsv98U9sDgHtUSrYlWehqI3F3/CiVVI0pTNESmD+rvzA2z/GPk7kKdCS0
 494e+IjYtsPmEsrRQ0Q==
X-Authority-Analysis: v=2.4 cv=O780fR9W c=1 sm=1 tr=0 ts=69a15a52 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=LuvY9jOB2pyUb3znQEIA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: AKPlPP7LWDjObQI5Nn-aqv2Cb63__KUX
X-Proofpoint-GUID: AKPlPP7LWDjObQI5Nn-aqv2Cb63__KUX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270074
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32259-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9EF8B1B4A94
X-Rspamd-Action: no action

Linus,

Please pull the following set of GPIO fixes for the next RC.

Thanks,
Bartosz

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.0-rc2

for you to fetch changes up to ec2cceadfae72304ca19650f9cac4b2a97b8a2fc:

  gpiolib: normalize the return value of gc->get() on behalf of buggy drivers (2026-02-23 11:49:23 +0100)

----------------------------------------------------------------
gpio fixes for v7.0-rc2

- fix memory leaks in shared GPIO management
- normalize the return values of gpio_chip::get() in GPIO core on behalf
  of drivers that return invalid values (this is done because adding
  stricter sanitization of callback retvals led to breakages in existing
  users, we'll revert that once all are fixed)

----------------------------------------------------------------
Bartosz Golaszewski (1):
      gpiolib: normalize the return value of gc->get() on behalf of buggy drivers

Daniel J Blueman (1):
      gpio: shared: fix memory leaks

 drivers/gpio/gpiolib-shared.c | 6 +++---
 drivers/gpio/gpiolib.c        | 8 ++++++--
 2 files changed, 9 insertions(+), 5 deletions(-)

