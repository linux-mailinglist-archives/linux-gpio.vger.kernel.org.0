Return-Path: <linux-gpio+bounces-31285-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDxgHOk9e2mNCgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31285-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 12:00:57 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0C8AF4F3
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 12:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96175308A421
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 10:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB94C381710;
	Thu, 29 Jan 2026 10:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="To0rHE2A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aJIuGf0H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10150385510
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 10:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769684096; cv=none; b=Tb2/If5ngB86giG9z5sBTOzl2LaGql2opZLCzfkqVzCBW2IgXWGLdxg+j4pHWpNJvZbdpvixQe7P/tyRSTJmcYR/GHoFAhVI4SzalSOdt1TFpC1CbAkD8EaKJAsyJuvyYWngsBR8i/T2lgPOwlDHy78Bu+9blAQED3F2I9OScPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769684096; c=relaxed/simple;
	bh=J+dP0AxJw3pI+AJLitAJMc9OvyN9OR/pv8XWEP9zq98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XmDRdvCVzEU6QP/PABOErwQzE3cTt+9BiDt0MDkS6xaXvUpaG3qIbZYHUxPotLmU5EJQpQy0h55JRRUVC77HQLhPbnfVhn2/mKzs0tOxxxgmCfV8Yuj9vYJUIlXL6ukuCUi9BnSRx1tLx0tdbJNhSfMeA/WmwmHpxs+/CTZkWrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=To0rHE2A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aJIuGf0H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TA8gKs2059988
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 10:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PYd1sgxgq4YQopdlvkOWp9x0
	TTzr1pENIM9ZmwHhcHk=; b=To0rHE2AI9aHUSkY++O6h/8cbuCaW+weJPRVkYIm
	+MlJ3GMuCk1CfshIqVOrwjrc/OT5mvoUhyabjH8g4Qx514/NNU4+/CZAZ+mLXBWu
	RDo+Pytg5oj5WdsDwgxl3XX7C0ui0h88cRV5/+F63E7/GEiq8GRRxoqVyFb7gDEc
	sJphYgNmkg/y7Bo66XOvULvJSQ27KzxFuh3U5HdL3tBCBszk4+KqZkQExUlIgBsK
	a6SIvAvfjlQc0gaO6elzqyFhzIwa+fffKWKxoBTqC0DekYAEZtlbF7Vkm18bJSaC
	vdNs0CaAH0soXqSXmr/WRCSq6uu8XxDCeu9g4QHo5pE5ig==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bypgrk3ye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 10:54:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70ef98116so163152485a.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 02:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769684092; x=1770288892; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PYd1sgxgq4YQopdlvkOWp9x0TTzr1pENIM9ZmwHhcHk=;
        b=aJIuGf0HB4SV1VylvI0GIWOueb9+MPcoZa8NbkjV0jgiEtorAYi4PXK4nSzu7iitVV
         DEqpJcmFP766f07FBwvuasbCs3C4graR5buJH6Kf5CIvmI2DsEd7MFxZ8AVP6c7FWe4F
         xnvZ00cOzzDBymBMkRLdrM8IZ6qPIDyk/ZiMdRm1McvxKTHrpJ2e9FCMJZvAK7XC/AEC
         CG2DxabBhSSR8yw512Ip6ZWNn7axUdHaBGxK23BTkb/Mkh6KOwIaO1B9qhUHwGMZfPRn
         jV57qLC+Uiur7alLtcx3yMkFsQx15I4/PKunivj12ygaF8H42p+ZczngaqoKBK4GPXUE
         fvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769684092; x=1770288892;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYd1sgxgq4YQopdlvkOWp9x0TTzr1pENIM9ZmwHhcHk=;
        b=dA8rxtf0kVOB3yBbNClaQubpR4QhS67a/xvVQXFkyHu1IF1JewXlajZTh5yUqWIagQ
         XbrqOatOsnN9Uxu82dEtp0g+eFpvf+Vs32b31bBie1bvEIRpoWq6RDirm4AowYUZ1KtA
         voWzjP+WOhVqTxRzzlPfiwN994OhAVEryyQuU/kh2DBdi7U43/D9hZF7QGwoMI97DFco
         XR6t/OLwgCgSEnvpLO3igFFCOQZpXVJ4TT3IQb2//8syjY4AMxC3LsGzyOKFPvJEPz9i
         cN7tJ+Cm0f5R/6ulExhmFhuS5bTw6kN2Ej6fWpx6HcZmpXp3gvRhaDjI5ZyxyrHtPuWO
         4t1A==
