Return-Path: <linux-gpio+bounces-37197-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JhSEvqoDWox1QUAu9opvQ
	(envelope-from <linux-gpio+bounces-37197-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 14:28:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A100E58DA60
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 14:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A3CE3155383
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 12:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B7F39A7E0;
	Wed, 20 May 2026 12:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oZ+rybGx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UtkcmNes"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1083D8113
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 12:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779279406; cv=none; b=XH7krK1CaYnU9s2qlLqff/fBdDQgBy5FraQ7+0aTI9ETQXhmLfofLRYnxRYbnFxzlRVsyAjgRBs1+nshnyeyWgAcg5XlCSXiWTo3Cgdl19wxr0yEgX4Rq18/4MqN59im278pt9qIS9/Q6TzNQFFN2ULh/FpL2bR5wuqEheKsh6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779279406; c=relaxed/simple;
	bh=o9ZnfyY63RqX3ZZODd2HTX7Q9GAdTuE9JLcWd8iUxHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ioQRSZbOLuGgSXurWsisryj0o/u6bKEwLL8sf2I3gonXAgiVHfVBcsBjfrwgrUBTjXWoFr/tOwVY9ZKHmtsBtZS3trWNz1wALpIiaumWf0ZBG0x9WGjowoEf28cCMmsMp5GSfu/sExKf7A/PI7hGhUlHnvgkNvtC7IgFbzMFSl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oZ+rybGx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UtkcmNes; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KBZgO23085144
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 12:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vj8wLMWCVm+4Q7algLobQ4i2Yc4PUYQA8G/
	p3fqAM/E=; b=oZ+rybGxicQU6V0pnwXA2RS6JYlxN6F/oHKV8i1jNFh2aqzORZu
	DxiKIu68oy6BZty8qLHuFqrtm6oxS0JGCyLVmH2D9c8GhgWKc9FbCP5XSSnCrNI/
	ht3TTDhWNPyk4K1wifBIy+VIatKN0EDadsRJ2MZq3LLvxymtfuyab0qJf61CWM/T
	UbdWOG0WQzdKApVPb1akqtF0tGLHYvz1Z8SYPyvMWP8SRTjUuPxeWHKTbXLSxj1Q
	M6rxlxApJKfWi06MJmYTpPckVwmVX/qdF3KsJru3Hix/x2czULhGNH8CfbfbnhG2
	lqLjwJQup3Iepi9LluUo55ywzIhIU0fBq6A==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f04vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 12:16:44 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-695391d14acso6161801eaf.2
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 05:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779279403; x=1779884203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vj8wLMWCVm+4Q7algLobQ4i2Yc4PUYQA8G/p3fqAM/E=;
        b=UtkcmNes8pH7ts1cpyB1J52nFMGqX0udcq2d2gMUHz2+Uw3T1k2Ovinj5kC6i5MXfp
         RYYYYIHmZ3rEco7r8pmFTPfgAC5UONuySYmUcxha6ImaYtlHNULksqHnfKRQe4fL/qzU
         7wetz84jqilvOdMAeBxSYM+v/N5Y6PCrmnEiGs/Y4kkWpcME/T2xhqrZsHHhZ9g+kYmA
         njvvATG4JpH9fWGXlMSZStztsnxGSveokAikRJFfWV89Obvbk4jtr+5ToTzla+7jroUe
         lXa4rd9KSgji+AiX3kJ8YcnBnvS4JNcZuQNlB+sCCSv4tyHPSYItwuBwIr9QsNQNPjFQ
         gL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779279403; x=1779884203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vj8wLMWCVm+4Q7algLobQ4i2Yc4PUYQA8G/p3fqAM/E=;
        b=PUhlgPzx139Edywp0WIw+56f6p+HgziqmoBDbAW5oRjSbfA9PruuZYJB8LIwZSw2Ng
         n2HlLDWwET536Xn4TRHPTUIMBWOulxDojiHfsIou3QuypVcooJ7lTs0Vvhmfl0zxw5hQ
         O/woFwu8kh+II0rlwO4Z3+HmCvE/DQleCCxraw0spH+lGSwCFjmqiM1kWl4GkpXxOWel
         KSldANoZnQoy/HCroeRVI88VPYb8Z/5FrGJcs1XiScOpNCp6VKz/ryoOap4HkDnW0UkT
         iH3It1esBzJuDW8lYJTJ2WmQB7KN3CMRQ5oBxIuLwbaUJQXti0Ul3XUi/28WU89Afn7b
         CjbQ==
X-Gm-Message-State: AOJu0YyGBImokSfWSYEHmI4AJhOSF7omG9hJkRAM5M1EzxM1D9GQug/p
	GagcFkvZPw892pqktrx4KkjuSiY1BhSESF8rIE2hQ6VjcqTJiwBne9T71T4XIM2xKB7KpXMD2LR
	KvAprG2iWEpIEwIehx52lk3dXQ/TS4lT85ficDuZpute8EZJWBifD8uEAKawFEv8A
X-Gm-Gg: Acq92OHs8vvAHOAkeMmDg5dAXw5LDDbndstTZaAB6EcUaaTudzgoTbdkdTk89R4vl0z
	AnkoJfCvQbmqt/Er/X+N1eqNNJZZcRz7M4b33s5cXikjpuY7N9uby/OB+xwsvw5vm6/Bbwq4XGK
	tNN0trANREZXiS5un2fOX6spjIOCQ+ZxHZMfqDw+4JUGQJqOZVGIS83TVoEFK35cTVGDAaxewP4
	wsa4SgKsSKNsXUnNKZuqMU9JqC9ZUeAhShwVrce/EZ/GPQVWTxwut6p0hTIcwqxgZHR+cONWg/R
	lnNrZLfZlxTo9aPnWfj4DtLqgKfO15fdI8UEh2o/512L3KC/36fPYNDu4NWD/Awlpz7N+rZquyx
	877yOc0zAyXyf9SnHbICZvpyDI36XWEU6UevXmFOnVfHycVnmUQ==
X-Received: by 2002:a05:6820:1511:b0:68b:7825:e68f with SMTP id 006d021491bc7-69c9b70f739mr13695829eaf.49.1779279403466;
        Wed, 20 May 2026 05:16:43 -0700 (PDT)
X-Received: by 2002:a05:6820:1511:b0:68b:7825:e68f with SMTP id 006d021491bc7-69c9b70f739mr13695811eaf.49.1779279403018;
        Wed, 20 May 2026 05:16:43 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:9ec3:885a:6d78:48d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768acesm57632909f8f.7.2026.05.20.05.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:16:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] gpio: aggregator: remove the software node when deactivating the aggregator
