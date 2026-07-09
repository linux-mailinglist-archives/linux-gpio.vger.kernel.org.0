Return-Path: <linux-gpio+bounces-39726-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XsL2Oa5hT2pgfgIAu9opvQ
	(envelope-from <linux-gpio+bounces-39726-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 10:54:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 753B072E862
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 10:54:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=analog.com header.s=DKIM header.b=NtnbAfi2;
	dmarc=pass (policy=quarantine) header.from=analog.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39726-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39726-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 73B07307D26E
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 08:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380183FE650;
	Thu,  9 Jul 2026 08:51:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A563E3FC5D9;
	Thu,  9 Jul 2026 08:50:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587060; cv=none; b=Nrg5SFerANfwrD6TwPXogwzBCAa+VBCG0jH7tt4lkacRuxF4b3rdw2AQvMT1q3Y/A8wFzcUurl0aiiE2LPIpJRQ4sX79RcX38UlQ48O/vwZwltnY8FqTQgMf1ET0yQlCytsQ1OeyAEHqoSlIrenKHv+en2832cqZ8Wmx7rz2T3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587060; c=relaxed/simple;
	bh=+xos5UmQGtT3slafeKKwprpiGejKb83icZ/E8Fc9ufM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=VcBLPC7lUrWSoLSiF4nNS+Rfm037ZrP8D2RA7f+QHpoF5zlwvTD8+unfCt6O5qfVKG6y9HRXQn+jEcldIjkqSfBDg3JdNsY7uQgaKYv+xe0RkdyYv7/qHhJi0jDp4HQvQCw/fHsg7lznJ4Y5vvSJnFrfTc5ZdbMLG29TBrzohnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=NtnbAfi2; arc=none smtp.client-ip=148.163.135.77
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6697qMVj413742;
	Thu, 9 Jul 2026 04:50:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=EpNf5
	BOx9beceQ1Lhh78Mw7L0JM/ddb9MtyS5QSvGKI=; b=NtnbAfi2dy2WfWDlvhOQ4
	yQ/5v9Xd1vhTXigrX7GC2flp6nw0MnKT/IAdyU7XWALQYf3Bi4J0Al4Kt+R9NZvW
	ovqZLIUBsshrmlH4gwo3wCVDZ0xc3q4dgaIScnyNmuvBfqViokSkpOnytwP1mvJI
	GGgX6DMxkeAWTd8bc984YMdSf7o0TgELfXdOYhYR+APXyt+je7QOofp4qiNR2Abp
	eoRjFIw5gQAyb5PfIfBXyNNcYWMpO+tlB9H/EZiQzv4733U+IyLItNDc9ZHar4+K
	Lv+5aGVmlWqhyAzwcxIZWh3mcM6ychyDupXiaut2S9sAXtxPZmjbBtD5TT8dFfpr
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fa7mug6j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 04:50:48 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6698olj1003598
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jul 2026 04:50:47 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 9 Jul 2026 04:50:47 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 9 Jul 2026 04:50:47 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 9 Jul 2026 04:50:46 -0400
Received: from HYB-e1y2fvUQ3cx.ad.analog.com (HYB-e1y2fvUQ3cx.ad.analog.com [10.44.3.70])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6698oLQx015849;
	Thu, 9 Jul 2026 04:50:39 -0400
From: Janani Sunil <janani.sunil@analog.com>
Date: Thu, 9 Jul 2026 10:50:14 +0200
Subject: [PATCH 3/6] iio: adc: adi-axi-adc: Add support for CRC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260709-ad7768-driver-v1-3-44e1194fd96a@analog.com>
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
In-Reply-To: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Michael Hennerich
	<Michael.Hennerich@analog.com>,
        Jonathan Cameron <jic23@kernel.org>,
        "David
 Lechner" <dlechner@baylibre.com>,
        Andy Shevchenko <andy@kernel.org>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783587021; l=2143;
 i=janani.sunil@analog.com; s=20260507; h=from:subject:message-id;
 bh=+xos5UmQGtT3slafeKKwprpiGejKb83icZ/E8Fc9ufM=;
 b=SanILUiPSTgByHA6OIwVvBciInUh3MD1FU63oI9+Yc/dOCzzpA/BfN/3jVCgTR/XXb00qzph3
 OhxSLqNTFzAA54mxVt2oksfluXxpHr4pApMkRL6ApYsaZgjC0k+Q5Jt
X-Developer-Key: i=janani.sunil@analog.com; a=ed25519;
 pk=e25MyjRLPY3RWrYm/LrJ+/+t1MZJUbkgIW5CZg+g+hA=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: Rl51o4WSGp5cb1zyHqZJfZsI-RM7MxS0
X-Authority-Analysis: v=2.4 cv=Bv6tB4X5 c=1 sm=1 tr=0 ts=6a4f60e8 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=gAnH3GRIAAAA:8
 a=CyFwfFEPMBXaf2khvGgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX8SOtZ8nxXQQ6
 JftELEmTxxpG7g68fDZeJr53wBR8U3gBt41br4yjvvz31qNOYBS+uVPviUiVMZfa9WCMuPFGmua
 J6fbyqtddVSafw09yOCbzfA9XOnJZD/gdw07D5XLhPZfiTD+UW3AxFlKDksBVHl/H3U0wNcYpyE
 o/0273gJt1U6OsJmqMEMPEMTqkjl/W27PHefMn5VULpGvXtVdbO/I5rdr3IjMsEaqcDE8sISP2x
 0A2yDxLR1+ed+VM72UtgpLJna/p6hXU2aDR0DIznudhQv22WvN3xRzpUnx1i4VYVwy1u8Pie++W
 jDNow6DuwmFt20JBmyo9Hjh3cmHkTAM5m0/8CKjizxgw8CNqC38fRVEY6DYg2atVcXnyTv0G6y6
 6pARFW+FhrnihSsVFy51QHDAkYWUB/DcKp+dRICLkVWjec9foD8b6cMVhi3KeRqZ3KZFU+j/tjW
 llmJiHs8mLI9UjTD6Zg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX4ixmzBbSBjWE
 2lx3i/drRFMEi/vgKpPfxFoZpV5uTsx4egad1jTgjfmjL74tvDUJyJbyHZe20jia+7W9qqVXHJL
 cj/OIHzXXzr+8rJ2KhH+9LvWlglIxrFyd+lEA2acQjozxoQ1uBt2
X-Proofpoint-ORIG-GUID: Rl51o4WSGp5cb1zyHqZJfZsI-RM7MxS0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
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
	TAGGED_FROM(0.00)[bounces-39726-lists,linux-gpio=lfdr.de];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 753B072E862

Add support for enabling and disabling Cyclic Redundancy Check (CRC)
processing in the AXI ADC backend. CRC provides data integrity verification
for high-speed ADC data streams, ensuring reliable data transfer between
the ADC frontend and backend processing systems.

Signed-off-by: Janani Sunil <janani.sunil@analog.com>
---
 drivers/iio/adc/adi-axi-adc.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/iio/adc/adi-axi-adc.c b/drivers/iio/adc/adi-axi-adc.c
index 26b9c75bd4d8..8af42d26aac0 100644
--- a/drivers/iio/adc/adi-axi-adc.c
+++ b/drivers/iio/adc/adi-axi-adc.c
@@ -47,6 +47,8 @@
 #define    ADI_AXI_ADC_CTRL_DDR_EDGESEL_MASK	BIT(1)
 
 #define ADI_AXI_ADC_REG_CNTRL_3			0x004c
+#define    ADI_AXI_ADC_REG_CNTRL3_CRC_EN_MASK	BIT(8)
+
 #define   AXI_AD485X_CNTRL_3_OS_EN_MSK		BIT(2)
 #define   AXI_AD485X_CNTRL_3_PACKET_FORMAT_MSK	GENMASK(1, 0)
 #define   AXI_AD485X_PACKET_FORMAT_20BIT	0x0
@@ -567,6 +569,22 @@ static int axi_adc_reg_access(struct iio_backend *back, unsigned int reg,
 	return regmap_write(st->regmap, reg, writeval);
 }
 
+static int axi_adc_crc_enable(struct iio_backend *back)
+{
+	struct adi_axi_adc_state *st = iio_backend_get_priv(back);
+
+	return regmap_set_bits(st->regmap, ADI_AXI_ADC_REG_CNTRL_3,
+			       ADI_AXI_ADC_REG_CNTRL3_CRC_EN_MASK);
+}
+
+static int axi_adc_crc_disable(struct iio_backend *back)
+{
+	struct adi_axi_adc_state *st = iio_backend_get_priv(back);
+
+	return regmap_clear_bits(st->regmap, ADI_AXI_ADC_REG_CNTRL_3,
+				 ADI_AXI_ADC_REG_CNTRL3_CRC_EN_MASK);
+}
+
 static const struct regmap_config axi_adc_regmap_config = {
 	.val_bits = 32,
 	.reg_bits = 32,
@@ -615,6 +633,8 @@ static const struct iio_backend_ops adi_axi_adc_ops = {
 	.num_lanes_set = axi_adc_num_lanes_set,
 	.debugfs_reg_access = iio_backend_debugfs_ptr(axi_adc_reg_access),
 	.debugfs_print_chan_status = iio_backend_debugfs_ptr(axi_adc_debugfs_print_chan_status),
+	.crc_enable = axi_adc_crc_enable,
+	.crc_disable = axi_adc_crc_disable,
 };
 
 static const struct iio_backend_info adi_axi_adc_generic = {

-- 
2.43.0


