Return-Path: <linux-gpio+bounces-39725-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fHcaGn9hT2pMfgIAu9opvQ
	(envelope-from <linux-gpio+bounces-39725-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 10:53:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FCA72E84B
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 10:53:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=analog.com header.s=DKIM header.b=aqiBHWFN;
	dmarc=pass (policy=quarantine) header.from=analog.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39725-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39725-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0DD29302B3B3
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 08:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 717AC3FB07F;
	Thu,  9 Jul 2026 08:50:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0643ED132;
	Thu,  9 Jul 2026 08:50:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587057; cv=none; b=T52/0gYipHU/JSUXG16sKEorcarlMOPm52aStgN6pWJfc4fR5p3QU0beOB2BdNYvxU1rCeULdPWBB+LjeqGSqnmj+qxmoNNtNN89qcBeufmMniw0VzEOYFuJLsvmXsLBqrVFlFOg1hpoAvFpRm7DpLvHVirF0PuPnaZhTs5GiL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587057; c=relaxed/simple;
	bh=LwPXNvoQE1JwDNZzh7Zqn5J8rhgL3nsUHFamEVgofDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=L9fO2Hv5C1fnaYJPunJss2hfY8P4XVbxGeJl8g+1LTg3GEiXpoJS2Y5qWD0fP8pcv2eAN4/uIy6JrVgOj6oa/2ZAUR1jVL0EE917HOK1vBeZxogtt20pGBiLpHTfs2Ak7sbKZ1A4kvTB/KgfdY8SH/JpnMLHONEQsgt+QAHcU54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=aqiBHWFN; arc=none smtp.client-ip=148.163.135.77
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6697aLvU267925;
	Thu, 9 Jul 2026 04:50:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=qArtu
	rFPsA/lOApl2xzI8Fs8FhcSlz6CVpN/dLFWmWo=; b=aqiBHWFNQMUVuuPlk4r1N
	CsBJZWsy7puYdCGoGK1g190cKZb3MBNLA5JSrmENSfyrjzOdRT9wC+q7hMkSH6Ui
	EWi95+14eZdAQGfKNnGZdS+9LAvb2njCOQrbqgoEDVcJgCbgTc2LbKtxyAGrWGNw
	hYMGT68EMVF6joA2hN8RJ0ldP3TFnL7fsyT82Bpgg6SwPBP3IywFSyrLa/VPwbhJ
	7u/O5qK/vcW296ZMy42kXe3CpvNGMgSgmcrsCu2UXSaOGAp+2RQLzXT7bDiyDn+R
	CKBBU5d8wF2q3HX8CmIB+LM4Lr9TZA+AxgfuPRB33d31RlcYkwm1I0kpxxZSIVx4
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4fa2jghra4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 04:50:45 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6698oi8f003594
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jul 2026 04:50:44 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Thu, 9 Jul
 2026 04:50:44 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 9 Jul 2026 04:50:44 -0400
Received: from HYB-e1y2fvUQ3cx.ad.analog.com (HYB-e1y2fvUQ3cx.ad.analog.com [10.44.3.70])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6698oLQw015849;
	Thu, 9 Jul 2026 04:50:37 -0400
From: Janani Sunil <janani.sunil@analog.com>
Date: Thu, 9 Jul 2026 10:50:13 +0200
Subject: [PATCH 2/6] iio: backend: Add support for CRC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260709-ad7768-driver-v1-2-44e1194fd96a@analog.com>
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
In-Reply-To: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Michael Hennerich
	<Michael.Hennerich@analog.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David
 Lechner <dlechner@baylibre.com>,
        Andy Shevchenko <andy@kernel.org>, Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux@analog.com>, <linux-iio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <jananisunil.dev@gmail.com>, Janani Sunil <janani.sunil@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783587021; l=3358;
 i=janani.sunil@analog.com; s=20260507; h=from:subject:message-id;
 bh=LwPXNvoQE1JwDNZzh7Zqn5J8rhgL3nsUHFamEVgofDM=;
 b=VuftJvzn69Xgbyo3dJ9dd6JpRtc1whE+b9fGr828Lw0KgMa2XMsjDfoR1Uky7T2ufDnfVDDDp
 J1ZlZlm+UNdCQAngD4BjWw0YBze6Hae83sbx9iixKQoMH4hYoePiJmi
X-Developer-Key: i=janani.sunil@analog.com; a=ed25519;
 pk=e25MyjRLPY3RWrYm/LrJ+/+t1MZJUbkgIW5CZg+g+hA=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX73ZXPEW/+ZMi
 TnP+MqyQXWaqKyjKJnICAlfNj2SRBRVZRlFY+Lh14K0AJJJzjZsK6ryU/22aT8Lw0nS0g/vfKHN
 SD0BAcrvRx68IpGp6u6KgZrgufJC2eq3GTqsFGBFD6SYUfmM/6qj
X-Authority-Analysis: v=2.4 cv=bPcm5v+Z c=1 sm=1 tr=0 ts=6a4f60e5 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8
 a=KKt7U01DjHU_5c1eSo8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: dLv-XhUIEZKcMww-UNR8O1gEvXpdfMLb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX9Rv5cSjn7HQK
 bRs6nJChTGVAQW2PaOGhEaOijz2LAvC4/asC92rUwoSIqgx9zF+ReksK9mtdr/eG35Ckz9YGBXh
 1QfC7Jz+Dma0iEjjjgtCao3fyR1UbkYfjFPjdFG3p9KyccNwgo1TbICYDj/EJ5wTo40+C4RY4qt
 GTLaplZMbP14JqCiYV1qLW3hPuVl2PEPtq/CPcUlqD0XyGw0pfh8q4PvihXhQwQ2D9AbVzwtVhQ
 ggyDanYe50t9r7BWzv3WHPq2zsUbNetvW1D9P4xxQAVzCWN10dylACnr7qtj2n9teEDA8Fpsx2Z
 CLc5NEnlDi32MPZxN+FFXLSvB5xE6kPkV02/cHuLyvN4BlaxJ1SyTbDSMi8QHPqWByD4UswzhJH
 RGL2JcgwAbxAkP/ytBpTyR8yq4F7IHVdIK/3wa2Zk/z2kS0Tt6ZMvJGqlA0A59mz67ZvtZc+zKb
 5oH2ZH9ulhFVEXvbk/Q==
X-Proofpoint-ORIG-GUID: dLv-XhUIEZKcMww-UNR8O1gEvXpdfMLb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39725-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nuno.sa@analog.com,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:olivier.moysan@foss.st.com,m:p.zabel@pengutronix.de,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jananisunil.dev@gmail.com,m:janani.sunil@analog.com,m:krzk@kernel.org,m:conor@kernel.org,m:jananisunildev@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[janani.sunil@analog.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[analog.com,vger.kernel.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:from_mime,analog.com:email,analog.com:mid,analog.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[janani.sunil@analog.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[analog.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 44FCA72E84B

Add a backend operation to enable or disable Cyclic Redundancy Check
processing for data integrity verification. When enabled, the backend
will generate, verify, or process CRC information for data samples
transmitted over the interface, allowing the host to detect corrupted
samples.

Signed-off-by: Janani Sunil <janani.sunil@analog.com>
---
 drivers/iio/industrialio-backend.c | 33 +++++++++++++++++++++++++++++++++
 include/linux/iio/backend.h        |  4 ++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/iio/industrialio-backend.c b/drivers/iio/industrialio-backend.c
index f7a4be8ec320..379a426931cd 100644
--- a/drivers/iio/industrialio-backend.c
+++ b/drivers/iio/industrialio-backend.c
@@ -886,6 +886,39 @@ int iio_backend_num_lanes_set(struct iio_backend *back, unsigned int num_lanes)
 }
 EXPORT_SYMBOL_NS_GPL(iio_backend_num_lanes_set, "IIO_BACKEND");
 
+/**
+ * iio_backend_crc_enable - Enable the CRC generation.
+ * @back: Backend device
+ *
+ * Enable Cyclic Redundancy Check processing for data integrity
+ * verification. When enabled, the backend will generate, verify, or process
+ * CRC information for data samples transmitted over the interface.
+ *
+ * RETURNS:
+ * 0 on success, negative error number on failure.
+ */
+int iio_backend_crc_enable(struct iio_backend *back)
+{
+	return iio_backend_op_call(back, crc_enable);
+}
+EXPORT_SYMBOL_NS_GPL(iio_backend_crc_enable, "IIO_BACKEND");
+
+/**
+ * iio_backend_crc_disable - Disable the CRC generation.
+ * @back: Backend device
+ *
+ * Disable Cyclic Redundancy Check processing. When disabled, the backend
+ * will stop generating, verifying, or processing CRC information for data samples.
+ *
+ * RETURNS:
+ * 0 on success, negative error number on failure.
+ */
+int iio_backend_crc_disable(struct iio_backend *back)
+{
+	return iio_backend_op_call(back, crc_disable);
+}
+EXPORT_SYMBOL_NS_GPL(iio_backend_crc_disable, "IIO_BACKEND");
+
 /**
  * iio_backend_ddr_enable - Enable interface DDR (Double Data Rate) mode
  * @back: Backend device
diff --git a/include/linux/iio/backend.h b/include/linux/iio/backend.h
index 3f95ed1fdf9e..197cf1ad5e68 100644
--- a/include/linux/iio/backend.h
+++ b/include/linux/iio/backend.h
@@ -189,6 +189,8 @@ struct iio_backend_ops {
 			       enum iio_backend_filter_type type);
 	int (*interface_data_align)(struct iio_backend *back, u32 timeout_us);
 	int (*num_lanes_set)(struct iio_backend *back, unsigned int num_lanes);
+	int (*crc_enable)(struct iio_backend *back);
+	int (*crc_disable)(struct iio_backend *back);
 	int (*ddr_enable)(struct iio_backend *back);
 	int (*ddr_disable)(struct iio_backend *back);
 	int (*data_stream_enable)(struct iio_backend *back);
@@ -237,6 +239,8 @@ int iio_backend_filter_type_set(struct iio_backend *back,
 				enum iio_backend_filter_type type);
 int iio_backend_interface_data_align(struct iio_backend *back, u32 timeout_us);
 int iio_backend_num_lanes_set(struct iio_backend *back, unsigned int num_lanes);
+int iio_backend_crc_enable(struct iio_backend *back);
+int iio_backend_crc_disable(struct iio_backend *back);
 int iio_backend_ddr_enable(struct iio_backend *back);
 int iio_backend_ddr_disable(struct iio_backend *back);
 int iio_backend_data_stream_enable(struct iio_backend *back);

-- 
2.43.0


