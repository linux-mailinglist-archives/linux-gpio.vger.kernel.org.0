Return-Path: <linux-gpio+bounces-33753-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDVNDhaxumkVawIAu9opvQ
	(envelope-from <linux-gpio+bounces-33753-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 15:05:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A828D2BC95E
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 15:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C3EA630464D9
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 14:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89BC33D9DBE;
	Wed, 18 Mar 2026 14:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GJY6cqrp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W2V64EKC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2E03D9DCA
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 14:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773842481; cv=none; b=XCwzGrTpScXz3VJNZT3m5ODeMaJzmK5pJ5p7opWuy1QnmCbl/bzGz2xc5WhkEuQpjTxtWykVuUNZ36dqw2cjfyqjSj9P9yThiprqTzSTSyVxyfL5W2FIvXdE/5BIW31E/Ypl+TkvnhFphuhKWIkVdjittQXUiyzwewePPpC4WP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773842481; c=relaxed/simple;
	bh=ubpNCg+eCquK/K4zeAZFihfdGgYEzRYx81jkET3tDO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pVXfBGmuwxNGEk/XQvr8p5DnUVpoG9IaysYrtZLexInogbcbT2J5DxY9uOv5M3oz5ABpQZMR+ymx7AasSzfMcL4cjEGjyJf/oLIA6IrhMEnAJ0t0ILWhHrQ6MTOT2HYi0FoQezVkUFRZgf/Dg+dtPbzgzf+1/E3xDbmRnr8g09w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GJY6cqrp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W2V64EKC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ICBVH8909242
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 14:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	36+wA6uuRwTHM8WRBDoOkT5gScbIDxHTx6NZKKyP2iI=; b=GJY6cqrp3uRljkIR
	K9OAgHcieKrbz8qJLYsmiTvaHsiwHohA3Uex9QORM5ajOcbhc488o/dg3Uwu/NEv
	ZfC5QEdGfDy8uGQz6rcIRWrz/Rib2M6VCkWsmEwYbEEv8vv3Xr84KKwXXzjuAZWK
	BTgvEMreEBvBP9mqKQGbDuzrXw/fAFerl9s9nvsS185Msp4XO0TE7FEWfVv2vbif
	m2hN88JO/LogvU44dANtxNaHSBFib5YFZmgO3rKjHaS72T6Vny8Sc/wdcXu62wff
	TykDG3BtwN5QPvaDBlBrOp2NwZ+nSlVUmwX9Rj1F0elnEgJByYnj44SFnQT2zgXz
	1rk1vw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyuucgcqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 14:01:18 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-602878b0398so573423137.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 07:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773842478; x=1774447278; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=36+wA6uuRwTHM8WRBDoOkT5gScbIDxHTx6NZKKyP2iI=;
        b=W2V64EKCDajW8ou0Mcdh6B4wMt4fbTT7XAOfr3MZ/kEWRhQromcWl+91wp9CpXMnsq
         k0Vlk7k09HseLpQgilxIxTEw5Exv+OK1zVTHXPZtvCB9+rHVctaGPcOZnztkuemY3YnS
         ntqJOpVuAfQlmCZu7u5Svy2/YLnTTvsA5pwwKWgtyOPJWKVnK8k+vhuYTEFCDO34TZEk
         zaNbxbKeZp2cSwGhtzkM0BGpb5zZc3f7x+OO5lHOX1xz6eQ6CHCVYq0xVM7L9CP3oLhW
         tpWm0kICo0d2V5A5dn9BRLFekxUxVl1P5MjYaekfpcux8hPu6GqAFtHaI4C0O9eCDZy0
         F+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773842478; x=1774447278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=36+wA6uuRwTHM8WRBDoOkT5gScbIDxHTx6NZKKyP2iI=;
        b=DhcrBauOsaA0RpgquIZAeceKRGS16UvkL8h9zwtwvX4yXt9HqfhZu59h8npp+eKmdA
         WDaklVMo+swiTH4QUn1gI4FLVcJwoYfoCYhnVUgDkwthoOADyrJzvk8RIXaXS92WVEcU
         YshXcRxM4XLt0i+18uHR57hgZzL1+na18+D0hl13ZzcdFIx3LWMdJUkMdXqNRaymKs3N
         iamla8At6Px7OASvZwgra6aUDwVb7S3WsSAWEE5EZwEbJYL8O3Q7h8z90TJNSjCtrUTi
         mXDxxN00s+oB61SdjBABiJeu1G/sSF15UrxUaOyDmYaWYymN9rf0aAYTVYbmABlFKhJr
         y4SA==
X-Gm-Message-State: AOJu0YwZbS4ISvubMvcu3ei4u2VxdFTCSeO/a2FUu+CJao3dDMrdBV3e
	LzgtRp4kXjquLRItGHh3GRzWWeF7Dif3RsBn10LLXKsXI3pYqf99Pel5+jnjDCYVCfPyRPNZTFs
	t+qlmBQpkmMrKcuQ0eJiGStYR5spa2HEVEB06E9qUMVq/nf2kb6j2IgKl0eFlus7bU6yzT5Gf
X-Gm-Gg: ATEYQzxakHFGubLBqYeWj2fHz+8P1ioEMxO23CzVIvBxdbpOYVoeg4VWjQBGb1CVuqV
	QL1Hy01wa/eR1FSNrQmchyaohh/PVv7Duul/K/ODQF19eUKFpQrsMvQlqTGEwEn2QllcMesmZ2c
	tEV9jqc8luB4gy5Dp8NYMdTshiEtwHKNW77ru3MgOVRtKlW2IcNcolVEpro7WpVdh/AdGFUsKBf
	AQGgvV0J7MdMTmYlbhk3f6Nz3KkH5pj+K4dI1PEVzz1DBUo1hE3LBnajkoHdWQUxzc/5GUj6zYD
	Q55NUskiN8GMHF2nzII+CpvXe4FSnie751uCeSuYlGf5mhNmAU39gX3juQj6XVToWakt//ENDW+
	HhVdzsBihFDDOJEtbvfyna9YISIqWDMg3FDzDr3O7CwCs/mlzRvFZ
X-Received: by 2002:a05:6102:c93:b0:5fd:f509:c97 with SMTP id ada2fe7eead31-6027d2e45d2mr1342713137.18.1773842477639;
        Wed, 18 Mar 2026 07:01:17 -0700 (PDT)
X-Received: by 2002:a05:6102:c93:b0:5fd:f509:c97 with SMTP id ada2fe7eead31-6027d2e45d2mr1342383137.18.1773842473091;
        Wed, 18 Mar 2026 07:01:13 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:b8ec:50c4:23a0:2505])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f144e53bsm214207566b.25.2026.03.18.07.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 07:01:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 15:00:53 +0100
