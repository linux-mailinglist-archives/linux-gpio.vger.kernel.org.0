Return-Path: <linux-gpio+bounces-34557-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GO7cIWMKzWnhZgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34557-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 14:06:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F148737A215
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 14:06:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8638B324CBFC
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 11:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503064219F9;
	Wed,  1 Apr 2026 11:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="llmWZq9B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QLMHL2yp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81A3408237
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 11:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775044337; cv=none; b=so44SZULCtXc1X/kXoiU7NCqKTCnaI28vWeWN1gfpba0N+yPpdrqpdVS3rraE2DQxCPtptsRsuDmqwj5gaK+WXMj/okwTsuWX2B6IhsoEMvn8S1rjpbsozi17KPPUrC4Tkn+VtbmGfPIGLhH/AFNkoKIBKmV5EWPfd5y7vLHCIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775044337; c=relaxed/simple;
	bh=f5ZmZnFeNe9D+apRa619ltaKL3wjPFLh8/xksQXLx3M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R2sIv9y9zHXCddSDLTeJ6grDgac6hx/5MlmbTS4huthcPDsF6vwbr24ijO+/azcgOrABXF7aQkERRQmAyKWn1gTwKuhGIfEtkOJjT8O4y5fvzgdW48nBM/HQHlIrfL9tgm6bn19OXQUVjq1etXwfsisY1Qwqxgoa4CZfrshcF+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=llmWZq9B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QLMHL2yp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63171bFs1285828
	for <linux-gpio@vger.kernel.org>; Wed, 1 Apr 2026 11:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kjq8IbqCSc4OyEp3nlisvk
	+bUjiYIQQ9/KSl5493Ogk=; b=llmWZq9BHz8PxW/QnQIlXKX2nQ7fF17Rto9OSG
	3c6WpDJ29Wsmwdk1PEf7XgxOAq4RkSKp8nEJAX170uinGZaYIfTzcVHXcWFSOIAm
	XvabeuqLVFaeEOLcf0WrkNc72ZRB64KYhn8DfZLWZDhyVsHjGUNH/W4JZdYIELmI
	s6PlQ8EkQ8ETUTQ2NH7sHFjNYK74Z/CxicqRsBBmE3XRrFk8FJgG+D2fALa1pgRI
	Tnp/AOi1bQNTO9noh5GejDP3K3tTCQm83FZeguZ+OZBV9emHlK+DmcYDv/37AGha
	6M6r4+bn1iZYUhRYbiLRICUBqYZj+PAHpbjn3DXcLKLHIVeA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xm3s2e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 11:52:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c769b25315eso6361240a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 04:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775044334; x=1775649134; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kjq8IbqCSc4OyEp3nlisvk+bUjiYIQQ9/KSl5493Ogk=;
        b=QLMHL2yp91X5fc0U5JC+5XSAavCiP3Hl9IvpQzhR2HBeSkOO7vL05VKYBL7rCUBVPS
         +E8Y5DUoJUwC9DuZshDszluV5CA4AUtxKceZ5HbpV0aVUtFc5A92SBUs8y+nCc63JC7k
         eaiNROy6KHf7NPxcJrTPoRTo0Wb/7FMtW1y5kYRmdK/WOdq+2RnkRC0ixPX77krI4aQk
         dHZTts7y1tCPM+QVfzrPuw9uuBZNmLznx+jrx3LrknZ093RPfdpt11MF03hr6tY8lCE1
         xu7OVV9zJe+xkVT1VQYdy73NolcErahcFiuB8Jbp03RsIufBAXwx8XnnTy6/ZS6u7dUk
         pygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775044334; x=1775649134;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjq8IbqCSc4OyEp3nlisvk+bUjiYIQQ9/KSl5493Ogk=;
        b=GxMOsnDIU89/TiZ+OpfjjqzoFmpzXb5C75/JSwTRA4psSsmXlDZpIFUW8aNYgTAXTr
         kASjVmUH26A7W4uvs+Yd62Rh+8o+R66vvad99C+0DkBEl/XCVf4ssfPlzc3oJTweB/BA
         58yfPHN0e25kcX8RVQQlRqQuKlHo2IWUxzVF7/iWx6sXmFW8poYEogYz8iLbySWvEK8h
         CM6qdfY4zMsrd0zOyg5Iy8NgpQ3XZM3+k5Xmq6XENGnMWa9o/E1eWlH1+2lNBlCUeiDH
         DPfouRpQBiLE4d1u7OyoUEcnd7Il+yZilu5ReCyGVBQcShi8QRFdE5c1EehO2w/Bhqw7
         HtsQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1wbPBudzeK7lOu6JG5xV+zER6dta6tAIhkoD4e8seqvBOVvt3DlLj8rF9YCJHEcOJWYe16QdcjxTQ@vger.kernel.org
