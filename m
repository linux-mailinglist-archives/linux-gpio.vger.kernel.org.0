Return-Path: <linux-gpio+bounces-36772-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJ+jILewBGp6NAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36772-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 19:11:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D776C537C78
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 19:11:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 123B1319FD83
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 16:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A72124DB567;
	Wed, 13 May 2026 16:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k9DJ3/eO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tc7LkZbb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0644D9911
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 16:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778690677; cv=none; b=VgoU/Yl+BqdRV0XIbDU9st/U08a4d4LenPwdZG4hBHh0tN7JikniRfINStkkbqyvtt6T1TbZ6j/p908gFlMNXGTCUHtKjZlx6YAqnsg4KCx1byIX+Tv4nx6xTh5gtIC7+OKzu8ETy5jdwAX/aga9otYZL+PX9e1AlUXmouT+5ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778690677; c=relaxed/simple;
	bh=12DADEarUp3gyIYLo4clpW0RLu3uLhIZfXDpYh9E1eQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gfDrmjLfCSHTp2sPOzMDRayQzzmI3+dX5CI+9v/mCpjXqC7tz17/khxxcPIQQfC8mFHUvFrZNko61JOk0zVflStiau48luoKro8F9LvnwxyyDz+u8gAI9TilWCv80qgUwwGjCycrvy9dz6JrV7cPv3158heY6f23rHxCvRUAxd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k9DJ3/eO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tc7LkZbb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGRpOl3007657
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 16:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GJPzNroPQWOtDnw6fNmSbwn2Jxwjo9RD6cA8VRV4jDs=; b=k9DJ3/eOBorwwk4+
	zKViZkFVYSkOhuK2Zf/yp9bWAkDC00IepLkab5tzvVD6RJgqHVrkznwqIp00sGwF
	zTMWU9uiNNckpMBuiOm3wt2n/x+dgtJxQXNZnPuj8ptfD8NAf3WakVqSOrYpcol8
	sPMCpU4Rha5ok9LMAB2RyU3mGAdLvkMQuLPqlnQ9cNai0scs0b+qR5zpxIGjpm/C
	mvvdebiTPTG0ZV9XUWWdEbEl4ntx5LpRd5qX89JXWMWdxaPW9eRAJjZJhD3Bmp3H
	hoSag84tFXFccKZENy/C+BGsRT7Eoda2sg7otQNzvB0ccUzNajELJP3hv4TQKQnd
	Sq1mjw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0hm0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 16:44:33 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ee1da7a13fso8800831eec.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 09:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778690672; x=1779295472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJPzNroPQWOtDnw6fNmSbwn2Jxwjo9RD6cA8VRV4jDs=;
        b=Tc7LkZbb/+C50WMNZdKSS1E2+nTUS9DJkcb6r5g2xbjYDnizxFtS5OLKi8BqdI2doC
         OSzEUS9xa/lj4Ea+akxDGpYHLRgWT+LeqRSem/qfNPcawcRxBkzcdzFF2QAJIki1K9V0
         66+DNurpiuc5VGkeqKWJ05MEOeyvDilol+Hbw0rWjlonhMTcq5HQqyhKGVCpNH5KJHv7
         hBg+LJWGeAcexf0gOmMg+Kgez0ZIZbje6fbo7IP2lVRDwS9N+UmeXAxrVcojpwgHIpvA
         XkiV/fFX8I9p76I++Ya9D02IkaONW+i/eP2U1oAp+1zQDhbfTNGxJQgZPEql9MqRasbt
         xGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690672; x=1779295472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GJPzNroPQWOtDnw6fNmSbwn2Jxwjo9RD6cA8VRV4jDs=;
        b=CJWYHwabrWmgRjgpRJFmwsP4nP1q2rRlzgMnXSsvbM66h2XcpKxcZ4F+DbxohR5Pp6
         gvABzShbdEPUBTKXVxa3SGwYJWlsAWdjjsmEX6Bfks07lorfLE/lKfABbIDxtEqnf822
         qaaodeEB72leku2kBMZZBn8pR7Mdfcd/s47X36WHUQtdPicnGUUyzr8QUZcJSPTHfHpn
         +mJfrRlwOdm+0n/2YekzDWiK+JhrD0yVi327ndLmt30NGLZWHIX6zIaPuKohd+Nrne4D
         26fyO0D+M4Xh+pfL0f0wLOgxDFJNxL38aN6py77DdE/R9FOzyHfAS3Q38PJXL6iAPWxJ
         2PPw==
X-Forwarded-Encrypted: i=1; AFNElJ/qoopyeXBotOT0KslIZZwNLqbLbwmmiK9GFG+9nG65FzFlCct+zE3GBwf2XzmEZtLrl7taumOY7WkG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/LfdN/NXoMINltSLmBWNo4jW/AMoSKmBUhu3FHfxcThAFVVla
	ArSnI0rl5nEJn5Lg9T/vmM7hXscjcvvgm4ChSoEoP/oaRa7b50A/swUlW9R2eIJQVVsG58PHQTL
	sE9WnIYhdKMjmEJqUm3JAmwS5EbOnZNpe0HqXIKbiaFoJXnxF1e6LqKm+3Wij3Jvs
