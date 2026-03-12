Return-Path: <linux-gpio+bounces-33268-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HS8BrHismmWQgAAu9opvQ
	(envelope-from <linux-gpio+bounces-33268-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 16:58:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A87402750BD
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 16:58:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 076C5304EA6E
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 15:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32073F54A9;
	Thu, 12 Mar 2026 15:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKSmmZEL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FPfwhq46"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F913F2117
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 15:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773331012; cv=none; b=N42aTuEPbL9eGzsb8utjlmF1Ftqr6iXwUQyCeCyWBPP4iIVp/TlIAdZgb3dBGNe2+RuvyaDCI7XOiAQiMVS5QMcbLkJs1ELurAsr/mU1OAK2oUv74eK7JGkHZwwsD2loeHn3QEnpEi5dQ69dL6k0Etom+tFzhiwDot1WQMSm/uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773331012; c=relaxed/simple;
	bh=jXkw/Wx9LLwezVPoc+CCH8yu7sVp34+2DlmAMLBQoNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eXomEJbreUvpPV186+LbP9xKTb/wtA7IDaWf7wmaxf1dCaOsouB4y11oCogW+nDl0gkgucn1asVu31HChhkJjPJhAv4gSQuXjfMihl01bR6S80Izepb3cdF/srQpoEDa1I7M97bUxA1TpCrYQBLf4eP12CnYbu3a0kGc3OVNglQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MKSmmZEL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FPfwhq46; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CA1sPZ3668243
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 15:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ITV2Z2FKXxhj1Zf/PcEm6ursi3fSbWkI+jtZ69OHRy0=; b=MKSmmZELWkqrzc82
	VVdXQCxHrKj6h1fkgVW7xEziOdAaeW892q47NHvMh5o5vZgPFyANK6Kfx0GeYZDd
	r8hMy/oiCTgzLFQ43UJGaskSDJItGQM78Oum/EsDo1YMHLB5zZYI2t91G3cQRqKn
	m8dbh82LdZH9s2nKAuI6lfejmUiVv/AHlgB103a4nOnxDCaImJS6un2JmJQdgdJC
	3C8nqOz9Wdkno2giyTb43GdI54uAv/5BSR8vpxh6y+/C5RcqeIjCTdKUvOb3ttM9
	vLzh8BuKotB0vrNw52DUHpLr07V0gW+b0zgPo5xaRV0gADT8I6P7I/SUV/oGMoKz
	3xAQ0g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh60jp7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 15:56:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35a21d5246fso61025a91.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 08:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773331009; x=1773935809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITV2Z2FKXxhj1Zf/PcEm6ursi3fSbWkI+jtZ69OHRy0=;
        b=FPfwhq46lAV1BNCarGfU68GPhagp9Sjsr9jrqP2FxNND+hEIToXrQHMUWWF+BUR7wy
         MiVtqAsgrwKeC5d+DnRaJiTC4SjY9wPdydmJC1+Lglie0GIqK1xTiDkB49hkOtuuvTPg
         PIYfXTGgRytSpCHzQDomoHkNsm30Mr+vbs3tOQjSTK0iW6bPVp7c7qsPhaUn41ypkUYU
         WVjGClEr4Zp0FhypgwneG739n6xaL/l8YUO/oCNQvEnIHWf8QsRdS6X1jtmJcx89AgjN
         33n9Qr613ruAkEWwfV7Xeonx4G75v9s1TLb8JwuFf3ejF9Y2NAYSGgO5bOfOrbn4sL14
         Wm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773331009; x=1773935809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ITV2Z2FKXxhj1Zf/PcEm6ursi3fSbWkI+jtZ69OHRy0=;
        b=PD/0T5b8gyGJKgFn/Z0yrWaQ3DMGGbWGu76NlAQ0i75pUmT+GqGOd149Ih3e/tf2zM
         UDDjKMiGU/sjDwh+ycHXRYHerv5xyPLXXjjuOyVacFj5pMKKZu/HRB/33uUZoLkwOXV0
         eA4d5BgmUtKYgyM1769j7dP+sb3DLWMiJnrHD4mbYIxpmJK/Km/LeBN6OYMDe/yI+P8n
         6jTiB+74qRh2KBzJFk+Uy0Afb5Kg7Qe3atM9Tn+YrZUMyFKMhGFRkUtVug6qzWBlOxty
         xLusQqL64cLQ2SpI3Uevk0VVLpVjCDwA/L/s90hSLt/l6CKDwl9qQ3WvEQkXfnVZtZHX
         YUpA==
X-Forwarded-Encrypted: i=1; AJvYcCXC9fKCtmrmehYhNotsVZk9BJQTa10CLJwyQSF+5iixMqJo0kRWkSlxqyoCsPu28c60sZx++TkXFuTo@vger.kernel.org
X-Gm-Message-State: AOJu0YwcN+1667LIILV5d8HOd6/PCAQFA2bhPW0RuSup6/aF79fqtSmR
	hyXl/Iv+E1v5AnLQr6CQsTigWXtQd9UzzGKyyNp9F61vyv6t72/SDYcpVKiwi4kHDHQ4tlRqqoz
	qjm0YPMN5kBcuL0LiZE8ZUsJ5Efs9UUvKupKRD3670D01EFJTIi9MzQ08VOA/0eHr
X-Gm-Gg: ATEYQzxQcE5zaRK/P5JlINR4QEVYJH4EiwQcqnKLFlSbMdTnHNFLodJYn9MIZQeWybf
	UPGtHnJRN8dIreUTjDkjjmCBJkYwnwLm+ZPTyQ6X+RtcglqirqkRR/vHkEB9MKoOspIQnI1gugH
	MWib1qUF0rpKp+OzlWJS34j8IDx9q/0mxGux7xrGLIFfJVdY6H04itCbrL2Xyc1RvIs6Tz5iLft
	x9bKdFPsk0GQDMJVX7p+1bs4jtfWkjjedGOBtoAyWbpQ07xnK0XuLsfZ4eQbb1gPQ5Tw0WD1e+e
	1Tai4cxFV0yL6kNxoON+gitlTEh+Rf+8K6kyr8UFWKwL9oHG2PM0YXKCaDeUTLXdjkARK7Tu9iN
	lZyYoLSQYQqR4ov1FTqUEqVuKUFtPn3jvZvAJtKnJmhyCJMo++g==
X-Received: by 2002:a17:90b:394f:b0:354:a332:1a61 with SMTP id 98e67ed59e1d1-35a21efb0eamr154154a91.5.1773331008821;
        Thu, 12 Mar 2026 08:56:48 -0700 (PDT)
X-Received: by 2002:a17:90b:394f:b0:354:a332:1a61 with SMTP id 98e67ed59e1d1-35a21efb0eamr154131a91.5.1773331008376;
        Thu, 12 Mar 2026 08:56:48 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73cdf254acsm6067852a12.11.2026.03.12.08.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:56:48 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 21:26:35 +0530
Subject: [PATCH 1/5] arm64: dts: qcom: x1e80100: Remove interconnect from
 SCM device
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-hamoa_pdc-v1-1-760c8593ce50@oss.qualcomm.com>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
In-Reply-To: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773331000; l=1121;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=jXkw/Wx9LLwezVPoc+CCH8yu7sVp34+2DlmAMLBQoNs=;
 b=myakjeEITJ/H5ts3QaWs3y1Yjs9Hf/og0xdhtZ0vdfIR3B9DjwPvxYDIcaVqwi56hpizDmwpe
 kWo1sEP0nNUCyu2G52iMRsICwZ9D9XGY4mAslRlKQOjIrYMonHQ7YAJ
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: BP2bbzFdabcIpLyMmDY9_jISEBWev0Jl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEyOCBTYWx0ZWRfX1ySrYbriXi/H
 aEwZHusbH2RZ6LsUYGr6KLjr9VaJuYiLlScQfg7OynH4TZrwbu439OurryZDBmLozi7To4JgyF8
 NRiBGqbRkhaLdE6NIedIGpUrPWZW6Rf/7QqXOkJNj82ZFxcJcOuZ3OXGIV0dn7qoMr89PGYZ6QY
 ibPmGgnyHWLtG/UkYiW9o1Xdcu6+vo8A1Y4aQqoH+FQTFE3aZs1JDytj6TBpgs4QkJQWNGzZt+C
 GjC0YwAV0TGmIm9b9th4aE3xy5llZThqRRrck6CfDncBP81uNb6CiGyron4Zfs/MzKUtanIsUxY
 xq+mktUAcxfA/uKFZPISBAczK3WSOkwGjnMJWVMWaoSSI38ujxDAoxD9F9/Rmtrpo+wH7tK8dtO
 TWf+bnK99KItQ9EfbFqIJfDixusB4g68K3Mw3CBA9LcJ9FfO1hg9cp6mLSAFyukWEiS8kSF/vKm
 517sXfwTDiRZIlZwnYA==
X-Authority-Analysis: v=2.4 cv=DsRbOW/+ c=1 sm=1 tr=0 ts=69b2e242 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=CuJFZRpwjaNh95NkJR0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: BP2bbzFdabcIpLyMmDY9_jISEBWev0Jl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120128
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-33268-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A87402750BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Interconnect from SCM device are optional and were added to get
additional performance benefit. These nodes however delays the
SCM firmware device probe due to dependency on interconnect and
results in NULL pointer dereference for the users of SCM device
driver APIs, such as PDC driver.

Remove them from the scm device to unblock the user.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index d7596ccf63b90a8a002ad6e77c0fb2c1b32ec9c8..ebecf43e0d462c431540257e299e3ace054901fd 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -308,8 +308,7 @@ eud_in: endpoint {
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-x1e80100", "qcom,scm";
-			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			/* TODO: add interconnects */
 			qcom,dload-mode = <&tcsr 0x19000>;
 		};
 

-- 
2.34.1


