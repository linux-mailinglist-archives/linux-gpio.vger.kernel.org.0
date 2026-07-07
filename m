Return-Path: <linux-gpio+bounces-39588-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zgPAGRjyTGqtsQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39588-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 14:33:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D59F71B643
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 14:33:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=acYVmC5S;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ja40+DbW;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39588-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39588-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 96A953060225
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 12:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F7140A946;
	Tue,  7 Jul 2026 12:32:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC1740A93E
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 12:32:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783427545; cv=none; b=YZV3r4Fjp07puyJ1FBjs25d+Nd5kd7/jU2F25UfoKKtRD7RLtbchHCJw3v3wGFDphg4J3vrl3ZbDL01CQD98c4mwtx7xDZuN7KR4oMlu8zypwc629a9uFKLHaUVA/RD+wm/WPNV8Odem01MmoG4xyFoQ0L3Ng8TRoz+KYiZ01KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783427545; c=relaxed/simple;
	bh=lI+b833qX6vvv6+ODNVKHL1LmddnvuOKRrV5gZGBJAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IDTHu6fooRgCrZ+yqhN6gN4lyZN92OhsyIkBxw5QUwGOENc+LmcoU5oaNfjnMhYK8OnzGs9NOtbWaq+TXyO6QfAZpqaOkzIjbuJ+8QoSNP7F/RxM47OPu32T2IXHTnk8scWM8D6zMdZOSdrdKVWRbPcN+MBk98BH8AuLIageT38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=acYVmC5S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ja40+DbW; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8wxc3676770
	for <linux-gpio@vger.kernel.org>; Tue, 7 Jul 2026 12:32:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jb1ILQf4s+xY3ku/EJ+MrqImHfVAMwvxdcXJm3F9jzI=; b=acYVmC5ShSyzHpmH
	ZmcIG1BDFH1zt1NwA3YhCopx8bHxCY/0We17vdzo/h+xjpiy4gz82gcoKb6FBpFx
	kcVsHci3CP3wXhBU5OSdutuChqZTLCuE+iApNpgyHgiafnGOXUlFYYOItMWs3nzx
	7lVrfc17dfJouRtZMRymdsTrIo3aSX1pPO4j69bm+Kdiss4bfVXKfueyBLNdFgOw
	Ry3fOHC+DIZ5Jft3yPTiheB+2TGncKkDNUsk+Hko8LzfmkHNchA5ALLa3jlBmuFU
	b+Om5eTSIZKc0U063MPWWiV/O/vnubXy6cZDmpA3EnLTWxizil3YPT1IkMSSrosE
	H9g/0A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t159xt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 12:32:23 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9692ca167ddso430938241.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 05:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783427543; x=1784032343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jb1ILQf4s+xY3ku/EJ+MrqImHfVAMwvxdcXJm3F9jzI=;
        b=ja40+DbWs5qzfcKn/O1c2esGBAXgeY1jrbyJWReAZeaQzqMsHU9dgCE+wE6sz9D7hY
         034aiSEB9Ma7mWJx7jhWkX8i2YqqbMl8u4W5S6NjYB6em5E/s42zS6yFhH1/A2U4ro0L
         6wLqtCTzphpS5ONlfvoe2bEHL40d1YSZJI9N3NLo8NnZ+zTYLZfSZr+3Em9oIqz7UVQv
         QoV+ztnQs6DsRk9iGk47gLdkr566B8faiBJi/BMSeeUxTz/HJ8wxQiZOxz/0WAbAzC2P
         BOyS4qoTJM9IGv4pq8q57Lh4H+aE5SzrzSoNhBfd40TN1SN9tfUYUWmITEleH9zkz3ju
         GEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783427543; x=1784032343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jb1ILQf4s+xY3ku/EJ+MrqImHfVAMwvxdcXJm3F9jzI=;
        b=RFPs3KpR4g+JR6Pb5TJ3bNJIGIqZmky68Kko45YEK+8Nj9Nw1EYaedDB82MESp8OD4
         RtjzFaExsYZxgQTIAKxWaqqj8fXJ2n3bgWt0ChdEexI9CbMexGkSdieDPRsrX94j2eqG
         Ol68AtkdoPQkfZjq1Su6w5Vin/Wk/zDI13+rskQBoM1dNUfsk74PFlwK5nBzLATYlAoW
         q/rx2tqHxyh/fgheCsFs8Ddlt2XA/qtO8+eg9Gh585VVLcY3AxqBVSmdjGrhS64Lxcvz
         LENzD/8Xa7pABknRF3n1l0khuxpBhkOaBmKbAsG3M2l6e+knCVFV6tstM5QdHNiwW+B5
         Lm+Q==
X-Forwarded-Encrypted: i=1; AHgh+RrvFiBtgseR0+3wyi8iLzMR0Z7dy++0RYSQZnTznIRI3loQBBo7uoSaY3/2dON/vc/k38Ae0j3DYyb9@vger.kernel.org
X-Gm-Message-State: AOJu0YzNXsT3vSa+CoYoqPVWrBdl/dnPsSLdBWR6lRkpf6vj84TV0Qgs
	Wc+akM5zyQ6xc46CxtgKTxK53dIcuuvn9EdPUdKzZBRzJU1H9MPEKvqmkeNmhR/BtLQiBy8NRHc
	OjSbfC5P8wvxJJ96lQJ3IxitNSH3rtdvO6jaxhsxh8s2gSqlTAy981U832EpfCeCt
