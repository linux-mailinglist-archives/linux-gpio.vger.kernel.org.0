Return-Path: <linux-gpio+bounces-37248-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6J6/CSnNDmpoCQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37248-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 11:15:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 721E45A20E3
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 11:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69A4E306DEF0
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 08:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9F1379C4C;
	Thu, 21 May 2026 08:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A+TtssKW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L9XVmql6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FF0346AE1
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 08:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352945; cv=none; b=IDfHicBs2PbGfAkYsjQexqmxABBTZAbEphaf+ESioaoCutRQiawEGKHaXwX4tllr/0H2gJQNWK/nKeqGQNuYDcIg0ik+nb76VZHV9N+OvB2ilx/L0FChPUJEW0q37mUrKEmskXtqjzen8LRuzsr1uDoa1rb1XejL7dEXZ0RBOew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352945; c=relaxed/simple;
	bh=1wENxyeqEXO+rchcvtUpNp9xquaNvODpYXNg/V0yxUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RwvmSfN3QlhTCsPPe/G7kSceUqbLRoulUCirUc0uwTAhxICusKPpIQVAB4VtT/IA9tQx2OgcrE3VGZM/eTXqX288uw7f7MZPIlagg4Sm7IU7hLs7hgsgFM3bYKM6rPL76aMFrI9CLPgztVUCVzS40Q2NKGGRpTpAcH3BXFnHy98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A+TtssKW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L9XVmql6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L75BQ23680286
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 08:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eXAQUe6zvGar7mzqa+2Xqa
	o6fuugeMgP7Vx/7oxKPyY=; b=A+TtssKW7NA2X+RUTxEkkVAr2wbzqXKGHC5CrE
	MkxhxyBnAjrZURjjZKHacmpzqewmg3rhXJ9XhIgNXyzvdCU8Zig+ibU4hY8WlD0l
	iOlKhcMDNbanZiR0LhzhHObuXT0d4Ds1io7HY9ZKVxlvJHE7qzSsXlG2D1rvnpow
	dWrX1iVlYkUOEvd4C0DQPjAHyKZnJeVvCGzIco8t4fUZPMZAGgFLX//hE8cC15w7
	8qPuNR2I4TUj1Xah7KCZuuxx1nmpSeu5CimB4fsXDf4YBga7hNv2Uok4wVO4TqdN
	yFX074po8b04ddad8dMalYds03vIEevNpao8s2PrQTMjP0jg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j41u7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 08:42:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50f13da9684so75624871cf.3
        for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 01:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352942; x=1779957742; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eXAQUe6zvGar7mzqa+2Xqao6fuugeMgP7Vx/7oxKPyY=;
        b=L9XVmql666dN2s/NGmu9WR+bS8bDXzLEBdck2X0lXQcQ7Be219H7XF3RtXdkQomzMI
         shB970emy4cEazdyOXjxspYJFxPcuxzhvSVwlv39qL6ZOu4+GLg7J71K8R9ppOnUaVMN
         1Rep6r3vUI6Ho+4RwR/4KrcTySw4blTHgOtOU+to9f7syGDFRskxdkEb2GAahqpiZPT0
         hB+DGJi1cYHk5zD4e6bb9J8RZ/MVsfuo6uXOQbPyPHAmdbjjgmtvgALKxyik6hUx2J2K
         CDX5IjOedX/QK+UrdTFuvUsB86G2HvmP5/kimS7lXqQod1LTpNomds+fyT4dJZQEZHAy
         ExVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352942; x=1779957742;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXAQUe6zvGar7mzqa+2Xqao6fuugeMgP7Vx/7oxKPyY=;
        b=BsRoYVk8rbRUNhv5987foXDlX7H0Muw02UM0OYCwxrQjK1bY268NARLyw1QSHbv2Xl
         wMhTxDayo8uiQua2iTI/s5McgfyHegPrH+491BVBK9uauOHGxKOzlJaE9R+eaqHAS1f/
         MZmNCjoPwzm8BmeQYBmDWcLpTXm0nc5ssBhcKE+iJ/Sw+X8NZ+kjFnKnc/aeWgVyoWiK
         KQKKUsHeB7/cufJ+WJixiXgBBkRUw5v34F7hQzp0tdetDL7G288UhqNxLvTofvXrqP2y
         jgzLPjkXsExpscvsX9BdoyMB1IydDlyZ8Wz2BWUmL6HWYXwUQQFXAXbjWVDWFvoDVIZB
         aP0Q==
