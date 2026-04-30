Return-Path: <linux-gpio+bounces-35919-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDV/D2tT82lnzQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35919-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 15:04:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA604A3225
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 15:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6C2A306A1D6
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 12:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC44F40F8C5;
	Thu, 30 Apr 2026 12:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WgNT3htZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aUbu/b83"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEBE40B6DE
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 12:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553858; cv=none; b=E0S6PZLU87pUoA83OEWdbHmcV//QpJDdgV9ircyLMJBZFu+EZqmcjPQS18WnzMMKVJmVSkj5FUv8XgEhFH/PLtqeuHJWms0DSrCDXOGBbDeMqqUKa4adbLkjgB0ro2gHY3t2wtmxhlhsrWzAwsuQJhBFkXCYwLOs4j3Vvbhs6DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553858; c=relaxed/simple;
	bh=zE1wkg19bTTKTBR6uB76uaks20UgJ9yPFLyhDQR/6Ag=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=i5MKFbql+WnJZubdcPgsRnk7ESzlvy/tQcErUdq+uw8+Euj7nNBEpibs28P1NOhaZRTUiKfv4iLZba1BYdPp6zDVcWka7tqUt1advg5gNNv2oAExIg/F6NsKfl6X4dnSE+KCKRd+pg2oUI6PJocjw2QbLOE0m/0aTTY5I/wEzU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WgNT3htZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aUbu/b83; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UApnBA2907506
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 12:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=d3ufzsgyvNFjBRE8/ddg1l
	jmJXjnhpyf6EcPBtxg5ec=; b=WgNT3htZaAeMrIvkm7LTEiHtclZ7ivdZlbhsRq
	hgZDmsR0QJqXEDxNbkzGOhlrn0+XXO6e95RFmVQH9jhYixvWZtpQSP4IEEfqX0Fi
	TFuq+dISCFZILrc3isjOy0WaJYDkbOKsQ6dsnyz+Sgv7UEGmjGvz2r1qmARBJd9k
	nTJatGQ1GZm46A4JQ+DxQHkl1i2J8eEhIm538FIhrFTi7MybHRQTZn7+auM7Lgcs
	blGM9WgkxM9x/NmhhY8fo3cwLWGiJXFMrJbuRgthpXgCUlTKr3WKdiXMPxKkabjW
	pszBbXrs8ObQlQtaRc8mByt66gDJDtqfy/uvt9cqiU2Z1FAw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv0pfa23k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 12:57:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e2592ea3bso6919851cf.2
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 05:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777553854; x=1778158654; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d3ufzsgyvNFjBRE8/ddg1ljmJXjnhpyf6EcPBtxg5ec=;
        b=aUbu/b83cOcm40nvcGGeVuhs5wOEX9bXTZ0yjIBRJB//7YhjSrlPzmGXC8xmk3f6q9
         CeGyeIcV5RKfe3vrUrokNX41scYcrroQe3OCJSJ5u/yVrVtAre3TmkaS2ASiWP8PqUYE
         4vWq+7ojw/AxQOgBghXqt71qtLHEKKP17QPNccduERk3YitKJ7MEdrWAp2/SzpqOKJD/
         g+4uKnYFINaHrAOJmoOAwOwwHVXbrkFE1VvwxTyDGaBUuplEKCVbsjgfWKJZgQlZgcZY
         k5e+ij70rqby7cAaoMaD5bZgEhj+dudP0mtp1VQTKgYWRCrev+0AQGvmTMRFrunuWSFE
         HpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553854; x=1778158654;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3ufzsgyvNFjBRE8/ddg1ljmJXjnhpyf6EcPBtxg5ec=;
        b=r3pRlDUi4vMpS+UmqXtQhJxXYYPNLjNTedqouum9yXhyFB+Q+ZYkoG/O1ndKCaEPlI
         JUkjI+BrpHnAIjPDqtQh59RnvGqkuJySSzBBtqrbOITsoeId8H6YeSCkLzqaj2msK1Cb
         L84ttYEilMf+dkhiHuR95RlJICUhzGYuSGq/SbP5yN09aliFO1xmNdGubLe7qcFoO8lc
         NyJhAi5LOu//9OrLzHTyvS3CQNOPdhZn8kgMmtom6K8RLAulMIUJ5cvZRGDYp2iejID1
         Kd+aaJEvyyqYjqtxq35i5CYoskUpIG7xmrO7sCV9va2L0zd3HL1uN4Fzti7DmtqRvcXb
         KdLw==
