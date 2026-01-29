Return-Path: <linux-gpio+bounces-31266-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBktKyMfe2msBQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31266-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 09:49:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D094ADBA0
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 09:49:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B247E3018296
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 08:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01EA437C0E7;
	Thu, 29 Jan 2026 08:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EUD6iwYP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RPf0b79i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4C93195E3
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 08:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769676273; cv=none; b=d5hJTIdlJGioqK5aG63LOgUXJXbUbyG7a6F50Iz+iIoCPsSjZeeulQ5dFidR4UH+s3D4Cjc+datUtPSba7aecDb03Fvq2m5qiSEa4T+9Rz1zpSL2/geY8q9svxg+R9RQecyKG7vTSvGgqIvMllJvLZDW7LAAiAse1uC/0hKQy68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769676273; c=relaxed/simple;
	bh=66pb9YdKGOXrnljgEXmlZlI7h4bsCMV4O6UC+UUEzJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKysjwWxZCbklxpiqV+a2pdbdzyQ+bGpGtQ5m+c/DZ55i73YvvDcKyZy6ktmJH4X55byizoPRznwsMoAVkTtdgVWZEkfqiSppMs/0TMLVJQwBQrs/5o+bC0DcupCyFkeFIU38G1ohWeA48q60NQWq1l38srofjW4RwA7vou9G88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EUD6iwYP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RPf0b79i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T2p7E52061110
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 08:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2fw6gz4VUsc0OQodRgHV+88H
	0+YIRIVJ1Np6V0umM0s=; b=EUD6iwYPA86gRwRKLHjraPTcuDxB+SJOjoyb1Tkz
	+gJgln33dCrmxjLB1DfC66AtgUB18ezxN1nANBEGrWZ2WfghgNNrgc7m5uxXz88R
	BXqwlCKglIZz9HPZJ6zm7xZoc4lPX2O/I1Q4xa2aRMkUTtf2MFmW/Wj9Upl6bfqv
	ZW+NXV2uTA1BO23MsFIrDc7EP1+Hfisueyy6zh5hD45whk8Ne4dfu9dlYm/j0vzg
	Sbzh1Crqf7e6R5YscTWHTavbiY4+XKXC0bYk/CmTR6kh0e7U5AhQ7f2c4prZGTYZ
	staawRBwWf8xVnZLVT3OSEeumV+DyAGnp6uRv2fYgwgvMg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bypgrjnus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 08:44:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c5296c7e57so322629985a.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 00:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769676270; x=1770281070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2fw6gz4VUsc0OQodRgHV+88H0+YIRIVJ1Np6V0umM0s=;
        b=RPf0b79iYPuE13YsoMPYRpMOmL4oKea9TQUWzBB7sa3r+oVy26A1MBcScumeu5WG2R
         usHrzENME8xOVWTMRAmtIRRlcszanUxtJtMj9DOB6kW5fMqo3RTI/FtRlTF/CdlgcKvt
         KM24VhbUucSVH93BJ/5Vg9eSM4PlHaCvuX9dA8Z04GKvaFXH1Vbdj5d1Yn4/0WMm/0iS
         tkxc7m1tw7EwyjOFcynIPaZ6SOCrlpKqIWTSS2ENyUSGuX3t9XkjM9U3Uldr30qDWbef
         bViYYYokN3g4qQRGy35w/XjLLOaKZnsqyHjs4SnEuIajlttlif3Dj5+gKP+rWtOtQfjL
         3A5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769676270; x=1770281070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2fw6gz4VUsc0OQodRgHV+88H0+YIRIVJ1Np6V0umM0s=;
        b=I+GcLKEJ8O6rVmeahvipENnYhf1p3+IXhFXfUE/KjcvdzW9CjGSr4v9GTcpXzCeQ/R
         CqL38J09fDp3mXShJQZKmY/gaNEUHCW5nMjsUZIPf3eWpww0pWlIc9Op33yeXOuDarJF
         Gcr5VBKtSt7ey76FIKO8hyNbQYTFgkVthLIP7dluD6NJH/B1oDwAPf8yMvOf91E1+Zxq
         DLOwDbinsXhZ7OtBc1NrhzVq9rIR+iHAprXQmT/eDoXzhNY+KlRbRDhWNe5K6KsGvDRa
         FjmBx0e4P+ntT+70Wr4nkOKgBxoAwXWmgGYy0A88X7UHZimMwoduNdcye/Jhe8E3fIP4
         c0Pg==
X-Forwarded-Encrypted: i=1; AJvYcCUJTWE8+GqKIWViwDeZClRq+NNF75gwdb7wSfzSL3EYdzADkdqLpngV1c7Ci7jjocatCcY7jCLS933B@vger.kernel.org
X-Gm-Message-State: AOJu0YwNYOTRnc495uLJhPyBAm10zljNUKuUsem3aDJWBT4+f/3s7chw
	d0h9FjXXh9RX09OWsdjEJYU7WrnCKYXIFO3qwoxSm0M3dbcWFe/rHAheSiLdzuFwGZ5cJNjhnO8
	yNNlbJ6DVvYtnM0UW2Ly+DwJM+eyy4wU1KEifXf3kXOrCliEEr+DueHfJWWB/35aG
