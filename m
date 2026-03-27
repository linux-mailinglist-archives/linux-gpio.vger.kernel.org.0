Return-Path: <linux-gpio+bounces-34247-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHPuMhBgxmm+JAUAu9opvQ
	(envelope-from <linux-gpio+bounces-34247-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 11:46:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D1764342D13
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 11:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 86C9030A1B1A
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 10:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A20222579E;
	Fri, 27 Mar 2026 10:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MXP8idKd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gp59MI1Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65E43B6C19
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607499; cv=none; b=Om4+qdSE4OrcT20ZJVWGQluAwRkn1Pvid70RvyrmUcpufW7XKRy8asEo3oluk4SpSbBc7rcAhH2RDlszOUxffYpbpQ1HBv5J/nHMJnQKFuQXfNOfBD0DCtT7MmPs/4ZFGAFMlIvd32QB6dRICux2jrE/42tGzeDsNUoK87Ye3M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607499; c=relaxed/simple;
	bh=WU6CDpkC8Dvbh1VCJ3wGEu3AeMqtqKzCcbncYoIIAYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kdX759rdhjotQ4rkskhdE0h5uJVhZXuVS1ONdEjwaBoynyghYX6+8N6kTFsxcyiBtTsdtCWmWH+mGGle4MVc/iAz7JBJTodHnJ83KCUdGZpVQgggr6hTWkrkg/uW/fkUjmxWLln1cWTdyNgzExSnwuei6T7kV2x0mgPe7hYJo1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MXP8idKd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gp59MI1Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6w3xD1860237
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3gB2pfdhzvATTeNOLtgyG3Q7kaxhJF7M36bMfUs/gTo=; b=MXP8idKdvurI6883
	qOomr1pOlOs4loHEG/C95gwRZGYWsity4Fagjv76OrCmxBSamW2pKP4FDYCJ+sUR
	pkfmO2jDdWlTth5umvXvt8iE1O4xpwIfr60ipPXL0A5dNUB+94gG4J7FyfzjQ1Li
	bE7WdqTB8JVke/PBEUmdL2qdNUaavv4Tml5DJH+8PenXmgHdT0fdJyjB2lQCN4iz
	qj1nWOCNTXUlyNRGaERLtO85KwlRJ8sUOE6T+PQ6t/orCldvdJTbChahfKS7PmTv
	lUbXYgzSk2DY3xNwg0odAGR7TVRjdyKqQxBUEKNquJrwHHw4vTFakSwUqfN0V0px
	QlFevQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxv2mh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:31:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090cc6a7d2so58886231cf.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 03:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774607496; x=1775212296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3gB2pfdhzvATTeNOLtgyG3Q7kaxhJF7M36bMfUs/gTo=;
        b=gp59MI1ZAokgRYfVgmk37G3TQjRFRwDNXt3/Dgxn0V7tucLjn2blK+u9rPmHgY8Tk0
         j9uqK+79kl46MR2v19KkJrncbUsW2smjPNNJyUf9Ef9pawrGci7j/xa5kPjdiz2G5icG
         5Ilu1aM3jR+YpJ5xnjcHpI2tC/V3q5iEmgq7yFyM2rDq2jGY53DWn5kPBbCQeGCen6aC
         O8IPijTWLUfGtcA7yV7htdjSwEmj/LmZIhZn1ph0e6SySV4lMe/aKQZnrYLPzWWnnE5a
         31od0VB2E6Mp7OBr9PV2TrdskxLIuYnllPQqRFbWE2dQt5mOMuGRx6LhD7QwHxGUE/TW
         KB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774607496; x=1775212296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3gB2pfdhzvATTeNOLtgyG3Q7kaxhJF7M36bMfUs/gTo=;
        b=gQ9gg6TcMt3SAtUGCjm6uO5OOdn6JrCy8J1zyRn8TnB1h+eapaiC6Id/Lx/T3r9C+o
         WFBrdomq8jCOoiSdGdsAOFlukEPcbWIHdkDdgyA15fZDIVtLgJLGnmKfSAKosqHJqSQj
         z2QmjhinomxCcfnhcnbdaTq9tM8hOYpF7NnZIfIf6rkE9f3uijGhOJ+VP38ajLsx5dfm
         avwGG1UM6qCxsr01IWhOB55JMLyOT0MRnLVycL/VxK7ENVVs0K0bg+vuA5GWc06Tiw6d
         v/OP4MNOrlTNS6KeW+saaI7d2/utR+9WLFymfjK6et9OQ35Y90VfDyx+Bhvoe+OEXYEe
         ZOmw==
X-Gm-Message-State: AOJu0YzOZvV8khk6/3QSN8Ld8tQJJhlRPbGGatfk1X+FcJ2FPklTaR0H
	sz5fZE4KXxvdqEvqwLT97zmnJR6eTAgHiaXWp4kfjbXPMX9P0vtYVF0MR3apKn/ALm7V0IsUP+9
	NJr8ZQRs4reqpjIDuvVNabIj0e7EuQVpGY7UkJYLcB/btzsNMjxP7rKvz7/htmWO9
X-Gm-Gg: ATEYQzzbnGUXMa5Lga3gCehPtzad/UX5CkFslcezB5rGAFBWBtmE+exloivlREQ424a
	U/e3/tYm5cFCFVUufO3oHWP5ilYQql4ak5PR9O4eou2iqOZ19MhPJtruT+I+1t7OmiF23Phudut
	C9MiptGxSuLU5Kr7Dq7priikCr1wJTIzgF+rWhDSZQywBsGOYUP2Fk7C7QDb2gAMi2bsUgrF/fo
	Po33dtfzeceHkBwOLfuTNU/KIFjk3q0Yu1X5mLuFHyYZvUt9XJZC0TxVhNOmXEXpxvHPPoMi5g3
	nysGjFrsMsJy1TtEnki7IVIBdRGX/Cwdd7jgTKFg9Kun1zu5Ls6EeRbY1swCAGn21nX7G3VcS9p
	YEtrHQAqG/x5uQjAftpiHGhU8DofYXeKE5LjgNL4j0QIKKt3rZH0=
X-Received: by 2002:ac8:5982:0:b0:50b:5243:d679 with SMTP id d75a77b69052e-50ba38b1800mr23937691cf.46.1774607496238;
        Fri, 27 Mar 2026 03:31:36 -0700 (PDT)
X-Received: by 2002:ac8:5982:0:b0:50b:5243:d679 with SMTP id d75a77b69052e-50ba38b1800mr23937261cf.46.1774607495728;
        Fri, 27 Mar 2026 03:31:35 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:94ec:a3a:baff:9151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919588e6sm13382138f8f.16.2026.03.27.03.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:31:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 11:31:14 +0100
Subject: [PATCH 4/4] gpio: remove dev-sync-probe
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-gpio-kill-dev-sync-probe-v1-4-efac254f1a1d@oss.qualcomm.com>
References: <20260327-gpio-kill-dev-sync-probe-v1-0-efac254f1a1d@oss.qualcomm.com>
In-Reply-To: <20260327-gpio-kill-dev-sync-probe-v1-0-efac254f1a1d@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5390;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WU6CDpkC8Dvbh1VCJ3wGEu3AeMqtqKzCcbncYoIIAYU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpxlx+YuCT5bM77vqw9y37aa3cTWbIljfFX6LDP
 l9lF7bBLZGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacZcfgAKCRAFnS7L/zaE
 w7PGD/96S1XxvMAn/LVbrC3X09OwYebs5mrMuBjdtw8876fx9SDho5XLNX5pGEmG4Xi9kUHxTLx
 Eunqpoj0GnRXkXHIRV7zfCmEpN2lGJ+9D+bQ7vURI5ld+f8y+XbwF3ampX8I4g84z//URvKaMac
 0H7M6ZCHuXWo4MO0+Z4XbOMGdrthjB5wviXIVZuaPkr6NR6O7rbkLrml37dbau2LhPk0rmmAFVB
 dFbfaytCtwFUKHyt/My3rtgWyLC5cimZPq6H4J2/sP5vB95qyvCr07gufFHwvBHYRZ7TOsIj5yX
 T1PGKJdq9E6h730GGERFFP9pcgkW9bgAp+hFxAThjbj2g8Y8SjhSlgj0WuSp5814igLhjIxuj2r
 EjScMq8iQ4mdUH2ViAsS6GeH4XCJGkugciElEe22s1ge+8w5/ghmNIOqaIlkFHlbQwC2VBxMFry
 VbE8Uh0cOXBZmxoBzp5bzE8Cyh41z0R7ct3Sv17DnigPgSYPDYMTUr/DyUgieBWUQN7RZXXueC6
 wkhrxxnl+76Bq15vfJvvVWv7qobrmLtHg1DTzJkA5X3KwV8ifTZIIqQ8qm42K3hwyDCGN83iRZh
 2+sxLSCxAVQutg6K5B5BxsPg20F+MtW+jwi2Beh47ktIuzsVu3bWu5YfJY5G4vOh0l7LuLPYkt2
 EOj00yEK8IpQE2w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=69c65c89 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=DfNHnWVPAAAA:8 a=G7goKWzWcKrMef2dhUMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-ORIG-GUID: igR_G1DY2o8nz2jl50ejp5VhVbMz_Fz5
X-Proofpoint-GUID: igR_G1DY2o8nz2jl50ejp5VhVbMz_Fz5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NiBTYWx0ZWRfXxsmmgEMnpfUm
 7szVjBHbgiDAUMXsB4vk25eoP0TNoCgK60dcedYD55m+i0VBIYtXocMrSILRn3tyZCBQcoEi4GP
 UTeaD1acnikF9FllEwRXDQcqnvGBS6c6+MXUfb3PmIRArs55w4Ou+CEQKu+HD1GndbyVaUWsACu
 wBKuGlltRuFkFTRoLsUszHjzYGYX+MQNQysvdst9aq9o1EXlAIoy9BZ8ERm19JamjhO4CMOq40m
 yCrjHbKgwHXsHGZTKAE9f2CGG6733nwR81FmdyLCW2LCBO3GbfMpkAGf9V+eJD8LTrGo7gGOEAr
 Jr8Irx63MXa0jeVuvH/8umGZ23sSioHrHHt+uK78U59B90A0t4+Q9MLIeT+w7Ut2Xd3MpA07A2p
 htwpqJVjbOzuF0MTVKZ4MwFLk//j58F4ifKpt1bRukInhTx2oK4GYFnxxpZb+zCGNtcM3pJuDJJ
 Ja9EkIp6bxt4BiEpamA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bgdev.pl:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,canonical.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34247-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D1764342D13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There are no more users. Remove the dev-sync-probe module.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/Kconfig          |  3 --
 drivers/gpio/Makefile         |  3 --
 drivers/gpio/dev-sync-probe.c | 97 -------------------------------------------
 drivers/gpio/dev-sync-probe.h | 25 -----------
 4 files changed, 128 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 56a7ddaa95eac07ee4f7b755335595805a316319..257123b3568688ad86a742043af2c6e098a56c3c 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -2082,6 +2082,3 @@ config GPIO_VIRTUSER
 endmenu
 
 endif
-
-config DEV_SYNC_PROBE
-	tristate
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 20d4a57afdaa6db0d01cd7e107a2e22004641ecb..199b9559a1892c4fce058cb95907de0be5d85780 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -21,9 +21,6 @@ obj-$(CONFIG_GPIO_GENERIC)	+= gpio-generic.o
 # directly supported by gpio-generic
 gpio-generic-$(CONFIG_GPIO_GENERIC)	+= gpio-mmio.o
 
-# Utilities for drivers that need synchronous fake device creation
-obj-$(CONFIG_DEV_SYNC_PROBE)		+= dev-sync-probe.o
-
 obj-$(CONFIG_GPIO_104_DIO_48E)		+= gpio-104-dio-48e.o
 obj-$(CONFIG_GPIO_104_IDI_48)		+= gpio-104-idi-48.o
 obj-$(CONFIG_GPIO_104_IDIO_16)		+= gpio-104-idio-16.o
diff --git a/drivers/gpio/dev-sync-probe.c b/drivers/gpio/dev-sync-probe.c
deleted file mode 100644
index 9ea733b863b2232a16ef9ccc411f180b43bad26e..0000000000000000000000000000000000000000
--- a/drivers/gpio/dev-sync-probe.c
+++ /dev/null
@@ -1,97 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Common code for drivers creating fake platform devices.
- *
- * Provides synchronous device creation: waits for probe completion and
- * returns the probe success or error status to the device creator.
- *
- * Copyright (C) 2021 Bartosz Golaszewski <brgl@bgdev.pl>
- * Copyright (C) 2025 Koichiro Den <koichiro.den@canonical.com>
- */
-
-#include <linux/device.h>
-#include <linux/slab.h>
-
-#include "dev-sync-probe.h"
-
-static int dev_sync_probe_notifier_call(struct notifier_block *nb,
-					unsigned long action, void *data)
-{
-	struct dev_sync_probe_data *pdata;
-	struct device *dev = data;
-
-	pdata = container_of(nb, struct dev_sync_probe_data, bus_notifier);
-	if (!device_match_name(dev, pdata->name))
-		return NOTIFY_DONE;
-
-	switch (action) {
-	case BUS_NOTIFY_BOUND_DRIVER:
-		pdata->driver_bound = true;
-		break;
-	case BUS_NOTIFY_DRIVER_NOT_BOUND:
-		pdata->driver_bound = false;
-		break;
-	default:
-		return NOTIFY_DONE;
-	}
-
-	complete(&pdata->probe_completion);
-	return NOTIFY_OK;
-}
-
-void dev_sync_probe_init(struct dev_sync_probe_data *data)
-{
-	memset(data, 0, sizeof(*data));
-	init_completion(&data->probe_completion);
-	data->bus_notifier.notifier_call = dev_sync_probe_notifier_call;
-}
-EXPORT_SYMBOL_GPL(dev_sync_probe_init);
-
-int dev_sync_probe_register(struct dev_sync_probe_data *data,
-			    struct platform_device_info *pdevinfo)
-{
-	struct platform_device *pdev;
-	char *name;
-
-	name = kasprintf(GFP_KERNEL, "%s.%d", pdevinfo->name, pdevinfo->id);
-	if (!name)
-		return -ENOMEM;
-
-	data->driver_bound = false;
-	data->name = name;
-	reinit_completion(&data->probe_completion);
-	bus_register_notifier(&platform_bus_type, &data->bus_notifier);
-
-	pdev = platform_device_register_full(pdevinfo);
-	if (IS_ERR(pdev)) {
-		bus_unregister_notifier(&platform_bus_type, &data->bus_notifier);
-		kfree(data->name);
-		return PTR_ERR(pdev);
-	}
-
-	wait_for_completion(&data->probe_completion);
-	bus_unregister_notifier(&platform_bus_type, &data->bus_notifier);
-
-	if (!data->driver_bound) {
-		platform_device_unregister(pdev);
-		kfree(data->name);
-		return -ENXIO;
-	}
-
-	data->pdev = pdev;
-	return 0;
-}
-EXPORT_SYMBOL_GPL(dev_sync_probe_register);
-
-void dev_sync_probe_unregister(struct dev_sync_probe_data *data)
-{
-	platform_device_unregister(data->pdev);
-	kfree(data->name);
-	data->pdev = NULL;
-}
-EXPORT_SYMBOL_GPL(dev_sync_probe_unregister);
-
-MODULE_AUTHOR("Bartosz Golaszewski <brgl@bgdev.pl>");
-MODULE_AUTHOR("Koichiro Den <koichiro.den@canonical.com>");
-MODULE_DESCRIPTION("Utilities for synchronous fake device creation");
-MODULE_LICENSE("GPL");
diff --git a/drivers/gpio/dev-sync-probe.h b/drivers/gpio/dev-sync-probe.h
deleted file mode 100644
index 4b3d52b705198dd153618b087ba9d813736a6f29..0000000000000000000000000000000000000000
--- a/drivers/gpio/dev-sync-probe.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#ifndef DEV_SYNC_PROBE_H
-#define DEV_SYNC_PROBE_H
-
-#include <linux/completion.h>
-#include <linux/notifier.h>
-#include <linux/platform_device.h>
-
-struct dev_sync_probe_data {
-	struct platform_device *pdev;
-	const char *name;
-
-	/* Synchronize with probe */
-	struct notifier_block bus_notifier;
-	struct completion probe_completion;
-	bool driver_bound;
-};
-
-void dev_sync_probe_init(struct dev_sync_probe_data *data);
-int dev_sync_probe_register(struct dev_sync_probe_data *data,
-			    struct platform_device_info *pdevinfo);
-void dev_sync_probe_unregister(struct dev_sync_probe_data *data);
-
-#endif /* DEV_SYNC_PROBE_H */

-- 
2.47.3


