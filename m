Return-Path: <linux-gpio+bounces-37686-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oP0NExWOGWpTxggAu9opvQ
	(envelope-from <linux-gpio+bounces-37686-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 15:01:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0D060298D
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 15:01:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 58C7930DBBE4
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 12:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794942DEA95;
	Fri, 29 May 2026 12:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MyxzDCrL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aKxomcpG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196F42D7DDB
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 12:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780059363; cv=none; b=Z5b1iLvzMgX3j8jFrFkvEpz/5RRpib+iAScTfBlGi1zCNqJrmUE9S/8y/uMu95wGDbMDenFCvqDwmPolPZ/cCkjnpfb/lGVuzV1oaZzqBfZVWWprJKCG70btrejvvGML+uSwyHQUh8mAq+oFwGXF1i0PF//rWh7BWxjqSTxvIIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780059363; c=relaxed/simple;
	bh=u2cMcr5HE8UwOxEyPSQkXlXuLEhA3Pue7ToinV9y2cc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k1GIr6/m7vLGcOJQX8mn95SEeQ4v11u0yoMHp7/68UtpcLOZn3YdLCMPUQVJVeA+V8b6KemXdV2OFyFxv3wziNZNoW8Ifb2Fbjc1FPQ2vz+JBJrqNqm2Q8dqUdD8lNpeoXCxxPanKosucBYitb+4lyXYZf9hMCn4date7Q41OUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MyxzDCrL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aKxomcpG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T7EnDS1830098
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 12:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ercPn/s2CwMvDRv6sn4QZS
	eYjGszx5dex52JjxqqwDA=; b=MyxzDCrLu645MFLK4X5fwZAJvvUNZreBjptlI3
	ERoNhegopQ70WZGDh94JKnDKL8FoqHmSSI3FodUFXrXjn69G+K8D2ilR3fa4pdcB
	yCByyW31N/PbSAGhR0TQ407cTyaAXYTX1yJDwTOlQkfJvNDE9vEVQPffM+l2tdCG
	UR9YJQDYL/0RNGpGD3jPQTvklSVevSBao1IGYYL6Ht8VDw1C4FRJx9kp1iF7LT6Z
	HosrQuzNXgVxKqtfGkeHRuXS4Vzha0HKa1xe8O7hH2N8aIjB3gGD46zUm1BhKxVw
	qmp/ioeVK8QHKUSw+OJAO1L9O67yI6dFJDZyQGGlbmQlEeiw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eex6m3ayv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 12:56:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c857ebbb0easo90631a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 05:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780059360; x=1780664160; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ercPn/s2CwMvDRv6sn4QZSeYjGszx5dex52JjxqqwDA=;
        b=aKxomcpGLRA+u2+mdcO2NoVuEnnu6ISmRz+WWgnxOGHTvUTNOmkH6s6X2Lh+NLZnfc
         UDWTN+HirqCcS2FZhy38l8hUu+iHjXkYMIXZphWIu4gC5spz1/99RXFAYmxU9D/xQpkE
         R5O4a/CEiAdIeuF32nR0NGik5Rwe7zm1rX/38oFiojGRILV1/Uc9DrAdl/q/y7h2+iRq
         RC38e0CAPXCE24vWCPJUc1/S75ABlsphKr5KmVMHSZ57OlKcoX3AHWPq7gKNipbQnDX9
         /potnudhlwqBqGizaJP9CPYtoLVK60a/iJCMLDs2qKRwkiFRZCmhYYzyx7p+qN1Gn6a3
         r4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780059360; x=1780664160;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ercPn/s2CwMvDRv6sn4QZSeYjGszx5dex52JjxqqwDA=;
        b=STnk7rlBYgjxK5k4sLbLavAssaASn98KZBBVXgBpeoY8Vql4hDw3NsTuvTT19+UHQt
         PSnlYf2Pm2X9nYLMpVzwVmL9XXiLQkqaqApFasZaqnwNuKBl3Rzx/MZ8yWsQCsF/eMqu
         KQlFr254UFjtv3fg5RO0JlzCr7dS/CnaChlMto2N5oWTYOtfaz5r2bup2K+8zT2N1KiL
         jEif7iYzZ7rl4Y/nsa/XP0trTaHtqLFgp8y/AmPxelGrnksag7ogIh4WHKttHXb/6DO6
         uRzHJzXL619PsE9rf9ATB0HFupoy+cEpJkOwwBWnu3bB1aqzvhLy9Jr8E4PJfqTbv3DX
         KP7w==
X-Forwarded-Encrypted: i=1; AFNElJ83FfuCyFVMOtEapKAJVm50WRlnzDqWf+LRa5tqtIxxVykIh3/+T1zFoHS+nqYcRrAy5uDkUEFnUjlH@vger.kernel.org
X-Gm-Message-State: AOJu0YyAN/Dkiscm/QEGqBTk7dRZ0BY8T2DkD4RzjGQQ/Y2uBDsTZHcK
	XhKJ0xhEoZQsswyMRSFpxMmC5pdx4M3eWXtW4qEofRfn0o1luq4tXvFR+/kMhrA+hzJ/Cywo/ju
	tg3Yg0C2xod5c6l2cmwcDMu//jams3W1aVKbKeqA2niUa6uyJXf33HTe5xZAC+Zi3
X-Gm-Gg: Acq92OHu7/sTMURMcqA81L/ACuP4MsRRzXVnOxqEBwvStrRBlfOti8wKjvjIeOVozPF
	E+8cSIWidtFqdXrUpQZS8YwIPC5tyiFoTp21ODeapT1P3f1yrecxHuLCO9/u9T6OvG4z1YMH+wP
	8WswszezSi1nnB5PVFdlWcrEV09E9Qa8tUF79UiG190m9FWm662QNsAZMSYmPtg2sRmoxzA3TKM
	zJvhlgbBBIVD19WY26hnHnUSs+dDa3YD1dh2RKUHkryVXW53vfl1J7QiYRJ3Pb+tTutd0rUKgd4
	0UeWpImDkwcx8o4OHgus5zvjF9Dq6CGzAJ8PI52BSwZhSNgI1R2ghcMu8IAqj1w35PjnPrJu/ki
	424VD+sSXWtbd1sWCypP/2rN+srV2UMcMxzwbBKIN7U/a+Mpp/QkRiSFWs4yj3g==
X-Received: by 2002:a05:6a20:7488:b0:3a8:800:bdf4 with SMTP id adf61e73a8af0-3b40fd7b546mr2896174637.33.1780059359858;
        Fri, 29 May 2026 05:55:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:7488:b0:3a8:800:bdf4 with SMTP id adf61e73a8af0-3b40fd7b546mr2896150637.33.1780059359358;
        Fri, 29 May 2026 05:55:59 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85771a7c24sm2119680a12.2.2026.05.29.05.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:55:58 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH 0/3] pinctrl: qcom: Correct MSM_PULL_MASK and fix resolving
 TLMM register address.
