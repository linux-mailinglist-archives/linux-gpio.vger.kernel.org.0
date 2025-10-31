Return-Path: <linux-gpio+bounces-27908-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 131C4C262A0
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 17:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF105564D4D
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 16:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17792FBDEA;
	Fri, 31 Oct 2025 16:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="a/jZfz3n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C7E2F5A2F;
	Fri, 31 Oct 2025 16:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761926907; cv=none; b=rbZnRRY3srnImhrYFSl+jEQ2k1AB8QozekWGCqRaFcO1CONXfOv4WED8pzS38Tu49ZtCthMQYNmIJEs/y3s187YQ4kJO74oVvOqI3jRpZLgxUVRzID+TtIy8Qi2/qBhxqylV5j6q83acLd2gdFCAt3juH7bco75h+9nU+yxAuGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761926907; c=relaxed/simple;
	bh=mtBPiPadsuplpuBAt4fNU1+W1gRT2iMBqw79oldk53o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hOjdegPHo7x+o8OhwWV6sof0jFCmYgtgiY1G/Vg1COF3DT3FIj/Jyh8qtHw+qqYvbqjrzHwkko8UeLfA13Z3pD09PHRyjKkjYBycOvpU/TBTl7g071mKbV9JBAh2odL1McZugHGVtwxHwUCGRNBfiz6zq9Ifpq57kbcmy1QI1YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=a/jZfz3n; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59VDvg1x1108539;
	Fri, 31 Oct 2025 12:08:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=Ua+ji97PiQ5ynhrUnxdzoyocV/1
	9dvBoIv9057spgt4=; b=a/jZfz3n34NyFnV0lvCNpemEwFFCwrPV6snA3CTMoFG
	wNgHhEPl70Xj6W2RL+0KsCXuNqgKxEWilc/2AnxOekrJ4rx7NJkRPHl5JKIJhIts
	8uRzxT3m2vj/IstMXs4HSCidSPY/d5DIXmKD1Wa9fOgyHhsBpifNJNR1wf9k4qIa
	RJ/+8nd+m1TMrUP+ZBXuBLNflNSqCknGKvIj9gcuk+7dThWlz9zMoOdZ3PAAjCH+
	bbWucUId0c8ZvKTx4j357NjZhevapGv5tQCYMldW1I6z2wEmM0k6mc76vTLYlkX5
	2w5BiRvV9KTakeXaZ3PiXcCULKUV4Nh9gepCRTdSkXA==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4a4p8atwdt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Oct 2025 12:08:21 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 59VG8KfF064675
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 Oct 2025 12:08:20 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Fri, 31 Oct 2025 12:08:20 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Fri, 31 Oct 2025 12:08:20 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Fri, 31 Oct 2025 12:08:20 -0400
Received: from Ubuntu.ad.analog.com ([10.32.15.145])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 59VG89rZ006955;
	Fri, 31 Oct 2025 12:08:11 -0400
From: Antoniu Miclaus <antoniu.miclaus@analog.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Antoniu Miclaus <antoniu.miclaus@analog.com>
Subject: [PATCH 0/2] gpio: Add support for ADG1712 quad SPST switch
Date: Fri, 31 Oct 2025 16:07:03 +0000
Message-ID: <20251031160710.13343-1-antoniu.miclaus@analog.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=R4QO2NRX c=1 sm=1 tr=0 ts=6904def6 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p9Z7yoRph7NKER1LKQcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: m_za6bgTB4Cvd3FGNRdYwR1FsIVlfmNW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDE0NSBTYWx0ZWRfX9IsXHg5XbrJc
 XIJ3MndueIQ1+gcl4ZkobxPXgCRK5hue5teImCut31hn7DbzF8jDONbRuVY9mdjKpZAsMb+4/y1
 lJYcP4fi21C4WcDr7TWTpVfRzx/0vV9rcdilcphTo90ubnuRrtspbyMbqBVGZr7t0oYNdeqS3ob
 LOZJ5qgONx2SiZpk0kUUrNgmmzAXYq2tn79PJniGXrEikeNF32eEBZMdXnCTjkHLYDRowfEsmkM
 epHcE9+oS/gPsD4L1F8nCLusi+0sUWo8mbZPdJd5Y00JQ8OSOBQwMAgeUB/qMRGQNj/hPLSDDm0
 hAUW5yAUNfKFmANyxf+NIopsU+98NxJAKlo1GLTrz2Uc1PV4edRQSDbEtsKcXrmntmJD/6qG+bd
 e655EKMRu0N1BH+c44toshWgpPQ6Nw==
X-Proofpoint-GUID: m_za6bgTB4Cvd3FGNRdYwR1FsIVlfmNW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 clxscore=1011 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310145

This patch series adds support for the Analog Devices ADG1712 quad
single-pole/single-throw (SPST) switch GPIO driver.

The ADG1712 contains four independent SPST switches and operates with a
low-voltage single supply range from +1.08V to +5.5V or a low-voltage
dual supply range from ±1.08V to ±2.75V. Each switch is controlled by
a dedicated GPIO input pin.

The driver provides a GPIO controller interface where each GPIO line
controls one of the four independent analog switches on the ADG1712.
This allows software to dynamically control signal routing through
the analog switches.

Patch 1 adds the device tree bindings documentation.
Patch 2 adds the GPIO driver implementation.

Antoniu Miclaus (2):
  dt-bindings: gpio: adg1712: add adg1712 support
  gpio: adg1712: add driver support

 .../devicetree/bindings/gpio/adi,adg1712.yaml |  75 +++++++++
 drivers/gpio/Kconfig                          |   9 ++
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-adg1712.c                   | 146 ++++++++++++++++++
 4 files changed, 231 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/adi,adg1712.yaml
 create mode 100644 drivers/gpio/gpio-adg1712.c

-- 
2.43.0


