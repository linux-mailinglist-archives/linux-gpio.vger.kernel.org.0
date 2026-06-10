Return-Path: <linux-gpio+bounces-38222-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RUQwDt8cKWqCQwMAu9opvQ
	(envelope-from <linux-gpio+bounces-38222-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 10:14:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB4D66703C
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 10:14:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OsztrHXk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NRA2VkMr;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38222-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38222-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3602A3148278
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 08:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C5F39E9CB;
	Wed, 10 Jun 2026 08:08:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDC926F47C
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 08:08:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781078908; cv=none; b=ZVuXzgnCSqXOYTj1kdcsGaB7JANMnLJocebo29KITexcpIRLSI2AxfBjxEjsW1JjIONMJqy00R2G58h88kpGE0lCY+NDxKULNbl6NuEDqFeF5POrlLiNHYf0ndHkj1B4g5GnN0FWnzTfETFHViqz2l9JiyE7htg4bmgvOLNfUCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781078908; c=relaxed/simple;
	bh=AY3as8coQIhQU3s/ix4OCkPvNDef/1OzdUAbu/ZM/9A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JXRrKHMbgBHRoe1/Ohlf23F2+uPjm/m35u7NFvo46DZWdU0t8xSspQF/XfEkrE/ZnTKPnX2KgSDuprqAsGicAi6fgmtKOAGXtR4uh/QqPBQ4Pw0eyRHstfBNlRo6n61M2SF2hvmzYkMktdtoMO7/lhkidMwx8kTVNt53p8TgIEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OsztrHXk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NRA2VkMr; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iZCt989190
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 08:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PVo5QyG3TCPUPVzN80d/ywq4altrwXSl6ez
	L5d/SGIw=; b=OsztrHXk/+bYuLaI8BqJLAbe/t9tvDErz4lUHiPGXAd+3/47YQm
	Ho5WJKVBIEj8kjwQilHyJ2+0EF//KP6ImVkGrAo4cIQBuBxkDy4TXoExCUZ2/THj
	2Gt9YoVKl2LQGBtYXwMbcOaNU4DTF+b1CNr+gUFuHRjcLJEit39PNZvrRn6p+aZ8
	NhiyFDSrejDurolA5n0kXZhJ5e7wJyKQu9+JU4OdvaJu/rOsVs5EsrbrHNR0b3xy
	t/wYYQ1TegMEc6D1Y+Sh0PU++j4Pw/NnowyP64iL57if812iVOO9hnp3l5M8SUIj
	cwirBOXxOC7KD7fRIcFANbwbJ/IEgH5GvSg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq2segbax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 08:08:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85798977dcso4092021a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 01:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781078905; x=1781683705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PVo5QyG3TCPUPVzN80d/ywq4altrwXSl6ezL5d/SGIw=;
        b=NRA2VkMrmdEsBAyVsE9eRQQnlFI/x1HAUCmtXO96PCSbpAkI3fNZoFsIG0ZVOLLKgb
         ovPSjbA7maiVY8u+ertWPVYpNSTaRqHj0zzFEKP1A+i7JCI/9A35vm6eX34ylrhPaiuI
         T/NODw2eLQM7/9Q/ETMXG2efjLrnTxKUR+nMXhSNK1TTIEW78fAuO715ptT1r0JY5HZa
         wOV9DkZvychgOz9dVkIL4NyP43u/yU4pQWRXTp+b9StXEnQM9htgbifWdsphI7sP8ykJ
         nTyKQoiejVxWRwj6lebQjGwIqsjX5z2BQJAgfZUmfJGJRmh2cqMT+/gst8LjmdbcRRA3
         ugnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781078905; x=1781683705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVo5QyG3TCPUPVzN80d/ywq4altrwXSl6ezL5d/SGIw=;
        b=ShESAzDe3L8xYhi3njH6xy+dBnoq0D8TETirvA22P7L0AYJGbrTrUTDcg19Pd9lVU2
         S5sCyu2e7Ql9u7jmwUQ3/Uaai1I4K4hr+F24gwn/4rRy2gXmB8fQ6aOgy4IU5GaVyreK
         vOgilD7f7nzkzRB5mhEsS13NmW6HXhedsMp6AXlUzNxpNaW9nN+gPFZ3Cj4sPyq+rVLw
         gu+UpSaAoo2ts2NgtqXeWyvcD/V16Z6ISi/qpEJf79QFaPb7qgSvwuSMDqP1Tt9jvaLM
         TeRpT/JkLM+MrCIXPMWBt3O61vxi6XWZ0xnyx2YiT55ybNFyMH7JtSnmSUj7autTaHb3
         TM3Q==
X-Forwarded-Encrypted: i=1; AFNElJ/u4E0/sGUBHxAJvjrRbCvFETmUGUwODWA2JqjFjmQLd03AO4X9O9AAEXMx8kkdXIIG8A6cs/V7nzJH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+aBOLAANdY+iVqRqpo4LijwIHjmgJeu9od4BjeAdAxUQBBdcB
	s1TTDc4jjTUQcL8sG/+11jfUGqNX5gjSht4UMEx71r8P+vKbr+sByjAiZZF3yo1iWCfjH0d1qOs
	PQZbSesPUwwg24hGACTPUz0h2AMwCq9xrHYWlZp6VD+PXjpYKKu3H9Q5yxddM7WeoMTplBa/N
X-Gm-Gg: Acq92OHl3TtBBKCmvOd/Jj+q2aB2zHGOo8TIwwICLgJJkvSjXZfflCQfjSiiCHQzeiW
	C4omy4jeaVRWKuaq6JhwJOIi9wngPQsFSHLlGa70e9OoHf5wvzWtr/npGXueeuFf9nenJAT6HA8
	scPT4lzvUnthlPTLxM1EYN5o3vzZU0nOv6BNzH+/aeBJUoOoAlb/hf1ubhSjkHsBK1JA3RnoRL1
	Sa5ZayTYSbdLaSNtbrtFHZgV758No3B/d4oYtlv+8WZtfR3Rs3CiFYDrBzxDKJPY1QIZTnuVo5j
	shRz6z6Hbp0Na1+ZyvryPeSqCGaIFu7hAm8v/8J2aLgJIaHU5O/xHGeo0V5x0eND7u3TYpb7mbM
	yqpjV3XLNtkxcdvRJlDLfc6OoYjE1sE8jDrIzXCceuzPHE8sR1tAYm/fmD3iq
X-Received: by 2002:a05:6a21:514:b0:3b4:8818:fd20 with SMTP id adf61e73a8af0-3b4ccd3a373mr27867165637.8.1781078905473;
        Wed, 10 Jun 2026 01:08:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:514:b0:3b4:8818:fd20 with SMTP id adf61e73a8af0-3b4ccd3a373mr27867131637.8.1781078905023;
        Wed, 10 Jun 2026 01:08:25 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df03387asm22191901a12.4.2026.06.10.01.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:08:24 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] pinctrl: qcom: lpass-lpi: drop unused runtime-PM write helper
