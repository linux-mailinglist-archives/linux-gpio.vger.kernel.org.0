Return-Path: <linux-gpio+bounces-34639-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJ6sFMC7z2mj0AYAu9opvQ
	(envelope-from <linux-gpio+bounces-34639-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 15:08:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A95394527
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 15:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62CCE30238F3
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Apr 2026 13:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E483A9632;
	Fri,  3 Apr 2026 13:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5ke51P+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fadhgIFl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE62137C93C
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 13:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775221514; cv=none; b=Qw/PRwun0lCrZ4+71FCf2HLdXeRffmywakMHuBEJsqDA6SDTLmtcFY7uRJV8F0hMazMNp7perE0kJYcMzFhSY825YONQVOxRZ+OB2rMOEs81184vV+yCVbPN3QK09VLnkXbQmT062GXQfo8rnEMtWInrJ7KdXnttyjmIhzB6NgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775221514; c=relaxed/simple;
	bh=UI0xjgQJRvAoa59/OcrNBMSxM4PXDer91jntNEu7BgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HaTp7pbeLFthZn95RVUvpW4fJxOHlnjwodX3/PRnjxNGQw59cI42kwNA96+Zk1ihKYrL8u4z61REG63JK0iatiQ2WoYnkgHk7G9jbWRmuQjqoS1foXN4gAP1zxjN290QHTzJgaKzZNiZp8zaFSi1yEafXQZige2f1nVRY5NSr6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5ke51P+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fadhgIFl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633BqAmm3780374
	for <linux-gpio@vger.kernel.org>; Fri, 3 Apr 2026 13:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hzbNjz7s83d1n/RewTAsaz
	iotGeaKoaGJzKT+pCY3f4=; b=O5ke51P+/Zwt8BcUFQQ/YqyKoQC1cgPsQ+CQtp
	d0iRvRDz15mKBrwVNczVrfUlFuja2DTWptkUgS5M0Ksr/5qeDNSv5ZY0muRjAgLx
	fMF8E1DwOgn52N0vQWxurbvMdahRLk18O/PfVYBj+AwPvfsP8yA0ONwUhqU1eeWR
	PXEYg7efSP9DUbk3c2N1c4rnNuBXXqEcT3qMgUtZojeVT5Svdna6fL/dv2cxH3Sn
	s8qfv2KM4+HAqucoVaIP9tgxEp3mqwAVcpxcS0Nam83GOMZG7uRE1cbL8+r4ha6u
	XiaVVljxpX9jXz+8RH07+5jEzEPAnNYDg3SPKU3JgPQg2Fag==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da663hfcu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 13:05:10 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-948b41f95deso3262182241.0
        for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 06:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775221510; x=1775826310; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hzbNjz7s83d1n/RewTAsaziotGeaKoaGJzKT+pCY3f4=;
        b=fadhgIFllBk3OYVJ2/grB1Bg0z66R7MNrvjgXoAXRw54zH5gA3q9wl34gH9CdXaeZQ
         Ks92oPkGkRel3Q2leIYSLKvIibWbxFJK7MW6hsz9MKtkp1p3wtOVkQz2KVO68xcjLb/r
         84PwmiHO54NUlLQ6PpJp1fPsYdJqBaIAFNrTTGsVKbXR0vE+t4fSpioWAm1FJSqn72gi
         g612P2UOYrBkDajnyyjGTfnI951PC73ZVkb7pf/xaTz/eMF4d1chULIFfYx6XSHmCOw/
         Y0EsTLOHnaimdzl/IvdmsiLRzungQB7HbzF1X+4qFU56jC4/67LxXoUUwhHdngmq1s0N
         6rvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775221510; x=1775826310;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzbNjz7s83d1n/RewTAsaziotGeaKoaGJzKT+pCY3f4=;
        b=cJVDQVHvAhBQjjYzfIhEXh+xnysS3aEy64njoP49RsrKw1IP6jXJByjyCvLqHdO5AC
         grLCNrsLE/4PlkR0wmxKlObDrBF6RfUtEJ7Cq43w7jmY0kSQjCJAo+3nHrBliUK6fH8F
         B1kGXgFihaD0zdu8k7vcHT7pF+Cd5uqP/IVCE+qpCm+XBODMxef5JDpgBBxmRgAuKhOx
         a7SXJxTs4/kRcinT9yTKm4TIm/gVPE8nUU1I9EJg7LJEbp5RUH6R4aWrePgNwVuLiYRi
         xIxNTTpQEhhzTI4Rh18C0d4KHflv6pM1nOGyYYQWwlNhGPpWQkdsWQP8lBgTAY6LeH9H
         4/LQ==
X-Gm-Message-State: AOJu0Yw5o7M8lgmU48BENKbCVli9lmJiwia11KCywvOQ7LJeHaZq7mmh
	lzXZjz9sIFZ5N1OcuwLpdutxp5w37GVpSPbSYVIG8ZTMPaxjz1Q7G/YhY5Gu9VbHUW6R3AY/BUS
	CRdD+q8EJqAWSM+sdxfJ9cfPMg8bFugENi+xhEN7AUAJIMRo5HlsDQInjfD0CMO/Z
X-Gm-Gg: AeBDieseqe+zhNX5i/Hfa2OsWoTCSHglsTqKzbbme+cTTWKifkfo85aU8QAVrIBBTD4
	+bnTrvYTla+5F4MdPOcT4dV3uKq2uzlXyJ7haAX3LeCEOvzZMPXgbXIqXM4mz2NtcY3gqEQD6ST
	uho0VNEs7B/KXmUjPIbQt0ftCih5Ny5wBW2P5guupCQCcthn/VenlG6oIvM3++qsCxJ+9c9QhvH
	v29jiKrin6gxG61zpeZ8H2rK7+uXFFB62Eg9qw4AVsbaC4gCkhSqkN7K/90z8XJbvAi2B7CxmZA
	5+X0OI98tCUdc84t7U75D5ifVw/MozzpcWQF6UvpjP7JUFKgF5YruT81Nr9PZVV7eG/iHRuO4yK
	swaQ4RQbybayxM6DEZNkHJ43vi/lHEqCrX/fmlGshcURTX4lZU/I=
X-Received: by 2002:a05:6102:5cc1:b0:602:813c:1b24 with SMTP id ada2fe7eead31-605a4d35185mr1252613137.7.1775221509686;
        Fri, 03 Apr 2026 06:05:09 -0700 (PDT)
X-Received: by 2002:a05:6102:5cc1:b0:602:813c:1b24 with SMTP id ada2fe7eead31-605a4d35185mr1252551137.7.1775221509125;
        Fri, 03 Apr 2026 06:05:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:129d:59e8:f7c9:47ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899e491afsm18712055e9.17.2026.04.03.06.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:05:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 15:04:55 +0200
Subject: [PATCH v2] Documentation: gpio: update the preferred method for
 using software node lookup
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-doc-gpio-swnodes-v2-1-c705f5897b80@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPa6z2kC/32NTQ6CMBCFr0JmbQltlVBX3sOwgP7AJMJgR1FDe
 ncrB3Dzku8l73sbsI/oGc7FBtGvyEhzBnUowI7dPHiBLjOoStWV1lI4smJYkAS/ZnKeRbDauXA
 yfeMs5NkSfcD3rry2mUfkB8XP/rDKX/tHtkohhQ7N0aq6Mcb0F2Iu78/uZmmayhzQppS+f2QYX
 7cAAAA=
X-Change-ID: 20260331-doc-gpio-swnodes-fc3ddf59b8dc
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7564;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=UI0xjgQJRvAoa59/OcrNBMSxM4PXDer91jntNEu7BgE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpz7r+0nNvSKseR5LPXVC3YVpQBmBpVV5rZuqgI
 Zo6FkrMuLCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac+6/gAKCRAFnS7L/zaE
 w/y3EACaUFBplHvkdlLuWxQQEuRJPLQQJtYokvcsnLcpPAW9rTd83B1N8zvYAy6Ge0Qmjkr+Bkn
 4qE92WreU3dtJvQCBHpk+B+GgHrqCOdqEQtJzh6imbwSnQOkvNGlWmtpmnd5BJOQiXq2dJUdAkK
 ZcSh8mZ7K/iOvt3oBvhZUhDJlvE5P2eNs/OrBw6ktODR18t1L8b7uG/i4Jge/IJxEuaUZ6MJToF
 epYE4iOBRsRi29crVT6BLE7H/4Y8+/WCYFisSgQkiZL8Hjo0KqRdHFc0PZrRSOyyuwWJeyOL3xc
 VQ6N2c06mqN+jFnaZzo/7EEmlbau0szidOjse8wkteszva7hUJSk/wqqh81Es6Zjv3acAc5OJDR
 w9lMG8/S/dIQorMaFk/yU6jnywKgNDN2qLOI1mvupaZZzgUoRbKOAIXfTHdlkSzWsnDVF5JD0vY
 fJPyivTbCc5fLD7b+OnpbnV5FwweOhrN/VVioxDeK5dFDsniYUCk875OWmAgqyg0g++dGiXIaml
 Mfs9b9P8gfbDJXDB8iZXKyfELH2KE5Flbo/5HlUiqQ3Pz/2W06s2xp5N1A8Q1ws5CLTIrZQDFW7
 f7oFVUnnrg+8jS4UwYygSQLyGTv0xqu8s1Tf7tdJ1gy6GeUGNCisOXaCiAV5U1/+iZ9ZB2TEP1B
 iq+7MXtTdvp7UVQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDExNiBTYWx0ZWRfX7tS6XwW/9U1n
 t4C4wJCa78lpxTJEXADAsdj4H++d/BskkUeP0Sb09J1now7fUi7HNYIMtaEJB8Sj+JoljLuQlYc
 mRwjiP+8yJbSyq0L6cjBfEu7nkNTvBptyIBtnxAm4L7H0Cy0peArLtY/K4rB215VE54YgLRPuzN
 MFJqLo0czY+rBT3V/zgZv9+tdKO8lItD0j2KzhrweEABTuzgZQ8/HJUHCbcktr2l7SIf9Tiz+EX
 ppgVnj/hbEQgWaPk7UC5cr3P6dnWXfff0mzGZXSgzsHKcKbJfCdxFinlajan8BF+VCwqv9jkoOn
 dcjEXLMzRliVnBm7FukH1xHCUHMqSzFEq0+XNCGc362MKH5gAWj2lSpb5TGoO3aZCvb4WGupAmY
 atqyesN5YkQdoMGAT2G65yc9lhMKU77kEwva8ZGAJ//RnCJTMbyB5bOkVjlB7zj99O3qZIIZDJy
 4n00ac5ATC8QVvk1Brg==
X-Proofpoint-GUID: VHTPDoepR43IkJ02-6-9-tjkTsq79hvl
X-Proofpoint-ORIG-GUID: VHTPDoepR43IkJ02-6-9-tjkTsq79hvl
X-Authority-Analysis: v=2.4 cv=Acu83nXG c=1 sm=1 tr=0 ts=69cfbb06 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=VHV1bxSRZQlKidfD:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=jsnql4ADa7X_hVeABskA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030116
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-34639-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,msgid.link:url,pdev_info.name:url,pdev_info.id:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 99A95394527
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In its current version, the manual for converting of board files from
using GPIO lookup tables to software nodes recommends leaving the
software nodes representing GPIO controllers as "free-floating", not
attached objects and relying on the matching of their names against the
GPIO controller's name. This is an abuse of the software node API and
makes it impossible to create fw_devlinks between GPIO suppliers and
consumers in this case. We want to remove this behavior from GPIOLIB and
to this end, work on converting all existing drivers to using "attached"
software nodes.

Except for a few corner-cases where board files define consumers
depending on GPIO controllers described in firmware - where we need to
reference a real firmware node from a software node - which requires a
more complex approach, most board files can easily be converted to using
propert firmware node lookup.

Update the documentation to recommend attaching the GPIO chip's software
nodes to the actual platform devices and show how to do it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Use the new .swnode field of struct platform_device_info in examples
- Fix whitespaces
- Link to v1: https://patch.msgid.link/20260331-doc-gpio-swnodes-v1-1-3f84c268999b@oss.qualcomm.com
---
 Documentation/driver-api/gpio/board.rst         | 20 +++++++++++---
 Documentation/driver-api/gpio/legacy-boards.rst | 36 ++++++++++++++++++-------
 2 files changed, 44 insertions(+), 12 deletions(-)

diff --git a/Documentation/driver-api/gpio/board.rst b/Documentation/driver-api/gpio/board.rst
index 0993cac891fb5e4887a1aee6deae273197c6aae1..b306c21481d7c191201d81d228a290a908cc82ab 100644
--- a/Documentation/driver-api/gpio/board.rst
+++ b/Documentation/driver-api/gpio/board.rst
@@ -108,9 +108,8 @@ macro, which ties a software node representing the GPIO controller with
 consumer device. It allows consumers to use regular gpiolib APIs, such as
 gpiod_get(), gpiod_get_optional().
 
-The software node representing a GPIO controller need not be attached to the
-GPIO controller device. The only requirement is that the node must be
-registered and its name must match the GPIO controller's label.
+The software node representing a GPIO controller must be attached to the
+GPIO controller device - either as the primary or the secondary firmware node.
 
 For example, here is how to describe a single GPIO-connected LED. This is an
 alternative to using platform_data on legacy systems.
@@ -153,6 +152,21 @@ alternative to using platform_data on legacy systems.
 	};
 	software_node_register_node_group(swnodes);
 
