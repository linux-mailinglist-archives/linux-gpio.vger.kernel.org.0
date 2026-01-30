Return-Path: <linux-gpio+bounces-31326-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UWVQB1RpfGn+MQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31326-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jan 2026 09:18:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B2EB83F2
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jan 2026 09:18:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7BCF53015A40
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jan 2026 08:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA13350A39;
	Fri, 30 Jan 2026 08:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHFDfaF8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFfXZnsI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC2B315D35
	for <linux-gpio@vger.kernel.org>; Fri, 30 Jan 2026 08:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769761105; cv=none; b=gyPv0nn+G0dIqBgFNcSV25oBy/dD3fMsnjfdU3eP4G4i/WhOwf+HQX8D4rNXSkgMPNxlElOvD7K9+1Xp8ikHVovOyNu9D/YSQsYrON/pCyLRQZFiT6pqRITjpEvrrbT9LGztaxDEyu8XsiEHRLZbMVwk6AF2NY6zySuVPK3ThY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769761105; c=relaxed/simple;
	bh=br2SMO/CqOLy01O9OblTwnj3Y8uFghxnpz7SdQ6Z3dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZiiTK970OcUit7rAxXOeKkshl55i8J9yIQGnFQbH4svq345kV590q6oSCNygh5QXllpXp8fwRpErAhhZPxWaAwKv9tZ8yfybKAceZKYDjTMJtKlZ2X3nnWHfApSM6/FWYUfgyhvy0pqD8Wi+USiwX6tCDgfoC/eYWlJrTP9NWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHFDfaF8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFfXZnsI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U52YEW555310
	for <linux-gpio@vger.kernel.org>; Fri, 30 Jan 2026 08:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6SP+L5YkJ1dJdpaUxQXBP5gH
	hMTqV+qrQzfZOzgDS6A=; b=VHFDfaF8W/2cTM+dHYtYLyqCEFSkC1PXaj+Nsw3H
	mZcEh/B28ssTotdFCtmyd2JtJ+g3AV+RG8a9wModEPldBewrV3EFUqcQVALVPLWq
	WhMoYVmmJ8UqGqTxXPBefgUWay0fnnJpPetQQ+iABdlZ3C3bZsHnVLs5Xk12F0S/
	OD2t2ZUXx8LHDDOd8ooOpeYvxoTlrKo3DXe2Svj212r7LE0rFrCvmkow15lin7Uq
	k/vcT0Qy7AMUrt6VtAVTKsAC3vUTyuetGWOJvzlu1XF4X6vxyMEiO68K0WnVvba7
	j78lmvWQ0WeBo/+b0+Z+OkZVvuRhvREqsUEMuSzhLvACqw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0p59ghfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 30 Jan 2026 08:18:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70a62ca32so502940885a.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jan 2026 00:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769761102; x=1770365902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6SP+L5YkJ1dJdpaUxQXBP5gHhMTqV+qrQzfZOzgDS6A=;
        b=SFfXZnsI0eOu7E+NB0fGHJEg4L3Bx/nu/q+iRjkbLixYCBq38ORVmrbWB8FkgJwaU7
         +4peO99MIERAFyL2aiHzGNhQA0A+iJTLjpx4qY9+T6xZ2m2l7MsbFcocSiQd4qdPltoA
         XYmDAW0JigKyIen80PpB9mUjDCqVZzL6Dk7H7BCl6BE/74YuECeAKd2vCxo7OvbnhC6t
         tnkEAiDI3P8pS1H4a8S9B8ov65bnkskmJmfqXWe58aMydXD7cY49UnLFjVNVeLc0A/jL
         BQBUa1AB4j0lLTiispwYNK+k4J0lrE1xwZL8cFVQvBKpKrY9eCI2PjjD9qDPd0E9L0L8
         0f+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769761102; x=1770365902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6SP+L5YkJ1dJdpaUxQXBP5gHhMTqV+qrQzfZOzgDS6A=;
        b=ieeX1jzlzZMkk+PfFz6lakB/4912vdPz4ku7/5hxRJifs6xa0zLChHZOsMzWgSjXSd
         9VbaeLd2kqRmyb3lVhojs3MEse+1SJx4ENYXuvyW0B8U1R8llwi7oUSck+fBjkv4vWfg
         gCEr43B1jnvGRDCpk5uUeEPFBQSEyhKPTZRAPhQYMfDemsRFwLjwOuaDJ7Ut80fJJH29
         t9h44PcDxsYo/m+TQodzEkdC7QvZx3xwLCiYd4H5vLrO8zHc/6LsuGteBqQsMbBEP1Lz
         QyAXGCy/xFDQ/InDq+Qg3dDAlcOwS3+8L808CK7N2tCdItTTMqs/T1jgSqtoEuX0UdO3
         3W1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHzKDb1417MFIjtOl8tre/hAe1V/BQOJolYcFy26Ptgn3QLrD9SzgTdz1agu+LZQGHe9kLECjBWCpJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzER2LWcek7NMRaxajkotzA0wrMdmbwpOXFRPL4nEdlxd6jCqRJ
	hAJDkb827LW6xeRlkHOY3TguVXrRe2ZxBQ4ZADNnZTcjkkl751j+WL3MG4u0ekx8PQGFgN58kbT
	AFuTGs6/yarGSApOPw/FsItyRacmIz/XO0JODQ84ynj+cvjZ+L/KfmOtWCGJxHHw4
