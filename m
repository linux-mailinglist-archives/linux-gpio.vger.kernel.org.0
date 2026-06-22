Return-Path: <linux-gpio+bounces-38774-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0jXxORPxOGqEkQcAu9opvQ
	(envelope-from <linux-gpio+bounces-38774-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 10:23:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5836C6ADAAE
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 10:23:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=F345nJHy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WSOh5q56;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38774-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38774-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E3613040C9E
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 08:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78FF5361657;
	Mon, 22 Jun 2026 08:15:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3947D22D7B9
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 08:15:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782116155; cv=none; b=WomKdW34B3f2DeRxGuoitedJ6gEJa9c60xv/eSlfCGvtxRqfpupfY9TjhCjlgw4w44GjXnxnDWZafNQetLVTKSKraqT/qVbug9o0uAGfRaUesJCos50/ugt5pD5uxbd8owsVlzRMOVT6AA4mBT2biPUP0HWxzYlIRjK2VL7ux5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782116155; c=relaxed/simple;
	bh=4s/TwsALbjS5yAUk0hJAakemSFCJAmo8oFyciXi3hhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PL7t5s/jFtRIViPAkq+T9wpoEnO9F577DLbdI396VCLsSMHgjtSOTlzp+OHiZOzIeg931zJpAavckGXkjRoDR2/D3B0u+Vfe4qG2Yj6hp46x4XvIDBPAuPrFOnziG/74iOq0y9AWhhj2rZ6PHlxyacpu17k1FdYgFJiDxgTumvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F345nJHy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WSOh5q56; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59MtI2428376
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 08:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xer3efvnRM7JRKikLirWYdXCWDTARVn0C33hEGpCStg=; b=F345nJHyPoGoQCFq
	W552E+j+Xbs66ksvkPcBk6/nwqKrZe5uA9Hkd7JF16mT7f+FBjc4iMwxQuJPOyFd
	CB5/e1bnHwnDlWjwoynrPuz/iibAKbeJM5as0yD5qkyvuGZX5MVh4MDpU5Q9uXpL
	mgL6KqS8Muh+pp6IJLYNenYrdmMPQQ6aYviHkz2qeJqfScNhule3OyUkMbZkpIeZ
	qf6jMvRAY1A+1haNlMxF4xJ/Y7eT6XFLVHZ68II0F3Af7DhzZYqc0X84DyH9hnzN
	wkgHqMjWeiT9EgemjF/1ippVbQ5ZBX7E7n45z9Kq2Tp7tT6GKKR8Wj7PNXEtGBqj
	SWO3Sg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhtsdj26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 08:15:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157f453a27so657846685a.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 01:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782116089; x=1782720889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xer3efvnRM7JRKikLirWYdXCWDTARVn0C33hEGpCStg=;
        b=WSOh5q56iHy3XeGQFcdx1Jh06xesEmtLaaPVWFES6UDMBscXe+RL1CTRcbEHe77WBi
         7bdZ3H1Wlpv107M6qV3dMnv+JynDRioXRCMugCsha6Re5bglqzLbp5Jwyg+1AysoHSE9
         buMq7/6Jec0Ng0Kg/Vm8V/VH4vNlkrIWJQzycHP1eETvc/9vbaEeQOg/IE/wEz86lkP8
         b02BNfkHSschwemcT54H9wuSsAxcP3KBN5AcByo1rSGi7e7C4V7O8VV1FIle7tzmODXb
         74dFVIdaMKw6UCjn7zd66iw/W5Js+lTvEJFQWRHId01V/NK4VQmNSjvOdpQQu8T6Z8Se
         2R9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782116089; x=1782720889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xer3efvnRM7JRKikLirWYdXCWDTARVn0C33hEGpCStg=;
        b=YoYXMgp9CkRJhF9xZnP6Jcgcw+gewBSeseZxqcvxXarAAPseVAA9lkUWJ8fXDE67nY
         NtVKhJcGOgZsmwQB1IrhdOgWWbhMeOe+jD9rHudgnEqi1MNBmME09xR6i69Y/iTnEks3
         e8u2xM4smPGJgKJfupSTMJjns4Tz88nz6Y2rm6MmosrC0Pl/yQiSDGCGOewIAp0ovR6F
         B28hBvrRxGyMUhNn3I3jkRuCwh9ZwNHJB3N8TC4pL70eVODbcGvBdzdOEvLZL5PFqmcG
         pAiasd+YQ+Nf9E2Mubhcq7NQphaN6hNH2Hp2Xqfls86yh0jkMuXZBJA1+BEaBIZ+noun
         0dQQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1YL6N7A4heCcFnU5LyzQyQyv0Mr+TS3VPVY1pYOEkNfoI8CJYazXBV8UBofc1DHeWehgsYEF6vp6s@vger.kernel.org
X-Gm-Message-State: AOJu0YzwcuxfO0s7G6UG0Ra6jyLkm6dMbIVaeHkKz4h3MG3KngWL8iOG
	hWspq2OlZ5AFrvB5vhQ2GlxVkmclSplUQ8QzWcJmgjqWjz4JoyZQVN84KUw5ammfz8GJ9K7zAHv
	u2E8dN0GqgY1W8jDVUk1gOgcAn+g8pkv6eQ8AbHcaCAQg7n/BQwaioZqqKGfQSjXA
X-Gm-Gg: AfdE7cnUiG7+fCEapeNkMXAFD1l2VsYfenDuMnN6IF+7TEkjWfFXbC7teTV6ST0p+JL
	K58blem5GabODONaC0RUYtqP+ezHHoMHqhaeTNw9wlFX7SAQ9BaITLOPfRlIZYCgmw1do7dzYdB
	iIwjD3DfO5fzDYs4hMjpcEnlEOwXxim7qQuEum9Icnj7oIBJZaFRpTXAyVX3vz4RxvnhYoxn3eE
	6HEo/rCx20Bin4XKz3vtaG3WCfcIp5Q3sqHcYQcO0Iw9Z2jRzaKRDuHnb8Cnvk20Q/et1Y3UkuC
	d9dHquhTXaXXNSJeyn85Sxlg9cMRxi26061mUIcc6GynzQPv7RFAuaN8cSdQ65pS3Erof055D6L
	J0g61h+l+YNhqj5JyB+3JuDYLUbd5iKnfFUnkJEg=
X-Received: by 2002:a05:620a:4483:b0:915:d322:c47b with SMTP id af79cd13be357-920d1611869mr1868216185a.13.1782116088745;
        Mon, 22 Jun 2026 01:14:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4483:b0:915:d322:c47b with SMTP id af79cd13be357-920d1611869mr1868213785a.13.1782116088250;
        Mon, 22 Jun 2026 01:14:48 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dea2:c31b:2872:1bd1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c4f01sm25241929f8f.9.2026.06.22.01.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 01:14:47 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Ruoyu Wang <ruoyuw560@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: initialize return value in gpiochip_set_multiple()
Date: Mon, 22 Jun 2026 10:14:43 +0200
Message-ID: <178211605572.11653.17663192557807167826.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260620155319.79994-1-ruoyuw560@gmail.com>
References: <20260620155319.79994-1-ruoyuw560@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0ko_gDKq9UZ_cakGLfZN0jIj_UiqbRWx
X-Proofpoint-ORIG-GUID: 0ko_gDKq9UZ_cakGLfZN0jIj_UiqbRWx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA4MCBTYWx0ZWRfX31UOWe9QSNNx
 HaKexlq3YAPcsyvx5zMgig4WDNV4dElR0siHOZQ1aLGaEcJwv/QhT9nYu55BBPSFHarZAge6K51
 v3bfpLU002DHd2RuwuXXktLZIke+k2FNuzzrIOnaixJzVTcNnTEzr5m0t46iGI5dS7KCHGTmz1j
 KVIHZ7tPYZUkViuTSRo1ePfSH8OKC0OFGdvXJdt1dK1UT4uPlNtTc6H1L41KYYXWoXHPgyIoold
 /Ji0l6Ul703NGyGjweBi6iQ9PJX46T1nUmZMmULrUle/vXGr5Nv3dlLXPXNJqHclbCFfW/TllIv
 rBT4AhlaMkeJ0nfeIuIUllflEOthihygMftzGtPfzBM75aZfA4AlGf4ClYaIdWFyQG7E6uLzlJc
 bgu3BZ091zD6csDSOq7tWW67GRSaihnY3+FKIHOClZo107CM9J/lAQzJI8ODKkmtZgEloifswln
 C4Fc+bMuT1DlmDZ9iPg==
X-Authority-Analysis: v=2.4 cv=bcRbluPB c=1 sm=1 tr=0 ts=6a38ef38 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XxtaaToS4kmm_9hcAyoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA4MCBTYWx0ZWRfX2UWco1cq/6ob
 Y1qz5sy/Zntb15/pL7mbjrYvNHgw8LJYSW8K9Qb+v1CjCkjCADVeBJpDRpSxab8gQrfSuk2bTi1
 HaBeU2IrBQJH78YRIIayJtGn3F35mbg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38774-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:u.kleine-koenig@baylibre.com,m:ruoyuw560@gmail.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 5836C6ADAAE


On Sat, 20 Jun 2026 23:53:19 +0800, Ruoyu Wang wrote:
> gpiochip_set_multiple() falls back to setting lines one by one when the
> chip does not provide set_multiple(). If the fallback path receives an
> empty mask, the loop is skipped and ret is returned without being
> initialized.
> 
> Initialize ret to 0 so an empty mask is treated as a successful no-op.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: initialize return value in gpiochip_set_multiple()
      https://git.kernel.org/brgl/c/99dfa46baba29513d1094c8f30bc86c6ef88543a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

