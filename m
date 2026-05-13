Return-Path: <linux-gpio+bounces-36767-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCzCCHKqBGoxMwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36767-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 18:44:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1C053751E
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 18:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BD0533002307
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 16:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B4724C77A8;
	Wed, 13 May 2026 16:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="okBjSjsH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CTZ6gkCr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E727401493
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 16:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778690671; cv=none; b=AwI0NRItH5xACwi4luOtCyGEeUcouXgPFflDXRQSM0SpYkjGdHfgB1+/daSpszNwBzRG+qv+nRr4lCuyY5uKuVXJk8oXiLgODC4oUZdj5XnHQIhy8SlsXMFUX4D4bThZa1fbQIqaxMp9BVdtMk5bV5PuxWcm8hnmbeQdAfLtLBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778690671; c=relaxed/simple;
	bh=owGm+6Ms1s9d1BVzLgyFp+un8WuAsYAf6l9Aw77jkfw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iY0NIbB8WdoGS5C8X+M53C0fZQR8DU4yX/VnZ/+LVpFjyf1i2hhFn6Epa4davUXqgqGo6S7aJ8PT+gKPO7wUIAvIrvxxojhsM7BJcsmURwVxWsTDKHuRIrh8S1lS2144axfvA9oNMaCH39Z21H2liR2RG0/efOn8y9XzoCIpL3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=okBjSjsH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CTZ6gkCr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGAsxU2524326
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 16:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GxOv3DEpeFsG7lGsUZy6wV
	j3hN4O8w4tkjgP0Pww0/o=; b=okBjSjsHw5BOpXgK5ziJusqTYibbI6kIQpYBmk
	giLoWevafMpybboM+vGfOD8xMjXNy+ZJYLOlAp/kUl+r5c7wWiR9KQdGYb79jycM
	lQNyyEXf7OmwbBPmAY1I+y2lvbbfywFHr1Ab7fVNKgfozyXdCbIIKiSVRydK6EG5
	kyGJsXRxg9Yu1MB4g/QOuLeykYBO6s+qq3CwguXGfoDFzRx3bp8kTSPei/ObVaQs
	WufDZauE0fbf9DThk9H+PV2/DPmFCYv0xumXye7sKq6P+EquzGF3rwkf45D7y87c
	G5VU4h/3Cz6JoKoVgS+WacJW5ycpsfgeF42ZX5KNZfV2JPwQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjg48q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 16:44:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2fded513994so12306595eec.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 09:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778690668; x=1779295468; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GxOv3DEpeFsG7lGsUZy6wVj3hN4O8w4tkjgP0Pww0/o=;
        b=CTZ6gkCrzbh5ifYR2oUEU4HuEga6muudDKPasZIbqkBV70FwP6RfoGvczcfPexp3UX
         cO7lVCr6+9f5IQyNMwguqunTQAccLxUU7xo30qTCs4UZTCArEtxtU3tFbyh02o1KLBlK
         HHgEsSRI49eSTn5hOGcErCU7RJ5uYafyO660aABt/Zmxd8lYCCd+D8WlbWzve/Or560E
         7WVqkZ9MwcRk30ERL7x7nAoMp+ZiadhxaVW8fvts8aeIOoM/d8ZyW0S2+TOJJWyOgNXh
         B/U8lTzu4XOhLvkOzf5mldt4Akuw3M2gP5auNlIsHKqvMRsBEVGRaVeJZ/eqx4kr/VL2
         r7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690668; x=1779295468;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxOv3DEpeFsG7lGsUZy6wVj3hN4O8w4tkjgP0Pww0/o=;
        b=HG3pziSqQC0Kp37ExZDSf9xaYvR82OhlVKj/RZ9Bz5/tr1zvlpOcmmWo7ouhA5ybsw
         nPxcM9lbyET/KnZEreEjMSsqVm/XRY+Mkl1I3Yer6r0WctcCXAD1LtTRATINMQ9/RYo4
         rVF1EB4pnSY/eRh0O1u+t3tH9D3ocjMBuLpYSXaREEgUUue6OkBM3+CUBUIunmhLaHnY
         kgAYb1f0UwdlZQOQce8O357w+rMC2q4KE2vKip3j3TxcTibgyNQxdEzM657bBr3sR00N
         wqQYQfZxoVm6CIQUg3Vbv3A0HKjzs87c/JjTpfQ0Xv6ETPqb0vXbWQYBQJlbgebj4J5v
         KovA==
X-Forwarded-Encrypted: i=1; AFNElJ84l3S7//937s7ZHQ0gDZMUvVffUCL5qoNYTk/jpHCj8K09ZxjiKDC5Xu1ozR/ZkEfACTd6Uz0rYhOw@vger.kernel.org
X-Gm-Message-State: AOJu0YyShGAOXaOmvDAhfoPlEiAUQWZf+FwlDSaqjc8jPdNqNb34uijw
	Lb6T2zOqGjETUpQHCzyxefc6fgjeIZ2TviLI7hqpc6om5Y3knhaBY5uU2Uwt81OLmvDE5euF2o1
	VIyYVk87Kvj5XLXR+vwxEsVZgb4n7SaLNVGECg0Qb8U3XXSQ37DFQ4sH+oCA7iV2e