Date: Wed, 10 Jun 2026 13:38:09 +0530
Message-Id: <20260610080809.2588640-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vjuBKmgI2sSZa66eXTECuBL32xHliGcn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3NiBTYWx0ZWRfXzQ3qtWUqpy/0
 Ag69RLuGqWhY4VKJe+gm/yEIpAPUj+n4/jEmaCnNZXZTivFDUkOGxGphUwz5Sd3LdCEtzT1al5m
 VKCsVzmDTbPENIwsYxZ2AlZkTtXHuTOofx5i6ZPcqQQFQxDzrO/aZ6txnj936XvZY4xw3XufdiL
 /G38/R/knnclP6MU5wu7Q81cA6VAptUL6m3cOeurnbGYwoHX8BYCi5En/4PA9xvKDIyrrZjQN3P
 byLIjBrelurbD3wayskPQguUiFmrC0PoL9Z61ASmx1A7ylHk9U5vlfH4Tx3zC9xRhn/63L0bXZP
 WVrSSteG2siB8uSbOy3zurjZGVi/AjRwyYklsapkpCukuKC0JYr0mpeYvaieCoxZAd9ZkFQmHAW
 65c7Nt1wlyFhvKOa2M6L3RZOv4rrwHpZK8naqQmTW7EnvA5XdkgzMY9MgaChn/SMt5ZsxqnMS5Y
 XCm26pBF/p7p3soN23g==
X-Proofpoint-ORIG-GUID: vjuBKmgI2sSZa66eXTECuBL32xHliGcn
X-Authority-Analysis: v=2.4 cv=Md1cfZ/f c=1 sm=1 tr=0 ts=6a291b7a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=cbsZFf3Q0uKgmDm8bSsA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38222-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:ajay.nandam@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8EB4D66703C

lpi_gpio_write() became unused after the PM clock runtime conversion
switched write paths to __lpi_gpio_write() inside callers that already
hold an active runtime-PM reference.

With -Werror this triggers:
  error: 'lpi_gpio_write' defined but not used [-Wunused-function]

Remove the dead wrapper.

Fixes: b719ede389d8 ("pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM")
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 4d758fd117c4..fe7ec0176081 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -79,20 +79,6 @@ static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
 	return pm_runtime_put_autosuspend(state->dev);
 }
 
-static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
-			  unsigned int addr, unsigned int val)
-{
-	int ret;
-
-	ret = pm_runtime_resume_and_get(state->dev);
-	if (ret < 0)
-		return ret;
-
-	__lpi_gpio_write(state, pin, addr, val);
-
-	return pm_runtime_put_autosuspend(state->dev);
-}
-
 static const struct pinctrl_ops lpi_gpio_pinctrl_ops = {
 	.get_groups_count	= pinctrl_generic_get_group_count,
 	.get_group_name		= pinctrl_generic_get_group_name,
-- 
2.34.1


