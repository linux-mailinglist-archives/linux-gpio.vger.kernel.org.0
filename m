Return-Path: <linux-gpio+bounces-36567-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHauIuPNAWryjwEAu9opvQ
	(envelope-from <linux-gpio+bounces-36567-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 14:38:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AAE50E022
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 14:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 571D4303A597
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 12:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1708A38F25F;
	Mon, 11 May 2026 12:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WmTNnOty";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S3sdty/b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8019639EF1C
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 12:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778502653; cv=none; b=a0MQLbL/xua6wBt8/LmMig0P+QYgOWVvX6LnGyfHtyqvPuazomDeo/s/jB93kDZjCFRQtK0zeQxaQvOd5KGcUXdLNiceDEoDG/mQ0Molbj0YtViOgEQla8WqCGpaerYU7CylSskM52j7PyNZHJZfhJ14noxDpYE6LYQ2kERUifI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778502653; c=relaxed/simple;
	bh=ZU8k76SOmjPQN6IuuuVJtleEyvAGjPwFGN9jFLmwTAs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VZpgj2x3x9otbX9Dv4a735VlCABnSP2lSnNmtxCUon995Vds5uveSW/EA8OSPxfhaQu9723X7fJQBCDbR7rk05to2CRs3FIjFFAsifgTUJTqsp8nAoLO1JaVY+Vb6P6Au2TLR14CpZ7Y1v+O6dobWZtQuHKBBUsFYiP9Pq19PcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WmTNnOty; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S3sdty/b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B98ax4017281
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 12:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Q9pnr+nVGzHyjymLS863osq0vY/78544Lb3
	MAq1Azl4=; b=WmTNnOtybyxsxT0hCkc/jzr8V2Q/klt2yFXqbaXO5SRWSJzVrSz
	+M/4QY6l9UnivHIpz0GYaIyKtHgNm4Ha/9Q4R75lkUvY2Z6T+rD8QETDtHlU6hzw
	Lehixav1pHgToZJK1GrR2CWcSQqabYYTd7081HYcv1lEd46bhHUo3iX87+DXTHa+
	xBiW6pAMiAnGjiOQRXH2897YnZ1YV2RT4ooExPTrYe2ZvZiD5T8YC4cl6NBLapGw
	FHp9XKgfQjCKX0FVhK265xhW+paMXh/GkiCveJH/v2f4UldABHASbKMq1wPb6I08
	pxx5dJF7ZxTt0rTfKB1fxh5I+AkkTqUTdjQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xfsppq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 12:30:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51494d74d4bso43741061cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 05:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778502650; x=1779107450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9pnr+nVGzHyjymLS863osq0vY/78544Lb3MAq1Azl4=;
        b=S3sdty/bYUtUVWEw9dXlVCN8XKk51X1hYjKlLfZRhNzVURsjGUGXUrjoefkKvkMC3C
         cyevBwHiRdedA+WiQqeCTcIFzMmDCY6GqDFMUbMhMJlETD/ajuFtIILaOODQ5ySmWVwg
         sDqZ68WFmvvWJ2t9sk8HGXp6WxQ+Stgal/qUeU7QxtiM6iw07HSoLUcBw7obHvR5qK+f
         tw/Pjk94DcRjKp3x+Pu0dKBAmfwbpdMGe866zEHQa5236Jbys4EZ6rtbrIAAu3HjTX9l
         8qZqCCGZdmU3DFQBNseoND0Lc+sF+8AsPAwRbf7FxCvIgnlUjZ0WFaaC65fHvnzcyM9s
         0oaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778502650; x=1779107450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9pnr+nVGzHyjymLS863osq0vY/78544Lb3MAq1Azl4=;
        b=P9JM1UBAkcLwVuqM0m5Swnt55yw5bUyFF3/z/vobEzo67gYQvi1XGB+sN+zBFoiHPW
         RKfwLUf6EAuRT0W3C06/kqB43lcqcm3G8CCUNms0wr2h+jEBWxa1aauuAOL/FDPuqOAB
         O+RO9CkAh31oCfziwFh61wly0W6hidwySXI6Qix9GAkA6qe4PfM4J4jW484nOcHpqhcY
         eEifEsWqQuomHkHs8Vf20Wvg4wKCJPw2aQU5THovVP9LpJKdXEiIEeV9N3Ag1WXjnyKN
         NsCZkb9fvUulVjl+tcD+DVC50hO+mblHzYq1dO1esOu2LXZAksHyqoF4l8veMW72ysVn
         1oiQ==
X-Gm-Message-State: AOJu0YzbpK3EXPVCRQliMai9xFS6BjeuJksVclwCmjgqSQ15oMPyRgG/
	qYyPBEi9l6rML20cdfWPYf+t/eAaYQ/8oz87R9A6crRN1HoaM1ARW28P1aBACE+A2shSnbq7OP8
	V9FKYcB557mu+A4nc2DAOIj6mpqg21ri1vTbMsgdj94PS3IVmljnB0u6ct2Z5nCQr
X-Gm-Gg: Acq92OG2UyM7RFaLvKTAJwqTNHHxSiHBtbaDINLuJgqPxdTpwfgY5Y9iUrT6ztKCK6h
	6H/FaKpDwTxDbQS3YG/DsAkc0Ylq+AidTaqUUAlVUCKnqKF+zbrLz+VLXuDXJ+EwO0zpyen21MM
	1cO8bXxyztcVRaAP/OhFIgl8B2MFfIsiDmgqbhRtbbk281vxIwA31Heu9XJp8Q0IW8eMVrQyTA1
	Fy59g3Wd4vrezGmDaCSmxSGY8TvbwP7aZEb+HO2jYHxa+8oZxyNX/w8oexyOLMzNngEmrGeGhXO
	lPVQwPpRyEPTNxjSRgjye4JBmx4Kv7xeYxxXGjr9HmM1Ire9dt7wSHCfeFap6NzcGFS7nw8Ua6E
	03DWnTBo5gIauNGPgrn/8CDWZgmVjy2V4ui44eYcyWlbEP/BGMw==
X-Received: by 2002:ac8:7158:0:b0:514:c499:c5ed with SMTP id d75a77b69052e-514cb9824famr3278281cf.18.1778502650299;
        Mon, 11 May 2026 05:30:50 -0700 (PDT)
X-Received: by 2002:ac8:7158:0:b0:514:c499:c5ed with SMTP id d75a77b69052e-514cb9824famr3277811cf.18.1778502649764;
        Mon, 11 May 2026 05:30:49 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:63bd:c2f9:cedb:aa32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454916df968sm26219261f8f.25.2026.05.11.05.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 05:30:49 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Li <jie.i.li@nokia.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] Immutable branch between the GPIO and I2C trees for v7.2-rc1
