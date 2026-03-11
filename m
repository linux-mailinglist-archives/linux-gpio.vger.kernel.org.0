Return-Path: <linux-gpio+bounces-33127-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OF0QIyFksWnsugIAu9opvQ
	(envelope-from <linux-gpio+bounces-33127-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 13:46:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB90263CDE
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 13:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B46831EA830
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 12:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C0F3D88F9;
	Wed, 11 Mar 2026 12:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A4YU5IE5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3t+fSGL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C21357739
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 12:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773232963; cv=none; b=DHgi49s2BgOO1jurOXeNEogE0mNRXftQHnrGIYhiDJ33byvYFxmJ988rGfPNrWb6xId98ns8YD6hjhGUGRlLr0Gft+YhZ8msTFHavOXARA4xs3ju1hVftf2Ki01eoXMBu/IT9VlLN2pKpArXD7Grszs+4ypsb8uiaO0A2gJDuK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773232963; c=relaxed/simple;
	bh=0vwq1vZeNlNbU7G8d2aXQ658vp4AMCCyraxUz3OFeZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OUgfmyn4vO3ufuPVVcnUBd7pH/C/3gB7truHChLFetpy/ra6nDXcYwra6YxxMFQgy3F7F4rf+FliJF+A3ZfvptTS7WlxgBF+jJtjdkIXFnIOFiz4VPc0DiBsTD7ooE8I+xIjncBiHEvLNB1RzZKvCfvcepuKdC2nic+/KDIZt7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A4YU5IE5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3t+fSGL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B8HVY2508294
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 12:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2U3Gp2xDVXO
	XKph+r3nIMKXy68BE2t0+cKb3wRzVPu4=; b=A4YU5IE5ludeJKaYgxZTYdXo70i
	4FL3q0OjRghZ51Hshi3zGaBL+gbTW5tZbAWepZzEHhrt10UnwRGN+QfA/l841kiN
	+aUzo7SMHrVzhcOMJkTcUv7JlQqyTyNnPduyO8IOrt0KWfGy98RYZY0Vxo1fjm1z
	P5WKzrxkjewI7ovcej9rkOE+rCfPzJnMDjWemHxk6O0yi12JalTqc/rw0VmA6dGk
	6g0GaMn7ianbwUpsWH+OXmLo0ns5jC964xyvbzILpClPu+eirsyrRf28Fzkp0/QG
	tPUae4CXFjO5Z4H/0u98PXuOnR3EyiO5akQsqgCu2erDuwkx00kM5FKyxcQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctppakv8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 12:42:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb0595def4so639938785a.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 05:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773232959; x=1773837759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2U3Gp2xDVXOXKph+r3nIMKXy68BE2t0+cKb3wRzVPu4=;
        b=B3t+fSGLrR5Jky7w6/16N3nXe1LM+/XVCqmsu3AtDWrATo9me+pAIJJPVRrPzYgS1r
         DoxBUv+lGKxbAlMMMCOUjcUHHEOr9OWpYtZBI5asG2ZNXS2/EaV43GbwBt0Cr9jw4L0N
         caGKAN2JvOnJuMNa+1clfIQ6cy39GFuzbHz6mP1SkqLWm5ejpSy+wm+muTe+duwArwpz
         PwQBV1tDgezhPP5t1aykwDvE7ZM3R9U9a+FxJPdRtDYKev/wpLgJYybwirhw3qP1b7OD
         J7Dd9bgk4RP0TrGKbx093CWFY+7o9WGCsZW5Pj/vnyPJITyI392lwguBSOIkcyswzlGl
         WJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773232959; x=1773837759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2U3Gp2xDVXOXKph+r3nIMKXy68BE2t0+cKb3wRzVPu4=;
        b=Cw/yVveHoSkTztJvuo+fBiS/un2fEeiF8tVSjZdTnsY7k6x1xEpODwJ2tuyis9Ol5k
         JJpRE1mXZqTw1Zo3m4jjx2vYesjq7J37G58knkD1fUx1nkPmNA/nFylFdOlyKX3+K+l/
         EuRnSWrV7OMFFLNYs+dwrgbNjTAiUDeUDpp+6Vy/LAMLeU3hCbBmVjQCgTTTeztXBLF3
         6NS1wOGj5CaAFaTly2iFDpUbrY/bWPSozPEKqLjlVUt1LweUNVysVGliBa1ZFFJa55cq
         JSu0jHj/LWgHOJoPINP0RgIa/G64q4hxS/0DhJNKr31Kq78V4TdZmW+Yp3c9OiGYwQAZ
         yWqw==
X-Forwarded-Encrypted: i=1; AJvYcCWuVx3QjBcOdxllQ+iCH5FRZlUwGoMBtNNPolLRm7ljMv2kF9ksmpD/lIkh2ZNBYyo3Z3Y+yYS/1HQz@vger.kernel.org
X-Gm-Message-State: AOJu0YzxPrbHIJ+VqT2EWu5dEd658tI4pasy1wRmJ/iNG6NwkRgeSCgv
	RhPTgVulHC9eRLmfIXjB5C4TncgsKUi9bm9mTow5SbuBv6jwM+KRvk780fku+KVn6io4LqXHL7t
	UGtGS43SnCgNIYyp0Kg6dNHGpUIUkQJIy3vkhR1zvuxvLCbi53cWPbT5Aba7cBOQk
X-Gm-Gg: ATEYQzyiFww46ujv4F9AnHbhpmCYjE6FUBQsLuz+SJ7x9P4rHohS2b7MU4qAartKsG7
	SPTaUyaXpYM52SBzrPpbCvrMNvaqSfENiE3o8VAJv3tfwdXiu9SJ7q0XCGi1yS/GiN8svs6RbmW
	dC6mejfgOdHTwImX6ybPy1dyZ9Qw/LJ7HRtPSUZgxwAhbsSfGNpY14RkpVKGWpXWfBXE4bnzAGY
	AnI41vxm7P8kbc+GyrYMrQKbstacVGlEfVojkUGNcOL3gHXdCZgpyTFyFqOEAEOiEdWyg5ZDsMX
	ITVOPCkwV4VNfu8TUa33zMbX+FT6cufWIDnW7588+Q3MNwK85I8pdqu3K/s6slNyLszgexfEo92
	FZeV0Iq0jXaYbNn2N9wBsL4Cx+phlJ2FOqNdlyTqtSHFUeJeUPPm1tcY=
X-Received: by 2002:a05:620a:7104:b0:8c9:e989:9d8c with SMTP id af79cd13be357-8cd93b3cfcamr747696285a.3.1773232959174;
        Wed, 11 Mar 2026 05:42:39 -0700 (PDT)
X-Received: by 2002:a05:620a:7104:b0:8c9:e989:9d8c with SMTP id af79cd13be357-8cd93b3cfcamr747691485a.3.1773232958697;
        Wed, 11 Mar 2026 05:42:38 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0caccasm39011365e9.6.2026.03.11.05.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 05:42:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, linusw@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/3] arm64: dts: qcom: glymur-crd: add Audio sound card node