Subject: [PATCH v2 1/2] gpio: shared: call gpio_chip::of_xlate() if set
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-gpio-shared-xlate-v2-1-0ce34c707e81@oss.qualcomm.com>
References: <20260318-gpio-shared-xlate-v2-0-0ce34c707e81@oss.qualcomm.com>
In-Reply-To: <20260318-gpio-shared-xlate-v2-0-0ce34c707e81@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4236;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ubpNCg+eCquK/K4zeAZFihfdGgYEzRYx81jkET3tDO4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpurAiV0trUWpLMD6yT4Jeil+kPSMu1YX5vbP2I
 0MXarRPmVmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabqwIgAKCRAFnS7L/zaE
 wyAFEACC3znYtj3MFeRpHPQanS2Fg25LyegJqVKr17u6WhOBTh7ZHeL4BltPOLZvXM9T8uJK9FG
 wa8TzWSKzzb0vzATj7lCBCdZAewjVByfrS4UKMYXbBF0fdKGyX7Ma6VPzv65wlc9UdSy04FB1fN
 Wg/RCKGImfUkQjjtWCqDIB4DTTRR8CQPGYT4tZn8ohMEYmSXJ+ilpMwBgr8SHoHCB0lXm4st6bH
 XRVCmTfJJdOHCq8Hzs0Vifs6P9u/fpHc3vepw81a+zlaOYW9hhAeZKoaTeHIbG7wc4sIdZS6NuL
 1ns5DEbwyvWwfIMhPgClYwQQixDXT2HoBduFKSYrIX1HoWKyHGZEr8MviDKy6WU5PIkfhzv8SQd
 7MrO4kUPwClil3MU86Pgeng0S5+ZIn57Fz2/HUOo2nVwmttblzEcxMpnMO/GMW8sDODBd0mrWaT
 cudJlRKAYdjbW9REdaPiolqAi2VHiKW/FnHIB3n/zmVBT1MLIpWsZ6V4enDZLNlI0AzVgpbadLU
 y0SJg26Y9c0uAZUdCZR86USnQNAwshNS+LSFqOd898FT85reyxfVP5XN2l2pjnXtg4d0Z79Zi0b
 u4HsI9gP58vUPq7d2al4tw+kZ3/agGbVcuqYLfJIUEGQtggm5BNX4tCTKOZH5+HG4AGiqZ+/MTD
 CDUhM1WTCKXdOtA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: yJXenMCFGsnC8LbaF_zEX9tEkJp2gG5Q
X-Proofpoint-GUID: yJXenMCFGsnC8LbaF_zEX9tEkJp2gG5Q
X-Authority-Analysis: v=2.4 cv=U4ifzOru c=1 sm=1 tr=0 ts=69bab02e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=hgUgvgRoQYGt6P0yErkA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExOSBTYWx0ZWRfX7spOOdfO20Mw
 4+m/f3B97Gqz+213DtXu1fGZsArAHxeR0owAg87vwA5stD0kFBYqwhLq2ci996LFpVtNSIEFNm4
 cfQ7wgopxK9TTyNF4fgtvj1JUxKjWVYEqX4SBJfejGZ6SVUejAvXYEBVhWUTe0iPs5DPeZ7SylN
 L4hnzfJblkwTwIVb7P3eMwuLvck8i+8HrfHJJ9b6/PgOu7cqa/cvx76ePZXStU8ceeC4Aia8mgZ
 I3hpxSfFPSaGzmkOX28P0VAVtq1nEOC2sc0SsOaa0cqwI2yvj8kHCnICQaZrajYGEJXnNVXxIf/
 xhns4V7mgyCG0aYcZDqRxnRmHe45KHK3gZ7wWScUrd+zVsVrPwyvMxlkT98tctr3IDvaCt9OxKt
 R0x0bcD2DPMykHXktUCq9edSKH8c6a8xX7JYsYuZSBRIn6xnT7U+JwIftf1UHjBoM6IZ31rflBr
 ynIKQauiR0O+6IFFhmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180119
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nvidia.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gpiospec.np:url];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33753-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A828D2BC95E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

