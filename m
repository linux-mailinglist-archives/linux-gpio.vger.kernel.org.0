Return-Path: <linux-gpio+bounces-36778-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +A2iDB6yBGoQNQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36778-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 19:17:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C275F537DA4
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 19:17:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0183B300C00D
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 17:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5AA3A2E2B;
	Wed, 13 May 2026 17:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VMOkt2T9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lj/pDm3H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8619039DBDD
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 17:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778692630; cv=none; b=tSTLuyEwFWKY38rEnPrlPei1ZNWfw7nATt9hKdi22dUcemnFc3zU0cfrJfb0QQTb0JKcGiBAy1i/o+L4JxdgW8H2Ulp/Wn5L4hdQFwY/dE3B322S+1Xm58lk1gXOvhMG7/00v22BiG7H03OaE4BQjy1xQ6/BfApAGtsujEV3FC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778692630; c=relaxed/simple;
	bh=0S9j7FnuPmvobUdGBBFR9mVHs/17xvy4ykl0MOW3i40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lPEpTcqvmlQ1EW06sY7Ja5xEQ/SRmU8Ef49bHkf8hNAs6dyO1kOs3xys0lCS7End7Uur6OFjTdfGAp15qmMiuGOZTm0sXBlfZtJDlLiOoZei/KQGCGN09dLsmoZJD48KgAmlqYH8f68lwM9CZ2DxwKcAQowvg9xzagjmuTDbtYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VMOkt2T9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lj/pDm3H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEm13R2887818
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 17:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	190VP7a6BX04bhOypgQFXVE0wD1qu0burap4lRbcsRA=; b=VMOkt2T9AWzpX/2Y
	F/0z2gwP2iT2SjyvYZZnopLNFEkatb0HUTS0i2TJ3SS/XVVm8ylYwyikwvNWmdtR
	pBtKt1XUQX78PU8nqKLx2hlQRLjlGMqisFwMluN+w1PwEQ2J9VIajCTEuo8fGb8R
	6t688mBRG2gx5CEmb3Flxe/HpLxerOA7kXdFzaT2hSaq0CYPPkgKKBY5FZ8lT/Y/
	xN2BS22YiuFHSZxmRvTIzWiQHB6wgCizbMc2ERJWAYtg/tlMc/Dk4NqickDgHngF
	sWDoPAuEXN/ATNjDb0RC+6To/zH+0DhTSIyyCgEXTyEnOIT/e4wEgBMxjfh+0+2D
	ghaocA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4gj1nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 17:17:03 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2f485961555so18611274eec.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 10:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778692623; x=1779297423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=190VP7a6BX04bhOypgQFXVE0wD1qu0burap4lRbcsRA=;
        b=Lj/pDm3HXgd8cyU98UvswQq8ieq2X5x1dAZnZabhaiLhdL0zsY3GiAhKK3X4hIFTQE
         UpiL3ujIY3Lku9vFXtL2qts2dODBIn4S/dOkWwI90etjAVTus/Ky7Ohb4kPD16E8R7PO
         Gf1JzyfnaWuIxxHBIuxShyRISP4FTGoOWbMQFTRgJYX8EzOUQ90RuhDV55ohzqpf1BDi
         XGQkbndhasGLyYopfBOdn6ZOHfiJPfgObeJIRFvO6U/9oCBSly5deDNLpSEc7rY2sNKT
         WyG+Gv5UpPzr1vefRlqnFfXS/62MuxS2E19YE9SQIhxUn/u5qulLjvIbawRGxfCdt4fi
         RUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778692623; x=1779297423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=190VP7a6BX04bhOypgQFXVE0wD1qu0burap4lRbcsRA=;
        b=qnFGMNuzTVr5QJEwrsa9RCLjNzVTQchQDCvt/hZ7I7SKIYJ+Al5YW4k0S6Uo4pmyip
         aNGtRMHMmTQik1WAzdorGXHym1Z1huZYbBq1kMlMCM1DzZoMMJQq6p6QKo/IUbNQBtmq
         l3QM6pVLTI6hqDSSDWkKufXc05SLeBr0We+MNX7zkeRxA67zZJHwpBVEQU/UxrkMcGqH
         8CDdGdCaLPEnXPuUnxAk231NYXbF1Tbf6Q6o2JtuiUAsUAIeCcU9FCLvj9Z5igEWpmH3
         6uSp5cWiUiLKrCr18Dc3TnpjUUKyfxxsY7yQUi/G9Ns1wLiOyD8zzDuhs43hQ+dIQsEG
         2J0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8OjDc+RKthvj7nEsuEL0iHrQT4odqvj7VmqrckrrP9hVLNypSK/k7diKkoPlerRQyVnTPrqRTNHX6O@vger.kernel.org
X-Gm-Message-State: AOJu0YyDbLVDSjj1GsAtqShgQQRxCcaJJqTujzBEPwk7ztKC7MKcMacH
	WwMY9ERhPx4OUgZy5hUHDSJXxCneMKsI870LWCBoQdoR5GnVR5/5A7doWRuze2QMey3fiIreLTx
	NUMZIjBT30jcXzqZNZm6D1f9FxWgpUo24YDu8hS6jHeOU/ahl7EX0GHYK+7cQp5vG
