Return-Path: <linux-gpio+bounces-35340-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIOUM8KI6Gk6LgIAu9opvQ
	(envelope-from <linux-gpio+bounces-35340-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 10:37:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D15F8443878
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 10:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8F3B1302F5DC
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 08:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577323C3458;
	Wed, 22 Apr 2026 08:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i1IbeI0+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aU3QqtAb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400423BFE4A
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 08:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776846834; cv=none; b=WEvlyL4zowbtVs6XpuSb8zMibBZWBVRXbkg54vlqjxRDZ12kwBK66mDdsVaTygOYJ0o76qdH7RF4EjJL9plceRu11mJu51gxWrbKa/A8G+qV17wCtFS7pUSE6q/Qvn8S6E0mcBkyFDeN9H0Q5zd6aqcVuW5qD12X3kmclw0+rgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776846834; c=relaxed/simple;
	bh=mxRX46fSAzLKWKV4skWMHsJlSMiLgEPID84N2mk3Czs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H9N4fi6eI0rXHCZHpxTQSUcgdjyShK3k7hJo1KhJL2RYG14aAgCWMJkUpZQXIZJR57X5N1gmGUXGvqQ+mSFix4jEv3GQ916kRf+/xVv4STh7pc6i+cUJ47MoC8EJJCdsxUrz6Zenv+ZoV8OORF1WuvDxxEvGMar90iFzNHst6hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i1IbeI0+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aU3QqtAb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M4pDAZ2209080
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 08:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MRn+3G/iTNuUvQ9GEOcljSRsDHpT8BXFp3G
	aCFSCj1M=; b=i1IbeI0+E2ZU/T6OAhL4bCw9/Mc/nJawFvzmuaMXpK4T0owrUKW
	PeothMIgqjt9evVGEBSkUtMHh9pHinXd4M5Cnq67wNW2RKMFGD+CrRCADMcq5Efz
	/HcDNw0HeZYPECnzp0JVTouJPuRbNNzKKPGi6/qm58b+DrYxwRiAPpw/LC/iLG3p
	4F7k8HMqAbmY3KbKDHKYUNPKxnp/CaF5yk1dqwTH0BzlVYOgDI7LmnCy0Epa0DhI
	1hpySxCYhGOsGXIZ6zbEuNb7cEHTFeumOqW5URVhuDsRYkDEIuYhbOOYAcC0AZaP
	sa2lQhRBXVw/8rASxA3hFddGDtqPOtZMOhA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpengagft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 08:33:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4b81c632so119680321cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 01:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776846830; x=1777451630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MRn+3G/iTNuUvQ9GEOcljSRsDHpT8BXFp3GaCFSCj1M=;
        b=aU3QqtAbG7pp3t7jOgPNq4plf1U/0dcFRn3FLxwAPMaMmrVP4XW9Ek+u7dhRkdyAgp
         1O83YsP6MJPgTTW6SmXCX4hhwd3yPlTeE3o5LNePVjtkrYe7F3D9mS+6ubIwoPzHIoNc
         7DZdwt/2sKpQ5dXTKOX1lKmyCQofiLC0uBlguY0b3qqE0vHPTGezvR/O5EbIIJuzqAHP
         CwEXnAaRVf53B4zEIGBpOUkIoU6035Al6TuFCrr1nl+LIn4PikygWLUHMQ9iXiLw0P87
         FgH9q6NTLewjpgF8MjB1U0Gr6NFELDR6r0JcxAHISNnvu2EoxWwfQDq5E+oA1NB/lQOK
         vnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776846830; x=1777451630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRn+3G/iTNuUvQ9GEOcljSRsDHpT8BXFp3GaCFSCj1M=;
        b=qpI3M+wHMJrPNxeZ1zPrrna3ijpYSLUxr2mos4K/aRK8FwCmO7vq5R20IWFLhoPfV6
         jd2YwvZjL77jfYKZ8BQHU2gIZN7OBERB6XM0NRNez7PIJBOB0K5b85drbLH93P1OPGRo
         BJlk4SW4MGZKiBN8k4DdGxOOI9jqg03+wvPazq+ImfawBh8r2lkcaSpZAZS5N8Ia0AX9
         KAXjYqrek41g51OPi9GBFIi/Pp+bmAZXW+mxQikutIcDFNGIl9l4v6OvCw9IaCyJ3L9F
         yc/nhr8DkJ8EgFD4P1vzBTYP08yAaIw1pqXOEQUpwHy2T9w6/EQNOBLe4ThflevY/ibo
         7zvA==
X-Forwarded-Encrypted: i=1; AFNElJ896wjzmzA1xnK1MBQ8oPl5J04sAYhMbBDzkwdfOYAPQKx2XhPG+xfZmAaMTUBzBXC1hdHxEgYWUL9V@vger.kernel.org
X-Gm-Message-State: AOJu0YyjHhclTUovCTWxfMLlWE0KleH99+Tnlrp8SSmU6nwKA02yxICk
	Sd9kAMb5Wz6/mm5PHTs1q9H/qXMFG5CutQiQ+2ucysoHlcJr+Mpnt/JPddzS/MzWCMeq3yx7rmz
	aVmCaUnju7moRL5QseK/Q0rDc/BDTcnFuPrNCSLKUNUsu5ZrNs8ZGHeek4aLX7r3BejOndK7P
X-Gm-Gg: AeBDies3aPF9aQOMOrwV/eNbHt1L5uIWJPtQjQCsmLzi5Y+hYTATv6eQA2krB7EQvoz
	0aR5DcRIF3+SkvlZ8lzLE1ymig60fELnYsDnt9mHkti919h7/7VIxE3TbBVvquLYcAROBid8C5n
	DB7XMNzZIjqbyksfpLij12N40KmcxQqZjZcspdYuiGGfNk+m4rlyzjcXKIJe+w5CrsbFjeb3f0o
	JwibJtFdPoHgI2u4DYMmQxDLnUosvGSuvnicFiwSfAiw1NY5ycUN3gSPUmtUJTAzNzakpZUCO12
	Sg5A7seacj5IwDQpYNLMfisPhcgKLoO9EyikYO5Z7cWcJdboMJ4JDrV+JqUfYZ/VFVOvjY38PYp
	oivNfhMz+A3WlS3pCT+L9zXoVvuiw5nTWy7bXy7bv12ggPk8=
X-Received: by 2002:a05:622a:59c9:b0:50f:b790:96ae with SMTP id d75a77b69052e-50fb790a502mr82841881cf.22.1776846830084;
        Wed, 22 Apr 2026 01:33:50 -0700 (PDT)
X-Received: by 2002:a05:622a:59c9:b0:50f:b790:96ae with SMTP id d75a77b69052e-50fb790a502mr82841551cf.22.1776846829459;
        Wed, 22 Apr 2026 01:33:49 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5499b0edsm122624355e9.14.2026.04.22.01.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 01:33:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] pinctrl: qcom: Unify user-visible "Qualcomm" name
