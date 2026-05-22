Return-Path: <linux-gpio+bounces-37320-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eQa4K+MIEGpqSwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37320-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 09:42:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2636C5B0185
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 09:42:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 743C730156C4
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 07:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BEA639280C;
	Fri, 22 May 2026 07:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UTr7RVyw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j5Vbgaec"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25D41E49F
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 07:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779435742; cv=none; b=ZpzVyNOr7h71xwdNlitHlJDclQVouB0TqK0fuvN6VI2xX2JIP2RZkmJoUEb/xXSaDeciyfEVdmIvqsnwIGZOpTyuag24Jqgf6amtFGgu5Py78x6UT6vgfeSgRhp6N3NapOfkeBH7+hfj5Gs9TZBlvPmGzVG/l6lAkYHVpfbmRyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779435742; c=relaxed/simple;
	bh=GmdbQtXHlx/dL23XiBLsmK6wApi50guOPUdpigkrk1o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=f4wAkYdJ6lxTwbo0zf8f9kbY9CGtxqfKn4hVqe1h0oaEBEZC1XSb004mLDfUOpR4D8UOeUE7vVud1F/kg9VYndlhsBMHN1EFc/ozdtvzauwwSKJBTxI3eA0HGGVp9Gsn+w4PfFS5Sdseh2T/g01glKc0tDjEvRpGC84T6+LN5Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UTr7RVyw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j5Vbgaec; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M41lc13005120
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 07:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tDa3n1fEJvGA2Q+Cx/J8QD
	0BHw9aFXkjrjQeti4WbaQ=; b=UTr7RVywkz6vBheMFQ+U19l0wBWeHUgHM5A4zm
	QHqGimVZPzL4mPrIkidLtIoG2ccrbC4sDpPSaJ6f82w6CYeh9508OhOhTvbTzE9/
	PFw2JxgPfSf0dvaODm77pZeiaV46a/tWjrVO5/3K3m9+K2ZBjc/RIWVGBvMWKY1o
	3fcU1ikUExojqSJndrYfQCHFdMPephmTmUXU0uPUQXjN1hDOL4wWzLxRQ5g5Y0Ei
	9ah79QqvNXG5agZ76nq2glAbqBzpZ4/N7HnlWTQiNkzTTvYyHlDEUuc5eUzGyJsp
	LeR8QOw07CX6dQBbuVO4naVsVJaPxPwRzDEGkvOvBbPYSA3Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrt8q0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 07:42:21 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30457ff05b8so15705eec.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 00:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779435740; x=1780040540; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tDa3n1fEJvGA2Q+Cx/J8QD0BHw9aFXkjrjQeti4WbaQ=;
        b=j5VbgaecgK1PVcKACnHX9y2/EDvoRMevCCir/mMucvJvgV2cLCMxwm3QeU/nvLocL5
         uQlrCIP+b4z9uX5p++Xl1CDlGY4zWW4W3K1mw15GCR9GGRnSXki9PmUYge4GXqBJx2QD
         tlqyr5af/FKY8dewbjaxMtRGYoh266AQkuqId5mnh4B+lYx15x0Z4JDpNxF712xA4Jo/
         zoXDKXI+A3f9mYCjQU2V2OZ8KdmynInSQY/S2bNEcTcg7w07Iftw05tA/GllIYwYV9Cm
         qJVMuHeyofFlyD6fVLtsAllBeu0LQ8sPm+mczuYKDf2tNEAIZ0E1kGoPtBOlhLHsXTgR
         SGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779435740; x=1780040540;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDa3n1fEJvGA2Q+Cx/J8QD0BHw9aFXkjrjQeti4WbaQ=;
        b=UWe+n6Pnzx7drO1oDUJzeonvWOY3BvUgIBIwXaCJWKZmuL0zEUDuFbKzFBR+af02Kd
         oi9AG8X+BuFhXRcQBa7jdW5i2e+u3fM9Y2ThDyCf3RxgoePhdMKqIC8ofcGqDxQly6G5
         nprh61lzlNsaHIXQ5a26j9bGNas12mI9jmd6FUAliY0T22NIV2A3FJ4ffxG8dzkx3jps
         FpyO+JAT3Qc1A0BhuElorNx+9Qno0VEBrTjA1fCcENr26ilieY6RjB1YSxzdo2DiWEHV
         LuUEWSahaG4PkmisuTOdUmw48pvl2TSNlj+3wgLg15pn8y49hWYvE63gtz2X6f4J1Mos
         tXAA==
X-Forwarded-Encrypted: i=1; AFNElJ/58APYAg4aCKWScNpculZ76gL/Dqn0Xf8UCZt+ZFPJy3yxEwN+x32RwoXJTsAY177kVF9KBqmKig3L@vger.kernel.org
X-Gm-Message-State: AOJu0YzdzAmnmDMdXA325v/QYzohazArURHdoOVM6P+E4Ysm5j8Pkgt1
	d6LaWM3ZXeqEo6pe8Xlji1sE/45LmucZBk/j/FAt7HVtTaYUoJ4A0nNcbHLr7sp7ukTcm394FwT
	3Ywu0KXCNP7EFos4hDK85mNDZ+srrbQLJL6EDnGzArruNw4Xx4C/OizoZpp4fq6aY
