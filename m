Return-Path: <linux-gpio+bounces-37318-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iErVFqgHEGotSwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37318-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 09:37:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C68575B0105
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 09:37:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA8CB300B858
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 07:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E32B37CD34;
	Fri, 22 May 2026 07:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I61iOry/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MHkbC2CI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA998360ED6
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 07:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779435341; cv=none; b=muireGqXSRfLlaW98EHSXJgGdx70oVa5m/atMXMLOP02argGVwDj27BzAL2yp9StLrJUKCZLMaUxpTGw+/A0e5MsTH2Mp0ogCwaUXvYilNU+x6TCzFpK0RXgUh2K/ry/QaJyXPOtauFUC2O9J4nV+pLsHKxndy6cC575vZAay8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779435341; c=relaxed/simple;
	bh=34A3NYQ2nCAvmhCIXKxDkNjNqS+iKEl9ON6EMSLZu4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VGZ/qqbXH08Y9UDkvAM3trWLxvFBYaCCGK3pGoeOG6Egpm5q0nrMw0S4FtquxLmgBYKi27o2ZoBS+PYnzfDVT55Y00Onh169i9dUnvRny7K+LLa7tLWwM2reJrDMV5+3MHEf3L/G4aSVDzA8/hmet2bUVDV7lF6/BxQ4CuOLjXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I61iOry/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MHkbC2CI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M7FrVa1297968
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 07:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XrO5HrprjNU8qYtCKE6JyzhJV/eGBCYR9oZ
	lGB26sVU=; b=I61iOry/om8cPUmjIwICmqgXmM6ukhM575yzzZ2LFRS9HKSVVlz
	Pj/4y3jVwdMkJad13VeoZvv1InEPUUCk9yC/WKMfg4ldxafziHkaq1+u1AKQEpL6
	JLiBeFDEhgF9/z2vuHSA4mxgoOKwmLu25gv/M/u6s4xuvF1jgWgHC4GkEMnScXfz
	BwKGpez8J+C2w4enV6rvD1lPdVOC16luBn+w+kIwkOq1eRN7QYLeruzdPXQ3Voiv
	i7+47+e6GW3sqQhiBFYYwrhUnGse6IZRn6LJOSDyAzJ2pK+FVE7Cuvb5nWfpndxd
	e8gL/immyvyDipO9npXsg7w+t8ul0qQoLIQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaah09nk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 07:35:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb3403e99so76498651cf.2
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 00:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779435338; x=1780040138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XrO5HrprjNU8qYtCKE6JyzhJV/eGBCYR9oZlGB26sVU=;
        b=MHkbC2CIAFy0rpViPpmo02jPEva3C0TvZtlz8qmIyeRAcrnV69X6Mgj9Wsx4byO9BW
         0cgdwJokFEab0bio/DPsBkaWyX0YO4RAXYe/gE0nisLhLDhQXS03nQnzJ0kf+tYLgWUm
         nKy+IpQvN4Mf4zIWBMvRYdL1qCcrQsdiP947XY3Ld52xut6DhHIoC8njpkY8jFaVb6VH
         M6hvSL+/sVZ4uuFrS0OTNeMSyOWFIWEW0ns0tdi6iFsZKBpzUd3T/Gw3Mnen8Ov5Byt5
         +nND32ZTeIOEpH6uS7yi8gJb3wlXBHwO1+F7yH8D9MfL0z6MA+J1AbSWhx9zqrSfwtTC
         kLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779435338; x=1780040138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrO5HrprjNU8qYtCKE6JyzhJV/eGBCYR9oZlGB26sVU=;
        b=CrrdLQRl+MtScujYmL3MwF8W72eaqEpfkyHZu7R+NIXxtcOI+RGM3GBeHiz2X/Wwr4
         OGdN3+x5NxhornOa5u23ZePv8BGB+nyz2SE9O4VbkOGf2f9FRE0Q7hAQdZzgui0xZkPS
         qfIe7XdPs69+hnfCTEMyF1Ae6GMvHIEWc0Zpmd9PJNByEiitVGfA6irzyDACIScCkPQ6
         MMU5DxHtWW4lWcC7Qem8dYSkJlCobLuzgwv84zrWwVGsTEv1QxriQsRO1JPY+q5M5zRJ
         EVTS5LCafBled5ERnunl+jKVgKBMgFzGUgZup5M3xT8NoxRMfcJX5dV4al/aJ8tW0ciY
         RxDQ==
X-Forwarded-Encrypted: i=1; AFNElJ+MaFzGllxwtCaY6MxPox7MRs3oHZv8y2mhrSwQY8l1PoYAW3iGPFGOTH/eQLC5c8d2mdXNY10bnVH3@vger.kernel.org
X-Gm-Message-State: AOJu0YyrUk0tayhmPhBL7PCUor2fOTT5OcOHb++LnfvC8cWZMBLALrag
	5Iq2b9Nemzg4sbJgLsCvgcKp4NlLrwBkHj5nsholMqq5JIntRHyghF5XfuRsMrW3p81ct/xkOFK
	rzObbxEH2zMfUX6afRNNHLCiCOAqwPBKepbDkP3P566DaUlASrxY56CARIGND8f0n
