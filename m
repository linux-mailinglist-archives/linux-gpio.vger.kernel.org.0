Return-Path: <linux-gpio+bounces-36771-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNv+CNSxBGriNAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36771-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 19:16:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 91527537D2C
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 19:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFD1431889CF
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 16:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BAF4DA550;
	Wed, 13 May 2026 16:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lt1bVYRo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dno95X+4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E793472774
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 16:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778690675; cv=none; b=RWVeW+mDJCmqE4FMbu6HDJKNQRq05Kz0/OD3aI6obtHXNNGI0reqa2/n7XfQksrcQZGh3IwUHFpmTOwpn8lv9rn9ViVpK+9rJqCZbCjRLLwbrFfZ4MSh5fwokpCCO1/510kT3J0DMelqLi+s7YKNL0g5bJ+WMawAuRYOzk5me/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778690675; c=relaxed/simple;
	bh=kkkJUN2duKjg2tEPhVJygQCN5sNnHuJItWMYlqkT/wc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LCP7BQa4aMTjxVpQthKi7Uas7BMBtHEHHJG3cfJg2UtuyOkJuCb+S/avI2BnKDrOXtoLjAzuCe3Hew+kh+xwJAN47/SrUA+RJQAv+JRic/9UJ5Ix/w2RRtg7mQx9PtqYbQ6t44r8F0sSiS5J7BFN0ytQh3h19HnaK97mKESA9Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lt1bVYRo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dno95X+4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEvDGx4161718
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 16:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6NGzEn4QHnOns3GVJPYdbSr45vl6CTrSg1yOeRmRags=; b=Lt1bVYRowP5qG43u
	feMZAugbkgbmaoauVWkYsoFwKUZc1ImdfR4eUSXuqzHTyyu/EfSO07EM+TgdnuNq
	eh//W5u9d9zIpGlcl89COws7rP5oCQIOpMvfV9W7xZ40al8bZE+4CHHqbWci1mJ4
	vvOgXrsNeI3wdPxsly0eDGDa5BAk5m3rgwJwQ56q3/3RZDeZSFnG6K1Ek7Hhth1O
	WfPURlDIy9MwSQNijroZCoQQsIn6o8fD5mHkRI5imwNG6nVclDfeH7uMGHE7PIfq
	P14RBWkDbTz8v86ehMAl0ecGaB8VtqZCD0lY4w6Mmu76EG6yMy7yQeZlVjghSVJz
	TenaQQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91suvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 16:44:32 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1306c2f7037so7287841c88.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 09:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778690671; x=1779295471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6NGzEn4QHnOns3GVJPYdbSr45vl6CTrSg1yOeRmRags=;
        b=Dno95X+4dAAbAtOljpzbj1whuom2URdAHtFXndkbUbxPDQkvU6ABEbdvWEpta9/p+Y
         9ouGhYrpDFrxbyxXHhf7qq3WDvRTl+TJ07sKhiYtuChRelmKWXt6n0Sh+kgwI8G0Ui5R
         hsC3KnJKNR22r63s6VazhHmAIbJPQlSUoutc5896123sJjDuXTSpR1IciEFk4P9OVsPa
         Qk9+myo5Cdh4fEbxfGWQS9cwYfbJN90jeuAvPlXMc8VCMT8ygm6wlNeBs0Ew/R7vL9Ku
         YW8X/FBbsVr8fN0LADlf94jfcCO7wH2jiSp8pmvyewAj51r7rw0mHkqmhTZOuVGG6JRf
         fjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690671; x=1779295471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6NGzEn4QHnOns3GVJPYdbSr45vl6CTrSg1yOeRmRags=;
        b=JFtDFmD/VGxPZ74hRHWOubIE9R6ucXp1qoiaUfWBWwIRQx+TQR0K9i1VU8fctTzZ4p
         dqWK5PsSKxKwPJhfNH7xHUANzyulTHfsqSuJcpSKArvKtTL7q53iHq98Uqm/lWhsyWYa
         ruX2BtK+Nfa4MeafNyhD3zxkGN0/d9TC2NQM8iVTMfX0MXiOJ1OycXR0H+nC45eNaoBZ
         Cn3eLFEdvY2BhflRA46ZgsPNNZjU7+PeJB9aZX2mM6PgqliPSUF89bmoHdtn6UBlFdk9
         jcS892nnZZ3/0gRSOXoXc4JdniLsWJ+2TlZTIU+HhJSCPuo2uz9Hm5XXPmEJZrVdFiCb
         yYfQ==
X-Forwarded-Encrypted: i=1; AFNElJ80Qmivh28V67LSh+wDcmORnADqLWsZKqKlxdtbNZmXqXxtiTfrtaHxO8tDxJVhU07jHtx7fJU3Arc3@vger.kernel.org
X-Gm-Message-State: AOJu0YyWe5ZsFLLHT9t9BNAFC0xbTzhXtbxevRRtOwlu8rf0ZURBtbEe
	TouPapcmz6TXv1uDE1zIkixBKl9GAGAcQwRKdMicNRP7RNlscpGWEH0v6HWLICniGnucFRz7Osg
	YNn29B51FyfY6rZJzXu2h49wriDSg8wIW0Je3YJHssfkYC+v2SC7fSayCyhbmuL1y