+	/*
+	 * 5. Attach the GPIO controller's software node to the device and
+	 *    register it.
+	 */
+	 static void gpio_foo_register(void)
+	 {
+		struct platform_device_info pdev_info = {
+			.name = "gpio-foo",
+			.id = PLATFORM_DEVID_NONE,
+			.swnode = &gpio_controller_node
+		};
+
+		platform_device_register_full(&pdev_info);
+	 }
+
 	// Then register a platform_device for "leds-gpio" and associate
 	// it with &led_device_swnode via .fwnode.
 
diff --git a/Documentation/driver-api/gpio/legacy-boards.rst b/Documentation/driver-api/gpio/legacy-boards.rst
index 46e3a26dba772e5e5117866b5d202e76c8e2adf2..a9d33bcbb176b5df99838bd03e43ec2ebf4d9db6 100644
--- a/Documentation/driver-api/gpio/legacy-boards.rst
+++ b/Documentation/driver-api/gpio/legacy-boards.rst
@@ -36,12 +36,10 @@ Requirements for GPIO Properties
 When using software nodes to describe GPIO connections, the following
 requirements must be met for the GPIO core to correctly resolve the reference:
 
-1.  **The GPIO controller's software node "name" must match the controller's
-    "label".** The gpiolib core uses this name to find the corresponding
-    struct gpio_chip at runtime.
-    This software node has to be registered, but need not be attached to the
-    device representing the GPIO controller that is providing the GPIO in
-    question. It may be left as a "free floating" node.
+1.  **The GPIO controller's software node must be registered and attached to
+    the controller's ``struct device`` either as its primary or secondary
+    firmware node.** The gpiolib core uses the address of the firmware node to
+    find the corresponding ``struct gpio_chip`` at runtime.
 
 2.  **The GPIO property must be a reference.** The ``PROPERTY_ENTRY_GPIO()``
     macro handles this as it is an alias for ``PROPERTY_ENTRY_REF()``.
