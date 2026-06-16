Return-Path: <linux-gpio+bounces-38561-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ihMxEBAXMWrtbQUAu9opvQ
	(envelope-from <linux-gpio+bounces-38561-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 11:27:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 902DE68D86B
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 11:27:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=b5wR3OyR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bt+iiHPZ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38561-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38561-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53D8B3101FF2
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 09:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33AC4397699;
	Tue, 16 Jun 2026 09:26:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7574218AA
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 09:26:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781601969; cv=none; b=ei+0bi2BjjLlMN0LnAnzVtIPFW03VUkNgdMzvlIySC0xMBZAL4h/N2vEkIS06wGagLW+mlL5mfEwmgsjme2ki7KggSYj0Tup7nY9RstNqLTfMEc5KMOwrmbjVn4LDaIZc26tgUMmDQGvyOJxYwd7bFX4Amed823UMUmdHTj05hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781601969; c=relaxed/simple;
	bh=oKCA3rXYCYVsu2qwFtdFelHjE9P2vs0ADX+IZRTIOVw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jibbEJn8OxXNd+HOwqAF7Hs30G51OCuZ/gvzrlLndK8NEvhZ/lWyW7GjJ4dKBmcWAInF0rSsFfJ8MyMsEPf83j4ImKbhiQL+dRMJvi/PkdSIT44m+M114kBNiDvVcrHJM+C5n0PJsT0dftZIzc5Xw1QZJmVYsOWDDBBqEm0tnP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b5wR3OyR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bt+iiHPZ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G6PWAC2402291
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 09:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oeksz3pBbwZn9UfmKvs2oI
	BAjNFxdRTHnOAeYAAOUGA=; b=b5wR3OyRKWEaLHkhicxd5cn5s1Qg2kmDhhCidG
	V1qURxj5pKWgmLaGp2rJqh9wdMR+abueyj21rHq1khCHy26sxUW9ch+M5g0L4JQi
	g0/geV5JZlUd6n/88qnQFvYWO4civYzZeXlcFAczENpFjFhbtSH+sLSJcdipCGKP
	YAosxf1rTCY59SHLCrM89Ntl8RjFMGKsixa4P5ABlvlaIA6lSJgKfM07WECfUrQT
	+JXGbromIfYhyjAx9Bif3X/fm+h7bUGGcHLI0zKXVugphUOSudDxXB7BOl0aSS45
	D1YCOYBr+x8HQiVErJVzhGf68mf4xVmFfyi3HHYxOt/Bcd8g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1760rd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 09:26:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c354050c34so40324395ad.3
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 02:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781601965; x=1782206765; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oeksz3pBbwZn9UfmKvs2oIBAjNFxdRTHnOAeYAAOUGA=;
        b=bt+iiHPZriqE5MOJjbFQxVtRpa/TXkUGh2v9LHFPb9tBf92YwXF7gRhRtfJq9YQarK
         RpPr+FS+SY/MDSPemy22Pvi+4VoViDGN+JPKQEBiqXp/J3JHQPhUlsWfrt4boswW7HMP
         It2IM9R0ryO8fcktoJHkaZBtAt7nbjZBncHoGffwoCwXNQ0FwjS5mvg13Mx/tHg1t6z0
         Hp0JbG5KkSA5oLF9x98ofl1WgniB2ts8GuWZCptgVKJ0JV/497XbH6IJZ72+2YWpcrPE
         2DoePUm7GqX7R0DjSmGtqOQLNpghmTyhQN2IAENjIRRLpr0Y9/Ek7O9W2zrjmsbkMRWF
         cQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781601965; x=1782206765;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oeksz3pBbwZn9UfmKvs2oIBAjNFxdRTHnOAeYAAOUGA=;
        b=pf2ycNjVsfm4T4WceEw5jhnSbAXKPPx1xe8Cfo9ybe76EbigOwyS5+Xwp9B73nS1au
         jXmVxRMTZzNrWzaLcA22Cl2GBMSG5RFByDpWAmlXXzaNkRyCbEOqqfexQPwg6rwyVUsd
         AfNdvafcqCFvXc3uJiiZVBa7H/p7WIdqyd2unG4rjjQgb3VSCDQMdiarY3vnlsUEoHA5
         um2DVFIhhoVX0+1Pp37lUCcXyD0dF+4QNQV+9t1albmBHASlkiJhxxo6tl/kpeuYD5yq
         r3EJjJ4QjuY1wrEzyN/us7lf5BmdGQ1tZbLXMerGg5Rj6TXaLWWQtLH7dFnjBN5s7hof
         LGBw==
X-Forwarded-Encrypted: i=1; AFNElJ+6UTll6+ioKeuUfCWQMme+b8QNYS5PtAQPUuGOzFNKSJRs5KoOZ1wNf5+0a0FhEiPGGzLX59QP/691@vger.kernel.org
X-Gm-Message-State: AOJu0YxYEtT+5H6YVNJU6SXzqdjf8Oj+2FDMDInLrIWzMXgLSE10gNKl
	SM5mQBSMmDPzkjlNLMAILxHReEbbqRFwFC4viPwd9oa3eRj6Kz81UcOxgSqYtS2Q+oACww4oYbT
	k9V1b3GXnm1jBAxg0bz8LfoSR1TFUvdDaTteTs3aQpKh47OXvXFN/MvxqttN4zn+bn/i37gsq
X-Gm-Gg: Acq92OEChBo1mVcgXB9Mvc6HngZkFGGES/tvxf2XDjB3nmlZa6IomR1SiiCZsvAEX9S
	sRucLouXgnzvkFIkgC+3ykEv/VH2ihSQgCoe/I64923megyUrkRiwVQuDw0GFssvgt01v1c9QC1
	uU8m6CuG2UZpRUUgd3rtjzFtvRURapvq5X1WV+k3XulEo88V1/VN2JF15CDQLCFXAoE9JA4V95Q
	HKgtU32f6zEVeKQk7svAyqeKc8UVqxjASDvC3cnbPuiYKHk7QUcQW2DoNAmaEtGE+42+Ms4wvRr
	Wx8rc+YmGFn2hZdJP0IHwkwQJrCcn1FYLe9mSy0ahxI52LmZpSE/wmDDGTg3rNvGPo5E5q9Bcgi
	78tAQateaL0ONZ2yGmy+UnoJ+26A8L5EisNlQ0U24Vl+IYSp6ZQ==
X-Received: by 2002:a17:903:2f43:b0:2c0:f807:56b2 with SMTP id d9443c01a7336-2c6642b91e0mr137428795ad.34.1781601964656;
        Tue, 16 Jun 2026 02:26:04 -0700 (PDT)
X-Received: by 2002:a17:903:2f43:b0:2c0:f807:56b2 with SMTP id d9443c01a7336-2c6642b91e0mr137428495ad.34.1781601964176;
        Tue, 16 Jun 2026 02:26:04 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e586bsm130042025ad.12.2026.06.16.02.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 02:26:03 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH v3 0/8] x1e80100: Enable PDC wake GPIOs and deepest idle
 state
