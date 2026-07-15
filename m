Return-Path: <linux-gpio+bounces-40125-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2v3ZKXiGV2oMWQAAu9opvQ
	(envelope-from <linux-gpio+bounces-40125-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 15:09:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 054D975E7B8
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 15:09:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Xk5IjJ/W";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=foyRKAKj;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40125-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40125-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6B0E3069965
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 13:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B25436BC0;
	Wed, 15 Jul 2026 13:01:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7145641DECF
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 13:01:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784120507; cv=none; b=PoiVGx29sax5Wa0cmdMdSVRjCbC2qess+qz8iBGroe79IY5TTj/Nj9GVuq2AI0fWbrp97rWw64FI0BZO1ANtX97jpJ3HNWYty5F0SPMdgZsSq7v0jg8kj/cGJHGeWRRf2puBsVquD+WamP3htS0vy2oiEG1sFOzR/93nrDJTzlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784120507; c=relaxed/simple;
	bh=W2KrwNxFKLq1tJiXLUOCfFm1U2VhB5XaO6pzS5pKm2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XokrcNYifEKAEPoAI9PqFDveR7a09lxLY3qqMi24rT/mpm8jkWP2FGOotTmafP86/XNDs9eZtod+CrjKFopnkmxor1OIbc/0uBbI1137+NfLwOodHLPNOYsmzS1Ot0PHr5SQdGI3kA0s/obm8vBxSuNE+lNC/4cDeNPUxJ2mJiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xk5IjJ/W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=foyRKAKj; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBdGvx3579547
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 13:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DQAD5+iPQQ42jpX4PTueqH
	matnJoZe8bRwUIsSmcMaI=; b=Xk5IjJ/W0O+yG3zyfuM5YsX4gwbrLfCt8QZOPO
	W95/xXUgaEGqZxDeH16t99he1fICnPXd8XX67SpcMSwBY4JEfGopBh029HrBCmey
	wEDDgF9GtrZy6QdTfYnPxaTjfO4To2ZB6lk5WoZBoaMqJbO2cebgU3xrwL49rRJA
	AZsC3vlD1WO+67oecOSIzhakSP2McNWsjTkyWt3H7p5QCbPn9paEy5TAITXeBv3r
	sx+/6OjZ7/GRu1JUo9DWn0XwpcEWqnVPfKi36DTTFHIOKhMxP8CUIgIj6rnA4wAc
	4L2AFGeEjOK/GCK1ku76kQYK1eSUmSeUQVFKA83r8wfWdvrw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdwk32wq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 13:01:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ca5d2474c7so57055585ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 06:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784120503; x=1784725303; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DQAD5+iPQQ42jpX4PTueqHmatnJoZe8bRwUIsSmcMaI=;
        b=foyRKAKjjgwWyBdPklHaj9Ei/m/BPteBEK4YddWSN3ZL8QKTkzUlr+iOVzxEaR5+wD
         hApX1SY8OEOmhqUt9PhdowDc+tOfJulIfY1cq6WtAudbiqI+VDMxFldxMINlUu5zOCXT
         3Rau7Nr+eFna4uge7eFJtfCXuMpGAbfQqdBlV/AQrz2aj6wRIL45jOIfZaN7EjnLmGTg
         HXIQ8Zb0SY3RIYgmhZDQtwujzSSEhDw5VKfoxoj2qe+MbcBUqNXmkYaYj7rp6jZlZ2fC
         kudL6TXhZ/kQb26XbQj514Y80lo4AMxpiEcpR/UwOru41GPczAPqQ4ZAIt69HjM7Vo74
         TGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784120503; x=1784725303;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DQAD5+iPQQ42jpX4PTueqHmatnJoZe8bRwUIsSmcMaI=;
        b=kT/3yoE6Az7Q3p/IZs8vhTlYdpMuQGuIjrRK4NyBCs5sx6sdw2S3Ar8krYKr4bY8dG
         N2QZCadHT6lKvTH1J4D7j3zghBLE1wEfTRdZK5yX0C96gzjJZkx+ar46gyBNizNp8BTR
         D9I4LRG3n1GqU1kSXrDJPsN2q0LyAHnJuF1KrAxtvLyj/P5Y6xB7YNGCq+d315PZN7OE
         NwuFeboxrrH0aWb1+1HCjk6RWviIEHtcJBs3pf9WvJYrk6JV3205fkspeBwToyz7yYy2
         4289MeRBf64hlJxnE8CcJ1eB0lN8VKHnThzQ1e/wtKPG03oH0VfmDnEurMBLVd+2oBho
         s/cQ==
X-Forwarded-Encrypted: i=1; AHgh+RoQlosSXi2RLZ9icoXDriWdyNlzT1bI/MtXZWrs9CVPK+uqr61T3XRUJGO8Qco5Cu7H5ftSncWTzC5U@vger.kernel.org
X-Gm-Message-State: AOJu0YyTAqMELbFJO2TeRfwz14hHwTkZwOFSJ6+Es9/UmPHnsDLo1o+y
	Wq7TnRWmIv2jU6VA0r1p0Y9x5ejRdHzI60pQexXKgXdTwSTGmBKJofY/MfN9bPDC6aqSwQOud1C
	AQFqYPB/lRdpARa3GQdE9SO4jGo+qTol1GZphMFhIHSVZ3OF27rZqIlC3B0zT4jsb
X-Gm-Gg: AfdE7cnzdQEtZkYcpp50jyLhPgpm0qjuSSadHNRUsy7WQ/lo8Y9kVodg8OOBjo73cNw
	A/tTfRG1Rq3ktE35ytMSBN6/IfGPUW6bU0NrrHIfY+FLKV+lksPah0p1CWi78bVSyLKCOtMw2J/
	atmld9vfD/HSBdr0B5yf/mEZ5/1PuaNaJuQ/Src30eBjh/RkAaEdd+OfDbiuhxHd8wM3SXucq9y
	a0K1F5Qnxyfm0MKqB4v0tvKVDWrC1zFRhsT52H4aalXm0cch7TXD5WFhTBH1CngWWMb3WvmnPbX
	0ZfCKIG6bhDbLlXwXgir1QkHObsvaPw03jmvXR8Mu+WSOo0hio+Idi2ubwMQXI2u0Hmlyc2+MNO
	Kk1ufdRTzIP1ecr1TW6BNHOuBLw+Uce0osKtsKug=
X-Received: by 2002:a17:902:ecc2:b0:2ca:a03a:29b2 with SMTP id d9443c01a7336-2ce9e59e1e2mr172806495ad.8.1784120502841;
        Wed, 15 Jul 2026 06:01:42 -0700 (PDT)
X-Received: by 2002:a17:902:ecc2:b0:2ca:a03a:29b2 with SMTP id d9443c01a7336-2ce9e59e1e2mr172805775ad.8.1784120502060;
        Wed, 15 Jul 2026 06:01:42 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf106de049sm1922255ad.68.2026.07.15.06.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:01:41 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 18:31:30 +0530
Subject: [PATCH v5] arm64: dts: qcom: x1e80100: Add deepest idle state
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260715-hamoa_pdc_v3-v5-1-00440cfaf711@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKmEV2oC/22O4QqCMBSFX0X2O2XTbVq/eo8Imds1F+l0UynEd
 2+aIEVwuXAO537nTsiB1eDQKZiQhVE7bRov2CFAshLNDUKtvEYxjjnmmIWVqI3IWyXzMQm5EoX
 MKMMxkciftBZK/Vxxl+tHu6G4g+wXxpaw0A2+p99jlXa9sa/1iTFZ3K2P8O8+PzikKgPCMAWRs
 rNxLuoG8ZCmriO/0MIb6c5IcfrDoJ6hSkVKKhIB2fEPY57nN6XEC4MaAQAA
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
        Daniel J Blueman <daniel@quora.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784120496; l=11164;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=W2KrwNxFKLq1tJiXLUOCfFm1U2VhB5XaO6pzS5pKm2I=;
 b=l9mZJVFsDVxuzfYEXQBHQobUkDCYArgZhBLHh6vNdKY5sPmuccU+R0ImYxPqwujAL+CiE/3qQ
 3c31ovdI27dB4Q3Jmj9EeWTcHuF4v8szShcGTRwOsahAVdBHeFgxxqb
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=Yc6NIQRf c=1 sm=1 tr=0 ts=6a5784b8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=t9ty7G3lAAAA:8
 a=r-41rxsc7uDkY-bGQgsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: s0BoJvYCrKCbfPYFbF5ccbgEj-LsDZ6U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEyOSBTYWx0ZWRfX8hkCdzSprTZn
 /LE4ibyqvQWl2EdJHKI0mMTRs2toWW/JYyOcMJGJjn6OaZB5weD8z9ILTbFnAZO6C1H4DOZUozG
 pRsZ2vnL7Sm5HyTfMQCq0bkYQq8nqsTnJs9dtM4d+28gkR+BM/c5vgj/uB2Sp4voH99c9jPTEZr
 3afP64qVKu5UWrFn4I5Rx4sNI64X+hjUorI5t9GftFXqDni2va9giHFP4TKc3SOvVOhCn3vABOk
 PGWpbs/d7KpWhtxfoicKSlhoagY9OK4AC8VLlkAEggW3ilcWP4u0And7iXvF2dDZrgLELcw2nnf
 v4y0DjLtcYG4u6v6DVnkq51d0wLAIPSYt0eBcTmTZf69hgedHkFynACCvSlwrdU77usesyhq9GZ
 y80PeSS9lWMTKqpzJGTqXHxmMJa33GTK9BKEe3oPYSYHHHFmIfUfD+/RsbT5LBIlLhLVhoT5KIR
 q6DK5VfWENMpMfvs0ng==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEyOSBTYWx0ZWRfX6X4F6ikn1lEy
 gWg/bsgHo0fhWIXE2rUcshhWItLBXtkaBLsTApOd1kmG9Ze1XENUAaOO2EiQRlrZQTNnelbJejk
 diQE7DgdMRiLJBLIx6SHCBtJXAknbnc=
X-Proofpoint-GUID: s0BoJvYCrKCbfPYFbF5ccbgEj-LsDZ6U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150129
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-40125-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:daniel@quora.org,m:maulik.shah@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,quora.org:email,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 054D975E7B8
X-Rspamd-Action: no action

CPU subsystem deepest idle state can lead SoC to low power mode like CxPC
(chip rail power collapse). SoC deepest low power mode requires the PDC
interrupt controller to wake up the SoC as the GIC interrupt controller
is on Cx (chip rail) and will not be functional to wake up the CPU.

PDC monitors both direct SPI interrupts and GPIOs used as interrupts
in SoC low power mode. Further all wake up capable interrupts gets routed
via PDC to GIC when SoC is out of low power mode.

The wake up capable GPIOs used as interrupts were by passing PDC on x1e
with commit 602cb14e310a ("pinctrl: qcom: x1e80100: Bypass PDC wakeup
parent for now") as a result CPU deepest idle state was not added so
far.

The blocker for enabling deepest idle state was GPIO IRQ wakeup support.
The x1e80100 PDC can operate in two modes: pass-through mode (GPIO
IRQs forwarded directly to GIC without latching at PDC) and secondary
controller mode (PDC latches GPIO IRQs and sends them as level IRQs to
GIC).

All the SoCs on Linux so far worked in pass-through mode of PDC.
On some x1e boards the firmware configures the PDC in secondary controller
mode, which caused GPIO interrupt storms as the level latched at PDC gets
never cleared.

The secondary mode is originally a requirement for windows SW platforms
(which could not work with all types of interrupts and require level
interrupts for GPIOs). Initially shipped windows firmware did not have
SCM interface to configure PDC back to pass-through mode if with such
firmware Linux is booted up.

PDC irqchip has got secondary mode and SCM interface support to configure
PDC irqchip mode to pass-through mode on newer firmware where SCM interface
is available and for older firmware on which SCM interface is not present
PDC irqchip works in secondary irqchip mode [1]. Above mentioned commit is
also reverted via [1].

With PDC now working on older firmware as well add the CPU deepest idle
state domain_ss3.

The newly added domain_ss3 state has entry/exit latencies of 2500 us.
The shallower cluster_cl5 state had entry/exit latencies of 2200/4000 us
which are higher than the deeper state. This create an inconsistency that
would confuse the idle governor. Correct cluster_cl5 latencies to 2000 us
each to match production configuration values.

[1] https://lore.kernel.org/linux-arm-msm/20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com/#t

Tested-by: Daniel J Blueman <daniel@quora.org>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
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
Changes in v5:
- Drop already merged v4 changes 1 to 6
- Add detailed commit message for adding deepest idle state
- Add Tested-by: Daniel J Blueman <daniel@quora.org>
- Link to v4: https://patch.msgid.link/20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com

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
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 09527dcf9576..f01eccb67ee2 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -300,10 +300,18 @@ cluster_cl4: cluster-sleep-0 {
 			cluster_cl5: cluster-sleep-1 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x01000054>;
-				entry-latency-us = <2200>;
-				exit-latency-us = <4000>;
+				entry-latency-us = <2000>;
+				exit-latency-us = <2000>;
 				min-residency-us = <7000>;
 			};
+
+			domain_ss3: domain-sleep-0 {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x0200c354>;
+				entry-latency-us = <2500>;
+				exit-latency-us = <2500>;
+				min-residency-us = <9000>;
+			};
 		};
 	};
 
@@ -462,7 +470,7 @@ cluster_pd2: power-domain-cpu-cluster2 {
 
 		system_pd: power-domain-system {
 			#power-domain-cells = <0>;
-			/* TODO: system-wide idle states */
+			domain-idle-states = <&domain_ss3>;
 		};
 	};
 

---
base-commit: cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
change-id: 20260605-hamoa_pdc_v3-6dabc845021c

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>