X-Gm-Gg: AZuq6aLPWtNJmJL0CaNrfZsES6aZ/+G6ATMe52ctJSwZSBdDQ18Yo5k1kdRT39YT90R
	hvj4Da51UrrKIMv9LYU+N1hT852LJTQGsCbgwfdiXCv1YpJe9fT2Tk1Hkwf80PwI/6R95Eh/+DJ
	6Cmi8M54a9UJD8KXG4xBmT13z3j5Mzyx1dhnN4GnT6PEFn/F2JyDJDgnvCPztHWe/S7yKTpTAKi
	87llVNZIfQRCkeeYB61PbDyMvOidzYVvKFcjfh9SrNFPqJLpm/zBclqDP8f4GipTzsUGYBXPwF+
	pPvwAliD4u2ujMxMDT/c11tJi2wp5/8DQM5tdKTQhifDtnn4pGmtErDVzEKZDDHPA3eUp3Ktf3b
	6z/DBY+jnhCWbhOZ+m9g1xv0o
X-Received: by 2002:a05:620a:a105:b0:8c7:c25:9e53 with SMTP id af79cd13be357-8c70c25a132mr976826085a.59.1769676270444;
        Thu, 29 Jan 2026 00:44:30 -0800 (PST)
X-Received: by 2002:a05:620a:a105:b0:8c7:c25:9e53 with SMTP id af79cd13be357-8c70c25a132mr976823385a.59.1769676269943;
        Thu, 29 Jan 2026 00:44:29 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-481a5e09b70sm5151555e9.15.2026.01.29.00.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 00:44:29 -0800 (PST)
Date: Thu, 29 Jan 2026 10:44:27 +0200
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
Message-ID: <xl2n6r6cdvtdu5p5ygwm7sil3sdzqvafzxun4je3zi5s45jins@ltwlrs7y7mqk>
References: <20260127-eliza-pinctrl-v2-0-1faf78efdc2e@oss.qualcomm.com>
 <20260127-eliza-pinctrl-v2-1-1faf78efdc2e@oss.qualcomm.com>
 <20260128-hot-camel-of-acumen-eef9f2@quoll>
 <aizrc6xysfwzygdsfeuc2raccq7efmwg5bn6v33t2de6ugvzgi@z3ipf3i25ulf>
 <eda9a855-912f-48ac-974d-09d557a24bda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eda9a855-912f-48ac-974d-09d557a24bda@kernel.org>
X-Authority-Analysis: v=2.4 cv=d7T4CBjE c=1 sm=1 tr=0 ts=697b1def cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8ISVNiB3LqybwHucwhQA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: gAmCi1qypypDRG4ycQ1cj4EJP1W6Phxm
X-Proofpoint-ORIG-GUID: gAmCi1qypypDRG4ycQ1cj4EJP1W6Phxm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA1NCBTYWx0ZWRfX9waPX1a3aYch
 0enY1kFAoihEbbbhRybWTzXq/9BObAbNo5faBE20+LQEspJjoIvJ4l5WJaq7G4c36zbAsoCHNDL
 xqbDwlogd7W2MwNdBs0zo3t18ZTzWSJjWjDa2MKx3IFP6nsjGSB5woNUrsHs4qLc/WcuBE35knQ
 meBSmRK6Kc8aeOfZEfxzOUjd1MoguxlYn0tT0DbhfEEdq1O2kq4EiTwrm08jkLFS/eP0fnMea5i
 aV/I7Wb6nTPfqIi13AfXMqnfn0n7ixu+JIffYc2OvyZl2SrcNDKghk5MyON/h1JIEgpvCCpNqC9
 Qp5RaWN6jQdZC1mRx8X63BjVj4gavzamM7XyEoM9U7l9WhugjCbcgAcME0Bh1Y9gonzWVE8jlKt
 TCmOeyHiqtJNEET2TVZWUSBtGz4d3dePWP61eOqXzwgQrFCQOF3x4n0NcT53BRSmmKlsrbjGQgC
 jM4sNBK4V5bNORW7Alg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_01,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31266-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4D094ADBA0
X-Rspamd-Action: no action

On 26-01-28 20:58:25, Krzysztof Kozlowski wrote:
> On 28/01/2026 18:22, Abel Vesa wrote:
> >>
> >>> +
> >>> +  gpio-line-names:
> >>> +    maxItems: 185
> >>
> >> 186, your first GPIO is 0 and last is 185.
> > 
> > Actually it is 0 through 184. The 185 is ufs reset.
> 
> Then the gpio pattern is not correct.

Yep. Will fix.

> 
> > 
> >>
> >> After fixing these two:
> >>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Best regards,
> Krzysztof