X-Gm-Gg: AZuq6aIlXFML1YDuMKnnusirDW8gAiGKpLWGlfclSV+1e3//Mk18CW4deRxvCGeyEv7
	lqSNkVvCxppB85u+IWtwfviWAq1EjA9IIQ135ar0RkD99hU+JfGhWvX0cR6BD7iFzdhUePxipis
	zHrs5hwFMUVLlr3qWkqZhmoktpnwn1Xjj8UDtOg3aHgxhF9XFdCzaQMW8WJwhh4mAmuysOhEGON
	l9lM7qaZ8sZZ+RVMRHScVF7ZX/Fw5Zxx1gTDWl3dn+XTqctq36GYgRim1H+4XjteLlyfkkc8iSH
	vrDgbkm4HdhwV8m9dAfR1NxSFrXj1lcy0aocYLA3RdP5AdJxlIHkdf7Km9TN2DvlYt5o6ga4D1M
	AkjzfNK3+r7FXRd/eIZOnxj7C
X-Received: by 2002:a05:620a:4708:b0:8c6:d398:4a76 with SMTP id af79cd13be357-8c9eb1fc068mr284444685a.2.1769761101940;
        Fri, 30 Jan 2026 00:18:21 -0800 (PST)
X-Received: by 2002:a05:620a:4708:b0:8c6:d398:4a76 with SMTP id af79cd13be357-8c9eb1fc068mr284441385a.2.1769761101378;
        Fri, 30 Jan 2026 00:18:21 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1322dc7sm20233675f8f.37.2026.01.30.00.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 00:18:20 -0800 (PST)
Date: Fri, 30 Jan 2026 10:18:19 +0200
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
Message-ID: <lqzft4adz56ly5323cpcsdasr4uag6gb2wrtlabynd6mvxayhi@jdrxniqm6qek>
References: <20260127-eliza-pinctrl-v2-1-1faf78efdc2e@oss.qualcomm.com>
 <20260128-hot-camel-of-acumen-eef9f2@quoll>
 <aizrc6xysfwzygdsfeuc2raccq7efmwg5bn6v33t2de6ugvzgi@z3ipf3i25ulf>
 <dc0b7245-de95-4db7-bf8f-815ba60d7adf@oss.qualcomm.com>
 <pdxrotmxjiebyj2gqx6buwupkydngxki6jgv4e6l6fmodzc5v2@yxky3civt3yz>
 <8360708d-5d82-4cbe-bf0c-31107ab07bac@oss.qualcomm.com>
 <p5rv7u5utnetlt2xvh6ixk2xvi74tdcurgwzrkxfuq7qa3m66u@m7u2ukr46n6j>
 <6244680d-f6c3-4aba-8e12-61093e51f76c@oss.qualcomm.com>
 <flr35di3ivjivnnkrcnwnurlzhmf43i5ymtgj3jnitexcm45sa@jli2o7qkb4tb>
 <9234e45d-4a48-4820-a42b-48e11d79c0ee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9234e45d-4a48-4820-a42b-48e11d79c0ee@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 3L-QMBHGdLxz97t2yZceSrBo1cCSZ4Bc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA2NSBTYWx0ZWRfXziYKB6Es6ABF
 rQZecaVfr/UtwaSmwUrCr9Pm7MPJFWtE2sCpO45V++OV9sWMV2JabPG/tbPc2kswt9JdAWCWP1I
 G2i7Qei1vgeOrTTJ0TwLAorN4qcJ+wN+LHHUOf5ZGsHU2mPclr/4j0bkjkAk5TNgMvqu3t2fk+r
 Z3hLIQ75KwV9wmwXH8BaktY+0bahBk4wtRpsd0ggmAReX0eF0gzdjl+deEWWqksBYw8YugjU9UX
 j4Z7hvzLUsaG5/M/UAuPlGHOFIM6QBWW6CPIfGxcpQ9KoJxhxbRldfd2aVlgSEGESTU2ZaYqrAH
 L85qqcrvqOJhMSpROeuZ+Bbd4GgrUMrD+qJ6CK6CxLWnphGmaUAsS+pe9E6N0ziZDWXawWEkZ7N
 WR9Ss4TzFOjUbaTf5ZE2iMsy0Bwohkxfq7oyM4xDnp42oDZ5a2lXwt4InJXms7K+I6D9ZhMOBrO
 X0KyFF18DERMYsGEwfg==
