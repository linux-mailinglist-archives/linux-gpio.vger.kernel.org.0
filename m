Return-Path: <linux-gpio+bounces-36427-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAODFx92/WmyegAAu9opvQ
	(envelope-from <linux-gpio+bounces-36427-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 07:35:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5674F1F61
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 07:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C7E4305B9B3
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 05:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B091344DB4;
	Fri,  8 May 2026 05:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j0FNqR8X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WLMyHsOK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C23533F589
	for <linux-gpio@vger.kernel.org>; Fri,  8 May 2026 05:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778218475; cv=none; b=D37G9NzKmigzeN/CLXa0PVteGEQZnjRhx9rjxUvKjrTd+0m8EWUVOxPRqm7t2MaYpadU1z92/IPCsNqkKkdXWck0fQaM5ztm22I5iejnyXromSrETTs1OClYHrsAr7rJOpDlq6DgpcCYIul1WQO44ml13jaRh7jXXkhSMwtGM/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778218475; c=relaxed/simple;
	bh=VH1bVyI/Pfu1KVaWoo8Rg00AXnz82yjCH8Gfd6pugiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dp4IAC5L9bEONnw0XUa1gWUtZJZQWpPtcrqDUJX51cF3gFI6n66ZFwzSJud6D65TxkDGBFJOpLd25ygpdTZQxOqOQ1BbSl7admZhNPfzmO8L8CN3A6MnMfO3I55CfhzSkSbqrh5GjmQXvM9D8sdrmD8YpnLTJeCHgzjg8CfuDXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j0FNqR8X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WLMyHsOK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6485IJIN2531551
	for <linux-gpio@vger.kernel.org>; Fri, 8 May 2026 05:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sQyAqnnaNwMhkb1k4NV+l+NR6ZrYsqhwA3dfMbH6KHw=; b=j0FNqR8XZMkDr/Bw
	FpIe63t1HoyY4GLZsCip5q+OGqfcbGON/gg0Bfq8y1FpV3dR44a9M4lJeqHko4lD
	YtXi9+K9xQ2zqJZlOOHPsgtFoewdnlolSfNMQbpo+xRKXrmw5w7O32RjZMXMF0GQ
	92BGfzAO6NTa8z/4m23czqWqMuiBkUeomxh6KcTFxCMVfc6Lzl1/4nU5pWIhAUOZ
	2n5SxNCKEfNkAevqSzc51nnefXPNDjBcAG8a+nz/1oeGSjNwDEihDLebVRkcGpxp
	IoiypiND84hFWZ1XhFkH5HXL8Xv3pllESYJ16fGGeAYudHSBRU3S2BcZtJjSoQFg
	pZ1OMA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10m9st95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 08 May 2026 05:34:33 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2f5943ca81aso1523055eec.0
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 22:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778218473; x=1778823273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sQyAqnnaNwMhkb1k4NV+l+NR6ZrYsqhwA3dfMbH6KHw=;
        b=WLMyHsOKg1rIlpDER6idHyz8EMU5qfoCkv4t331mMmxZbUaBxmjYIZr+Ptwbs1QgL8
         ZAO/+Wyebe2w+IOuoVV7dSO04R81S9gcnE8BpuzeNPfMtyyamuic6E1n7uIunH1sSV9n
         T34bKz8PhOMsDURZILtRiXNr5bh5N5NQtoiZiIQBQIDjKfR8ZP0u3+k8iScMvpqQmhEC
         CVnfN4t+5HkmzF2NaAH8aah+HWZ7jZiyl6qf+eTdIDdeWuZdiUtfJd3Jdui3ft8FmnAu
         wNjjblfAU3RsyPxokbB+maMJAHpbkU6snA8fwJY+UaXUSajfN9TOA8JRa3bFaq+pAOwo
         Vu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778218473; x=1778823273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sQyAqnnaNwMhkb1k4NV+l+NR6ZrYsqhwA3dfMbH6KHw=;
        b=VxX6X3mL7obPl4MyR0f4ejK/PMHL4sfdEIV8qcjzcNAkGwhiScglrnZfrfVbX8lbm2
         sO+kZbc6299sb204qiLjG8+6Q0CPxlwouUKI52q8Sdi7icm37HlMVpg2X5JRWoCqG6R0
         q35lylFWtyBr+rVqVW/LB1Vc1EufbZ2mNupJStPN4s3bt8R2JrIN7GsBW1DMVArFwdNu
         MGS79XA77lhHXJQpXeBoqogrfmKL/D0bYnLNP3P+rgdfV5cKktJnw8his34QGbhtm+OS
         ryqacHM3WBBx/7iyB422ieqReJaTkl7zC/2pH5jdM1GA3ZrDqaQy1xojNhGmtSbTsmHv
         Yqvg==
X-Forwarded-Encrypted: i=1; AFNElJ8c5nrl6xZZPNv6H7j3D/X89uwAJHkHwjClSNw8YhNJkAsaNNWbn3KORyOsJR8oykZ19bDcesWAD4Lc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/8CfSfpW/vka6S6kIIdD7DgOCepiKbHxDv+9nOXSaC8d90RfO
	xvaywBhTug/l/z0cvMti4tuLdhItGLK9bzlmZXpOl4gBlShHw9hNOogH8VVgBbZdnjRek4de8kI
	1ed/wPd3pqJBHz3uzerBlnK5eBwKRTLz9cznRhXCzYgZXAbpm4Qpc8f+cGNakNm8Q
X-Gm-Gg: Acq92OF+GnMM9rgJIlzTRgidYnlTOxqcWeVEu+wxFHpsnYraTBzlQf6Q0oWxrEpw2O4
	+Fky4d2ck6BM3nsuiJH4ZCdPpwK/7oFnK6Zy45ARpJWe+5qgSX1C0Ce8gxbKkrjRfne1Y5RcZ28
	gIVgiDBgjrftLgK1M/ckuK2e25pSoln2KQw9Rp97GGAnqOki5jGtDxPqtoc0M4huYIUMkG4xKMz
	gFm2sosI5sKVobUeC3X7q2+oz2ZXk9yxfWh4nY3Bvxq8rtbyoW/euC6Qr4fh2IKEwLRiWRpd6Yy
	xqqyXoAfioJugWSMIdAeEj34jYIGaSbbizPxN1nEPwZNCpj+3+PoDokPgyqMtvkHWvmP+rznOWZ
	tkwc8nQv0MvVn6UDsd7tcKfMM0KeWKS+1G9qr7BsWD001hqSipSOgmDMwSukEfnsVQaNlaAy8Cw
	==
X-Received: by 2002:a05:7301:e101:b0:2f5:5dd3:1fd8 with SMTP id 5a478bee46e88-2f55dd323c8mr3888256eec.8.1778218472940;
        Thu, 07 May 2026 22:34:32 -0700 (PDT)
X-Received: by 2002:a05:7301:e101:b0:2f5:5dd3:1fd8 with SMTP id 5a478bee46e88-2f55dd323c8mr3888241eec.8.1778218472293;
        Thu, 07 May 2026 22:34:32 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885be8esm847475eec.22.2026.05.07.22.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 22:34:31 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:34:09 -0700
Subject: [PATCH 3/3] arm64: dts: qcom: Add gpio device node for pm8010
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-pm8010_gpio-v1-3-3bce9da8d2ba@oss.qualcomm.com>
References: <20260507-pm8010_gpio-v1-0-3bce9da8d2ba@oss.qualcomm.com>
In-Reply-To: <20260507-pm8010_gpio-v1-0-3bce9da8d2ba@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        David Collins <david.collins@oss.qualcomm.com>,
        kamal.wadhwa@oss.qualcomm.com, kernel@oss.qualcomm.com,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778218467; l=2615;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=VH1bVyI/Pfu1KVaWoo8Rg00AXnz82yjCH8Gfd6pugiI=;
 b=jcFOwT50ZYUv8mi1PQqDqpYxS5iJW9RJKnBBBlmLzxnGnq2pjm42qAI7RwiBda2pPxHHiKsK0
 LUY6azStleNCUV4Ab94zJFxm+IKr1qQrtmIQepq3fj29h4fzL4O5Txf
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: y3cChGArYWU8eotL5CY93Nt0sm_GIkoH
X-Authority-Analysis: v=2.4 cv=VP3tWdPX c=1 sm=1 tr=0 ts=69fd75e9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1woaabIM3g6s6BIelNcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA1MiBTYWx0ZWRfXwTwZmXduXgu6
 wYOekrf58MquMZMuSJVhGNDI1fDg6hd5O5b2VwXWu1KrwxcAtSgGawdxckxAtx0oI884S4NcNmB
 zF65GNMMAy/no05d3u8ar0m/VptgsXxsxZ81X91xTF3N05O5rqZMZUSwvWCLUiwJeMAj8ofKQQR
 bOPvOJfPmO4+kX5Xf+TluuDzvG0/7PJQ++E59vG9Gwfl0d8mUijZKvKnl51egDEO9Brd7zs1FaP
 a/3BOmpyqnPz9VgWTmsdoRtoyBIBBnOG0zHIkEJXX/dzS8+FIJ11HVOhhuvl/vZvxFr3d7tKuYQ
 VtMtHbX3ZwJWWzPrveRLPOBdWALYiq/k3yT/jBwQPVzu5von+IksBoj2Jx7iGLpzeNCcKBN5cxt
 4gaW3cCwAzLngimpNHM7D+Sk5zKIJnZr7/ZeUu+163g90Oqnbwpb8yRRVKDeN9rzf1rrbJYR1sO
 7M6W8V+T2iqiA07lsSQ==
X-Proofpoint-ORIG-GUID: y3cChGArYWU8eotL5CY93Nt0sm_GIkoH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1011 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080052
X-Rspamd-Queue-Id: CD5674F1F61
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-36427-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,c000:email,d:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.9.96:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add gpio device nodes in pm8010*.dtsi files for any consumers to be
able to use the GPIOs.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi | 20 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8010.dtsi           | 20 ++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi b/arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi
index bfc58a6589d3..6a8f1accd260 100644
--- a/arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi
@@ -75,6 +75,16 @@ pm8010_m_e1_temp_alarm: temp-alarm@2400 {
 			interrupts = <0xc 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
 		};
+
+		pm8010_m_e1_gpios: gpio@c000 {
+			compatible = "qcom,pm8010-gpio", "qcom,spmi-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			gpio-ranges = <&pm8010_m_e1_gpios 0 0 2>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	pm8010_n_e1: pmic@d {
@@ -89,5 +99,15 @@ pm8010_n_e1_temp_alarm: temp-alarm@2400 {
 			interrupts = <0xd 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
 		};
+
+		pm8010_n_e1_gpios: gpio@c000 {
+			compatible = "qcom,pm8010-gpio", "qcom,spmi-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			gpio-ranges = <&pm8010_n_e1_gpios 0 0 2>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/pm8010.dtsi b/arch/arm64/boot/dts/qcom/pm8010.dtsi
index ef330194946b..031fcf38f3d1 100644
--- a/arch/arm64/boot/dts/qcom/pm8010.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8010.dtsi
@@ -64,6 +64,16 @@ pm8010_m_temp_alarm: temp-alarm@2400 {
 			interrupts = <0xc 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
 		};
+
+		pm8010_m_gpios: gpio@c000 {
+			compatible = "qcom,pm8010-gpio", "qcom,spmi-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			gpio-ranges = <&pm8010_m_gpios 0 0 2>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	pm8010_n: pmic@d {
@@ -78,5 +88,15 @@ pm8010_n_temp_alarm: temp-alarm@2400 {
 			interrupts = <0xd 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
 		};
+
+		pm8010_n_gpios: gpio@c000 {
+			compatible = "qcom,pm8010-gpio", "qcom,spmi-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			gpio-ranges = <&pm8010_n_gpios 0 0 2>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 };

-- 
2.43.0