X-Gm-Gg: Acq92OGY62ZPquyd6RnDPs0AxLMVOCEWp9ShzuJRbWee4fMsu32yDWuRRPVm+nVM8bR
	IMTwvG+gHcGAjfS3syw800OQTqpQISU7TH+9DhPOTqmhanYBfIeNpDsIGl84ncN6yKLEnqbMMfj
	4/6fZBghzK4IZ7uQGppAbG4f23hS52Hbu3VgslJGSPUQGdF1tK8AQe2W03XfeQ4Wd0eZOwLveWm
	qb0rt5gaF0W3cHNtTmx35GYvBBLim1nz4e8WfBqbieOZ7i4kpoou5z7yZdhYEtBLDCwcG6y/OOq
	PwJ+8dulEAlcHlDEtib2KkjRM6CwztdKcekKtR+9E0k8GEDM6PZnq2G9HtYwItCDC5Anel9UsjE
	Pvn9AQ2SAHEA+MYvlGqT5UsFvBj1aC3Ptiepk6vsOEGptwfyZhZOb/wXhf15sON9xgzatfxA=
X-Received: by 2002:a05:7022:ec88:b0:132:956b:3c6 with SMTP id a92af1059eb24-1349ad870cemr2111966c88.33.1778690671483;
        Wed, 13 May 2026 09:44:31 -0700 (PDT)
X-Received: by 2002:a05:7022:ec88:b0:132:956b:3c6 with SMTP id a92af1059eb24-1349ad870cemr2111944c88.33.1778690670855;
        Wed, 13 May 2026 09:44:30 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8864c37basm22570076eec.13.2026.05.13.09.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:44:30 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 09:44:22 -0700
Subject: [PATCH 4/5] reset: reset-scmi: Log number of reset domains
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v1-4-00b47b1be009@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778690666; l=1391;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=kkkJUN2duKjg2tEPhVJygQCN5sNnHuJItWMYlqkT/wc=;
 b=+zDDnh3MxrImSIBbNC9dHdn17TxKkBrO3UxSfoKVDiRqAoPHX67PJnTILBR8G6xc1OVPmBa9v
 QzLeLBss5/3DRkX2f8GlrLsX4oJLNM+GlL2wId5D0DyBXYzzWOZZr6I
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-ORIG-GUID: 9YKiE4DJq0mSWB2g4QuE-xV5As_2-fZ0
X-Proofpoint-GUID: 9YKiE4DJq0mSWB2g4QuE-xV5As_2-fZ0
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a04aa70 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=wud5Z5ZUIjVBoUaN5zEA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2OSBTYWx0ZWRfXxLAmuYOIec4y
 3JEey6M00OgKaN11iqAY2s0lAp7DWK3CM3iXtSinPnrLDvkitcrOYUkRTW8lId7V0rYmX/bk08R
 TzMINBZdxJ0hNWQpQlK2I/8ZspQxXwgdk6AnicxQSLYX0xIdezRqA+FGFH3vJjDaZgW6kQ1V7ni
 4FzCQlMrYxbgZxzx/Gje9zr8nYSOi1UXM6I6ybt/HC7i7nrHqyuVdu9S4DKDBsZUiE0Vq52euTL
 J9uXaNA47K6gTwg1odfVN42yBZMfj0JTY8/s61h1F7ahl40YecySmms+li5VNF4iZaXhwbxT6tV
 PLDPQSGQ39ZAXu5b8xjxutwCuivKaMMkyzGTKJ7T8OnW4rh5A9PN6xZCvcqz8NZm3YqBlG8j3Uz
 3mhS5hbR1BAwNWEIBR4FzZALxil8/EsqgEQNVHbAoKSi6+XxFEjkyaX1C1Zp3yjkrh56NjazyBi
 NJ36VdyMmqn90OJFbNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130169
X-Rspamd-Queue-Id: 91527537D2C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-36771-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex.tran@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The SCMI reset driver does not currently report how many reset domains
were discovered from firmware during probe. This makes it harder to
confirm the firmware reset resources during debugging.

Log the reset domain count after a successful probe, aligning the driver
with the existing SCMI client driver logging pattern.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/reset/reset-scmi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/reset-scmi.c b/drivers/reset/reset-scmi.c
index 4335811e0cfa..f26fad0dc726 100644
--- a/drivers/reset/reset-scmi.c
+++ b/drivers/reset/reset-scmi.c
@@ -93,6 +93,7 @@ static int scmi_reset_probe(struct scmi_device *sdev)
 	struct device_node *np = dev->of_node;
 	const struct scmi_handle *handle = sdev->handle;
 	struct scmi_protocol_handle *ph;
+	int ret;
 
 	if (!handle)
 		return -ENODEV;
@@ -111,7 +112,12 @@ static int scmi_reset_probe(struct scmi_device *sdev)
 	data->rcdev.nr_resets = reset_ops->num_domains_get(ph);
 	data->ph = ph;
 
-	return devm_reset_controller_register(dev, &data->rcdev);
+	ret = devm_reset_controller_register(dev, &data->rcdev);
+	if (ret)
+		return ret;
+
+	dev_info(dev, "Initialized %d reset domains\n", data->rcdev.nr_resets);
+	return 0;
 }
 
 static const struct scmi_device_id scmi_id_table[] = {

-- 
2.43.0