Date: Tue, 16 Jun 2026 14:55:50 +0530
Message-Id: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJ8WMWoC/y2NSwqEMBAFryK9NhCjhsGriEjstGML/hIVQby7m
 dFlQb16J3hyTB6K6ARHO3uexgBpHAF2ZvySYBsYlFRaapmLzgyTqWeL9Z4KbU2DnyyXKkEIk9l
 Ry8c/V1YP+63pCddf4zUcLVv4WV/tum45NK7FhQAAAA==
X-Change-ID: 20260605-hamoa_pdc_v3-6dabc845021c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781601959; l=7964;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=oKCA3rXYCYVsu2qwFtdFelHjE9P2vs0ADX+IZRTIOVw=;
 b=QqpBGBOHRz3NrRFvEbN6/R8EinvO/+gWnTMmgVhVCZBWeGzpU0ChS6UCwJbnpXsyCqeZMfN36
 C0aDJTWDnkPBvcdcuAiqzGi/Q0KjGSefnuLR9vqVYcXv0rlAVj5SsU5
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: cTgWO9c64MRNbg0lxNI5o5PCv5VaEnTw
X-Proofpoint-ORIG-GUID: cTgWO9c64MRNbg0lxNI5o5PCv5VaEnTw
X-Authority-Analysis: v=2.4 cv=I4RVgtgg c=1 sm=1 tr=0 ts=6a3116ad cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=aMSERw3ZVSxg4zp0N1wA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfX47gerGm9jmKX
 IY0QjxMqmO+a38V3yyNkOpWANV6kTO6wR/qOanNn5HQ+wH2QMFBLWc6gHrIeqNTvWYNmmFLPllu
 wDw3W3Xan+j8x8k0GK61REDKW4Sfq78=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfX9gCrd1hejOO0
 2TK6HsRVE0qhM9GZF821dLHLnVdNW2fF6ggYcUk29uKR4ALgBSbPPa0Sa6BJ5L4exQcpiorAm3k
 teZi7mtbAlsobkauTEgdVsAFCnEqMCJp4ONt/sMjE1MA8as2ejim8Stl0XPJw3RDhF5kZLAF0jQ
 4PPzGHoTdVa8iJrwyOZ6YmEdIqXGBR7r2KJ8YIvSagMYn7jtEORPuWKBJHED3EJBMuqU1PCv8Ld
 hLzbqhBv4ulUj8qlW/TLvjyfU/nqPoHf+vGoM1QMYnv/VRsY65m5Gify4LzN/+H21+luL19THiH
 ogjlY8UB4iqp84ZcYeisN7EaUQw1fWjoz+UjXeCAcglE1PVJBSQCecCSZMctczATjCfKHR3gLCo
 /Kf624HPymHEqE4Lc5WhxLlRbY7zQo9ir3VYxwQK70iZYHIww6XX3Xwsq1UbOjyankTMUF86zUn
 rtbL5V5CTMvkOXORezg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38561-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:stephan.gerhold@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,msgid.link:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 902DE68D86B

