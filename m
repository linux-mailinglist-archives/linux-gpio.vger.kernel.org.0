Return-Path: <linux-gpio+bounces-37824-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CweXL031HmoKaQAAu9opvQ
	(envelope-from <linux-gpio+bounces-37824-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 17:22:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CBC62FB4F
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 17:22:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AR7lZ1uj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AVUuz3xB;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37824-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37824-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3410430187B9
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 15:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3BE23EFFC8;
	Tue,  2 Jun 2026 15:22:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1D53E9584
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 15:22:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780413737; cv=none; b=MWYmyEyd4DKL/2SFv68ScPxZ3GCDpd3Ol541idFIq2Ol4jeyD47B3+kzyLmO/hNLYuka6hai0UdGcN+2vA9wjFQ/CJ5162l8johnPwiMiTH2YvaPYGij6X6yXkL0c5Ofv4HkfQ9xwpzOe+NX05VmQVKoRu0zNj3AIL0kD2gxjUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780413737; c=relaxed/simple;
	bh=1vdQRDwfdLjItGddnhWnfWFV7jqHElgyRnb5iEra5UY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SIkeVf3C8Ot1NaDQ4SpVrBmbY7Qiq200HjC9zljWOAcaup7FTAQ4kAeIXVpAPu4RfAYDFhDtgx6gTOWJyh6oo5Sycosqb2l5HrCLi+Qw1r8abWiRG57FQYGg260vh7zwckONmqjLnn1hPqPGKMmfmwovVc5JS+d/QucToN9awuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AR7lZ1uj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AVUuz3xB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652Eb3md3430252
	for <linux-gpio@vger.kernel.org>; Tue, 2 Jun 2026 15:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v1ujocze5l5WOhdc0MZh0kZJ1I5Y+xYkTRZ1YFq3Teg=; b=AR7lZ1uj5AfibhgU
	YhGVGjUKg5j+Kz+nEY1QGlaaYhoZWi9u1/JBGNFIS5+UhwpB4sDgmfDZQ0FRgL2B
	Kow7z0irCjoxU2mog7i8wlh4z8lC93ZIoS4Ip0JdzomFLUgzYFZH8Q91Z3IYnuT+
	rtJ/V0hpKHiXN8fuqaGw14mAPKTgwxzMy7hzNrnlotDHOI45vkNmCd5ldIQKvrvf
	DNTWu+gS+j9tT3g2Eyk3dzsmGEBtEqVXgR5GqfkV+97KR8KDPcWiN19z4HkCa5Ke
	RrvP/X/TAYDqQMsZEfZPIxMjbhUVGPUogrtm3KH40cWNo3t1Jy4hKDvt9NacTWhB
	UCa/Pw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehn8mk6st-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 15:22:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0532a6588so32167045ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 08:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780413734; x=1781018534; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1ujocze5l5WOhdc0MZh0kZJ1I5Y+xYkTRZ1YFq3Teg=;
        b=AVUuz3xBOB4gUJMncRlwglRChlXe9COWMAz9A5vbxJHpdk4HOmAbKg5FXQT0nLbnZ6
         5UmCCOfsL0FNBCmoNLQjEInwsp4s/460KknCfvYWXljRsDwsWrl2qfOWx0s1c5ZFCwoP
         tFStih/EauD33qNiELfgKmfTlcRw76NEKiPD5VozGOCz+X7MxuhLdUtfnmd8n7yZPlH0
         BwKcVa4ti/2Tr/YbQ2Ai2a8UGvlE3+LU7AipdPNpsTeZI0Rax8HykU1dBhiePaGVFabj
         IcVwh0gxAjFfVlA+2J4a0YIC8djRJDylMREntRQBwgeSRKJs+uy0t3cMsSBE+Tmjcnqa
         Nebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780413734; x=1781018534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v1ujocze5l5WOhdc0MZh0kZJ1I5Y+xYkTRZ1YFq3Teg=;
        b=TdJ5eEiJRKVWU8uvew2pKhLH3ibdkS2VfuXEkof3kU1DYE+Z0huCEbE7IRXkApr+bW
         NlHvkWJH9lZn80lxb9YR2Hb+drA9/jKTiEKg3fLVIX+sNdo/vsxUAFo+BZ5428v45hnW
         3dqEGnVUNQxx+b4yVkR96UhDNSRL7eD8Kf3jRzIEJxcJEAT/OdwGtYcg6oz5ACPCcTKz
         xXyQylDuVcBvetRH91HmADWhmNxFwTdOShiGYCHSnBqhLc9hna6QZkg6KJ4q6HRr3Hgt
         qERaucsIfMMg1Ci3bWECkaBjcBrPAR502foyVRcYR1m0IVIQpZU8CEN6vgQGppcdhQyQ
         8bdg==
X-Forwarded-Encrypted: i=1; AFNElJ+MTF8GQ4MtOcq3v/DliBgJeq29vZHiNDJ529Qov2qnNAvYeWcIoLxqnAD1ArE20TkPv/ooJ/jOnBoL@vger.kernel.org
X-Gm-Message-State: AOJu0YyCtnBy0DBhwdgdyLI9YRsHfUqohxG4a8LHmFkPvXD28j7+W5B3
	UKQNIbP0mhPLkxQzfn7IDgtRpMC3e8e4KqxgGZKf4KA6JQio3MHOOAtr/DFDpGTzUnVO0fgloUC
	v9NIZaBtUeop4d61BL+DCYz8w3KSSQjCd/LBFzOX5RB67KeM2sydZf3vGamrfo3q9
X-Gm-Gg: Acq92OHXqvGnfZdnkzBMxv4J/WT6fdYPjq2nUxmmOZd9utHAJFGjSDZMVC4GJqwXTzE
	+keADfFnZE+vhTo/NVsnSMoFjJjhpKqeMdbcqxGpQGLYpVkObZII+Ix/T8wbBhEzp1agq1FCClT
	2I6eFPqtkJINlWxobGVbacRB4V7+afvBClzqt1GkX94mxyBsPg5eFSS5opMiz9biahQr957vejj
	1oBnw1+63Dzs4YadEqNLajOg5BlBHWPx9yD+n01p4FVaok4e1hXBir0GcP/HRw9x3A0nWEbIAuD
	LjsqEhcMUrZAhpt6Blf1+i+zxftvNT51n2ue8Dqxtg3k3CXniguwJMS0ybsQdjSE0koduZ24nOv
	0e09aeV5bfrsdf+B8EZHQwLMDU3RuzE1PDmq5tqhmNE8jjw1hN/Q1zqzx
X-Received: by 2002:a17:902:ecc7:b0:2c0:b319:fb36 with SMTP id d9443c01a7336-2c0b31a00c7mr153525295ad.28.1780413734141;
        Tue, 02 Jun 2026 08:22:14 -0700 (PDT)
X-Received: by 2002:a17:902:ecc7:b0:2c0:b319:fb36 with SMTP id d9443c01a7336-2c0b31a00c7mr153524825ad.28.1780413733559;
        Tue, 02 Jun 2026 08:22:13 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e71cbsm135136465ad.15.2026.06.02.08.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 08:22:13 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 20:51:50 +0530
Subject: [PATCH 2/5] clk: qcom: Add a driver for PDM GP_MN fractional clock
 divider
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-pdm_clk_gp_mnd_v1-v1-2-1522662b6c53@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE0OCBTYWx0ZWRfX9MkmrFyLtCWg
 En+hd7vs9r/V8h1Bb/Im+AiUNGH7jL5CxdM3XRW/RQuKGrIqI/xWs+uepyJt3/maLR3hrJ0FE/l
 pUhbEnkbcUUAzw0obB/rEVhStYqzHUmuJNoFQcWVSEPhucxH7Xyah85zsY+ZpopDwC9Ez7nSqKn
 xtnvqdLfMt1/9eM3P1/D/0J1TipbZit3JCaTC4RcHROm7VtvD7AgYCpDaIjPIXCEBjIIwyj1qvw
 FqAyOC6eWHds6Ukzlek4gMjPGpcjRK0NWYJl5Xkc/khTLq3ND6jUOBzciVSH6AsORPq4r/jiSHy
 nzQfm+zaew0ejO4JwxzOGF+WO7v0++yYsDSgw59h5q+lLB2e30hdBXOaKWNumGPA6cssWXJcRzf
 aeaG7l1b/eromcoPwyc1uJCVR5vbuXKSCVG9b2MZiTCqcKrkDvsiJM+yvgTgFSrXxT6l8PzvhqI
 SjqohGtaZ5kQaYBHUfA==
X-Authority-Analysis: v=2.4 cv=d5nFDxjE c=1 sm=1 tr=0 ts=6a1ef527 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9rGeCgy22yGQcie6hdYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: -aikyKsjtGnhhiUotaElaT2sQLpOr7F2
X-Proofpoint-GUID: -aikyKsjtGnhhiUotaElaT2sQLpOr7F2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020148
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37824-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,redhat.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:richardcochran@gmail.com,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:netdev@vger.kernel.org,m:taniya.das@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 52CBC62FB4F

The PDM (Pulse Density Modulation) hardware block on Qualcomm SoCs
contains a GP_MN clock divider that produces a fractional output
frequency from a fixed input clock (typically TCXO4):

  Fout = Fin * (M / N)

The hardware encodes the period in the NDIV register as the 1's
complement of (N - M), and controls the duty cycle via a separate
DUTY register that counts the number of low-phase native clock
cycles over the period N.

Add a standalone platform driver for this block that uses
rational_best_approximation() to find the closest M/N pair within
the 9-bit M and 13-bit N hardware limits, programs the MDIV, NDIV,
and DUTY registers via regmap, and implements the full clk_ops
surface including determine_rate, set_rate, recalc_rate,
get_duty_cycle, and set_duty_cycle. The PDM AHB bus clock is gated
around every register access.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig      |  15 ++
 drivers/clk/qcom/Makefile     |   1 +
 drivers/clk/qcom/clk-gp-mnd.c | 333 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 349 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index d9cff5b0281d8cc373b8ab14683370cb9b7f8bf3..df27aa10243435a20a57cca3ed4644284630d11e 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1759,4 +1759,19 @@ config SM_VIDEOCC_8450
 	  SM8450 or SM8475 devices.
 	  Say Y if you want to support video devices and functionality such as
 	  video encode/decode.
+
+config QCOM_CLK_GP_MND
+	tristate "Qualcomm PDM GP_MN clock divider"
+	depends on ARM64 || COMPILE_TEST
+	help
+	  Support for the Qualcomm PDM GP_MN clock divider found in PDM
+	  (Pulse Density Modulation) hardware blocks.
+	  Given an input clock of frequency Fin (TCXO4), the output
+	  frequency is Fout = Fin * (M / N).  For every N input cycles
+	  the divider produces M output cycles.  D controls the duty
+	  cycle: it is the number of native clock cycles in which the
+	  GP_MN output is low, counted over 8192 native clock cycles.
+
+	  Say Y or M if you want to support GP_MN-based frequency and
+	  duty-cycle configuration on Qualcomm SoCs.
 endif
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index e100cfd6a52de9f88f11720d9c2043db5e553618..438f59b25c009ee72308fe41707d6efff6613690 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -207,6 +207,7 @@ obj-$(CONFIG_SM_VIDEOCC_8550) += videocc-sm8550.o
 obj-$(CONFIG_SM_VIDEOCC_8750) += videocc-sm8750.o
 obj-$(CONFIG_SM_VIDEOCC_MILOS) += videocc-milos.o
 obj-$(CONFIG_SPMI_PMIC_CLKDIV) += clk-spmi-pmic-div.o
+obj-$(CONFIG_QCOM_CLK_GP_MND) += clk-gp-mnd.o
 obj-$(CONFIG_KPSS_XCC) += kpss-xcc.o
 obj-$(CONFIG_QCOM_HFPLL) += hfpll.o
 obj-$(CONFIG_KRAITCC) += krait-cc.o
diff --git a/drivers/clk/qcom/clk-gp-mnd.c b/drivers/clk/qcom/clk-gp-mnd.c
new file mode 100644
index 0000000000000000000000000000000000000000..826b6b62ddc7b272511accde1ca0e885018a8064
--- /dev/null
+++ b/drivers/clk/qcom/clk-gp-mnd.c
@@ -0,0 +1,333 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/rational.h>
+#include <linux/regmap.h>
+
+/*
+ * PDM GP_MND clock divider register offsets.
+ *
+ * The hardware computes:
+ *   Fout = Fin * (M / N)
+ *
+ * with duty cycle controlled by D, where M < D < (N - M).
+ *
+ * Register encoding:
+ *   MDIV  = M
+ *   NDIV  = ~(N - M)  [1's complement of (N - M), masked to N_REG_WIDTH bits]
+ *   DUTY  = D
+ */
+#define GP_MND_MDIV_REG		0x0
+#define GP_MND_NDIV_REG		0x4
+#define GP_MND_DUTY_REG		0x8
+
+#define GP_MND_M_WIDTH		9
+#define GP_MND_N_WIDTH		13
+
+#define GP_MND_MAX_M		GENMASK(GP_MND_M_WIDTH - 1, 0)
+#define GP_MND_MAX_N		GENMASK(GP_MND_N_WIDTH - 1, 0)
+
+/**
+ * struct clk_gp_mnd - GP_MND fractional clock divider
+ * @pdm_ahb_clk:	AHB bus clock required for register access
+ * @regmap:		register map for the PDM block
+ * @hw:			handle between common and hardware-specific interfaces
+ * @m_val:		M value (numerator)
+ * @n_val:		N value (period)
+ */
+struct clk_gp_mnd {
+	struct clk		*pdm_ahb_clk;
+	struct regmap		*regmap;
+	struct clk_hw		hw;
+	unsigned int		m_val;
+	unsigned int		n_val;
+};
+
+#define to_clk_gp_mnd(_hw) container_of(_hw, struct clk_gp_mnd, hw)
+
+static int gp_mnd_clk_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
+{
+	unsigned long m = 0, n = 0;
+
+	rational_best_approximation(req->rate, req->best_parent_rate,
+				    (unsigned long)GP_MND_MAX_M,
+				    (unsigned long)GP_MND_MAX_N,
+				    &m, &n);
+
+	if (!m || !n)
+		return -EINVAL;
+
+	/* N = 2M + 1 leaves no valid D satisfying M < D < (N - M) */
+	if (n == 2 * m + 1)
+		return -EINVAL;
+
+	req->rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate * m, n);
+
+	return 0;
+}
+
+static int gp_mnd_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+		unsigned long parent_rate)
+{
+	struct clk_gp_mnd *gp = to_clk_gp_mnd(hw);
+	unsigned long m = 0, n = 0;
+	unsigned int d_val, n_val;
+	int ret;
+
+	rational_best_approximation(rate, parent_rate,
+				    (unsigned long)GP_MND_MAX_M,
+				    (unsigned long)GP_MND_MAX_N,
+				    &m, &n);
+
+	if (!m || !n)
+		return -EINVAL;
+
+	/*
+	 * When N = 2M + 1 the valid D range [M+1, M] is empty; no duty
+	 * cycle can satisfy M < D < (N - M).  Reject before touching hw.
+	 */
+	if (n == 2 * m + 1)
+		return -EINVAL;
+
+	ret = clk_prepare_enable(gp->pdm_ahb_clk);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(gp->regmap, GP_MND_MDIV_REG, m);
+	if (ret)
+		goto err_unprepare;
+
+	/* N divider holds the 1's complement of (N - M), N_WIDTH bits wide */
+	n_val = ~(n - m) & GP_MND_MAX_N;
+	ret = regmap_write(gp->regmap, GP_MND_NDIV_REG, n_val);
+	if (ret)
+		goto err_unprepare;
+
+	/* Program the closest-to-50% duty cycle. */
+	d_val = n / 2;
+	ret = regmap_write(gp->regmap, GP_MND_DUTY_REG, d_val);
+	if (ret)
+		goto err_unprepare;
+
+	gp->m_val = m;
+	gp->n_val = n;
+
+err_unprepare:
+	clk_disable_unprepare(gp->pdm_ahb_clk);
+
+	return ret;
+}
+
+static unsigned long gp_mnd_clk_recalc_rate(struct clk_hw *hw,
+		unsigned long parent_rate)
+{
+	struct clk_gp_mnd *gp = to_clk_gp_mnd(hw);
+	unsigned int m_val, n_val;
+	int ret;
+
+	ret = clk_prepare_enable(gp->pdm_ahb_clk);
+	if (ret)
+		return 0;
+
+	ret = regmap_read(gp->regmap, GP_MND_MDIV_REG, &m_val);
+	if (ret)
+		goto out_unprepare;
+
+	m_val &= GP_MND_MAX_M;
+
+	ret = regmap_read(gp->regmap, GP_MND_NDIV_REG, &n_val);
+	if (ret)
+		goto out_unprepare;
+
+	/* Reverse the 1's complement encoding: N = ~NDIV_REG + M */
+	n_val = (~n_val & GP_MND_MAX_N) + m_val;
+
+out_unprepare:
+	clk_disable_unprepare(gp->pdm_ahb_clk);
+
+	if (ret)
+		return 0;
+
+	if (!n_val)
+		return 0;
+
+	gp->m_val = m_val;
+	gp->n_val = n_val;
+
+	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate * m_val, n_val);
+}
+
+static int gp_mnd_clk_get_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
+{
+	struct clk_gp_mnd *gp = to_clk_gp_mnd(hw);
+	unsigned int d_val;
+	int ret;
+
+	if (!gp->n_val) {
+		duty->num = 1;
+		duty->den = 2;
+		return 0;
+	}
+
+	ret = clk_prepare_enable(gp->pdm_ahb_clk);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(gp->regmap, GP_MND_DUTY_REG, &d_val);
+
+	clk_disable_unprepare(gp->pdm_ahb_clk);
+
+	if (ret)
+		return ret;
+
+	duty->num = d_val;
+	duty->den = gp->n_val;
+
+	return 0;
+}
+
+static int gp_mnd_clk_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
+{
+	struct clk_gp_mnd *gp = to_clk_gp_mnd(hw);
+	unsigned int d_val;
+	int ret;
+
+	if (!gp->n_val || !gp->m_val)
+		return -EINVAL;
+
+	/* D = (1 - duty) * N, giving the low-phase count */
+	d_val = DIV_ROUND_UP((u64)(duty->den - duty->num) * gp->n_val, duty->den);
+
+	/* Hardware constraint: M < D < (N - M) */
+	if (d_val <= gp->m_val || d_val >= (gp->n_val - gp->m_val))
+		return -EINVAL;
+
+	ret = clk_prepare_enable(gp->pdm_ahb_clk);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(gp->regmap, GP_MND_DUTY_REG, d_val);
+
+	clk_disable_unprepare(gp->pdm_ahb_clk);
+
+	return ret;
+}
+
+static const struct clk_ops clk_gp_mnd_ops = {
+	.determine_rate	= gp_mnd_clk_determine_rate,
+	.set_rate	= gp_mnd_clk_set_rate,
+	.recalc_rate	= gp_mnd_clk_recalc_rate,
+	.get_duty_cycle	= gp_mnd_clk_get_duty_cycle,
+	.set_duty_cycle	= gp_mnd_clk_set_duty_cycle,
+};
+
+static const struct regmap_config gp_mnd_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.fast_io	= true,
+};
+
+static int clk_gp_mnd_probe(struct platform_device *pdev)
+{
+	struct clk_parent_data parent_data = { .index = 0 };
+	struct clk_init_data init = {
+		.ops		= &clk_gp_mnd_ops,
+		.parent_data	= &parent_data,
+		.num_parents	= 1,
+		.flags		= CLK_GET_RATE_NOCACHE,
+	};
+	struct device *dev = &pdev->dev;
+	struct clk_gp_mnd *gp;
+	struct clk *clk;
+	struct pinctrl *pin;
+	struct pinctrl_state *pin_default_state;
+	void __iomem *base;
+	int ret;
+
+	gp = devm_kzalloc(dev, sizeof(*gp), GFP_KERNEL);
+	if (!gp)
+		return -ENOMEM;
+
+	gp->pdm_ahb_clk = devm_clk_get(dev, "ahb_clk");
+	if (IS_ERR(gp->pdm_ahb_clk))
+		return dev_err_probe(dev, PTR_ERR(gp->pdm_ahb_clk),
+				     "failed to get ahb_clk\n");
+
+	clk = devm_clk_get(dev, "pdm_clk");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	/* Set default rate if not already configured */
+	if (!clk_get_rate(clk)) {
+		ret = clk_set_rate(clk, 19200000);
+		if (ret)
+			dev_warn(dev, "failed to set default pdm_clk rate\n");
+	}
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return dev_err_probe(dev, PTR_ERR(base),
+				     "failed to map PDM registers\n");
+
+	gp->regmap = devm_regmap_init_mmio(dev, base, &gp_mnd_regmap_config);
+	if (IS_ERR(gp->regmap))
+		return dev_err_probe(dev, PTR_ERR(gp->regmap),
+				     "failed to init regmap\n");
+
+	ret = of_property_read_string_index(dev->of_node,
+					    "clock-output-names", 0,
+					    &init.name);
+	if (ret)
+		return dev_err_probe(dev, ret, "missing clock-output-names\n");
+
+	gp->hw.init = &init;
+
+	pin = devm_pinctrl_get(dev);
+	if (IS_ERR(pin))
+		return dev_err_probe(dev, PTR_ERR(pin), "missing pinctrl device\n");
+
+	pin_default_state = pinctrl_lookup_state(pin, "active");
+	if (IS_ERR(pin_default_state))
+		return dev_err_probe(dev, PTR_ERR(pin_default_state),
+				     "missing pinctrl default state\n");
+
+	ret = pinctrl_select_state(pin, pin_default_state);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to select pinctrl default state\n");
+
+	ret = devm_clk_hw_register(dev, &gp->hw);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register gp_mnd clock\n");
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &gp->hw);
+}
+
+static const struct of_device_id clk_gp_mnd_match_table[] = {
+	{ .compatible = "qcom,clk-gp-mnd" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, clk_gp_mnd_match_table);
+
+static struct platform_driver clk_gp_mnd_driver = {
+	.probe  = clk_gp_mnd_probe,
+	.driver = {
+		.name		= "qcom-clk-gp-mnd",
+		.of_match_table	= clk_gp_mnd_match_table,
+	},
+};
+module_platform_driver(clk_gp_mnd_driver);
+
+MODULE_DESCRIPTION("Qualcomm PDM GP_MND clock divider driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