X-Proofpoint-GUID: 3L-QMBHGdLxz97t2yZceSrBo1cCSZ4Bc
X-Authority-Analysis: v=2.4 cv=Re+dyltv c=1 sm=1 tr=0 ts=697c694e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=k23fqYO9E_dANr8HoeMA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300065
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
	TAGGED_FROM(0.00)[bounces-31326-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 87B2EB83F2
X-Rspamd-Action: no action

On 26-01-29 15:11:07, Konrad Dybcio wrote:
> On 1/29/26 1:42 PM, Abel Vesa wrote:
> > On 26-01-29 13:04:23, Konrad Dybcio wrote:
> >> On 1/29/26 12:12 PM, Abel Vesa wrote:
> >>> On 26-01-29 11:45:59, Konrad Dybcio wrote:
> >>>> On 1/29/26 11:41 AM, Abel Vesa wrote:
> >>>>> On 26-01-29 11:34:07, Konrad Dybcio wrote:
> >>>>>> On 1/28/26 6:22 PM, Abel Vesa wrote:
> >>>>>>> On 26-01-28 12:38:32, Krzysztof Kozlowski wrote:
> >>>>>>>> On Tue, Jan 27, 2026 at 05:47:36PM +0200, Abel Vesa wrote:
> >>>>>>>>> Document the Top Level Mode Multiplexer on the Eliza Platform.
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>>>>>>>> ---
> >>>>>>
> >>>>>> [...]
> >>>>>>
> >>>>>>>>> +
> >>>>>>>>> +  gpio-line-names:
> >>>>>>>>> +    maxItems: 185
> >>>>>>>>
> >>>>>>>> 186, your first GPIO is 0 and last is 185.
> >>>>>>>
> >>>>>>> Actually it is 0 through 184. The 185 is ufs reset.
> >>>>>>
> >>>>>> The UFS reset also happens to be a GPIO..
> >>>>>
> >>>>> So the gpio-line-names should include the ufs reset,
> >>>>> but the pattern not.
> >>>>
> >>>> Why not?
> >>>
> >>> ufs reset cannot be configured as gpio, so why would it be part of the
> >>> pattern?
> >>
> >> It's certainly registered as a GPIO, as all users of UFSHC refer to it
> > 
> > Well, technically yes, SW-wise. But it definitely doesn't have the same
> > configuration fields in HW. Anyway, that is not the point here.
> > 
> > The point is the pattern has dedicated enum for ufs_reset and gpio185 is
> > not even part of the gpio groups anyway. [1]
> 
> So, is the current behavior such that in case I wanted to set some
> properties on the ufs pin, the description would be:
> 
> foo-state {
> 	pins = "ufs_reset";
> };
> 
> ?
> 
> TBF we don't have any such ones, possibly because whatever the
> bootloader had configured has always seemed to work well enough..
> 
> In that case, I agree that this pattern should not include the pin.
> I'm however a little surprised to see that would be the case, since
> we end up consuming this pin as a numbered GPIO via reset-gpios.

That's because the pins property uses the name (here "ufs_reset") while
the *-gpios uses the number that goes via driver specific of_xlate.

> 
> > Also, are you saying that all older platforms (sm8[3-7]50, at least) are effectively
> > wrong since they do exactly the thing I described ? :-)
> > 
> >>
> >>> For the same reason, it cannot be part of the gpio-line-names either.
> >>
> >> Since it's registered as a GPIO, why not?
> > 
> > If what I'm saying above is true, you can't configure gpio185, so AFAICT you
> > won't be able to name it either. Or am I wrong ?
> 
> I think the truth is more nuanced:
> 
> The UFS_RESET is a GPIO in the sense of pinctrl-msm, as it has a ctl_reg
> and an io_reg. It's not capable of receiving interrupts and it seems to
> be output-only.

Just because we treat it as gpio in the driver, doesn't mean it is a gpio.
HW-wise, it is not a gpio. GPIOs have electrical properties (at least) that
this ufs_reset doesn't.

> 
> It does not have a "gpio" pinmux function (func0 is named "ufs_reset" intead),
> but that's just human-facing naming, so whatever.
> 
> It can be toggled and is consumed by its number, through the gpios/xxx-pins
> property.

Being toggle capable doesn't make it a GPIO. Again, a GPIO is more than that.

> 
> Running cat /sys/kernel/debug/gpios on x1e80100, where ngpios and gpio-ranges
> includes that pin though, I could not see it listed. I don't really know why.
> That's where I'd expect to see the name given by gpio-line-names.

Yeah. I think it should've listed it. It does on Eliza and Glymur.

> 
> Now, I would also strongly expect that this pin would be only ever used for
> UFS reset, making the name override unnecessary but we've all seen things..

Anyway, to conclude, pins property does allow you to use it by name beacuse
of the enum entry below.

But the gpio-line-names doesn't make any sense to allow you to override the name.
This part is can be debated, for sure.

I'll respin with these in mind and we can fix this later on, if needed, on all
platforms at once.  

Thanks,
Abel