Date: Mon, 11 May 2026 14:30:42 +0200
Message-ID: <20260511123042.64315-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TqXWQjXh c=1 sm=1 tr=0 ts=6a01cbfa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=M-WlpKoQUZIhws24ORwA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: sGFQ2QBbxDy4gDCfmXMZXnAfQOihGnL4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEzOSBTYWx0ZWRfX8yRNMFQ3N0z6
 QHG1CTig0l6nCNPapRxXxuJ/gSK5QPqT8lXIjloQDDp1lpjrUncZAp1Pu2VkQWJHKE7CMBzVBU+
 GoAMy6G3V3DRbORdufTAoR2H1iuZbGSVP3IQnmdoYtpHDFZSCrNLqyjQSNNV/4L2pVkc2IM0ZMC
 NkieT4iJ8RIhnv71Nyut7UH/tWmHwxFswEmQ9whGsZq3VII0AueqMOItzVjWxAlUjmR5y/bQzLf
 P5L2XBzpVsUAXj/eXT1HNn9W+t/USS5gJa+LcB/rYQCq8okBZYOqHWEOwRjYpsPoi8+v1W9mtZz
 1AJzCg3y8Y6Nfmzc+uCveUu0hy69tH8IJ3THoof6FM9PS9YZRPiD/JZERIoGwt86XCZPCNoEJDN
 ZkPBLfAW+QEuhKhXLtSzlVb5f74AGPRN9Kt5IU54kEVqeU6k+G8uhdI818ja7bf9o9CNlcoaqbN
 K/zcySSqhnIoLOIw9Yg==
X-Proofpoint-ORIG-GUID: sGFQ2QBbxDy4gDCfmXMZXnAfQOihGnL4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110139
X-Rspamd-Queue-Id: 30AAE50E022
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36567-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Wolfram,

Please pull the following changes adding the gpiod_is_single_ended() helper
for v7.2-rc1.

Thanks,
Bartosz

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/ib-gpio-add-gpiod-is-single-ended-for-v7.2

for you to fetch changes up to b5fafa01bdaade5253bd39317f5455d13e6efc7d:

  gpiolib: add gpiod_is_single_ended() helper (2026-05-11 14:25:25 +0200)

----------------------------------------------------------------
Immutable branch betweeb the GPIO and I2C trees for v7.2-rc1

- add the gpiod_is_single_ended() helper function

----------------------------------------------------------------
Jie Li (1):
      gpiolib: add gpiod_is_single_ended() helper

 drivers/gpio/gpiolib.c        | 22 ++++++++++++++++++++++
 include/linux/gpio/consumer.h |  5 +++++
 2 files changed, 27 insertions(+)