X-Forwarded-Encrypted: i=1; AFNElJ9Dm2c/ubxu8WweNoROCyQfl9W12+Odnxrgfv44TsonB3nz7JVeDwP2rvptSEOHqRARdYi+ZhmG+jQZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9/ERm/YTb5HcIXCgUObQoe9scnHgvx5iGZIr+oaUETpJiZ3Dy
	G1f5bFmWXxZmWiSpPr58265s/bbjTtx4aPskeMriuJzHWaXlFhWxzI/Co/KJvFWHXejehwGOn3b
	ImwE5TdhYcY/ujATWPuQrEl/BpVVp1u7lTj6l/nVlTGo6XrTP897a9++ggEWjyk8g
X-Gm-Gg: AeBDieugGfmCXMQi246vb3QaEa1CXGNU94HBa8tWsACQEfcwaUlWi6DM3azQUipChp5
	jO82Db/xD8ntQH29ZyHgWV42/JVTfqnf4uHPEnjpVQ3pswnJZL4qiQdDTonSqz8MavuClLmlfiU
	TUoUel+0FbzVvZR3RF+UKRsxW++CN0n3xNpNc5dAlHD2r2japZomWELbUpihLb7p/srHeGTT/TY
	DERUFKtJz9vR/PyrE7ycwBTvkh7mRVtKGqQAH90E2r6jGRD3vUC3VoUDsOXc+GJThBbnC28dieP
	KN6HUpDzAWGf4Y/XfuPnEflHSTz5OJjH9Lg58i2u6VeG5C/Pl5hSJCs8rbzw5AOA8bA/q1Q58jm
	IoILmQgTAOMItOh509RHzM7w9/mA4XDZbcN/Ic0L4Z4I4z/gic3b+arnGzO6NGg==
X-Received: by 2002:a05:622a:c3:b0:50d:83d7:686a with SMTP id d75a77b69052e-5102ae16055mr34237501cf.40.1777553854208;
        Thu, 30 Apr 2026 05:57:34 -0700 (PDT)
X-Received: by 2002:a05:622a:c3:b0:50d:83d7:686a with SMTP id d75a77b69052e-5102ae16055mr34236941cf.40.1777553853696;
        Thu, 30 Apr 2026 05:57:33 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:85ad:7a05:49a6:88be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c326873sm41899315e9.34.2026.04.30.05.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:57:32 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 0/4] ARM: pxa: attach software nodes to the GPIO
 controllers
Date: Thu, 30 Apr 2026 14:57:17 +0200
Message-Id: <20260430-pxa-gpio-swnodes-v3-0-5142e95f0eca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK1R82kC/23NSw6CMBCA4auQri3pg5TqynsYF5VOoYlQ7GjFE
 O5uITEudDPJP8l8MxOE6AHJoZhJhOTRhyGH3BWk6czQAvU2NxFMKCYlo+NkaDv6QPE5BAtIuRR
 Gc+M4A0ny2RjB+WkjT+fcncd7iK/tQ+Lr9oPxXyxxyqhTymplObPaHgNieXuYaxP6vsyDrGYSX
 6cS9R9HZEcr14jqsoeaV3+cZVnedeaQSP8AAAA=
