Return-Path: <linux-gpio+bounces-39575-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j7xTMo/GTGpGpgEAu9opvQ
	(envelope-from <linux-gpio+bounces-39575-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 11:27:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ACC719C17
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 11:27:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nFrM14vV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=beZBiJiq;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39575-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39575-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0D0453025C0D
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 09:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A12364028;
	Tue,  7 Jul 2026 09:22:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38472332918
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 09:21:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416121; cv=none; b=p/M1kjleg0ZBS+s9M7Ltd5+c8EUNfeY9Tpft7S8b1oHjiDqPkISWY2BcUzLD5VX+RR5Q6tRadOU392Whuxs8zEcexEq8eCpVUKwWk/R5N1v1/kHO8pUaLKdDibdl7PQ6bifsO1B2ak9aYzc5mt5h89qtjs/4OQyPGJoWBhh13Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416121; c=relaxed/simple;
	bh=nBS7zc/9OlHczultLqZiR5Gx+/IEOfrCwYtgY3SEIZ0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Guz1/zTm1OUmDNiSa45jyj9ChGcpN9hgPifSQyM05kASg0dZIvhjQ0s799eOtX1KeoHWzRnMSDIoVjezY2wmOoKj+/40J9JDKfcByjbaV8Tidp7FfIYrw7//iiqj+aCZQ9akvNbOvj/bFwNRa5/WPMjp0TKXtcNyzkeOcFlwKKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nFrM14vV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=beZBiJiq; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DjVC3050545
	for <linux-gpio@vger.kernel.org>; Tue, 7 Jul 2026 09:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=C5FpN1Gt/+q3j0YC5bEahx
	lNsTtZazgRcLfjgPlxCS0=; b=nFrM14vVsVqmIM/OjerF7hyD9ZNvpDLkwJ7+OJ
	iovMtKtOofZ0eU3F6KD23AXZpDHTcAi6/Gl28LlgDVo+nLv36Pl76NFoCDiINY4A
	DWME0WVpQBPvuDcUQ75hdZFcVtfyAAKmfUzu5YuEVK7KK3WGxAx8r19CrbLInNrs
	TkCW49wpY2g5i2oQUtdB6K+CzdDCMeQ7zYNCGxZCRNYNrjWPhJ6hWhiL0EgfYyfA
	3dusRNSEv1UAzHSucJH2gF77pXFenDqqtg10X5DPAxR8/FglAwAfDguRwJdopESI
	eJI/dSbmgMgJDpEE4s7m1T7rFb0Y6S8ynAOTVosC7f50gS8g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w2u8f04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 09:21:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37e24235ce1so6104726a91.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 02:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783416118; x=1784020918; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C5FpN1Gt/+q3j0YC5bEahxlNsTtZazgRcLfjgPlxCS0=;
        b=beZBiJiqIKfEY1oh+uKCV/yNN6Q00JqQyEMw60a8Pp4PxFgo0u4TuCwDFXG3uqaYlQ
         LO3Ui6kfi/sVtQogDbQqtSdhYCD5Z9pyIFX6T13l72JnovW8iAUrmF0HUcDlzw08q1m9
         OqqmwqY5EonNa3ZUJTf/HQJzuk+Gu3ZLJynNyAkMrPWU4JurwVZ6DTXsuP72v4De8eUO
         p5jZF52kx6HadX4MzAWkKXQZIebrLq2oEe6wqKltMKyDlgXxWhAWm+Bkq49nN9ISQGHL
         CooMlb4X+ugfUvXvcAA8TvwWA9egMuFdvYf/fCsvDLE8k99Haj7z6tEg+ATkU0UInP6u
         qmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783416118; x=1784020918;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C5FpN1Gt/+q3j0YC5bEahxlNsTtZazgRcLfjgPlxCS0=;
        b=p9gPoD708QVKDa49QgIm/ElmXfb/elKiqdqgkSndrop7nm5YkHu7YuIf9WkdRJdigt
         b+IvTE6Ynp50tCAAE+4/sZSjVbVVOSZsZsFdKEZt812Wo4pdcPTDKlqV/MxtCaMuKJUB
         afHj0oeK1L6BZ4ijXztWG7QrS7uWTqjRNgJry831NWQRfgLaB739gm9X6BDyXMpzi42F
         rck3eJlDNv6L32lddZVl8Cmz6Ej2Rw28MwsFbzdwzn4ehTsbP2kViX9Y4fAAsQPQ8oGi
         VyfVocXu8L22VXO1KjYSC3b8pOn+o4l67ArvB5ceAXBBN9N5fV+1vo/rcOiR/4dw8QYR
         uDow==
X-Forwarded-Encrypted: i=1; AHgh+RpzEPjjDUHFChP3YWF3Hrh7NAZZxRGtpHOPV2Su0pFxPkxemBbISUFNDxzaiwTet2Yf3HsZhRVALYDV@vger.kernel.org
X-Gm-Message-State: AOJu0YzDRFMf7vVWKvnmUtVbJIY23UxeGEZLK9KH3rKC3LuRsq/b17V1
	wMgbhIIWrY+byARW4dUIibL0NSHPVtc7+/N8WmVSJiGcXDTNGfHQmWndz8YAPDkR259DQa1RGFT
	5cQDeXNiKoDGF0bI0mG6USkQZ9nYIxy4M/SgZPAazt1NkWpfFH70XWYqGUprSpS+m
X-Gm-Gg: AfdE7cl6W2isLgmJEDys0PtTRMwCp8dgc6zgBcG/Hk74o+BlMGXJwQzXFPotQ22dPQT
	/aEKphBcXOha+MpLwadbvuAyMqmoYUnUzzqukvRbGGNkw1qVE2VXwTlqt6baILZgrKXEvx+LulS
	NoK+CEGLJvAvx9/TXkFw05yt2Zgs/hv+XiFqGsOIYX+t5jpaOsaq6YWFJCMhIpbMIQ3h/Aca94D
	Srj/98amnKoIl3w2R5jkScSsPEa0nPqqBKjHBfp3Qg7zKnRTL+fG4M12n5lrKU47Qs4scrDN1xO
	6mkR9RVf+dVXZ8OUocEN2eOsh4PIHp4S3RPCffIZB/XnyW0AC95pAYUDt6re8DJj8hsBeQxFQkd
	YpztSBmbZoLzKVWPTjpRJQrQTJRcDv8ZSDb1SUwY=
X-Received: by 2002:a05:6a20:d494:b0:398:7ed3:a001 with SMTP id adf61e73a8af0-3c08ec61813mr4910319637.2.1783416117974;
        Tue, 07 Jul 2026 02:21:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:d494:b0:398:7ed3:a001 with SMTP id adf61e73a8af0-3c08ec61813mr4910265637.2.1783416117354;
        Tue, 07 Jul 2026 02:21:57 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afdb7534sm658864a12.12.2026.07.07.02.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:21:56 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH v4 0/7] x1e80100: Enable PDC wake GPIOs and deepest idle
 state
