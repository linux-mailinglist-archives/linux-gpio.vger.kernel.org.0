Return-Path: <linux-gpio+bounces-35318-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBwJF4cd6Gm/FAIAu9opvQ
	(envelope-from <linux-gpio+bounces-35318-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 02:59:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DC98F440FAF
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 02:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08B5D304EA9E
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 00:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84FB41EDA32;
	Wed, 22 Apr 2026 00:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fwhw3Alh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JnlZfOzn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7571EFF93
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 00:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776819498; cv=none; b=m22h1gZ0y5F+FaRnfnmglyBDZ9pYbvli9LdwWeRk+fPIhIC7Ct++7vH29cris5etVyh6WynVWdbxJX8wPDJC7rSvbgmUuHmrtvUXJ1XKOj+ESjb3MdyH4eGrXga8dpeCbEQAOkjj7PJtUrH6FCoCdoU3JPbacF/CrcbYnt3ktao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776819498; c=relaxed/simple;
	bh=0v/cGg5pUVmJiWfDkY0F4IX9flkWG6/oaecceDVh1Po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBuVdI4j34lYyiD6rd8K9u7h6cTlxfh0FMfSo1MNCnEjtSYOwl1xiXfUv9R4hiXvoiDj8o0E7tL7hAsFXZ5uvAKWXRaa8Ii68KLMMNxbMUPph9PmUQyoJCAnXZ5hZpGXtszV4+D8nH+Zxp4ccE8QaQTNOASzuXIEVO2qk9EqEnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fwhw3Alh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JnlZfOzn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIa0NP164470
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 00:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=os7fT3QKhH/Yv1x8DZHj8ydW
	g5CSTjDgo9cQ8O6Q6Ng=; b=fwhw3AlhbUcdovjSX4nEG+a2lO5+IMs6e5hlV8Cj
	1lz/O4wOUJh8UrX8cEVcBJVTHmSW4EPXvCIxoPAfjgDRltKl5D7A7k9FtvyvpJuk
	EECUggnXwJ0lVGFSLx4p+z4NISy8CDD7RMk5sHxyfWAsgC1ATraRfd6nfym1N98c
	PRFVfZDvaTIOIlc5Y2YQVSVQOgjNxAeM8nr2Uuwzi9V3Oqk4OjnjM5Xf4KCTSMBr
	thNlKkzGHcvo6y0vzg4YI9za+V/CF46S07WRBtVGvH7Q5Egq0zppe4zcXJjmOMpo
	nKWwfU89bvaqhE0K0yGC02RvMVmPqECi5fWhu3j7+oHpQw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenhgype-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 00:58:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e423a05c8so23825061cf.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 17:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776819495; x=1777424295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=os7fT3QKhH/Yv1x8DZHj8ydWg5CSTjDgo9cQ8O6Q6Ng=;
        b=JnlZfOznbT5q6eFFyYZOSFgUws44bQkfi0joQbmheWDLt89AO/a+Ap/fG0zPJ3nJgV
         7MORL3YVnE/ExxeEJq9rNXnwq/GS52rW67NW/G1K2UtP77d9rjSLe6glnPbkOEtwyQeB
         8/UU81F1psC9BmYqiT7mu/fJoWAmD8b0muPetLY1GXt237Sqz6ifJ04xbm3Uk7KRDy/n
         jxHZehDjkPEKFV2boGMqbtPOziAmaAsvQLwC3QYDL6ty2CtgahZdIltiSBwzE/AiAZjB
         uEZ8Zny74RPNi8Cg+KBNLLNvaWLO1C1ba+Oe4tYXJdwjBeHkjeh+mwgiJ2KT4szYwVIK
         67JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776819495; x=1777424295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=os7fT3QKhH/Yv1x8DZHj8ydWg5CSTjDgo9cQ8O6Q6Ng=;
        b=T/bwBtVCbMKquex4ZBdLH3RiZ5nW8BMnSW6fVlC/3g8GekcGHpj/5y1NDht/Fx0fEM
         tprAOYM5LQbK2ZCTXenYUUxDmZS4WN6Cx6CybtHWFGhb7Pf44Q2jqjV3r4GF1Jg8tAeV
         G/qXOWts2ofDgxOUfWOz6pZ+Ew2nb9mEEFm668XxUNgeZmY3auvXCaY6NIOqBT/O4nyL
         dDbzF9Ov0pR3LNSApHR79m4V5awQC3bIN+4gqvZuazE29oiwjH49puoutSY+B4GhyL30
         z83dlqDica8deRpVx3nSQ7rXsPhHhDcoFgXW1DNvF1nIoqKLZKbvdnEC9+wIVTdvASiI
         DEZA==
X-Forwarded-Encrypted: i=1; AFNElJ+wivQR6zD23ng2C/s+J+e2ATJTC97i/Rx+Mso6mknNCw4e6D1SebdoZNbuI74aLX2etut9axtFKRJC@vger.kernel.org
X-Gm-Message-State: AOJu0YxOKPvOsBrQ3gB/+3G9RvjtNuf7+3UxKmLJEP1MCZHS9FxVu4ai
	th8WCr+P9p8OPVON8c49ti8o2PkVywGYDSvh6p8oNCg0K69v2qye6gs6n4jXwK3h5XUrW04DNVR
	PaCRQkcb7I1Ix2Z+OWs5v6VIYNtEqTtJoMGZ166ww+pKUOhIpZ1KONDSwzVLq3cs7
X-Gm-Gg: AeBDieujWy0/e/jD8hj6a1oX4My1D0hGn6D5ZeYtYdhOZwA2yrCmqDvrJqd0yRljKx6
	dgADXHWncMCo0IzAdV/Y+7Fbju8WjNAsk490amuugllflZOi79r347BJ8/lTgs73vgQsnbIuLYJ
	p0yfoJtGdplyTnRRHBhvx3kUxbGLyz81Nvp7ThUwXCfrBQWB0BqoGYAZ9c6PL9Vi0qLJXZVFBqx
	z71lx+VGkrFfo4VDIiSB1JYKvt87kpjDLBaWW312NkmYnR4TdnPJTJiPloGYCOHOMtE5gvnWQuS
	x5ho5LBh0z9YLRBTyJOP73qkEMSpXSfDbQGb2I3eOnKzqCfsX6GTRt7SZq0a+tpCwgq+X+TzC4Q
	oTkmtdDOge9TjFF422+HEEqIBnx2DVxaHIMWZIakZWFVm34/OvZtigFxO3rkUw7/aRv1GxyORjd
	v6Nn+4Ojts4KZN1HAs/oVGste6TC2JsIgGOVI70moVBCbqdw==
X-Received: by 2002:a05:622a:5ce:b0:50d:987c:8174 with SMTP id d75a77b69052e-50e3661c13dmr256709981cf.4.1776819495274;
        Tue, 21 Apr 2026 17:58:15 -0700 (PDT)
X-Received: by 2002:a05:622a:5ce:b0:50d:987c:8174 with SMTP id d75a77b69052e-50e3661c13dmr256709581cf.4.1776819494819;
        Tue, 21 Apr 2026 17:58:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7a3fsm4007411e87.59.2026.04.21.17.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 17:58:13 -0700 (PDT)
Date: Wed, 22 Apr 2026 03:58:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: contact@alex-min.fr
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH 6/8] ARM: dts: qcom: apq8064: Fix USB controller clocks
Message-ID: <56tmjiwx3xepxky5nqiwhqvgivgwhnq6bdm5lcvbkydnunrpip@blaaof5fn5s5>
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
 <20260421-mainline-send-v1-sending-v1-6-bcb0857724de@alex-min.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-mainline-send-v1-sending-v1-6-bcb0857724de@alex-min.fr>
