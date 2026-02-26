Return-Path: <linux-gpio+bounces-32208-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNoRCWMaoGmzfgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32208-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 11:03:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9771A3E79
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 11:03:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F0A3303A872
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 09:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989CA3A1A2F;
	Thu, 26 Feb 2026 09:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQOHqq+H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fg7u/eB1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA35639E6DF
	for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 09:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772099809; cv=none; b=t0NmbWtUuhlq7UJVX1OJWhXoD+6A5cORQKRMR/X4MZkCtRaR9ntbm9+mYJGQkM1BBMIfBWIqwwG42Et1148l1NiW5pDFJjqjdx1er2lUolWOaDja1eT3E7o+NI7ZnPvbuVK4K7ibQ/I2BBx5x344wRagTAyWcLdB/9SnnNFY2V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772099809; c=relaxed/simple;
	bh=kItaKAqyxjdvGZtBXO3UKNJA2wkkDFA5lJJiBNSJYJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=H7carcmY95OHWHQBCVzlqSYyQG5Vv6b1g4QqEhTUwL7YlWSzwzn1PbR54AVPNte+Sxvubt41el6bFuSSXr86k3+z59BSIhtETFLZsmywkMfKucliXx/LELSN4rpQVIxGuPkFQlrPLs+bEfvWg3mDqp9pdnFGnuSZN+OOZglqww8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQOHqq+H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fg7u/eB1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4V74G2996693
	for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 09:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=B/JzSCAM22A18oBaej0zWP
	9dP40bO9wNTPlDvXSSlGw=; b=AQOHqq+Hm8bZ6Xlpyyxj9IACVBM4R2qLUWDl6l
	o/1yd6D+ZsHNdRWdvjgEtWYkz1nqEBrorNQ0LL2aKQkEQJW/SB/5gKmwK7+mlc5t
	ESgycFiaFZ906lauHCmn0YFL15guTpMFfHvyuEbqlF+R+0NccFX25K6xFXYxtIdJ
	JysS6HeoiW8pNLtOuEsE+53m1zIv2Mb+OhhdopNwEIj0WJpTvEGuxIf3MswWVaR5
	JEDLLJ4gKDWTI5p6k/+81cf4UEbpNNwO76oBzAiqOqIS3z6sjvVMrDygMUBHt3Yb
	mEfwn2wt+M1f/c29cv8H+y/bpK0KlhzIhik1oOQ0AbU5E8pQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chyv9ktjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 09:56:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899b98ebf47so139146066d6.2
        for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 01:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772099804; x=1772704604; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B/JzSCAM22A18oBaej0zWP9dP40bO9wNTPlDvXSSlGw=;
        b=fg7u/eB1vSjQm/pLFcF7w7Ldx8VJmkGmoOc7ZFYEbL3y3ZeYwsuUdgn5chQFVLKDTE
         nle9W+X0F5sikgFQph/tSE7cH5GrH4OElQYA8gZobWhm7sy0HmjrW6/dv8uJwHXU8bRC
         qPz7vEDwYjyUJH+JSPss7f2S6un1LXzGdNvKKz0wlZS+EP7GvH8kJis1eFtdmzcgNmAv
         jWL88PcSCzstBxS7eCHbnSpnIvHxSxIU1aTtnMSdfgIhZAwASO33WFgeAnFWODFIMFxb
         VVvUWFiJnXS5oNMdPM+6E19/cP5QmRQ9eqgg/AGEPSCgZvOtw91DwznFo+qXBmC++csn
         Sf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772099804; x=1772704604;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/JzSCAM22A18oBaej0zWP9dP40bO9wNTPlDvXSSlGw=;
        b=RhkvAcVd02li2tjjOkneIG0T6Wqa4AvFo840ZVLSmLk7mvuDwNu3IT4LXbRYEAj745
         C3ZXsnC1Qw+qfBtYmamETT8nDBzk4lcwuRhPci0tFJ+gsMlF3ioy/VBOG8oURHADGury
         7zxB6vuiXzDi4vpYTgmGFINrc6j1g259X3Lr4jRX3BWpVZLalAbg14yDXzuzt8IKN4Gs
         +JaKt4v0d42F59xBKcd/ii393UwoXLBS/WwqwdAdwyS7DeHVIACS1tufi0mH7ux28aBB
         7WrvpV6WhWJRRAOfe8fuf7MLjuhmkCwIGIkiWqWQdKgRwiRQm0yHOgKR7T3Ee0S6iu/E
         OpCw==