Date: Tue, 07 Jul 2026 14:51:32 +0530
Message-Id: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABzFTGoC/1WOUQqDMBBEryL73UjUJJV+eY8iEpNtTalGE5UW8
 e6NViiFZWGG2Xm7gEdn0MMlWsDhbLyxXRDsFIFqZHdHYnTQkNJUUEE5aWRrZdVrVc0ZEVrWKme
 cpomCcNI7vJnXXnctv9pP9QPVuHUcCYfDFDjjL9YYP1r33p+Ys809eIn454WhhOkcE04ZyjMvr
 PfxMMmnsm0bhwXluq4fhPyQZ9YAAAA=
X-Change-ID: 20260605-hamoa_pdc_v3-6dabc845021c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783416112; l=8561;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=nBS7zc/9OlHczultLqZiR5Gx+/IEOfrCwYtgY3SEIZ0=;
 b=2UFQSS7KrMOqFATeXhzC43EoCDJsr8MhWHaZdBsBAtNJ5eWv51TPvyzOlngxf4eYhfwRmnhDZ
 BUWIiQTJxpWDohCpZvKeX8ZimV3VHdOOyL3PgXefkv25pMP4yCfdYwr
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX2azLTbhyqiAO
 bC/XISaJ8cpfUsEp9hTZVQjwat6feS1vq89kohw/0lJ7iACid6fpWphHIC22eJbCqk/FF+esmUU
 EIWkCe7nwBg5oqtcWLSd65Sy88HF01Q=
