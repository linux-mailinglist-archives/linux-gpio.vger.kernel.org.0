Return-Path: <linux-gpio+bounces-34887-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBGoNaBk1mnIEwgAu9opvQ
	(envelope-from <linux-gpio+bounces-34887-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 16:22:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 827F83BD9B2
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 16:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 121C230A8DCB
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 14:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734293B19B8;
	Wed,  8 Apr 2026 14:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pe+YqDtA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FOC3TbDn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CCB274641
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 14:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775657765; cv=none; b=FfVDj9WEO6Ki38KycDY8KSrXlSKcGM0aPS+QVDNWdnsxfLFArenggM9iBgc1i/3Cb+1RyaJHgvO7ZdUOaNmgi3GW7i3TI0jhdThEfbIGmr3s5ftmeUpZsCKvmZNTsTfpDqzrsIZJ5fihtWe5De+9qJCRFDYEhCSAcsCPBTTl0Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775657765; c=relaxed/simple;
	bh=JlZwRN4ebBb25WsbzX3Gj0X5xuWi7lYUgM15QvqS6po=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n4N9FCkDTasyiQryrpyQlWEkxMrjXkAxQBtFqIpPuZqL+0VrzlEN2kMpKYdJoRhp1bpgF96IwpuIjIj1iRy87wmPW9b/AMOG9QZv5dG4l/Ge7pf+zn7xZJ5YITnjhFdR1zhqzh3P3vncWuL7ySxz/YUb5YUrxiHoWxarGdBpLUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pe+YqDtA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FOC3TbDn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638B1lOP071793
	for <linux-gpio@vger.kernel.org>; Wed, 8 Apr 2026 14:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=t911cuUdDri4SVzoHl8Zqz
	Z1J73rmRBKtRxctGQ1nXQ=; b=pe+YqDtAwxNTWZ72L+th/gSdj3grupI7N2KPIW
	FOj5/GeTsD3H02ez8tMqOf4fsf1qZa0ImRvWBoi0DUZUgK8gW4q+WHwE67jz3VSs
	zGep4Hicb6ZBgiBvPxZNJKyan+rQcZ24XJDmNuHjw7F0kxkwEtkBXf962a3TZoi7
	xzGQO+gYuaTKSDgMFAg/Gqm4ku67cYi+cZ48SN+hkXhzJYH2+hWVJ25U5De8ntB5
	6iT+kfQU6tNmyLU6XdoRLOVj4AddrzgyH6+AVakF1wk/SMylKC2Ivt2E6b/JdKdZ
	gmQhODGxebnDmgMFKvZoJ8DJ1JqqJXz3agA3dU7EnVcEXzmw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7sxbmgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 14:16:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-358f058973fso7734394a91.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 07:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775657762; x=1776262562; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t911cuUdDri4SVzoHl8ZqzZ1J73rmRBKtRxctGQ1nXQ=;
        b=FOC3TbDnM4cq0qWPEIFjItxFSuCBdgO7KkDefJTjc/k/dsHNH7hC1vfeDRYvaxuMvA
         hPc+Kn3Gcxa16+fxE2HQgZF4e+CZq9pTpdD3dRrI2rJMjwJFPNgOLK5j9FIdgg6pma9P
         7igpqScNUePnkLNhByleoaFLOxj/Mb0CwxO0SZcZYnd4TdKkxYvhGXbGv9LM2ADLXoCH
         FtpwB7tr36M7odfolMos9B6N26oqMbfpnhl3LGa2olj3nLQ6oSBKqnJLOtNiLR19fc5p
         Qp+KWe8viQxhSx+w10ymAjHQsO/Z5Cf93JZ0zy10VAjzT2GMm5NhCkHtKQhNhnn1JDko
         w75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775657762; x=1776262562;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t911cuUdDri4SVzoHl8ZqzZ1J73rmRBKtRxctGQ1nXQ=;
        b=WJ+7LpEfUFF+bm//Yt/QIXhjbMsS/T5PcSmwiXkYIUZ3B4uxD2w1nE8x+ZJ0pDk/SD
         aTWF9s5bdsMgtV01x9EXjjKXFNlWuW6SuvGL596tDzsFp06J2ukWroteAOmFYmfm7m9V
         RGyiecLdhMk7ktGc7mxDAqgsjfrd0VNYY3bFFRCmIX4ubiwOIFGCGM3P7ZQ9k+h+k/tp
         jI5i+N8ei1+t4HRwH3jj1NUnoyzMG+BXPbzdgKpwDJDP546ewrgk5XLB1gKCroBWh7xv
         2J4MlqbaQiFuIJqeeg1EbfWNpLDNQQo8fqy/i7K3vTYNL3T+GN3nBq7ZCjCmQfCXXAGj
         j4PA==
X-Forwarded-Encrypted: i=1; AJvYcCWqWmK2EPJArHmdPUsGMgThO7kEG+V77lV/7i/ITnJe92UxgDsG7SeXtV5uFtHi9MYLNIUyc3IABB4q@vger.kernel.org
X-Gm-Message-State: AOJu0YzfcerFRGK4HvrLdl93n1qBO3cuexC6krfQ+iC5mMSN8qQWQTDz
	GgAWAhYYdoqWNkhxRNrKifCojhq7jaqNYeNhi4lilKmAqL/lMLlUd5BdrTISmBxOeprnYe1kURX
	ef4kTGNoB791RV9HSHOOTKhj1RDucKozNa9+RFbQB0xxwYI/spynt2SpkvAnssXcT
X-Gm-Gg: AeBDievRamP2Q12mKZXszm40hchmOAINDjp8P6rEJ6m1zIvSrRvS1x9iJhfe/N0D4y2
	T7PUvtvPpPhY9SWX9BxDWjMAY6/2d3fcvrPLA3DtpHWILVX6RLV1lhy5dsRTmgPCUahkieWyQIb
	7MHhg/CB5wh5rFQbW9B8m1PrVarLbiCbNbkGDpbWYSE/jy2L1MmUbL+/nP29Haz2/wviA5kOYqh
	+itl1IF0ZB7XB7eETwBsTUU9g6wlK934eX+RSf0EhUPlge6bxOEqrgHnjHYCy3dmZC+zI+8UAxj
	0UPuiAWEHUZ94wXowelxWRK4j4hG+10DxE0dy4YoFCCMtt0MHNkCCHPzEArmBZe+6INWFYUv9F8
	2iFMv9KS+EtZeCluOZCQYYDNewDreejF/DBpHHrlekFb5X5/T
X-Received: by 2002:a17:90b:2b4b:b0:34c:fe7e:84fe with SMTP id 98e67ed59e1d1-35de69aec1bmr21677326a91.28.1775657761771;
        Wed, 08 Apr 2026 07:16:01 -0700 (PDT)
X-Received: by 2002:a17:90b:2b4b:b0:34c:fe7e:84fe with SMTP id 98e67ed59e1d1-35de69aec1bmr21677256a91.28.1775657761091;
        Wed, 08 Apr 2026 07:16:01 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe62f5dbsm26261851a91.8.2026.04.08.07.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 07:16:00 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 0/2] pinctrl: qcom: Introduce Pinctrl for Hawi SoC
