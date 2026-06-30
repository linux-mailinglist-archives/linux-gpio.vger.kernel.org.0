Return-Path: <linux-gpio+bounces-39242-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id guCJMC7YQ2ofkAoAu9opvQ
	(envelope-from <linux-gpio+bounces-39242-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 16:52:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 695556E5967
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 16:52:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SF0ifqqp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=baQ5unVy;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39242-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39242-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D9298303BC2E
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF51D43D4FE;
	Tue, 30 Jun 2026 14:52:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F208543D4EF
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:52:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831144; cv=none; b=uu/ZZcaFAYdmokcDzhxVB2zhG34ag1B82MfTVdEaAJfxkB1oY9bPUUCRLzMX8vt/1O5N0Jrtp8EMiIcFxzxcQX8xyVWhnXU0pEvHhXxAUFtWHOyiwDlCk9t4H2LHZYq72N2GS7yDhp6rLnYnQf6vKBcLDUU1seEiTQAZFgiXa3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831144; c=relaxed/simple;
	bh=G4mAqjeW0Dw8GshNscbJq+bhUDzpZFvHqndA/HuJECo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hJmKmiexGRQ98jqo28DwjkNM/57gOie1NHFP2s50nHJtlTVMqR85i/at+LJHyQ2bfREX9iGiJ80LN9ydyvCUkore9d2WrwdXymgllC/8P/mDc6zsURkN2aOd1VciJ4r1auSo8a0yg7Gns0+LRkl8Rj8w+6nFaOx9NNCG1SK6TE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SF0ifqqp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=baQ5unVy; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDI9u2186223
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	voVL29loeKaAD2u6PAs1O9nFDwmcBaWGfJBn2Pq+Dx4=; b=SF0ifqqpwr6EsuGf
	XdHyTgrTPint3gmAHlIX69MM0pVKjBcBpV8UKVKJTaHLABVahL6rAlM/iSRXFBH0
	F/HNcWzjNZvzgQi660avYNU7JR+4ZJSZxzEvNDgMDS2jrmLw1OOlbq0qpzlj4/QF
	qA+Tl9Qyd8QvYgjM69kCeRsEcIX5uiXQfM0F5l2rkTAujmOXAIiXHsZL8iEu+fV8
	ZyQJxE8OKJHqMMReJRMnry1fHcAylHgq29hXgfdSag5UP4sU1vv6QQQdB36bGyRu
	1Q2y2ieUtuiBaaJum9Oeft0omwhLPQJzuOdONiLR07fKamAgy9jEY4zyfRIalsqE
	GhEFkg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f46862tdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:52:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e663c29f2so158028185a.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 07:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782831139; x=1783435939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voVL29loeKaAD2u6PAs1O9nFDwmcBaWGfJBn2Pq+Dx4=;
        b=baQ5unVydVpsUTTSFlQIrj1ptdsmJDIArJP4Vsax6KMJn73Q/wM27V7847ZmxearSj
         XUJNl6prmtvrikIhxPLIPKHghkfhdNYqJX6jIfhjXaAx0cAxuvj0SPQVEYESiAs/+MZ2
         lehqVfmcUH6w9mPnGktWNhZToY01pP3BKmkF8qSw2LySzUmQKIgwtGCT7RMF22h4SZzq
         pSoxSoLEXCeb7mIVGfNZcu+2vcZExJTcAAbdPXpjuCcuCTd0WeEaZE/MYhrPeeNvW4FV
         zLs5oTlGiPAqNeHubojJp8DZ7kATB8xAfynxlDZ/HvP0tELr13aW04Tk3BYdUGIRtbGi
         AKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831139; x=1783435939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=voVL29loeKaAD2u6PAs1O9nFDwmcBaWGfJBn2Pq+Dx4=;
        b=mnFN2ziXl/0uhhkKupEqDSLsuFpjP7c5o7fScpv003NXVkDw30+DrvU9GS+jDysNzY
         4cc8sp/DSdGuAjDroztq/42wRnDL96hcP6rJUcDYIBjOHa7/+GJcgkT/lIqyrOkPv+ks
         hh3Vw6DQMj+VZZlMv5xbFKMSAK43JvJPbtvpyZQtREmgV6Qz9siHTM9mIOBPtpab+UY9
         kf93nIeKTUcJBB5rLLLwuF9Nlfm7eNSIgntlcWt4CdfREyrP4jkNc/hJZ8AB4HxOdrRD
         eryXGHBa1vLKAzmMHrgqKeAJIZeErRf4dRH7hMDo38OZ3XJmhkZF/zyZVc9N/Q9ba1Im
         2lmg==
X-Forwarded-Encrypted: i=1; AFNElJ94oCIjrgRggGRaz3LzBUqsj06loevym5surVxaD4d5wXyn4tha775GvQ7uoFrQ2Ju1beQBgfStmz4m@vger.kernel.org
X-Gm-Message-State: AOJu0YzepK3AHSR7RcBAkWU11GGhXQBL8ssfzGRPoDUCbhnmSqB0Nbmd
	/qOxPRU+wNc8LtOyTppgcIn9MEn1btWjHb8Rkd6xF9AqrfvH1htkvD0IFa61COVqsXyhtqUXIrV
	BgMYXeyi/Qc5lyIJAsT3Nb6lzwN23QLzXUb0O5Lcg31jehDX2pRHOs/AC/dI9GTbb
X-Gm-Gg: AfdE7ckjjs4Ml3N/RhrZjnOxSUAEA/beYvtummZdYDI0Y5mnl7iW6VZ44o+zOYpktvJ
	ejrUoxrkslhxOawmuLsnlhznuf+wSYbJ2bNUZ8coDLbkPEn/ocLuA8G/5h05ic0hy9H8qZA5bQ2
	fV8JvVO1qUKOEVKd0blCzmBY7W9dNpKw1CXs74SofT6cp3hMxqzoXvrK96jbmS79D59t141fyls
	UXPd4yFwfH0XTl1JoWeDMkqzTeiyRSrenzN+iaAftxWSeLV8hfHnrAGNN7X/UazQgG95ZwZYqjI
	4U0dELRv/rgx8tVkhXG2RH+ciaUeoYACa1V4e286XdyViZwdF9viTDuDbxdThnLSgBzy49JWOMZ
	V1wJPRCQ2vzuB4fu6VDB1KcN++4rBBBJZar0uQvw=
X-Received: by 2002:a05:620a:4149:b0:914:bfca:7d12 with SMTP id af79cd13be357-92e696afe48mr267965785a.5.1782831138834;
        Tue, 30 Jun 2026 07:52:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4149:b0:914:bfca:7d12 with SMTP id af79cd13be357-92e696afe48mr267946785a.5.1782831136817;
        Tue, 30 Jun 2026 07:52:16 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:a2d4:ac8b:bb21:2661])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bb1bcd1esm41326815e9.2.2026.06.30.07.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:52:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v3] pinctrl: qcom: Unconditionally mark gpio as wakeup enable
