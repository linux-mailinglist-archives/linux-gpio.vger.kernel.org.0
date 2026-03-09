Return-Path: <linux-gpio+bounces-32815-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOREBQzCrmmRIgIAu9opvQ
	(envelope-from <linux-gpio+bounces-32815-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 13:50:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEA223929F
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 13:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A42B43026D8E
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 12:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE553BA227;
	Mon,  9 Mar 2026 12:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqmHL/4V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KsRaZrwc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCFC3B961A
	for <linux-gpio@vger.kernel.org>; Mon,  9 Mar 2026 12:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060190; cv=none; b=IQjvBzaUUNSLfCdIsjo+d+7gTLTMJ65dBvMVtO58nsCOy3HZbEC412sT++wjUaaKiYXL4+hB2wnDtMu4V6bbl3lhqzAhA78bbKx+iXLkHNRoadHwB02zAig4tG3ImwnLEMR5mpqSeIUw2xxuyfGRLd7A9Qt+mnrv2Y4/31luzR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060190; c=relaxed/simple;
	bh=657u5VcsdCwH5K3uh0YA0oSgSY82ZXzp8LKA80Hy5Pc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AOhEGa00kwUr8lLv+yTrN42KMyADTRD0QXDpDiM4jQ6X/d2/aM+kVwqBnSC2ENR4kR6XFuc4miT5y+xqCdtr93HF7IPZxtJwFTi9AyD3cT4FXQFEHM05b3WWqT3Jr5n95LhQ+QR/EJDTOb7Wnetzl/FgNiFBRL/+c84kwoN90xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqmHL/4V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KsRaZrwc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629BcnuU2200772
	for <linux-gpio@vger.kernel.org>; Mon, 9 Mar 2026 12:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SQwazpAS/p8xBP8ywiNVLcoVJEL1G6gSbs/PG65TAEg=; b=bqmHL/4VSNwRWM8b
	zRkOwuPJXJcW6NCQgD7/GLLOPdIJx/ohQONcGW6ViXOnvgJn6xsI0ZJVyeREi792
	XaWQuUNMQQltO7/iZLEc+JwdlnQAIeqsUUvnkkZEf69jnbPH3fGeX3tgn8bnDdWk
	YouR8i1kZZ7SnOXQzUTrfHZLTMfvLTwOMuaBiokL9Yb7r8dZrdVXesdVziwlGIMu
	eO7DFHN47nbr/+w/CjDYnHcGCE0aAcMkxuaCiqm8uggZo0mj1PYqLgKi10tOm370
	qyqgTwG0jEQLGNKeJYx8uxHBqLa2apnj9oZwXGUsE7InwozSFb4Lih/SuM6T/ALF
	/kO0Cg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crcd8dbhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2026 12:43:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7fec8d44so728094985a.2
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2026 05:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773060186; x=1773664986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQwazpAS/p8xBP8ywiNVLcoVJEL1G6gSbs/PG65TAEg=;
        b=KsRaZrwc9L4twFk7N8+iRsoRruHTQXrMe6ELEY6JEsrl+VeyFZeihC/SGO81sZF/7S
         zeLucgF/C5Jv/AboRUMrgdOK6b1NlQDJz8rpDl4jH9k6T4FOkW9fG6qvy3bBeG2WC0VF
         Pl1aLcMzrWzU4lICPDaD/RQKaTP26Au7ZLxtU+4REfJx+EfTEJpkS5+5t6NsGpuYs0sU
         lpfLKMlrz5dJTL75IHOhbCrJriQBGwdtJteIztxui5uYUm0+kGuUI3XxzZS32KliXLVm
         9CT1eII34/36wgNcOQdl4w61+UL5+fgXx9ERUWmBuBMrNXMyJcoSH+K/aBxplTgTOV4c
         /8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773060186; x=1773664986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SQwazpAS/p8xBP8ywiNVLcoVJEL1G6gSbs/PG65TAEg=;
        b=KSN5D+vtFcqE5bUhe/wuLeV6egw4DRqxSF1sFASon53tvlD188ZEGaEgPRSRmoebDx
         RWDaQQh2MJMjryCUGz/ojgwYDsUOL7EiGtSXE1BktA3laBSQvORDN7b5d8k3zS82bwNj
         9nqcyQCXRYnYUttUwu3aI6mMHAGMDIQCNEnLhuLdrIHO0hdrscTiZTFDx7RaumeFxkSd
         wD+sEKjjOFodtsl6pa3yQ6bzTaID075ngjB+NCNZMvBNuZihF8a80AiiFfmmiK4p3BHG
         Or0HbA/p1LFDmfw39gxRnvWUat+GaUsyZyN+m9IAN4vcpSXNmWwI+eQqh4iLsik4BpxX
         7hNA==
X-Gm-Message-State: AOJu0Yz3jY/9CmiIKX69iQvqDRPzm61raY1RtdCW2ym1mfn0SKJDJoAZ
	F+2lNUumiGZDJoIFf+78KKGUFv6v2wg6UgaQC8uDRp4bQoIbUdrhBd7+Eg4Wye+rlBhTQURB0MJ
	94g6uP+ZpQQQ+RVg6MbFewXU2PnjHxrgjgnMEU7s6xkhCRJxeuvHoLAlSl5vQlS9M
X-Gm-Gg: ATEYQzy3fi6GrAzaJ2TT8d5gk+NF6wjW9ghD0ocu4BrrPn3vKrJ38kOjEk4Kn41xb87
	Dzv6tFwYKs1INPlUBcdOzpBIywfeE40on8oeLVjANeeHriD3Qo6cLhpxHv0QlcAnAQGDVJ9nR/I
	r/z5z96zsi1mnCoX90eHFbp/ScrbB7K0HM92qxY6BkvZok+f358zOQTY2HXiO1ejXj5DQEMQFo7
	aapvmDg2YeakR7+OtcASjUWvz7QUItwpSlUuKySIq1a6Egjv/6MOPGKMPx2O+I8693XmxC7U3WI
	u0mUGt2Z1L6UBSKip5wf3yQ/rkIgHATvSnCxJvhXlM/Y78gkgFhDP2L7GYjVtXCEwKxNEDdyKcY
	jsZKmCV7IxJbYDz9fw6c8IlayYMFaaLvYlVbejmfAb9KfPPwcJIJD
X-Received: by 2002:a05:620a:4002:b0:8cb:3e86:d98b with SMTP id af79cd13be357-8cd6d49b8a4mr1509510485a.70.1773060186314;
        Mon, 09 Mar 2026 05:43:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4002:b0:8cb:3e86:d98b with SMTP id af79cd13be357-8cd6d49b8a4mr1509506985a.70.1773060185863;
        Mon, 09 Mar 2026 05:43:05 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:494a:62d9:d95b:cb98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48539e574b5sm107803345e9.8.2026.03.09.05.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:43:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 13:42:40 +0100
Subject: [PATCH v2 4/6] ARM: omap1: ams-delta: convert GPIO hogs to using
 firmware nodes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-gpio-hog-fwnode-v2-4-4e61f3dbf06a@oss.qualcomm.com>
References: <20260309-gpio-hog-fwnode-v2-0-4e61f3dbf06a@oss.qualcomm.com>
In-Reply-To: <20260309-gpio-hog-fwnode-v2-0-4e61f3dbf06a@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Frank Rowand <frowand.list@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-doc@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2531;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=657u5VcsdCwH5K3uh0YA0oSgSY82ZXzp8LKA80Hy5Pc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBprsBK0MJaZuCEcNXm/8LzHDpWPQN1bHIaz1w2v
 TCs2lep/p6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaa7ASgAKCRAFnS7L/zaE
 w1F+D/4u8ii/H1cE8fIlALXnOq3ppXSQii0gcpwUkzxyl2aq8K2iP9cVIuRXmWGSQBm8jrGtlLI
 uEKZW8XuSSvPq0v1kKz7ocOoUX62HTnzfjnWVp/fqmt62t2FXJaf4e877htmTDMfuu4WAOJv3Vi
 aycFNT86SGgLs7TNaQR8pKpxpVs8K2OXwZkFBdAiWtYE9m3fmtVYO142796Ldt9ZJk2hLEqQQ1s
 Dlm8xOOMtF6PBpBCUjy1N7795nGEocaF28EagBGJ3E+hzSPDkhV7e7BETT2xqAqUV2+D5LtYYm4
 WvG/bcLqvWHzhuvepS3qaRzRBwdbPEDzKgK6NEt/FcN1zjEuPX+rNE9LXgmjOiqKD72AIg/nvMZ
 JePKfzK5cfgOM17iAOXpQCpnNgYdWqUGxZpFzfTMTBPEKTfgtoCF2wCTUWnVJg/Z6HE5YyTGfSS
 rFR+lZgSRmmoDexhb9G3i2US0rL4NW2s70miKvDL/8OGOurFkHImhCc4C1+HNNyhNKPOCmoP7es
 e1UNoclkcwxf4CIvOsOcVEV7yejTycZD3CzLRdAZ8poSH8lgPEqKzss/XQfySnVXDe1UmDWgnmV
 gLqXZvGZoHK5xrjEX5+eyErEz7y58ofVkYqFx0icSyFPJR6v3IrCuoCLMWqToRxANhsryXTsWJI
 DAiNr1FHZFSJGJA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: dKNGwFe_aOdqOTc3VMCfIJsif3rE9Jfk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExNiBTYWx0ZWRfX9mOJOQo7C2Ci
 Ce8fUJ5TWQBpQuTCN/NcMuVywuANYu9VzuNubkGS7T1gXfY6yU6KJARrRtRpyXWUrk9l4O1t3/j
 3RWG2mMNRQX3j6u6VbI+fO1c+J9b4PAIZ1DUWkQ4TV8c2WoxY60ZGGnBhQNprFOPDOriq3kvIL4
 OoUYsifAWuc4CVPwyK5ykziJWHM54BIdisBOw14iRRW4DC9dCEg5+O6bPSBQLlnp+d9DpSbfCU2
 r/fttuj/cr2yxvoOFSvMV61cycBKvKG0MYhF0cZ6poVG5RRBjSsik+00UZG4GprhZ4LQM6ujdg3
 NSEfGHepYPIpC8YFVui2sVt86gOPICVTotsINO6kylkYZ+9GCVW/gPQ+VmL4Ib5fLOWwYJHlNDJ
 Pp79Z6HPjehc4FX36ce4eXrdort+6pHYlogX0jGCsUP/jUcTmbGCBBIQfBnGxl2SRkMfS7EiuBD
 Cj7gk2rO7G+cfCZK23w==
X-Authority-Analysis: v=2.4 cv=O/w0fR9W c=1 sm=1 tr=0 ts=69aec05b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=IpJZQVW2AAAA:8
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=5psZAbpHc07LGj0ksyMA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: dKNGwFe_aOdqOTc3VMCfIJsif3rE9Jfk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090116
X-Rspamd-Queue-Id: 0BEA223929F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32815-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,qualcomm.com:dkim,qualcomm.com:email,baylibre.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,linux.intel.com,iki.fi,atomide.com,armlinux.org.uk,lwn.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.966];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Setup a software node hierarchy for the latch2 GPIO controller defining
the required hog and stop using legacy machine hog API.

