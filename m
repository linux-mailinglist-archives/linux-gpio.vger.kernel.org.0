Return-Path: <linux-gpio+bounces-31251-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCqLNu5Femn34wEAu9opvQ
	(envelope-from <linux-gpio+bounces-31251-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 18:22:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57115A6C55
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 18:22:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23BC93020EE8
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 17:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83069330B3F;
	Wed, 28 Jan 2026 17:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jE+SG7tU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E2kFdDze"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9062F260C
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 17:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769620953; cv=none; b=WL7i98tQKhGHXC7rGnUWd7XSLzQVwCoEaGMxUkP9hgh3jZfmYRr8H76Uy/MEtkFlWCciwN9APIkvijcv2MwpxBPZqCrvbKkkxNWJjbMPONRw6i6KPxHqNyqDpjwRi59roqrrxUhuNy4hZMim7lhy/nWQgzxjr5+lPcxQyVL41vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769620953; c=relaxed/simple;
	bh=E9Xj2lxnS361NI76BlVqnkRkZkKnbzb4k4dW5EKSukY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FssIRUc4ob9NYBj4LdGkGblW1HEN9n1IKVMDYjq/mwwzCi+m6J3GeNw093qN4+MR9zYco+ocsHkYAlug/V0y5U0axoLBGB5DOShRmteuqpkUy7fU4DtmWtEwvYEeQH2GpaidUij9xO1m98cJ/NuoogGdMDVl1Tl/P/BY3cIIc2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jE+SG7tU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E2kFdDze; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SH4FPf1407636
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 17:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XpBXhAt3FomOuUH5nhF3KASA
	2xX++XudCERvYumTHIo=; b=jE+SG7tUnQ8SJW/ZZd2KIA/9pRbaYg5ANjaMev93
	zdDfOyiu1hw36Dq9oSySyyWGpaQy/Kl6OebZt7AfHsyRXKyah1T0h8km9qmgYFnY
	JU/ms2TdaHoVXIWhoaRl8TUvYpVAvSC++y5cR0dvuTGIC218IpURFsFUAGAe1j2h
	LMzJrzcDqVAmB2zJdYOjzpLw6v1YHBwUVlRlm3rfUHyjphyX2LD/O7cAoG0/49z7
	5C/3D47OrvSEV+L26IxuC20gFBP9k0RmIXe/UUfWMJbU7pJEtcJh2qA4T6PK5YKL
	B2ytB7o7tIeOC05AzFXZsMO2F6oGs0MskGyCF9414+ipIg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byphgg2hq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 17:22:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c5e166fb75so31956685a.0
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 09:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769620947; x=1770225747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XpBXhAt3FomOuUH5nhF3KASA2xX++XudCERvYumTHIo=;
        b=E2kFdDze8cUh8oZI6HTDnoHhwL4lBerZIVZ/O2ZBuAJYPVYxItZ4iivUQCQ2nJC1bZ
         v8loF+9QH+PHvgfL3guKBd/ZzED4+1PCyv9okUF18iz6cwDuegbI6EnNmA3nPihwZazN
         P60akcsuWA/Y9QJ1vw40UcaGkwUDsf4xogG2NuTpu9TgeFhn8eZBt0qxROISt4x3ZHMQ
         Q6jhgLT1ySP+OGZ+wV0cw6FUnXqhNl/Yt+Pgl3usHfRJVejALzF5NyDpIqCUzGSl2+NP
         UI/0aP7a516MT/azBb4lKVGfZ8pmWWI0QbFvhOQE/cNSImNz0kU920U5QPB+Qs4OMgAu
         khQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769620947; x=1770225747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XpBXhAt3FomOuUH5nhF3KASA2xX++XudCERvYumTHIo=;
        b=rqVleNI3VjON1F+DBh3T5EH+aDZGR6HkD2j3mFCrRHyvdqT44V25TFu7ryuWkm5lkx
         UgSMF0brsv/7oQSPFaKkxKBSwASOZXXn5UKVtaM54gZAnzGU+da/7swIWBk/Y86KNXBt
         KM+4tyk/8yn+gjhNxs5bW/G7X0ARtwpyp4zTtU/cYBGIv6VAHbXMXCJGn3faIczTod8i
         qcgkNQalnCC8hDGfSON+jtEYHF2+eQXZvvqlyTg6W7PU8MEFCqojIxH2QVxDs3s2paEZ
         mI+qVsFeWpxD8Kh/cjVgSqG3dMB11jFmwDBNvZcVta84NedaDRKxx7euMfEoD+Makm+5
         3dhw==
X-Forwarded-Encrypted: i=1; AJvYcCUJef8UP+5FYVh90HHweZAojiEUfj1RhLAye7pNncMDoWcWQxISen07iViTS2OBJfcZ82wMq3oitfGT@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy23aziCbvdRL2+XyW8SKeWMTavvMoN7KZSApODPhLNhCQJzXB
	ODqIQ6rOrpqvqxCReB/8VLHdi0ZIMz0Jsgr1bD4YX1u0Yv3T6r3JT+lqBJWVCGSzvTyZZQ17dvp
	R4pSNPy/trDWoqbzz3iMWgtPQyTPngs1BV2TJq1YuEJPWTa8/YHDI1bWRdH8kr0JF
X-Gm-Gg: AZuq6aKVjIeaGE0IXXcDIgpA3Y/Ern5BVoBJoEEn/prK0tJRD3dUO3MC85+d/eXgmSN
	Kp3xepoC8LoARZIXGK3YD3budM9+1ms1lFC2IAOfzQBohFI6ybQJcaQfN/yNQLtVTJDrZIp3d2D
	1rbCQOZeNo1LI+DgZ9CEYkXQV1EmRNFxSHLOdXFO9CbH1KwjSBHl4fBQW/w6Z1yvU6EGbppeaaZ
	I5RsBJBsojwiuqKbUNa5ely+llRQtZL0NmummTfe5sdGycRXxH1SYFNe8RflKy0w2PrmGS/3dzD
	qiq0RHdTMF+4j7R+5ZgDnZBfBo0ZqN+pA1Q2lD2qhdIzmIA0eP5316zAmeUu5ROCUwZ3HtnKJ1r
	sGbisXlwXTPiICaTMgi1HxGhT
X-Received: by 2002:a05:620a:470d:b0:8c3:7e55:cdd9 with SMTP id af79cd13be357-8c70b90a02dmr694136685a.76.1769620946816;
        Wed, 28 Jan 2026 09:22:26 -0800 (PST)
X-Received: by 2002:a05:620a:470d:b0:8c3:7e55:cdd9 with SMTP id af79cd13be357-8c70b90a02dmr694131185a.76.1769620946102;
        Wed, 28 Jan 2026 09:22:26 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4824sm8996607f8f.1.2026.01.28.09.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 09:22:25 -0800 (PST)
Date: Wed, 28 Jan 2026 19:22:23 +0200
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
Message-ID: <aizrc6xysfwzygdsfeuc2raccq7efmwg5bn6v33t2de6ugvzgi@z3ipf3i25ulf>
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
X-Proofpoint-ORIG-GUID: 6AS7gNwtBY1w4CkosMdElYFyhaAjHnFb
X-Proofpoint-GUID: 6AS7gNwtBY1w4CkosMdElYFyhaAjHnFb
X-Authority-Analysis: v=2.4 cv=J/inLQnS c=1 sm=1 tr=0 ts=697a45d5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=3glTqji7Xff0SCUsWbAA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDE0MiBTYWx0ZWRfXwrWaRONBeefc
 ZvbGjQdbx1Na2fGPF9qmMYPFl/lSBt1phQ/nclAlcytmRKsix4RoSWLiMrNkmyizlCDJ9UFgEjz
 PdDnMl5JuvH/7oalJVZZ1i1h0luYMbWI2jXH9XqWd6Iiy6jLewi6QWFFj57agzxVR+vuhEKJrY5
 /WBxe9ywxi4aHubyJ60MNpJOhunEDrJjewhMKmIlyu+j7pSUMmiSzD6NLppUgLHGCv2kKy0OnZd
 s1uHQmWBUTYT3p9XtW+tB5b7B0Angk+VRsBhWDNF5aZsYiNBFYnKHFV/tw84JtGXm4fMCztAYxE
 YBYgbkdgBRYkciisjIDeJK1vj8BFZ7FNbKLvS0fv4t6tcspam0yYaGzqBHKY4cuPMd2QlBVC5gN
 4QgbW5BuHP+U7CuowAHapDq3UZ+oHXvip8i20pFbyyVF6228QeNPmdEZ1ZMjr+tkzydLok+nOEW
 WOCGpP2feX8Xcb2zTVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_03,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280142
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31251-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,devicetree.org:url,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 57115A6C55
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

Will fix.

> 
> > +
> > +  gpio-line-names:
> > +    maxItems: 185
> 
> 186, your first GPIO is 0 and last is 185.

Actually it is 0 through 184. The 185 is ufs reset.

> 
> After fixing these two:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 

Thanks! 

