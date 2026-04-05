Return-Path: <linux-gpio+bounces-34689-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDAYEVOf0mkPZQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34689-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 19:43:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9876439F3D4
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 19:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA95230086CD
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Apr 2026 17:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6424F2D9796;
	Sun,  5 Apr 2026 17:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LbX/eEvT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tz8AhwQ0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A592C11FA
	for <linux-gpio@vger.kernel.org>; Sun,  5 Apr 2026 17:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775411017; cv=none; b=NQK0xgHLNwusTQsGVeDOuwkKU06Ibn9jLqJDpmMc1CkKKP64dQ4n2Xq/8k9Q9S5+Cu71Rh2AW9VuA0Zqa7eaPxkiggmekeZLBWYdO+sRZy7IwgDhK+jMex1jykdNjNfAe2jXbODeRD2libuPq9EDyYxWChDxKznu85s3PmyNOjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775411017; c=relaxed/simple;
	bh=8AYutSBNxhirdm3vl5U5Yr1kjyfiBwdfnW4VEpUAZYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sWMrtTrPpq7/lMGS5LTdNmKwesOz75X2Qrk14KMN6pl+dDZV2lJoFyxR3St1MsBqLfsUpLmUMRkqxlCmNvi+9ffTpNpLAgChbYIxbOEbpJzJfx1Wxi8pzxZ1Uz8z0rkfdsBPH5ozKd/fml96MJ7LrCJsIVjYA5KK6r0p7CJ8uA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LbX/eEvT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tz8AhwQ0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6353N4423633817
	for <linux-gpio@vger.kernel.org>; Sun, 5 Apr 2026 17:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5XkM+2yAjpoUaiYNjVRvr//cDFi3N0pFQu5koKYf3aI=; b=LbX/eEvTnzwEFLhU
	I2s5KZPMTioOBcoSRTafPGPgyBceUg//BkyPEuwVpYAPn+r9cIhcI07XxkD7HeOM
	FwlsVgPg3IeA1kyYCV/CDz/dyWHsHqcLD5xckXYDMqIlfgHpqzoMZm/iN3gvNIRZ
	AfYLCSdzqFfUSSyDuEBgs0+Aj6WRCYA4WQrnHeTddq/XeRdc1fUh0wJLFVw/8dUm
	pMSleD8xogqw3Y/H/ztrB6x06i/3+5gGPvPVUfvclpmSHpHbXeP98b7KGzXWsfos
	b9i3Xg8WrL/1hjwH2xTxannEB3IcB9MeqSoiXUuIgFTBqr3TMDZ6e5Q5hxBdsmqd
	U49fDQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daux8asnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 05 Apr 2026 17:43:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0f4e632caso49498145ad.3
        for <linux-gpio@vger.kernel.org>; Sun, 05 Apr 2026 10:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775411012; x=1776015812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5XkM+2yAjpoUaiYNjVRvr//cDFi3N0pFQu5koKYf3aI=;
        b=Tz8AhwQ0LqSRofKTLpyD2IvZhN6EBOBQBw6SndqQ6WqA8wA+jk3AIfTACHZhw/eBMw
         ij/CVPOtWaobZPw+cAMc8GWSQwRRUyWkjDc958sMW2btLJq5sPJaL4GutqGADQr4QuKe
         9ayoLUlVM8rWvlPVVEM4UVG5LVcdKMzrQirycewKDPohWHjtuhIG4IEUGwSxSDKnA4nr
         U6efDJFp+FA+Xp8z3OsL9xTFoCF/IUdrWg0slI1pjCwBuniKJm7liDEGMWcK+szocL2+
         Uub7bHUnZcWz/oQzg2Aa+3Qnvfitq+UZSw22cogSf+mVzr37WtfQ+c/XzTtFtV5tYXGg
         PJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775411012; x=1776015812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5XkM+2yAjpoUaiYNjVRvr//cDFi3N0pFQu5koKYf3aI=;
        b=Cvrj7Zy6PTK4I3iJIjh2FWssy+tHN9yZt9EQVLfV6NJ/5EIkm8lcwFdHvggEQkmJlh
         8fWaM7trS2fM9tBFvUlsaZT2ZWo0/PYspbAyp4NMyAu1XXc4gVWuIX9naEM8M3B5W15F
         JpMhifexLTf0kqdEyUCG0TzdGqnR4e3aR4+xIRpos1mY2v5QAYBUakk+IjV7XqWY+L9+
         oikorr8ZuOuDZM59zuKtflsiB/0ExU+NGFcdA+7fL8ZJ2sJ8XZRM55Fv5cUU2vG1gbyq
         ytI41GDH4lSxsm6aiy8c0iO4OuCUXZy41ij8+fNqr00FBvQEpsyUnI/bbuhojWxxXmhZ
         T4RA==
