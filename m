Return-Path: <linux-gpio+bounces-36018-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EaKEg9Q+GmQsQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36018-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 09:51:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B031D4B9A6D
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 09:51:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4871630045BA
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 07:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598F730FC12;
	Mon,  4 May 2026 07:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="om1ukDul";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TduorfoP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F5930F7E8
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 07:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881100; cv=none; b=KztZ5hVczki2bo4Aj+9U46KJhc3MOlwaVcfWjnlM16fY1TV2I0gLC94T4/3mqYqqym9mMaLnuEvznlHsQ32OUZ0xDeRgBpyd6I1OlsPOu6Mj93mwqaQXe2MwH5j+6nCxZ+o45Ud/kMdiWh/4PMNDv5tCSSIa0h/vPQBhDKFjJjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881100; c=relaxed/simple;
	bh=n8DY3/IA9EOfLbyHfSz2CexuCFWmEtdPDNfGwiomWig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gGxMn1mevXsqUViWP7HJm0mpXdQusKlM3wPvYKXynb4BBeqsTJEjzKs58J4n1dDWNeHsgFrGUeobtYcXUoy35qs6IntVg9mtFJ9kteQhUKk6fThVGB6QRiMLUXm/xBLO4CXpmpWdV1AvsOgKN2MhWXlVG1VrWnXxGVZY3lpEvOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=om1ukDul; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TduorfoP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DD46098075
	for <linux-gpio@vger.kernel.org>; Mon, 4 May 2026 07:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RUQz6Kh5TKwBt4a9C5/JSwsBo6rj7eJSev0MAE2ja3M=; b=om1ukDulHqIg+v0y
	0+MC/251o2JwnpBl848MbhT+8/aSDfdFGhVt0jw4Ow1xmmK8+GEds5WLhPr/CcUv
	tzEWev35QfbVBiKfLzALvIfwgy32xkvIRxLNuN+Yy9xKBfLQhPm0gK1VVX2zH4so
	kly80dQb17/wlYiDuxngYtjyfHgSTsp68Fl2eZ792Jn6s8EiKCjmxi21+5nikoyx
	eXCvuuhk9ulWluRlGiTa/N8tbYyUgMsuOJGKRY+l1sSB9oPPbJmXXCayTjnahiB4
	yaDK2oqNZ4BIlJHhwGoXnVNLwlO8r7trK3KyvupJI1zPd/xvKL8fArgHEvlNgeQD
	bysziA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw8kg4uf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 07:51:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e423a05c8so101910261cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 00:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777881097; x=1778485897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUQz6Kh5TKwBt4a9C5/JSwsBo6rj7eJSev0MAE2ja3M=;
        b=TduorfoPyZbiPxwUCp+lki36fWoMr2aUnMTnXFYqlBzhFlsTdIceowbOh1RPcqvJ2P
         3q7SKEldiHIX028wS8IBE32YOmUvUyllC1st7Mc9vOajroSyANGbWo58RkgpN2Iwv0QT
         K7uqwM3B8fhBKxV6G7SXI83J4Nvdf1dWwmR29MY/Y+h227BKZ3WnTi2Swj2awPKZKyNC
         HkoAUWz947ohidAySCMYG469ifRKZGJIeMqHKO3whuLrhCNhGnSKO+bDygwPdYGORpX2
         jjnWZOZBmATdQm0JYsE0IxuYSZupAq8HQe7ApbPFkXW5s8YjDNbsH9vYyKAmFiOdWlUL
         Yf4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777881097; x=1778485897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RUQz6Kh5TKwBt4a9C5/JSwsBo6rj7eJSev0MAE2ja3M=;
        b=pyW++1t9tefRVLgKrg4JA08quIRbkurixcRqgddvWhdfTgPmpXy/x36ZYHQb5NUR0D
         1V4k2BldSop1h7LIdlI7X+eaeSHWBaH2C2WKISb5bCDsL31d0sTEA3h2zbb6eT4SXzDe
         pomS/UXehmI05+595VnFBX9QsQxURLs8gqa5rFVUOp7jyJFfhDjE/uPDH72q6dJbI//0
         vDm/98XAC9cE0G2VzX3Cptt2+Yrqv3AbHW6zSzlvmb1BC/6Ywwiy3cybE2kGcVsf5W3Q
         HGdfDn8x5TK/HMn/TAKpBNnrXGySvzqfqw/Bhcr8OJJ6F+IB765ICdfH8T7UGVH98vdJ
         MHqw==
X-Forwarded-Encrypted: i=1; AFNElJ/QIhqCXu696u+EoaIY9ADmCIPaL12BwvZaf/wJXyeM9+o1yIppuQALo3u1R0vRtpjd++wEUcR6hKxs@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl0f0uATVbhTmrYMLQUw0bO5HHkOWeqsuQiwqh7ECJU4JO2AqF
	6yY3+t6clqoguiJ5D8h4tYdwLk6b3HfXhQdrpR+io0xQBeJHmjbFueLtvF1VSUv1lHUy4IYFzqW
	4wbQ1CCFc7g7u+7YAYm9o5AL405JttfTOLwGqn/5/QFtozRLRMQ9FjJ0uNIQIsW6F
