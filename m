Return-Path: <linux-gpio+bounces-31286-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJrxCxk9e2k5CwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31286-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 11:57:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B8AAF423
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 11:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E4403006B55
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 10:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51AA38552C;
	Thu, 29 Jan 2026 10:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JDPaRPv7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e9XWZTaL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22AC3815EF
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 10:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769684245; cv=none; b=cxU6ucbOS7j9rs4CyCsRzSCVrWR7yWFbrOzcUYS6/0W3ZZ6e9zfSZTAkkh3Hi5X/3TxOOeybYPyFg3kamxz3yOYY08b9U/c00BeDFzrbCu17k18fcTAa3wLP5BRiV0YoAs8C3miYHVe49ERf2FQ7HWDlCa+PI6wYsJgkHdpaMy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769684245; c=relaxed/simple;
	bh=7tAlHO9B9zN78n+bWKK1zGUSbUcpiq38UJsD8aXRzJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PAWq/Gh3Yz8NFnkYtFLqbNxmLWKoXmBO9pvOJhH1+DEY/NFya5Qq73F5xweLPOBjzUNaa0w65u3ukyK1jsqSX7f9CCWRQRyJdnxZL7FtXSX1mVZNaArlu74o4bEvaE1LrqRmavGds+lNRxyxu1UPPRHCtWzBI3MIXxS//xlkQ8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JDPaRPv7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e9XWZTaL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAmGEj2953995
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 10:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DQ+X42m513lPa+AgKJjxUVQI
	w9gu6iP3mxYbKs3Qni0=; b=JDPaRPv7IDtRt8o5ynA/G+jWwTdVRGZKQVDQe6K1
	7F6WFRReZQIEZCZDoJgXiEk2gf08upqpoptqndFq1CAGo+24v1+Z1f/SeEWTMsAL
	Fj/vrVFJQ6czoY1v9q1X+lzNzzIpENJReHA2X/FB2qqzQSEm8kmM4XbMKgf62mGu
	CIbbgfy+mL/Fe3/PQpOh8k1yjzEhkUb8tgh0jmjf3fOi9zikKYCXMbo8UL311Lak
	e3iyFJYULHW4psox/fWWpt6Yq9tOyDDxNFCVjWBm/KJ7opi2pQft+VL2//aveKsW
	C4vNCWEsE80w6W5rElhsOUhytQYPc4wanGOtCl/8O1Gq9w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c064200ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 10:57:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c7166a4643so214191685a.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 02:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769684242; x=1770289042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DQ+X42m513lPa+AgKJjxUVQIw9gu6iP3mxYbKs3Qni0=;
        b=e9XWZTaLaMJ+Kk/2Hi3vg5S/TBzQDenRzu1lCwKmixLwsG6pnu2kyktfyQcz+2WENR
         xPCkzpein0rGdt9riAZV4tAtoCW4qncdfkvSS29AJG6znk1rXDw9iZLnkseIjCu/gncE
         f+mZcUGwz28cvu9FKabQHKogG2h202xc3MBSJpCTZogXJMZROFX7+2NvMLOu6LlpwND9
         Igh4FCSLvP+E4QTDMYicECqhXECgeLCcvQsupaN2nbSXgO9J1Oawo86kqQx026P2GMnC
         kvBeprO3+oVv4K+86oQ26uJVwWI8RnASDu0JIC5XQd9x6GhrUOc2E++/bvmLdKu25E3F
         Z0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769684242; x=1770289042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQ+X42m513lPa+AgKJjxUVQIw9gu6iP3mxYbKs3Qni0=;
        b=KikPgLKxqCrIeeR9JY2+Y8FCEn1E5HCVKYbbEATLX0zSD6fdWkZdn+mTuB0go8x5pa
         oQdrdPD07AZ/4//dk2lpKJ7LF9Pledc6shZ0l//ogoBnBcEYI6VKChpdU2zEFHzL/vKH
         31j5z/WacHMKlT8ir1x/iruUck0Agm3BAZXwhu26Vrrp3GfSnLYBWKt8ep9Q26e9/4Po
         f01g4HpyzUQeUlkrxpAQkHCpL9rDwtDG5VUt0Jy0FqbuiAg33q5tAhArMRHNmi0PIBpg
         m9KJAVpJ+2GxOKb6HOCwFxxai/3ED0X+twlLOtKhKxVPJVnyrllTIyEEPWY7Xk2nPwmM
         bCBw==
X-Forwarded-Encrypted: i=1; AJvYcCX9IwSfx5XVeGn0f0foAAn5Bz+JTKndV9K6yD71FkbkSPODmocEwA4QZJ+fyBzFVqhMwSV11Qm8MFs1@vger.kernel.org
X-Gm-Message-State: AOJu0YzUSCiV8vepimIdCBkfV4+ogC4LgyFGab9z55LLzXUq5v2a5xO/
	mo1+AFuLJ1++HiHqHI+wTRrs1VSt5C5OPjgPUpLcpMACawHwYTXRiZzOgOLrOUc1vRKMejCgf0A
	Fw7gVH/v/h/KcB0DiKgN8giQpnz5GN9uNusCNIwBNqYK/hCScGGCq8VS/PztGOcg+