Date: Wed, 22 Apr 2026 10:33:46 +0200
Message-ID: <20260422083345.84443-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=19876; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=mxRX46fSAzLKWKV4skWMHsJlSMiLgEPID84N2mk3Czs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp6IfpuFtK9vOn45Jic0Jeb7iH2CK5W5EaE7lkh
 yfjuafXjRyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaeiH6QAKCRDBN2bmhouD
 1zL6D/4t3qgzBWfHU+b8jEmvja7bPHkffDCLIb0ldb9KI8aMsElIiJgHO8+hE9bkaqgtlTO44nZ
 i7ypYB2K98KqLME1PCx57IOqJf5kgDAgHmIR1VYXOgsuZN3gwMiaQ5iaCmvSCx4TDiDpGFG/yG0
 Y3GNMCK6pyl747s0YC81/cCf7w+iDj28G/WMzS3b/iSV91pX2WvD7yB+rQUwUdBmPGPkwChGHrT
 GG0xGzq1YRvqmQsFcxVjEGcgzgPY6g2Eop+7BdpwwzDNXBZh7ILem3T+GvaQ5UWY0Uph5BdlFUg
 RznRd3aTxMEYSb1BLY2yd1MvzmuK1zgkkv969VrmKixkg4h7MA3/XoEv6a4y6YrPXfrVPk0Mrtl
 qH2ogOviIxFDUBiYNNM8MTjaPSX5AG19Eng93SyXq3W9T3Hr3wA8AlCyLB4BNAtzz79V6TcRsMV
 /d8SX0z3uvuwILHy9bqF9+srrmVmdmx982/OrbeduNink+9B4kZKBJcSYMfpLx48ij0/fjRvFL/
 PSc85rOjTUeSkJMQ1tWvfNZg9i9CsAPhJSu9GXHzN3WCSyfXZKN9qzVZcZElaPhYrO9vG7hEbvA
 s0+QlMeoCvmqMQ/dfb5vc8bZ0Yj07OjetroZP8EZVN4mH5nDUzuznKi8Lx56YKUkF6ItsKYhgC0 KLhGl8h6eMk2AIQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA4MCBTYWx0ZWRfX3WVPNbdCGxRD
 WnItsi4w6ECbBteNSYLFYAb3hfI1IA48DiXxvz21qGrTD6hvWrC6mgdHfhhTEpg668rpA3QANKR
 2nQtuRi4LmW5a2VBs9Vd6Gk6aP+Qcqy/YspYDAbYR1xKtq4RyVivA8FvR5KEvZnaX5wqOLpF2QM
 hVaIVD08TASZA9EGFKSupEKF3ibGXvNZlawZ1E3GV+mLestpkrTSFB883p8VPLqB8OXbqNzOzUv
 ij6BBxaTQvQq6toDwBfA7h3HvNrdT8r7PESaaMRpUGhgYv8c3jjwd3P16iHRb/15lv9zkSVJRbb
 3YjzwZqRyBYyJ+fF/I2no9QVQI+6VTCmvT4Bc4hGtTPF1eiYSIkkoKvqo9AcWEz8AY+vBks4OYb
 1f/gc1ORmawezVBTYvKK71P8BHtW1eX5AF6yBkER0Z/OEHGTMpgJEGnb58UGSNdHeVSJ7RwqPBO
 N+lk8wItVpKRoSl8oBw==
