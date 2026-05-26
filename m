Return-Path: <linux-gpio+bounces-37527-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMiYOc19FWpEVwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37527-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 13:02:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CA65D4924
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 13:02:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91E9F328ADB0
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E661E3DE454;
	Tue, 26 May 2026 10:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bPnPf0rG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X6Z2kjPM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5873B3E0259
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792933; cv=none; b=UWtnnTqUykL9b+cqT4ruwxCzFXxctG2AhCyjc6Xw6r3mqZqmbEMd3yG4rIYndel7K3uGGQ8TZ+7ma+mGMZ1vAOAD06/GIQyTph7/tWjomm6hIQUw6mshMbs/AI2BPpFVsRAit/TKS3TwIdk6PjNkT4cr8RgwXJXR1RlHfJJlk/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792933; c=relaxed/simple;
	bh=zb4Ff0vj0Rip79kK/H2K8PJcwVDoHRmqjopw2ShHmHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZdGK69zAabfPTG1/rudHxfM0gvY5Ck14HUSs6q0V4X+dWSdoPuBB456RjmCGk80f8nfpUy9YioG4B5qz+2KFk6GsQzNmZ+foXibIEAcFctDZNlg0jhL6majbbXObytc0gKYxm8dUAH4sNoEUQ77jD9KHEJA5paVgm92i9HBfF44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bPnPf0rG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X6Z2kjPM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q6QWOE2145988
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rUr+qjvZHcFisrq6G6teTMwSeaERn+YfgHumNM1mZ18=; b=bPnPf0rGhspbwW5h
	o9qeX3i0Rg0PB19aQmDANBSIdOGt6PvWknTl7nGFwuzYGG1loUE8Br6XM2aHJ78U
	6IaF+PeQVcPSTposAj3Loi2h60Yhx3So4K0GQZ+ZrUGSEbbX046L2lR99vBYkklW
	RThFYBAh+BpT4F8SOjdUDbiGk23uvM0bctj3en1LcSiNCu5gsq3qjKyt0xGWS9XN
	lfoCW2fL7k5cZYMRl2NRpNsKANVkogksll2+Oc1I9+VIk6LUbw/VP045NW6EB5em
	h6vjVMSht6e+dzowqHoWXyr/VJvSKqZwy8lMaOWQ3mYegWna2dyQ1mOGXdYxajmW
	2hNiIQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv4agb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:55:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b458add85aso114595615ad.2
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 03:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779792931; x=1780397731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUr+qjvZHcFisrq6G6teTMwSeaERn+YfgHumNM1mZ18=;
        b=X6Z2kjPMUgqaNucyuCTQOcGLg3B3+vzl4/TzS+n1ZCX4N9lE3GLrrVGIqk5mB0J0KF
         jgvqO21JfRzoz9WIHwZI5hFeBX2NZaIG4fO4/pIzP2TgEOLYBAPlKHvZdyIiXXcK2JvW
         lf9NIWSWnTk51vb+adlcde0M32/9Vx9Zzew+4Y8g0pMABYEqslDALcseVHf+0lfo+SVB
         CREbisK09Zx3c4wUZH9hDEKFQcAKbQbQ4cKXtJgDKsP5WjUMN59TcGqU8zj1L9i5Wktn
         NCYlzzpVghiHUY3Q1PRtesS2G3idoOwZzbCGRVLJRT6mheO5Y7ygx6/esxSkbln3c4xa
         45Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779792931; x=1780397731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rUr+qjvZHcFisrq6G6teTMwSeaERn+YfgHumNM1mZ18=;
        b=mtFodysbag+H/oyf1n2RLNezJg0Wortto42LTJ9VCvpQujgVunNCbnMkyVI1J5BKyT
         Iyhh9otbDWFJxM2K6CM/vazpN1YISpUnElxKOr/loTf9zZI5O56+0UhW/W6uuYQSbesv
         HxZgNVh5JVjjnhOOppXUW5UZPtO16cSH+uRvRDrl1/dXhkHMsWKd9pdZoweJXTX/Lz7h
         3Swv99L9wfxX+mMMK4en7JWGskSF2JzlD8mC0PBsykjDJiHzrdJH+/Xpf8LkoKTe77iB
         y4QgQS2+7NeZGKY31T2JGVx9k+EecLiUaTnaXer0t88l90UfTlc2DThy4J5YW55b/pjC
         YHnQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xtjRN6+TjmVY1mB3ptWnKteUmRudFHhvPlTldlZwsEKC6swgLUutaTV4wrjIoIx20vpTQNCDD/Wde@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfhd88USZzcamGHBDXZm+YFk0YSu4m19lgdXIusUUJo0yk6Y5O
	jNaju4qDzIwpCyb2yvvEFp9DRTuD0ma41+5BCsCgkmv8Uje5SCJWu44XPwFrbCQPi0c6mzbbPNS
	SFlYb07VJPIGvAkUvI81hkkXSh594fJ0xtuagbqq+HJ8xp/DCjF75ZuSXSYedO9Rd
