Return-Path: <linux-gpio+bounces-30561-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AEAD1FD98
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 16:40:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B0325302DF0B
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 15:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D446E39E196;
	Wed, 14 Jan 2026 15:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nd+c0nG/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OIbEqfQu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E12739C63C
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404631; cv=none; b=C8s42pzcPP2w+qF01ewVPnkFBD1Y7D6/pDlZZx1HiCvhHyaxUTckkNxedB2fnvus0p8pbSZE/2MX9PEyZ+UZ6gukIX+102wXcKMODHTrnXJTO8LRDkp1xoBsxL8bQhRBsx25gT5kIFWHXZ6bJvm4kfg6i8ivhazE0t159sXCZdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404631; c=relaxed/simple;
	bh=vQTc4Cx1cuzPah8LLXL26kybe/0nRvPEYAbDNlVXaL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cEIBlY2HGQoW16JHgEbW4nFJNtt80Z7/qT46eAIGhyfpFfAFAwN1ZwygHx82QDynlKTjMFg3GhV+KbVtkexDW/TzdEaT+VNV7psE4PFdj4A7NLJnPPXjYS1zunMrJF86ytxnrOFhjbQqPREcxExTht7yuzUwgDr1nb1P0bPIpbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nd+c0nG/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OIbEqfQu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EEqlsd147900
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TQOWmZ4i8qr9JpAuK61Y9RoWdOmJcEUPWfdU+wHADeY=; b=Nd+c0nG/FDs7XoIV
	szExDaUVSYkyrbiaHalQ7Ap9+Ae6UJ/LuHmENsYmw2Y917XAkpOSA5PDn/ucsIXw
	RLjTwBfwp+vw9JlBmnZtHYYPA+nuxAqdd1pB4mQdMxi8gLqJiqMqFue9dtxzWhhw
	z2Mh4kP3YONo/VwuqMbCWqIdg2ZulAZiBjr4/v+VsHOzRPeea0BMSLLBuepXEfaK
	4TcnFo8VnR36XVqUEY+VzZlVDB5GSRQreJSVMoii0SAdOXRljAxbNb1718WPAMnT
	H1EH+vCGRqzwWc6iLgCOM8ppr/Cv0FkS9cCCOv2YBPPewR6rimIDRchIvZsKHfwn
	UwREZQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp6rahpfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:30:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb9f029f31so2434645185a.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 07:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404627; x=1769009427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TQOWmZ4i8qr9JpAuK61Y9RoWdOmJcEUPWfdU+wHADeY=;
        b=OIbEqfQuEsJ62aOqijb1PiYYM9T2GlsIAVt+6f4ABGLR6IB82zCzq3cW3afO8XOxuM
         xIWhUOG1QjUtOCQhxN8BrHQgagQKXRCWNngiFlFZgmrxAqKWH9YLYSNvVRBwEFEWaIc8
         qudl/uycwLDPNuCWbwou2ZqcBMRxDPpSotukSz1IXKuKivBTIpP50rlMelEf16F2+crb
         nVMDtnMEWW493DO5CLYZzeU/VbQNPjjPrxtbNgQtuY03GD9UK9SXKaqr8XO3kDcs8Il7
         M8fBnEXhuM/Q8p2V8typGVJGJFeYK9yYImFyKKIcwp2qESY+Dc4qTx4V4C4DFZmyvuhI
         9hbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404627; x=1769009427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TQOWmZ4i8qr9JpAuK61Y9RoWdOmJcEUPWfdU+wHADeY=;
        b=QuLIwxRqNemUfNGj/VR3Wk89Z4g9hCRIsXMccuv+dThfOgtubhb24cf4Nn+9jg/1kL
         WjElnvYvTrRVNvpr/IOLz/+gzUrsIvw+S2ePI/a7icO/N7ctyFoJ3tQPCH0fy1jWNY0m
         OQeif8KioTEw1Kq00kxhMJqe64HswFiHzIrKza9PhCAn5/RZtjMW906VuIGhRyIInb8P
         4vLoayWUS5trs8+fLt1BgOf9GaLBO6qVr3L1N2a3YSaN4OnC3UgGXb9cg76rokRrziuy
         Jt7VcaxgiuzsXATECiaqSOD3NIzGILVL8BMOVxVXx+xENB/zqFDIqEWWiDW2KkTustv0
         mi3A==
X-Forwarded-Encrypted: i=1; AJvYcCWkBlaWUkw+sLaNpz5Z39VUBJN55spHzXJ+Ld0rBbl7TH79HJtuWIIIxH4etcM6Qjc/k8MZF5JH7SWt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2uEs0YMvaq5QXwdGLbiAwCtej5UXosWx8EpN+hGQiCaoHym+b
	t3JOaZkaZVRImQBt5CCezurxt/lhp/4krKAIMPaD8xdy1B7T/ciYG7YSZ9YMx83P7ASYnRXNquJ
	kRCtnMMHq61aJMdvFqOHeoAk/s2QoarG/iF/MK11DdmVvMdXxUJrniB0v1DNxQdAH
