Return-Path: <linux-gpio+bounces-31288-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBp4IJU9e2mNCgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31288-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 11:59:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 216F9AF4A1
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 11:59:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E2BA3009087
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 10:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B123859C1;
	Thu, 29 Jan 2026 10:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EQyjb0Be";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hpUsqDDW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42F3340295
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 10:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769684370; cv=none; b=g+z83/2xc9jZYVs6ezEm5fCX3ybKMGUbba7Evwz8/0X9YUB57W9bguEpxhSmAlTQHtpHIXsslxQ/Q3qIxr+OE8SgaTdhE8IYC4VjNxqdQD2NgqIPn3jb8t2kOhptaJZoepkVlQHOwXTO5cf+XvAPnchA+o2YjllhBD/LmfEh0bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769684370; c=relaxed/simple;
	bh=4ZFEp9VmHn9X5nm2JYDp3tmIrZL6+S5eERUFEhD63PE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlefLNAsgSM1J0Kreirsig88PBLK3MJ0o/ovScUUCGpJ/dRJkMprIahPe79Im8lAkpaG9Wh+KfAGtsvF20PUOo6EyZMTji1Y52SZs3W80WUNTyf3FWij3f/mSyEKc5yAkCwYsj8E1T74Y5i2+ZG5eXjINT72WAhq54bfzA9nt3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EQyjb0Be; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hpUsqDDW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T9s7uv2060079
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 10:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NoJe03w1ue4m/+oib/nWttjy
	gth9T6Vgc5MTYd8xNvQ=; b=EQyjb0BedpLhpSDTNqwmukLOfGNmCZvewmtRp0qG
	6E1sjiL2JZm/tFBsDX6QcXnsco3aIRG8CVqsXqwtZNzjmbYjEj+Pmc8rVMi7nex2
	VsuGHpp/mjRUG14fFN3JbrhFCm5WQBh27vM1AfIKwR839gEuKt0iMaRn7Um7G+yU
	YVQo6bdIFatSfXyjeKDxDoqxUil7KWTUan8jC+979XG07SPFPx94hKW2Pjck2/Mh
	7gxps1QD10RRHnk5lo2sUjXlKVxXSAzjs/Hv5vPDr8HpaLZXAzzVvXmgG1UCjDre
	uDyYNX5zELuEr6wsyTdtVXm2rrNG1iksmWYU0/voQRSPMQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bypgrk4bk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 10:59:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ef98116so163694785a.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 02:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769684366; x=1770289166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NoJe03w1ue4m/+oib/nWttjygth9T6Vgc5MTYd8xNvQ=;
        b=hpUsqDDWfh51Cmm9fQf2MeMbWPiDfC7l5iQ/WnE/i56v32f3NQAHer4O4CLhSbydce
         2k7PLCxfblGlLvtxsdUN9VlidadnLrgIK6UFAA8uhGvmNxOvQPmD8fG4wiLkXXelHPaN
         5ipRJIz3vkgLJuRpYNujCKgFH4+UP5tto91g7x5h1664m8fhKW4xjRd47khKtOnlTSJY
         FjSscc4uD2akCCAioFXjuFJtyLd1+sNqt4mzOk5Twhg7AdnaVQmewt4qQK1IjFiijuDP
         pbxwfO8LqvGmaF3fDhlcpYjCIbEMPCDrKBop2L2elDfSn8iHG5PcGQOkle42KedfvfvN
         tKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769684366; x=1770289166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NoJe03w1ue4m/+oib/nWttjygth9T6Vgc5MTYd8xNvQ=;
        b=nDGZVdluqKAGSPsDdurETG5dfNPtU9iyWesrFnAKXvNOZbzvcqwBQ0m6qL3RerBcm2
         DXrTuH6veLKQllxemalPsBkj39vYVxjTK32t7awWdXfGh667UKWeG4Mh0u9LTTrw4ES+
         4oTBhjuAJhrV5KdMOh2VKgKlZm0WXZVuHUv0XPNei/+fEjqKyFvF96gJY35cGbXIFp2O
         FXHwTVvZ2Qk98rt7wELYagB6U+7lEnEnKKUQZEgR9tnboNlHojRhZSebV0R9s2DFqX97
         0+NXzHxQn0a2tFWE+oGwnHIGKD9bANDiMX7R57JA7+BGJ1c8VyQvKJcZjeO7QE/cGzUo
         9clA==
