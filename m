Return-Path: <linux-gpio+bounces-39038-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QcJpHut5PmoOGwkAu9opvQ
	(envelope-from <linux-gpio+bounces-39038-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 15:08:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6C46CD4BE
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 15:08:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fhsIX5yl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=S8FkW4nq;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39038-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39038-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F22A93076834
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 13:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30EE33F65FC;
	Fri, 26 Jun 2026 13:08:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B390B3F58D9
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 13:08:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782479298; cv=none; b=Ii9RGx6VBakMza0O73SQWmBx2mVmASi1lVgOYbpKcOvfRo0hPxMic5XWFpENyWMGNbc9DGfxJr0y4FTq+Y7oBOz8Aj9W9NMhh8JqeGqtlvzyJ7X+CexCO0Xtbi7OQ0wVwMi09jl6Og2/7awRyaNwJdIEjls8TrbwfOgz36yHdt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782479298; c=relaxed/simple;
	bh=4OMqDq+6Oe/xsyRMRZ+Ck7GyPJ7TWqOMWavyAzqn3mY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AVzpuXE4F+eNSdjMM2KGPL+j/OTGbi0cMixWVtbv5MUonbsz55lX3b1EvJiUpssD/YiKKDcWYd5d9IR2R0vFX1Ufzk8rnedTdD+COPpFBKmTt5lFCrCD2uAn1x0e/641Fk9A/ImaK8kaEq8m8Qy5S1aDLnZeuICW69r6V1Z4O/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fhsIX5yl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S8FkW4nq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAeACW500602
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 13:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fzPkDH1JFdjroeGCXhX8Qh
	HFnHf97FKWCs59ps3MRio=; b=fhsIX5ylh9+gwkSDRQTmwbuEZOzIvjpcKCMAQV
	KACjNVk786T8BvZmFIPLIDKmN/glz9DLP6ozEmdop/7hEMLMjQYOvegHr1bpV6WU
	Nri81Vn7LKDrnWAM00tPLuRkn3fhdxS5kXZS3i4AFOtDfvdrQBrvG0+1CJqjeDpY
	BA3VyMgoWleam1clfc6UoIz2u5CSvWcKOmur5qgJF6PYTXT0pzjcc9bxHwCzq0Uh
	4Unm/m42XMfP8iwfe1L+Vo4L+30YrlQndYKUFsAmM4Hyr0rMJgh5CjodYI0VwXEi
	/APVNHbfNXNYL5Tfr71N7JVVObJvrJwf7l0RP8JZ9fZOiuiw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1j1nj1ve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 13:08:15 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7348c72c01cso48817137.0
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 06:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782479295; x=1783084095; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fzPkDH1JFdjroeGCXhX8QhHFnHf97FKWCs59ps3MRio=;
        b=S8FkW4nqh12VvMevGVXO/bezLmAejngaAEbQ5j0JfSpH4bhd1UM05NW0q/iHkcnncF
         0ghzdMCHldNc9pQjIDyBI2brQk4kyoVklUSDBUvTZFeIhszha2gk7dHId7Wu1r5jlKOV
         JDkJ05UDzEpXc2h8WUNlb9s+av3lRk20auJ6fzoZc7IEGXyDUNd6ClFPsLv3I/DgYqv8
         Fq4NftQrrE70rrD7N5JqdYBE3bXfYSUZQZ7dZDTt9TmThjkhbGDBTp0DlJwoCV6cbcHM
         biMdw4iYouXERN9lz0NlDuEgmKlsxvPqZYXiYOB/Ne2F5o8ky3OpfUX5aOz5sTSu+yCD
         3DrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782479295; x=1783084095;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fzPkDH1JFdjroeGCXhX8QhHFnHf97FKWCs59ps3MRio=;
        b=lHhVjNEdeR7qDNl47jrR+J2y7vsKHkFA+vtNFH6IbCjwgq6AHHyQh3lEORtaamnKib
         Xq1WfA4ZRaqhCEz4y6WLhyAiwbJ1ndIjxEcdssdMP9Hv/jcCRhhD1i5iQrnoofGg7Nbd
         Gpdun0GQFijjJahDhQHHSZ4l2UpQtaoZ5lvFXCX4CplKAzfiqBHXDXrpZphMPVj18yqK
         mioPIuVBMWQhE66bxzfLXzyuRFs8JX6EdNpGJLdwfL5U9Z1sD5kTndZ6MCSgO8yfREmk
         pm5N3XxBf8Uw8EDr5nkfV73TzOFPO/4LXJfZgSCIhXjwFzqNQ8wmhxhctUah9N7OQDWz
         Y00g==
X-Forwarded-Encrypted: i=1; AHgh+RqW7Ym/WhiQDS6HjjfG/hd03yBRZdElSQUpT2u2bCflW4TF0vcR6u9OszoAOqLo1eeyOcvUHTCQhzHD@vger.kernel.org
X-Gm-Message-State: AOJu0YwwrNOfiuZpSqpoqDOgnedYJ68ZT6UZ07qgItBie0qHWLGZkO6O
	ZtBdPzufUM98Qk4EF5qOLJhoh5Dj2e83p4AI7lK6AsAykaWJza1mSj8xeY/yXIhROI2o1bNfusE
	x2sKBkNVZoIaoxVQTpIyJ86bWR6mkUWgmBwpJHSUkNotTCk+b+zelSHQZTUG/8bgF
X-Gm-Gg: AfdE7clFqIf7qBlPA0OVtL1MWVl2XadBCsNSjYJaE+BUtoVq5n7+8wlp6CUotE7aZc3
	7Qx3Eclt9HR4sfyhOIBCZTSJjYVEkoXhLk8BZkcdN5ctEF3DXM4p6bEIA1ImDMYTXKBo34Vu/Nm
	X29Lr2lZMYKgfDiRRJeWR+Jq3PvqlVAPPiF8QMy049L3KAOK4TBMN2t+m8qGGnyR7UwSoip1mAt
	pO4k5nBBP4Kn50mMqiUgwg90xg6ES5T2JNk4Z6bC4GoCfjnNBdSdClh8o9/u6swfo1lcopzUrpl
	nklfPFuewEYYHIpOnta6CWt3yBeEfG8jR+r+Sxiiyq4wRfIHGvWzKz0XOyVJvznyXm3sQo6VvcK
	tv76vx3OHg4OSv52oBaorMpskWodMA5kJYf36HlCxmA==
X-Received: by 2002:a05:6102:1489:b0:637:30f8:5cd5 with SMTP id ada2fe7eead31-734368cc7f7mr1064091137.8.1782479294972;
        Fri, 26 Jun 2026 06:08:14 -0700 (PDT)
X-Received: by 2002:a05:6102:1489:b0:637:30f8:5cd5 with SMTP id ada2fe7eead31-734368cc7f7mr1064067137.8.1782479294325;
        Fri, 26 Jun 2026 06:08:14 -0700 (PDT)
Received: from KDYBCIO.eu.qualcomm.com ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f3aece6dsm2797476a12.12.2026.06.26.06.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 06:08:13 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 15:08:05 +0200
Subject: [PATCH] pinctrl: qcom: sc8280xp: Add missing wakeup entries for
 GPIO143/151
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-topic-8280_pinctrl_wakeup-v1-1-2ccb267148f5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALR5PmoC/x3MTQqAIBBA4avErBNUwqSrRIToVENhov1BePek5
 bd474WEkTBBV70Q8aJEuy8QdQV2MX5GRq4YJJeKK6nYsQeyTEvNx0DeHnEbb7PiGRhvjHOoxNQ
 2AkofIk70/O9+yPkDGzSh2GsAAAA=
X-Change-ID: 20260626-topic-8280_pinctrl_wakeup-04adde61f741
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782479292; l=2513;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=4OMqDq+6Oe/xsyRMRZ+Ck7GyPJ7TWqOMWavyAzqn3mY=;
 b=aTC7QamSdTJ3VvfHlgyfXsu8GmP1llyATSiBIUZNWxLVLieV9aX1EBbXQpcCBF59JNOsTsylt
 M2gK2zD5258BlhsRWsZeiJGMoyX1JCMS0tyHIJg+z3/oFSGupHxZYuo
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-GUID: XHb9jDgeExdiYB8Hz-TUZkMGzoVAjOxG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEwNyBTYWx0ZWRfXyzTzwgQk189F
 TiDL1RbO7z/aNRwYEYVYTDukgriHDwB0rlRyY8cYWQ96EHpeUDawyxEQzhP9pAe50DMf8QMY/co
 FRf3yg3zdVg8talPldy0zKB5fv8jCAJV0z9fd1hhzhDfF3RK05oBe1UrpyESHGdgi2fsQORp5Jk
 lnhMK1P/AJB61/HteUty/pNdpmfw3DdPf8449uwimN9TEDUilJs5AhxmbmP77NnMc2uG07OkOaB
 9LeQZLBuJ3k37v4mEIsUXKspMRv9wUTJjSsYwrTkTMaOZjwqYXjhtPNRPjzoFgJ1O3mkB35tXaE
 syTDyN8cb7/aL5rO3h2Z2uHPzElLyxG5WLenW1/cTi6ilLJODaRId2MEDNOw7BTEK1rUjEGHRzN
 GQqcqWbN2kCnpmw9zka7jKa+I9ngJqzRbmacwHLJpM8K9EbHVxGdOVsksf3ukBMklGPg/4n7FLS
 4ZAoObWD1xqZc2vaITg==
X-Authority-Analysis: v=2.4 cv=W+cIkxWk c=1 sm=1 tr=0 ts=6a3e79bf cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=fXf-XoD2R4er_McQG-AA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEwNyBTYWx0ZWRfX/aKlgax6SxTJ
 CZ5AKinjEZNytcfu5G8pF9DhX3Nv1gOsmEWp6et1biNEpn0KhmARhw3Li4BO4T+VeUuMpXV8CsF
 EXU483vuqnvGtB/dGsREQsz2GQajvy4=
X-Proofpoint-ORIG-GUID: XHb9jDgeExdiYB8Hz-TUZkMGzoVAjOxG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39038-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD6C46CD4BE

Pins 143 and 151 were not included in the PDC wakeup map. They are
normally used for PCIe2A and PCIe3a PERST# respectively, so they're
unlikely to be excercised in practice, but still add them for the sake
of completeness.

Fixes: c0e4c71a9e7c ("pinctrl: qcom: Introduce sc8280xp TLMM driver")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sc8280xp.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc8280xp.c b/drivers/pinctrl/qcom/pinctrl-sc8280xp.c
index 4056b9fa32f8cb90b6d0b5edc31e189b94f800af..e018bd11626cad722f2e4a142daa0b7f1f4bbffa 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8280xp.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8280xp.c
@@ -1881,16 +1881,17 @@ static const struct msm_gpio_wakeirq_map sc8280xp_pdc_map[] = {
 	{ 126, 200 }, { 127, 225 }, { 128, 262 }, { 129, 201 },
 	{ 130, 209 }, { 131, 173 }, { 132, 202 }, { 136, 210 },
 	{ 138, 171 }, { 139, 226 }, { 140, 227 }, { 142, 228 },
-	{ 144, 229 }, { 145, 230 }, { 146, 231 }, { 148, 232 },
-	{ 149, 233 }, { 150, 234 }, { 152, 235 }, { 154, 212 },
-	{ 157, 213 }, { 161, 219 }, { 170, 236 }, { 171, 221 },
-	{ 174, 222 }, { 175, 237 }, { 176, 223 }, { 177, 170 },
-	{ 180, 238 }, { 181, 239 }, { 182, 240 }, { 183, 241 },
-	{ 184, 242 }, { 185, 243 }, { 190, 178 }, { 193, 184 },
-	{ 196, 185 }, { 198, 186 }, { 200, 174 }, { 201, 175 },
-	{ 205, 176 }, { 206, 177 }, { 208, 187 }, { 210, 198 },
-	{ 211, 199 }, { 212, 204 }, { 215, 205 }, { 220, 188 },
-	{ 221, 194 }, { 223, 195 }, { 225, 196 }, { 227, 197 },
+	{ 143, 261 }, { 144, 229 }, { 145, 230 }, { 146, 231 },
+	{ 148, 232 }, { 149, 233 }, { 150, 234 }, { 151, 264 },
+	{ 152, 235 }, { 154, 212 }, { 157, 213 }, { 161, 219 },
+	{ 170, 236 }, { 171, 221 }, { 174, 222 }, { 175, 237 },
+	{ 176, 223 }, { 177, 170 }, { 180, 238 }, { 181, 239 },
+	{ 182, 240 }, { 183, 241 }, { 184, 242 }, { 185, 243 },
+	{ 190, 178 }, { 193, 184 }, { 196, 185 }, { 198, 186 },
+	{ 200, 174 }, { 201, 175 }, { 205, 176 }, { 206, 177 },
+	{ 208, 187 }, { 210, 198 }, { 211, 199 }, { 212, 204 },
+	{ 215, 205 }, { 220, 188 }, { 221, 194 }, { 223, 195 },
+	{ 225, 196 }, { 227, 197 },
 };
 
 static struct msm_pinctrl_soc_data sc8280xp_pinctrl = {

---
base-commit: 30ffa8de54e5cc80d93fd211ca134d1764a7011f
change-id: 20260626-topic-8280_pinctrl_wakeup-04adde61f741

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