X-Forwarded-Encrypted: i=1; AJvYcCXS+n7ek5fAhsrkLRFQjLUucolAvD2MZng+Ap6Uuf5oZOJFEhOmRi0n0Dwexp0ZEXrr89aGB0CyQDYe@vger.kernel.org
X-Gm-Message-State: AOJu0YyawDZ0bDuG9uew9w+43oXRWaff/Yqzh9lgJnkwaZqvCABE//Y5
	Hiytpd7cd2yy8DM3bqjzBeoRNKst3eekGF8QdJInIW0MADCUl/8nn56N74D76TAzicVzuWyJjsp
	OiGfUvHPOEmryr6opiEei4kkqTrNTyXmGbEPLyuTZKq4Io6KvXt3RZhy+x2uDPJqC
X-Gm-Gg: ATEYQzxHtjybRpGUR0OWENkTNbCE3xXmoBAUcnZCO7BOD4rpWV73eAlco4DXcCHJqdr
	pTURXiOsSPpVHJ8nvTMBRDNC1hs+I8rGmZRruSbsAqoBZMHI/XnVeR3TtZ4Xau37adGzx9llit4
	/ImVOQhArLxf7kYUNxSv+d5/WkRjrJz+24bnRi4fTySVL1lJqBqyt1kRW9EWBZ5zcSnq5fa5MgZ
	lzEbC0p6odVyDtFGbDY3g4wBL89fy7wIT2OiHEo7Fu3vj63MkC6WIdyn7/keYHt21s4IeGTiuuz
	W+0GjP1StoKEKaYir/7JWrYeLAh5lbQu/y03bwRqGyIO5qK3iV3LPZDXr6lyPNeMuIYKtwE3KzZ
	k5g50/qh6yOWUOSXuyDSRpzFjpaK4PS8nQRzAs2Eh4HBkf/f2j5w=
X-Received: by 2002:a05:620a:19a1:b0:8ca:ffe3:33a3 with SMTP id af79cd13be357-8cbbcdee7a6mr464043385a.0.1772099804256;
        Thu, 26 Feb 2026 01:56:44 -0800 (PST)
X-Received: by 2002:a05:620a:19a1:b0:8ca:ffe3:33a3 with SMTP id af79cd13be357-8cbbcdee7a6mr464041185a.0.1772099803749;
        Thu, 26 Feb 2026 01:56:43 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:961d:5276:3187:97af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd75dfaasm114555355e9.12.2026.02.26.01.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 01:56:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 10:56:36 +0100
Subject: [PATCH v4] gpiolib: match secondary fwnode too in
 gpio_device_find_by_fwnode()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-device-match-secondary-fwnode-v4-1-27bd0cfbd8c6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANMYoGkC/43NTQrCMBAF4KtI1o7kv9aV9xAXcTLagG000Wopv
 bvRlQtFNwNveHxvZJlSoMxWs5El6kMOsStBz2cMG9cdCIIvmUkuLZeiBl9KSNC6CzaQCWPnXRp
 gf+uiJ9CIwipCXRGxYpwS7cP95W+2JTchX2IaXnO9eH7/lXsBHJzVtPS6MnqH65jz4nx1R4xtu
 yiHPQd6+YZK9QuVBa2tRc6xJqLdF1S9o+YXqkCAq4SR3GihjPuATtP0ACzu92d7AQAA
