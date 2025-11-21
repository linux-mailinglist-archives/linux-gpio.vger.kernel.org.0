Return-Path: <linux-gpio+bounces-28950-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E5472C78F15
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 13:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7E8504E7397
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 12:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB78434AB05;
	Fri, 21 Nov 2025 12:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="o/VDd+s+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1987333859C;
	Fri, 21 Nov 2025 12:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763726934; cv=none; b=BnI8b95mPmKO+G12lwc0dRJ0pdqi+Nwpj84dUvEFXcvE0zOoEr6LYcGhIakhcoeX8KJoDE2AOE+43drXNoCQYszFLMKAdgYuLaPVvhXLyJS2TeHoGabhngQlWiW5zLGqYHC5HYwy1PxacHxbJkVKLxHg9lTEfL2dWeLvxb6txjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763726934; c=relaxed/simple;
	bh=yKv6JF5w9xBa+2ruAA1v7DI/h2uq7mDwBenuqX2C0rs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DFpXv3Vq9Hh1bMrTWxf4w7hAgrUfEqJFTkzz9oAnCXc7nI88bxyao3OF+O3UPJL08kVaT5brjq5ATLTC+5ut5hwc1oDXIrf+EuBGDzHBAdcqTh7h9akyBbhkhhJjv2GMBxh0KowF5Tr1BiR2gBvFjojBr5p9V/pKdFpgx11hAJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=o/VDd+s+; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALAIolM1922873;
	Fri, 21 Nov 2025 07:08:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=/Y9UyCA5/JtqHGoWXnfktK7S+Y7
	UyNfGAIv5yUE3JlU=; b=o/VDd+s+eNiyVSurTM6tiYRHy5uX7OVLsy4gyVXOFqF
	Zf+eQqedY0sjmymP00fWEuWS1zoCox736x7kw6ubUHPPJqPP1pgeroa2aURkJIGF
	RCqXRaUr81OCNG9JIkFBvZKgzMewzwrxDeG1zcg/pFaKjn2Fb6YR6EbEEzrbp1xH
	m+9DFswMZ4VMhEhPRnkefssLT2Z7ovNG77JS5g0EYNpllIedEiD5ub5ucy4gWIE1
	XyHN7InzobkpCE6kM/xce2O8ndNtNofh0czSrPAk+AN5DmsTjYJQkGP4kuXJlt25
	D8FnuUGSy1rrTKTTrDxiauUNKrK8O4M7w1Xh9c5BRMg==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4aj40c5vyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 07:08:36 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 5ALC8ZOI022172
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Nov 2025 07:08:35 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Fri, 21 Nov 2025 07:08:35 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Fri, 21 Nov 2025 07:08:34 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Fri, 21 Nov 2025 07:08:34 -0500
Received: from Ubuntu.ad.analog.com (AMICLAUS-L01.ad.analog.com [10.48.65.187])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 5ALC8G73001559;
	Fri, 21 Nov 2025 07:08:18 -0500
From: Antoniu Miclaus <antoniu.miclaus@analog.com>
To: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Linus
 Walleij" <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Antoniu Miclaus <antoniu.miclaus@analog.com>,
        Srinivas Kandagatla
	<srini@kernel.org>,
        David Lechner <dlechner@baylibre.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH 0/2] mux: gpio: add support for ADG1712 quad SPST switch
Date: Fri, 21 Nov 2025 11:57:30 +0000
Message-ID: <20251121115750.20119-1-antoniu.miclaus@analog.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA5MSBTYWx0ZWRfX7v/0DdvWDMVW
 Bj7UGm2pqMfEu3c5oeqK1W/nhFGqj2jVQk32Tmrxwqs9gSdohFJ7a2l+EyPMtBmcWSlg/7HiHDv
 Dk8cfKCYEIgD+uyoa//iDOZ1pFzhy+9Jq9crQ9YszCTd9B3Vy0xVRdt8XL7knlwTG2iRJHDgluI
 XUEcc5g/MG0psAFYT1ogbAqRBKBuGLfxMFgbzj2ob8nKOrz/MBLjUvxof3/otPOwOobSAEqLWCw
 b9flIqB+6m0Y3lIcrHWxQY5ZTOVt0CdbXFGpYHRp08JlwGCB+jydIix4x0fXFUVqTfde9FQUFAM
 OKt+/2j5PRPbRJ/Irfr5/0FXapWdf2IZJn6LFowCMZT01e1GtX68Cnv/eFYQqbq2uH9a3wfmM8H
 kt8MY+5tfPYEohl1bUaQa7wj909MkA==
X-Authority-Analysis: v=2.4 cv=DvhbOW/+ c=1 sm=1 tr=0 ts=69205644 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=_9JmMCc7Zck6k1b01VcA:9
X-Proofpoint-GUID: 42L4CamaSu9bO8IwXpmGwnwQHHl1uNGB
X-Proofpoint-ORIG-GUID: 42L4CamaSu9bO8IwXpmGwnwQHHl1uNGB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210091

This series adds support for the Analog Devices ADG1712 quad single-pole/
single-throw (SPST) switch to the existing GPIO multiplexer driver.

The ADG1712 contains four independent switches, each controlled by a
dedicated GPIO pin. Unlike traditional multiplexers that use GPIOs as
binary-encoded selectors, the ADG1712 treats each GPIO as a direct switch
controller.

However, the existing gpio-mux driver architecture handles this perfectly
by treating the mux state (0-15) as representing all possible combinations
of the four independent switches. The existing mux_gpio_set() function uses
gpiod_multi_set_value_cansleep() which treats the state as a bitmap,
setting each GPIO according to the corresponding bit position.

For example:
- State 0 (0000): All switches OFF
- State 5 (0101): SW1=ON, SW2=OFF, SW3=ON, SW4=OFF
- State 15 (1111): All switches ON

This approach allows the ADG1712 to leverage the existing mux framework
for switch control while reusing all existing gpio-mux infrastructure
without any code changes beyond adding the compatible string.

Patch 1 updates the device tree bindings to support the ADG1712 compatible
string and includes documentation and examples.

Patch 2 adds the minimal driver support by adding the ADG1712 compatible
string to the existing gpio-mux driver.

Antoniu Miclaus (2):
  dt-bindings: mux: gpio-mux: add support for ADG1712
  mux: gpio: add support for ADG1712 quad SPST switch

 .../devicetree/bindings/mux/gpio-mux.yaml     | 24 ++++++++++++++++++-
 drivers/mux/gpio.c                            |  1 +
 2 files changed, 24 insertions(+), 1 deletion(-)

-- 
2.43.0


