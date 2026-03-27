Return-Path: <linux-gpio+bounces-34245-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGDeNPRcxmm+JAUAu9opvQ
	(envelope-from <linux-gpio+bounces-34245-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 11:33:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FC83429AE
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 11:33:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 86070306E010
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 10:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653F23B0AD0;
	Fri, 27 Mar 2026 10:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SmWbzjcZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S8gzVmVE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF28F3A8724
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607496; cv=none; b=jX/AF/zO91iq4pdP16iUA+o13DRzQ+Ve340uEokxx+Y76F/+7391hcAPYAQHBkkt8lsU1gnrnpbCnZo2nRMY+o2hQXpkJ6xP1IqPSup/l9L43Y1hpQbEfmRdmy+NPBp1E99O+fQ8gY/NR1taxFUczS8TU2fVDZPI5REDeDUeA78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607496; c=relaxed/simple;
	bh=cvNWbcJEPu+X1KGHjftcUVfo5YRpAWfGsNOyThkztWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mNobzcWd+yzc1DReYtfkqThp2H9QOONpO1LREuO1KpitYhibPwTzvOHX1uymNXAJ+5OPAUnxL2P3gqn9lrE27zB+qV6eKtlRB55FDZJKVUgN7NiJqkE6MdZ9rzaJ9Ez2Lb6f9xLS+tkFDepCVvuBZziCnYKzSGOgKBYqKU74/as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SmWbzjcZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S8gzVmVE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vqId298588
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kRfsS1H0OfXi/OKjLlmM2I3kRnvciT3vVPcYJHJok3w=; b=SmWbzjcZVkYgjVN9
	MLM6h3QZF2ZmScn8YT9cO58rAtkjmvg1Jjvqi/e1sspoHrzJ+rbL3ixNk/TxWnku
	nNeJb7DsuPsBWgRORmotZkUpGPjU72EgSvwDJYnERTM/TSXJ7IWMxEn0IJvqavu4
	MJ/1dwlaHiFbBx7wh3AjU+N9FgcyTRyK0ay3PU6H2iJDcgKyeHWnvztwlggTJ6tv
	tAYyHUTmxIjrZvWkOcZZllTXW55LujWvY4vJrJlRSHB6N76JzF0u8sAy6Szhnjhd
	MdCkaIznZAtpScleTJTPBNeTf+4v8x1goUbm79in71FB5cMBAtIOXYLo/EVCMTPX
	WjtFog==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bd8tpp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:31:33 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56b7482a2easo1162314e0c.1
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 03:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774607493; x=1775212293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kRfsS1H0OfXi/OKjLlmM2I3kRnvciT3vVPcYJHJok3w=;
        b=S8gzVmVEZRrpPlGo1eskq6O+jkJXdukx8FlI1LxwxCEOa9FYsPgTAWrwW4m5P+aDbR
         hp3RWqxxwWjwiXf9E29xllAlWlMxtvzo4WacS1Psay84SBOGVOCA3ACMU3+F4k+gwldy
         Mtb585lwSuZ6Xfwkd7ZuCKoU3maoXfv3N4BhBhY6wY4Cae0TKjpdkEFyONqNZYdfPAFr
         jzspeuLTzSeLQyxSBOnw87yZouAYMAK/nmKLuFaCyKHxtcAedyiNv9g0KeOs1BqE458W
         PN11bSjm3GBVBW1bMdMyQ7RkdhfM59RC5WC2PoYBV74GlkpsdKnk7ygPImGWK5watg5y
         pU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774607493; x=1775212293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kRfsS1H0OfXi/OKjLlmM2I3kRnvciT3vVPcYJHJok3w=;
        b=kb1J+AyXrLk03fbDdKyB35sKcYqDvl7GwSGy14WBF9YBw8CxKbvF/GdMaPdgxmdgfy
         r/jfTDuMMQO7ne0vA9mVKmvSTxQ6tCVxFR6NUSQyfT2CBTgks9r3VWH3YIdd6EbvX+aB
         HbuNHD3J77LxWXHembUf7WqusKP36m1bjCEVurInBpAncvPymO5p1/AQaTpHpLwdtE1z
         +t3RkN6UmnKncZXh1JJvYEODSrzzEWSaBhIDQXjrcGD3LHwFRKWOdLu8rOsB+Tee0iM4
         a5JmtkSqumSZ73DFwnfSFs6WDmh/qe26RdBkG9/vxFO24JAxxPvKQX8hmJv+NJDkV72o
         nEhg==
X-Gm-Message-State: AOJu0Yzb1kYKDlEdgoVLoa7rvo5Qas0lLL3Y5zSj3CwsiDcZpqObbY4x
	D+Ytv9VCbiGPgJqKQilO6uPjnG41B0W/1JlwzYTvoE2M0jz1lX/FpYtXSLmEDBY6MdKqTvqMOt8
	DPkdTgv9sLDpu9F1Pjrdct2+0bkdhwFG9ocY/Ku+EIRej/jy4Nk/POxciHoKO4wsLUDhCHpf2
X-Gm-Gg: ATEYQzwnctR3hUEKpR5oWeC6py6F/4IOkKPeN6LlymAhZFD4Tv5JkN8epQv5tHOFit3
	H8VHjXWc9S1xuk8KmCjzi1Cl2jJ1QHIHiamDZWS7msijp6Xtty0YFmWWuJgJzmggVcdkiTuu81h
	/+nr9S+nVhS/0SIs7fR0vAZ8xDRn6rwUFRy2IC5U12eqj58BYT+NGDVy+rRtEFjcPru5AJGJ0fN
	l5JZDuRp9m6V662t8QYqz2pBHoXxAPoSfDlQL0yBmMZFkbOB6rUid+9Uye+f4LJ1P2LXS2bgwzS
	gDsHdkMrbldakFvSqty27lg6ccb0i9LD0DG0p9a+lUxmWmBuLkRH6ThTDM7yRFsbFNcP4xSjY85
	9uv7LLElOPFEkWH0P3aZZuRxDafhI4Yxj1mf3pFu4nF6IdOKD1lw=
X-Received: by 2002:a05:6102:8026:b0:602:b1cf:80d5 with SMTP id ada2fe7eead31-604f9070848mr641320137.8.1774607492813;
        Fri, 27 Mar 2026 03:31:32 -0700 (PDT)
X-Received: by 2002:a05:6102:8026:b0:602:b1cf:80d5 with SMTP id ada2fe7eead31-604f9070848mr641306137.8.1774607492316;
        Fri, 27 Mar 2026 03:31:32 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:94ec:a3a:baff:9151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919588e6sm13382138f8f.16.2026.03.27.03.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:31:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 11:31:12 +0100
Subject: [PATCH 2/4] gpio: aggregator: stop using dev-sync-probe
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-gpio-kill-dev-sync-probe-v1-2-efac254f1a1d@oss.qualcomm.com>
References: <20260327-gpio-kill-dev-sync-probe-v1-0-efac254f1a1d@oss.qualcomm.com>
In-Reply-To: <20260327-gpio-kill-dev-sync-probe-v1-0-efac254f1a1d@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5044;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=cvNWbcJEPu+X1KGHjftcUVfo5YRpAWfGsNOyThkztWg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpxlx7/LwnXz655ObLQ1uxB4C2yqxOC9hpMFgFZ
 FQSh4Sn4uqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacZcewAKCRAFnS7L/zaE
 w7K9D/9OPshfbXmeEOYpJy4frYd3hQfDF7xgiCMX4+XAL/LpWN+rvWWIls7yN+emtf9OAZ7IKpm
 Xoh3Grl56GxlBaDpSXfnCNOhIgHUJTgPVsnsGFwr57fz0mcZrRB4hrlu+bXZwXCQsG6raVFlqsv
 TmNBSjmH/7DSP71y7OmnC0ZU+KKr8wZo5O7p5U8xuhA36wzLPx5GgWkJo7PWIN//ie686kK/Fse
 WcDHRnAAn2/fUaE6WpeUz7wKTcwtQCavkhTRCa168yKWcrJ1Gpghrq7+lBVGHvd8EAJshd38KQH
 ie0P6LYygePSh1yWcRKpEwWLv0XFAFL90sG62NkcyEe0qeWg6kYcUgzOS797bmn2PUEQpF3cOpV
 nO2xU/JgVnP7k1JaOuLGIFhNehwvUsewV9k/On23skZxhGgwiuddBqE/AJ9YvMu/RTUHaX8tvxG
 /dYoiFalySxv1a4BbM4voU70I145sx7+8ZVmO0mCaO+VvbIcUKG2tZgIJEjepZsdiWNmqRlXTAi
 9V9zVQgMt0AgOOhuUahmdjrC3YT0s3KkSwP8S5VL4idlhH8F1tBpgHPuMi9bBtjKP1JiuMZRcyY
 Cb7IwuaIo7dGR+SQG7HkZY3udgGCkoL7VonU5SXkMjpPLSWOERRfTxVH4XrSW/Fwd9xLwIeuYn7
 sFqe58CYYuURMeg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NiBTYWx0ZWRfX2Pztm+cbfyQb
 hWR7CMG9EBF2gh5EQVpSzzp8atFVxdiNvtRwPYFEUqG6jePjeIFsZS0RIRrwiafDCNMn7H3w2I2
 qU0bk06sbBjlyZLJEY7Mxs9HF2fEwpI8IyomIkL+fcq88MJGBwMPMxDzcTC9enVOA9V1KlHBXlt
 oGhdb2cF3hfdxRtNM4n8D5rJSv7fnJW3ACKCUDDQoFw4BgM+XM9bvJXZx+DyA1PO3HvSEr4Tg1Y
 jNF30gPlSASb9LCh5XDeOF95K8WgDCMK+PI8WRia/CHhwpPoD0qTRSUO1clydHImIldl7urwEBA
 +3UzNCBprWpP1C9sSFDAmKdB1Ug00lbgdj430qve2XRva3JfrMiD24NyVMAeUP8zBtKpOeu6J6S
 q+RsW0IKvb1kgi2qrOJZJqJqRoReg0kA7iX0jt+I8u6cP9u4mb3nwyKph6IV8w7J5RABKMywtwk
 F4yI9hara/GdH9YbP3A==
X-Proofpoint-ORIG-GUID: c-Qb4Cx1W8wJI_Hw_7dALElEjzT2X2vn
X-Authority-Analysis: v=2.4 cv=BZrVE7t2 c=1 sm=1 tr=0 ts=69c65c85 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=DQLobAsLdNT4mewj-18A:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: c-Qb4Cx1W8wJI_Hw_7dALElEjzT2X2vn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34245-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 81FC83429AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

dev-err-probe is an overengineered solution to a simple problem. Use a
combination of wait_for_probe() and device_is_bound() to synchronously
wait for the platform device to probe.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/Kconfig           |  1 -
 drivers/gpio/gpio-aggregator.c | 38 +++++++++++++++++++++-----------------
 2 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a603406cb2e53a89e1da6214a3c1c256d5246be7..09db777938f3723e5dbd895dd1b30d39a21a2da1 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1984,7 +1984,6 @@ menu "Virtual GPIO drivers"
 config GPIO_AGGREGATOR
 	tristate "GPIO Aggregator"
 	select CONFIGFS_FS
-	select DEV_SYNC_PROBE
 	help
 	  Say yes here to enable the GPIO Aggregator, which provides a way to
 	  aggregate existing GPIO lines into a new virtual GPIO chip.
diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 9adf3228c12a84e098ab7ffd543fcad58951ba99..5915209e1e2168b0932de4d16aff38074b889c2b 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -32,8 +32,6 @@
 #include <linux/gpio/forwarder.h>
 #include <linux/gpio/machine.h>
 
-#include "dev-sync-probe.h"
-
 #define AGGREGATOR_MAX_GPIOS 512
 #define AGGREGATOR_LEGACY_PREFIX "_sysfs"
 
@@ -42,7 +40,7 @@
  */
 
 struct gpio_aggregator {
-	struct dev_sync_probe_data probe_data;
+	struct platform_device *pdev;
 	struct config_group group;
 	struct gpiod_lookup_table *lookups;
 	struct mutex lock;
@@ -135,7 +133,7 @@ static bool gpio_aggregator_is_active(struct gpio_aggregator *aggr)
 {
 	lockdep_assert_held(&aggr->lock);
 
-	return aggr->probe_data.pdev && platform_get_drvdata(aggr->probe_data.pdev);
+	return aggr->pdev && platform_get_drvdata(aggr->pdev);
 }
 
 /* Only aggregators created via legacy sysfs can be "activating". */
@@ -143,7 +141,7 @@ static bool gpio_aggregator_is_activating(struct gpio_aggregator *aggr)
 {
 	lockdep_assert_held(&aggr->lock);
 
-	return aggr->probe_data.pdev && !platform_get_drvdata(aggr->probe_data.pdev);
+	return aggr->pdev && !platform_get_drvdata(aggr->pdev);
 }
 
 static size_t gpio_aggregator_count_lines(struct gpio_aggregator *aggr)
@@ -909,6 +907,7 @@ static int gpio_aggregator_activate(struct gpio_aggregator *aggr)
 {
 	struct platform_device_info pdevinfo;
 	struct gpio_aggregator_line *line;
+	struct platform_device *pdev;
 	struct fwnode_handle *swnode;
 	unsigned int n = 0;
 	int ret = 0;
@@ -962,12 +961,23 @@ static int gpio_aggregator_activate(struct gpio_aggregator *aggr)
 
 	gpiod_add_lookup_table(aggr->lookups);
 
-	ret = dev_sync_probe_register(&aggr->probe_data, &pdevinfo);
-	if (ret)
+	pdev = platform_device_register_full(&pdevinfo);
+	if (IS_ERR(pdev)) {
+		ret = PTR_ERR(pdev);
 		goto err_remove_lookup_table;
+	}
 
+	wait_for_device_probe();
+	if (!device_is_bound(&pdev->dev)) {
+		ret = -ENXIO;
+		goto err_unregister_pdev;
+	}
+
+	aggr->pdev = pdev;
 	return 0;
 
+err_unregister_pdev:
+	platform_device_unregister(pdev);
 err_remove_lookup_table:
 	kfree(aggr->lookups->dev_id);
 	gpiod_remove_lookup_table(aggr->lookups);
@@ -981,7 +991,8 @@ static int gpio_aggregator_activate(struct gpio_aggregator *aggr)
 
 static void gpio_aggregator_deactivate(struct gpio_aggregator *aggr)
 {
-	dev_sync_probe_unregister(&aggr->probe_data);
+	platform_device_unregister(aggr->pdev);
+	aggr->pdev = NULL;
 	gpiod_remove_lookup_table(aggr->lookups);
 	kfree(aggr->lookups->dev_id);
 	kfree(aggr->lookups);
@@ -1145,7 +1156,7 @@ gpio_aggregator_device_dev_name_show(struct config_item *item, char *page)
 
 	guard(mutex)(&aggr->lock);
 
-	pdev = aggr->probe_data.pdev;
+	pdev = aggr->pdev;
 	if (pdev)
 		return sysfs_emit(page, "%s\n", dev_name(&pdev->dev));
 
@@ -1322,7 +1333,6 @@ gpio_aggregator_make_group(struct config_group *group, const char *name)
 		return ERR_PTR(ret);
 
 	config_group_init_type_name(&aggr->group, name, &gpio_aggregator_device_type);
-	dev_sync_probe_init(&aggr->probe_data);
 
 	return &aggr->group;
 }
@@ -1471,12 +1481,6 @@ static ssize_t gpio_aggregator_new_device_store(struct device_driver *driver,
 	scnprintf(name, sizeof(name), "%s.%d", AGGREGATOR_LEGACY_PREFIX, aggr->id);
 	config_group_init_type_name(&aggr->group, name, &gpio_aggregator_device_type);
 
-	/*
-	 * Since the device created by sysfs might be toggled via configfs
-	 * 'live' attribute later, this initialization is needed.
-	 */
-	dev_sync_probe_init(&aggr->probe_data);
-
 	/* Expose to configfs */
 	res = configfs_register_group(&gpio_aggregator_subsys.su_group,
 				      &aggr->group);
@@ -1495,7 +1499,7 @@ static ssize_t gpio_aggregator_new_device_store(struct device_driver *driver,
 		goto remove_table;
 	}
 
-	aggr->probe_data.pdev = pdev;
+	aggr->pdev = pdev;
 	module_put(THIS_MODULE);
 	return count;
 

-- 
2.47.3


