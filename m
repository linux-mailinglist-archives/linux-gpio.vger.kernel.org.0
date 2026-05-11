Return-Path: <linux-gpio+bounces-36509-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UISWCLWFAWpOcQEAu9opvQ
	(envelope-from <linux-gpio+bounces-36509-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 09:31:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7FE5093B9
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 09:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51818305848B
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 07:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76581382389;
	Mon, 11 May 2026 07:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lgJTcxmJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TlaJjqrp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0572B3815CF
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 07:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778484373; cv=none; b=tIyYWNTNfOaCWkmTem4Md2f8GUl7r5Bz1FI9TM1898Sgb0XybHHdttjg8TQzXv9e1a/sHrafTI+bmOPYePXV65DyV91SNh6pXUL7ZQpV48lQamPI6dUyT5r50xSS8es/pI5YysT8/DelFF1Zph7O+v9D4gpI5nRw6n1XN5CM2Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778484373; c=relaxed/simple;
	bh=OIVso6kWZkQJvNF2O9NjSG2Jaux2+AUyYMRQLCpdO1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qavz3TfXCxz6u/TcqfiNZKBn9YEnjm6/+JVSYTHg5/ovIXpnY+FDtQsZ/uAkbT9qnI8AMFwyzpRjku2V+MtNqAYTzn5jZQnCvvL8e6tvNQr9YK0us8nFOZzHZHnSsFP3xqPRpMQipCEeZdThuEEmpAAzWkWVezvzg6eTahx4g/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lgJTcxmJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TlaJjqrp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B4G5AZ017313
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 07:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RbGeYYCf8ht1gPlSjGhj9XPsZSDF8WslhB2HrHZ0+ZM=; b=lgJTcxmJIuGsF2hb
	LBA2KhTMxmWZelTXNMdlAYNaGW+n8Z7vAQp0RfLwbp36a9hFyb/X/JEG5pvFk/oA
	TluSleToCOiqDhaQuIVATdQ2C1DEwC21WPV9N/5jsQbcF1exXr+aykLPK3k6OnD0
	+QcaP/9M/5RYe45DSlc66pddDI7AgSOquf0oNAuprCAkGaHibdYpsJeSRCtBSlsd
	lEHnLf7kxaV5lrC3YMhxEJM7beyetCpRNbWriMyEv6G1jSfqdpvIVST5w1stQ++9
	cIiYsOatwMD/FeCpsAuV1rZ0UNpVJr4UFldSzKANmHNPTVloE5C3f/OgYSk7P1nH
	rNq3Cw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xfrkaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 07:26:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354c44bf176so4880009a91.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 00:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778484370; x=1779089170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RbGeYYCf8ht1gPlSjGhj9XPsZSDF8WslhB2HrHZ0+ZM=;
        b=TlaJjqrpsY9MGnZsIdxxHIJaAdjW/0hfoiNSx5RKItjtjl9lI/975MCNtWBOYr5/h9
         Mn5tH6+tdgBWcGtG8sIy78jqmY5ityc5IliB013xBAY7PvZX3xZhPYC3wjkFmw6IMtTq
         V0BWHcFGdpsepnEukxqALATlJK86DX3Arh6IdDl9CWAINezGQmkYztZBHQuSoa18VNcU
         cVPEsb3IkiWbfnoDyH3AHtFhS1v4dMFgQTJyJshxxlmnbA8DpnuFnpjICGKJpgCW/Uuu
         EOVRBMrMNEgNiVu170XOuEGDn62TVuCXwwOioTLo8rRXSpBz952HFyH8DbH+ZwMzEP3X
         uxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778484370; x=1779089170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RbGeYYCf8ht1gPlSjGhj9XPsZSDF8WslhB2HrHZ0+ZM=;
        b=pkT96qBYd2yAYyl6d9pRJLA/edoCsjVfYE1g1P6ljbGGd7+Mi2g9luZvDrpZ9Cx49Q
         9xZSNwiFZC83czttzdWtw5LnsAQRuB4eMY/+caJWGr7M8wbCwaZn7XOkyHtDba40I872
         rXxhjlCKQoEX03uDeTL/T2cT+5xg9VqqX576u4eJWZTHjiul4VYDJId5l7G1VvmLAoVr
         gt+kAdt1i0+5rFbwbqZ5RtITHn68peugUcvqVA7LbyPkg5ZmzIIenyT93yybpkiDt/Fe
         ZAYFjdtJ6+7wIZqH1jFWW5gNtD9FBXuILQG7KWlHXefSiSP6+G0HHay16iVbi+KUfKv2
         IvPw==
X-Forwarded-Encrypted: i=1; AFNElJ9Hs2XTtjTkbrEoyeFOm5M3I5h9zD+pOSBxSHU39wFlu2DvFacvH/Re+ymLtlDngm1c1rGPUI/EYfp9@vger.kernel.org
X-Gm-Message-State: AOJu0YzRCZAZI2A0KTMMFMJk5hOoUhDfN8aGpxm8p0Y8wMBqP7yUyl8j
	imyEFVWhD+1PjqyjzgQbGjLcozC5nMFhZu+cxhCDLSz76eDS1kyZB46zn5/2h0f0SmRTQWyiU8W
	SUpdETKzI6P5JJaocOD/Pw1dpFD3UctG/kJ60RB3ZHiRb+xdnzITm18Wi8EjRX74E
X-Gm-Gg: Acq92OFzop4osoH2tl4RIfzo1H5ygHBD3dS/1zJowIhYo5ImD8NAn0oE3P98aGWaEST
	NJslFbSArbFFngCXqWiY7GjBZHSKIAa03DpJuR0uuJLaSST4E1N0M2HzqujEnTLGwsDifay6elB
	1o58cDc7EYEd4mERSH8UYNzNwYSS6gqn3F3hGnQZZGuPCjzfAMgLoywGTCdXyLW9tUvEORQkfp1
	E29BEmjhp2C/cVSTswyaZB1MOIkd3gqAYiOtjuYuaHe8Qcv9w1V/cyU48Dr7LW4KGhIr8jfvpc9
	FhpU07C2TDhh3iWl4s6lQhSqXne+iYU/F6WzkVktidGBG7TKDWvPahPjpu6V/PieUPlXCbs6lLD
	7+YkWilkb2Dxvcy1OmR53AVj/IzUUmo68zkdVA6gDBRrbcnw/9CVFUiLvpJu28yu7vZc=
X-Received: by 2002:a17:90b:578d:b0:359:f77f:8cff with SMTP id 98e67ed59e1d1-365ac47b367mr22785794a91.19.1778484369664;
        Mon, 11 May 2026 00:26:09 -0700 (PDT)
X-Received: by 2002:a17:90b:578d:b0:359:f77f:8cff with SMTP id 98e67ed59e1d1-365ac47b367mr22785751a91.19.1778484369189;
        Mon, 11 May 2026 00:26:09 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367beac2c7dsm3314306a91.5.2026.05.11.00.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:26:08 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 11 May 2026 12:55:37 +0530
Subject: [PATCH v10 1/2] gpio: Add fwnode_gpiod_get() helper
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-wakeirq_support-v10-1-c10af9c9eb8c@oss.qualcomm.com>
References: <20260511-wakeirq_support-v10-0-c10af9c9eb8c@oss.qualcomm.com>
In-Reply-To: <20260511-wakeirq_support-v10-0-c10af9c9eb8c@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        quic_vbadigan@quicinc.com, sherry.sun@nxp.com,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778484355; l=1362;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=OIVso6kWZkQJvNF2O9NjSG2Jaux2+AUyYMRQLCpdO1Y=;
 b=XFdAtRZMzFR+THosoBwQeZxYToTdCzQYhelBf3Jq0YIvKT+wMt7DAzEXogwgPnpVglW06nLiI
 VpNcQwOF8/gC1RFuTGFgDi0TBkBMjhT1VHRnR23XzEeqyXL5aBfnQ0B
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=TqXWQjXh c=1 sm=1 tr=0 ts=6a018492 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ocqi7cVID08-S0eeb-IA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Fk6mOx-FvR4qbBhoy7iDyPLcOgvlU5JR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA4MSBTYWx0ZWRfXzZTU1T4bJ//p
 8cNV/4w2cLBTJWMKlxXqycieoWN9hE9gfLqSygpotUGi/n08rAr6KZAd3Y/0tmY+IBoKlCsrleA
 eEt4xFwtn7BFnJXSEUqsv1FKDYDLKymR1D1aVgCYheRVGhqYgK2LBBFQ3esM7XcsU8u8r+3bEn1
 wnA3de40p2gUzckO0ftsm34cxuU8rnIxEGhL0AA/1MeuofNZ39qIP+CNyvVMJ/gamqM6R4A2hJn
 fM2sBjTtG14ceMxwu9v1YJ70D0THyGEEQ6BLVep4PLcjgaJ75MOiSMWDpZxuBefNXet/gwWDQUl
 tvzLv3Mjn9XXAuFS6Jg1xzkad91eDCVBJgo1ldaIMrrrRf+16tZjeyQQcW4pCxO4wzf6dBWt+hy
 w46WXPvAXCOeMFwH3lpxMH6dCiEfBtOOP9WJRcd2GyTeHFdU+rSrIGAH5JSJQXP2mHtDM6KJonF
 3M7IQYO4oc/a27RYN7g==
X-Proofpoint-ORIG-GUID: Fk6mOx-FvR4qbBhoy7iDyPLcOgvlU5JR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110081
X-Rspamd-Queue-Id: 8B7FE5093B9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-36509-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add fwnode_gpiod_get() as a convenience wrapper around
fwnode_gpiod_get_index() for the common case where only the
first GPIO is required.

This mirrors existing gpiod_get() and devm_gpiod_get() helpers
and avoids open-coding index 0 at call sites.

Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 include/linux/gpio/consumer.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 3efb5cb1e1d1..e2601217a71d 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -598,6 +598,15 @@ static inline int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc,
 }
 #endif /* CONFIG_GPIOLIB && CONFIG_HTE */
 
+static inline
+struct gpio_desc *fwnode_gpiod_get(struct fwnode_handle *fwnode,
+				   const char *con_id,
+				   enum gpiod_flags flags,
+				   const char *label)
+{
+	return fwnode_gpiod_get_index(fwnode, con_id, 0, flags, label);
+}
+
 static inline
 struct gpio_desc *devm_fwnode_gpiod_get(struct device *dev,
 					struct fwnode_handle *fwnode,

-- 
2.34.1