X-Forwarded-Encrypted: i=1; AJvYcCUMPq/a01ulPH2z+jugaU3BlouSX/z5fE4ORxnwr9BRWNZEEFeE6MDe/LJkbCKwrLSK+xwroh3578tS@vger.kernel.org
X-Gm-Message-State: AOJu0YzwT8Ua6S0O0U2f9SBd8wGfwvh5BODvinijRI64pROnViGbs6zO
	sVFVW1ajHF6WuL0yLfm545LUk6iThnU6VFvFOGhXLE3CQ5v99oXJLdVxH1+A1eEg1Xi2wjb7Gpc
	R3leiSt+UmcQZ2FN1F4QxDw6RH+HXSKVrvLr5/7kxIdJhJoDu6dtmzLbTXxX7GTBV
X-Gm-Gg: AeBDietaKVBnDQTtz58vYjBL59SrZF1VKU9gvMnbRvW71Dzpl0dWLLr2610ejQydduB
	zPLJIspCNw0haJe0dVtjeT1nP58qtPawVarYlTfZlAzbf+81cJYrX/fLUhr3CWGKAW8Rlm4ebkg
	n9JcTuxpgNhbXvGRw7ZuZS3weBNfgnf71f0lMdBPA7gPN3S7pw7GIz/veOgPOAfUBjTIDykBjET
	s9wkcB3IUnzVj2XTiY9f0EYd2SWehDOHfosTVUEcRms2wswZKqTg161N7rjLGT40hzmsvvOMw09
	j7wgCY1ym4kTdoKWF6DYrCp4BRbBaxzSKJXz6qBScj5wCRGAuqAe9ZGfxI1p1ubPOkYK7W38H/i
	RPBBBA3gHUeJZ+0YDHU7A1JcK5+urvp9srSAXQbtnhO41CG2YQLIF
X-Received: by 2002:a17:902:e547:b0:2ae:6092:8d93 with SMTP id d9443c01a7336-2b2818329f3mr106632605ad.28.1775411012017;
        Sun, 05 Apr 2026 10:43:32 -0700 (PDT)
X-Received: by 2002:a17:902:e547:b0:2ae:6092:8d93 with SMTP id d9443c01a7336-2b2818329f3mr106632465ad.28.1775411011488;
        Sun, 05 Apr 2026 10:43:31 -0700 (PDT)