X-Proofpoint-ORIG-GUID: x-rdbt6Yv7WrJOkB3oj0Pp30rZLSHGgt
X-Authority-Analysis: v=2.4 cv=RYygzVtv c=1 sm=1 tr=0 ts=69e887ef cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6Jgk0Gayf_HrBCq1vBEA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: x-rdbt6Yv7WrJOkB3oj0Pp30rZLSHGgt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220080
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35340-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D15F8443878
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Various names for Qualcomm as a company are used in user-visible config
options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
"Qualcomm" so it will be easier for users to identify the options when
for example running menuconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

And "Qualcomm Technologies" has even variations over the tree:
Qualcomm Technologies
Qualcomm Technologies Inc.
Qualcomm Technologies, Inc.

I am doing this tree wide:
https://lore.kernel.org/all/?q=f%3Akrzysztof+s%3A%22Unify+user-visible%22+s%3AQualcomm
---
 drivers/pinctrl/qcom/Kconfig     | 24 ++++-----
 drivers/pinctrl/qcom/Kconfig.msm | 84 ++++++++++++++++----------------
 2 files changed, 54 insertions(+), 54 deletions(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 80af372a1147..3accf0b489bb 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -49,7 +49,7 @@ config PINCTRL_QCOM_SSBI_PMIC
 	 devices are pm8058 and pm8921.
 
 config PINCTRL_LPASS_LPI
-	tristate "Qualcomm Technologies Inc LPASS LPI pin controller driver"
+	tristate "Qualcomm LPASS LPI pin controller driver"
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
@@ -61,7 +61,7 @@ config PINCTRL_LPASS_LPI
 	  (Low Power Island) found on the Qualcomm Technologies Inc SoCs.
 
 config PINCTRL_MILOS_LPASS_LPI
-	tristate "Qualcomm Technologies Inc Milos LPASS LPI pin controller driver"
+	tristate "Qualcomm Milos LPASS LPI pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_LPASS_LPI
 	help
@@ -71,7 +71,7 @@ config PINCTRL_MILOS_LPASS_LPI
 	  platform.
 
 config PINCTRL_SC7280_LPASS_LPI
-	tristate "Qualcomm Technologies Inc SC7280 and SM8350 LPASS LPI pin controller driver"
+	tristate "Qualcomm SC7280 and SM8350 LPASS LPI pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_LPASS_LPI
 	help
@@ -81,7 +81,7 @@ config PINCTRL_SC7280_LPASS_LPI
 	  and SM8350 platforms.
 
 config PINCTRL_SDM660_LPASS_LPI
-	tristate "Qualcomm Technologies Inc SDM660 LPASS LPI pin controller driver"
+	tristate "Qualcomm SDM660 LPASS LPI pin controller driver"
 	depends on GPIOLIB
 	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_LPASS_LPI
@@ -91,7 +91,7 @@ config PINCTRL_SDM660_LPASS_LPI
 	  (Low Power Island) found on the Qualcomm Technologies Inc SDM660 platform.
 
 config PINCTRL_SM4250_LPASS_LPI
-	tristate "Qualcomm Technologies Inc SM4250 LPASS LPI pin controller driver"
+	tristate "Qualcomm SM4250 LPASS LPI pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_LPASS_LPI
 	help
@@ -100,7 +100,7 @@ config PINCTRL_SM4250_LPASS_LPI
 	  (Low Power Island) found on the Qualcomm Technologies Inc SM4250 platform.
 
 config PINCTRL_SDM670_LPASS_LPI
-	tristate "Qualcomm Technologies Inc SDM670 LPASS LPI pin controller driver"
+	tristate "Qualcomm SDM670 LPASS LPI pin controller driver"
 	depends on GPIOLIB
 	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_LPASS_LPI
@@ -110,7 +110,7 @@ config PINCTRL_SDM670_LPASS_LPI
 	  (Low Power Island) found on the Qualcomm Technologies Inc SDM670 platform.
 
 config PINCTRL_SM6115_LPASS_LPI
-	tristate "Qualcomm Technologies Inc SM6115 LPASS LPI pin controller driver"
+	tristate "Qualcomm SM6115 LPASS LPI pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_LPASS_LPI
 	help
@@ -119,7 +119,7 @@ config PINCTRL_SM6115_LPASS_LPI
 	  (Low Power Island) found on the Qualcomm Technologies Inc SM6115 platform.
 
 config PINCTRL_SM8250_LPASS_LPI
-	tristate "Qualcomm Technologies Inc SM8250 LPASS LPI pin controller driver"
+	tristate "Qualcomm SM8250 LPASS LPI pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_LPASS_LPI
 	help
@@ -128,7 +128,7 @@ config PINCTRL_SM8250_LPASS_LPI
 	  (Low Power Island) found on the Qualcomm Technologies Inc SM8250 platform.
 
 config PINCTRL_SM8450_LPASS_LPI
-	tristate "Qualcomm Technologies Inc SM8450 LPASS LPI pin controller driver"
+	tristate "Qualcomm SM8450 LPASS LPI pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_LPASS_LPI
 	help
@@ -137,7 +137,7 @@ config PINCTRL_SM8450_LPASS_LPI
 	  (Low Power Island) found on the Qualcomm Technologies Inc SM8450 platform.
 
 config PINCTRL_SC8280XP_LPASS_LPI
-	tristate "Qualcomm Technologies Inc SC8280XP LPASS LPI pin controller driver"
+	tristate "Qualcomm SC8280XP LPASS LPI pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_LPASS_LPI
 	help
@@ -146,7 +146,7 @@ config PINCTRL_SC8280XP_LPASS_LPI
 	  (Low Power Island) found on the Qualcomm Technologies Inc SC8280XP platform.
 
 config PINCTRL_SM8550_LPASS_LPI
-	tristate "Qualcomm Technologies Inc SM8550 LPASS LPI pin controller driver"
+	tristate "Qualcomm SM8550 LPASS LPI pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_LPASS_LPI
 	help
@@ -156,7 +156,7 @@ config PINCTRL_SM8550_LPASS_LPI
 	  platform.
 
 config PINCTRL_SM8650_LPASS_LPI
-	tristate "Qualcomm Technologies Inc SM8650 LPASS LPI pin controller driver"
+	tristate "Qualcomm SM8650 LPASS LPI pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_LPASS_LPI
 	help
diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
index 836cdeca1006..acd486d45335 100644
--- a/drivers/pinctrl/qcom/Kconfig.msm
+++ b/drivers/pinctrl/qcom/Kconfig.msm
@@ -16,7 +16,7 @@ config PINCTRL_APQ8084
 	  Qualcomm TLMM block found in the Qualcomm APQ8084 platform.
 
 config PINCTRL_ELIZA
-	tristate "Qualcomm Technologies Inc Eliza pin controller driver"
+	tristate "Qualcomm Eliza pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -26,7 +26,7 @@ config PINCTRL_ELIZA
 	  If unsure, say N.
 
 config PINCTRL_GLYMUR
-	tristate "Qualcomm Technologies Inc Glymur pin controller driver"
+	tristate "Qualcomm Glymur pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -36,7 +36,7 @@ config PINCTRL_GLYMUR
 	  If unsure, say N.
 
 config PINCTRL_HAWI
-	tristate "Qualcomm Technologies Inc Hawi pin controller driver"
+	tristate "Qualcomm Hawi pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -53,7 +53,7 @@ config PINCTRL_IPQ4019
 	  Qualcomm TLMM block found in the Qualcomm IPQ4019 platform.
 
 config PINCTRL_IPQ5018
-	tristate "Qualcomm Technologies, Inc. IPQ5018 pin controller driver"
+	tristate "Qualcomm IPQ5018 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
@@ -69,7 +69,7 @@ config PINCTRL_IPQ8064
 	  Qualcomm TLMM block found in the Qualcomm IPQ8064 platform.
 
 config PINCTRL_IPQ5210
-	tristate "Qualcomm Technologies Inc IPQ5210 pin controller driver"
+	tristate "Qualcomm IPQ5210 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -77,7 +77,7 @@ config PINCTRL_IPQ5210
 	  Technologies Inc IPQ5210 platform.
 
 config PINCTRL_IPQ5332
-	tristate "Qualcomm Technologies Inc IPQ5332 pin controller driver"
+	tristate "Qualcomm IPQ5332 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -85,7 +85,7 @@ config PINCTRL_IPQ5332
 	  Technologies Inc IPQ5332 platform.
 
 config PINCTRL_IPQ5424
-	tristate "Qualcomm Technologies, Inc. IPQ5424 pin controller driver"
+	tristate "Qualcomm IPQ5424 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
@@ -94,7 +94,7 @@ config PINCTRL_IPQ5424
           IPQ5424.
 
 config PINCTRL_IPQ8074
-	tristate "Qualcomm Technologies, Inc. IPQ8074 pin controller driver"
+	tristate "Qualcomm IPQ8074 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
@@ -103,7 +103,7 @@ config PINCTRL_IPQ8074
 	  IPQ8074.
 
 config PINCTRL_IPQ6018
-	tristate "Qualcomm Technologies, Inc. IPQ6018 pin controller driver"
+	tristate "Qualcomm IPQ6018 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
@@ -112,7 +112,7 @@ config PINCTRL_IPQ6018
 	  IPQ6018.
 
 config PINCTRL_IPQ9574
-	tristate "Qualcomm Technologies, Inc. IPQ9574 pin controller driver"
+	tristate "Qualcomm IPQ9574 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
@@ -121,7 +121,7 @@ config PINCTRL_IPQ9574
           IPQ9574.
 
 config PINCTRL_KAANAPALI
-	tristate "Qualcomm Technologies Inc Kaanapali pin controller driver"
+	tristate "Qualcomm Kaanapali pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -244,28 +244,28 @@ config PINCTRL_QCS404
 	  TLMM block found in the Qualcomm QCS404 platform.
 
 config PINCTRL_QCS615
-	tristate "Qualcomm Technologies QCS615 pin controller driver"
+	tristate "Qualcomm QCS615 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  TLMM block found on the Qualcomm QCS615 platform.
 
 config PINCTRL_QCS8300
-	tristate "Qualcomm Technologies QCS8300 pin controller driver"
+	tristate "Qualcomm QCS8300 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux and pinconf driver for the Qualcomm
 	  TLMM block found on the Qualcomm QCS8300 platform.
 
 config PINCTRL_QDF2XXX
-	tristate "Qualcomm Technologies QDF2xxx pin controller driver"
+	tristate "Qualcomm QDF2xxx pin controller driver"
 	depends on ACPI
 	help
 	  This is the GPIO driver for the TLMM block found on the
 	  Qualcomm Technologies QDF2xxx SOCs.
 
 config PINCTRL_QDU1000
-	tristate "Qualcomm Technologies Inc QDU1000/QRU1000 pin controller driver"
+	tristate "Qualcomm QDU1000/QRU1000 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux, pinconf, and gpiolib driver for the
@@ -273,14 +273,14 @@ config PINCTRL_QDU1000
 	  Technologies Inc QDU1000 and QRU1000 platforms.
 
 config PINCTRL_SA8775P
-	tristate "Qualcomm Technologies Inc SA8775P pin controller driver"
+	tristate "Qualcomm SA8775P pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux and pinconf driver for the Qualcomm
 	  TLMM block found on the Qualcomm SA8775P platforms.
 
 config PINCTRL_SAR2130P
-	tristate "Qualcomm Technologies Inc SAR2130P pin controller driver"
+	tristate "Qualcomm SAR2130P pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -288,7 +288,7 @@ config PINCTRL_SAR2130P
 	  Technologies Inc SAR2130P platform.
 
 config PINCTRL_SC7180
-	tristate "Qualcomm Technologies Inc SC7180 pin controller driver"
+	tristate "Qualcomm SC7180 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -296,7 +296,7 @@ config PINCTRL_SC7180
 	  Technologies Inc SC7180 platform.
 
 config PINCTRL_SC7280
-	tristate "Qualcomm Technologies Inc SC7280 pin controller driver"
+	tristate "Qualcomm SC7280 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -304,7 +304,7 @@ config PINCTRL_SC7280
 	  Technologies Inc SC7280 platform.
 
 config PINCTRL_SC8180X
-	tristate "Qualcomm Technologies Inc SC8180x pin controller driver"
+	tristate "Qualcomm SC8180x pin controller driver"
 	depends on (OF || ACPI)
 	depends on ARM64 || COMPILE_TEST
 	help
@@ -313,7 +313,7 @@ config PINCTRL_SC8180X
 	  Technologies Inc SC8180x platform.
 
 config PINCTRL_SC8280XP
-	tristate "Qualcomm Technologies Inc SC8280xp pin controller driver"
+	tristate "Qualcomm SC8280xp pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -321,7 +321,7 @@ config PINCTRL_SC8280XP
 	  Technologies Inc SC8280xp platform.
 
 config PINCTRL_SDM660
-	tristate "Qualcomm Technologies Inc SDM660 pin controller driver"
+	tristate "Qualcomm SDM660 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -329,7 +329,7 @@ config PINCTRL_SDM660
 	 Technologies Inc SDM660 platform.
 
 config PINCTRL_SDM670
-	tristate "Qualcomm Technologies Inc SDM670 pin controller driver"
+	tristate "Qualcomm SDM670 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -337,7 +337,7 @@ config PINCTRL_SDM670
 	 Technologies Inc SDM670 platform.
 
 config PINCTRL_SDM845
-	tristate "Qualcomm Technologies Inc SDM845 pin controller driver"
+	tristate "Qualcomm SDM845 pin controller driver"
 	depends on (OF || ACPI)
 	depends on ARM64 || COMPILE_TEST
 	help
@@ -346,7 +346,7 @@ config PINCTRL_SDM845
 	 Technologies Inc SDM845 platform.
 
 config PINCTRL_SDX55
-	tristate "Qualcomm Technologies Inc SDX55 pin controller driver"
+	tristate "Qualcomm SDX55 pin controller driver"
 	depends on ARM || COMPILE_TEST
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -354,7 +354,7 @@ config PINCTRL_SDX55
 	 Technologies Inc SDX55 platform.
 
 config PINCTRL_SDX65
-        tristate "Qualcomm Technologies Inc SDX65 pin controller driver"
+        tristate "Qualcomm SDX65 pin controller driver"
         depends on ARM || COMPILE_TEST
         help
          This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -362,7 +362,7 @@ config PINCTRL_SDX65
          Technologies Inc SDX65 platform.
 
 config PINCTRL_SDX75
-        tristate "Qualcomm Technologies Inc SDX75 pin controller driver"
+        tristate "Qualcomm SDX75 pin controller driver"
         depends on ARM64 || COMPILE_TEST
         help
          This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -370,7 +370,7 @@ config PINCTRL_SDX75
          Technologies Inc SDX75 platform.
 
 config PINCTRL_SM4450
-	tristate "Qualcomm Technologies Inc SM4450 pin controller driver"
+	tristate "Qualcomm SM4450 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -378,7 +378,7 @@ config PINCTRL_SM4450
 	 Technologies Inc SM4450 platform.
 
 config PINCTRL_SM6115
-	tristate "Qualcomm Technologies Inc SM6115,SM4250 pin controller driver"
+	tristate "Qualcomm SM6115,SM4250 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -386,7 +386,7 @@ config PINCTRL_SM6115
 	 Technologies Inc SM6115 and SM4250 platforms.
 
 config PINCTRL_SM6125
-	tristate "Qualcomm Technologies Inc SM6125 pin controller driver"
+	tristate "Qualcomm SM6125 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -394,7 +394,7 @@ config PINCTRL_SM6125
 	 Technologies Inc SM6125 platform.
 
 config PINCTRL_SM6350
-	tristate "Qualcomm Technologies Inc SM6350 pin controller driver"
+	tristate "Qualcomm SM6350 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -402,7 +402,7 @@ config PINCTRL_SM6350
 	 Technologies Inc SM6350 platform.
 
 config PINCTRL_SM6375
-	tristate "Qualcomm Technologies Inc SM6375 pin controller driver"
+	tristate "Qualcomm SM6375 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -410,7 +410,7 @@ config PINCTRL_SM6375
 	 Technologies Inc SM6375 platform.
 
 config PINCTRL_SM7150
-	tristate "Qualcomm Technologies Inc SM7150 pin controller driver"
+	tristate "Qualcomm SM7150 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -418,7 +418,7 @@ config PINCTRL_SM7150
 	 Technologies Inc SM7150 platform.
 
 config PINCTRL_MILOS
-	tristate "Qualcomm Technologies Inc Milos pin controller driver"
+	tristate "Qualcomm Milos pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -426,7 +426,7 @@ config PINCTRL_MILOS
 	  Technologies Inc Milos platform.
 
 config PINCTRL_SM8150
-	tristate "Qualcomm Technologies Inc SM8150 pin controller driver"
+	tristate "Qualcomm SM8150 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -434,7 +434,7 @@ config PINCTRL_SM8150
 	 Technologies Inc SM8150 platform.
 
 config PINCTRL_SM8250
-	tristate "Qualcomm Technologies Inc SM8250 pin controller driver"
+	tristate "Qualcomm SM8250 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -442,7 +442,7 @@ config PINCTRL_SM8250
 	  Technologies Inc SM8250 platform.
 
 config PINCTRL_SM8350
-	tristate "Qualcomm Technologies Inc SM8350 pin controller driver"
+	tristate "Qualcomm SM8350 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -450,7 +450,7 @@ config PINCTRL_SM8350
 	  Technologies Inc SM8350 platform.
 
 config PINCTRL_SM8450
-	tristate "Qualcomm Technologies Inc SM8450 pin controller driver"
+	tristate "Qualcomm SM8450 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -458,7 +458,7 @@ config PINCTRL_SM8450
 	  Technologies Inc SM8450 platform.
 
 config PINCTRL_SM8550
-	tristate "Qualcomm Technologies Inc SM8550 pin controller driver"
+	tristate "Qualcomm SM8550 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -466,7 +466,7 @@ config PINCTRL_SM8550
 	  Technologies Inc SM8550 platform.
 
 config PINCTRL_SM8650
-	tristate "Qualcomm Technologies Inc SM8650 pin controller driver"
+	tristate "Qualcomm SM8650 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -474,7 +474,7 @@ config PINCTRL_SM8650
 	  Technologies Inc SM8650 platform.
 
 config PINCTRL_SM8750
-	tristate "Qualcomm Technologies Inc SM8750 pin controller driver"
+	tristate "Qualcomm SM8750 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -482,7 +482,7 @@ config PINCTRL_SM8750
 	  Technologies Inc SM8750 platform.
 
 config PINCTRL_X1E80100
-	tristate "Qualcomm Technologies Inc X1E80100 pin controller driver"
+	tristate "Qualcomm X1E80100 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
-- 
2.51.0