Date: Fri, 29 May 2026 18:25:43 +0530
Message-Id: <20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM+MGWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyNL3ZKc3Nz4ktTikniIfLGumYGZYZqlabK5QVKKElBfQVFqWmYF2Mz
 o2NpaAAy50KpjAAAA
X-Change-ID: 20260529-tlmm_test_changes-6061f95c70bd
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Yuanjie Yang <quic_yuanjiey@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780059355; l=887;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=u2cMcr5HE8UwOxEyPSQkXlXuLEhA3Pue7ToinV9y2cc=;
 b=jlxMhG8HeVPUKFm7bFRvVvEbKCSbxAu4kMlJZBR2ecUmtSrdJWzR7hIWdDp37L+o7xk+AAEYK
 +dDKzsgFwdEADjE7XkY+eqGDVCFV3oxI2RW9MmQJAqPhkmyzAskPIxH
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEyOCBTYWx0ZWRfXwFvEnAVLkF3D
 UU/1rP73ipJgjDDMF2r4b21aLIUv8v8wIJKCyp3LBC+pmM1hVgsdLYFzOni2LA/IEJaTrnpbG2L
 UeC4nW4pgNKt2Y5DVMxXReVrd5B51HjIj1sZuosRcByLhc9oUvLnCPxDLmnomc2Xy0VJaERMLOX
 KjPciQkF9z7TAsjMmPNGprkGhv6HR8DtDzk+EMPLLba8QDxHqbeN6WiyQhHJ9xBfHN2ZujL5Djs
 QRtWZSmDq8psD2D5Ngzl3wOzCA9aLwq+Tj+72FTVN66UZ/dgev40mF+owV/8KDGg8mmORQGVViU
 vnP7cUPbzRypdk/UHGgoXkl73xOi0V3dOTQFAylZIsOyuiYwTwHaMWud0JCD6Y7BjSzu3J+VTCD
 J6/67G6fTRdeFr7CGSSm1XDQYBCAB3ld/l91FsaDi83Ia11erha0xzSAHWs2WYbBsdAfQckcrFS
 gIBpQNISsfakSh2KGFQ==
X-Authority-Analysis: v=2.4 cv=frnsol4f c=1 sm=1 tr=0 ts=6a198ce1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=nsOrj-K2rTX85Cj0LEgA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: GuMgux5_gG-5vFuTdnDa5jAuwazyLfwP
X-Proofpoint-ORIG-GUID: GuMgux5_gG-5vFuTdnDa5jAuwazyLfwP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290128
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37686-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BE0D060298D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Modify MSM_PULL_MASK to accurately represent the hardware configuration.
Also fix the register address resolution when 'reg-names' property is
not present in device node.

Also avoid assigning thread_op_remain in unthreaded test since it is
only used by threaded IRQ handler.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Sneh Mankad (3):
      pinctrl: qcom: Modify MSM_PULL_MASK to accurately represent PULL bits
      pinctrl: qcom: Fix resolving register base address from device node
      pinctrl: qcom: Avoid assigning thread_op_remain in unthreaded test

 drivers/pinctrl/qcom/tlmm-test.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)
---
base-commit: 8fde5d1d47f69db6082dfa34500c27f8485389a5
change-id: 20260529-tlmm_test_changes-6061f95c70bd

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>


