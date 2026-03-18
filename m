Return-Path: <linux-gpio+bounces-33752-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBE9LoizumlWawIAu9opvQ
	(envelope-from <linux-gpio+bounces-33752-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 15:15:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 629872BCD58
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 15:15:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 361D232155C2
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 14:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D9A3D9DD6;
	Wed, 18 Mar 2026 14:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dJkDRbZf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UNTF5G0+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABAD3A7F6C
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 14:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773842476; cv=none; b=g7FwxipnUhOP28ys3KA+t+ypktqZkTaLaoA/Ai1it8eGQcZ/wE9y3XhlJDxGQQA6amdzgpZnuLLXjzt+ut7+CxlXe18b3TMPnriqFydZfk4jYvSI3pHcRVkyoNa5n3YRko8og/RuTeZ6j+DNe01KB17cfXT4eOdyERHEBEQPsM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773842476; c=relaxed/simple;
	bh=+cJSy+TEjklOxXskO/c4n6QIWOhVCzoLCm0dI7SgQL8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=anUNse7ONoBQj2JhMEfzWrjcQwrDuULUfZr8MRqvs6Ib5COyMuKoyW/ewEUqMnJHjEqcGrrefoSfqApwCOqx25kMI/K298/XAXPtj7sBtEo7BcJcsgsB0AyzF55/mihI9NIwhyD1DLOJ4ObWinXG0yqRgraFDA2pIIgbdjYscfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dJkDRbZf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UNTF5G0+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IBBBQg320135
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 14:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QfH1yW0/KckpnlacJl3Yue
	x/E8hYmG3teFvduqQ/HdU=; b=dJkDRbZfUvUb30WuPb+wao/E5k1IjbdpytK2TH
	1ixHGI4LY/O9/naQi8qQjRbSyyBPOQh45ljmYtv0plZf9D8RKmjwYWCdSo/cPNZS
	7AAKjhHf1H51COdZqCFF61hhOpHjPFGqQjM4t9stqspxyn3UjOJvtjhrIw6iD0d1
	sYSmFkA/ABKXdOT38K3mo23b8+tk8AUGiCqqC168Dx+jFXAW2TqhnBAkrz/QaBYM
	kOiQGHnPeDi61acxsb9W9CqJy7ABn6N6M1d+pFx2zsmkfmzkmQzSjYKoRo7xWUki
	83GjvzBmqmUIzvMIDETQ4WvfZQle9mvjzP16hlGZqXiARl5A==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyrhfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 14:01:13 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5662a21d35bso83700339e0c.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 07:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773842472; x=1774447272; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QfH1yW0/KckpnlacJl3Yuex/E8hYmG3teFvduqQ/HdU=;
        b=UNTF5G0+2c4Nf0RMbIfJAvS92XFAE0o4qJCk6slwCHTmijHiMCquDrwV5TcnblPqkz
         K3ECARt8gHXldx8wXETtAthZAVVBVKobV/9oxLiOFcxYV5B1pGSOC7MGKauvF45IuzDv
         bQEeLk1uZKco9I+eehNuMsh3p/zVB3FYMzIMARjiSRf+dj4oyD+zhTVSJdU/GWVZyKux
         6V7n4ADlaxZ7FHZwItuo43F0muwD89O3tiB8BmLe8/dixPuO3SifvVQUaBsaQF+NGMBB
         lZJv2v9x0gZ0BdKLhAzk9Nl86idkCvzuZY3k1Q2R5ofITrt7AVRFpuFJsUZVU3Z//wl0
         9SEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773842472; x=1774447272;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfH1yW0/KckpnlacJl3Yuex/E8hYmG3teFvduqQ/HdU=;
        b=O3qh/bhIOHzITnZDGsXO8q2T52TvYyS36ck22rjq+b4u++Zew9xYGB/kJmhedZ5xf0
         PHr69Jn2U6HZuKaFgm7WZfZily8VuaIYaYRgtnygryZNlEEsUpJDguEX7fODYniho4ex
         dffASDZz2l9luK7zMsHrjOEcQkWtQamhjnIWrxZT9xGr2MtWt05FSYiYibx8lOKgVZDq
         FeStzpxUtZqVRGAyg4VR2XYAG3uo2lP+n9YMEC/iwtDpMx4YpvHovi12/jkTFPFd41OK
         cHDcRTWpy3v9ktVJBoU5JIjudUz+8dJC+dKVDgu+rZow9q0BldZs6nZ2pSsyZyhW4EK9
         ZRiw==
X-Gm-Message-State: AOJu0Yy17aaSQgQj/RXv2nufsjQ4+ip2y6NwWes+Twef88kT525V02uj
	OS8PN/TWNC8BWU6AbqsoReSXTcqCF3usOOgrhU10jZZ5OnEtpCVp800fsgX/HojixN7u2gcRBDU
	D08daYSZtIVt+OQJq+50LJA/umF2CH0El2o+7j34g/kcRFx1Lor3uaqhc9CkeJcsTlkZZVLve
X-Gm-Gg: ATEYQzybuyzNJAjgTqZ9LxIL020JQ2x8F5X/UKs86h5hT7dBY7ukpAPyR+o24kU8ZdF
	DQtiGaPTbcjQThU3sFpdeePyCfQCfqavIgKuIN8ARyteilWzK/sDEcr7PZSqCe/idGLWDTOuZ5/
	o7ydz2y6NAC5LLvhUAp8xeIEnP6ucwSyQa26DPoNbLOGQDlHtWGxSlyFHvkWA+Oqx6Z1cmRwum/
	hZ/CjdoJCrpac1uZhflyBm7KIoPVPc3mTHBPgsivFkb0D22D3M8oRtXiVEV24Szdz+C7B9bF8aG
	jG3E7/+RhvobZfVstnwzmB6dMvNSWGo55YaSnGWtDJsYR13UxSV38LN43wFfG6OOPjjCgKpW1xV
	hCd7Gm3AI/gJhHDnCAOV2PH4bGEPEP4odXwRlQAU3SjOaHwh+r9pa
X-Received: by 2002:a05:6122:82a3:b0:56b:960a:a4b4 with SMTP id 71dfb90a1353d-56ba71ebba0mr1937475e0c.17.1773842472350;
        Wed, 18 Mar 2026 07:01:12 -0700 (PDT)
X-Received: by 2002:a05:6122:82a3:b0:56b:960a:a4b4 with SMTP id 71dfb90a1353d-56ba71ebba0mr1937401e0c.17.1773842471601;
        Wed, 18 Mar 2026 07:01:11 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:b8ec:50c4:23a0:2505])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f144e53bsm214207566b.25.2026.03.18.07.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 07:01:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/2] gpio: shared: fix devicetree corner cases