OF-based GPIO controller drivers may provide a translation function that
calculates the real chip offset from whatever devicetree sources
provide. We need to take this into account in the shared GPIO management
and call of_xlate() if it's provided and adjust the entry->offset we
initially set when scanning the tree.

To that end: modify the shared GPIO API to take the GPIO chip as
argument on setup (to avoid having to rcu_dereference() it from the GPIO
device) and protect the access to entry->offset with the existing lock.

Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Reported-by: Jon Hunter <jonathanh@nvidia.com>
Closes: https://lore.kernel.org/all/921ba8ce-b18e-4a99-966d-c763d22081e2@nvidia.com/
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 27 ++++++++++++++++++++++++++-
 drivers/gpio/gpiolib-shared.h |  4 ++--
 drivers/gpio/gpiolib.c        |  2 +-
 3 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 17a7128b6bd9bf6023deccee50b2453caebe3d9a..3a8db9bf456daaf021d3c691677a90fc6da15889 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -506,8 +506,9 @@ static void gpio_shared_remove_adev(struct auxiliary_device *adev)
 	auxiliary_device_uninit(adev);
 }
 
-int gpio_device_setup_shared(struct gpio_device *gdev)
+int gpiochip_setup_shared(struct gpio_chip *gc)
 {
+	struct gpio_device *gdev = gc->gpiodev;
 	struct gpio_shared_entry *entry;
 	struct gpio_shared_ref *ref;
 	struct gpio_desc *desc;
@@ -532,12 +533,34 @@ int gpio_device_setup_shared(struct gpio_device *gdev)
 	 * exposing shared pins. Find them and create the proxy devices.
 	 */
 	list_for_each_entry(entry, &gpio_shared_list, list) {
+		guard(mutex)(&entry->lock);
+
 		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
 			continue;
 
 		if (list_count_nodes(&entry->refs) <= 1)
 			continue;
 
+#if IS_ENABLED(CONFIG_OF)
+		if (is_of_node(entry->fwnode) && gc->of_xlate) {
+			/*
+			 * This is the earliest that we can tranlate the
+			 * devicetree offset to the chip offset.
+			 */
+			struct of_phandle_args gpiospec = { };
+
+			gpiospec.np = to_of_node(entry->fwnode);
+			gpiospec.args_count = 2;
+			gpiospec.args[0] = entry->offset;
+
+			ret = gc->of_xlate(gc, &gpiospec, NULL);
+			if (ret < 0)
+				return ret;
+
+			entry->offset = ret;
+		}
+#endif /* CONFIG_OF */
+
 		desc = &gdev->descs[entry->offset];
 
 		__set_bit(GPIOD_FLAG_SHARED, &desc->flags);
@@ -575,6 +598,8 @@ void gpio_device_teardown_shared(struct gpio_device *gdev)
 	struct gpio_shared_ref *ref;
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
+		guard(mutex)(&entry->lock);
+
 		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
 			continue;
 
diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
index 40568ef7364ccbf08b7f583e279a7d5b572af477..e11e260e1f590c46c5e575d3bb8f3b5a2240892d 100644
--- a/drivers/gpio/gpiolib-shared.h
+++ b/drivers/gpio/gpiolib-shared.h
@@ -14,14 +14,14 @@ struct device;
 
 #if IS_ENABLED(CONFIG_GPIO_SHARED)
 
-int gpio_device_setup_shared(struct gpio_device *gdev);
+int gpiochip_setup_shared(struct gpio_chip *gc);
 void gpio_device_teardown_shared(struct gpio_device *gdev);
 int gpio_shared_add_proxy_lookup(struct device *consumer, const char *con_id,
 				 unsigned long lflags);
 
 #else
 
-static inline int gpio_device_setup_shared(struct gpio_device *gdev)
+static inline int gpiochip_setup_shared(struct gpio_chip *gc)
 {
 	return 0;
 }
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6e000ad58a11f7e3de85d8a0630150368acc53ce..1777efe1a986c941da464da92255c261f27a5a6b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1223,7 +1223,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	if (ret)
 		goto err_remove_irqchip_mask;
 
-	ret = gpio_device_setup_shared(gdev);
+	ret = gpiochip_setup_shared(gc);
 	if (ret)
 		goto err_remove_irqchip;
 

-- 
2.47.3