X-Forwarded-Encrypted: i=1; AJvYcCVV5/8d1YdyrUd05lEnR3/UShM1SXxg1ic/Qc/UJLNmITO8xRiV0opQiezCCgItBng8/dyeryDkqX5f@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+kAo69rLIMym9H/WdpIArOK7jmx1RK4BQTeSo8/QPWMP3BJ/A
	avufZzDhnv5W8I3YkWkyV3nVFwZVaY4IOE60X91TmVoT73XXf3sl1WXIxCxgSPF844AEp6fFS0t
	t0lah9J6lvytoM5ep13n99gLepixsIDtz1jlg/xCYC2wGSEWuJat+7BlyYpY3p+1e
X-Gm-Gg: AZuq6aJCaNPgbphAugUyt95W0I9FDp0ECMj7tnoKaXFqAVRcRNRdFmwdLlcOgipXBgI
	dWdpz/b8SpL/VPgYXRQj1e+vKXGlqvCQ66BUFRylX7DEsqvgRSn+VVa6IO8bKwsIfhGYQutc2c+
	7Ry7S1HRHCzuhCF5Xq7h1HHIL7gTnX9+YtNOGAxsRtO+uKJuDpxwBlDsrh1T9PNF6sI2ox19jCo
	cAUzkkNyttamjsdjHokl+vPJKQTte7kXOfWh7xVFb0EQWVpgpnPoJH1nRXbUlPz5pJiX6FcXwcI
	G1fItrMUDHm1R45M0Kn+gFlUGrqjI+LlYgEXGC7YqM1/xfNTO4UT183iOubXGRt+W0Mx6+xOMAj
	Ns/3FB0g/RDTfSKsWtNxIFs6R
X-Received: by 2002:a05:620a:4104:b0:8c5:391f:1db7 with SMTP id af79cd13be357-8c70b9082b1mr1017573985a.64.1769684366106;
        Thu, 29 Jan 2026 02:59:26 -0800 (PST)
X-Received: by 2002:a05:620a:4104:b0:8c5:391f:1db7 with SMTP id af79cd13be357-8c70b9082b1mr1017571385a.64.1769684365347;
        Thu, 29 Jan 2026 02:59:25 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132356dsm14498219f8f.33.2026.01.29.02.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:59:24 -0800 (PST)
Date: Thu, 29 Jan 2026 12:59:23 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: document the Eliza Top
 Level Mode Multiplexer
Message-ID: <yhnnlbvcqgtaseoiarii4rfsmiem56hxsiuibf3kyux5ftebgy@dhkhij3qq7sk>
References: <20260127-eliza-pinctrl-v2-0-1faf78efdc2e@oss.qualcomm.com>
 <20260127-eliza-pinctrl-v2-1-1faf78efdc2e@oss.qualcomm.com>
 <20260128-hot-camel-of-acumen-eef9f2@quoll>
 <5teqin7wl2n4spyqrt2glyeaxe5tm6zgk3tmzs2nhj4xedurrp@um3y6enwt7iz>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5teqin7wl2n4spyqrt2glyeaxe5tm6zgk3tmzs2nhj4xedurrp@um3y6enwt7iz>