Date: Wed, 20 May 2026 14:16:31 +0200
Message-ID: <20260520121631.33976-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0da62c cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=tBb2bbeoAAAA:8
 a=EUspDBNiAAAA:8 a=jtW8TX3knPb4IrXsSFQA:9 a=-UhsvdU3ccFDOXFxFb4l:22
 a=Oj-tNtZlA1e06AYgeCfH:22
X-Proofpoint-GUID: vMXaOLDyo8DB3UNlVYxSKg6E1TdjLGht
X-Proofpoint-ORIG-GUID: vMXaOLDyo8DB3UNlVYxSKg6E1TdjLGht
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDExOSBTYWx0ZWRfX2QgbyCCEaRxQ
 mDkW2Rnij78+eTdFdiH9xeLfCV6HBRviwqiQptWj1RwRtjklrV4V43uEJ19ET1wBNa2Lt2H66Is
 3tjvl+939iIALQI5oa9FGVrefImLTVWgaua2Bpllo42rHkJ4vZaMg5Us6gy6qbzBgfHlYpAA4XL
 paF13sqxSuXAk8yMrZanf2kgP/lu+Qg6gMSGgHHUL42OMKv4TKalU9w6ipOZ6Ljuhobeb7wQVBi
 RoAA7Oz5GB3t+DMlMXSfIWfzd4j2PrVgLyn5oijDQQe6WNOxqv3w0+BvVO0qkJ9rDnSelleVvWH
 I04FC9gqFG9Jfol3wNXQI//sDYbS/zUPIB8y9zmAdt1sSJh0zvj1Q5OdjznOXtc/vG9IZ+xzN8K
 eLs1ITQKi/sP94Ih0GyTf3tZXT+QL1mnIhzt9Ug07hkQV5MxRUaSy9N3VPsat4oCG6Gj+IZ+DpQ
 JX660VNjg24NNjAw4UQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200119
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37197-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linux-m68k.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A100E58DA60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The dynamic software node we create for the aggregator platform device
when using configfs is leaked when the device is deactivated. Destroy it
as the last step in the tear-down path.

Fixes: 86f162e73d2d ("gpio: aggregator: introduce basic configfs interface")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/all/CAMuHMdVZ=XUvJTGdDAjnkxgtw7Uvnn61iOy3XN_5XNZM2anctw@mail.gmail.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-aggregator.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 5915209e1e21..44f19f22fc30 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -991,11 +991,15 @@ static int gpio_aggregator_activate(struct gpio_aggregator *aggr)
 
 static void gpio_aggregator_deactivate(struct gpio_aggregator *aggr)
 {
+	struct fwnode_handle *swnode;
+
+	swnode = dev_fwnode(&aggr->pdev->dev);
 	platform_device_unregister(aggr->pdev);
 	aggr->pdev = NULL;
 	gpiod_remove_lookup_table(aggr->lookups);
 	kfree(aggr->lookups->dev_id);
 	kfree(aggr->lookups);
+	fwnode_remove_software_node(swnode);
 }
 
 static void gpio_aggregator_lockup_configfs(struct gpio_aggregator *aggr,
-- 
2.47.3


