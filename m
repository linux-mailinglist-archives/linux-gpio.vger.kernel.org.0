Return-Path: <linux-gpio+bounces-38166-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D6AVDMb4J2rv6QIAu9opvQ
	(envelope-from <linux-gpio+bounces-38166-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 13:28:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8273865F76E
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 13:28:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VKa3KD6d;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=a3Oyxx5x;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38166-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38166-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91C393009CE8
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 11:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57DD3FD94F;
	Tue,  9 Jun 2026 11:24:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E11313550
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 11:24:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781004289; cv=none; b=lHA+ZLTfbAg/oYRQGs672HCY6cT1Gvf6kQcPvVNeoHCPMRUgCZZwjcUeGTbxAnEF6AeshfaIZcf8wLUZJqhh6K4getS3ti/M3bKTsgF4/XYXXEFe4WGQx2acUrB8hhmtQH8isjcB0tn4t25Mo6tM0qSCrbAaWdFFcBx38FAACpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781004289; c=relaxed/simple;
	bh=fnLQ15UjlOKxujvQhQUzq61n3AJ7f/HF4EeLPNPiy4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eHbR56C0tiSfDldL3+CXWscdLKH6nEFzr1GmtGHRUQvyphRGXHbGUC8mt/P/D0qAOPqPQUSiLGsuwCaD14CjgGsF/j8jaLVY5YIc4erLCedGAxxQWjODOtC3GI4l5laDXsk8kH3rLGVZiLuo8PzqAVgCBc3NScSWWdG0PJP5iSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VKa3KD6d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a3Oyxx5x; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599xDQU2208403
	for <linux-gpio@vger.kernel.org>; Tue, 9 Jun 2026 11:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C2ZycUM2sF4NHnCdd+yV05hq4usltNMY+o6sDqF6H4A=; b=VKa3KD6d6rPTcQ/N
	DOj2iy76uxUSVU6IyT5NOPI2v5SZgwHGlZZBOVSzebAhUh7oeDy0VnEOhQcoRlUw
	BZ1fsmOGjyo1RBYcl+J3KaiAoorEoscZLyltDzuTynePTMFXRID27LK0vQXDNvOq
	4b73WGx4s+v5c9dnvUTtOfuw/01LpqLBhdzv01dFC9MCi4CoOTF3z+yqAydJtcqH
	Q0xwxtVNit2ODdYsRJ+CsjNH9s267Vruc4kQv+bLuPm/eWZ7OTuvU9G9SRr5afVX
	Z1ZtfSr+uuI4ept107238+ukbdM68qb7W1+x5CO4/m3x08cFbJ21WI9Ia0kpfH7+
	hMTd6w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epee4gx91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 11:24:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a236220so106976271cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 04:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781004287; x=1781609087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2ZycUM2sF4NHnCdd+yV05hq4usltNMY+o6sDqF6H4A=;
        b=a3Oyxx5x5O4LQr/JQF6TFYKcDknuFC28kxOHcTjhlq2QnrFqwCyKewD5fYTBroaacx
         +qrND1rk8eGGkicyaAlbUBbkXn4KtLehxwyBpsWbJrk9ewciWu3WGyHb7Pi9koKcQUZI
         whr/4gYQ1Hz2QbYOu3A55UogJDTrlFhCfGHxXK2muTl6XNJa0oyJ7gl7yhXTv339L4Wg
         3vf61JX29ABAlKoZ+B6BPj9dgzxNBu6D2VtBlme9K3oMwe6MSVEH7upwUkFC136diStP
         bZpG3ONuZonEQqXhj893U4bhUnQW86+zXS2kpcjJttLTGoNypROVTXDM3fDuwaOty2QS
         Rfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781004287; x=1781609087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C2ZycUM2sF4NHnCdd+yV05hq4usltNMY+o6sDqF6H4A=;
        b=UpE+nsl9TC5xKzOOoHXFvWMhXKrJrfw9N+1e6KfeIezMhXJgTEBTu8MxA7tE0X8BvD
         Y0sXVezxZ6WTVPmWMEFXEpgCHE2/7VfGfkla0l2zKHga2mdP+fPiEn6Lvu3rX5s9N5L0
         /9FzPgu0nZQWiXAvHn4OTsQVFtXjMCyWYWq6kIpjyRlZfo5v8hpTjoQnsYdIualXbtWS
         Q/wZFOV8C/vORcUa0R7GGiIJXu8x7nMHyw9rAFc9OKL+O9JEznWMuPrNqrAmsOujRVBh
         vTcsE6JGlOYPjSTJvVMbN+QDOVlpcKTtr27qbgVyhD/wP1imhGGb1X188JHztqSuEzFx
         ozIw==
X-Forwarded-Encrypted: i=1; AFNElJ9x9nYHYuk+QB1elz94jIqS1stSyNFjhPY2aMUQ50Hq9hqMAWW+UICOtfqREP3IuqfUixx+GLDXEiko@vger.kernel.org
X-Gm-Message-State: AOJu0YzvKOXmfHCRISjXrHx9MNgO1TuxelQPUGfOgWD4K9zO5tp3WviE
	3Pq7daTECXXr2OSm1bRVwJyKecpuAQvv/3DWAKqy2ucIBKYl3ySpNDKjdOi98b5HnSfzs0sgBLx
	eR2i64jiey4vdu8hKDIj674CIb5UJIYPNNxXdRL9hpBJ3U5LHOwmPc1la7pbm28gz
X-Gm-Gg: Acq92OFZ5Z34w/WlsJANg9a2/3D9oT4TWvKmrxWem0COaizO9HJV83snLzUkhjHFN6L
	6hEAykKW/Zkw/dc1scKzCkQ76yI+v6PH5SJsPFtauh5B41tCW2xjwDXA3wNT0re+4u78T9zKrQ0
	yq9+Sc/DEANxxzTg8/saCEr2sSqDm1zkPwhGuD7aMq3F12nuRvwg9dyADsOZ/8V9ZF5ABivaVPP
	T+amDefhFpC/DMvie30PzPlqFtVIvrHaxYIbLzBnvu4x2rgc5/kYfQ1x+N5ZR1sGaPKUfDXaTIM
	/CrH10AmsyGubILcdaazdJqCFLtsA1uBC00XfbpDxTH9Z7GGnKhNKUkeNcKEAHEFrDF0OOTTrzn
	BCsv5wL3PhsAQsYax6cxkRVBlSkQ6od6qb4yxr46RQHg1QfnpLnV4djpn9tki
X-Received: by 2002:a05:622a:1f94:b0:517:626b:778 with SMTP id d75a77b69052e-517ca609d99mr31124651cf.49.1781004286784;
        Tue, 09 Jun 2026 04:24:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1f94:b0:517:626b:778 with SMTP id d75a77b69052e-517ca609d99mr31124181cf.49.1781004286240;
        Tue, 09 Jun 2026 04:24:46 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:7c63:2aa1:b7ca:7546])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2ec711sm59688589f8f.12.2026.06.09.04.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:24:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Marco Scardovi <scardracs@disroot.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Heiko Stuebner <heiko@sntech.de>, Jianqun Xu <jay.xu@rock-chips.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] gpio: rockchip: Fix generic IRQ chip leak and modernize resource mapping