X-Change-ID: 20260330-pxa-gpio-swnodes-132a81af10e3
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1794;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zE1wkg19bTTKTBR6uB76uaks20UgJ9yPFLyhDQR/6Ag=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp81GzxouoE5lPdjQ83204u2PKVGz1mRPJGUjDI
 vBtDniD1FqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafNRswAKCRAFnS7L/zaE
 w2qXD/wN2uqRMeHAfMw8LhHN9iSTSiiwSKy/MIVXnvGelgbVZSZC+XDKjeECNNQjcGs/s8OwUdc
 Vowr+dUJ014vJeDu8Z47CJiDdirBPBic9PqWrt8Ihg1pghBiSjcv9C20RTag2pTz1p+3T7QdHy0
 d0yHPUnXGW3Hsn+Wq0x3MVl7jiB474KKQH5tBOkXXcM6z/FoKpPbbQNfBFwj/OHd9aISvgg77s2
 HLLqkEtBHC8DWkwu2F4oFiGtHZChEvZ+4HeRRxDhBcyvSEYtRorDDpmA3eaCAptgxU3XilRN63B
 a44KYLAWU33QFLfCEorlU1qqscPkEzYjntKctqGENdw6k4iJ5FRCpbrO5YFQhcp6hoUio9Ibl9J
 eX3QrYpp0y514i5wF7Di7m/iiucZoligUX8GfN059rtQJPn6PYZN8qC5SDnBCPJA+Vq9WxKSVZT
 7qlFLcKYHRRbo2BHuq98gb+5qCArZBw0pwoxzxhf8Y76QMlYBkLxnDOHw2i2G5RMt0TbGRPQPRR
 qQk84GJnqIQly6EW6+1r/AovRuA3qSG8JuAubVQREzDPexFa6xWP2LMNL2dKkM0M6r/RZAxUif+
 HRoil+TQ3X+Se9q4mmpw1pUl9EOTcIOXz/gaNIG9OV7qIGXb/Y1n9EjbrUXdLMKzDw3WAYegdMk
 hElNJbnW/U5JJJQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEzMCBTYWx0ZWRfX+Yfppj7vvpoJ
 WPclvXU7iWEOeseWlMSUqVQjxYl9c3dzZOAdLaqnngD0P0p1YHntBg60veCTf8KxQ/RItXYmfzD
 xJAD40ls0VW32D3ccRxJOIJiZ5rUsunpTvf3SgDMVYbBhw1ruticMMh1+sJSRJ/B3FPUnRmXORr
 1on3Q8YgR1xIxmS1tKF9iFeiS/AuXHhRwq1vZFQgGbAr/KtifAGOqUm6a6frUkcIYjuCNT9fUHZ
 FTRfmhCV2vuKDuO1s1oG2PifTEeDPtJDh2SERZCrMOojdxn+53oZcutHUP3ilHxn0NTayzAaebF
 XwBbARdhFGZfO7okgQSxUSYqp5GONVFEextnjyD2IdPtnuWxiq/QVmX4U1lSMQ7SD0XiOa2w5Wh
 GXDeOblAMII03jwzX0oNGNxRrAS3otyfZYdVKvuu+Z/83qxoF8odjXo3ZTs5epyuJT6kOCHE3+r
 pTji6nX/OxP/9WlAJPw==
X-Authority-Analysis: v=2.4 cv=Zrnd7d7G c=1 sm=1 tr=0 ts=69f351bf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=5j7h0pFm_H_taD54xyYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: FX999lBHSIrcZQvukh3Wh0lkfevzKzCd
X-Proofpoint-GUID: FX999lBHSIrcZQvukh3Wh0lkfevzKzCd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300130
X-Rspamd-Queue-Id: BEA604A3225
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35919-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url];
	FREEMAIL_TO(0.00)[zonque.org,gmail.com,free.fr,armlinux.org.uk,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[msgid.link:query timed out];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[bartosz.golaszewski.oss.qualcomm.com:query timed out];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Convert GPIO controllers and their consumers on the PXA platform to using
"attached" software nodes. Since everything happens in a bord-file, it's
quite straightforward. We technically now have a way of passing an
unregistered software node to platform_device_register_full() but that
requires using struct platform_device_info and since the existing
platform devices are either referenced from other places or defined in a
different compilation unit, I wanted to reduce the impact of the changes
I can't test and went with the older method.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Simplify patches 3/4 and 4/4 by leaving the devices in the existing
  list and limiting the changes to the fwnode assignment
- Link to v2: https://patch.msgid.link/20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com

Changes in v2:
- Rebase on top of v7.1-rc1
- Add a patch making some platform device definitions static
- Link to v1: https://patch.msgid.link/20260331-pxa-gpio-swnodes-v1-0-f66d86d10d8d@oss.qualcomm.com

---
Bartosz Golaszewski (4):
      ARM: pxa: statify platform device definitions in spitz board file
      ARM: pxa: spitz: attach software nodes to their target GPIO controllers
      ARM: pxa: pxa25x: attach software node to its target GPIO controller
      ARM: pxa: pxa27x: attach software node to its target GPIO controller

 arch/arm/mach-pxa/pxa25x.c |  3 +++
 arch/arm/mach-pxa/pxa27x.c |  3 +++
 arch/arm/mach-pxa/spitz.c  | 11 ++++++++---
 3 files changed, 14 insertions(+), 3 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260330-pxa-gpio-swnodes-132a81af10e3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