X-Gm-Gg: AY/fxX5pv6TjSZAbUMO1fEp/azZBFS876Q4GmdOUIVkcdYwpEIPOwNWaO2gxiSmLTox
	wVr2AsZpxQq6rfYcjCtN8Ktkmnp4UxA4BWD08JB1n99yT6F+0+Uw/oQIwnZ0Ep+x4QmK8n/60MR
	9LJATHWSejX9nMG8pCjn8Etd18q52atcIPelrvXLCdnZLLm2n3yx62C8hwqnMuSvd3XUPJJlfIK
	E6fRZwh0vK+unj/G2Cqp/u+TFfz75w3dTSCBydWjDKfJvb43oIF+CvPDapw4GH+CZIXMAcB/VCk
	+NthA6tZchxGyoWhfCwXJnwJIfrj40O1PPAM21Kony4jtAVOKuYdkqL7JTCaXDzHSW1mEMd7H7z
	0U99ExJNPgjBuN8CNWbCqjzb8KVYAgWdv1A==
X-Received: by 2002:a05:620a:44c4:b0:8ba:5255:107 with SMTP id af79cd13be357-8c52fb2406emr386805085a.18.1768404625655;
        Wed, 14 Jan 2026 07:30:25 -0800 (PST)
X-Received: by 2002:a05:620a:44c4:b0:8ba:5255:107 with SMTP id af79cd13be357-8c52fb2406emr386788385a.18.1768404624120;
        Wed, 14 Jan 2026 07:30:24 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:03 +0100
Subject: [PATCH 02/11] pinctrl: starfive: jh7110-sys: Cleanup header
 includes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-pinctrl-cleanup-guard-v1-2-a14572685cd3@oss.qualcomm.com>
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Hal Feng <hal.feng@starfivetech.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=906;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vQTc4Cx1cuzPah8LLXL26kybe/0nRvPEYAbDNlVXaL0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aBbIM2DWPBQNuBnGlAmRqfublmk+ABnSOCP
 +eX7CJ/kqCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2gQAKCRDBN2bmhouD
 13B7D/9HNpUgwKflmRiVEQKiqAHJlihytGsm6xhqvuPk0OXM6g4wK8KWJ7AoXqklkhVGJfLYvjS
 EVoKICEkLULEFDlMFEFKdNqN/uGc1TUwNp5gMcRJRrlIE+ZYvRo4LIknCsvHV1jT9i+Y2L23c3p
 +uDVB8dH2uwJv3IuhJUnA1gGMQM4xpw4ac7NB+UCOk2LnfcACtKncHKQ7jr4vbc3O0f3pfTQpJp
 dZkWVtWxp4BQm+5d1XuZwVzvgj4b/xAJcvhU0BzFKw41RORAakfzsVxAkTHHtP62LHFxnKZSwKi
 E8XvqOwq5O+74OFdv+vHFLcG/6f+rPsNDMLHCxupzCLkx6Pwqg6qJp9qYbsQJCEuj1EJyrotryy
 ANOtROt7QabL1HCVBOeWE7/I1c/PzdUslygkZyhowuMmtTrgMAsawR3fzOXHuQOQhjeKsN9lt/M
 fx0zuszc+shjokj+huAOTlufmrLlWzFxqM4Hu67hEma3ScG2iv485ncOEg87MQQpuFfjrtb+vDK
 ICaUVJAoHNSRifaTDmw6lMDG1ZAAU7vvujZpio8eHVdgOh3jPCnAMmeTePFgqI8N3JIJ+bkQyuz
 2wHidhJCNQckjPlFZ10HKxqor1PXsDvliPHX6i68yW1W61YZ+wIbn5bOmZ0GIDO6/jOlooNoy63
 tkrtX+1GbUIJE4Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEyOSBTYWx0ZWRfX7H9ToYtzLei5
 qe+dpF/W2ogWr6gv70843Rr5Xm2xtZwy5G1kFqtEkQm3mvKEZ27GelvKvwGVd5Lo5uNd5m0F19f
 LtzU7hOy7nQExkF4fFDr/gZQWzpKGOaYq/pLJ+Sls24MzR+z2rAm4qe+Yhz0bcE3mszcHVfteRR
 DEjqYmCVrAVJub79KmXrdIlVFfGWfqNZ3pC3w1bkVtm86gq48UzPcgx93/LaqNLqd80RW+UPXjv
 0TBRIAx9M1ZeIhzQEX4ZpGxEPxLIBr5uFFKsggcR9/BKlUepPmZVL8qoAIb1a30RVcYn8wwey7I
 4KAJOrNbWMlqkSx0iPf1voMR4Z+0eqddah68821TfUmi9mid0Ehb68eCfmgrcH8Gbl7O6WoE+Rd
 aKybTHcFNjZ7MpLGLtLi4xuQia+YsqzfedJLfa7j7g+2CefY9JcU7x41j1DptGe66UPATXqXYnM
 2WBVLQQ+CoiiLDPDHrQ==
X-Proofpoint-GUID: l-5R1z8qs7drxjAPP4__YuNEzMhglqhz
X-Proofpoint-ORIG-GUID: l-5R1z8qs7drxjAPP4__YuNEzMhglqhz
X-Authority-Analysis: v=2.4 cv=L/EQguT8 c=1 sm=1 tr=0 ts=6967b693 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=b-TtO4hhcUHcL_E8iecA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140129

Remove unused includes: no clocks, mutexes and resets.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c
index 9b67063a0b0b..44f84e4c29bf 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c
@@ -7,14 +7,11 @@
  */
 
 #include <linux/bits.h>
-#include <linux/clk.h>
 #include <linux/gpio/driver.h>
 #include <linux/io.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/platform_device.h>
-#include <linux/reset.h>
 #include <linux/spinlock.h>
 
 #include <linux/pinctrl/pinctrl.h>

-- 
2.51.0


