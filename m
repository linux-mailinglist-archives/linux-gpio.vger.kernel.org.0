Return-Path: <linux-gpio+bounces-29221-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D2EC9E72F
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Dec 2025 10:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 29C844E1279
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Dec 2025 09:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6C52DC79D;
	Wed,  3 Dec 2025 09:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NO76NAGr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sl9pwEFN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1192DC780
	for <linux-gpio@vger.kernel.org>; Wed,  3 Dec 2025 09:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764753802; cv=none; b=qrXFEdzaYyKAbjI8eblPCTwGmsXaefsSEJvTEFtRig/H1H9JkIOgOh8cMHg3aJAjMvIIySdn8wfrX/uFEBRGorjQK26WeV1A6w0fOkF3SNDylQ9G6MOCSziROJeFAUAQ7zIaZPyGplzqfy9IRzNIRlB78RD+jUhu/pDV4XCv9kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764753802; c=relaxed/simple;
	bh=LKaFFPl4xqfiTM/QFdNxEBI9MVWWe+wmTfGKkpOqjQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uW5gj41DTNLrMDRTJ4WW1gbxU1kafSQeMO886DNj5wEym2+ajQ+oDDPwvRAK8v9RRTx/NWOa3MpmRX8DKL/VD+8YKTdnqubcBWBGDf4DHYaTr04oj84yXYK6lBS2caq8ZdsoHOA5xCjzTxY3HFqlFEUsU78R0ankx9dvvVCX4kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NO76NAGr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sl9pwEFN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B37XiHN1904815
	for <linux-gpio@vger.kernel.org>; Wed, 3 Dec 2025 09:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HkxeW93AfLi2WPjJdVcQeSFodmhmNeXrPsR
	801VxrIc=; b=NO76NAGrgrs3xkVH+R4LjohbOh0dGhBva2g/mALg7c6rqW72Qas
	gewH+aEEmjAOT9K7548gnzPb+X1SfJDvO84GPX4lyZedcOzwmbHRktSJXzJgfvMi
	TYqpftaS4+H8KwvE+Fd+vBRs5epijvn0wMcQ3gSJU0BfDvoOkcjmdNrCyfPR57k5
	HQ7qottKqmhykrALv9T3/onCiXyF+62RR1aU/BDd2NWFNbdP/tLhGzsz7bf7V0Yd
	W+MhnKbfnL9GGNzx0iTsptYw87LdWuTcAQww2gRox7ytK5CKyNnyH0+cwQI2tIEk
	S+DLMeByMQEAXruGb/6/oPPOKdG3a/1D4qQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atgx3gaqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 03 Dec 2025 09:23:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b259f0da04so1252952385a.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 Dec 2025 01:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764753799; x=1765358599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HkxeW93AfLi2WPjJdVcQeSFodmhmNeXrPsR801VxrIc=;
        b=Sl9pwEFNX85Tn8NKvQZKBQZyVEY9s5LwppiSYQvgwn8zgECQjEzfqvwsZaM3+a6Y91
         juNtNvgoa9wpyrNEWykGWmD+Stlg99kDK/m2NYykJsgFy7RyOvgCM+XKKSosdALksYSJ
         A/JlAQqJ3Xf/2PT8IfkVvFHJY9ScrfDESraBgh4eJIVC2Rsmx9GFDieJSohMjDy9kW39
         fEyTc1qyFs66PNMX9RKUiJUS+IEyEvHBNzOOEGA89RNsSumqrziLAH53SHX41HJ4GwlG
         ADFzmtb2Khd4Rnbkcmeau/X6PgO7fS7nwXDjqv7fRbi4dXshFJFc8lq+ggjZASZEqxub
         wkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764753799; x=1765358599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkxeW93AfLi2WPjJdVcQeSFodmhmNeXrPsR801VxrIc=;
        b=daY6zKKKu8ZverCp8SQ2+zkHyuXIL9w1V47+jhTOs1S/xqGsNyHGK70rB3c3CHQQ2A
         hGv8j9NGdtom2GQ0LdD+vPaO91AY+pVl8Yd5mQb1PrNXk1sYTFIW+jnzgP5hWzFuOwso
         lnof5qsATr9UgPIC5NZ2QPddzuD2RN2HTWhkz1bZ90G5ye/8zuWLFRNiQGomHF6tljjk
         QVWKp/S3cI8WDSKvjzvQ0bjVh7vm1aAL4zbRiaNPQgvzJi+5CQai7NCWHbAItV+LMyK/
         LtmhfGVi0BCLqUIV8o4vHqMjmRLLvUN785mbRSenOPsn6cG3OSSNYcqPI5jpY6ae5jrT
         FYcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL9OAyOvYWiXcVzeox2WZOxn/RPuPXCOL1S/aldshVUwfCLK3za7o+i4XdDmeRWJBWrufqBK522M+Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzSQ9clt8PuahZgrcOMY9hbIrtoEW780U0Bz8HHFBPWRdZ/rMIn
	RYY6NhAZeA+VFzf4H/oJL5CVafmDItBvUmb6EhIdBiZ00npKZrObcwMtA93VZujOFMoERhRhguU
	tG2cNUzyqaFpPxkMU9FsIEUN0p+Jeyv03AhUbeS9Fl4G2ROebb0pYVPz0Qnb+XN0e