X-Gm-Gg: Acq92OHYH7brvIT7fNBY3oy6jXi3yHq3TW7vWxJQC1JSBHOb8u3UyRvQn1eC/0osGa0
	zLuOxU522ap3NGscyYApkvsjGqXJbrQCZPDN9tWqD7SURmDQ7rckWhOaIjC3xer7AWAFWTL77mg
	Hn7IErXETD6GQkBDNGU+raO1jfGm8BskcWJpNUd4lTd8VDwZRFUagdSQINT+cyfGNSA6l7aAvAQ
	WolyNOmvZFWrY12W9doyd4sSIb9vVfsq7Uvyg8UghqEygCn8ej4KZZVbGSEfAf7OmGlXKbFH/Nh
	OMH2V5YVdXqRLWOreAEnyTUi0nE0eEB0flrbmxOkWLw26TI4sNXLwcuFjUHYOSAjHqT6D10J3Ml
	OPZT/h3seMAOiDuXWpa/sJyuSuqZqwgKEtuNeyPjMzpi8z1r/
X-Received: by 2002:ac8:5cd5:0:b0:509:2b02:c1bd with SMTP id d75a77b69052e-516d442805fmr40940571cf.12.1779435338174;
        Fri, 22 May 2026 00:35:38 -0700 (PDT)
X-Received: by 2002:ac8:5cd5:0:b0:509:2b02:c1bd with SMTP id d75a77b69052e-516d442805fmr40940311cf.12.1779435337812;
        Fri, 22 May 2026 00:35:37 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49042aeafa8sm9768775e9.27.2026.05.22.00.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 00:35:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        David Lechner <dlechner@baylibre.com>
Subject: [PATCH] gpio: adnp: fix flow control regression caused by scoped_guard()
Date: Fri, 22 May 2026 09:35:27 +0200
Message-ID: <20260522073527.9812-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA3MyBTYWx0ZWRfX57pU4KYA20vv
 Bz6dOxCzbiPBa7xSAkk+cjZ7DrrFpxGa8VG1JMTybH7t5xu68cp/tpKj1aKjwNVXxJuYvwL4L/D
 TzA5yONeVKreYxQI/516zC0uhkCCocm2XiwEF3YfZr69JNI4c9Yniw9cUJfFTrs3IA+/YYcfZTl
 X50lqd4ukEcjPYlL/hbSVyLUSUzqZB+bCtqBu9uu1mi0zL6Szqn4HaL+vlsdYVNqp13FhK42sjR
 ehPOR1zhMtuG2O8fUU2Qwmwo3h6gULaFckL24dtjmufc5ixS37OUDfta4Dmg2dz/nMRbhpmJkco
 lOe4nD3eKKaiXg3WoLlpyLStSEQHYYbBJ6Rt+iHdR+hixk/G5G1X4aTs3Z2xNOtVwtrqenLd5Oc
 0zW/8S0uOPo0Y8FrBGBoIIb+A1bh56y3+MfrniGpquodTERpYm8czjmgV3HOOEQb9QEPfjGPEed
 wiyEsgOcZLLspAhMDvA==
X-Proofpoint-GUID: EC2ugAe1v9y_Me_w-et-SWAG5_TK6CSf
X-Authority-Analysis: v=2.4 cv=LNdWhpW9 c=1 sm=1 tr=0 ts=6a10074b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8
 a=VaRsTcMx-6-8SV5EPosA:9 a=a_PwQJl-kcHnX1M80qC6:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: EC2ugAe1v9y_Me_w-et-SWAG5_TK6CSf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220073
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37318-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,baylibre.com:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C68575B0105
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

scoped_guard() is implemented as a for loop. Using it to protect code
using the continue statement changes the flow as we now only break out
of the hidden loop inside scoped_guard(), not the original for loop. Use
a regular code block instead.

Fixes: c7fe19ed3973 ("gpio: adnp: use lock guards for the I2C lock")
Reported-by: David Lechner <dlechner@baylibre.com>
Closes: https://lore.kernel.org/all/cde2abb2-4cc8-4fc9-b34a-0c5d2b95779f@baylibre.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-adnp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index 27a80d1143a1..350feea2afa3 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -237,7 +237,9 @@ static irqreturn_t adnp_irq(int irq, void *data)
 		unsigned long pending;
 		int err;
 
-		scoped_guard(mutex, &adnp->i2c_lock) {
+		{
+			guard(mutex)(&adnp->i2c_lock);
+
 			err = adnp_read(adnp, GPIO_PLR(adnp) + i, &level);
 			if (err < 0)
 				continue;
-- 
2.47.3


