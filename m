Return-Path: <linux-gpio+bounces-36769-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +A/EKYmqBGoxMwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36769-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 18:44:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F92537545
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 18:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D555F30059A9
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 16:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A55C4D9918;
	Wed, 13 May 2026 16:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYPu6k/B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HUatXrph"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03694C9579
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 16:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778690674; cv=none; b=OJ16nZPFBC78ZvCbIh32X2joNdXB5UkxOofO8QGazVAyubo/NnjLiZZ9tfgwbzTVuWhhs79ovYCOP8Plt6bKkGdiXXYYgpbbprCswh1lufbuqk66JcKLnDL2zYmDNhSrhjcIAd0e/7mSsY+f9rzH0K7NjMf2rVcLz2in6XcVThU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778690674; c=relaxed/simple;
	bh=hWTJ66ICrMMYPDEetoAigezffDe9LGu5ZAq3+pTYj0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SvJ0RctWQE+K3ZXr+DAWdwDlL4Y08fomGZtmoz3Nm8QuM3zIapynniBbXMEUrWC9HhansUohYX0sHTAsk2rrmgNMLDxioin/SpZ54ITeV44CjyiiYjX1gKKPv7r4kZrgCJfSEvJ5Sy5ahjaaGN47y54rSvGGKMbIFjEFhZQUt/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYPu6k/B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HUatXrph; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DG9vNR3007206
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 16:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	znMu0JYE14eDzL4+1yCaxtsir2SCzQ58yUv1qQfzVrM=; b=WYPu6k/BQJNW8oOg
	bK051FHeGpoAigfOiAPGIvuNhcPXe0hQAIseeH7jeNpVOEiS1Mml8cee/9nyGzWs
	IKxTuDNZS45J/rydoe71x+OslrZTel6RCOzG+ENEc7AOAGV2yNPlvAb/4Jzd12Ed
	tDVLRDZ4ij38l1AoPgCyFlxdyfm/m+EVnwapvj1bRiuPue1ErB2uxk/M2HijhONY
	qTfN3altQ+N1146Lx9M02p+EIUIDqJRoFGAVxpRLQ9SCcoBsVFbNtPt8hNSOvQY4
	l+AbNFMikchb7/che9f+lgUe15nslDqkUbTYsD3iEvchcDlvy/sOBRqjQYiJ5htH
	FPyydQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0hm07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 16:44:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bda35eab74so5485498eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 09:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778690669; x=1779295469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=znMu0JYE14eDzL4+1yCaxtsir2SCzQ58yUv1qQfzVrM=;
        b=HUatXrphAgZ09xx3SWqt2FdCZbB77aQR2mJSyS5P6vdOhQOBHY9v6d+nGboSj2a2BX
         3XtLsGNg7lVdrMV9FrGvZowkcrhXREGaL5MR8PpNYC4Kebw/DU/PV8Wc74we0ub26C7t
         SWxWZR0283t7n8WcxSaHDL/EMS0gb8ogfn9ds1P88IIv8XgbO0/bnflll3lpF44rOp8N
         JUylNPEi0VKo5sytf4DXO1llLfqgRMxtz3EMT7pimr6+6GIP5R2gQEFahL23NylJFgqB
         9ciKR3u7qNQeUCR7IJ6PD5p6xvE75aSMBWxCLlwLHlePukcAYugipluWzsreIBgAbquo
         tVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690669; x=1779295469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=znMu0JYE14eDzL4+1yCaxtsir2SCzQ58yUv1qQfzVrM=;
        b=KxsLntgkzH/178F2ooS3W6J7PKC9U0m93lIgXQfxmhdXLyYzxBHCdUcde5KFS+xpnb
         0tgm4q875cVBQdeYjYk9gh4d0AJ3UxsKALoIoSie/RR+WEcq68NPJY8hwQ03qeFuYGjZ
         m+WTh9hOgFFuli9oBbJd2Ig0b6JR5vaFu6d+B5up5ZqVwvubM4TXd8+dazVji2JM3VoI
         d/bHAV4jRNnH4MdGUCoZ2z+O/2V42/MZppTbwKmHO+ulp8mFVssfHuJU39VAi2EdR4BA
         6J1PlcVNj8CIjHY+Vgw1m3VfMdcZAjHVlVJXYJo58eumKp/6g1nEURnUNPbhmYmJAYuB
         nGAg==
X-Forwarded-Encrypted: i=1; AFNElJ/7WLfa1FNS3vaNbYJRPB6EO+d2/j0woDGUKG9I+G0tDjM+3u7/zaijdZcImjUt/HtCNCZEdYhLb5St@vger.kernel.org
X-Gm-Message-State: AOJu0YyjZPJkG6WmJW4jVfTsakVXQVGSAqbS9qsoRLDGzUnlW/lReNrg
	nXvA/sbKvIw2sZQcGhX8XZJBjkS9JoBAxwt0hWE7frU9D7U1zsJgk65zFHMQnS0R3NTkdUnH3mS
	aKGT8ocMUOVe/ddYIG/HayuEQ4JjYb9YBzgk+AWQPuUeAveNb2HmJcWYxhyQ0DFpg
