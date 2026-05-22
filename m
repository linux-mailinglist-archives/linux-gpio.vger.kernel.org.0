Return-Path: <linux-gpio+bounces-37327-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uquQKmYeEGqjTwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37327-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 11:14:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FC65B0F48
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 11:14:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B2C8F30055DB
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 09:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD27399352;
	Fri, 22 May 2026 09:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fr3HPE6D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P6dzdQhO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F48CA6B
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 09:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441174; cv=none; b=bnnsspdaf6Rr24eTuWvTTWR648A5d9r8PgQDV/OUzcnAbTgZDp6yyhZJa6HJgiStJ6OTDyGdZTKQjPAvj4iLdSp78ArB5Vc57/Dk4vGex1/kUgUW1u1Z9eDRqIMsDw2m96U8v8HbTwJWp1fPP8LmKnOlSFibovQe6qNE4iHzCZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441174; c=relaxed/simple;
	bh=q5Xp71Lq7TmeMNaNS6w4UM1ljchryRNdMs2vjPmqbs4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=abP0S/7fMhyTa87Qx3ewTfjQLIsP1nAXHTmRAQ2y7bcCWr1xwenBrJXOZbDwGCO5b/ASehdDLD73H772W1T/hNRxlTHXA6OMM8xp1Wrq4HPl+Ru2fjKeurPUH9f+YfzNeB1YvW/8ckMvVdeIMNIlhaQ+4IcjarRKQIqHVpzvUtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fr3HPE6D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P6dzdQhO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9AokY1816074
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 09:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tWLKhr3hu+NJDRNbc9mJWR
	ySbVhvKxoCVnryFx5WnJI=; b=fr3HPE6D+XnlCZ6MOWn3Q7Fi1nGrZeozjlA1B3
	WoeTknmCfVP54HdMPXiHPHrfuYAl0CiuLGmYGwI9EcHMdE5juNiG1X6he2+guBq3
	QpjiuQWMbJamGzQQadII78XE4cHKPA7oomWTcD4XmspJqcQKeZlA+EhWL3/GL6TE
	qZRVjTGdkVi7tCyMNMqnh3lYL+QEPz4KGB/1Qw4yRBit3UPXgmVPXvhjoiuuQRJI
	vWvafq0gpJyCvmHLn6wz4dDrPx2epSkqiB8N4su7ICc0f3UBzOWHXfPU89/1E5W7
	jP+Hp/R/L/0qtXbXreUb+XnORujgcyLlTIfCkNdIxTSLJApw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm18cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 09:12:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d812c898cso195586581cf.1
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 02:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779441171; x=1780045971; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tWLKhr3hu+NJDRNbc9mJWRySbVhvKxoCVnryFx5WnJI=;
        b=P6dzdQhOmUf5xhyRYL9rswogaEK5Ccou/upV2y+y15L/vIIlwqR00c9wxV12PvIGRU
         j0jvPGe/fyZ2xlv70aTcbjlx8AZVJk8LL5JnFDvXtXK2rbCSBaWfZLtSFOe5ChUCcvkf
         H/7f5xA2tVzHyCviO99K0ZULKBpBA0fdlu9/bsfk/cv6bTdD0GvwbeED8E42jCrLtUCJ
         JcDu1AeQRBtJVVrjHaPnwRzbuK2OKnHBvlT6iV0RzqXEtUnscgvNckk3UuJVX/gLTTaq
         TLMyTRx4RUeRBTN6PD5smHg0pmT0Dg4FiR9iigeSwMFNZGXHBq3UNoWOB0NrO7HcDUpr
         5hyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779441171; x=1780045971;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tWLKhr3hu+NJDRNbc9mJWRySbVhvKxoCVnryFx5WnJI=;
        b=D5w5EYLO3QCfkryoySBOjIvKPDZfXTIz2pWCjcOvQQYSo960JJ9gzMC7gtShrUm4Zf
         K4cP64G/xpmPT1DMTTdfcbnzY79Elr3MJM+2X76ZlNOKkwH0FEF3XNhr9gFkVot/I+3L
         8miUWwCvMAM3mWgQJUJMitGfs5lY0ZHuFbX5Vmm1CjVO41zXkeaifzXq1DieZYIpItEC
         qrHrz8y+2BjttsyAJCBK5q1ST7V/ZdteQ2XjzcjLu1/+55Ng1HlfmYVqZPDCQbQVkDk4
         NrQtPc81a3SDmnCDWR1P8bVcz4Lt7V3ZeT8tMWh1ykaV5OtJRwRJC1Nk730uMBS2SbsJ
         a11A==
X-Gm-Message-State: AOJu0Ywl+ft65dO+SRlC4iUiV20LEUXP769zu+hjEx7Pz5zvUWKLb9z3
	IRvHn7hypPO3odTHn6q1+kz3N024rNojPymiw7OUZrjfS6IbxiXq07AiJ2NI7UWf/C1IUxwE6ep
	h26xHnpbpN166N+Q1kNdNt2F3LO3Bi1AgIegi92tF0CvcrEbjmiaFpGcosB37pSJI