Date: Wed, 08 Apr 2026 19:45:46 +0530
Message-Id: <20260408-hawi-pinctrl-v2-0-fd7f681f5e05@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABJj1mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDEwML3YzE8kzdgsy85JKiHN1EU4sUY7PUZKO0ZCMloJaCotS0zAqwcdG
 xtbUA6r0ZgV4AAAA=
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775657757; l=1348;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=JlZwRN4ebBb25WsbzX3Gj0X5xuWi7lYUgM15QvqS6po=;
 b=dCnD0oSPe3AQpbMlp+IjADmNZt5JF/ybR9R8p2vyC2eheYLvVGbSqFCuDhUL4s0zuH8HlEtfr
 IhwiIme1284A/ReVd8JDESU8ThmJffp4hN9TYKMwJ0ExGsjFijepKzS
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=etfvCIpX c=1 sm=1 tr=0 ts=69d66323 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Yo_fNwfm0L6vNVNaIq4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: p5dwFypJnyTPMFvoyuT1WB1WFgy6aE-S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDEzMiBTYWx0ZWRfX6jFMSuOlwQ6W
 BpNZHJwWxJD6ACYzWdRkfl+IIxej8jEAe/OORVvmb4/iCSQi60/XEXnwfRzpWgL2nEI4p0gEl8G
 brqUTZc1LLGGu/gehYVzhOoe1tHoHUPlmCHIwr9KE/jj31f5CKHgWYLnr5hyTGy6KtpA2AJ5Z5p
 rPknRXAwCdqn5bYkwDznxhOmAr4QxFWTGn0+U3e1+X0tnZ4ISmTIbGZHBNJr2G9R709hlLRDsc7
 te0cFF21laOiUv3o1EgJ9+xobZwrr6iwAkEULPmMccBWCQuubjSD6Ui0JrCDn7VAxHhVcj4siNv
 Z5PgBxIK9ZtQGLaGwG4hH03wFXClF4gwUNKsww2NjHN+NYYZmuvJmtwFbXU7pCmnph2PtRvFRuo
 P7fTzqbzIEcCzwt9FpL4QpQER6wJxV7VobkppuE0OBLVX9n79kNWLw1wD55GvpH64g0goUQlH/A
 mvTFeBT32acYd6CMNQg==
X-Proofpoint-GUID: p5dwFypJnyTPMFvoyuT1WB1WFgy6aE-S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_04,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080132
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34887-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 827F83BD9B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce Top Level Mode Multiplexer dt-binding and driver for upcoming
Qualcomm Hawi SoC.

Changes in v2: https://lore.kernel.org/lkml/20260401-hawi-pinctrl-v1-0-4718da24e531@oss.qualcomm.com/#t
  - Addressed some of comment raised by Bjorn on following
   	o Grouping i2s0_* to just i2s0 and same goes for i2s1_* to i2s1.
	o Group the function such as qup3_se0_l0 and qup3_se0_l1 and qup3_se0_l2
          and qup3_se0_l3 together with qup3_se0_01 and qup3_se0_23 and
	  do the same of the other similar instances.
        o uim0_* to uim and uim1_* to uim1 as they are non-overlapping.
	o Grouping change for nav_gpios and qlink.
	o cci_i2c_sda and cci_i2c_scl to its respective serial engine
	  numbering replacing with cci_i2c0, cci_i2c1 ... etc.,

---
Mukesh Ojha (2):
      dt-bindings: pinctrl: qcom: Describe Hawi TLMM block
      pinctrl: qcom: Add Hawi pinctrl driver

 .../bindings/pinctrl/qcom,hawi-tlmm.yaml           |  120 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-hawi.c                | 1610 ++++++++++++++++++++
 4 files changed, 1741 insertions(+)
---
base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
change-id: 20260408-hawi-pinctrl-a58d36ec2fc2

Best regards,
-- 
-Mukesh Ojha