X-Authority-Analysis: v=2.4 cv=d7T4CBjE c=1 sm=1 tr=0 ts=697b3d8f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=ORP-x1qtNI2ya4drUPcA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: TTb6W-cx1RP9FWG5uem_KwWyY2NZkHPu
X-Proofpoint-ORIG-GUID: TTb6W-cx1RP9FWG5uem_KwWyY2NZkHPu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA3MyBTYWx0ZWRfX5QfWZjIrfgJ9
 LjjmhcisfLgSoFSt2ENKVjJH7jtp3vyQGF5D1OdJrAu9d52I9V0qdmT+fT6u5Q+/rY8veIiIVd5
 x0zxz3xk2eIZ6CQetr8NM82M82Q5N2pSZXp/M0jwUuwzlPN4JLei2cegNrdT8xsFkPTG2qf+nvb
 RpBtSJAvi2jFCcqzokhP7CMz4NiaLDuiJLE+vX9UZ9ZTNXW2PFqVkcBc7DJbApwljHCnGf1vmhH
 aINgL+2tztHc9Rw80WT9UUyimPlNveWCO0sXm7jl2WtWk+j4in052Sx29U/p5WYTUTtob7b9nr0
 Zc4MsqYV/POyGtuik7gEaQef+0xT0RvIRCZ4bwEGqGZZPXnNYFYpZg1uUkPLImm0ZzMtmYjOJFn
 1D/u1BP+W4NU60ZAu2RDbO5a/u87cXoVNJNG45grxnRGvDz5nQc2lARL0C8Xjr2fQn1EYCNsgVa
 EzdyI0xAqkEl4hW5/sg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290073
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31288-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 216F9AF4A1
X-Rspamd-Action: no action

On 26-01-29 12:54:49, Abel Vesa wrote:
> On 26-01-28 12:38:32, Krzysztof Kozlowski wrote:
> > On Tue, Jan 27, 2026 at 05:47:36PM +0200, Abel Vesa wrote:
> > > Document the Top Level Mode Multiplexer on the Eliza Platform.
> > > 
> > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > ---
> > >  .../bindings/pinctrl/qcom,eliza-tlmm.yaml          | 138 +++++++++++++++++++++
> > >  1 file changed, 138 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
> > > new file mode 100644
> > > index 000000000000..d8b6591caf57
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
> > > @@ -0,0 +1,138 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/pinctrl/qcom,eliza-tlmm.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm Technologies, Inc. Eliza TLMM block
> > > +
> > > +maintainers:
> > > +  - Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > +
> > > +description:
> > > +  Top Level Mode Multiplexer pin controller in Qualcomm Eliza SoC.
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: qcom,eliza-tlmm
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  gpio-reserved-ranges:
> > > +    minItems: 1
> > > +    maxItems: 84
> > 
> > 93
> > 
> > > +
> > > +  gpio-line-names:
> > > +    maxItems: 185
> > 
> > 186, your first GPIO is 0 and last is 185.
> 
> Wait, are all of these wrong then?
> 
> $ grep -r "gpio-line-names" Documentation/devicetree/bindings/pinctrl/qcom,sm8[3-7]50* -A 3 |grep maxItems:
> Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml-    maxItems: 203
> Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml-    maxItems: 210
> Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml-    maxItems: 210
> Documentation/devicetree/bindings/pinctrl/qcom,sm8650-tlmm.yaml-    maxItems: 210
> Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml-    maxItems: 215
> $ grep -r "UFS_RESET\"" drivers/pinctrl/qcom/pinctrl-sm8[3-7]50.c
> drivers/pinctrl/qcom/pinctrl-sm8350.c:  PINCTRL_PIN(203, "UFS_RESET"),
> drivers/pinctrl/qcom/pinctrl-sm8450.c:  PINCTRL_PIN(210, "UFS_RESET"),
> drivers/pinctrl/qcom/pinctrl-sm8550.c:  PINCTRL_PIN(210, "UFS_RESET"),
> drivers/pinctrl/qcom/pinctrl-sm8650.c:  PINCTRL_PIN(210, "UFS_RESET"),
> drivers/pinctrl/qcom/pinctrl-sm8750.c:  PINCTRL_PIN(215, "UFS_RESET"),

185 is actually correct, because ufs_reset doesn't count.

