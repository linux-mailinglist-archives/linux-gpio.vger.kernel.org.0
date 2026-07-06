Return-Path: <linux-gpio+bounces-39500-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gy1dCGCQS2pgVgEAu9opvQ
	(envelope-from <linux-gpio+bounces-39500-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 13:24:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBA170FCCA
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 13:24:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IlXGC5K2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="B/k1pl54";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39500-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39500-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57E853464316
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 09:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7303E92B7;
	Mon,  6 Jul 2026 09:03:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E553EE1EA
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 09:03:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328628; cv=none; b=PfokYjvEXET7m6PWi6sbGbxaqgC6z68GLEfrUi7yk3sTEQoWk5WcVvfsr6yS+6f/XHuV2AbVgm4gIpCvMf2mqYG/QmpRRZfas82bK8+DgfQIgrC3Pk3pyxPqBPpirAcxLjg9XqggyR5Wzsg1Auvozq33ECXgtspqz6bpHokKvPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328628; c=relaxed/simple;
	bh=2yFtuP4uolgk6P6sMJciI+eJU85KzFMUV0pG/C/hxH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LCmp7r/mnt0jQVu712IWfJ8CldoNkplbBVyN6oMkBUmfGdC/5yCxP57Y4OALlgcT8u2SMwH9I4VlXsNjm1tSidPfnUVP1jLvViifJ3y4UowtUV906i3hr8ZBf4/pH4gCJtPpHrfJJLmVKv40PLfaYVHhogvM1GWznE3h5lraV5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IlXGC5K2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B/k1pl54; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66684wme4006757
	for <linux-gpio@vger.kernel.org>; Mon, 6 Jul 2026 09:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LcZou8yJindkdX/uM+YTZ39Lojw6W5Ga1aU4638LE5s=; b=IlXGC5K2iQNLKl9l
	cSly72ZF9ePOiX/Ss1akJplsaWNkadeYVyEx791uidhfCQjW9TYKqo2kQvk2No6l
	TqWmz/XbPbRPdHr2Mf/uhJxNDdXN42Qz1nsC1MngBifCcr0ZVEehOhLoD1k+F4ih
	8BiX3acJM+3ZlbsUBmwPntg23ld3ywXdVamjrSOo5E7GyhtwsteXq4BaGjTYX47c
	PqEz5KkYukQhEwmxOgzrFEVdOKdbwTtdR+nCotP8vmigzBrd79imqqsDmkF0lNgt
	01/r2ceAu0ev3OJGe7FPWSPkCLIALFbcpetiROjTBiRIcMJKileMvPa+r5w6OMGi
	lpi30g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs88bw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 09:03:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e4f27f49bso211068385a.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 02:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328619; x=1783933419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcZou8yJindkdX/uM+YTZ39Lojw6W5Ga1aU4638LE5s=;
        b=B/k1pl54CeHxLCZYotXzj+b163oGbn5xf22jAwmpNpCwz19s7trJSgcJcfpx6eGYeP
         kDxEodDNZ1jmebHRinri6XKVQ4Ji0gMrCGdqwEF53lQOD+Hb/tt1q0gCRRwF669vyS9d
         3EqoT/zGcPScdyfp+hbICuCCtop+EE3276Uq7V+xmF/h59rB0ZvEQm6F6b9LTGoQTBB4
         K63vHEXw6qGjNn2aKWWiT43OGiyw83zYid6p2RXdCO2LvyZIgX/538hfDiTKgDZ1iCl5
         AWgGB6H6HZ/MllTwao4SpxqGgKFOz19h5/8ZxE9YYq4JHP7x4szXM+uEokZ80t82TSoN
         pLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328619; x=1783933419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LcZou8yJindkdX/uM+YTZ39Lojw6W5Ga1aU4638LE5s=;
        b=VnYGGwH0o+MaeLlGmy4XGqPsuqQez8ztkN4Q1nErcSc4r8JgCH6eqTvw+8om4BgX3P
         k0Ap+vPqADvxytX/1NkArWTHQab2KhHoFq+cXMtRq+UEn/3S+3TIyi0xXezapWcqh9jv
         HGfpEpyZNUkWgWljgXNOhIQIt6YAL2/WW5QkONquM2ONgfKR+8x8zk23oykmZAvgHEAW
         CMAFQwPxYbxw0S2YDUddDtt0uSL4ng0RRjhBqtqacy4upIJZNxZHCylj/4yEjC9ApzOc
         fI1z3nK1jaG93EK+qk3BFD1ai3hlyWjH/2t5AA9ck4aUi7TJ9DijkgekkSJ9EoKtRawf
         73vA==
X-Forwarded-Encrypted: i=1; AHgh+Rpz4p7wkqpDufuYg/rmyKOaJAV7U5xYTmnyP1+tDPfklAlsWsbJyFjqNLc4EyFgvje48+6TBUceB02i@vger.kernel.org
X-Gm-Message-State: AOJu0YxoSY7j5CmDaAzidEvChyjv1rQblmVULZB0qzRLCQo3bkOh/U3F
	dmoLQ1S1p+Q40Zh/IAGgDU1aGfkqEIyTep99mS/pUpc3kzz0qazzKn4+3spR7Tv4uMYFHQ/TYJW
	UPaZy10iGOT5hWXiUbFuSuxt6JGLYX1q+6vIh1vpRPxGhXhwJBM1+K8E+zqW7Y0It
X-Gm-Gg: AfdE7cnY0MQMeYTuPCDu/w/V1Q3F98wKSVrqFPUDHZMskuygje3NVyakRdQC8cJhV4M
	YTiFmPt0mG08I5nFxygooqZJLWjjHIyslNZZV3uzX3VvXaJQVkuY2CCOucEQDmB3AZkYjZZRmWh
	chZDVbobwD3UHvE3pYcnLr8MlE6A+1W2bcZA7zpmnMmWC69VM2JqxWDL9y3uo2+KQFDcWqA5Fb5
	4QvoAWhKAN7V3wtzyCET42HxR6dDuBk5ARwlkDdFeLfbIdV9cvWCJF/aCGePqJMCb/wwezYJt61
	5f3ci+6uqc+m553ANqhT9c049z4rbFeXEM8veiqnjguyjkDJJP2kSr2lwlqs5+8ff9uWC19xJ0P
	Tw+BrpoB5/MQGBVt1JFoOItqH6UnwrED7cZuaHCs=
X-Received: by 2002:a05:620a:44c3:b0:927:a87b:7abc with SMTP id af79cd13be357-92e9a48e73emr1194799085a.50.1783328619079;
        Mon, 06 Jul 2026 02:03:39 -0700 (PDT)
X-Received: by 2002:a05:620a:44c3:b0:927:a87b:7abc with SMTP id af79cd13be357-92e9a48e73emr1194796285a.50.1783328618595;
        Mon, 06 Jul 2026 02:03:38 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef23feasm326998025e9.2.2026.07.06.02.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:03:37 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>,
        phucduc.bui@gmail.com
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: cdev: Drop redundant nonseekable_open() return check
Date: Mon,  6 Jul 2026 11:03:31 +0200
Message-ID: <178332860255.18708.5813708689955494780.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260703020947.8010-1-phucduc.bui@gmail.com>
References: <20260703020947.8010-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aW8L2EiZvc_LggOncQrUuqtARHUWPSXi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfX5PE6SPdMui91
 lfPfoi503l7QI/vCyeSqnXRDlo4dblRfnjKDXfDXRUXqf8x7bPLk5W3BlasWXes+5g+8SkX2OZ8
 T3r6P2bBRLz1SepfrIkpeRw8fdCGwYOVq7x8iPyZcJT2dqRWhxRSHKOmk+pqTeboyxpDQXi6CRF
 tp87Wz5klcrsO7ir5kpjU02kzd7N5VQszzFfCf0bh1kRv5C+wRuvDzlZ0D2DvzJYlxIdCMjprH5
 UeMCQR6vp6a0QNmSelhtSzI47yGtmigGixKZoNYDJpio7499LVk3totSmUTAqJLoWbSCCa8uTvi
 vE0lTDsA//1GZvRVI4trXKP9jNmiHHF+FAEwbVFNv78JAmeJQEiPkG9IgGgASNSm9SGM0/dACN1
 mk/lo2V4VZMBVsa63SOtPiG6+ytZcTLxDOzZ+sjfO9SnjwWJrFP3L+2cqlEi5dhMekrkdRgoM/r
 w4VGRuaZh84HBy036FA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfX5CY4S2D6IA+1
 WqhibFKc8Fq5Gaf5s0pAdgPmbodE7sMjQI6krvrU0hqbPxIYXcvycSZsjcGID/VS99D0SN1o65J
 LmU1b8u28BMpTq/vsY4JoGZxdImihig=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4b6f6b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=rZ2YoADrP8nBYB8rJmQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: aW8L2EiZvc_LggOncQrUuqtARHUWPSXi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39500-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:warthog618@gmail.com,m:phucduc.bui@gmail.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phucducbui@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6DBA170FCCA


On Fri, 03 Jul 2026 09:09:46 +0700, phucduc.bui@gmail.com wrote:
> nonseekable_open() never fails, so the error check is unnecessary.
> Remove the dead error handling path.
> 
> 

Applied, thanks!

[1/1] gpio: cdev: Drop redundant nonseekable_open() return check
      https://git.kernel.org/brgl/c/44d75ed98ddde54edc55e9300bb70ea9a7c62f4b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