@@ -121,13 +119,21 @@ A typical legacy board file might look like this:
   /* Device registration */
   static int __init myboard_init(void)
   {
+  	struct platform_device_info pdev_info = {
+  		.name = MYBOARD_GPIO_CONTROLLER,
+  		.id = PLATFORM_DEVID_NONE,
+  		.swnode = &gpio_controller_node
+  	};
+
   	gpiod_add_lookup_table(&myboard_leds_gpios);
   	gpiod_add_lookup_table(&myboard_buttons_gpios);
 
+  	platform_device_register_full(&pdev_info);
   	platform_device_register_data(NULL, "leds-gpio", -1,
   				      &myboard_leds_pdata, sizeof(myboard_leds_pdata));
   	platform_device_register_data(NULL, "gpio-keys", -1,
-  				      &myboard_buttons_pdata, sizeof(myboard_buttons_pdata));
+  				      &myboard_buttons_pdata,
+  				      sizeof(myboard_buttons_pdata));
 
   	return 0;
   }
@@ -141,8 +147,7 @@ Step 1: Define the GPIO Controller Node
 ***************************************
 
 First, define a software node that represents the GPIO controller that the
-LEDs and buttons are connected to. The ``name`` of this node must match the
-name of the driver for the GPIO controller (e.g., "gpio-foo").
+LEDs and buttons are connected to. The ``name`` of this node is optional.
 
 .. code-block:: c
 