X-Gm-Gg: Acq92OErDVgIFHtzlromQ8W2lLMuVnkNzV6V0FiJJMv6BsxQaV3Eqh2ikbmZZa6oKGg
	UtWrZxLKeF6YlcF5DtIOv+vjPjjDsdPrP+JHa8oDQnRt8zSnbuD2y7OcSdSczbDCL42YsLz0+DK
	EWDwYPVXWdyQaYDjNaHr5cp58HRgnDFUE7T3HNDqUszSnDK3AkAV9C6z4JBnNWdhcUOWOl1erks
	uGcjkj/hHE/5Fn62Mcp3FdLJeXj500NETZHQWt16BaBTY2+67179+B87KOx5DQMp5ahRoEiZhUE
	LvlXu00StLQ4GKYWDIICbgnTIQKXB3ynRwV5ajGDpWSvYYfOsRXuoWFiJW2ujpBp6JqnDwOmf5G
	Jc9ZQggNp9AvPs5WNP9hfFpoa3Hn3VjFDo3y+qMugLyjcimdbeTFCVfhWXjCACrBSdgaFNCM=
X-Received: by 2002:a05:7300:5412:b0:2e2:3381:2fba with SMTP id 5a478bee46e88-30117faa7d3mr2658720eec.3.1778692622833;
        Wed, 13 May 2026 10:17:02 -0700 (PDT)
X-Received: by 2002:a05:7300:5412:b0:2e2:3381:2fba with SMTP id 5a478bee46e88-30117faa7d3mr2658689eec.3.1778692622307;
        Wed, 13 May 2026 10:17:02 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888d3af4esm23075939eec.25.2026.05.13.10.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:17:01 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 10:16:55 -0700
Subject: [PATCH v2 2/5] cpufreq: scmi-cpufreq: Log number of perf domains
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v2-2-36607e9dd540@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
In-Reply-To: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778692619; l=1077;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=0S9j7FnuPmvobUdGBBFR9mVHs/17xvy4ykl0MOW3i40=;
 b=6Vkg+4M4BEnG6+g6RMd6yk54y+a4e0RE4C47kciBZY24QjJKcU53CSueAMfPjK/6gchvjoe7K
 ef6MGhi5WiFCrvQ6v3lz3OSYvxZkL0evl1cDqxLdE15iihLXDW/VqpK
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-GUID: E0o-vLr2lyZqGt1gEJKXmm1wB-IP7zBR
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a04b20f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=xQYt0fwn8ryh7dGzGRYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: E0o-vLr2lyZqGt1gEJKXmm1wB-IP7zBR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3NCBTYWx0ZWRfX0h7WOL4m/NqM
 /oVPj/D8i/6gZWGZJhLI/HeSLXU7nocveKBeycfiZc13OklIGZptwxkvwqb1LfAkNuxzd/hY33G
 aO6Tnxb+0Wluwr6c4gBuIOqSzAA4WNtKCP1hV3gNLGSh4AxOK4RaQOlGNf4Dr6IN2he72Gm6pbF
 BLGswmJZEziSM42pHdFgGzQ9Pvft6LjjUuPGVCLvQ8EGKQFK2ftfdQ/KLrg0T+94gQJ/IP1BhyO
 am1TBbG4w+o82d6YCPMnS1RgOSFJEQbxTavDt+2jmCo8r9FYmwLbc3J4jqCkxItooFiFxCTGtl2
 7YJ8qINTnds/2bOaIWeyRO3tyEQujNQ1D9hx+pysvTd9n0ukNyNa+qRx2e6NEPqx12Ycne8r0BY
 Ot0UuiRwfc0vNGYGSHtEKNN8uR9AJIwiQEmOjLmlPJyug2fe4Okh3SkaECtdjpjefnIycE7/lo/
 WR3EULjktcNTxqSJjuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130174
X-Rspamd-Queue-Id: C275F537DA4
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
	TAGGED_FROM(0.00)[bounces-36778-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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

The SCMI cpufreq driver does not currently log the number of performance
domains discovered from firmware. This information is useful for
confirming the firmware exposed performance domains during debugging.

Log the domain count after a successful probe to align with the existing
SCMI client driver logging pattern.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/cpufreq/scmi-cpufreq.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index 4edb4f7a8aa9..f4cf59d862c6 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -468,9 +468,12 @@ static int scmi_cpufreq_probe(struct scmi_device *sdev)
 	if (ret) {
 		dev_err(dev, "%s: registering cpufreq failed, err: %d\n",
 			__func__, ret);
+		return ret;
 	}
 
-	return ret;
+	dev_dbg(dev, "Initialized %d performance domains\n",
+		 perf_ops->num_domains_get(ph));
+	return 0;
 }
 
 static void scmi_cpufreq_remove(struct scmi_device *sdev)

-- 
2.43.0