X-Gm-Gg: AfdE7cn5rDapfLhp71xd+50whWRawsdHfAC/kBHIEMDaIO/pcqT0mv2/i1Pzr72bBak
	/1rtC28GJfdzJGDEwEWpwnEYiykWlu2iH2RqFuXfJeKB4QptalijJ2H1ivpZfhk0p4Oe6Ub9K24
	y+mAXlIRxSxSSWVexPKnX6gUQFy8rZ+WLbfIHRy905otGohoR3K+nr37cLYGN4NsUpDd3nS30fD
	Fs3/pDPZO2Ik1ZmaLDQAh4HVuGXiye9fetqzU3oBKTKSlOwrTs+h8V3b3AYo3x3NK233Jd13/Mk
	kmiDD9Xh3boTzyA8nzdGJcveQldjbD66QNNdhHXqy2iqjNdnt7lahiEG/1ah0P8WjJd6pY8oZUl
	0twxtkX5e+keLVyqMo3YHz4rMzK3m3sJjo+CVHbw=
X-Received: by 2002:a05:6102:3e09:b0:64e:32c3:1371 with SMTP id ada2fe7eead31-744b7ae03a1mr2677199137.2.1783427542793;
        Tue, 07 Jul 2026 05:32:22 -0700 (PDT)
X-Received: by 2002:a05:6102:3e09:b0:64e:32c3:1371 with SMTP id ada2fe7eead31-744b7ae03a1mr2677184137.2.1783427542405;
        Tue, 07 Jul 2026 05:32:22 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:47a8:72a4:c756:37f3])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c61a3dc60sm6377491fa.0.2026.07.07.05.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 05:32:21 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: tglx@kernel.org, Liang Hao <haohlliang@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        brgl@kernel.org, hoan@os.amperecomputing.com, linusw@kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] gpio: dwapb: Mask interrupts at hardware initialization
Date: Tue,  7 Jul 2026 14:32:19 +0200
Message-ID: <178342753594.38477.7876681025803990410.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260705074759.47863-1-haohlliang@gmail.com>
References: <875x2vlpjx.ffs@fw13> <20260705074759.47863-1-haohlliang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Xy2a3dcEJoltD-R8cVjOnnfy2-_tv0J7
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4cf1d7 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=opZqcIqFakXXKrPJbwsA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: Xy2a3dcEJoltD-R8cVjOnnfy2-_tv0J7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEyMCBTYWx0ZWRfXyfhL62vlyLX+
 WKPNzF4EF97iOlc6v5kyUWWpV3mfNH5FPQlgqTEBCC+2xSD3u5l8kvnTjzm+NsRedK0ZLC9Vahe
 JVVeoGcAsbWuHpbxn8JeX6CiZaTG7Ps=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEyMCBTYWx0ZWRfX1cwJGyPi/Ycv
 vJGvydPAUssv3ON9xl3v98mOUkfnmcCmhoTgM+wf7iHoQuWRizS2PBjYaGD1X192W2gR279K/5i
 83FvJhbAFDoPsrO/oiVWymBqJlAaeGwxhr6G2EeepFZQu0tD4BLzcC9LeCDq3pw9qR+2jrHCODb
 YhpF00KoPf/L7GLLf6PlASXVFk7j5WW1LBqHj0d4R84DNuIv1eSJ00HYrH0W0LcMuHWKGguyyT8
 dSfHCrr9NpP1x7t0te15sEBnmbZO8JosPYw8L22u4YZ5/iUJ44z57GSSmrAUaN6nIapStV6jllq
 eiaYFmvWhxPh1xbsUYT97dbeaUqr37bnbsiD55VMg7DfX3o5wOREEdRVr0kwD1uzbIWWOwTyJVg
 abm0lLqSrWzyuKvOWPwcewP1LnR0FsCnbvbUT5zXNuDhYEoOX0acCIJ2t0jd7KGXUII9Calccau
 s0W1PC8TTyJB45e8+ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39588-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:haohlliang@gmail.com,m:bartosz.golaszewski@oss.qualcomm.com,m:brgl@kernel.org,m:hoan@os.amperecomputing.com,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 6D59F71B643


On Sun, 05 Jul 2026 15:47:59 +0800, Liang Hao wrote:
> GPIO interrupts may retain stale state across warm reboots when
> peripherals remain powered. If a GPIO line is not explicitly
> configured for interrupts, this can result in interrupt storms
> due to missing handlers.
> 
> Fix this by ensuring all interrupts are masked and disabled at
> hardware initialization time via the init_hw() callback. Pending
> interrupts are also cleared to start from a known-safe state.
> 
> [...]

Applied, thanks!

[1/1] gpio: dwapb: Mask interrupts at hardware initialization
      https://git.kernel.org/brgl/c/aaf7766ba3b99a3834319e7cf939838afc705574

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

