Return-Path: <linux-gpio+bounces-38218-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LX9/FBUOKWr2PQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38218-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 09:11:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B9586666810
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 09:11:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=o0bQZ87w;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AmiTd1ic;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38218-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38218-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1542B30EA164
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 07:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51094386C36;
	Wed, 10 Jun 2026 07:05:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29DC38736F
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 07:05:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781075156; cv=none; b=J1aFRxVEi2udLe7VSTF6s6zEgLrrHvHPNL85g/GTzEz5EhbdO//i5k9CDShts5Rt5rj9m+VixUZqBh2+l56UR0F5HO/cmIktLoVupDBRsMPjIJgKBg01Su8h1juoxsDaalTwo3a5wiQVvlpJYXiOU0s7ksTdjrw32RIkjz6IIpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781075156; c=relaxed/simple;
	bh=EdSqvWxvbeFi2s8A+P9poiJz0j1+FY/3akLr+hOjmfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CTbKPwkhPHCxSifDn1KEUu53UCbm6ToJyR5Ih/IlkLReW443GMVj95t4CifhpOisjJ/7e2qgvkIJ7vtzZKalwhOzfhwsOlkrqvprJ7AU1aDGSFJmvHfgulboC3gFPXvHQT/rSm0Ar2Q10Vu0hBDDiS7Uyxhnqu78VxoWPWbzUDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0bQZ87w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AmiTd1ic; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A45IDk387499
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 07:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	20xJQ1VsBjWu2riRF+Vy476G1dpA/diAliFTETNCBXg=; b=o0bQZ87wEOFC8Rh0
	SyQ3+ogkd6hMolb5STnMhb1lGa4iTj/oa/75Qh4ItLvgzJGiqoK2h+J7qAAjKm8m
	Qu7I/apKfssHwJHU1Zo8Q+n6pZy7x9utW4Lf9EHVFVdFo2esJgWZRe0lHaCVaLhb
	+2J/sFA71nntJOfNLpM6GHgeVFauV6NPHpO3AUiMj0EXVB44aJa9pug61d3iBzHm
	5Y2A+IN9/CUIHEcMFLllZFNEdqP5cN3dkiB2lRoZiTCyJu2l4eCXwj3C9tSQLajP
	4IPboueedAjX40Et0Sod1b97jkPkUo56MGMXQ1/4JE6t5RfIZAvt9x2mOci53hwV
	yj6U/Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0kd8jw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 07:05:51 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304d8613efbso6624788eec.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 00:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781075150; x=1781679950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=20xJQ1VsBjWu2riRF+Vy476G1dpA/diAliFTETNCBXg=;
        b=AmiTd1ic1P/SmdYV9U/kg6pU7JMgweiNUn75w/RqEbIhU305MOCdadCQup00raICyz
         giQZist/3pu3hHy+g9TO/bAif56bZigSswmU4XTzBIEGQmGuQqtdzyxnzTymH0NYg7z1
         A7UIFJzVCRryXPRmGHN7j+iMGF5YeVFlwA7fQQBmy1hsVXRVQliuCJWZawI8xp6Q3UrC
         RGK/61l2OuIjWrRNI5e2igYjnk8ISVmf2tz7FwsGxiiaa7/rbdLcED6hHlrD3fdtzlWq
         b38hqZ8xiMCQpwnVWsJeIsrSbb8KWhXZvmg+qkGVE31IcFLTzlvAGS4vp6Ib6Fdzen6X
         UbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781075150; x=1781679950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=20xJQ1VsBjWu2riRF+Vy476G1dpA/diAliFTETNCBXg=;
        b=LkE31JQCmZCeX8l6Dx21+VyWLOrS02FyX5dIriSqxBdI5601dpWDGgCJI31bjGZbDH
         w0yZKVpjpGbjaGZ42tsCjyaRUDqBTAMaKdiRhTyVmxahEH2JG02zZURWrzn9d7p7+VqT
         DB4NE7mnub7ZEenb2h9bDWW8dMnYpi05hQt+HwypjHvZRAQH4vihixzJ+r0uNUOCMiaW
         YABVKgQ6gVs1aB0Y06yuHNd2zsdicI1GJAZsvsTL+mmMuUcgiGgzPfWc1mI7Dwhj0y0d
         jae6yVqWkRwI7v4+Dz5egIAdDvYXDk0fh0qF8vRHMqsr1Ib1EVCMjjt1+vP6NOGG1qAb
         w01g==
X-Forwarded-Encrypted: i=1; AFNElJ/X2rLznte8B4v8JuHoOMfWXsJEHXg/QfPhZ498G5XsnG6DPZqIoamgEMnuIhjXCZaqnkr7zSHC85iD@vger.kernel.org
X-Gm-Message-State: AOJu0YxQFUzxIBQKpKfe0MeiQJgikkRm5zgFvVmbfVJU1qPocpS6/tYu
	ReY91NpzYLsCau3kw6t9ZgLyB/v9azyfokfDLr0JmorHW8+u+wBrwvgd1GzcfBHnSc3q5a5Pwm+
	P6FiUi52Gk4H1r3Dfi/uHaYoFKJhV9o7qx51TQ98zKrF0UZvCP5jMDlmqje4F7Vel