X-Gm-Message-State: AOJu0YydFvx5IjWJh2Cl6zT0sGkJfIaToV7WQszApTpxuyNTdAJMdBJi
	ZyBIrMXsyor1A4r3yAZx7Uox9fFQEquwbqKDzRT5dLdT+fFUK5hrCd5nhsFdKemPnPhfZrTJr1Y
	f2OzHy0RgnyFOv3tt2bHWaiPNm78AV6r80O1YnZ55gEfM+/4xMax+D4Z3/fBh2SeI
X-Gm-Gg: ATEYQzwCQcn+ZiLK6zSNQORojM5B28i4HV36M2x7cwG+VI9Q/k9AwEfD6/lMfXFFqYe
	zpetgdbzd7mPYSqaP9UzXK7/yW+NZnaO4VU/kXwoB2GNRfCdWwI69fqXtYi9bpi2nR6m6MR2Izs
	v6X4diR/wbyzarDI1mtTo+CEn+tE5EgtspROeLIevZghitw2vax0ZGJmy4mPmA+QraBKqZMuxbM
	AcozV3yRSQWdMDaLG4sWbXt8IV3SbObJblw/OE8ATIUZQkCQ836GiM45ds7vzf2iW671+MyvIDd
	TS/+s1ooZR42OfEsMCLJZaDE1E8q8oCUw1INN1LCsV1i4rGQuicNbxChrcsZ1ht2iQKYJgkRprO
	PpnyLqxMBM6re7Et0zfruOvDaYqJ45rWG5ncv0gQ03svXS3Xx
X-Received: by 2002:a05:6a00:1951:b0:827:343a:a1ef with SMTP id d2e1a72fcca58-82ce8aead3cmr3757185b3a.52.1775044333657;
        Wed, 01 Apr 2026 04:52:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:1951:b0:827:343a:a1ef with SMTP id d2e1a72fcca58-82ce8aead3cmr3757149b3a.52.1775044333085;
        Wed, 01 Apr 2026 04:52:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8465785sm18128456b3a.18.2026.04.01.04.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:52:12 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 0/2] pinctrl: qcom: Introduce Pinctrl for Hawi
Date: Wed, 01 Apr 2026 17:22:06 +0530
Message-Id: <20260401-hawi-pinctrl-v1-0-4718da24e531@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOYGzWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwND3YzE8kzdgsy85JKiHF3zZMu0NEMz46S01GQloJaCotS0zAqwcdG
 xtbUAbvSE/V4AAAA=
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775044329; l=722;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=f5ZmZnFeNe9D+apRa619ltaKL3wjPFLh8/xksQXLx3M=;
 b=N+o+sJkXtlG0fNbp7rzR575Hc4i96x68cRYUgib4vHaXfoIAoBG8dyl2irbOxwobBsRMwoIS9
 +Ck99sR6WfaDiJOafCbVocYkBk4ryoedLcttYrrHXCxNnwRB7ZCk98G
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=L90QguT8 c=1 sm=1 tr=0 ts=69cd06ee cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=JAQA1SFX2CWciKQcUckA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: EEF33_mnD53BRulhjJrx9sbONwQrxBez
X-Proofpoint-GUID: EEF33_mnD53BRulhjJrx9sbONwQrxBez
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwOCBTYWx0ZWRfX6kJr+FoSrCx+
 GnLvo2DG0CelJbGovk/pSlAhEUIEbYC6buEPSeB3icvJY2TPZCaZsEbxNNgKlfK9Nqk4dzD9K/a
 oH/7sW9GBxoKh95FAL87d99BC5P31tMrwp31tB/9eZZKi98mQqPJ7shMJfkNPyN6GcGRfttN1OG
 Vy6pRqkEFWO8q3xQZomEEpTEcRcyYq4ETqc2tmgTiekK+XbkNUGt57BWHYNH6ZsHldI96SLxjHn
 Vc2MajR+XpjouslzDHOkxOFPehIyK4fv4x9/mFz+BhBZnb0WsK4pHvg7Q/n4mt7TuMoZmUV8LMp
 AIxOUULhRq0Lf/ZP0tt1fkAs0TO+11Oz5A09up/OiJVOJIRtrct148c7kGc4wFNXrngq2+bw9be
 4hHFBM94i6DCKsldd7sZjL9y5KOhFyZaf/nOS1Kjmkm68KPHMGZvrSgAizOyXhyChDMKh7GqC8B
 Pd4m+URWAKHI3xXpD5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010108
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34557-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F148737A215
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce Top Level Mode Multiplexer dt-binding and driver for upcoming
Qualcomm Hawi SoC.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Mukesh Ojha (2):
      dt-bindings: pinctrl: describe Hawi TLMM
      pinctrl: qcom: Add Hawi pinctrl driver

 .../bindings/pinctrl/qcom,hawi-tlmm.yaml           |  123 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-hawi.c                | 1716 ++++++++++++++++++++
 4 files changed, 1850 insertions(+)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260401-hawi-pinctrl-7c9ff163bfec

Best regards,
-- 
-Mukesh Ojha


