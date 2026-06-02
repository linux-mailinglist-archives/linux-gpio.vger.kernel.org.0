Return-Path: <linux-gpio+bounces-37827-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GX6QA2H6HmrFbQAAu9opvQ
	(envelope-from <linux-gpio+bounces-37827-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 17:44:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E29BE62FEAE
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 17:44:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=R190SuZQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hJpMVine;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37827-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37827-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F2B2830AC003
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 15:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625C43F23B1;
	Tue,  2 Jun 2026 15:22:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67423EFFD6
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 15:22:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780413756; cv=none; b=ptyyvhWdSGpHYc2y8Ade8TAZWB5erXTzlVPjvhh1OartVl2UmzNK7fW22zbqxXvcOpZUCeYbXYHQXBS/Cps617EjfSN/sb6Q+vt87m9uOpjtzqzTGszYbMNN13YD0z34Ik4o1k4Saspo8QcIIUaMdsokexTXqZTd6qckQjyG/hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780413756; c=relaxed/simple;
	bh=kcsFlQ0y8ffq2yUPH+MjrZDKbFx8blbaS/9oyuSRv98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ojZb04H3NTW5EeXdNM3VrSmeZ9cj7kXgftZ5HGh2D/Z/ogSpW9DFiN7P5sxQMlgvQoMr+biFvSBCzOfVEShzA2XnAYUMgYNsDsEgL/C2Lm6hB6V7dslN9a7POZpAHXGOVu8aADZ3gdM/XFNYuiiI1SpBnfzhyzq9sEcpUJpx9qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R190SuZQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hJpMVine; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652Cf1wf2884659
	for <linux-gpio@vger.kernel.org>; Tue, 2 Jun 2026 15:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N30aZi9cDCAXsNhZr7OUSQcHTSPHi+a7WxoDVPotoJY=; b=R190SuZQhVT+dzXF
	9n1X/qUT5Gha/CpxR+ho3DyaHp5Uk/w+4E7VFPajGN2JJmDUnszQQcnHyCNHDV3Z
	/bYAA4OIf7grvPFb/t54Fb71JVzBd2X8ry9Mt69RmMGoHzIP4Otpr04JpKH3Q22D
	dNwRj/I2ze98RRNrGh+nKTwgoNV7e8KGUWRBbgpZMaY7YDPNOpghDG2ac4aX46ax
	sowX0BM2RVDHiPatNWU/w3yZjhv1utSn6eyOD9EaPVfZVPowxbPyKWVFNj4J7U9E
	WxKrN6C1lxAn65IHdX5eLFPEsePHW5bLl4dAnGWIxtKVt3A9U8jDhprfJ1ohbH14
	ScAAMA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsu1253h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 15:22:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf1dece2ecso49796285ad.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 08:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780413753; x=1781018553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N30aZi9cDCAXsNhZr7OUSQcHTSPHi+a7WxoDVPotoJY=;
        b=hJpMVine9h0mR4k//Bp8261+2RM5v+SwuN3dfzacCa6+SCQHRfyWFl1cO3u/1M4xDB
         Zt55aawXdFM6MsNLZfA81rPhbMI/QMAA3SKEgSQpuTK1pdej01VoozbueRfLDH5kzmcF
         Mt1IvBULNmgGRCG7Y+VzNck5zz3rjNEwGEoz4WVT7cRetV/zpKYp49c/NRHYqQEn9Aln
         alpTFWT+cpK+ci7GbouoBem8Z+BljxOgKnuF3XbMAVyq9OUq9KybkmYVGpQtgPtWWI7Z
         tYeTgqYUOmoL8Xilna+fTHEaB+uF9+GqpknSrqz9N64X40H49WkCzSXui399QK+/o+mF
         jO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780413753; x=1781018553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N30aZi9cDCAXsNhZr7OUSQcHTSPHi+a7WxoDVPotoJY=;
        b=GgaT1B1ZwB0P4OMDLYEU+J1VJIXwrAD9409mu4vM07Eb7YuKQtL7WFl2HHRTbC/cJM
         kv/XmL6Kt5WNFoeIJmoyGmj3gzjzVXJKPGVjTbFOH3ttdpNmhYnMZaneFAgUu5TRH449
         s3LgmT6NW99apEY3pn467ddxcV1d089eOpeYcW2dkLtMjYLXBRaGveFENsnjKDKv8VR0
         UTvExgC6uuBYz2DY90hhseRbFWPNum91gtVQgouBgXPbjtjJJw6d8fVIuBjDDLGCR2b0
         xqEQsMQCFwe1y2fzXV3P6RTp6SudvuGXIbDAqrlJbvVbdd4dsp8ZOxmZHoXRsxl05XlR
         nw8A==
X-Forwarded-Encrypted: i=1; AFNElJ+FsrrONVtcg5tIIpyougBnSDT7whXh0teubuvo3r0TbsTe+333ymyq1p07Gr3nrJyAQbLnR8LHZbO6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Zgi5UgpP7A/TX/sYd8NjUE+lxC28M6uNwSXtC1Zb0HNNU8qN
	0H+FBJRRQxA5SK9hOHKSqclLgaWKNGMex43QERZ9qu9M9oVB3twccV3isxUX29kZEZ+qC4RBkqM
	6ewjN4FGVzI8JGMJ3Gr7xQQoS1ngAUhgFg3RPG/JNYxLtreV6TZwQm8U9j6C+CQS1
X-Gm-Gg: Acq92OFLdLqlt7awSpNNa4AqEDylkCBJsQLyrx3s6DooEY8Jdb1iu1T6lDaFMFEGWkx
	mPyDo0Di8aH4ao+pYzAkNmheyzwkULqPhWe5T9mVkt34vEPoYmYNvqZFSHcvUvXZ21GIIU/gi6h
	Fo8s+m9LdNxa0q890gwHTcB8CTFWaGOa0BKhJ1dW2lG7QJlk5Obac9Piq2JWUoVpdcOdLFI+Zh3
	qSp1+1qoLOqRtNkAzLjoFvD6IMp2P94+vd1+Um0xoT9OIkOyw2KE/rCXU0nlDEGfzdNhdwwNppo
	f4queDccZWrWiMVsUOV9a93uQq4BN5vHLztepkBBf/p9xlwzqjCJ2UwRT2+IzBbSq2KzRXKR3Wn
	LHd1GwkuuuwZnXM+5cv9vcjPNtBdSM81WoAkIY+34aAHgh4L8uEJBzhLZ
X-Received: by 2002:a17:903:986:b0:2bf:1e59:d99 with SMTP id d9443c01a7336-2bf367950ffmr166701815ad.8.1780413752746;
        Tue, 02 Jun 2026 08:22:32 -0700 (PDT)
X-Received: by 2002:a17:903:986:b0:2bf:1e59:d99 with SMTP id d9443c01a7336-2bf367950ffmr166701405ad.8.1780413752237;
        Tue, 02 Jun 2026 08:22:32 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e71cbsm135136465ad.15.2026.06.02.08.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 08:22:31 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 20:51:53 +0530
Subject: [PATCH 5/5] arm64: dts: qcom: Add GP M/N clock controller node for
 SA8775P and QCS8300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-pdm_clk_gp_mnd_v1-v1-5-1522662b6c53@oss.qualcomm.com>
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: lzYf-SMpTTEJ9moODN33kc0E2DhInI_t
X-Proofpoint-GUID: lzYf-SMpTTEJ9moODN33kc0E2DhInI_t
X-Authority-Analysis: v=2.4 cv=MKFQXsZl c=1 sm=1 tr=0 ts=6a1ef539 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=xYDh6zYGlObRgEhEGzgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE0OCBTYWx0ZWRfX0W6TBGZHdxje
 +CsFrBVcjBXm6pABhj0ZvuFxSHinoIAleSJEShcSWnpgxBGSP6x/j8B3UGigikN+3Lj5oNnLdGY
 Kv22DsD3zpi6tu63FogEpfgWBNuNHtJvWaXDkkTdL6uQCvCVHkBvbhzFW2oa4JQ1OqVipJKvOqC
 fISnJMcGjoa2y4aYgcq1MGbvmckx9ZnyaONeuhKDUQWAvAnEMnvaistoB66MXPZbOi5xLZbEI3o
 axMiMrkKTuf0HvMnKNajVZ/eeovRuBra7xOqSxKcu02OvJOMQapO7hAj0Z17/4//08IWeUHTXxJ
 F5TAvqoum21OvpBpYU3c/maIkO0lYWJvsZTGQeTZzwOq/iXL92FrqNgCUxI8JIO/NxssV6EesVo
 WCaNi3N6ZfOCNqKr7dPrxvJnZs/RkygJ20hdhjBE8VVqRTmcHYHCKzTb6AJieVtkzvusqgFPrIh
 ESD+MEMqe/A6MM/Q2Pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020148
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37827-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,redhat.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:richardcochran@gmail.com,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:netdev@vger.kernel.org,m:taniya.das@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E29BE62FEAE

Add the GP M/N divider clock controller node at 0x088d3000 to the
SA8775P (kodiak, lemans) and QCS8300 (monaco) SoC device trees.

The node uses the qcom,clk-gp-mnd compatible, is clocked by the PDM
XO4 and AHB clocks from GCC, and exposes a single clock output
(gp_mn_clk) on the dedicated gp_mn pin mux function. The XO4 clock
is pre-assigned to 4.8 MHz (XO/4).

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi | 14 ++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 1ff9e1598d00429c03b2bcae41fa370ab2c892bd..cbc13ac37f8aeb0b1071ad0609ec11e829d2c798 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4412,6 +4412,20 @@ usb2_role_switch: endpoint {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,clk-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0xc>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm_clk", "ahb_clk";
+			clock-output-names = "gp_mn_clk";
+			#clock-cells = <0>;
+			pinctrl-names = "active";
+			pinctrl-0 = <&gp_mn_active>;
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <4800000>;
+		};
+
 		qspi: spi@88dc000 {
 			compatible = "qcom,sc7280-qspi", "qcom,qspi-v1";
 			reg = <0 0x088dc000 0 0x1000>;
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 19f8cf4e15482947f6049188050c370340afaead..d192f92a896bb13017abdf82062e8305aab3e5d5 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4353,6 +4353,20 @@ opp-384000000 {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,clk-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0xc>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm_clk", "ahb_clk";
+			clock-output-names = "gp_mn_clk";
+			#clock-cells = <0>;
+			pinctrl-names = "active";
+			pinctrl-0 = <&gp_mn_active>;
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <4800000>;
+		};
+
 		usb_0_hsphy: phy@88e4000 {
 			compatible = "qcom,sa8775p-usb-hs-phy",
 				     "qcom,usb-snps-hs-5nm-phy";
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index ebe5889daa5300efa7857314e9170d7d2fc33ef7..f6c5ec38c7491b7a16ebfb853f8af88bdf1f0db3 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4867,6 +4867,20 @@ opp-384000000 {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,clk-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0xc>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm_clk", "ahb_clk";
+			clock-output-names = "gp_mn_clk";
+			#clock-cells = <0>;
+			pinctrl-names = "active";
+			pinctrl-0 = <&gp_mn_active>;
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <4800000>;
+		};
+
 		usb_1_hsphy: phy@8904000 {
 			compatible = "qcom,qcs8300-usb-hs-phy",
 				     "qcom,usb-snps-hs-7nm-phy";

-- 
2.34.1