Date: Tue,  9 Jun 2026 13:24:43 +0200
Message-ID: <178100427596.130110.2423070495677836224.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260607230504.35392-1-scardracs@disroot.org>
References: <20260607230504.35392-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PIs/P/qC c=1 sm=1 tr=0 ts=6a27f7ff cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jhzgRxFtsokRwiMRIIMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: EzwMsW5B3sw_9_GjQej071Crlt9Rlva_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEwNyBTYWx0ZWRfX8m5qRQ7CmBvJ
 2tvcA2nKavUZq3FQI9ddtPmAjGyxnOw1vUHJAOVHObNhXthFqNqDBJGNWX8Y6trQnmSAskDk9Bx
 h0GkLPd1zPhmG0X6TxQc49+KY5HL1D4wALjPH2xBiHOkqz0JlbHx3jOdjdtB4GRRa42r22FluV3
 i6TYH4C4Fxf7cEocm1cKQUPjh3/wulFhCO7d6KCU80pV60L70JC410HYenAUyE+nvaKCnLKEgIl
 VlM78kjcy4eHqUUUIQRwXxXK/GXWWMpO/bDmueWiVN834zJZ3PXJQq+W3UDlmRgabnZM42gxImC
 xaa7pGbakD6ey/wZNKRLCXTfQwTVrN9cjmZSSb74gOKAgh7YqciV0yMoyDdxvdH1JklUfq7HskK
 D9YFY0lknBvCNRvsI9soUniFdCYVRZvGw6OsN6tuKYxtMgOYi+j+7WIyEpnZa8Pu9NMkRSdvU2o
 rd9YAf58v5Hn9KnhY3g==
X-Proofpoint-ORIG-GUID: EzwMsW5B3sw_9_GjQej071Crlt9Rlva_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38166-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:scardracs@disroot.org,m:bartosz.golaszewski@oss.qualcomm.com,m:heiko@sntech.de,m:jay.xu@rock-chips.com,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8273865F76E


On Mon, 08 Jun 2026 01:05:01 +0200, Marco Scardovi wrote:
> This series fixes a generic IRQ chip leak in the gpio-rockchip driver
> and performs two small cleanups to use standard platform device helper APIs.
> 
> Patch 1 fixes a leak caused by generic IRQ chips not being removed before
> IRQ domain teardown.
> 
> Patch 2 converts register mapping to use devm_platform_ioremap_resource().
> 
> [...]

Applied, thanks!

[1/3] gpio: rockchip: fix generic IRQ chip leak on remove
      https://git.kernel.org/brgl/c/1c1e0fc88d6ef65bf15d517853251f75ab9d18c3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