There are two modes PDC irqchip can work in
        - pass through mode
        - secondary controller mode

Secondary mode is supported depending on SoC using PDC HW Version v3.0
or higher.

+------------------------------------------------------------------------+
| SoC             |  SM8350, SM8450  | SM8550, Hamoa   | SM8650, SM8750  |
|----------------------------------------------------------- ------------|
| Version         |        v2.7      |       v3.0        |       v3.2    |
|------------------------------------------------------------------------|
| Pass through    |        Yes       |       Yes         |       Yes     |
|------------------------------------------------------------------------|
| Secondary       |        No        |       Yes         |       Yes     |
+------------------------------------------------------------------------+

All PDC irqchip supports pass through mode in which both Direct SPIs and
GPIO IRQs (as SPIs) are sent to GIC without latching at PDC, PDC only does
inversion when needed for falling edge to rising edge or level low to level
high, as the GIC do not support falling edge/level low interrupts.

Newer PDCs (v3.0 onwards) also support additional secondary controller mode
where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs
still works same as pass through mode without latching at PDC even in
secondary controller mode.

All the SoCs defaulted to pass through mode with the exception of some x1e.

x1e PDC may be set to secondary controller mode for builds on CRD boards
whereas it may be set to pass through mode for IoT-EVK boards. The mode
configuration is done in firmware and initially shipped windows firmware
did not have SCM interface to read or modify the PDC configuration.
Later only write access is opened up for non secure world.

Using the write access available add changes to modify the PDC mode to
pass through mode via SCM write. When the write fails (on older firmware)
assume to work in secondary mode.