X-Gm-Gg: Acq92OETmSTJivLppXyBvjfeiDsmEt2AIaaTpLVXktzG9HEH2NRlUnHE4JjfnBAeyz5
	yOxGlb9OX513HkaEkAiOSTfuKOl736rzjb2hNLt8wW+27KgNyOo/9d2DkeZveYdCeRwuE3zhdo0
	VH+FmfX35744DzDq3VTJsrTo/R4ULNdgJXeo5Wxe+jCZm/SwglaVQqzOqmexn7A3sA0Pl29fOzn
	5UtNbWBfVhhd/nFsD9OX4LeeMcwmOfhFDcgZF2zeUIgP/StK7TcFvxMxLxrGfVpZPbEqr5DhIgp
	PqmoZRbs1+rLd6mm6/WyuzX3EGbg5LrbFxyKHGU0khWjlu9F/JIwkJlT+HsodeChEfRra+eQGRh
	/0qqa7PsQyttFwAAPv4G9KLzWuVta0vupDsdY3bbJx7imxxdQp36WEBneZJcQuq69QaBaPAsK
X-Received: by 2002:a05:7301:6742:b0:2c4:61be:1d33 with SMTP id 5a478bee46e88-30448f32d08mr1184158eec.6.1779435740358;
        Fri, 22 May 2026 00:42:20 -0700 (PDT)
X-Received: by 2002:a05:7301:6742:b0:2c4:61be:1d33 with SMTP id 5a478bee46e88-30448f32d08mr1184143eec.6.1779435739803;
        Fri, 22 May 2026 00:42:19 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045225b7b6sm529725eec.25.2026.05.22.00.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 00:42:18 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/2] pinctrl: qcom: Introduce Pinctrl for the upcoming
 Maili SoC
Date: Fri, 22 May 2026 00:42:07 -0700
Message-Id: <20260522-maili-pinctrl-v1-0-0a6636f5c277@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM8IEGoC/x3MwQpAQBCA4VfRnE2xscWryGHsDqZYmpWUvLvl+
 B3+/4bIKhyhzW5QPiXKFhLKPAM3U5gYxSeDKYwtalPiSrII7hLcoQtaGm3lPTVkKkjNrjzK9f+
 6PnmgyDgoBTd/l+8Az/MCVbODlnYAAAA=
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779435738; l=786;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=GmdbQtXHlx/dL23XiBLsmK6wApi50guOPUdpigkrk1o=;
 b=uEq2iQVWQobLKLz0eITogZzpI7xo1ENKZf2iOIqnRBm0cf4JGxM0sSkjl+Jw3tEp71rHbhsWE
 8DDo5MtdIGuBimNSmLxcDEfD2gPBW2oBnVhD71XePg7n/8mZ35EKKue
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a1008dd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=nvY0XyhO1x3eZiSlIXcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA3NSBTYWx0ZWRfXyt+oCOtl2Lfk
 QY87ApUoLIP4Zy+uGRkilDEmU5LVFVRDvLoT5j23Aed6yGAIrb5sOt/6OuiCdHCCSc7bi4D8thY
 x6b0cGXqY/h0Xdj6crqzfgvRZHVkXzXE6qqeyFUGnpK2OUhScXy37dh8IGy1jn6SvWhcJmBA8UA
 0/3ly9lYUZD/+F/xssR3KJzrpfwoxMvd87ednec57K37q2R+SwUmcYzd5Mu0+tmo/MQx1r8RrDb
 yDIQZ2Oyiicr88zuo5FtMBk72CUEsDMGO+++J8ewgidCOMmN6x1IDVChqJob9udeMt96zPOB61U
 uu+eRTsIotcaVizkIoKImEI9CLdfxbIf4+1yBqCdRd2b5X+zymXjWpgNZgpe3xHJBnNjJFiDeP3
 /ejRMArPxjJbLk3nEcShLvo5VI5/wpQfsgZx99807kL8YosIPLunkE8kNqZ0tB4KuDu2Yc3a5w0
 TEJ+aljoDrZ6FKYlvYA==
X-Proofpoint-GUID: VMX4VpyHzZyuyXC77OZJq4fwyAZ8zDZn
X-Proofpoint-ORIG-GUID: VMX4VpyHzZyuyXC77OZJq4fwyAZ8zDZn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1011 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-37320-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2636C5B0185
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce Top Level Mode Multiplexer dt-binding and driver for the
upcoming Qualcomm Maili SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Jingyi Wang (2):
      dt-bindings: pinctrl: qcom: Describe Maili TLMM block
      pinctrl: qcom: Add the tlmm driver for Maili platform

 .../bindings/pinctrl/qcom,maili-tlmm.yaml          |  120 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-maili.c               | 1630 ++++++++++++++++++++
 4 files changed, 1761 insertions(+)
---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260521-maili-pinctrl-6af64dda9a24

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