X-Proofpoint-GUID: uZLqNUFtlBAlsKdRzXNqM-Jqs4-8Ik42
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfXysRCAftIeXlK
 Y6HA/carRLsw9egw1MzbWQmuRMurcfYEXrJ6tfblOeSWSXa7t2mLjlC5M/KaMkX7IHqmhw30tIf
 vnjMzQxvNbJcm0bd/3tDnsfhOgiJYrPkp2FLZ1uBZR8GLozWhdDEc6Lct8cCIhEfocFumflt1Q3
 g8LJqOwgHtkv6L0VOTTtkdmQ3Ie2Xjpwz9dnf6YROoKQTw8eoe9w62ZbGzdR/cWdRJbuD1DJDMR
 N/tXHuHMqA0gyDLHL32UWHiw/pmkrdGKmLwGi7mtINxn7b7ohfvKUA0dR3EiK1XtfMKPl81StpQ
 fYud8SNG02KNrVxJNgxBCgCuCZVmhvSKN1t95kbKZyL9cPrxm/kHr4F+4+ydriPx7mJN1sZjFLS
 XKDt8dPA4m2rLEPPMgnLmlSK7uH5xmHIL/fhVdJIoseUFzDJXFHwYELVS1O56ISmDeO6laMWooV
 wn8Mg3ZNxhKdBzHjM8w==
X-Proofpoint-ORIG-GUID: uZLqNUFtlBAlsKdRzXNqM-Jqs4-8Ik42
X-Authority-Analysis: v=2.4 cv=bPQm5v+Z c=1 sm=1 tr=0 ts=6a4cc537 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=eCLp6DzIs61Su77-W40A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39575-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:stephan.gerhold@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 37ACC719C17

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
Changes in v4:
- pdc_setup_pin_mapping() use dev argument and use dev->of_node within
- Merge v3 patch 2 and 3 into single change
- guard pdc->lock for all pdc->enable_intr() function call for HW v2.7,3.0
- Move lock init before pdc_setup_pin_mapping() for bad spinlock on v3
- Removed unused num_gpios
- Add comment in qcom_pdc_gic_secondary_set_type() from v2
- Modify primary case in qcom_pdc_alloc()
- Remove pdc->version checks from pdc_unmask/clear_gpio_cfg()
- Formatting and commit text updates
- Link to v3: https://patch.msgid.link/20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com

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
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

---
Maulik Shah (6):
      irqchip/qcom-pdc: restructure version support
      irqchip/qcom-pdc: Move all statics to struct pdc_desc
      irqchip/qcom-pdc: Differentiate between direct SPI and GPIO as SPI
      irqchip/qcom-pdc: Configure PDC to pass through mode
      Revert "pinctrl: qcom: x1e80100: Bypass PDC wakeup parent for now"
      arm64: dts: qcom: x1e80100: Add deepest idle state

Stephan Gerhold (1):
      pinctrl: qcom: Acknowledge IRQs for PDC interrupt controller

 arch/arm64/boot/dts/qcom/hamoa.dtsi     |  14 +-
 drivers/irqchip/qcom-pdc.c              | 535 +++++++++++++++++++++++++-------
 drivers/pinctrl/qcom/pinctrl-msm.c      |  15 +-
 drivers/pinctrl/qcom/pinctrl-x1e80100.c |   4 +-
 4 files changed, 450 insertions(+), 118 deletions(-)
---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20260605-hamoa_pdc_v3-6dabc845021c

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>