X-Gm-Message-State: AOJu0Ywr06BHMm1kBP4XM6KCrl8lkDJqwHnvIj9c5RRLcoQ750muAiRX
	cH9SanqUTsLMtmFb3Q74VzAbVcIslSpPv3d54Rbd5cYdQpa3YgpW6N9cFarL+iAAfIUAQKUs02P
	eVSgE2tq6Tr+D0wCbuwrhB09waQLZDQ7CBZbvwmtpgyd69wZye+GiFk+toL++TMTReJx63yL2
X-Gm-Gg: Acq92OH+L4g3LYOIdvk9tIloIRZusYT3DPz+dfzPhEBmGIsqIpm0y0r59EnHwQmcYLx
	INTk6KQm4OBUsXNno1kuiUrPaY13nNI/dMqDa18gADGRLWyD6f8UwdPUR3234PsacPV3pDXw4cT
	Y2/h+v9XrnE7w6gP4GNzwT+pbTqDdj/y3bCYG4dV4YaNjHO1/xRKfJ8f9cen/YpFMk6ZtYq2ssK
	/G6wdu0VbRygosnGbtmzMJzEUdKE7PBIFJKdf+yJJR2Wo+tpftvRMPfmcY17vaGTaOfNGTuuHd2
	nW18iRMPI807ii00yYpv7vaXCWZxAswMY8qfUg1Z7dt+EeDdEAT2erZtIEK6XSugNJ0rFmWoB5g
	eI1vrc7/cJSbfbpRC0LW7bFRpvdw7Yb6x+6Uja5gfPY5u3mY/Kgo=
X-Received: by 2002:a05:622a:a19:b0:50d:8e2c:6a68 with SMTP id d75a77b69052e-516c55f29a2mr25399301cf.51.1779352941925;
        Thu, 21 May 2026 01:42:21 -0700 (PDT)
X-Received: by 2002:a05:622a:a19:b0:50d:8e2c:6a68 with SMTP id d75a77b69052e-516c55f29a2mr25399021cf.51.1779352941399;
        Thu, 21 May 2026 01:42:21 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10916595e9.14.2026.05.21.01.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:42:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:42:16 +0200
Subject: [PATCH v3] gpio: cdev: check if uAPI v2 config attributes are
 correctly zeroed
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-gpio-cdev-attr-padding-check-v3-1-ec3bcbe2e358@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGfFDmoC/43NTQ6CMBCG4auQrh0yLfLnynsYF7UdoFEotthoC
 He3sHJhoptJ3lk838w8OUOeHZKZOQrGGzvEyHYJU50cWgKjYzOBosCc19COxoLSFEBOk4NRam2
 GFlRH6gol5ULVlcw0lSwSo6PGPDf+dI7dGT9Z99rWAl+/f8KBAweJqtB7WdTVpTla79P7Q96U7
 fs0Hrb6QXyYAn+YIpqIHLVsKszrb+ayLG8Nu76oIwEAAA==
X-Change-ID: 20260519-gpio-cdev-attr-padding-check-7e52c98a3de7
To: Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2384;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1wENxyeqEXO+rchcvtUpNp9xquaNvODpYXNg/V0yxUo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsVqGFP4uttboBZlKQiCwCf6qFCvSjcSc2vol
 gi9b5kt+FeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7FagAKCRAFnS7L/zaE
 wyHjEACjgUitYuoJC+3KPobizdIzsm7bxWrkbcFmZuVARUlQgr5fVkDvcaUR9hZoqltB9k/VQj9
 sF4S+kRG7VEfzxRyd556dDKnmayT4FN67pmXmInoFhKK9XWIHHzqz7Jn5hkl1Ed/Sk7hJcaZYwC
 jW+MQOqza7BusB6AVPPhT3J739KdscANlBRpQZtyGzUemKcDVnNckH6N8/qjTTQht8ISVV63Srf
 Ryxf/xjPmN88UTxKU5I16W6ar36j9VIwJuzhHY0IYUvBWW0/gYtce0IqxI0H0sNllCGBLYIHswC
 /jilFhRFwzGaiHOAipjM/nmN3TTN/M2Qy0OgK52Cgnm7FRm2IU9kD7RUtqD0YshQdJLhPBiE+dp
 awv+TRIK7Vw4ioiEIxTfGYFjWd2OI91r60RsRWMokTWltE4pDW8uTI3RCB2ttP7omcBHFbEnDLK
 E5oSUItDlB9xSLLQ0FDDWwScsWUug2HZnm1eAAPosyLKM3bIdjoTuZmm3KJiLFt/53y5oxMzi34
 11H/nQ+8TfsY/W/fg9WKR1SYO8hYvnMLAba4UlOJtz184QjZhlpXZB3A5NoBItdHcq/dS/aRMtp
 dnxlQHGiREl7VHpjE8z+U1FiCBYuH/stH7TZKBFD/wrZL2YcS1eTgwpT+nRdGTbS+wFxX8Q8upo
 Z21vvjWWk0Ncp7g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0ec56f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=lMDd1n3YxiPGw5vM6oUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: OYZLt83Kbdtss19ZyXMXdQbdBxk9WrDG
