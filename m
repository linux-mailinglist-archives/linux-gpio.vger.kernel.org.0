Return-Path: <linux-gpio+bounces-35461-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCIdO9ki62muIwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35461-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 09:59:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9156D45B05E
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 09:59:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 00F5D300380F
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 07:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50C537B02D;
	Fri, 24 Apr 2026 07:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BOBCKObp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DFMWoSG0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27531372EE4
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 07:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777017557; cv=none; b=SLK9hd71HJcdNHbimwnJjEU9mFckgds7slQ1teJidE2V8Ai8lyvJqM6TPwN75X6yp2KjRlSNToGDWFhImNjJff/0UDUXJm7Q1VC8GJ7it6+dhE2+yoJeeiUcFsZuho2X2HLbnA2wOZ8WpWwrQZ+7BQ49HQDlYIiq6kb11TP5lQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777017557; c=relaxed/simple;
	bh=bwPBUhkaxqpBdQS6TYGeq/5psCl2IWKT7WBwFl31v1k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MLMHwz7AGH5gnZsz1l5ECwbMRZwqjrwHK5jiO2HkPa8E7g69z6N7wSzbqGZ7x2sNhJ4MBNds9h/TipziusbBe0W940FheK0TgKYAiBHDHGmbnm95/Z6aqeGSna3/4Fu2XCH89iB4Orgpr7voJiboNfQPBPiEJJQAPcLWSpKqG1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BOBCKObp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DFMWoSG0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7Z0MQ4167368
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 07:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0xV2l9Cox7xAAP5REgy0BpVBBYjWyNpi6X/
	72/AIiWY=; b=BOBCKObp6ak+lA5yadb78i/MhoeR2OfXVLX27l+XLau2nM/JLBT
	AlhIOgTx7rHsCstDDhNHwV8t5Mcxi3t9wF0Yb0wrxEClWxzCdwqXtyfrN7PCGhyU
	KhQ64ov1q70tTe/DUZihZKBQLs9Qe9fmmYMG69VuZEwv+qyxmkiKsIDXsKAsFLk/
	RUaSrgh0kCnhSYQ5E/lnHJ7XBmN9ITatDG8cRbxE2/ytUTMRq0yhXPl4RMHnrseG
	gaBSLHpLVvjyAfEzh6CfymcKPPBCk/vcLGWgoc6jJyNaYy6khVnvmulkQj9OIDvT
	KJd25XjLl3qGUANxBz9aeFMHzUzfk9AkzkQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr48n02x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 07:59:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fba8d8c40so35869161cf.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 00:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777017554; x=1777622354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0xV2l9Cox7xAAP5REgy0BpVBBYjWyNpi6X/72/AIiWY=;
        b=DFMWoSG06MEqy10mKX97bMnLJnx5IdePJNyQoMjDIsH3txxRGHyQNCKTMKTvs+Szv1
         PfZI7MBVLWZ2QXuPAMFEtcCNw3NsAs3wxF3M4V+Db9CLZ9xugSTrL47UKUm4iI5YCfC3
         V9NXfT74H2CIf+jSgZstex5UajqGO3UDhnHpDMbsK+YRb0D8lbr70C0OfNAVNuLoXyz+
         Y3Q88U8hcAyXprllR066fp3uS4ImzLq10iM/eH9m2T2vOdV8SSMIoI5+G4H0sJleazF3
         /e7DjpsTLYUGxeblHmQpvdc+ZyH12d4Gf3gOs5RwF1TGEa6IwARkoeY0U/O1fDfsbtVf
         0Gug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777017554; x=1777622354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xV2l9Cox7xAAP5REgy0BpVBBYjWyNpi6X/72/AIiWY=;
        b=PYyBeTQBdD9fW5VbrTxlgztdyA3ae4sr7p06F9ME2FSEC2pXxbi19Gt7deMfyb9QIL
         h8N39JBnlLGhJMleunX6b2n0qdD7AnlHhUWX0ehpgzmgS4IKSIvuACgB7v2gDycFmKAY
         iaP2QnF2h8Y6MnBu/21sU5txAtMyOShUkHDScfPq7PE3HIKwAy73DqTarG9iSReKUjxz
         NE6x+sdEjlcwykgTJF0jtugmkCK+p7ko7jeQ1FHlzlaaLpdmqB0hdUzgNW0iIDaJ5cJN
         zRHnK51SSu+gqShDerTl07Z2CmgbZn24GwGrcxK9MLO3s+s5DRrKYIfxc4YGjypsLs0U
         APiA==
X-Forwarded-Encrypted: i=1; AFNElJ/kqJ9mMf12zjAQ6U4jgMqpTS/Uk0eH4po2v56qi9QuKmAURTX6sxdwPgOWpqSeqvE5X5QK93ljYHOP@vger.kernel.org
X-Gm-Message-State: AOJu0YxZAoGGLfpy/M2//GfQoksWYsh+AszNUqabN/T3eAbX/pPuCmSk
	+tDt/TtQLOoZMsPa8g2lMt9cgzgVAIUBuCVRfaHur8jeEah4qbLIYr9QnEfH1N7UgqU5LYHPWKm
	sdwAQQ8p9jzIal6JbuPy0WPr4Qvx9dTt4UsIvs5bX5efukW63OX/M0qN0ZyZ6b+K4KB9fYImu