X-Proofpoint-ORIG-GUID: WzhpT_8UwwN1k0k6qJZGIDv53lras8EA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAwNyBTYWx0ZWRfX5Xp6qUpbW2fj
 MN62WCD4KxkLhUj9heooMlYJnjaZX7ywq3LxV292Ime81Jui8dHqc6hm4+gS4KvJ7hsIrGC5AGo
 EmWzuWRMKkTt9HB02s77ey5P7H7ttIc/PmOXZErDuG88rf3vlGC4ZmmYXNEaLrs3jDLJnhn1m7B
 tuP0xS6BdQFwdODmXJLeUk5bXacfeXr8wJRxT7E9OC77Hp1GzjZq7O0mIXOCuFqv0mJfooZNHKi
 6w5/shhVEhQzriUtFo9oyYa2heaNN80ZFgUIaHKWqaMUZtLloQ0eaAH/rLVQSTMkJj4qI99QoxL
 GeHccbFCegUSxNm4UMN/uUozBuk2mCTW6pb3UYUe5T78JRZCRuKnIG7HSTfrSJGNtMaAZM/v5c4
 BtuLA5SfxWVLl1mhS0+mQC1DYUvDyZsSaF4k9jthGlBzHdV2YCk7exdhbwZK/7+tRTQNhpfZSlS
 YD9phvOKf6sa9wuWtqw==
X-Authority-Analysis: v=2.4 cv=WKJPmHsR c=1 sm=1 tr=0 ts=69e81d27 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=accKExrkbF7l0cSrD3IA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: WzhpT_8UwwN1k0k6qJZGIDv53lras8EA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220007
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35318-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,alex-min.fr:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DC98F440FAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 11:45:12AM +0200, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> The APQ8064 HS USB controller nodes describe the transceiver clock as
> "core", but the ChipIdea MSM glue expects "core" to be the controller
> fabric clock and "fs" to be the transceiver clock.
> 
> This mismatch can leave the fabric clock disabled while the controller is
> accessed. Some boards may tolerate that if the clock is already enabled
> elsewhere, but it is not a correct description of the hardware.
> 
> Describe the RPM Daytona fabric clock as "core", the AHB clock as
> "iface", and the transceiver clock as "fs" for all APQ8064 HS USB
> controllers. Without this, USB does not probe reliably on Samsung Galaxy
> S4 because the fabric clock remains disabled.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

