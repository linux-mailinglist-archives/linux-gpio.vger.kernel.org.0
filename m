Return-Path: <linux-gpio+bounces-36770-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBwGOpSqBGoxMwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36770-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 18:45:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D2853755B
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 18:45:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B936930071DE
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 16:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ECE64D90AC;
	Wed, 13 May 2026 16:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cf3SfnnL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ToXzwvRY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFF44D98EB
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 16:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778690675; cv=none; b=LcdnpDzd1crc8RqKPI4/8eNOEGUCkn4BplgHszbmDiQ+BsNPrV/SzhkoHCGnCcOXHMRrwetEmOs7V2hbpxaa9Uty5IWJJC/jj76Laymqaf6/M3nCeZF0U/3HHuePUC3si74dGz3n2Zc0XTpgP4WHB487idaXeVvbOAojl/uOqY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778690675; c=relaxed/simple;
	bh=vAmyCpUIu9IUlplJc4rGmydGdjUb6w4tYNaPIxlBDiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KFxQp6iBJdJcJt06Zfw318JDhNf0mxyS7E12QOYnlcQJbaClSwPwPgvhG2EGYTR7sNZkG/jiPzQMxdu3Gj5hhlU7COAoqoUYOc0V/gtfwx0GhgZjNDDiX94aJsEnA8Vqzx21N6MqZaQDPe/UihBHvpiIomQIXUMni7vwvWMiyYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cf3SfnnL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ToXzwvRY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEd5IC3474786
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 16:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/yocMUcQeW0PxY80907g0p8nmDgbrIZycpfry1XcMUU=; b=cf3SfnnLkQ+pkgYE
	MS33afG6mXyDivAhUfoDnbMgQdWM5SSnBmh/t+YQKOk0CzSS/H/p5gqggy/bz+Ld
	kUoeG/PH+P+Eie4YA/PuNweQtcaYkDgPM0jm7xDzeEYM7+OiwaPXJH62mTGO8gBV
	HkYv3MlyhmuzTA3I4+Y9vOzgWX/YB10Y3VMfzdwYDL78aVMwcC7J/KI372xBw8a8
	kSKyv6hUieVWgbKOybaOU4o76LKGM0LUtBCFKhnR4PqdlM6igEomq6tPPCAIFHil
	f6CH3F03k4IRfc171OnKO4bJwhW4Dz05WUK7ZrOvWveSOSxSzVof79L1LLSz6o7N
	w8YjVw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p419ve0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 16:44:31 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ef62078ee7so9262066eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 09:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778690670; x=1779295470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/yocMUcQeW0PxY80907g0p8nmDgbrIZycpfry1XcMUU=;
        b=ToXzwvRY73EYoxvby89bNOhglHuAmWspKwPbnjoFHnQVXYiTUCfWsHGjAB0b//pfas
         ZPqZZF9dz60NsHH1IEJjPzxVx1HYcyxUckzWbMPToJwZELBL8lpoS1127a9y81G2bQTS
         2dvPBP+4hcGQNL9LoC/YyARtFlYHYIg+Jcv8FQYr7GIQdjHLbz4/K9ximKMvz7Sdvr+q
         aT95BE5JKt8JXTb7lC1iLDanTzDP6fzJuQsSYT8AcL3FJQ9Na5L+EoGis7RfKMPWAXil
         lWFpSwHLZCbE8yb55Hgj39+9rktZx32gOWbA1kEdu6rXAkaqE4sfD3nDXJO5Df+70HCV
         0G+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690670; x=1779295470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/yocMUcQeW0PxY80907g0p8nmDgbrIZycpfry1XcMUU=;
        b=HrWFjBgbgbi4IB80smMQBLlZbxeDICIJiZX6L9XysQPEA4SbrUG5fUeFJUVl12jFYD
         e1lWnu5h/xnc+SvBj2cp+9OWCQU2oZsBA7F4lcwSnp2b+WgexBfcM9jtYNJKS2+YBfvu
         kbQAt4bdtq26n0+Y7yPLCbV95I1H/74z0Lq9by2kSj7gA64aX9aIxguUW3Z87MdxejRJ
         DF9rhWIaUF6coZ0uPuwJ48cYml/ec25RaXj68N6v4rzHO7i1/8lVhCROQgUb+1ZFUup/
         Y/M2OaJ8w+c2Kt9Awc62AEZUo7SRm1WFqD+TXnba3yAlUpRf31HoA0GNzBjxIZj/46Uk
         GC/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8r6V4RYga13cESxHqqk8dDhKluw+wdNTmG2sinYHqiqyPd6BSfvkSEumdUZp5H342Zgv6EMsisOo5q@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2jccMDrXL+cWxfMNzOZt69w/Vdqg1rqVy+tJtCI3IneLe1HNd
	UuS93THwaFWbCoySUw2gddFTAc1It/GfJuWMT9m3aq4VbdLuWFXCuw6rxyfaK0vPQLmrucgYdoT
	GwJi4I7aG7clCJHxis3IBGvgUaf9pzSf04P09MZKeV+wHloCz9wU6v2AJIqGhW/no