X-Gm-Gg: AeBDieucteav0o4eQhHjKK7X2phSOjM2i+n3Ui3bLcsUiVLrmVOp9G/mSStUnX9HnXn
	rQgBl5iBDQv1d8mS+gAxkKDSG86cOvK8ayfuVCrzf9pdvzwj1WCljEnSI70JL9Rv94AwlEsom+x
	1mYeg1KfvKDF8dNNNYv/V3e/JfnSFs82mHkwuLajT/UQNsG/s4adBWklgYjq81Awohj6SRlSc0s
	0IRNMd++XRQd7spQEC6UVRqQaH9sUzWiNL8Q4+qt6JtVV4B6dzuoXt30PmvYI/hG3vq9Yp/2Eb2
	DiMSHfMcRvWw69JqUdHO3Ws835trMsqY3BQOAVKINTsdWKmfZqvOBMUAdPPcMacLX1YQUNCKbRT
	EtYSyR7U+fmzp/4mNNvH6u1FlBZWGmgZlSVTr79HrvGRRQ4/EMZHq56E1TkVk
X-Received: by 2002:a05:622a:258b:b0:50e:89e9:2728 with SMTP id d75a77b69052e-50e89e92bcbmr307636711cf.19.1777017554395;
        Fri, 24 Apr 2026 00:59:14 -0700 (PDT)
X-Received: by 2002:a05:622a:258b:b0:50e:89e9:2728 with SMTP id d75a77b69052e-50e89e92bcbmr307636551cf.19.1777017553959;
        Fri, 24 Apr 2026 00:59:13 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:35ca:88ed:3f2e:db28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a55dc9f58sm548211915e9.6.2026.04.24.00.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 00:59:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v7.1-rc1
Date: Fri, 24 Apr 2026 09:59:03 +0200
Message-ID: <20260424075903.5997-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uQFO1iL2rjmqsk4XElM3Eitvc80VbSX-
X-Authority-Analysis: v=2.4 cv=VOjtWdPX c=1 sm=1 tr=0 ts=69eb22d3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=sp8VjT_iPmMRcpdR2uMA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: uQFO1iL2rjmqsk4XElM3Eitvc80VbSX-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA3MiBTYWx0ZWRfXxKw08CaCJeBe
 VTBGSs11/e7zPfJsTqGlEHgGRRPtEKES5ZgB8nWk22GcdoI027JU2X2Mi6EkyPNt4c2kz2qNbF1
 XBribq2QFPsheH2p0FFKFKsqNnEc26PkQYhLG9qjN4pvIDbFr5RDgGFa79Qu5ANfnUvr3oNG37V
 AcasScSZlUXVKFaq/G69jPXLXUMW3I9T/jleP6mWeD0T9PjjQd6oEj5lhq+vT+MDY71WLjVpQjO
 A6g1WaNpH2kCJYF7cXMhQC++6JeZpjOLiU8GiP9uaCn3S6MxKvmwwe/ijQsMG8ovBa9xF+A3zjD
 X9r2tJE7uGr2vQY6reCNEinyuJtB0hgALl7LHVdYh5DaAFgeUioO2CnS3sRKuV7RzFgnrVlWaNv
 Matqlw3j68XsQLfzG9Aw6ABl8FiVFS4nZJ08FWJ6pHZSWKENAMG0jUT0jCJ8y/8zwn2Jo/NmsjJ
 YsG0MP3FvnqH1rRingA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240072
X-Rspamd-Queue-Id: 9156D45B05E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35461-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]

Linus,

Please pull the following set of GPIO driver fixes for the upcoming RC.

Thanks,
Bartosz

The following changes since commit 1334d2a3b3235d062e5e1f51aebe7a64ed57cf72:

  Merge tag 'gpio-updates-for-v7.1-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux (2026-04-13 20:10:58 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.1-rc1

for you to fetch changes up to e31eee4a961077d60ef2362507240c6743c1c2ae:

  gpio: aspeed: fix AST2700 debounce selector bit definitions (2026-04-20 11:10:39 +0200)

----------------------------------------------------------------
gpio fixes for v7.1-rc1

- fix a regression in gpio-rockchip introduced on older chips during the
  merge window when converting to dynamic GPIO base
- fix AST2700 debounce selector bit definitions in gpio-aspeed

----------------------------------------------------------------
Billy Tsai (1):
      gpio: aspeed: fix AST2700 debounce selector bit definitions

Jonas Karlman (1):
      gpio: rockchip: Fix GPIO regression after conversion to dynamic base allocation

 drivers/gpio/gpio-aspeed.c   | 4 ++--
 drivers/gpio/gpio-rockchip.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