Received: from [192.168.29.179] ([49.43.224.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbd07sm104541985ad.72.2026.04.05.10.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 10:43:31 -0700 (PDT)
Message-ID: <49d6b663-89e8-4cae-854b-08ba4dd9268c@oss.qualcomm.com>
Date: Sun, 5 Apr 2026 23:13:24 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pinctrl: qcom: add the TLMM driver for the Nord
 platforms
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com>
 <20260403-nord-tlmm-v1-2-4864f400c700@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <20260403-nord-tlmm-v1-2-4864f400c700@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: n9VTyi8SYstdFW9VJsWJXVrwolGpdxn3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE4MCBTYWx0ZWRfX5CmcsRDEUssd
 ZjNRTl8NIKc79gXV/RB0dPcubkFvyxRz82xheQcK0b84y4okGXBlgnQRfzeRcWsA6Uz78yGXILs
 JxHUK/tc5zfBXGiPE66fjobvrH9Yvlc/lXxEXWLrD/fJI0W7/mVegY1PxSPuEz78b8Ah1BoQ8sc
 VHmGaJIvmm1m5kdgOlEBFFfCBs5HcWG4oFrLxu/oOO/Zxm3gL+8GJrSfLYFQZA2eOQYN22EYFTx
 9hiK8l/+0zvZbOT0eaGSwo3BzylNMu1jjxqz/SwYxIRe0vUTKncOKIDf1L6QctXnV8C2sqxFvwm
 JwvjNQnO9UoWP+EzJLxiqjaslEi2heuJQRDUCdyJzhtXUxv+oHMRsFl6567aZBcvVeH5Btt52c4
 LeTA8qRfTt4MfF/iQX7G4xDxSieiAWWhRenpjR0acju6T7/O8MTVKpcwNqXA53Luv3b9kHUeBFO
 4cTRMFwvg/RP0kmyvWA==
X-Proofpoint-GUID: n9VTyi8SYstdFW9VJsWJXVrwolGpdxn3
X-Authority-Analysis: v=2.4 cv=AuzjHe9P c=1 sm=1 tr=0 ts=69d29f45 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=oIx2Y1K4xXJD395LZaDjnw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=mS-AFIv6WIZp_N3KX8YA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604050180
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34689-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,arndb.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9876439F3D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/3/2026 6:57 PM, Bartosz Golaszewski wrote:
> Add support for the TLMM controller on the Qualcomm Nord platform.
> 
> Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm    |    7 +
>  drivers/pinctrl/qcom/Makefile       |    1 +
>  drivers/pinctrl/qcom/pinctrl-nord.c | 3297 +++++++++++++++++++++++++++++++++++
>  3 files changed, 3305 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
> index 6df6159fa5f89f9f0470e700b4698dc8849ed515..6698e2a50b2f67b1aadb4a840339e769c92f95f8 100644
> --- a/drivers/pinctrl/qcom/Kconfig.msm
> +++ b/drivers/pinctrl/qcom/Kconfig.msm
> @@ -261,6 +261,13 @@ config PINCTRL_SA8775P
>  	  This is the pinctrl, pinmux and pinconf driver for the Qualcomm
>  	  TLMM block found on the Qualcomm SA8775P platforms.
>  
> +config PINCTRL_NORD
> +	tristate "Qualcomm Technologies Inc NORD (SA8797p) pin controller driver"
> +	depends on ARM64 || COMPILE_TEST
> +	help
> +	  This is the pinctrl, pinmux and pinconf driver for the Qualcomm
> +	  TLMM block found on the Qualcomm NORD platforms.
> +
>  config PINCTRL_SAR2130P
>  	tristate "Qualcomm Technologies Inc SAR2130P pin controller driver"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
> index a8fd12f90d6e6f8e139097cc0a81d6f178f09000..ba6e9408373ff4327bb0c092f1f30889998503a1 100644
> --- a/drivers/pinctrl/qcom/Makefile
> +++ b/drivers/pinctrl/qcom/Makefile
> @@ -35,6 +35,7 @@ obj-$(CONFIG_PINCTRL_MDM9607)	+= pinctrl-mdm9607.o
>  obj-$(CONFIG_PINCTRL_MDM9615)	+= pinctrl-mdm9615.o
>  obj-$(CONFIG_PINCTRL_MILOS) += pinctrl-milos.o
>  obj-$(CONFIG_PINCTRL_MILOS_LPASS_LPI) += pinctrl-milos-lpass-lpi.o
> +obj-$(CONFIG_PINCTRL_NORD)	+= pinctrl-nord.o
>  obj-$(CONFIG_PINCTRL_QCOM_SPMI_PMIC) += pinctrl-spmi-gpio.o
>  obj-$(CONFIG_PINCTRL_QCOM_SPMI_PMIC) += pinctrl-spmi-mpp.o
>  obj-$(CONFIG_PINCTRL_QCOM_SSBI_PMIC) += pinctrl-ssbi-gpio.o
> diff --git a/drivers/pinctrl/qcom/pinctrl-nord.c b/drivers/pinctrl/qcom/pinctrl-nord.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..82e519abaf75771817a0f811c6af80c4f98e93ed
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-nord.c
> @@ -0,0 +1,3297 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.

This should be a year-less copyright as per internal guidance.

Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

> + */
> +
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#include "pinctrl-msm.h"
> +
> +#define REG_SIZE 0x1000
> +#define PINGROUP(id, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11)    \
> +	{                                                             \
> +		.grp = PINCTRL_PINGROUP("gpio" #id,                   \
> +					gpio##id##_pins,              \
> +					ARRAY_SIZE(gpio##id##_pins)), \
> +		.ctl_reg = REG_SIZE * id,                             \
> +		.io_reg = 0x4 + REG_SIZE * id,                        \
> +		.intr_cfg_reg = 0x8 + REG_SIZE * id,                  \
> +		.intr_status_reg = 0xc + REG_SIZE * id,               \
> +		.intr_target_reg = 0x8 + REG_SIZE * id,               \
> +		.mux_bit = 2,                                         \
> +		.pull_bit = 0,                                        \
> +		.drv_bit = 6,                                         \
> +		.egpio_enable = 12,                                   \
> +		.egpio_present = 11,                                  \
> +		.oe_bit = 9,                                          \
> +		.in_bit = 0,                                          \
> +		.out_bit = 1,                                         \
> +		.intr_enable_bit = 0,                                 \
> +		.intr_status_bit = 0,                                 \
> +		.intr_target_bit = 5,                                 \

Similar to pinctrl-kaanapali.c, Nord platform have these bit positions as,

 .intr_wakeup_present_bit = 6,
 .intr_wakeup_enable_bit = 7,
 .intr_target_bit = 8,       


> +		.intr_target_kpss_val = 3,                            \
> +		.intr_raw_status_bit = 4,                             \
> +		.intr_polarity_bit = 1,                               \
> +		.intr_detection_bit = 2,                              \
> +		.intr_detection_width = 2,                            \
> +		.funcs = (int[]){                                     \
> +			msm_mux_gpio, /* gpio mode */                 \
> +			msm_mux_##f1,                                 \
> +			msm_mux_##f2,                                 \
> +			msm_mux_##f3,                                 \
> +			msm_mux_##f4,                                 \
> +			msm_mux_##f5,                                 \
> +			msm_mux_##f6,                                 \
> +			msm_mux_##f7,                                 \
> +			msm_mux_##f8,                                 \
> +			msm_mux_##f9,                                 \
> +			msm_mux_##f10,                                \
> +			msm_mux_##f11 /* egpio mode */                \
> +		},                                                    \
> +		.nfuncs = 12,                                         \
> +	}
> +
> +#define SDC_QDSD_PINGROUP(pg_name, ctl, pull, drv)                   \
> +	{                                                            \
> +		.grp = PINCTRL_PINGROUP(#pg_name,                    \
> +					pg_name##_pins,              \
> +					ARRAY_SIZE(pg_name##_pins)), \
> +		.ctl_reg = ctl,                                      \
> +		.io_reg = 0,                                         \
> +		.intr_cfg_reg = 0,                                   \
> +		.intr_status_reg = 0,                                \
> +		.intr_target_reg = 0,                                \
> +		.mux_bit = -1,                                       \
> +		.pull_bit = pull,                                    \
> +		.drv_bit = drv,                                      \
> +		.oe_bit = -1,                                        \
> +		.in_bit = -1,                                        \
> +		.out_bit = -1,                                       \
> +		.intr_enable_bit = -1,                               \
> +		.intr_status_bit = -1,                               \
> +		.intr_target_bit = -1,                               \
> +		.intr_raw_status_bit = -1,                           \
> +		.intr_polarity_bit = -1,                             \
> +		.intr_detection_bit = -1,                            \
> +		.intr_detection_width = -1,                          \
> +	}
> +
Remove unused #define SDC_QDSD_PINGROUP.

> +#define UFS_RESET(pg_name, offset)                                   \
> +	{                                                            \
> +		.grp = PINCTRL_PINGROUP(#pg_name,                    \
> +					pg_name##_pins,              \
> +					ARRAY_SIZE(pg_name##_pins)), \
> +		.ctl_reg = offset,                                   \
> +		.io_reg = offset + 0x4,                              \
> +		.intr_cfg_reg = 0,                                   \
> +		.intr_status_reg = 0,                                \
> +		.intr_target_reg = 0,                                \
> +		.mux_bit = -1,                                       \
> +		.pull_bit = 3,                                       \
> +		.drv_bit = 0,                                        \
> +		.oe_bit = -1,                                        \
> +		.in_bit = -1,                                        \
> +		.out_bit = 0,                                        \
> +		.intr_enable_bit = -1,                               \
> +		.intr_status_bit = -1,                               \
> +		.intr_target_bit = -1,                               \
> +		.intr_raw_status_bit = -1,                           \
> +		.intr_polarity_bit = -1,                             \
> +		.intr_detection_bit = -1,                            \
> +		.intr_detection_width = -1,                          \
> +	}
> +
> +#define QUP_I3C(qup_mode, qup_offset) \
> +	{                             \
> +		.mode = qup_mode,     \
> +		.offset = qup_offset, \
> +	}
> +

Same, Remove unused #define QUP_I3C.

Thanks,
Maulik