Date: Wed, 18 Mar 2026 15:00:52 +0100
Message-Id: <20260318-gpio-shared-xlate-v2-0-0ce34c707e81@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABSwumkC/32NQQqDMBBFryKz7kgSMZaueg9xEeKoA2psxopFv
 HtTD9DNh/fhv3+AUGQSeGQHRNpYOMwJzC0DP7i5J+Q2MRhlrCq0xX7hgDK4SC3uo1sJK3X3ttT
 e+bKDtFsidbxfzrpJPLCsIX6ui03/2n+2TaNG5UlVThfWtOYZRPLX240+TFOeAprzPL87TjOIu
 QAAAA==
X-Change-ID: 20260316-gpio-shared-xlate-708c651cac5f
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=932;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+cJSy+TEjklOxXskO/c4n6QIWOhVCzoLCm0dI7SgQL8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpurAeDvF4N3MQn6LAhcyqipWwPSJxDpvjn/IZE
 Ra/8YGTxs2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabqwHgAKCRAFnS7L/zaE
 w5RfD/9/r4AmefAignV1c4GeCCaEAkEdACmoP0SiFPAxTjr3PJFgK+YeNPjbUHGF6I6kl7aUMFZ
 DgZDhY+1HPe7HnQFui7JpjINMEKUlBSRGp5yPALBRmVlXgMo6dAmWrO1u6xzryBtldVN2p4HKwb
 vp7DbwV/Fz3fhbSu25YkbA4kllePQQFFRw/QFV5Q4QspsGHKoZnAqU952Taz0ms3cBTlxqJGhDN
 7cvnt+Ny/7yzWY5F2gbM3vnrTc4dj2SLq+5HqMDIplIyvFvuTa0XoJuar+dhtGvjTSXAu58q1yx
 2cSftreBVOuE6Q5OtPj8D1j75bfqSrc/5c77FxpG75x5ic9Cd4Jcxx7WbEnU494CK1zulZN4JpA
 Y+U5zdbJBOsAK3xmXvEQ48+LHBHAdh43WzzkwNl4ANcPUO8HtRMpCwkJ8uaAtIlBEuDWEjCPaLQ
 +fRwsYn3xFy8IOgsDJ1i8aGA/A/Us3gLTFziA+D/9CCRjPgNlR1mjB/mTUlcHCoQ5TlWnoSlAsf
 o+9zxKcLlP6m7AReggpfdkuqyflHHjtN/2uQv5InfqoriDWn+SL85DwNCA+0eSKrOIkJu5/D6BY
 mW7w720FL+iRx+jcxP7E7ivbnu4VguHqKJRjR0xQETi6zenf/VvesvvErUHPtxgNmFMU4gfMT4b
 RPkxK7cgSzWPuLA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: Man2jilBgHtZX3q_DMDEwZbDv-Xl_GYe
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69bab029 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=3omuALNkOD7x0rm3PCYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExOSBTYWx0ZWRfXwODHYkQkrcCa
 cdxIsZBO7UhixBjyRBXNH9SYt94pQoQ50ok84lBUj7tbqtZbgUzq7zRkSPAs3JLkw5e3glsFTov
 aOWOo5EmYr4ReKqJKJRGQj1EMZZiHq1ec2shLCW5nc3hzzQWwWvDHN+oLdPcO53lbHFY8BEi8p9
 6agBMBusG6B43lZROlYHpMga7TSU11fsj7JkuiJVR7A0bEd/X/fACBpCCZ3iKIMIjl94RbJwLBZ
 2gRSrmcIXSHGIMXEroShjdsfxbQiNCu+9umCuJhUyzMS+B3c4RM+jEIhLzbkya11mvNkctDfJk5
 iwEliY8XENAvGRJG9iE+ZShEac1+0kkd4xOp1Y/fxatR2OWToA6s7Cnyy+po1BAm52dJzflopzg
 DPqWtnxySKLMGmITL3h5RWSkxRTVpe61yf+OaKv0vm7n/5slwa5OOWSatHB7hFCmTtSqqAEIJgR
 fw8AoHvUtT3u1ayEnCg==
X-Proofpoint-ORIG-GUID: Man2jilBgHtZX3q_DMDEwZbDv-Xl_GYe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180119
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33752-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 629872BCD58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This fixes two issues with shared GPIO management reported by Jon.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Add patch 2/2 fixing an issue with sharing GPIOs by child nodes of
  devices
- Collect tags
- Link to v1: https://patch.msgid.link/20260316-gpio-shared-xlate-v1-1-0ce07a1362d2@oss.qualcomm.com

---
Bartosz Golaszewski (2):
      gpio: shared: call gpio_chip::of_xlate() if set
      gpio: shared: handle pins shared by child nodes of devices

 drivers/gpio/gpiolib-shared.c | 33 +++++++++++++++++++++++++++++----
 drivers/gpio/gpiolib-shared.h | 11 +++++++----
 drivers/gpio/gpiolib.c        |  6 +++---
 3 files changed, 39 insertions(+), 11 deletions(-)
---
base-commit: eadf2995ab7c8158bf694304d41e49cada263277
change-id: 20260316-gpio-shared-xlate-708c651cac5f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