X-Gm-Gg: Acq92OFyVL2SX7ATc/vBykIWxKPETSZvnP61UOop0NmX45IX4i4YRCbV4o0UPAJGpuK
	ff8Fg4Lv3y/xubbXfnBzvIJqodroGbEEGAX+CvLyzZjwik5z+bTHV7/Vd1nG1cY5LPQnS04RKKi
	OeWvHNQ0q5o9lqnBuV93COgovi7DSwhXRiQYFZOqs6n9t2fOvR4TEHikqpxMz0RSIeNStIOUMpf
	N/luVtWPWEioKerSmhZWaX3aZeIhb09bnsH78WkmHR1+m87342ITubeiXOz4TarGPmDFAuKpUKR
	9+pH2sA6HEDrccu/8X+NjzHcI72NX3HsOHJOCokP/4iDa0geDjMtkP1VFn+hXd/sfeaU4Bf7UK/
	kdBZ25rc39ErazOqqom6TSlTBN8R0Mk4NwJgkUNE0531J3NMbPoowcpNhktvy8zu6uuL8roE=
X-Received: by 2002:a05:7301:608a:b0:2c7:3a7:c792 with SMTP id 5a478bee46e88-30119874a96mr2588010eec.20.1778690670404;
        Wed, 13 May 2026 09:44:30 -0700 (PDT)
X-Received: by 2002:a05:7301:608a:b0:2c7:3a7:c792 with SMTP id 5a478bee46e88-30119874a96mr2587973eec.20.1778690669842;
        Wed, 13 May 2026 09:44:29 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8864c37basm22570076eec.13.2026.05.13.09.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:44:29 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 09:44:21 -0700
Subject: [PATCH 3/5] hwmon: scmi-hwmon: Log number of sensors
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v1-3-00b47b1be009@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778690666; l=818;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=vAmyCpUIu9IUlplJc4rGmydGdjUb6w4tYNaPIxlBDiw=;
 b=aHNXRLWpAchmivoKZfcxADgDkm5hnjgWYXKl8nVGRM6MkaZazLd056E8o8GAQELBgC4mw8qtn
 4cXbX3/bAUJB7GVGGgv4IJUzsVLQmNc0vvFg694a4U9/07cs9TUFFk2
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a04aa6f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=U6dIrDiPZIM1rF_tHS4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2OSBTYWx0ZWRfXzJ9+u1wCJBXy
 cPdFRSreoU1EbzNFIWdUPkxoBa6ssNYvDISNSv/7GwO3CfKpQqCLE48HITW37KZIoS2f6invmR+
 cSf3ABNZrlBQfGb7ac8Z1QJsZ03xlG49blRQ3cfJMMZtkYvcATZovcQZUsZ8grraJGCF4GPWkQl
 fauvJNjDHmnKFnXXFA1wO+pHONBMDnxzlNQyF/SMcrkER2wLjMLB9c5D1Uf2nInpaot7p+9QYwq
 uOgn4YU0z2kiZ6eZGZzSPzickpo6ghA1iUp5Vou89hOdJRdgQnR/Bvy94P+k9rDBmHr0/5e/jlz
 2NNLFIcNmF7++0ZykBPS+OlasIRZJyvrhk9kJfCQBptpXNLcvoWIJQECKxuSQ/LeEcy8475ZRAf
 e7mbxX5ISnj8cvX6gmM1vJE33sgTqKkU2bJ1y+oPvvUorgujV6h1eM5dt+KLVLkXwUAvmkTsjLb
 CbHuRLt/nBLv4mCzvFw==
X-Proofpoint-GUID: P1tUgF2ndtisHjDEAdeXS_oYzH8R9L45
X-Proofpoint-ORIG-GUID: P1tUgF2ndtisHjDEAdeXS_oYzH8R9L45
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130169
X-Rspamd-Queue-Id: A4D2853755B
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
	TAGGED_FROM(0.00)[bounces-36770-lists,linux-gpio=lfdr.de];
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

The SCMI hwmon driver does not currently report how many sensors were
discovered from firmware during probe. This makes it harder to confirm
the firmware exposed sensor resources during debugging.

Log the sensor count after a successful probe, aligning the driver with
the existing SCMI client driver logging pattern.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/hwmon/scmi-hwmon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/scmi-hwmon.c b/drivers/hwmon/scmi-hwmon.c
index eec223d174c0..6f1b0559d5c2 100644
--- a/drivers/hwmon/scmi-hwmon.c
+++ b/drivers/hwmon/scmi-hwmon.c
@@ -362,6 +362,7 @@ static int scmi_hwmon_probe(struct scmi_device *sdev)
 		}
 	}
 
+	dev_info(dev, "Initialized %d sensors\n", nr_sensors);
 	return 0;
 }
 

-- 
2.43.0


