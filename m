Return-Path: <linux-gpio+bounces-34654-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iE+bI5n6z2nM2AYAu9opvQ
	(envelope-from <linux-gpio+bounces-34654-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 19:36:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 099303970C9
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 19:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FAA23099F54
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Apr 2026 17:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EE603D413A;
	Fri,  3 Apr 2026 17:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aZEfTlaj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gEnyTl98"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78FE2192F4
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 17:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775237641; cv=none; b=mpfUs8Pe+zxPjdhhlvru+4f5DoWoOrszzhuK4qXpjJUo0VcQOTtl7QjRBLHkJU5oFhGcaOh3kQBXAF4+8kvcWfTX1GyzfXkZHuyJXpjQpwnYpoa5pRcdz8fX/Y6rh/tdktY3ZZvXh6QX0YKp2bnXmiMuKRtvRSwRFjW/yUsQqgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775237641; c=relaxed/simple;
	bh=4QSi4U79nO6Kuv75iJWSSw33Z4grlzD3UTlYLg1qQkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MeievM1cCoAe+1PRGCXndNv3kJRHh4IMp7tJUovkJAy0seTqhjvAlp6CDCL431w0SZpBiYimJ2yhpFN2eqEF6rD11lN4vUcyouICbemKllMdKbqo6cIDw3Jc2nWtaoz04ZNXVSfFhg9cM2+EVyP8DalhC0zrjBYuW7bwtW3Dys4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aZEfTlaj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gEnyTl98; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633AxPEX3803870
	for <linux-gpio@vger.kernel.org>; Fri, 3 Apr 2026 17:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t6NWwp7xMQI5NgRMH63RnyN3vLoPe8JewDZUaKKorxg=; b=aZEfTlaj1hsn+O3u
	8NFaxgxBssSSIgfmJGXdkmcSIP1+0WYi6Hi3fL0KK5W1FKpdXtnbc3KIAPaueurW
	HcbQys6NSgfYA7VSBSLS5qb90tfIiNbnJW5eBeLZYD7ZU5LZo+/ytXIAZZC24ZlV
	PDLPQlw5WLq7zjy2ZBitWZzQE4DTCQV1+MogRJRgsR1S2vMH+ycjDgqh5Sh2OlMa
	vH3btz4KuBwSb701RJitz66s+EyyGbWimjJ4Fu9YQU44sFUFYHVP1lTfIgOiVefg
	zOZzlAkA2jQi/yAU9BXflXTHSmNqNuC/qLzitcKGPl5K7ZmTmF1KiaQJhrZEG7la
	ESju+Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dac9f92fd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 17:33:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c1e1a6cfbso1392674b3a.0
        for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 10:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775237638; x=1775842438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6NWwp7xMQI5NgRMH63RnyN3vLoPe8JewDZUaKKorxg=;
        b=gEnyTl98ScjVTXoPMln7o5DU28DSHB2OCjUeogAcL2/MbJzH/zFd05UDYOHTbB31ZM
         nL1ZrYy4V7mr+p2uKWWCw6nFXhLGQQX/T/GYmC7RhhT9iT9pDJrYVAEby8Csnjukn+oN
         Qi53hbo7lj2UgZkZLbs/Y2AVufh4zP3ACd2loujcBPBeIRuvRDw2UTP/YHoxJzbhTn3M
         +9IoAyDG1zmSXjDSidUT4nGT69WE4M/RRRy/Crsc2+ONVtRQTQsoLpJLbJMZvWTI21MW
         q0TQ4gzb3TISVW5sQsltz2RzrW3VzuNObtvvoi3MMq/kxCe+Im/rT0pAvI/vEDh3ewBe
         47KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775237638; x=1775842438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t6NWwp7xMQI5NgRMH63RnyN3vLoPe8JewDZUaKKorxg=;
        b=ZfujqrVWqs4gzUG2aS2+YMFX+kMIdZUJ7wXBeHBulu1kFVoWPZSKS2dyCuxQqXAvXt
         nPzXMa6t0zptru6gnmTKkQ8uXMgaNTSvpLDsPst0j0Na5WJEJo8PO3rkw4+WsbIMUC9k
         49ZvBEbQPEOFgRoDroGC1XUH2NCtiVpTF/jJFCYISMnb0ncAGAKy7BXfsk3L0tUe4NLc
         BvcGPHML+ey4Zc9qJq9bivCTdLSxqB1w5d8Yn9Na/KiCKOuX44wRr4CI86AgWb5Xjv5a
         uSBGeWajJxrhtaySxmZx2erdz7brTCVugJv1Trd7MnvPePrrt1liLF/viEujINVxWaZ0
         l9bA==
X-Forwarded-Encrypted: i=1; AJvYcCUju5usSTDux6/ECSk7jRl5S43ZT/kjq33B8eJrNxhr5LnVbCV9+NDux1agYQvDUK/3DVzZyb2CnXNc@vger.kernel.org
X-Gm-Message-State: AOJu0YynFGRkvLZmYIWQ4Adjj8wz080hMCdHKdhVWOt+qDgC3tiHRsPf
	/2tBSSrRku+tXHF27S3f2MclzWI+WnS6D6wgfLQQS+ytLkWlQsSnqX4bD+CzBlXvAJnDdN44rhB
	fwB8M+dKBykXvBk+EvKAG3kLs+dPnsCcZL1Cg6hCqX3Ll304Oz2ktRE8Ii88DePFIca6AID3J
X-Gm-Gg: ATEYQzximJz5cNOGg25NBxa24utZr9UGe0IYqBgrIkd1ctStsel2lRXBT6XU+yuSltr
	o08EM6UeR2MQC6pXKCEqYZF0ho6MWljuF10iisOhY9nzjtF+CvJTXeSCE7I+jC1+1SfNpN8a/DM
	6E8ugamWZFk8gwCieGh09VhlVVnjw6djBWxw2Kd8fPOB9Orp3bUUkDoKR6QGK6P3h9wVDKVyJ30
	vke8eYZWTXzu1csVMQOMAmip8QPwYWNCFPnKpgXWlBf3YENvAxicQgL2BsfM0kQmFje/T2t02i9
	znpPd7Je4K3YOdoPm9IrG/MdjJzgmKniSHiVRLHpI0SvGnsXJrIo1EJZtDtIoQnZfu9uqlbmBcb
	Q2X9BXsX615SLZu0lDbXDtDdfVJ+BOLwQgu8Qn2x0CyJEwu7f1BtBYppI
X-Received: by 2002:a05:6a00:3d4f:b0:82c:dc9c:e765 with SMTP id d2e1a72fcca58-82d0d749427mr3930134b3a.0.1775237638435;
        Fri, 03 Apr 2026 10:33:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d4f:b0:82c:dc9c:e765 with SMTP id d2e1a72fcca58-82d0d749427mr3930115b3a.0.1775237637915;
        Fri, 03 Apr 2026 10:33:57 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3e169sm6359125b3a.18.2026.04.03.10.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 10:33:57 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 23:03:34 +0530
Subject: [PATCH v9 2/3] gpio: Add fwnode_gpiod_get() helper
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-wakeirq_support-v9-2-1cbecf3b58d7@oss.qualcomm.com>
References: <20260403-wakeirq_support-v9-0-1cbecf3b58d7@oss.qualcomm.com>
In-Reply-To: <20260403-wakeirq_support-v9-0-1cbecf3b58d7@oss.qualcomm.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775237619; l=1418;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=4QSi4U79nO6Kuv75iJWSSw33Z4grlzD3UTlYLg1qQkk=;
 b=S3BBZnE3MjxvBLw9tw9ecCrgVVwynC/kNl/NBJTEmrlZVZtP/c6mx9OmMyhsxVYd5XSpcq4h8
 ahd7a5OtAF8CGyTIaMGUzdN/cOHXYeBoxs6bvGKrSadbndkpQ7xGY2r
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: QiaAzvn7YgcvYtsMqSM_FtI5Yqf9sLLb
X-Proofpoint-ORIG-GUID: QiaAzvn7YgcvYtsMqSM_FtI5Yqf9sLLb
X-Authority-Analysis: v=2.4 cv=BO++bVQG c=1 sm=1 tr=0 ts=69cffa07 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ocqi7cVID08-S0eeb-IA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE1NiBTYWx0ZWRfXy1qb6qyx3cuw
 vwEI6JJm05MaHNZLkfVzkgch2kPC7c4yuQdkgjtlYhvUvHJDApHsTJltTIGh39YS11PsNFJkh/N
 rcowCSxvxCm5NIdV8F405GtUHAmygLqFhOB06Kgz3Dy3YtHqRkl2wE2eIOj9smOOgRMtTqpvtre
 r91dLtWxml8Es4LobeJhzCoIUsxfvE0gbrvCpOXh4cnnyehWgEOEuaqb0+ErM8lOYtQPEZtDMkZ
 Kty+rYhpfyGu8UTZ8f7goHggNpvjIUe0KMVlWIlZGep6vjtRpuh3pLbs7SUL7MBjkMG+gix//SV
 6BOd324vjmnmsRLDFB8pixMc7ibTIijZ3gHjxQqDCZkwSc16g7MuN+ACmNCMzomlpn2hgKEU2cI
 /d84plp1KGkAOlzuUIgRogMlgTIy2W3rMNiZhBqdKUgh7Y5zLEF3cS8ud1+Chf37p0blheaLoJ9
 CzPs4+EpJL9VC3os1ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030156
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-34654-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 099303970C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 0d8408582918680bfea6a04ccedfc0c75211907a..fee926c0262ce9dc4b9a3c151e74f2cf37470a49 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -596,6 +596,15 @@ static inline int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc,
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


