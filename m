Return-Path: <linux-gpio+bounces-38845-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X6okHct7Omos+AcAu9opvQ
	(envelope-from <linux-gpio+bounces-38845-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 14:27:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C441B6B7132
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 14:27:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=btgLPKit;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Hucgv96z;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38845-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38845-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D62C304F236
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 12:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6248344DB9;
	Tue, 23 Jun 2026 12:27:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368493D566E
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 12:27:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782217659; cv=none; b=aczRnjqmaN5oAYj8u1z7Gt76DP+beaftIX5kSYJ6h2B/mDAdO8KgqOJJdFOBJzkGqbycHFMEdvoN2wr6z7yYwNRxF4/NzttTPcqFOyHV6aQ/rsvqvIlzXkDiVPkOwoN81aMgwd+U3Rs/X33ByaSNkYcJQJz9MpPBr97LRI67Otc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782217659; c=relaxed/simple;
	bh=62IF0/+yEEor5OgJu6EfToG0q4zLv51Qp0CmQh5MbJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WWcaQXuhsD3ESj58VZHRa0v1NYFo4RQMT/uDPGMC/H5X3zH8reZYlCDBpg/R2XSfcMFX5j/CfuV94xXG9PbTweAK4/qjTuJMR7Qrztp3igPC92dT5jPXlHOBr2aVol4HST6YDIiYeptd7/PXvS39CYv9/kZ8FdyPbbkW+5Uxc4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=btgLPKit; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hucgv96z; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBb4di053708
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 12:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YtegZdhnNhd
	tICZszyo7kUw3QGhY43vjCyw3FuJIKOM=; b=btgLPKittqdhSN/0F0c8REPO9Nc
	+nBwRXtsyMj2wTZsB0hlB7kon/Yf/6dd5x+lVHYBxtC3Js/VGssYRUjZ0s9oOHV/
	Hf8Cy0HlM4tS9WR+bG9nPDdtrdo1A1s2cU/qBIeHJPa3Vo7FiH8pX07ewsqlQ+GK
	SMB+6Tie7W71NWXtbQMZRfKlQ5lmuFUUc6sd4k/1XeVjfatQ71OsFjgQNJ8G5bgp
	RxMnZ4D5hoDv2Il1+1Uev63hk2QHbtvml71dMtF1KvREQjAXNw2RHQZIsbHsb41U
	CYqgfDr6YoE0vmL88heRJ67eF5M389mSJ+l5QTbBrEWxTuo70+OqxY6t32w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n44q3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 12:27:37 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-72745cb2c3dso6824683137.0
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 05:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217656; x=1782822456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YtegZdhnNhdtICZszyo7kUw3QGhY43vjCyw3FuJIKOM=;
        b=Hucgv96zPeLV77GnK7ZtC2phABFPcjr1tc6kiM9cOwO8TgZ85X1PQ4pWp2IAS9B4LG
         V3bBREfkuZHHdfulIsbc2/qKey/7NcK+/PnR9CWf3u9/i+dZZytQtCfDIjsTJE3OG3qR
         7WsPeiUmsNV+E2/6F+6WhAzANtqdnlLCFB9N2yx6oOvS1QNpqozkVW2eUSKr3mVgx1GB
         YhtfDZ2vIMJHPBDEJF98ixob6IwW+9o1MzUAJe8CCHOArJBMAqKbMyZKSC1DSd0lMr3+
         4znNph01SzQOZ5dfxWEZtG7R3G0NydTSy8U7q5JLcq6hvGSOel4uwxDB3jiDXkZoPUTc
         x7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217656; x=1782822456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YtegZdhnNhdtICZszyo7kUw3QGhY43vjCyw3FuJIKOM=;
        b=kdwjTzm4Pu1IKMxNtOBXbz0XnpzqUeiixQMTbX7TMOdPOtv7AZdNE5M8dplSzBc7ug
         KlLGoOLJmBseDbEB1M5iyAvfMDWe47H3jXUHzEKO18IOUlpNhVeFwImMB/eygymvvfAH
         X92Rfbpaj3lEvzADLgIX7hetPb8V2IVcXcI6X0LVoOa2evlkAbH5DputolzNumcmVoda
         WZu2m8T9HljWhef5kEOWm2g0z9fpnb+L3puBvSEItDW6QySFFm+J6kOkwWhYRrYQTur2
         BdlTBohlN3b3qSmUfVLwkS81+hjvNX/LmVFRPomUx+EPav1O4aCu6YHi5gKABdraVOqk
         DATw==
X-Forwarded-Encrypted: i=1; AFNElJ9VoGvOabf0nUCCJFpjc75dGrZlmZDhSIiP9nYYRn4fKw9QrGz/UuwURTK+7be2sE1zN5CW2r39CkEO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx++cuO3wVBWwgAayQ0RjhFlXunVwBeKipHo5/BLFh06onBfggz
	8FFqrfgBzoQM46tJSD/+4bPVaW+Yms5QRz+KDiEIZvaoEtuFp7lexmGRFggLYCwn69eKip0ejUA
	4UeZXkS8OxkvFU0eftBk6vjX5ZXrI99vwHPRIyuwRwpMcpQa86QhsA6Fl2fTL8xoX
X-Gm-Gg: AfdE7cmml0SSrwF4DvnxjRfAa83tWnVzWCAVlKPLCXP553I+HX/r/vAF6F7KB19mKA+
	RNgyUa25XYBBhCHI/xEj7DhKm8lR+Eo7GuRtlokeGdBv3Akew3ienn+9LCmuVM8iqDBEMa0QHln
	7x84pqYuCUyG3wvoZVahDtS8jwCELjWDyIWbW01V/AN8rnN8wopNCVolrY3XslaGhUf1uL7TKcE
	YZz6njaUrmFKVnfixjw1YnNyY3Sk50zs0wfvil7IO/5CdoWqdDz04RHI47kg6D9VkyoOTJrhFC5
	N9/5J5pIdmbhRP5NwMmiZvldbpbJ1VXPmpTVMHh7KcDkZbb4KOryDpOzA5OHQ2h1q30R3AOHnW3
	jOgw4DajFjgFzb/JWt06h9opGdW7GzyVKdbyk6g3uaGwiyftf2AH3y/c4IVUv2bBlLn0EVFl8hG
	1o1ODyyQKoVgVVFEHsnnhMKA==
X-Received: by 2002:a05:6102:162c:b0:64e:32c3:1458 with SMTP id ada2fe7eead31-72a1fbf5e81mr10959525137.22.1782217656499;
        Tue, 23 Jun 2026 05:27:36 -0700 (PDT)
X-Received: by 2002:a05:6102:162c:b0:64e:32c3:1458 with SMTP id ada2fe7eead31-72a1fbf5e81mr10959515137.22.1782217656071;
        Tue, 23 Jun 2026 05:27:36 -0700 (PDT)
Received: from t14s (2001-1c00-0c32-7800-07d4-cca3-ec08-7ac7.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:7d4:cca3:ec08:7ac7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5eaa64c8sm514378266b.26.2026.06.23.05.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:27:35 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: qcom: Drop unused irq_data argument from msm_gpio_update_dual_edge_pos()
Date: Tue, 23 Jun 2026 14:27:32 +0200
Message-ID: <20260623122732.6439-2-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
References: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX+0hmMkYpMnZf
 rCQ6F4bFC+C0kWoHqbQsdKjPQOAdNqGXqYxzpiJVUgB3fqgjD8T8fXw3y9XO+X6pqJJrdsFRhET
 mmI9gRiWgYKLBhVzTPfBrbO/qwjGM1Y=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a3a7bb9 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=_5fg6DJcp6PznYzq948A:9
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: 0TwHGBOxKYVT3oyWGtimArzT-cyNjEO3
X-Proofpoint-GUID: 0TwHGBOxKYVT3oyWGtimArzT-cyNjEO3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX6gphVMQn8KZT
 pLbY1L8hSPfniqemkZxENw1MWZJQLFSb0dgLN3TToS8O4uKrfSToKfhMfbQG5ibIObh3eOeDb8h
 gFVmgbLJbdvm+rFUxtuXz3C57ezZVwIzJ/xTOAgD+SG7TuUlBGabYfd8NFbWbjvSJV2e9il/VQd
 LrU1dSpXCabauiH31cqGPdP4CeDaQEtwRzGZJvpaHZ8mCCQ52EsIOJoO81QMrr/H8zO7hpkc78q
 uhPONVQXWmAoW1TxgbzcoMM1MpSdSByGTwospfRNuWwT9zVwxhkSh3KohpL3wRMLgeSXNj19iRS
 zCQ+HBurQYkH1D4rFAzElIyR2SFjb/a1jdznzGMRVIly/P1pDR518FqgmdZtXoJofEODcAR5DPm
 cdNgBQL810fF/731QfLRhBtlk8W+h7e/3arySkSWKLxfVCPHpYt0oeljJPmmT8G2AjSvMI3TUNH
 sYmcVLO7FYR92EVp5Hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38845-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:johannes.goede@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C441B6B7132

The "struct irq_data *d" argument to msm_gpio_update_dual_edge_pos() is
unused, drop it.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 419342ab45e1..f780bab51d9c 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -810,8 +810,7 @@ static const struct gpio_chip msm_gpio_template = {
  * Algorithm comes from Google's msmgpio driver.
  */
 static void msm_gpio_update_dual_edge_pos(struct msm_pinctrl *pctrl,
-					  const struct msm_pingroup *g,
-					  struct irq_data *d)
+					  const struct msm_pingroup *g)
 {
 	int loop_limit = 100;
 	unsigned val, val2, intstat;
@@ -1015,7 +1014,7 @@ static void msm_gpio_irq_ack(struct irq_data *d)
 	msm_ack_intr_status(pctrl, g);
 
 	if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
-		msm_gpio_update_dual_edge_pos(pctrl, g, d);
+		msm_gpio_update_dual_edge_pos(pctrl, g);
 
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 }
@@ -1190,7 +1189,7 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		msm_ack_intr_status(pctrl, g);
 
 	if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
-		msm_gpio_update_dual_edge_pos(pctrl, g, d);
+		msm_gpio_update_dual_edge_pos(pctrl, g);
 
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
-- 
2.54.0