X-Gm-Gg: AZuq6aK4T/OmKXOeH0apMn70CDM+F32/e9ypYMXCFBvyKQY/Lbh7YZzb0YPT61te26o
	K5bBHJ39DeZiF4JlcJcfMezjRuh/5HZuBqeNnb1jf8I7Q/y3GQ0U5dm+lLq/w3UNQahkfeb7msb
	DtaaS2xiwRKf7K0YdGrzK2+ye4G6Ymbq6LLIn+Yr57N0YJA2c68yYHhiCpt/ZUM/lJ+AUtAFFBA
	SAqsfvisEg9pm0P3TIQipLzhhNKFtJ2BNnV5i1TR8CGbj71OsJXq16pSw4fytskxSboEMaMMzwS
	iMk7F+ahMEfOHryd4ZkchRksbamzmGWEOA0VNinzl+qlkqpx1SdVbZwOYCtArtZdg3cvglXwEO4
	hGK+VL6Fvql3gZ4xdVvAqvAoh
X-Received: by 2002:a05:620a:25c7:b0:8c6:a608:5abc with SMTP id af79cd13be357-8c70b868ebfmr890726385a.28.1769684241848;
        Thu, 29 Jan 2026 02:57:21 -0800 (PST)
X-Received: by 2002:a05:620a:25c7:b0:8c6:a608:5abc with SMTP id af79cd13be357-8c70b868ebfmr890724385a.28.1769684241330;
        Thu, 29 Jan 2026 02:57:21 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066beeaf9sm201513935e9.6.2026.01.29.02.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:57:20 -0800 (PST)
Date: Thu, 29 Jan 2026 12:57:19 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: document the Eliza Top
 Level Mode Multiplexer
Message-ID: <m2nydmdqzqrtwbqkj3sf4r7zyk4pjj5ruc6fu2b4ysy74b6u5g@ex347qlw4ezk>
References: <20260127-eliza-pinctrl-v2-0-1faf78efdc2e@oss.qualcomm.com>
 <20260127-eliza-pinctrl-v2-1-1faf78efdc2e@oss.qualcomm.com>
 <20260128-hot-camel-of-acumen-eef9f2@quoll>
 <aizrc6xysfwzygdsfeuc2raccq7efmwg5bn6v33t2de6ugvzgi@z3ipf3i25ulf>
 <dc0b7245-de95-4db7-bf8f-815ba60d7adf@oss.qualcomm.com>
 <pdxrotmxjiebyj2gqx6buwupkydngxki6jgv4e6l6fmodzc5v2@yxky3civt3yz>
 <8360708d-5d82-4cbe-bf0c-31107ab07bac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8360708d-5d82-4cbe-bf0c-31107ab07bac@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA3MSBTYWx0ZWRfXxQFee8T+pbD0
 41T4QPW+cfzUarM12cuBBGUtmt/QF4yxNMJBZH3l6hcZ/wB3fwJgdwyn1pWvvSspfaaP7PmMPKJ
 Ixvmkn8VRzoC89W/YztMaPqyvGZXWCueQy3lQNxPES17JmEqA6HZnB2COqyw36bHfFGOIbBO0e0
 wWg2U46rTTWQrn5JhIC06kE829L2i0+dcnYQMkjL4uke+6vicgHEi7WcBhZAjUY44qGp5YaTlLa
 ZlVdznA2qcTyJfgtxqE7qVndgGFn4DTiZLzTUhuR4IJ6C3D6p2h5mwW8ECLZq70/XeVZ8xxUw4c
 cXOPjbnXHs4HkjqAojgkrNc5wBB+dvuUHhHJ09r/iZrHi5axpf7fsUA9hWHC8HL51grHW8D7y1g
 DfHtRygK9lrs4eevH6Fnvi6wLrE3lwjk+wkbFM/LxxyE+5AAalg8TaVRkGZ9z7DfAgEm5M2sUDx
 Ym9wzoBZx0DBaiaRwIQ==
X-Proofpoint-GUID: GYtRpZZc6SCHGBeMXLnc7LSFrMGDrNfM
X-Proofpoint-ORIG-GUID: GYtRpZZc6SCHGBeMXLnc7LSFrMGDrNfM
X-Authority-Analysis: v=2.4 cv=dpTWylg4 c=1 sm=1 tr=0 ts=697b3d12 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=qyz6NfLsuGTTkpJqPHAA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290071
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
	TAGGED_FROM(0.00)[bounces-31286-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C2B8AAF423
X-Rspamd-Action: no action

On 26-01-29 11:45:59, Konrad Dybcio wrote:
> On 1/29/26 11:41 AM, Abel Vesa wrote:
> > On 26-01-29 11:34:07, Konrad Dybcio wrote:
> >> On 1/28/26 6:22 PM, Abel Vesa wrote:
> >>> On 26-01-28 12:38:32, Krzysztof Kozlowski wrote:
> >>>> On Tue, Jan 27, 2026 at 05:47:36PM +0200, Abel Vesa wrote:
> >>>>> Document the Top Level Mode Multiplexer on the Eliza Platform.
> >>>>>
> >>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>>>> ---
> >>
> >> [...]
> >>
> >>>>> +
> >>>>> +  gpio-line-names:
> >>>>> +    maxItems: 185
> >>>>
> >>>> 186, your first GPIO is 0 and last is 185.
> >>>
> >>> Actually it is 0 through 184. The 185 is ufs reset.
> >>
> >> The UFS reset also happens to be a GPIO..
> > 
> > So the gpio-line-names should include the ufs reset,
> > but the pattern not.
> 
> Why not?

I was drawing the conclusion. No question mark. :)

> 
> Do you see a reference to ufs_reset anywhere in DT?
> 
> Konrad