X-Proofpoint-ORIG-GUID: OYZLt83Kbdtss19ZyXMXdQbdBxk9WrDG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4NSBTYWx0ZWRfX79XbrlQ0Xjco
 fOPAixeuYWzZWVqwzR1r4G3A1SjrEl5/7FsnWkUPXvvkrRjEtMRL+poEP0JPUMAb77vgR4GtUa7
 FhYfJZmMydI/GbCyI7skyZUuyvXr7sSiqDPsag7o8CMnz2YQbpnqKzlUqNwZIElMvf1qB6eFi8g
 5YWP7oLOFp3VqzzSKR6oGEcFp8X2mwTNV811/w9Ba9rtJRQBZdTPDouSgGHrGOvd6GdHVCLr51X
 I/5KJhwY8zCSTQgdj/dsAU4TLDfi+4fkVPatMCGUTv9kDctFj5ABnUNzurnBxUCIL2HXW0OMas0
 96EKHXDMIjEPJhzdJJq1UatbRtpjhhmnRCyf2yymbMPUp4qb0M6rLqw1+4w1amiaR0T/PYmeviW
 GFsYoAvfzYqmuFQbm2NkBMdCid+apUXjGdSxZv3lkhCVf7ZUVZ+aFY6lP6hlT2/G9rDw3P0+aZY
 niTeXr2SO4bk27LK4fA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210085
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37248-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 721E45A20E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We check the padding of other uAPI v2 structures but not that of line
config attributes. For used attributes: check if their padding is
zeroed, for unused: check if the entire structure is zeroed.

Fixes: 3c0d9c635ae2 ("gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL and GPIO_V2_LINE_GET_VALUES_IOCTL")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Don't try to check unused attributes if there are none
- Don't reuse the loop iterator from the attribute padding check
- Link to v2: https://patch.msgid.link/20260520-gpio-cdev-attr-padding-check-v2-1-0010daf8059f@oss.qualcomm.com

Changes in v2:
- Make checking even stricter: check if padding is zeroed for used
  attributes, for unused ones: check if the entire struct is zeroed
- Link to v1: https://patch.msgid.link/20260519-gpio-cdev-attr-padding-check-v1-1-a0c6d4a698bf@oss.qualcomm.com
---
 drivers/gpio/gpiolib-cdev.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index f36b7c06996d70b2286edbd181899e4c572b9086..82f27db0b2304679eae4c4f28302e9845d7cbaa3 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1184,6 +1184,7 @@ static int gpio_v2_line_flags_validate(u64 flags)
 static int gpio_v2_line_config_validate(struct gpio_v2_line_config *lc,
 					unsigned int num_lines)
 {
+	size_t unused_attrs;
 	unsigned int i;
 	u64 flags;
 	int ret;
@@ -1191,9 +1192,21 @@ static int gpio_v2_line_config_validate(struct gpio_v2_line_config *lc,
 	if (lc->num_attrs > GPIO_V2_LINE_NUM_ATTRS_MAX)
 		return -EINVAL;
 
+	unused_attrs = GPIO_V2_LINE_NUM_ATTRS_MAX - lc->num_attrs;
+
 	if (!mem_is_zero(lc->padding, sizeof(lc->padding)))
 		return -EINVAL;
 
+	for (i = 0; i < lc->num_attrs; i++) {
+		if (lc->attrs[i].attr.padding != 0)
+			return -EINVAL;
+	}
+
+	if (unused_attrs) {
+		if (!mem_is_zero(&lc->attrs[lc->num_attrs], unused_attrs * sizeof(*lc->attrs)))
+			return -EINVAL;
+	}
+
 	for (i = 0; i < num_lines; i++) {
 		flags = gpio_v2_line_config_flags(lc, i);
 		ret = gpio_v2_line_flags_validate(flags);

---
base-commit: 6a50ba100ace43f43c87384367eb2d2605fcc16c
change-id: 20260519-gpio-cdev-attr-padding-check-7e52c98a3de7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