X-Gm-Gg: Acq92OEbyY+rsdFqBedDIKY/rssTMtc5L8txqz0ptARmtOJtmYRqgF5PM0wf2ggZK3h
	0n2aKiIXVDuBBIwR3UIybtr+vw5ZO8o48+MEr6mPKLeUuvq7iAJaaTNy3moN++LrMQVbWXL7DW9
	d3f/92PnrVS77Snb2vzlRZUg351KszHuPW+Bfkji4Ug8KovBormBrMS2vUHBdnj47bBKwQFFgat
	QKEP5WVmmUuldFr9NOwuhbXGJe7x7GLEjVwAWldi6+0TcLHSsfnukhOenw5ga7+zqpKdRdXCYB0
	m5Xvgem2Ip8l6jfDufh6SnQz3EtCnvKqPFN6+meK+vsQYwy87OpMZIUpVg6ivrqIAwIc9zyNcip
	a28IHE/kMx2b5YlD/nn8SbKJlBvNFt6BMJTNmaBfIZNULri8DVeDRQZkSCjda
X-Received: by 2002:a17:903:1ac5:b0:2b2:4fe3:7b89 with SMTP id d9443c01a7336-2beb070c102mr199594035ad.38.1779792931036;
        Tue, 26 May 2026 03:55:31 -0700 (PDT)
X-Received: by 2002:a17:903:1ac5:b0:2b2:4fe3:7b89 with SMTP id d9443c01a7336-2beb070c102mr199593775ad.38.1779792930557;
        Tue, 26 May 2026 03:55:30 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f3dsm120890025ad.1.2026.05.26.03.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 03:55:30 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:24:43 +0530
Subject: [PATCH v2 7/8] Revert "pinctrl: qcom: x1e80100: Bypass PDC wakeup
 parent for now"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-hamoa_pdc-v2-7-f6857af1ce91@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
In-Reply-To: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779792895; l=1077;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=zb4Ff0vj0Rip79kK/H2K8PJcwVDoHRmqjopw2ShHmHQ=;
 b=J51ReIPmh2xekMGenUCwxLHQPEGCIhE/PrGpb8IamhqtLDYXmm1faChJov1QrXC50F6DXUad6
 FquiZjYXOFeCV2wXYieJUsa/2XWgDEwvc2U/MQyFZyvBDgU4j+4oRXm
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5NSBTYWx0ZWRfXxn1nzAWv+kJZ
 2D3xv7PVZHc860lnj78A3AnW0RBXd6Vyb2wuDOqe8B21fC/XWPVrhBLMVLIvhNrce2C5fB4Oj+Y
 1yoEHZ2qoa9JWz3W4Uu4jlBXkvomfh4nsDXfEWvcpAh6EWDB5RhK4ZRez6q6tTvYt9kDomtjvTz
 GpjO+K1FkLxKcIuYgVhb/qlpKVzo/E0hr2xkS+C5m6xpBgybACRwF+S4AmzahjOeJsCXdcsL0WV
 WW42Q2ke6xW984H9Bnvra6Y8HXaityAv6u9Qf5yRTe/wGuwC+fKG85kLGsTyhwDbAZajU6soinB
 Y3PNl6QTCxHEDhpE7eznxYIO2LqqaNXxAWu3gIOGW/GHYOUHmn2Mtxu+jz7Y3xOnqYdWg60q5i2
 seiwvcPLwKQx1vwaXRiU/rpQ27N04OR7vDqCUdMyqkFR/r9MafCtuhBZ6HS8eLcJkbfe6Ln60Y2
 tSh7JRnMZBbPonWdh7g==
X-Proofpoint-GUID: GStSRLxAhd69lpzzFe0eGjtTTs38esYB
X-Proofpoint-ORIG-GUID: GStSRLxAhd69lpzzFe0eGjtTTs38esYB
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a157c23 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=TyWXDXqlpdzf1xDbr6AA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260095
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-37527-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 53CA65D4924
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This reverts commit 602cb14e310a ("pinctrl: qcom: x1e80100: Bypass PDC
wakeup parent for now").

PDC interrupts no more break GPIOs PDC irqchip is updated to work for
pass through or secondary mode. Update nwakeirq_map to reflect the GPIO
to PDC irq map size.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-x1e80100.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-x1e80100.c b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
index 8d2b8246170b..e4c0abcd95b9 100644
--- a/drivers/pinctrl/qcom/pinctrl-x1e80100.c
+++ b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
@@ -1836,9 +1836,7 @@ static const struct msm_pinctrl_soc_data x1e80100_pinctrl = {
 	.ngroups = ARRAY_SIZE(x1e80100_groups),
 	.ngpios = 239,
 	.wakeirq_map = x1e80100_pdc_map,
-	/* TODO: Enabling PDC currently breaks GPIO interrupts */
-	.nwakeirq_map = 0,
-	/* .nwakeirq_map = ARRAY_SIZE(x1e80100_pdc_map), */
+	.nwakeirq_map = ARRAY_SIZE(x1e80100_pdc_map),
 	.egpio_func = 9,
 };
 

-- 
2.43.0