@@ -257,6 +262,16 @@ software nodes using the ``fwnode`` field in struct platform_device_info.
   	if (error)
   		return error;
 
+  	memset(&pdev_info, 0, sizeof(pdev_info));
+  	pdev_info.name = MYBOARD_GPIO_CONTROLLER;
+  	pdev_info.id = PLATFORM_DEVID_NONE;
+  	pdev_info.swnode = &myboard_gpio_controller_node;
+  	gpio_pdev = platform_device_register_full(&pdev_info);
+  	if (IS_ERR(gpio_pdev)) {
+  		error = PTR_ERR(gpio_pdev);
+  		goto err_unregister_nodes;
+  	}
+
   	memset(&pdev_info, 0, sizeof(pdev_info));
   	pdev_info.name = "leds-gpio";
   	pdev_info.id = PLATFORM_DEVID_NONE;
@@ -264,6 +279,7 @@ software nodes using the ``fwnode`` field in struct platform_device_info.
   	leds_pdev = platform_device_register_full(&pdev_info);
   	if (IS_ERR(leds_pdev)) {
   		error = PTR_ERR(leds_pdev);
+  		platform_device_unregister(gpio_pdev);
   		goto err_unregister_nodes;
   	}
 
@@ -274,6 +290,7 @@ software nodes using the ``fwnode`` field in struct platform_device_info.
   	keys_pdev = platform_device_register_full(&pdev_info);
   	if (IS_ERR(keys_pdev)) {
   		error = PTR_ERR(keys_pdev);
+  		platform_device_unregister(gpio_pdev);
   		platform_device_unregister(leds_pdev);
   		goto err_unregister_nodes;
   	}
@@ -289,6 +306,7 @@ software nodes using the ``fwnode`` field in struct platform_device_info.
   {
   	platform_device_unregister(keys_pdev);
   	platform_device_unregister(leds_pdev);
+  	platform_device_unregister(gpio_pdev);
   	software_node_unregister_node_group(myboard_swnodes);
   }
 

---
base-commit: cc13002a9f984d37906e9476f3e532a8cdd126f5
change-id: 20260331-doc-gpio-swnodes-fc3ddf59b8dc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