As the deepest idle state as the PDC can now wake up SoC from GPIOs and
revert commit 602cb14e310a ("pinctrl: qcom: x1e80100: Bypass PDC wakeup
parent for now").

The series has been tested on x1e80100 CRD with both old and new firmware
and also on kaanapali. Test conducted with tlmm-test module after
applying [3] as test module needed to be fixed first.

All 17/17 passes in pass through mode and 16/17 passes in secondary mode.
Failing test tlmm_test_rising_while_disabled seems to be because when in
irq disabled state PDC is not latching the edge interrupt.

Test #1: Pass through mode on x1e80100 CRD (New firmware)

root@qcom-armv8a:~# insmod tlmm-test.ko gpio=91

KTAP version 1
1..1
    KTAP version 1
    # Subtest: tlmm-test
    # module: tlmm_test
    1..17
    ok 1 tlmm_test_silent_rising
    ok 2 tlmm_test_silent_falling
    ok 3 tlmm_test_silent_low
    ok 4 tlmm_test_silent_high
    ok 5 tlmm_test_rising
    ok 6 tlmm_test_falling
    ok 7 tlmm_test_high
    ok 8 tlmm_test_low
    ok 9 tlmm_test_rising_in_handler
    ok 10 tlmm_test_falling_in_handler
    ok 11 tlmm_test_thread_rising
    ok 12 tlmm_test_thread_falling
    ok 13 tlmm_test_thread_high
    ok 14 tlmm_test_thread_low
    ok 15 tlmm_test_thread_rising_in_handler
    ok 16 tlmm_test_thread_falling_in_handler
    ok 17 tlmm_test_rising_while_disabled

ok 1 tlmm-test

Test #2: Secondary mode on x1e80100 CRD (Old firmware)

root@qcom-armv8a:~# insmod tlmm-test.ko gpio=91

KTAP version 1
1..1
    KTAP version 1
    # Subtest: tlmm-test
    # module: tlmm_test
    1..17
    ok 1 tlmm_test_silent_rising
    ok 2 tlmm_test_silent_falling
    ok 3 tlmm_test_silent_low
    ok 4 tlmm_test_silent_high
    ok 5 tlmm_test_rising
    ok 6 tlmm_test_falling
    ok 7 tlmm_test_high
    ok 8 tlmm_test_low
    ok 9 tlmm_test_rising_in_handler
    ok 10 tlmm_test_falling_in_handler
    ok 11 tlmm_test_thread_rising
    ok 12 tlmm_test_thread_falling
    ok 13 tlmm_test_thread_high
    ok 14 tlmm_test_thread_low
    ok 15 tlmm_test_thread_rising_in_handler
    ok 16 tlmm_test_thread_falling_in_handler
    # tlmm_test_rising_while_disabled: ASSERTION FAILED at drivers/pinctrl/qcom/tlmm-test.c:545
    Expected atomic_read(&priv->intr_count) == 1, but
        atomic_read(&priv->intr_count) == 0 (0x0)
    not ok 17 tlmm_test_rising_while_disabled

not ok 1 tlmm-test
root@qcom-armv8a:~#

v2 series is dependent on [1] as mostly all changes are already reviewed.
v3 series is dependent on [2] which is already merged in linux-next

[1] https://lore.kernel.org/linux-arm-msm/20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com/
[2] https://lore.kernel.org/linux-arm-msm/20260527095426.2324504-1-mukesh.ojha@oss.qualcomm.com/
[3] https://lore.kernel.org/linux-arm-msm/20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com/

---
Changes in v3:
- Add test results in cover letter with tlmm-test module
- Fix coding style and struct defination
- Convert raw_spin_lock to guard(raw_spin_lock) and remove _irqsave
- Use bit number instead of GENMASK() for single bit fields
- Use __assign_bit() and __clear_bit() APIs for single bit modifications
- Use devm_ioremap() instead of ioremap()
- Use devm_kcalloc() instead of kzalloc_objs()
- Add separate irq chips for pass through and secondary mode IRQs
- Add IRQCHIP_EOI_THREADED flag for threaded IRQ on pinctrl irqchip
- Link to v2: https://patch.msgid.link/20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com

Changes in v2:
- Update to mention SoC names along with PDC versions in cover letter
- Drop devicetree change to remove scm interconnects
- Use qcom_scm_is_available() to wait for dependency on SCM
- Drop binding change mentioning qcom,qmp and PDC config reg
- Restructure version support and move all statics to struct pdc_desc
- Remove pdc_enable_intr() wrapper
- Differentiate direct SPI and GPIOs as SPI using PDC IRQ PARAM reg
- Add changes to make PDC work in secondary controller mode
- Rework and include Stephan's change to invoke irq_ack() for edge interrupt
- Mention dependency via b4 prerequisites and cover letter
- Link to v1: https://lore.kernel.org/r/20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com
---

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

---
Maulik Shah (7):
      irqchip/qcom-pdc: restructure version support
      irqchip/qcom-pdc: Move all statics to struct pdc_desc
      irqchip/qcom-pdc: Remove pdc_enable_intr() wrapper
      irqchip/qcom-pdc: Differentiate between direct SPI and GPIO as SPI
      irqchip/qcom-pdc: Configure PDC to pass through mode
      Revert "pinctrl: qcom: x1e80100: Bypass PDC wakeup parent for now"
      arm64: dts: qcom: x1e80100: Add deepest idle state

Stephan Gerhold (1):
      pinctrl: qcom: Acknowledge IRQs for PDC interrupt controller

 arch/arm64/boot/dts/qcom/hamoa.dtsi     |  10 +-
 drivers/irqchip/qcom-pdc.c              | 506 +++++++++++++++++++++++++-------
 drivers/pinctrl/qcom/pinctrl-msm.c      |  16 +-
 drivers/pinctrl/qcom/pinctrl-x1e80100.c |   4 +-
 4 files changed, 430 insertions(+), 106 deletions(-)
---
base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
change-id: 20260605-hamoa_pdc_v3-6dabc845021c

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>