X-Change-ID: 20260219-device-match-secondary-fwnode-4cc163ec47ee
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Len Brown <lenb@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, brgl@kernel.org,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2534;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kItaKAqyxjdvGZtBXO3UKNJA2wkkDFA5lJJiBNSJYJg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpoBjVuYrsaIA4liDr72biMiWiwhj3FioVCfPax
 k5Fj9gLfQaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaAY1QAKCRAFnS7L/zaE
 w1aIEACC8eLH11eTqfdYIXHAIFmnXDcFGpxvziZdR8E0LModLvOxjY1VciCd5ihIlA6DHfFHTlH
 ZpiX+ZaFKOMXoWB/ks4mbt0VQ0C8G+aodw7TZe81C+k+a5NPI4rE1wWUS6RDcIrC605gRdPqKcN
 IG/xwy/DAHOGSM7h6XUXo5ZkltnrjkE+YJeTl8UWtFqG6MpVT1EPTN6VkDKSvY6OPrs6wbWhicS
 DNDAJ78+VXmvzzAaTYb2+el2C/eosZGNGbEIj1bYszAuV+il2sMoGbhJcyI7prh5nxZ7tDvrOve
 9SEtVjyP0xTtK5vHtoDEg5zHtLuc31ZFD7Qfjyo1zseeUvUp6SPuAH+tCHst3v+FLajgJyn6g0U
 rA1XcA4pT7qRy0h3aZu7uZO9MeJQ0es52O3gomVZnxTPCre+DRcjHoYXuGyh4GbOqLXlVGs2XpK
 q5gJvQOR8ZNsLTXn5Sq+SmpPQdytWIf4d7lhBFy10C9TM9P7sonjNakgSWiVqVQkmCEPjFGaGZX
 tLuCgdKT02BlCJ1JfNllnNqTRITJXJEryfj8n0U0ab3b7BbZEgvcIfZWlp2YHRiyvyY78cliGJT
 2HWMxAxrVRr+8OO62Thg85kNqLOsaILB5738KnnMatqh+L4pYjs2kpo1/LSzOFuvYFbO4z/W+Zu
 830xOemrGD7BLOQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: gwh6KguTrcC1ScvfrE3wYYuhLT2VUFqa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA4OSBTYWx0ZWRfX5y/tlM3/2NnR
 zvccOBmGQgPWf/hYx9Ke1DSnslf/HZqkJnV+kpSWXeY6dVMtYFrUzLYMjD/+JPXIfgnf7Ik8gOq
 K9gBvMw7dgqZi9jNDXlMQWdQWc1VD7e//ZVF6sZYhjptXbsFSr71NYqrtCGz1cmnZCRZ9Eoz1gU
 mkPc2W9q0QLGLuvUK9oCutUpREjbxAADeNz/dZ6vs9oRHex0DMmiXIPAg7FX7nNkPQhC+6BYrsu
 dGiZksj/0zK4P4b/YmTHjhGhdOpmnmwqw7YhxnpnjG29tRbx8XdL1YAQ1Y+7vSSChjx43YcvIM1
 Wj45YLI+AqRMepfuVuQsi7n/9RLVVu/30E+cPuxf/vOOFa/UVAUe7r87hM9d0KgURKfs7BDSoL0
 h2MCk2c7/B3FKNsOYXhYaGZ5x1STUVuUILlOsWcvfSPA8Qp6pX5P3EDO0rm8vNVnmykpOUueE/l
 bxOocE5uWB7Prbl33wA==
X-Authority-Analysis: v=2.4 cv=GZwaXAXL c=1 sm=1 tr=0 ts=69a018dd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=GosmCm27k2yXtJg_9XwA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: gwh6KguTrcC1ScvfrE3wYYuhLT2VUFqa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32208-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,msgid.link:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmail.com,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RSPAMD_EMAILBL_FAIL(0.00)[dakr.kernel.org:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB9771A3E79
X-Rspamd-Action: no action

In GPIOLIB, during fwnode lookup, after having resolved the consumer's
reference to a specific fwnode, we only match it against the primary
node of the controllers. Let's extend that to also the secondary node by
reworking gpio_chip_match_by_fwnode()

Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Link: https://lore.kernel.org/all/aZUIFiOYt6GOlDQx@google.com/
---
Changes in v4:
- Drop redundant !IS_ERR(node->secondary) check
- Link to v3: https://patch.msgid.link/20260225-device-match-secondary-fwnode-v3-1-a7152054135a@oss.qualcomm.com

Changes in v3:
- Remove the controversial patch 1/2 in favor of hand-coding its
  functionality in patch 2/2
- Link to v2: https://patch.msgid.link/20260223-device-match-secondary-fwnode-v2-0-966c00c9eeeb@oss.qualcomm.com

Changes in v2:
- Fold the code initially put into driver code into GPIOLIB as advised
  by Rafael
- Rework the logic as suggested by Andy
- To that end: make fwnode_is_primary() public
- Link to v1: https://patch.msgid.link/20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com
---
 drivers/gpio/gpiolib.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c52200eaaaff82b12f22dd1ee8459bdd8ec10d81..780e30a033859578dabe3eda984e74db200507f7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -11,6 +11,7 @@
 #include <linux/errno.h>
 #include <linux/file.h>
 #include <linux/fs.h>
+#include <linux/fwnode.h>
 #include <linux/idr.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -1395,7 +1396,16 @@ EXPORT_SYMBOL_GPL(gpio_device_find_by_label);
 
 static int gpio_chip_match_by_fwnode(struct gpio_chip *gc, const void *fwnode)
 {
-	return device_match_fwnode(&gc->gpiodev->dev, fwnode);
+	struct device *dev = &gc->gpiodev->dev;
+	struct fwnode_handle *node = dev_fwnode(dev);
+
+	if (IS_ERR(fwnode))
+		return 0;
+
+	if (device_match_fwnode(dev, fwnode))
+		return 1;
+
+	return node && node->secondary == fwnode;
 }
 
 /**

---
base-commit: 50f68cc7be0a2cbf54d8f6aaf17df32fb01acc3f
change-id: 20260219-device-match-secondary-fwnode-4cc163ec47ee

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


