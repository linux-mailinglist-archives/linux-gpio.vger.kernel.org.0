Return-Path: <linux-gpio+bounces-33116-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CRXIEY7sWkLswIAu9opvQ
	(envelope-from <linux-gpio+bounces-33116-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:52:06 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 429832614C8
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:52:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF10D30A5CF3
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 09:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0E93C9EF6;
	Wed, 11 Mar 2026 09:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="plq45vbu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dWlNVzX8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D16C3C345C
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773222410; cv=none; b=KWVidcsSRNuziDwE5FbHzbdlcN9LnuhD08jdvd8Aaff113KscQj+C2P1CX7GJr47xr+Z1Fy9v8TIIqPX1BHxlBaE1rrDKgrqVgC3Zo3/joMQ9S+pulLsVc9J7BCpMtpRHrw9x8cd0AXZDx+e0/EttIxHmjuA8HMEvLxu3ojCe2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773222410; c=relaxed/simple;
	bh=xRVBcUcPQn/3XRwGa/LJ62R3q+1u7kG4HqctFlCN9Kw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DbSrFKI55BCyey9FbrU8GJGSxMlbNR8r3ORFDJJeEEx/WIskOgVW+STQlvbsMr4l45YdAjdALhxnBXwaoaG8qOHp/mFvoUv3u755W4rezgGo6FQHoiv4OESIb/IQDrSRMn4ATfKkZnjDK3DHWXjnTk6QGP4X46XzXTnt1FPZzGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=plq45vbu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dWlNVzX8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B3T2F0248937
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GAqPvw1+mNYrygeKcTD6WH5A0ur1DU2x0eDKSc/2zAc=; b=plq45vbuOeZdbTz2
	YBRBl4dde8USmvzjrV0gLoJ9v1z7Yu79CoT6b2Z595ySVwRpzVEn3hx7NL7JDijA
	v/iz3DF2TUus1h+dJPYDBvNJu3qvGWExYrgpaSLNEBaR+XGyZnkDge0V0lVbeAbI
	WoV39tWsTrmMvAEOqXrOykPZ/mcIbGKlSCT9flCiv6LyGsGOgjF9bOI1mLm1oFzH
	B/IM0UEwseJfJvXwUT40BDvg54Y8Vbmr/iLcxeSFz5HYRolVor7rPIAPUzhNx94H
	LeipY2dPqCPRNTxPEOi8OGhv/ZWKopidr/BfmTKKdcnBCyVow/asVBqkCBT1yJf5
	a3FASg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqv12vwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:46:46 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8299499d587so2698662b3a.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 02:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773222406; x=1773827206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GAqPvw1+mNYrygeKcTD6WH5A0ur1DU2x0eDKSc/2zAc=;
        b=dWlNVzX89bye9ldvn5tmCJDnz2HVD4yiKJrGsbc+HRzI/XJrKHfrc2IcVQwbsgcK+t
         Z0gDCHzDW6y4W1CJf8EopIkS1R6g/hYQvVcouDUjM6MQODmwcGUcQnKpPys91bCsLh6f
         glGDBI936Y7nP5BNsrN9YATTQB0HfMafmvvWPjf1bSTwokrD2DYaxKXFkUKIkFb2M1fQ
         5hITU/nVSydJcrc1Bm2/EKUeFpw4YpQw1GwSILIJDcvLhCWy096VcqUhdd3EHFrLKmxE
         XDTEStdllbJeHkGZckWhwHGC4OhrCdrih6SLAp5N0rQ80/9HRYk65YS9LPiasPGv1f3D
         9W2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222406; x=1773827206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GAqPvw1+mNYrygeKcTD6WH5A0ur1DU2x0eDKSc/2zAc=;
        b=L5F7DP3U4XTYddA9Q3VqArq7CjqEXtk7mHoCSr9ZIx1fpL01Ef2+4md0kxvP3RGm8d
         /OV1zSa38OqKyfitqDw65EIaIyq4PyKDjGmadHJqrc1hjvB0mFLTh3yEmV+5gZhCv03h
         dw+hzcLPS1C0iTUg5WpFuK2IkhzucKTUZQ1ZWYmoOL616SA5ZTgqiYNvEfMe5oEMayw0
         XaiRQpEUTRLYlHhLHlcC9VTjnqDmm8WP360Amab5Ktah8+pPI022x6T6+WPijFQCG7Ns
         YGLl45uMBVdEXRDtBhYa/m3GhldK8hQ8orWoHnRriRKLKpZ/eLa8DLjr5J0bm9pQix2t
         q4NA==
X-Forwarded-Encrypted: i=1; AJvYcCUmCmgOlimft3zQuJxiqSmdWdCofj1sEN2HyntRUAlrQ694F4jOXl5wADWgF8TIxqjnFMez24nE1KpD@vger.kernel.org
X-Gm-Message-State: AOJu0Yya+3S+EBBgpIgtbQr0H1vavA1Ig2l7UoC/aJxPJiiPtIrxTePu
	H7HwypRhZyqWdwBrzC1Nn0pXZEcl89dwz4z5f5QCa+jARErupOZzNdozEBg9H8D6RZzFk2OqoqQ
	e9Y70rUDX+HvGSpvH2QkZa4hpvP+LjhQLk/1mmGLy8loXv0yuZB5fiM4p7v0n1DjD
X-Gm-Gg: ATEYQzxS+/Cmcte5X/RiVsvTzWoSQx7pdKCX2XQj+kWpuMDtfjYR+w8Y9/xyLfCGJw9
	H97hbqjcfMf1LA9jlVeNJOEzkZHAu3BRQdSHTioV8c7yM1UL8pJ5Vt5xZjk/2k5Jlg5u3nvkC69
	iOpEO4sYSue0TNhS0Wdhg4ch0PEDDtfjWCGXsvq90WdBJSGP/lZAPs8a6kWmfmYfSPoEvzI6Nw/
	WwnMP+S9U14Yov0MiV6U8adoWL9mp4jQe1L0C4ekNozrqP+lfZo71E4Qyou3oPx4UkcM2gCoKyr
	HCUzIbg+cbDUqMjYA1PQz/boo2rCBI3P5Mg74EVGs30KlhUWpXHAKissB65QI53ZyTzqDKcM/sV
	X18nUk8VUwvSRt99h+EiF2jVwiNvVarVSWcKnGvjK8jHNNcn6tNuTeiwVb6oY51eswVsoRdsty3
	hgHodBeUQK98EGlIwx8CXr6beUYlPcgwEJ5uz3P1AH7Viou+V1j/6qme1r
X-Received: by 2002:a05:6a00:1990:b0:829:800b:9d6 with SMTP id d2e1a72fcca58-829f7250204mr1685301b3a.57.1773222405958;
        Wed, 11 Mar 2026 02:46:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:1990:b0:829:800b:9d6 with SMTP id d2e1a72fcca58-829f7250204mr1685271b3a.57.1773222405481;
        Wed, 11 Mar 2026 02:46:45 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6df5ff0sm1677403b3a.21.2026.03.11.02.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:46:45 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 15:15:51 +0530
Subject: [PATCH 9/9] arm64: defconfig: enable IPQ5210 RDP504 base configs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ipq5210_boot_to_shell-v1-9-fe857d68d698@oss.qualcomm.com>
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
In-Reply-To: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773222347; l=983;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=xRVBcUcPQn/3XRwGa/LJ62R3q+1u7kG4HqctFlCN9Kw=;
 b=46hwhX6Fzw1ORCbsBk9ce+pweRqE9HfyvYl9JYwhPPyKeDFkwXNmr5mWVbAg+j4pTHJbdVwTT
 qb1r79eB42vDxit17ARd9vUNhYfNk6Kyt+cNm8jnJO4pzFxJlBimfBB
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4MSBTYWx0ZWRfX3ceRBK7Op08J
 or0dwFVf4JgOO8zBWs/2ATa81X9JhnreX6udb93ab/OBeiVHF9L1NX7hg9PZNZDUnCUevN+Ewni
 0jneOOr0jXOfSHZcKXtpgl6FDWNF8Pj3iDGVIa/Szi2kMhH+Rc/hDBsgMqCnvdsmLji/GIGl2Aj
 2dXlU4xjQXrrHU+o0aBKweHaUypQBC5cCVsHspnjZdqDDKN4Hloe+W2JOstlKRYJQ6HoEnwcdis
 FJNr1E2KWds7W1VEFDCaZOFzDIss9WGNTZ517fEtpbK66YZIulF+u6J4f+rg3pFZouQp+HujWIH
 mdt3TJnkB7rcbbJvIWe3q430Dstc+3r2a/zeHuzlUidiYOCkWKTUnRd9D6sZE3VUCPYLLHlzzh8
 fKah0Z3qMh2sERb5Pp+JwmwM3xK+tu5p1qwBc51OvIczDh2GVa97Ddh5KTBrh5poJcP9FRn6qji
 VPHSQ+su6AicsaOs71Q==
X-Proofpoint-GUID: f6ojeaNA_2uyNl6_OZwsr6ZeYvXy58el
X-Authority-Analysis: v=2.4 cv=S5vUAYsP c=1 sm=1 tr=0 ts=69b13a06 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=rO3wVDe-YCVyVCuK1RsA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: f6ojeaNA_2uyNl6_OZwsr6ZeYvXy58el
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110081
X-Rspamd-Queue-Id: 429832614C8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33116-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable GCC, Pinctrl for Qualcomm's IPQ5210 SoC which is required to boot
ipq5210-rdp504 board to a console shell.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4ed70ab7ee854038fa7a756d8b650a609258bdb3..59c748efc1ca8d6eb7dca19011d2a31d926a0d43 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -649,6 +649,7 @@ CONFIG_PINCTRL_IMX_SCMI=y
 CONFIG_PINCTRL_MSM=y
 CONFIG_PINCTRL_GLYMUR=y
 CONFIG_PINCTRL_IPQ5018=y
+CONFIG_PINCTRL_IPQ5210=y
 CONFIG_PINCTRL_IPQ5332=y
 CONFIG_PINCTRL_IPQ5424=y
 CONFIG_PINCTRL_IPQ8074=y
@@ -1476,6 +1477,7 @@ CONFIG_IPQ_APSS_6018=y
 CONFIG_IPQ_APSS_5018=y
 CONFIG_IPQ_CMN_PLL=m
 CONFIG_IPQ_GCC_5018=y
+CONFIG_IPQ_GCC_5210=y
 CONFIG_IPQ_GCC_5332=y
 CONFIG_IPQ_GCC_5424=y
 CONFIG_IPQ_GCC_6018=y

-- 
2.34.1