X-Gm-Gg: AeBDieutwfBqQWYKEsGcXby3ZVWUwyx9HuB59APi0qmKi9ph2aFubalaOUAHkx9Z9CA
	rCmxEgJ25tjjIaqG+Vjet+tMC6D0iTwTlnjv7SI8VZOOGx9kZXjXfJRi+j+kbvD+q+Id/qet0V1
	GhE1cJwNvAzu70J8B+LJKrXvggGP3xBVdl8k6CdEtJfMHaRVvUNyoeV3o8y26G3Zy41frdFGl1F
	scGYB/ek7ac+eraf0WeQ2mmBpm1chzqcxZny6aMHgobdc3vCYZgZyfRfq2KU/ZiPIZCP0DIMQod
	RQ+DZqfFKUXdlHrLa7R/sQkfoM0MGEtccuAi5IucfFqpL22cUJZn1AKV5f8nlUCwa4/OqlNCYLG
	HNA1ek40FhmssBmY+u/aEuYhBLf9/6glojT0OZoXKYgjVjsyia3DMgPOpwvZW
X-Received: by 2002:a05:622a:488e:b0:510:45cd:3939 with SMTP id d75a77b69052e-51045cd3b6emr134910481cf.5.1777881097233;
        Mon, 04 May 2026 00:51:37 -0700 (PDT)
X-Received: by 2002:a05:622a:488e:b0:510:45cd:3939 with SMTP id d75a77b69052e-51045cd3b6emr134910301cf.5.1777881096817;
        Mon, 04 May 2026 00:51:36 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:a516:9647:7dcc:c214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a8ea7cf6asm24173718f8f.8.2026.05.04.00.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 00:51:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Vincent Fazio <vfazio@xes-inc.com>,
        Kent Gibson <warthog618@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Wierich <erik@riscstar.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod v3] build: replace autotools with meson & ninja
Date: Mon,  4 May 2026 09:51:34 +0200
Message-ID: <177788106810.7109.2991129628800999509.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260428-meson-build-v3-1-8da6976fb0a2@oss.qualcomm.com>
References: <20260428-meson-build-v3-1-8da6976fb0a2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P8sKQCAu c=1 sm=1 tr=0 ts=69f85009 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TlxAkGapChN2iRxPzegA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: zdbl1foMyTg421iqHCgF1I4iKJHOeZLs
X-Proofpoint-ORIG-GUID: zdbl1foMyTg421iqHCgF1I4iKJHOeZLs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4NCBTYWx0ZWRfX0rWyrv1mDbRl
 cvV4agTX9htzMRDSGtn9zJQBfXv/a3QFYrrJHvelrK903Nqee7RRPc2y+N8k9OtqsHPulBUK65G
 JhOM9gNQ1Saa7r6SAuBUOEQiPJpS97JPTimnM/5cafjALSnkMt/HCGgFxowQRGCEMY3F2yG9e7H
 LuUexYKAsQoJdazuL7dH/D7/sofBN32Pfh7bJ2Pzd8g10TE+YyJdDH8mt2L/WzBZSvoTz7EH00R
 FnMdIu9toG5RofM49HURVMllasD0et91g6EJD6rTQlLe2WdiM6cc9xb4tKvWpJ4xIp0kQLXLaFv
 S4zCj2r0GEOsQtgz66nRMLFFWU2z5Lk5ABfi3XZh8BySqJtV2xMPIWfNfmGkBZ6eSZeL/gZe0IF
 7Y1z3Sj5QwwoneitTFnzEzuG1yy443/q7e5e7XDgSrGrLNAUnBuGd40YBlXXViLN3dPEV4738ov
 t6y0yO1+EHiGFFHlxUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040084
X-Rspamd-Queue-Id: B031D4B9A6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36018-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xes-inc.com,gmail.com,linaro.org,riscstar.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On Tue, 28 Apr 2026 11:08:34 +0200, Bartosz Golaszewski wrote:
> Port the project from autotools to meson. All build options are
> preserved with the same semantics.
> 
> The goal of this change is to produce the same set of files as the
> current autotools approach: libraries with correct SONAME/version,
> headers, pkg-config files, GObject introspection data, Python extension
> modules, D-Bus interface and configuration files. This is done to enable
> a one-liner test command running all available test suites.
> 
> [...]

I think this looks and works pretty well. I'll apply it and any issues can be
fixed later in tree.

[1/1] build: replace autotools with meson & ninja
      https://git.kernel.org/brgl/c/97bab4cc87ddca0e4425ec384dd4fc1f0b8902a6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

