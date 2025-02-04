Return-Path: <linux-gpio+bounces-15341-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD873A27A5F
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 19:44:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E46FB3A1AAC
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 18:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C94D218AD3;
	Tue,  4 Feb 2025 18:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="bIebhRt8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB7D217707;
	Tue,  4 Feb 2025 18:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738694662; cv=none; b=au5X/Ox3Nddd6rJRYBEDyLSdvYYqqntZBN+HSwu4sp6uICUCy2UJwSaLxp3PQSgA2HC1ObLEPHVrdK9YTI7BB1ZGQaR60bSvkLSgKqjJv8rvmgEQYMasp8oNw2GL4tHFGAFaqM4IIm0r5B/EludbXTGabgBdxsJ4PLFXTOexbl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738694662; c=relaxed/simple;
	bh=+L1NmV+j26+UOD2SUcoJJjoE8XPdyqF1yd/41EdziBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oTMHji7yNm3wP/eccGZYswp+Tv1gAGC1Hk4DU25h+kN2p5hqDBSFhTcHKP3Y66mXyBQhVCcHMqog91AigGB/DdGU5+3nOk99HmOm5MDDC7KTjlPQbrVSUH7rxIaOcuZtkQLTWXbuR2sqBdmJJnXVx+HkCVHBwZ6tniln4nTI9BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=bIebhRt8; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514GEnWO028618;
	Tue, 4 Feb 2025 18:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=EGA6gUn9zRkuVLwQf80uhCdEddQ0d36aW1lKnlzmi
	RQ=; b=bIebhRt8NW06bb1R2iEF9rHXjje7eQhp6FSqccrpeNHVicQ0bcn+x37z/
	PU5DlOTBxkqbfXZrWtpibxlSHT4kO+ZPgGTc7JQOMuh3RN90LmyI9puZ8Gq0tpWD
	Mh59Rf/77TXXKzbCBSDcCz0canUoQ1+qTm0gmkrqaxaclcbGD5bs5jTRHr2rDCw3
	vsAz3npuxg7eViILUs93sZ0yk20w9yFiojH2gXyET4ZGLlucziw12TrmvWjVMIuJ
	4m3yEouwRRhwAZzqnXaQIC8biAf6MBy1ZJYYj/WIQnNuqHW2imT8ZKT7Ghvv5Oyp
	UOgdmCks+e+6VI/bMcdXXGwrZWa9Q==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44knqtrxfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 18:43:43 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 514GDkbq006502;
	Tue, 4 Feb 2025 18:43:42 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44hyekcuuk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 18:43:42 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 514Ihfah25101028
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 18:43:41 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0FE6158058;
	Tue,  4 Feb 2025 18:43:41 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 26AF858059;
	Tue,  4 Feb 2025 18:43:40 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Feb 2025 18:43:40 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: brgl@bgdev.pl, linus.walleij@linaro.org, minyard@acm.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        openipmi-developer@lists.sourceforge.net, joel@jms.id.au,
        andrew@codeconstruct.com.au, devicetree@vger.kernel.org,
        eajames@linux.ibm.com, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, andrew@lunn.ch
Subject: [PATCH v8 0/9] DTS updates for system1 BMC
Date: Tue,  4 Feb 2025 12:43:26 -0600
Message-ID: <20250204184337.3896834-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sSYgMD278uzYUMt_Vx3iymDjSFnl_9I0
X-Proofpoint-ORIG-GUID: sSYgMD278uzYUMt_Vx3iymDjSFnl_9I0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 clxscore=1011 mlxlogscore=616 phishscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040140

Hello,

Please review the patch set version 8.

V8:
---
  - Updated subject line from bindings to dt-bindings
  - Updated comment with reviewed by.

V7:
---
  - Updated pattern in the ast2400-gpio.yaml
  - Dropped "dt-bindings: net: faraday,ftgmac100" patch sending it
    separately.

V6:
---
  - Fixed dt_binding_check errors for ipmb-dev.yaml
  - Changed the hog parsing pattern in ast2400-gpio

V5:
---
  - Improved IPBM device documentation.
  - Added the hog parsing in ast2400-gpio

V4:
---
  - Removed "Add RGMII support" patch as it needs some work from the
    driver side.
  - Improved IPBM device documentation.
  - There is a new warning in CHECK_DTBS which are false positive so
    ignored them.
    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: gpio@1e780000: 'hog-0', 'hog-1', 'hog-2', 'hog-3' do not match any of the regexes: 'pinctrl-[0-9]+'

V3:
---
  - Fixed dt_binding_check warnings in ipmb-dev.yaml
  - Updated title and description in ipmb-dev.yaml file.
  - Updated i2c-protocol description in ipmb-dev.yaml file.

V2:
---
  Fixed CHECK_DTBS errors by
    - Using generic node names
    - Documenting phy-mode rgmii-rxid in ftgmac100.yaml
    - Adding binding documentation for IPMB device interface

NINAD PALSULE (6):
  ARM: dts: aspeed: system1: Add IPMB device
  ARM: dts: aspeed: system1: Add GPIO line name
  ARM: dts: aspeed: system1: Reduce sgpio speed
  ARM: dts: aspeed: system1: Update LED gpio name
  ARM: dts: aspeed: system1: Remove VRs max8952
  ARM: dts: aspeed: system1: Mark GPIO line high/low

Ninad Palsule (3):
  dt-bindings: ipmi: Add binding for IPMB device
  dt-bindings: gpio: ast2400-gpio: Add hogs parsing
  ARM: dts: aspeed: system1: Disable gpio pull down

 .../bindings/gpio/aspeed,ast2400-gpio.yaml    |   6 +
 .../devicetree/bindings/ipmi/ipmb-dev.yaml    |  56 +++++++
 .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 139 +++++++++++-------
 3 files changed, 147 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml

-- 
2.43.0