X-Gm-Gg: Acq92OHpqhkFvkQsKiDnMdmSh0u/e9A2Jw+aJA3U4ut6OFsZzdj9GE58ryu3548NfwI
	8VVSqpLZYfSCReX2xPDhu/CCAK6ddO3Jr8WrOfr8bmj4LFGgm2YjPCQA3vhxu21G06Db3MFXDxb
	MZBMgF9rj4DqCqCy5Kn2gnUJ+Hu4WYsK/iNjCalOJk3s9LNHbhla+fek2F3WJhg2lARl2Bc+m6U
	2rqWqeHFB6mz8t41KAil+JB37Kyng+mEJfZAma7sMgqVlpSdoJVWDLdlt5HX5c12E0Tu6JlAG/J
	0BG4RglI4AQ23PCg6WzH8Ry3E3cyw8U/OTkJYfOqWZ8c6Q9k2IqSSjqQyK0FsBMAdZX+SOKvmPh
	bNjpcnZrKcOyRKyXFH0xQlkGXCNcCFlK16UoKw7wjFzoltUQhVSRKeT+TOuRyareuu3VTQCw=
X-Received: by 2002:a05:7300:a504:b0:2d9:7bc4:9578 with SMTP id 5a478bee46e88-30155e304dbmr1975303eec.28.1778690667510;
        Wed, 13 May 2026 09:44:27 -0700 (PDT)
X-Received: by 2002:a05:7300:a504:b0:2d9:7bc4:9578 with SMTP id 5a478bee46e88-30155e304dbmr1975276eec.28.1778690666940;
        Wed, 13 May 2026 09:44:26 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8864c37basm22570076eec.13.2026.05.13.09.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:44:26 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Subject: [PATCH 0/5] scmi: Log client subsystem entity counts
Date: Wed, 13 May 2026 09:44:18 -0700
Message-Id: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGOqBGoC/x3MTQqAIBBA4avErBuwQvu5SrQoHWugNDQiCO+et
 PwW770QKTBFGIoXAt0c2buMqixAb7NbCdlkQy1qJaToMeqDUe9M7sIz+IVw9ytWbaNtJ42UqoH
 cnoEsP/93nFL6AFz84YxnAAAA
To: Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778690665; l=1343;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=owGm+6Ms1s9d1BVzLgyFp+un8WuAsYAf6l9Aw77jkfw=;
 b=W/Xp+gageC3TE/YpgFXFLe+pQ267y6ZmcjgpS00EQKpFmnevoEgeH6XSr277h756bxENsa6q3
 0CHZJDNRK41CRyitjcc/SiRtRARtb3XvVyWqFikd3hYiupPgngaWxsP
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-GUID: nJKHOtZ5JwJeajBHZZpBZAv65nlBON4E
X-Proofpoint-ORIG-GUID: nJKHOtZ5JwJeajBHZZpBZAv65nlBON4E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2OSBTYWx0ZWRfXxveuCzjvwnSX
 zNSwMCQpi2km3VfPsU2GSKENCGejh2+SaQ5oHyZp02ucdIm+mm+H5CQ2TbhloDsEWeEAaQrHSJn
 6rtDf1nNANqnCxOwH4sut5Jv/Sz3LM6lxaoN4dDhECfgu1xc+TObAtMjmUWb3MQLQRrQIVpy1m9
 oA9L7bXirCyQCzfA4RcWsRbQ9PVh4zaA+D4qEkUGRrnECbKCXszedHTS/tSWi9vpUWqG6tuADSD
 Xno7q/N8SgAq0PO0fMzL2L/cKFqmosK7ytYLtil9TmKWjPPoLXByvVh7IWB644u0ZVbnierjoqn
 kQlXJPnN1dR5UsOTo0nusWLU6vpBpgS3gT9w6O8JaJGj7Ke38ryVmDLG0ajGjZI4acCPCbPuQrV
 RBeJniIXPx/cwAm3HuQn1JXQK0yX8Y4wmwGrqv55T4AyuEK6PlxZAQW7g9F7+5UlyfPIHNJ5f9O
 +KLxc3W2euq4wRHf74A==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a04aa6c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=0wi9YMwNQcJCIsSnl6QA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130169
X-Rspamd-Queue-Id: AF1C053751E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-36767-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex.tran@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

SCMI client drivers do not consistently log the number of supported
entities discovered from firmware. This information is useful during
debugging because it shows which domains or resources were exposed by
firmware during probe.

Add logging of the number of supported entities to the SCMI cpufreq,
pinctrl, reset, hwmon, and powercap client drivers after a successful
probe. This aligns these drivers with the existing logging in the SCMI
power and performance domain drivers.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
Alex Tran (5):
      powercap: arm_scmi_powercap: Log number of powercap domains
      cpufreq: scmi-cpufreq: Log number of perf domains
      hwmon: scmi-hwmon: Log number of sensors
      reset: reset-scmi: Log number of reset domains
      pinctrl: pinctrl-scmi: Log number of pins, groups, functions

 drivers/cpufreq/scmi-cpufreq.c       |  5 ++++-
 drivers/hwmon/scmi-hwmon.c           |  1 +
 drivers/pinctrl/pinctrl-scmi.c       | 11 ++++++++++-
 drivers/powercap/arm_scmi_powercap.c |  1 +
 drivers/reset/reset-scmi.c           |  8 +++++++-
 5 files changed, 23 insertions(+), 3 deletions(-)
---
base-commit: 1bfaee9d3351b9b32a99766bbfb1f5baed60ddef
change-id: 20260509-scmi-client-probe-log-173cf85d5563

Best regards,
-- 
Alex Tran <alex.tran@oss.qualcomm.com>


