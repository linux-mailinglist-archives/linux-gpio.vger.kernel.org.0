Return-Path: <linux-gpio+bounces-36776-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0M9JEVS0BGowNQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36776-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 19:26:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F45F538035
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 19:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 90EA5301A4C9
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 17:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5FC4C956B;
	Wed, 13 May 2026 17:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="doj8WYW9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VwTg53Ax"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC4D3A425D
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 17:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778692629; cv=none; b=SVKCvuq9sjYm6SmyCLZbYY39zwyTujQX+3Ye5YLIN47CuvJSDArFJUULupH9papVSST2K4I4IaRIpR+hHBLZRQSywJfKcgAmpciwJuMvJqUq6iKZEMSWE4Iq9by8/4mRFuBrki9iQUx3FM4HwH22WRtEWk5YXFGh9PQkRerjVf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778692629; c=relaxed/simple;
	bh=fzd/vjb1u/hgb97IIYa6s1ipXIoqKNbwIvaC6OZFVtQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VG0yJICpk83DtXJd5c9DTYRYslL7gVCHLy3wpAcuGxNU6RomBc4AGzqKiypmBiwoI7eweLF5QJ3HAyexYrly09yq82GSG9qR7qBqNpg9CHj/tvRWUnHAqXVW3AAmP8vwg5giL1Yb9Ydt98vUZbnugVeOE99aA95bx3vzDWxidOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=doj8WYW9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VwTg53Ax; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DFdt7E1242989
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 17:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Jx1/70KZBMxN87YCAFelMj
	Lwd8H5nC5QRAC82Z/a19E=; b=doj8WYW9nQl1bm4XpaUDKLOxmiewaY7ayXEBEm
	Jmq4WomSg8Bxiawk7NqxRfS3kn3RE4sRIZ70aXSwif/98faBGT313er3vFJu8hVJ
	w875fu7uf6xEKWx/2gqMl0m/CGHaMXM315yVicnMAUUyEmSWrz+nBcscg78yxZ9O
	6DU16hlzV1gDW7KLvRuGNlfX7/caykeble/2hvlgfYWOH2IiwQtaxeSo48ZJbc7K
	2VRpbY6XYjXssA1K7vpNTZw9vM/M5L/BCTx6LNcpqg7ANVRzxp7obSbB2cyGlXfU
	zi6Hf7ky5E43F2EhOWkmkPdi21hQFHDq7ORNEfvuvJmQcxTA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4trd9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 17:17:01 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2fe1cf409a1so6107865eec.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 10:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778692621; x=1779297421; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jx1/70KZBMxN87YCAFelMjLwd8H5nC5QRAC82Z/a19E=;
        b=VwTg53AxrwR+Vs4qdgj0ANcI0PDFnwI60Te+TWNSR3YCPjFACnKET0T7fHXca9Q3Zv
         pT276dGKRje86tDNGlVF3YuQxY+t9B54iUrWr3lFWplhh9h610rhv5SO3g3X9E3a870S
         4Pj1URXj5VVTzH+/dFzPqOMxzUzIAGSqtkQmhTMWuEj4C2KV4aEkTTG0vK5ayhq/cTKQ
         3s00F7i6Ynm9bAAvbbZ8zrycfhE13UoYuy0+Zc6aBOVxgS6moql2ejXH0fjmAiCFirN8
         lNHS1hBxtHl8d5E/0KqkkAl7ATbbdUMUubl6oXKvkGk+AryOp305jIJyJG7Jd6mXNLGR
         hMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778692621; x=1779297421;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jx1/70KZBMxN87YCAFelMjLwd8H5nC5QRAC82Z/a19E=;
        b=P0Q+E7lv1pAx67sM+HFTzK3sXgVoNFOSDhIdXuBsJ/r3OMdqmW6LnOrDjFtKzXxcAx
         sMst99RGFty1h4OUiapSufzacGmWyU+0ETX+wFsXPYbsnDEK5NQXRyQjZIkHsA+bDxv5
         dizxUqdQBi0LcyrUCVxhFPjkHHsW2VsPmga0vNtsgxADY810RZHEDlPO42AWMGYuWlpN
         EX1JLLGsTXKbPpUBXUt3eRCKzXoEDJRE/ra73VOKNiW3sPm7sxoPRjNGYXSQS5EeIhZb
         WrMBSCqoFmCUAmUZJ2zsCEgtS1six5er6XVDOLZq1jGa0Jy3AuFeZ4YpBwBdeAP/CERp
         FaGA==
X-Forwarded-Encrypted: i=1; AFNElJ8elOEH4HSLeJEoRkZiqaiNcEb4S/6eVVJz8erJgD6gXYNMpsPHSNyeJJI2CdO6Xe37GtsSPhQ6VHVB@vger.kernel.org
X-Gm-Message-State: AOJu0YyWnBoTNuyLv3vfJDvW0Q2Om0czBNPlOCTRD35T7oHbA3/1SkJK
	zayRHMJIgjLLvBb7XNunx/9cfygTAwyoVFoHYn1CuI+xn2hLw7wpCgTZLywrJsuGb0erDhhY85P
	Xewzgt9AsehWdes42+RxkCxp/jBsF6UI/lWYf81fz24AaKundjBv0eypuFi8UzfPG
