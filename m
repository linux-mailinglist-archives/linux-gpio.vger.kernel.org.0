Return-Path: <linux-gpio+bounces-35547-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GF/IECM572mD+gAAu9opvQ
	(envelope-from <linux-gpio+bounces-35547-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 12:23:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DE4470EC9
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 12:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCAC530E6743
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 10:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 040033B5854;
	Mon, 27 Apr 2026 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NaZcWdoe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SUqhF5X9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C18B3B4E94
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 10:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284899; cv=none; b=DrLFuB2bnWIIcfZmdwYtQZEeBH/94cBmSwIi47b1tw1wmwlu0GilQty0r90jz7FkSl1SX319SVEqKMitD9lkHt0HHg52co2YgTNCb5OAFf9H4sNi6+z8bXwL3/YN3S1+YUzZdkQivqauYt+Pe9ZcX+By1QZWpbGeDpy0dIVvGhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284899; c=relaxed/simple;
	bh=gZ8HxVxR6CO/QMlFwEJ8NsLYc1VojMlajTKt3lIExak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uZPSbJ8IavV/6spqmV4ZzOp2Yb93xslnUeYqm3KzD6yGZLLt1ebNQI+xvYkTJQaOrCW2AvQC3AlItSj2XJj0dkg/kIlao3O3rPvFfz0GJ3zbo+8bLsarEFn11rEHYoPj4ZYEpDCNpNrMUxeRWsBDwT+ai0iXEffJnh64TPiAU8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NaZcWdoe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SUqhF5X9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8kG0s3961981
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 10:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wqnqCn4cZXyDxg7HbQo5XVyJJlrveywBJsp1i/ba6n8=; b=NaZcWdoelHhp1r7D
	WDMFSc6GlXXs5lAv4cEi8KDVwqr7V8hoif2ShF38/mcY4yHT2k95AOGKZs44R9kw
	NsaKguoWV5UPUijKZbZbv3M0kuUTnAcybYi4AI1gan18Glkx8+mxnNjlqfy7ZPJ5
	k84sAc/ZRXemxIc4ZolG6zJOJJGRUiaCl9pv2MBNYAP8iQaF96tFh+1xouQIJvWv
	kh8ErIpsBxnEXg3Lb3NBJkOmhk0MnUYYKkuNyLXGwpkkjjS3TsHBEvJvoHP4iWDU
	em6kkDL6kJ2IPJEk/1pAqbmwM4nnrsko9BvJvgJoLEadn43VK4UQPdKUy3ABT09R
	T/T2Dw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt4k30k74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 10:14:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8acafc224a8so246117376d6.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 03:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777284893; x=1777889693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqnqCn4cZXyDxg7HbQo5XVyJJlrveywBJsp1i/ba6n8=;
        b=SUqhF5X9c8ztZ/X9WpG88K3GzYY9TFh4Q5ZJY2xK8+QJfLNnnGhwbe1PPniGk20Udw
         K+QEEHzj6Vq05CPTchE8L+55NbLpVqlxosuuYTu/o3o/AW1H4aKqkS8VU/cSC4Us84kb
         ufCV5TVqBhQTrhNVO3S+Sf2/kLZI0n41VhRXuS0RYcKFgzAYYjMwmBgu/jwXJuMlC+dm
         Fq1VNsNH37STyy0OZ1id6TwEq3E6HEPy9t9fCt7tZnS5c0LmxrtItyatkj7Mi/PkAk55
         9/yh9j7Vi9/1IVMP5oMM09Uzqz/Z8wUw+TuF3FY5v1uTDuFt2xImwcg7YIh2XYSs7WmM
         62aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284893; x=1777889693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wqnqCn4cZXyDxg7HbQo5XVyJJlrveywBJsp1i/ba6n8=;
        b=n+rYJqi+aPpU8vRvT5rNMYQNOult9zGq+NusXTuN/TpYZCgFEMUXUlBy3DA+8vRuYg
         ctv4AijQtwchY531E8zdqoWOzaVMlPVkXrV8lQcAVArp88LtR0/1yS1kO1HWW5A9KWYv
         rVNz41qmaqExgEOQHMoi84SqoFsGbVs1jwyiqLhRGpCPzpOayiNcBWMWSQTLv1jw7PHX
         3WhSSIjG69H0BdA9NwRPuf1Hw0p8QPXEPITVC95daOjqTwYJPdKszwVemacnlCF2zJoj
         cUcPRi7VlgfBEtwHNo/Hz48VvCPLFTYBvlVDjzfjiV/1dNMdjBrQur6zKMk88WzK1GGY
         M38A==
X-Forwarded-Encrypted: i=1; AFNElJ//m/mpbT2CbslrmTgz/ZQmQOVqh8Co+tChR8gRlKaoCguILdgEcdZls431bUaFMmHCec69AEt4V4gx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2LaCJHhUfdUZIB1J1EbvPhdAxQ98dikA1gBcZiqAIeRspf4zd
	rHnTOwRSzKqfQBIIvc1c9uHMHXunUKWybb3BhpXVYCTdLa6tPdAikTJ0apx8MDjzCF1B68udipb
	qsJxKKpvxegwuAFKPgs55fdtYzfYYSgWAUjbGCnXmcIJZKcvyoV5SXMxj64isR2vP
X-Gm-Gg: AeBDieu4c3Ggsw9MIp/+u5wffNp9uCi0/r/M85Rar2AsBso8ZZYaorw8KFlE9ObFtbQ
	nmcUAikv4WbwacR106h3WEc+Vms77ms5cyyW2FD5k7eOVaxmhrC/Z37fXxL8eO3UwW32oXLhEsJ
	8yVET5HXQdkvqDWvX01KjovdIR8qReWT+CFENT3U5zwpEH6PK25/PC24czN/1inr4FK77IijIDE
	UpDyrMOUZfXzSw0UMIbzTNxBSuZ6uRL4XpLQ3sJE5sEw1mrOl7fQMaowLUjifBaMwsmsuQa9pm8
	CGZ86c2UCwJwxsxnL5J9UeoDD2ebQSEbRZADrNpIEIIcZrwdGtpzSR9l+QZ9IuS3e0vOCdNxNlD
	clNoAgYq9DP6VcylOm5pyTLK7UZXzpu5sFRmElBO83EDuUA415Vp6D+ZC9CbLgw==
X-Received: by 2002:a05:622a:60d:b0:50d:819f:e7bd with SMTP id d75a77b69052e-50e3681f0b2mr623923291cf.4.1777284893107;
        Mon, 27 Apr 2026 03:14:53 -0700 (PDT)
X-Received: by 2002:a05:622a:60d:b0:50d:819f:e7bd with SMTP id d75a77b69052e-50e3681f0b2mr623923051cf.4.1777284892702;
        Mon, 27 Apr 2026 03:14:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb74c789sm235103445e9.5.2026.04.27.03.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:14:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:14:32 +0200
Subject: [PATCH v2 1/4] ARM: pxa: statify platform device definitions in
 spitz board file
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-pxa-gpio-swnodes-v2-1-86fc24b9e714@oss.qualcomm.com>
References: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com>
In-Reply-To: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1053;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gZ8HxVxR6CO/QMlFwEJ8NsLYc1VojMlajTKt3lIExak=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7zcT1ZX+q7okdWU8iseN3wCyeo8KZNdef2p9l
 VbPp8bCEIOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae83EwAKCRAFnS7L/zaE
 w4kGD/4+d8ojwTOZYDVt3UZ+VY76Tk/37KPy01+TvO43/5ifB26tZ90bT8gcnggAm0mZt5m0rJm
 r768JDv+cYcdp4OOos/7Z+tTMNycJvuWNIKndVbpQOddhMBDg4ITMblRkvKYxCHvrWJQ5JFQPln
 g9esaeZJLbdGkfnl1WId1iMIhL/wtEdbJJzduW1xpJ9gJ57SoJImXz/SXV14hYEpzUMoVK1OgRT
 jlRJQWBar0fxaEIPEiOQuZ0c23ReBS+ib47+Pyc0QXgC7LDaALJ5n8VBPDROR82ci1/QqAGVXCO
 X0x0egS5hK3z555D03Kg5L7ee0yoKGa0amFhprcMGBll/n0OdcAx2PPLrw23ydPD9ZrHOEf8V+a
 uxQqlASbyungRW4PZFPo+eFhPWKMyI/gJBb3WeqLG4EvH+pweLeIchQcn/6XW+GohFh5jaYcvPM
 RZou/PUGDsVv3JXcXVA+XNLsXrNR+yZb7UInhIgfvY3hR+pjkAVHbMqFCHgDmNFFGveP153rIT6
 55T5DATnpJRH/Yvl+VB7KGMXccIOnBWYH8AJD3n41QNbqhxerRXA3I+AExGLE/3en7exmCIZL25
 9kuXIWiMEDXJ/lk+ZIb2OCn3QufrieOKiIYnuOnKMnwvhWu4NYWhzc19XwgtaIiD1ohCktcS1e+
 UlOkZLe1f1TddOw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwOCBTYWx0ZWRfX9fUGW18Di73h
 7g98Gq7qDkgKKGoBAOLQHgzV4vBQZEdWOIIfjmPsnf6AyQcsXMHoRnDm10P/6dDAzOEp0M4Hahb
 FgzT8P13k4hm2l7YejK+wbsCx51z0luNx8Bus7x6OhXYiF25ipXrcQS1tQUXO5pEkdzBkXYjEb6
 4SRUgXmFZLAd9O01B3HlX+CGsHGBSzWHTqMXUQcoY25Nw5uRZL2/d0PeXjfSlD4oxv/0n3hGSa3
 kcJlk922hCueMO57+8XywQ+Cik2+ZRbF4lRsTZ2zEFBiyDjV9Z+C+1c5TZ51DDalaRpEL9AacLV
 JXb1wx3CojDfU0oYVjhbrWU6sZmB9V3s3T2299HUZn2jl3Jf7sOVqtVOUW+smusHoPEZKlcvLdp
 95IuBtSJM8rmobsBoN/Z0CSOMQY5qbVegBFmTIL2T2uUOs8Iy3Fwow2hBwkQU8wHs88ayV8Srfx
 Zh/lUP6oj97Hxxhd6pQ==
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=69ef371e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=EpCYgoSSk4DMBEGV6jgA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: sVobjAVKlpLNy0BGMCq3G--O9NbsJSSx
X-Proofpoint-ORIG-GUID: sVobjAVKlpLNy0BGMCq3G--O9NbsJSSx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270108
X-Rspamd-Queue-Id: 96DE4470EC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35547-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[zonque.org,gmail.com,free.fr,armlinux.org.uk,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The scoop devices are not used outside of this board file so make them
static.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-pxa/spitz.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index c0b1f7e6be87411359b0020257ff12c73bbcbae3..3284b9f62be970555042a7292993e45d56fde47e 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -165,7 +165,7 @@ static struct scoop_config spitz_scoop_1_setup = {
 	.gpio_base	= SPITZ_SCP_GPIO_BASE,
 };
 
-struct platform_device spitz_scoop_1_device = {
+static struct platform_device spitz_scoop_1_device = {
 	.name		= "sharp-scoop",
 	.id		= 0,
 	.dev		= {
@@ -192,7 +192,7 @@ static struct scoop_config spitz_scoop_2_setup = {
 	.gpio_base	= SPITZ_SCP2_GPIO_BASE,
 };
 
-struct platform_device spitz_scoop_2_device = {
+static struct platform_device spitz_scoop_2_device = {
 	.name		= "sharp-scoop",
 	.id		= 1,
 	.dev		= {

-- 
2.47.3