X-Gm-Gg: Acq92OGSGn9oUdI4rq0+qru9EojFjXrYZbzmeOahnjt9KiUkFMiTIatQlZBpiR8n6zp
	ub17QyfzztywzbA1qLyi6aiejLrqorQzDsIsjNmFs2HLFf10VzVu6wjSrD6ulDCMl9ZTzXPrLij
	e58p2QIH5buGyKwcjzUziUJZKWbaD2GrCZlI9ggQlw4WGmseCGI8y1bHdDPtvyaVmQhEsPKNL0/
	IPGIMjLOXRsCyibd3G2psnwOc9Z95b3M1/ULWMhcyjRKSNmd0PLEkqHnul2Iyhr3KflYou0hRLl
	FeI/RONSc3PLiKYwtlW4UzdHp9Xju/elcI+FDOiEvoSWHSxm4qYhlEQcGbGlrexRvv/fFvX2X/E
	jhvyxAvnLJGwxRK1wgZY5QvjaycWrKsvjrEwa9CaXKetB7HFUaSBks7jnv0638qXEg9SGWNI=
X-Received: by 2002:a05:7301:1294:b0:2ea:ea7:480e with SMTP id 5a478bee46e88-3025fc493admr144421eec.10.1778690669465;
        Wed, 13 May 2026 09:44:29 -0700 (PDT)
X-Received: by 2002:a05:7301:1294:b0:2ea:ea7:480e with SMTP id 5a478bee46e88-3025fc493admr144398eec.10.1778690668884;
        Wed, 13 May 2026 09:44:28 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8864c37basm22570076eec.13.2026.05.13.09.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:44:28 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 09:44:20 -0700
Subject: [PATCH 2/5] cpufreq: scmi-cpufreq: Log number of perf domains
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v1-2-00b47b1be009@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778690665; l=1078;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=hWTJ66ICrMMYPDEetoAigezffDe9LGu5ZAq3+pTYj0U=;
 b=dKt2ltOsglRwirWV/VFgytLio3t+0trY/M1zjyG4lzrU8COWFCdYDtyNysYCuSfhoFQEYkG72
 wGdFMM1kbfEAUr+QPv0OImnPdu41r/pDiZbC4NCgA6VLy0lrdZgwyx2
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2OSBTYWx0ZWRfX19hI5aIwY4xg
 p44f5lrCFgLPMHUFHWw/yFdUXcMU6fwGiu0lvpr8ZzpcoMFZoziI1Jna7EJMt6sJNwh2gUblBPz
 0S1AyDk3gtoo9I1ezWO20bPEfoueuZFyetD3bxbTV0SDOlwH3e33xUjoQPoo4lrjo0+z1nQaw+s
 N8z80DP6z/gJcT8MsEP8ZpTue1ruVINKdEYu56PXZh7f3m1E8qk5k+VaRpqvENNeSuQp+ImQ09A
 jnPa3oC/rdbJD+QidBDY97DEAZccOI0qkkjcrdyt8R89MikvfPC/WM9jbiWrOrwd1YucXvhQRHC
 8tVJWQgBX82uOXoJNCex9NGPIe0gSaKHn39TWhgaJlNqzPeXPvVtW06m2fFwjtzimYLPsaCXm1A
 NXHnssUoFRLSNbvoKfCCGwM0nflicEDfz8V/imYtwS5xkBoS4REiAsf3ozr9Bgta4CtYH8SECdn
 SSYrfowgr1GRHL1BmKQ==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a04aa6e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=xQYt0fwn8ryh7dGzGRYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 94fCKjk0xENaQHRgX3grcEQ4dsdjAXr-
X-Proofpoint-GUID: 94fCKjk0xENaQHRgX3grcEQ4dsdjAXr-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130169
X-Rspamd-Queue-Id: 53F92537545
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-36769-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex.tran@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
index 4edb4f7a8aa9..d5c33eea2477 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -468,9 +468,12 @@ static int scmi_cpufreq_probe(struct scmi_device *sdev)
 	if (ret) {
 		dev_err(dev, "%s: registering cpufreq failed, err: %d\n",
 			__func__, ret);
+		return ret;
 	}
 
-	return ret;
+	dev_info(dev, "Initialized %d performance domains\n",
+		 perf_ops->num_domains_get(ph));
+	return 0;
 }
 
 static void scmi_cpufreq_remove(struct scmi_device *sdev)

-- 
2.43.0