X-Gm-Gg: Acq92OH7WHG5d/tiKQ/1HNOOwa2ZBQ7G4BlJ48kRdbENusuiRU/XoohgBmiTOXoTWQS
	gOmDigT5DTYr51n8SBUIrpEv/c8C4t0oibwL+XM0GjM+O2nz0xqi2BJaOPRVJyMDjDa0tWMyGVA
	2mOvOElLLqgkIlChJxU8KNLIAA59vFMOlRzqOheOkrwFePgpQ808ezCEoBv5T6rtDFg+FhNpiS3
	0HTbvogz42iyg2ko9sLOypFUchdSe5cPGualwGzbCdQ4rPXJJQxPT1nHAYpWEgKyf1n7DDR4snx
	/W5vheM3h8QHI7tRo3+ZEbLbxsZei+vhO2piWx2UhM0zF18h/UsgLNF7efYb470MQtY/7sqFW/J
	pQj/Hmjktx6ZWvfhAkB036ZKVqvH36IzFdRvBhgMSBMkJrf3RZ5z7DKUhYl1xPomEW1xaYcY=
X-Received: by 2002:a05:7301:600c:b0:2d8:df01:d9f6 with SMTP id 5a478bee46e88-30156511808mr2025517eec.23.1778690672489;
        Wed, 13 May 2026 09:44:32 -0700 (PDT)
X-Received: by 2002:a05:7301:600c:b0:2d8:df01:d9f6 with SMTP id 5a478bee46e88-30156511808mr2025483eec.23.1778690671931;
        Wed, 13 May 2026 09:44:31 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8864c37basm22570076eec.13.2026.05.13.09.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:44:31 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 09:44:23 -0700
Subject: [PATCH 5/5] pinctrl: pinctrl-scmi: Log number of pins, groups,
 functions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v1-5-00b47b1be009@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
In-Reply-To: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778690666; l=1457;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=12DADEarUp3gyIYLo4clpW0RLu3uLhIZfXDpYh9E1eQ=;
 b=f8Z4VKh3kEE91Iigqa0bRxoLVWmVWQbHnG8x2yHuKGTYSe4kcqQ+PrzEu+FAzIg8VOT/Il56e
 tXkqUQ93A4lC6rKJcTD1nMijrqk2HNyOstseNE6TFsoECw1hvHSuoOq
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2OSBTYWx0ZWRfXwcaXaIMkyNNd
 ecKyb53a0v6SEY1+7kJmDjgnL/aHBzRuY3AHdaS/mpvaD8RhksWZA1TAF8hySTym1PmEGllaP2G
 dCuAxUk5jBVjZqNr9QOrFlXj93VwDtG/5vx7PALHTK0VpiNlQ6d/UUx5RnvugPkGz3YZ1hHvLOq
 MWjZ3sbCeXSGE1dIO0DO0EvB+dFC0M4zBkPTk58Br+Vv5irkv4Q+wBsSVobtZE3vQfWet52juN7
 wlwcoXOtQopEwth0+lub2podP+FElQy+0WNyBlQ+P5UxvXRAKiRtBhtIqUXWz3BpyCX9pXA+pFk
 o0Pkr+NFRG8fX2CLxo+FgtF4ERLgZPLS/gMPW1PMDytTZ6zcXZJdCnxRNv75yMHomOSJmTZNJeB
 Gg4WdrAj+zsNc0VkKeSJ0WfHA2Q3AaE0/emFkiVIvhTIGQr3FJbm0Cf2ECXUcr41Otu5lxhZ1JZ
 caQPGDTes1+9VVNC34A==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a04aa71 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HhDMDxCfm6Xc3nGqG0sA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: t62ni3Ineh7FbdEDzfKaBtFff7f7WGbT
X-Proofpoint-GUID: t62ni3Ineh7FbdEDzfKaBtFff7f7WGbT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130169
X-Rspamd-Queue-Id: D776C537C78
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-36772-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex.tran@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The SCMI pinctrl driver does not currently log the number of pins,
groups, and functions discovered from firmware. This information is
useful for confirming the firmware exposed pinctrl resources during
debugging.

Log these counts after a successful probe to align with the existing
SCMI client driver logging pattern.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index f22be6b7b82a..abc90a3a7eaf 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -40,6 +40,7 @@ struct scmi_pinctrl {
 	struct pinctrl_desc pctl_desc;
 	struct pinfunction *functions;
 	unsigned int nr_functions;
+	unsigned int nr_groups;
 };
 
 static int pinctrl_scmi_get_groups_count(struct pinctrl_dev *pctldev)
@@ -578,7 +579,15 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
 	if (!pmx->functions)
 		return -ENOMEM;
 
-	return pinctrl_enable(pmx->pctldev);
+	pmx->nr_groups = pinctrl_scmi_get_groups_count(pmx->pctldev);
+
+	ret = pinctrl_enable(pmx->pctldev);
+	if (ret)
+		return ret;
+
+	dev_info(dev, "Initialized %d pins, %d groups, %d functions\n",
+		 pmx->pctl_desc.npins, pmx->nr_groups, pmx->nr_functions);
+	return 0;
 }
 
 static const struct scmi_device_id scmi_id_table[] = {

-- 
2.43.0