X-Forwarded-Encrypted: i=1; AJvYcCW3f2GIAdIZm+00p9mpku4+zoT2S9OcrS7RmI87zsHt5ZHLW/9kWHdqnk3FsZQZy3F4fzKLYaln3/FU@vger.kernel.org
X-Gm-Message-State: AOJu0YwSyKCvogAeIHug5NGPnSyn2DuIscS2jXne2vkmZONYrzukRb4u
	zJsjHOdNT2kiDc/ohtE9s07PMK8JdiuqJZHYeCkYWQfcwtbt2j5+1V4UjYk7/oobh/1iqqs16qg
	HplSH0P/ngxs6EUkEmMT0TUsagD+NRfkm0E1tfJ3JfwzsOGlhl3N8d8xH9AwTkOMD
X-Gm-Gg: AZuq6aJ/Xy8jwJkHzyA5Fo9ggHKJfAbhVzT452vN82ALWFaU4d7OifuY3vS2EBf5GLb
	a7BKipNkyXwiWj6bi3ooGL+lqLfVh9cCkvXKa03YU7ZoW7iztABVQoOpFFDRBhU2SaN3sleYw/p
	ty7Kf7yq/0fhC1XoRAmEspNNXxqQqtIW5wxSkcRY6YDfpsaL/cW2D+46/fBbaZZe47mgjMrsrtU
	wcJHqAAV7DipnxoAHEVKkWlH7VVxUCGMZbDLE5U1GZGydEA54TmZeVibCaRL6iZSaoRZZhYN6MJ
	cHgyVAtQ3SM4lZr8/hBy/Qj4N71Q739ZYKOHNrdTfi4SG3PFJKO0Y5U9kZzb52o5gwvSETeK2V/
	3PFI1ZRBSdB7c+m6suSahYrlI
X-Received: by 2002:a05:620a:698b:b0:8c6:a5bc:8a80 with SMTP id af79cd13be357-8c70b86da64mr1082939585a.29.1769684092198;
        Thu, 29 Jan 2026 02:54:52 -0800 (PST)
X-Received: by 2002:a05:620a:698b:b0:8c6:a5bc:8a80 with SMTP id af79cd13be357-8c70b86da64mr1082936585a.29.1769684091503;
        Thu, 29 Jan 2026 02:54:51 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c42895sm194143605e9.14.2026.01.29.02.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:54:50 -0800 (PST)
Date: Thu, 29 Jan 2026 12:54:49 +0200
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
Message-ID: <5teqin7wl2n4spyqrt2glyeaxe5tm6zgk3tmzs2nhj4xedurrp@um3y6enwt7iz>
References: <20260127-eliza-pinctrl-v2-0-1faf78efdc2e@oss.qualcomm.com>
 <20260127-eliza-pinctrl-v2-1-1faf78efdc2e@oss.qualcomm.com>
 <20260128-hot-camel-of-acumen-eef9f2@quoll>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-hot-camel-of-acumen-eef9f2@quoll>