Date: Wed, 11 Mar 2026 12:42:30 +0000
Message-ID: <20260311124230.2241781-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260311124230.2241781-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260311124230.2241781-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vo-PyjmjPZTuUfjlcnsS43e1kzzyeJST
X-Authority-Analysis: v=2.4 cv=D7BK6/Rj c=1 sm=1 tr=0 ts=69b1633f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Q9KsY8QRZZO8mUXd1LsA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEwNyBTYWx0ZWRfX/0ZRqO1P0eXy
 RyeZkLtFBbpc1vETu1YtM09dfVkbAIdou0+RTmQQyD4ytYSV7JwZkGlvisQybgeSzMYDhg2Zcrh
 IAMiMs/QSMl4DRK2p9Aaj0pCvgeP6Zejnj4uCq9x2fGRfIbvQSpCfnOOs8W6BRqDV9JXVM+G8Ba
 GD6O4ljCyJvNz91ydI3F8SCjJgzngkFVH+nnrAJdmamPibdqt0L2e9ZQoQvX5APMPo4eS7VMDbr
 pVbsHm/iZRVe26Ij56KmD7WBZ2L+VReUe3L/38oDRfqEexXc8gKL+AUhoXkA0tpbS7ghe7RLhwS
 tq+uPaQt18cPVnpnqclnUOMC9g9UH3+YgcjiqSQa/JbryCLNFAYC5mF6rggmcNzqLYgEBGz2ofY
 EiebEkeGvlXYKsRgM0ZmY9VgbVuxwiOWoM356r0Cu8tlhCm78Run0ZxLi2mYiO/ZPYz02TsOzRt
 Q2AJ4LsHE1PbpPGrSXQ==
X-Proofpoint-ORIG-GUID: vo-PyjmjPZTuUfjlcnsS43e1kzzyeJST
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110107
X-Rspamd-Queue-Id: 2BB90263CDE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33127-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,0.0.0.0:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add the sound card of Glymur-crd board with the routing for Speakers.

Add device nodes for the sound support with WSA884x smart speakers
and playback via speakers and recording via DMIC microphones.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 110 ++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 6b7f91a3a968..39e15184940b 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -121,6 +121,54 @@ vreg_wwan: regulator-wwan {
 		pinctrl-0 = <&wwan_reg_en>;
 		pinctrl-names = "default";
 	};
+
+	sound {
+		compatible = "qcom,glymur-sndcard";
+		model = "GLYMUR-CRD";
+		audio-routing = "WooferLeft IN", "WSA WSA_SPK1 OUT",
+				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
+				"WooferRight IN", "WSA2 WSA_SPK2 OUT",
+				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb";
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&left_woofer>, <&left_tweeter>,
+					    <&swr0 0>, <&lpass_wsamacro 0>,
+					    <&right_woofer>, <&right_tweeter>,
+					    <&swr3 0>, <&lpass_wsa2macro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -367,6 +415,12 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-names = "default";
+	qcom,dmic-sample-rate = <4800000>;
+};
+
 &pcie3b {
 	vddpe-3v3-supply = <&vreg_nvmesec>;
 
@@ -485,6 +539,62 @@ &pon_resin {
 	status = "okay";
 };
 
+&swr0 {
+	status = "okay";
+
+	/* WSA8845, Left Woofer */
+	left_woofer: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "WooferLeft";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <1 2 3 7 12 14>;
+	};
+
+	/* WSA8845, Left Tweeter */
+	left_tweeter: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TweeterLeft";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <4 5 6 7 13 15>;
+	};
+};
+
+&swr3 {
+	status = "okay";
+
+	/* WSA8845, Right Woofer */
+	right_woofer: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "WooferRight";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <1 2 3 7 12 14>;
+	};
+
+	/* WSA8845, Right Tweeter */
+	right_tweeter: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TweeterRight";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <4 5 6 7 13 15>;
+	};
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/glymur/adsp.mbn",
 			"qcom/glymur/adsp_dtb.mbn";
-- 
2.47.3