X-Gm-Gg: Acq92OGKwCh9Z6OYcTXT++FOA+ttGu8KVG624+Zppk8fY9CoqM38Uxfl80sdNYIFrnb
	+d2RJsxT0bljr86hlToYsdfUJ79NyBtb8RR6jx7hX5VVtvIV6C8vhl7WVPhnlQeKXYtd251X/nX
	fVkGNwI4TBwVsbrCOCRNnfFODNgIn6Ft6W4iqsvtAuA/PnfTALS3rXCz2JXLsIBZ7MhgRtquWj7
	j4AR0tWy5IMrzDCpjbSWd4p2aO5RWJ3FyhOJBU1S6kHq279QCyVdPJo0l3zzVhRO+jn4DTXJEA6
	k3woPejzKzhaC3S7Lgm9/FD6iPyuKTgYZJlu/shscz/1RWeXCUkI4c2URHs9NX9l0YF1uvlHhPq
	2bYfVG9v3ES58cZxvGOYUZ1+pXgDX0On3wZ5+IotxQICHlId+egAwZJBGNE6zCc1j3QZr6NT/hC
	Qkm7W/9QXp
X-Received: by 2002:a05:693c:2c01:b0:2d2:96e8:1bf5 with SMTP id 5a478bee46e88-3077b32a4ddmr14944173eec.3.1781075150312;
        Wed, 10 Jun 2026 00:05:50 -0700 (PDT)
X-Received: by 2002:a05:693c:2c01:b0:2d2:96e8:1bf5 with SMTP id 5a478bee46e88-3077b32a4ddmr14944138eec.3.1781075149764;
        Wed, 10 Jun 2026 00:05:49 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df9bbd4sm22435926eec.30.2026.06.10.00.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 00:05:49 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 00:05:46 -0700
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom,pmic-gpio: Document PMG1110
 GPIO support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-pmg1110-gpio-v1-1-a9c50cd8b5d9@oss.qualcomm.com>
References: <20260610-pmg1110-gpio-v1-0-a9c50cd8b5d9@oss.qualcomm.com>
In-Reply-To: <20260610-pmg1110-gpio-v1-0-a9c50cd8b5d9@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781075147; l=1506;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=EdSqvWxvbeFi2s8A+P9poiJz0j1+FY/3akLr+hOjmfY=;
 b=O1LNuhwD4U7ik/rBoO94KgcjAYX4hmzKF6/4M75f0P/8w8ha5LLRNIC1EXsD6DxGZEj83icSf
 6bwYOGt82BRCLREULuMOyI+/aYqAHPfM2jklsQ5k7EdglZJEZ21E/49
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a290ccf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=s_8-tX6kEDdiFPcoZCEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: Bc1iQ4nBbVQSDicbppHX7tz7eg3YSdlW
X-Proofpoint-ORIG-GUID: Bc1iQ4nBbVQSDicbppHX7tz7eg3YSdlW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA2NSBTYWx0ZWRfX3pR22hkBC7WI
 io8hX2HmL5QGaVMs9yYesThux/KyuhRYedEou/oVZFVKrPQDZ6oknc5l08OKVBqOcsr4QWDIkQP
 Xnj7j1fU2a+cZZCwm/smMpaWiKOPist0aPBIC/qI9axpncSNIhe9m3h264bMaWVK3MW1KbSCLhq
 Lv2EeJcaM6I1+b5cpicd6Wiyslit8AWCoycNGEfwmqvhMlBuGV6j0Sv5ZyPP4ORHNtIgnKZz8z7
 oO+H5QL60GKKZ8+yMF8P8P29liQgJo9EneNxYhm9YEsIMo8ZCMv+SFKVYSCFI7CiLDTbig8C6pC
 SWvIMO7tydM7k4QMTMqH+ieC5Ga27NIvUTq/w1Am6BgzEhjYVff8b3P5FPHlNiDqXXOatQLPpD8
 tEa7SBVisL25Tjcbdf6KiKBbDrYiSZ5iK39/H8Y75fg7MH/oKqMUenD5BfeSHJc0gn4E4vytVf8
 GVMFIdl2BAeFFroZY4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100065
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38218-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:fenglin.wu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9586666810

Update the binding documentation to include the compatible string for
PMG1110 PMIC which is used on Maili platform.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 386c31e9c52b..f42ba36373f2 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -61,6 +61,7 @@ properties:
           - qcom,pmc8380-gpio
           - qcom,pmcx0102-gpio
           - qcom,pmd8028-gpio
+          - qcom,pmg1110-gpio
           - qcom,pmh0101-gpio
           - qcom,pmh0104-gpio
           - qcom,pmh0110-gpio
@@ -153,6 +154,7 @@ allOf:
               - qcom,pm8450-gpio
               - qcom,pm8916-gpio
               - qcom,pmd8028-gpio
+              - qcom,pmg1110-gpio
               - qcom,pmk8350-gpio
               - qcom,pmr735a-gpio
               - qcom,pmr735b-gpio
@@ -493,6 +495,7 @@ $defs:
                  - gpio1-gpio22 for pma8084
                  - gpio1-gpio14 for pmcx0102
                  - gpio1-gpio4 for pmd8028
+                 - gpio1-gpio4 for pmg1110
                  - gpio1-gpio18 for pmh0101
                  - gpio1-gpio8 for pmh0104
                  - gpio1-gpio14 for pmh0110

-- 
2.43.0