X-Authority-Analysis: v=2.4 cv=d7T4CBjE c=1 sm=1 tr=0 ts=697b3c7d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=55AYietcDXYNTgL_VtoA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 0_JbcoEvTss2EG6-jU6h-m3j9APuO18Z
X-Proofpoint-ORIG-GUID: 0_JbcoEvTss2EG6-jU6h-m3j9APuO18Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA3MiBTYWx0ZWRfX0suxKpzbm67z
 3ZWATRbR4EjyMveNXpp2wM959uxFILi1QcwNh9Xbjc8/4q8/Ax8PKKOdeJ5lTR4TBucLo8k5zlL
 aH6WBGWGg6Ig8vF+Q7Mx0IECIfLSaKqfOtJJxvezQ6rlxJ76WFrVsoDt5LD5l24YYsdOo1Kqyiy
 T/F1hXF/osk2gZYrPwwmtRVWWtaRd2VgmEUMDXWYotVMYQgsOcSMdoI92fCN6ymqdbKrtf8Dx0S
 f+B5i4ImohO92cnc1rGEBEMr3aCLW9DtIYhx+/y9F6yRuI1kgL8m5jM2LRyGSsYatvbB/msxVHO
 m8HWvkNH4XtRe/6mzVcBuTjbt/TMOEM/roPoJYNejVs/3wzFJs6kGpRj31ERQFagy5t4OhmHamr
 AojMk2xxpk1ACaAHibKvMia7PhQRgC6/RLVFNJEF2+WIDiIOmdj0SKAHSiH4eWu1ADQW8MYNSs/
 104TFBHAiUF8EKxUx4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290072
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31285-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,devicetree.org:url];
	RSPAMD_URIBL_FAIL(0.00)[qualcomm.com:query timed out];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[abel.vesa.oss.qualcomm.com:query timed out];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0F0C8AF4F3
X-Rspamd-Action: no action

On 26-01-28 12:38:32, Krzysztof Kozlowski wrote:
> On Tue, Jan 27, 2026 at 05:47:36PM +0200, Abel Vesa wrote:
> > Document the Top Level Mode Multiplexer on the Eliza Platform.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  .../bindings/pinctrl/qcom,eliza-tlmm.yaml          | 138 +++++++++++++++++++++
> >  1 file changed, 138 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
> > new file mode 100644
> > index 000000000000..d8b6591caf57
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
> > @@ -0,0 +1,138 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/qcom,eliza-tlmm.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Technologies, Inc. Eliza TLMM block
> > +
> > +maintainers:
> > +  - Abel Vesa <abel.vesa@oss.qualcomm.com>
> > +
> > +description:
> > +  Top Level Mode Multiplexer pin controller in Qualcomm Eliza SoC.
> > +
> > +allOf:
> > +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,eliza-tlmm
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  gpio-reserved-ranges:
> > +    minItems: 1
> > +    maxItems: 84
> 
> 93
> 
> > +
> > +  gpio-line-names:
> > +    maxItems: 185
> 
> 186, your first GPIO is 0 and last is 185.

Wait, are all of these wrong then?

$ grep -r "gpio-line-names" Documentation/devicetree/bindings/pinctrl/qcom,sm8[3-7]50* -A 3 |grep maxItems:
Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml-    maxItems: 203
Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml-    maxItems: 210
Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml-    maxItems: 210
Documentation/devicetree/bindings/pinctrl/qcom,sm8650-tlmm.yaml-    maxItems: 210
Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml-    maxItems: 215
$ grep -r "UFS_RESET\"" drivers/pinctrl/qcom/pinctrl-sm8[3-7]50.c
drivers/pinctrl/qcom/pinctrl-sm8350.c:  PINCTRL_PIN(203, "UFS_RESET"),
drivers/pinctrl/qcom/pinctrl-sm8450.c:  PINCTRL_PIN(210, "UFS_RESET"),
drivers/pinctrl/qcom/pinctrl-sm8550.c:  PINCTRL_PIN(210, "UFS_RESET"),
drivers/pinctrl/qcom/pinctrl-sm8650.c:  PINCTRL_PIN(210, "UFS_RESET"),
drivers/pinctrl/qcom/pinctrl-sm8750.c:  PINCTRL_PIN(215, "UFS_RESET"),