X-Gm-Gg: Acq92OH2Vpl/BybLUPPfHWa/Pe1WTFgwCLQjfYpDeOsbsUQwR/GjzGFQnRG7rIGRqFA
	YQW29dp2U+hGaUdI2sgzWelnPfCfiPw0UkKcNZTzKMrz7trhVs8l+UMxxZ0g9Hw8b4XuL16Nx3u
	vv2PPYAuWC2RWbCAw9OHJjsA7JPT86oC6gkjcsa8VpGsDg51gijAH1TBoVSuHroNibaBlhAvwST
	OUmGKABRm8SQxSftRIGQ5ZEuUIx6DN6Ttq6unMDDyvu3VZGpUZWwMzmEsFNtiuhk6Rt6q+lQlYF
	EFDitBGFSMcWTaFgknaDZUCcnuMGcjRK72mcBQWnNAFPZQhm2XLqB9v0z24eLgCeoyrq9bUipIP
	3vHytPPL3nxzuE2tjrZnjF55j+R4e2zhuQRSf5SW2SPFwOwJVNg==
X-Received: by 2002:a05:622a:1452:b0:50e:5cc3:6f3a with SMTP id d75a77b69052e-516d45eaf62mr39557781cf.26.1779441171114;
        Fri, 22 May 2026 02:12:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1452:b0:50e:5cc3:6f3a with SMTP id d75a77b69052e-516d45eaf62mr39557481cf.26.1779441170734;
        Fri, 22 May 2026 02:12:50 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428d4cefsm11953415e9.14.2026.05.22.02.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 02:12:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/2] gpio: shared: fix locking issues in remove path
Date: Fri, 22 May 2026 11:12:35 +0200
Message-Id: <20260522-gpio-shared-deadlock-v1-0-76bca088f8c0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAMeEGoC/x3MQQqAIBBA0avErBuYjIq6SrQwnXQoMhQikO6et
 HyL/zMkjsIJpipD5FuShLOgqSswXp+OUWwxKFI9dapBd0nA5HVki5a1PYLZ0Yzr0I+DIWoJSnp
 F3uT5t/Pyvh+nwc69ZgAAAA==
X-Change-ID: 20260521-gpio-shared-deadlock-c9b7697c0030
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=613;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=q5Xp71Lq7TmeMNaNS6w4UM1ljchryRNdMs2vjPmqbs4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqEB4JkYhiCNYGETEneF9ZB6L+RXbZCdehSL1j/
 DAo7WNmMFeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahAeCQAKCRAFnS7L/zaE
 w1GnD/9fiieH8fykmrfJskcrxW9hAm8T3AdBYF/E6pMZRrtO6dxAlaEs5zDQLuU9LR4KQYaHZdm
 AlpFhvltDdMAIUsaBrbh82FNjWxUjHVwWura2XaxyUWvkLrN2QXbPO8XOp3KNEAhoz6n/pR/rm3
 qppw30zendxvxIoK7UtdODhNHidBnSBjp3k9CTp1ba1YiEAtXywM2a250K4s407+fsRuCK2O8Ib
 EGjYNJ9t4aHAwHS983WIDzWG27K2HtFaWydZsxu3WqIqFgywFAB+nNrLExoYs3tkyQ8Dzx1ssE6
 ghoMfUMPoJJJXlRi0nPf2PEXa6rThSxgoAKBlZ14NNhEfIonVldTDm/W3lJ1o4tlAORXPJbsoHJ
 qdvmkhIrru+OQg4kXR3YScxq9erVRQFyl6gfOQe67d0TKWysgGn0Ae4+at1MO2qR4Lz/9RhV3nV
 zmjlsMDvMKwZ76aytGaBYC4e7WEWy/1bCC4kr/5bXYEl/G0quh4lqY/mOC0IfQYjRHtOHclQBai
 Alhg8kCsmBM5m8OGWYJIhKntUagNjNqvSFWupnHsrIjX4cawUiei1A8X46TmiGY9BiSpy5wz5L0
 oXUW/EsFANJQeBm4hn6x0G+NTeDrxc5Q3sUGMBWMQov4DZU68uqlOOuY0PNcB0eTpgXEDt4Uu2Z
 EOPCwIcrp0VZRlQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: hb-uXTC5Djf12qH5UjndzOnIfPfoqPju
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a101e13 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=tPBMnzbux8HEWYS1YaIA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5MSBTYWx0ZWRfXw0bUsnb5BNQ3
 093Gta6vwZrqA6AH/u/TNnI6ho9WP/7Ri12h96X7ibi0A8+gyff9YTvK84KbWyMzDnj+ZijzZH7
 kNgqtZciaz6gBMKHPasB8+CJJQURlPxj97B2f12JqgkMFu8yItvflBQntkFcv2oLcQU42MJ6hG6
 PeZHaQQndoUzAf8oP4jeSfNNFRloOROIkiZn4lOQfRHiI7P0HvxCdhQjOER6EP0BxWoxy+KJV6b
 o3VfI3sByFlAZm4v7UZC0S6MPJ77UPGg8k+SU/A557IjpUwvJFusB4c9qxMvJpKalHaKDTaGIg7
 lOovY6W2dnuCj17h3NeNh6MHDPwnPOyrUrdWU87BeafKzQJKCgFT5HHbz8ScfTPpS8+glTLJ6yt
 TXgIJDlU/W0b+6FGFdJAn6RcaMfXGbpDhFXVdULM/IxMj615KeezRGQWLrt5LNT7XVOQWsht6Oc
 ZvIOsGLr0dx/CE/XfEQ==
X-Proofpoint-GUID: hb-uXTC5Djf12qH5UjndzOnIfPfoqPju
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220091
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-37327-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E5FC65B0F48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This fixes two issues observed with shared GPIO management enabled.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (2):
      gpio: shared: fix deadlock on shared proxy's parent removal
      gpio: shared: fix lockdep false positive by removing unneeded lock

 drivers/gpio/gpiolib-shared.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
---
base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
change-id: 20260521-gpio-shared-deadlock-c9b7697c0030

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