Acked-by: Kevin Hilman <khilman@baylibre.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-omap1/board-ams-delta.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index 16392720296cd224732450c85419c35bbab506f6..1bec4fa0bd5e8bfc58103d1f24b22176707fd26f 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -556,10 +556,30 @@ static struct gpiod_lookup_table *ams_delta_gpio_tables[] __initdata = {
 	&ams_delta_nand_gpio_table,
 };
 
-static struct gpiod_hog ams_delta_gpio_hogs[] = {
-	GPIO_HOG(LATCH2_LABEL, LATCH2_PIN_KEYBRD_DATAOUT, "keybrd_dataout",
-		 GPIO_ACTIVE_HIGH, GPIOD_OUT_LOW),
-	{},
+static const struct software_node latch2_gpio_swnode = {
+	.name = LATCH2_LABEL,
+};
+
+static const u32 latch2_hog_gpios[] = { LATCH2_PIN_KEYBRD_DATAOUT, 0 };
+
+static const struct property_entry latch2_gpio_hog_props[] = {
+	PROPERTY_ENTRY_BOOL("gpio-hog"),
+	PROPERTY_ENTRY_U32_ARRAY("gpios", latch2_hog_gpios),
+	PROPERTY_ENTRY_STRING("line-name", "keybrd_dataout"),
+	PROPERTY_ENTRY_BOOL("output-low"),
+	{ }
+};
+
+static const struct software_node latch2_gpio_hog_swnode = {
+	.parent = &latch2_gpio_swnode,
+	.name = "latch2-hog",
+	.properties = latch2_gpio_hog_props,
+};
+
+static const struct software_node *const latch2_gpio_swnodes[] = {
+	&latch2_gpio_swnode,
+	&latch2_gpio_hog_swnode,
+	NULL
 };
 
 static struct plat_serial8250_port ams_delta_modem_ports[];
@@ -684,7 +704,6 @@ static void __init ams_delta_init(void)
 
 	omap_gpio_deps_init();
 	ams_delta_latch2_init();
-	gpiod_add_hogs(ams_delta_gpio_hogs);
 
 	omap_serial_init();
 	omap_register_i2c_bus(1, 100, NULL, 0);
@@ -693,6 +712,9 @@ static void __init ams_delta_init(void)
 	platform_add_devices(ams_delta_devices, ARRAY_SIZE(ams_delta_devices));
 
 	platform_device_register_full(&latch1_gpio_devinfo);
+
+	software_node_register_node_group(latch2_gpio_swnodes);
+	latch2_gpio_devinfo.fwnode = software_node_fwnode(&latch2_gpio_swnode);
 	platform_device_register_full(&latch2_gpio_devinfo);
 
 	/*

-- 
2.47.3