X-Gm-Gg: ASbGncu3wcUO8KjIV4Iriz0IaYTQIkewkMj+9hCfUCDv7neLSwu5Yi9gdfaPEoBAP5L
	A121XmcWzPiOg1fmQICZM4bvLvl147nQvjQSiEYWURXDXG//NbybIKE1rEDUpm5uHc6VJgUKQn3
	uuDUvEwvBf7gk7aYa+A33Y1s9G9l+aoyX5kIfJK7rR9Hig6vDj8DWePFkT8OtyOw5zAt+e1+h1r
	1Eo/h+adargOnKINiHpAxWauriUlSQH0VWU9dwm9//bsIJG5kDXU0r/M//JSkLMijcQFTQf8hcc
	Gj3rj0nuHu6JFawhPfrGSrUptvupOdoZKyAeznArkPx3ExHiyAF+cxb4Kn0oY7JasMvsg8wLxg/
	75sBxWFT+TX/6jDTYdgI=
X-Received: by 2002:a05:620a:2844:b0:8b5:1b5:cafc with SMTP id af79cd13be357-8b5e5927cf1mr206549385a.36.1764753798813;
        Wed, 03 Dec 2025 01:23:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAGx68Hc2eaoLlDCH6AACsu/p4oEkVhmnXBQjEl0vWdD5VjInIgN5AuLzjJi5OBNZ/NFR6SQ==
X-Received: by 2002:a05:620a:2844:b0:8b5:1b5:cafc with SMTP id af79cd13be357-8b5e5927cf1mr206547685a.36.1764753798415;
        Wed, 03 Dec 2025 01:23:18 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:4927:87f9:56d:9fc7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792b05ce9bsm11827055e9.8.2025.12.03.01.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 01:23:16 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] gpio: shared: ignore disabled nodes when traversing the device-tree
Date: Wed,  3 Dec 2025 10:23:09 +0100
Message-ID: <20251203092309.34737-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA3MyBTYWx0ZWRfX03FdAkBZ+sG3
 u8QZA81ZVm+flA6q9uq9Oumox7xKaR595/ac2xcEbQGg5XEaeD5hsXjpaoZ/mNR9uhjSQO61gg8
 BewxkrH8WgojFVHh9jeHQ237RpaePRrOrwIYMykVcq1hCqS39CPIbOgJX8sm+kVpwA6MjHENJ14
 TnN1fBz5GQn1vkg0je9cp0SxjVXeWJk0i0wNknxgxyGfbFYDYaI+33Nb10+ruTL0HBCHOFnEfti
 6E23a7dxnOYVCUEgqHNV957tK6b8XWf1AkiD/+hQSGbvle9tX3idhCuETw1XIrvWbP734jIXwrE
 4UQQsr8ZcWqiZW7oIojm2czHAoVv8o+Rei4kgv4kYQv2FqKCM6xeFiF6kga7gThACYhB5c/Gm0F
 zX91p8iZaXKu0ER432+KzGGcCiktSw==
X-Proofpoint-GUID: flgjmZcmWKMqDB98HJMgiMJHqtHZ9NnL
X-Proofpoint-ORIG-GUID: flgjmZcmWKMqDB98HJMgiMJHqtHZ9NnL
X-Authority-Analysis: v=2.4 cv=R/QO2NRX c=1 sm=1 tr=0 ts=69300187 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=OxxN0QaJRdVt57j_GKcA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1011 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030073

Don't consider disabled devices when traversing the device-tree looking
for shared GPIOs. Even if they do share a phandle to a pin, they can
never be instantiated and request it.

Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 8bdd107b1ad1..5d15675d61ea 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -77,6 +77,10 @@ gpio_shared_find_entry(struct fwnode_handle *controller_node,
 /* Handle all special nodes that we should ignore. */
 static bool gpio_shared_of_node_ignore(struct device_node *node)
 {
+	/* Ignore disabled devices. */
+	if (!of_device_is_available(node))
+		return true;
+
 	/*
 	 * __symbols__ is a special, internal node and should not be considered
 	 * when scanning for shared GPIOs.
-- 
2.51.0