Date: Tue, 30 Jun 2026 16:52:13 +0200
Message-ID: <178283113076.37349.4420730863475722984.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616-enable_wakeup_capable_gpios-v3-1-fb59647d89cb@oss.qualcomm.com>
References: <20260616-enable_wakeup_capable_gpios-v3-1-fb59647d89cb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kw_a000gEfalokzyw-m4C4N-3A4XIEm3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzOSBTYWx0ZWRfXxFswZbt64Ts8
 Uqf7zXancABPPS/TzfWyHCdfgLLuWAapYep8XfZe2IYY+LMIc6naLxoHVcR0QsZ3ajfdGMvIV08
 8HPRAUv9SLma1aslsq6i3zymS1z14xSUH3c3VkgK6DelCCWmGpbc36qu8srulgWe/LixO90VGn3
 js1wn6zI1Ny4aHQj0cg9Rlj6dnyA5o++5xAYi0Bn3cgiTJRHV1mdaZTWRW25+L4wG4Dt6G4Yd0H
 VeTxSNF99R5nP7sKary3WRn7u5ghP8TwS+qT4C7qZ9lEspRR2TxkHCuTq89YlnBGMQU/eJsfNNm
 oAi31Viy3plv47HNu5V47LfkCj5qTK6nqar9fNo14cjKN5Cfrq6tSeHeca1dw6SJzVTmFncgLp3
 llqUnanaMKnDbFoOPRMKF3Qujbb3uFFkAQMOvHW5p2S+4zuuCSQRuRt0aTaVXgAnICsPk0oL1Sm
 keAPhn8JeRKW7X9u1DQ==
X-Proofpoint-GUID: kw_a000gEfalokzyw-m4C4N-3A4XIEm3
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a43d823 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Kpg7wRNn3CZZSTE7MwYA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzOSBTYWx0ZWRfX8ADi6/GyfeQg
 2RpDY0GVLYFvUNicEzP53vkTtQEeGq3J6W8elfs+0DQ4NUx2EnLwyBtlqnLo0+sm3T9qHYsmd/D
 FH7iFXlYBSN6dLfHJH4JvDdK6symxoA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300139
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39242-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:neil.armstrong@linaro.org,m:krzk@kernel.org,m:sneh.mankad@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:maulik.shah@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 695556E5967


On Tue, 16 Jun 2026 17:24:53 +0530, Sneh Mankad wrote:
> GPIO interrupts that are wakeup capable need to be forwarded to wakeup
> capable parent irqchip. This is done via writing to it's wakeup_enable bit.
> 
> Currently the bit is set only for PDC irqchip by checking skip_wake_irqs.
> skip_wake_irqs is set to differentiate between parent irqchips MPM and
> PDC. It is set when the parent irqchip is PDC to inform pinctrl about
> skipping the IRQ setting up at TLMM.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: Unconditionally mark gpio as wakeup enable
      https://git.kernel.org/brgl/c/859e02a369ab328a77dfcabf59562100e55f9c5c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

