Return-Path: <linux-gpio+bounces-37922-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aHJpCUIuIWrQAAEAu9opvQ
	(envelope-from <linux-gpio+bounces-37922-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:50:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 085A463DBD9
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:50:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZraZkiPW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bpf7JarO;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37922-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37922-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D82BF307CA04
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 07:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3CA239768F;
	Thu,  4 Jun 2026 07:48:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7066F37D137
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2026 07:48:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559305; cv=none; b=lkz7II+9+xWM1w30Hb0sdLsfpZqsGxbDJacsr2PDHk7XF1Opv4qZwJAhLy1S61fzxKONYqmodzDq/0xwd9E1nFDaerr80xkaRrgNBeI+9W8rlvOPFNAjgmh0XjkLfFewbLYyqErk5K6Fl87ZJRrtWV8ONGo4pPaq3y17sNaqoZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559305; c=relaxed/simple;
	bh=3UJaGDPYbZ1JaqrSIzeX1UM2MbPe2j9y+FGu4gyQIYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y0OtAMZUQW4PnxnTso8uLN42lqz+RrIWV1bVWRA/QdmXmCe1qhMg8M5JOZIaJHJ/gjb/AxA+4jSjBNwqkeFWLkLT/8FolDAe+xtNgD7NEQGsj21FIGI32rXvgnVESzoswB3D3RCwWNiqgiDUjsrXJ2bsBCVVuRLJJZsYxnB+srM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZraZkiPW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bpf7JarO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6543vodq1993483
	for <linux-gpio@vger.kernel.org>; Thu, 4 Jun 2026 07:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fv6mTBjlb3IQtd7n1vw4JF+ZAZxmbONogukGoQoIQr8=; b=ZraZkiPWbUZHKd2Z
	LXylEk1bGPOPbocE6VlXBc9fSYAEQKwJTbZwkTJXcYKLzuugLBN3gpLZm3DGjoVS
	yGS5OKWEWJZZaMuYPgWl848Ci1zu7dAs8gOW6VXjnykN33TTRkA4Y846RRBVlka+
	wNPfVDO5Dq5qr82SB7TyseLCVLiW3+1B3KQbG6a4uh2e308i5vDTMISN9a9exf8o
	75wzdWYKWIHfEnfxJoAzYM7pozzko46d1DQM7w+cz+GD/rVqrUHJzVBKCCw5NMPd
	r0jQIuYznBDU+kDdzJP6EkjDH4vXrY5fe20S+njaY0HYSzklr1QS5WxeXv7A1Wuj
	1ZZerQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs8ptjac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 07:48:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5178bcab15bso5372761cf.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 00:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780559303; x=1781164103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fv6mTBjlb3IQtd7n1vw4JF+ZAZxmbONogukGoQoIQr8=;
        b=bpf7JarOAIhb7nwuDnfrV6n3z1JXn4S6A0YzV+ruNrpFVykoJs14WYomX26Ewu2WC4
         usIUzcsoFeyB8Sv7EtFptge1q1PoGw2eANsfVjEKHFkY4OuKRe+KChBHiXMPD1m+LJKF
         ZNm6lZeCQG9TWuQDPCroPGO+N56BwFVtnh9ewJx338IyTUmqd43LlGZFSD5/XS1ygqnW
         CfL52n6mYSMuqHvViP65sXAqeRVBLYn8bxYar1xaO2Rw46feIQQteehA1tFwoZTaepse
         5x7GxImIaMK8Eu0t74QhDDmWx22xgiBZKjlCYG1PDzHI9kCVDHO7cBHOEgH5hyraILWl
         Xfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559303; x=1781164103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fv6mTBjlb3IQtd7n1vw4JF+ZAZxmbONogukGoQoIQr8=;
        b=Hpcmb+D5k/fW3ovfJEyGIV5E4QFcHbU5bxYBRbtdtcVmDMN5OtRKnWmiqHJU+jljK1
         /9jnM8n6AUdHWJlyNCrUfgdakS8An2g0fLVMtP7WMXnoV272wgBl/WId9Ou4w6OaMi3Y
         A5bUNEwL/TmZFBGOjDBU2Gk+9v+TfHhJmFDG3f7fEn/3fyK25M1yOZxZwxchtAhUBzA4
         eQR5J906uRh45Gx6gta1uPzDmrszDDCw6RAitDlfAe1wJ/ZRvROo+L2Ih+Obu72i70Ly
         8I9xh3Whqiu1faWx/Qojq4ascOKtZLmykZuRbqlkvFoA1stbQ6RSl6LGcDdwgW1iJErN
         Re0w==
X-Forwarded-Encrypted: i=1; AFNElJ+bCv5803yA21AMH52zBarnHh3ZMZjx4Bctu+Eeo8+9dcW3aLNMivHfJc/sIUxlxwHg837Ok+pTS225@vger.kernel.org
X-Gm-Message-State: AOJu0YwOwSNMyRnqDuacSlr+Jm1/eXwxyRS2wf7HamdCfRT3ExHerh8t
	N5ZYYC+/PNEj7oFJnTL2aPnhrCbUbwT9uTE+/7cJ3Jymfgs7tbCDb4OP21PkNzU2B8MmgsXileD
	kIsND4AWYVDoM7O5C4SZCXsvNUy+ZwS68vEtJ1kFVb7IxnkiNJMia55PwNsxKw6Er
X-Gm-Gg: Acq92OEOiKjBfI3nJ7y+YvQH82ztLcuIQo8vIA0A6FgCI57upORzvt1L1ezboQX2RsS
	mcmln0G2gJwUnAXX3g1SJlSq5hdqkdGX635hTgVR+LU/8mCJ5sp2TLc0+b4sFht6URCYmX0E1BU
	GAUJUr7WA1pn1RbVrIsQ+9sPVxRb1B6xYSuYH9JB5cNsLFfkOayJMJ/a0ZBLSgIDiEWzatasA62
	SnPCdoY4en1eQFlhWVpK6DCzFbnLBz/zJq2rB28W0byEGcLrQJIGOzHTU9p/dbSfewskaSIy3lO
	Byh1xRTwRcClScemYBXsT8a8qlBwUE5Fd4h9IisbKCk5KB30PoRdKzrQBEPXPNGgnZLWvS5kjxB
	HdnXziuUM6MC+qVfCoSJ/vtG+92V+PhCHPAMfNahYBjaIoinDhNeudddWLqiSd+qiyuKQY8o1s0
	JqBowq5zY=
X-Received: by 2002:ac8:5e49:0:b0:517:6350:ed47 with SMTP id d75a77b69052e-517785d1a14mr105628141cf.5.1780559302730;
        Thu, 04 Jun 2026 00:48:22 -0700 (PDT)
X-Received: by 2002:ac8:5e49:0:b0:517:6350:ed47 with SMTP id d75a77b69052e-517785d1a14mr105628001cf.5.1780559302388;
        Thu, 04 Jun 2026 00:48:22 -0700 (PDT)
Received: from brgl-qcom.local (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7d6b990sm71092725e9.2.2026.06.04.00.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:48:21 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 09:47:47 +0200
Subject: [PATCH libgpiod v2 04/15] tools: gpionotify: use the
 parse_config() return value to advance argv
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260604-pre-2-3-fixes-v2-4-781bcaf47475@oss.qualcomm.com>
References: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
In-Reply-To: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3UJaGDPYbZ1JaqrSIzeX1UM2MbPe2j9y+FGu4gyQIYA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqIS2tHGSch190bFohDYVTd9a4J+0bcS3725iEg
 LVlTj53wDOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaiEtrQAKCRAFnS7L/zaE
 w26iD/9aYHPNvt4QyKYwDuQm/i8O8sjYtgQE7MlVB3LFn43GacAr5sS4kqJI4I8hNLy7YgqK7FD
 jtJ0DiWeMAVsKbrmqTGFRUezy+lNMkBX/IFD4/BFZLS+6Ux4uQdSgm2tBx4UIV70VTiWJoNCJo9
 AbnMw5VAoCVtH/aTWJ+qxvGbD+tWIFqj8MU4OyXLn5NOT8OEA6sgAz+NYINvqeVeobBoXBMKeIB
 zbx0wLNtFKVKuBjhAKoJSCsAU67j03cjr+SHezusI41AVn2nCcWXqAcKuh9f9x4WVToqemydeO/
 U1IalI7EaCwQDlqJiDEZbejFj3ahwj7vlPY0u0+XQRiw2TldOf7ifMmPaCy2mf2es1C6EpdoSbH
 guA7n8nlJEjzXP6m0MbOiMMQ4DpekHSuEnii8+vbbWO/cilye7cfG1xQgC6MA8p7ZQolsVf4VLh
 OLilx01EuCGFb7uNiUOfDy405AvWhbwNHI0kjNcT172sbKQQYWgAHhkS5aEbx291ucIVOsWiT16
 TCsiqbsConMwQbYiEbyd64CxOKfuyNXbiyHXnYZNABRvjoLOCtfBj8hFJUgx+agsuJCcQV3Pb2V
 EVAhbBTHzmZBNqPLHDgftjOjFloCAp7wlRzyiOR+VDzabvTurN5uMb6DFJxIogKUm9+kC2gcJuZ
 jJ4GN8VuIh/LMbg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: WsUJgludUCJaKR2n64bvy-MW_9ebUzJo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA3NSBTYWx0ZWRfXzNXP7/43KHuQ
 VWadtHM15SaYJtcGG/ldvPTZWBJ3Lhq0IBmteDTBXI3XQtt02f+9qkPklaKevb7xX0lXlVKLK73
 NjIiSflp55dLtknNnnOYG9x/S9TwFLuEvyuyFOXmy+iSQ0cfPR9TViumwpJUG5mszBo6ryeKMxq
 O74304CbFEINiiAear+2mPWiKuUNSwq57YP+5bMDkhDGnqpApPBT+AEsrIviP6n1ge9rxBMsaAO
 oT9wVcYvyHAM8MPzICWfawPlMARQSDDU6Z8gnq6mM4GNYb8kT3ahynZOmJ7WUWE3Aw14iYRhvmN
 WxZ8bhdiRSGDNi+OzvmYWe5Al3JeNrq5HzJGUmgvux4VXioqMkNkhRzJSYJQTcP3TmUhu9S4RS/
 otYm/NdMoJFgzeMXCAPfhsUi4OobruPGeiQSwaKTrg1JFish5Vny+lD8efWRMLpG/k0LQv8dFSP
 TdCK24qN+PnYgi/2aGQ==
X-Authority-Analysis: v=2.4 cv=E779Y6dl c=1 sm=1 tr=0 ts=6a212dc7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=3W9sBVhNAAAA:8 a=EUspDBNiAAAA:8 a=ou9Cb6IWRw3oyDx7vFEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=38sOm0jhF1M2KuwyeTFR:22
X-Proofpoint-GUID: WsUJgludUCJaKR2n64bvy-MW_9ebUzJo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37922-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:warthog618@gmail.com,m:erik@riscstar.com,m:viresh.kumar@linaro.org,m:vfazio@xes-inc.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,xes-inc.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com,linaro.org,xes-inc.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 085A463DBD9

Every other tool (gpioinfo, gpiomon, gpioset …) uses the value returned
by parse_config() to advance argc/argv past the parsed options:

    i = parse_config(argc, argv, &cfg);
    argc -= i;
    argv += i;

gpionotify was directly using the global optind variable instead of i,
which is equivalent today because parse_config() returns optind, but is
inconsistent and would silently break if the function were ever changed
to return something else.

Assisted-by: Claude Sonnet 4.6
Acked-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 tools/gpionotify.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/gpionotify.c b/tools/gpionotify.c
index c45daf1e5f0ffbf24e331eb2633d3a54048af0f1..a45685f22ff73b1e138ddcd662f35fc8df5c0755 100644
--- a/tools/gpionotify.c
+++ b/tools/gpionotify.c
@@ -383,8 +383,8 @@ int main(int argc, char **argv)
 
 	set_prog_name(argv[0]);
 	i = parse_config(argc, argv, &cfg);
-	argc -= optind;
-	argv += optind;
+	argc -= i;
+	argv += i;
 
 	if (argc < 1)
 		die("at least one GPIO line must be specified");

-- 
2.47.3