X-Gm-Gg: Acq92OEgmiSbtkztZiDK2W8xyeB+BQwBTKHxMO06kvxxOdZ6HioqKLOCaTx1xMIWhda
	B/8pjZ03yiWEEbISEEO/ft9z+ef+h2vp4f18c9Fxumea2PI48aLnqwFY7Gs/1m60yNBEBllMj2j
	xhNZQlWz158d9NVZNDMgoNUWjHHnaJ8oJ5cmdEh65MpRVqFrEg5YShmBp5pG9ztVehcH0GZFE1+
	S20OkHy5C+UL2CoiCcpQ4pmLwhLbznODT+ROb9GS3wdWxby+zOwuZAq+ikKFfLgCSGflI1Sz4pc
	sRRLadEculxHZYvhxeyasZl7GetOWjyPbz7bgOLWrHBktrSZh4yQ/6+Bg05Qc6JAEejT9pp53kD
	tYp93uc9HwQEUDUIkmENOeCykXw3xFcVH/vou6ormF6iv6nqV2sU2CW36SRrnerYJsWuwkB4=
X-Received: by 2002:a05:7300:ec08:b0:2e2:4979:eb5 with SMTP id 5a478bee46e88-301181a676emr2698551eec.10.1778692620779;
        Wed, 13 May 2026 10:17:00 -0700 (PDT)
X-Received: by 2002:a05:7300:ec08:b0:2e2:4979:eb5 with SMTP id 5a478bee46e88-301181a676emr2698523eec.10.1778692620213;
        Wed, 13 May 2026 10:17:00 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888d3af4esm23075939eec.25.2026.05.13.10.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:16:59 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Subject: [PATCH v2 0/5] scmi: Log client subsystem entity counts
Date: Wed, 13 May 2026 10:16:53 -0700
Message-Id: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAayBGoC/3WNwQ6CMBBEf4X07JJtsSCe/A/DgZYFNgGKLRIN4
 d+txKuXSd4k82YTgTxTENdkE55WDuymCOqUCNvXU0fATWShUOWosYRgRwY7ME0LzN4ZgsF1IIv
 MthfdaJ1nIm5nTy2/Du+9itxzWJx/Hzer/LY/o8z+GFcJCIjmXBhpCLG8uRDSx7MerBvHNIao9
 n3/AH0Dg9vBAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778692618; l=1518;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=fzd/vjb1u/hgb97IIYa6s1ipXIoqKNbwIvaC6OZFVtQ=;
 b=8l/21SLzmvsSoWLwwEfvmbO5Eh+2Zd3kiPyE2vcX82D5ElADwxGzPYS6H11r/GbzbkoITVhZZ
 vXKXed0fUU2Dshw//daOmL2IuIk3EdWjopaoUP7UBGfpOzKvblX1sea
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a04b20d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0wi9YMwNQcJCIsSnl6QA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3NCBTYWx0ZWRfXxNvoh8E3dWNX
 sLXc0kgCnVjA9pGvHXHS3be5IsARA0BlPB7wjTKa2L1BOSHGREMJqxsUnIFGl2V+JSuRI2TTVEi
 klmnCJFbs7HUmYuf5/c28lWdjVg4ZKuepKBF5GZhecaTEAjiLGA2hIa9nEC15Z2Ok6bAWond/WV
 tqkKVIVw2U5jIx/MXM9i4te07DvGS14w7td4E3o6ftsbl3vdzXZ0dreRtbrk5dEMy+T8BbrXTXv
 RjS8+2fjDd94tJI1pNV1hQZqYjzfuSkfACQbVtZT4Nka2ILi3IfjVaz9AXWToxHtyEy0QUKlVBN
 db+VtwDB5Tyi3fDYZsKwvoP0pnkOUto4hqTaZR0E+6lOf2CdOoGaUTgb89+U1sxR/rMSOvmZ1/i
 rH7slMdEsun/JpQ9c/yDEIjYIp0dU5qR7j9oTxVzGgnsecxodwiB1ySs9KGZ43tQr+Alg6tn56P
 WECN3rDp7Ywg8l0uDmA==
X-Proofpoint-ORIG-GUID: w3F4KcQ2v5N7UQXOqhxXEtnR7Jvhakhc
X-Proofpoint-GUID: w3F4KcQ2v5N7UQXOqhxXEtnR7Jvhakhc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130174
X-Rspamd-Queue-Id: 7F45F538035
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-36776-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex.tran@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
Changes in v2:
- Use dev_dbg instead of dev_info log level
- Link to v1: https://lore.kernel.org/r/20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com

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


