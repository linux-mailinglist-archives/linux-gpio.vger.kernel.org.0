Return-Path: <linux-gpio+bounces-37893-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WpHIB6kgIGoGwQAAu9opvQ
	(envelope-from <linux-gpio+bounces-37893-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 14:40:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C5663796E
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 14:40:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=onqXhhsv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dWhMiiPS;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37893-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37893-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D1B873048C90
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 12:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB694657CD;
	Wed,  3 Jun 2026 12:29:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8E33D47B7
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jun 2026 12:29:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780489766; cv=none; b=EG6drNQtvv3HScaSgaWbzRra9fDf0RCTq4acS9IueuN8mWit6QSIMEso34PksKIuVrXQALAGsepOqUMagfDzZ/Ti+OkH+9LH7BZTqN7/dXSIbBY9rymlAywqsAXR+GR9J7Pkmo0YWBmINJjJlnXnwL/4NkVXipGUAp3M4KkItkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780489766; c=relaxed/simple;
	bh=YMiHS7/GWiUf2GISl0uQrQVtiU37t172Bh0fR91tIQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JwtEBNXeXH2wA/2yrYZO3GxONfTy5f2NdPFW5FtcVkKmDNWqZl0zRZieS8KxCoXXOo2uVfJBTkVyq2TJbhiyUhykmYoKh1gQT8Xc/36HjOAAF6n2QLkyKqANiwQYl+yrLwvj634/rAM/JxT7K01N5xB/BkpIap4tEErlrBm/9dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=onqXhhsv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dWhMiiPS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RPDY380692
	for <linux-gpio@vger.kernel.org>; Wed, 3 Jun 2026 12:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hMVk5w7oqbwOYmWzM+P1isNL2MH+1xWEAtw1PbLIu5k=; b=onqXhhsvHEFM3HWw
	klqBCjujNpHOAxiBAz3lOekrKdUWlpZCX63ui863WkH9Hb1M7/9MHQhvYud1fdIe
	EgWNFWRky8+f9bvFo4EJIhxkV06mCcDyhaI4hvwY9sJtqeGXqMpOb7EupJX3/Ydy
	gutLLmjCK29oBYSaoCHx+tD+81aGYPHBwBlB3havGfh0KVPszovtB5sG/8wfj1eg
	Q7D63DJxomJvO7Zi4S/A5ynmnTuqE4H4errGdBPlbeDk7W/ya33tJVViM72f6IpI
	LwZo9C0MM/sepb+9WTmk92+SC4xllUgc+ujq5zCo20J1fxpm7y2tpRZhp1ZO2i1a
	h2GVdQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejewhsf7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 03 Jun 2026 12:29:24 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6a2b8b91dc5so4062518137.2
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jun 2026 05:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780489764; x=1781094564; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hMVk5w7oqbwOYmWzM+P1isNL2MH+1xWEAtw1PbLIu5k=;
        b=dWhMiiPSMKfIvp8f5P0eX3v2RBkuyWPCsSkohvLEMJ19JRBPupgRY2m+z5uoUDDwbF
         el3no8/p7mb6f9XiLQhd1RCZojngFylfNza1x29fB57PeqQtDut1+15QAwPi/rFRlit7
         vABUe83tPCAqIpobYzylY3E4RVk1xrnzkVTsNi/AZ+u+5/Dk/NQLkwEPBvXQHsRnAzot
         gny1ZzuCmJrhwgPCTfXxAXCX0PgiyuLtzPE8ry5zpA2wiHCV4vFriKngd+sl+8XUW4L+
         OBESiQxbg4a+ZUiy7n5HN4DWHMU8tJm2ndRfzjiyLGcsigqS/m1taFqsWJL78l0OT/JF
         xgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780489764; x=1781094564;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hMVk5w7oqbwOYmWzM+P1isNL2MH+1xWEAtw1PbLIu5k=;
        b=c9AXJhJBIP+g3PQEYNXzYGI+mDiwpRpzWdTtY4ozM34b3Zeh5NiRmAhLF3mhneuWYm
         3zkqdZNKN+6/YK68r5+7atyKyQFWc5r24ebKfFLXBAZDNSvmwE9hCKkpBR0b437rCUZl
         3fy19D/zpOFvAo/L1IzyO5g0dED9f4F+zI9o2XOPeHuFFXysAh1BVZO6T56s7d5B6imv
         yxPMxpT8rS1QNiX5SHz5hFL76oCgUe9O5vOci6Ou7PTnHOMl2flX2Sb05EwMJNNn3S9Y
         UAwJ4vO6Gka1J+hep0ojFHWfPLaV2yd+CA6lx5ngdi0w+tlyb4+1NaHP9RMwAN7C+4/Q
         wfBw==
X-Forwarded-Encrypted: i=1; AFNElJ/9Cn6MwWrw22YMqVciQh5djHCNicSuLTtkvno4mBBpgoWgsUDmYulCtggF38NpgdJ7pl2U6Ol91ivY@vger.kernel.org
X-Gm-Message-State: AOJu0YxWN6r9Dw9bkJeXr02t8Y2+46Q5Uc8UyeFmLZNg3fH8285gU2Yi
	7s3UzpUGx1IM8SyvRS0cw6/Hu+j7MTshEONEcd+Octgsur2f/JCFL/v6jBPXZSg42eNL+Dt6ErG
	3Ep1fs+GUpIwwerEkFH0NKWzdVO8jDMUNNUIdsIAEhdO40dH18uw1yu9miib/dJfE
X-Gm-Gg: Acq92OEG/K76Tvo1KTmgUiVg8O5Wqdz9L2Oyuj2RzPg23egG+5flrf9hTSopn6zVibu
	0+xqWmraXGIBS8kSffSsgPw2sVH5KdseAYtcb5hwgXd2Pu9Q0jxZ6wkdGOtNP8mqnDg5nfswUxB
	IJdFfj9tAANSanzst1uNUQsL3GydiOsYUqEIFUmvK0h2YrFpxOzFR/W2q01nQAdY17Q3KujQ7Vi
	+RBJjjIewQ8pTCwM4amibNtDnUfDxzYYGntvqxGdpg+WAQpLxwCpNDnz1j9Eo0CObg49ggwZfFo
	mGpWMA7gsATODRVbYmSFrFoFIWeFJZgSS/QTxIioYUf57IrdwOxK0pU5iyqXxq6LSSed8xsDD2p
	SjB4StlN5/eGfhPyGGzLnomVCbx0eQf8pUXirURoqNT+OHrBOwjmC82CaKGI7NqCJ5BYhx5qknO
	dkNc/pYS/cUt9adcOuSTbo9Vp8tyHvdD3AG+PLyBEZKrJLkw==
X-Received: by 2002:a05:6102:5812:b0:632:29a5:2b28 with SMTP id ada2fe7eead31-6ec2b17b508mr1292407137.6.1780489763588;
        Wed, 03 Jun 2026 05:29:23 -0700 (PDT)
X-Received: by 2002:a05:6102:5812:b0:632:29a5:2b28 with SMTP id ada2fe7eead31-6ec2b17b508mr1292387137.6.1780489763242;
        Wed, 03 Jun 2026 05:29:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99c11csm620669e87.78.2026.06.03.05.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:29:22 -0700 (PDT)
Date: Wed, 3 Jun 2026 15:29:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: MINETTE Alexandre <contact@alex-min.fr>
Cc: David Heidelberg <david@ixit.cz>, Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 3/8] pinctrl: qcom: Register functions before enabling
 pinctrl
Message-ID: <thj65jrvef3z3dmn5f52jplewrjgklomc5s32grktsjejs72sw@npk26yx2hpf7>
References: <20260519-mainline-send-v1-sending-v3-0-3dd7aa125353@alex-min.fr>
 <20260519-mainline-send-v1-sending-v3-3-3dd7aa125353@alex-min.fr>
 <CAD++jLm=BxHsPJ4rgqwY8SvaefZUO+Pfv8E8xizqPsdJZw5weA@mail.gmail.com>
 <298550eb-1bdf-4d7c-8111-8b8f0b5dc056@app.fastmail.com>
 <4b797a3f-01c9-4b02-be98-7b82099c2e0e@ixit.cz>
 <48cfedcb-a9f5-402e-9973-f5c175fd2740@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48cfedcb-a9f5-402e-9973-f5c175fd2740@app.fastmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDExOSBTYWx0ZWRfX6CObTQpivt0G
 DwHv/C7WEzB1zLXF/GjKsDjpgA2laMuwO7KAMhKNmUF7vP+QHbeSF524+bcgdgZABqQFgQ6LE3+
 LBCmBXLtV8uqxx73AntUY2PJTBLJrRdwQCORS/5soTvN1g9rbUeWsdtbavSuxq+7yu2ts6yvMA3
 Wsi2f8bYpFx8StPKAOdxqLqOipgLC7YCmAdxNFd2Om2hn83uFV9QgdBbTrJqwZ3POzjVYNJ5TNy
 nJay5o6u0rFVfKQtAp9ORLhJBQ87+Xvuv+B6oditv0xsYFG5uWIbUzKVjOe+oWLEyrSSvZlb1x3
 /LkDnAhypFIo2PGhghg2rsGlgjVJ3FPt0Ti+N8BqswdtUB9MJvpgNIa3qTGQeBKA7qwS9DzD6m+
 bewmQdjmqcZeJ++fHPUq9ZN/2z4yUM+qCUavLRBtugtqVxle6qnAKMfRfils0A/8CR4+yAhzi4G
 4xE8MhUHgd4rFQsaXjg==
X-Authority-Analysis: v=2.4 cv=Zewt8MVA c=1 sm=1 tr=0 ts=6a201e24 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=JV3oGrjsAGRtxPpt7K8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: DKeOB8snQ6v6795bgjM4tXjLex1VD5Er
X-Proofpoint-ORIG-GUID: DKeOB8snQ6v6795bgjM4tXjLex1VD5Er
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030119
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37893-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:contact@alex-min.fr,m:david@ixit.cz,m:linusw@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:myungjoo.ham@samsung.com,m:cw00.choi@samsung.com,m:linux@gurudas.dev,m:robin.clark@oss.qualcomm.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:iommu@lists.linux.dev,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,alex-min.fr:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 17C5663796E

On Wed, Jun 03, 2026 at 10:58:24AM +0200, MINETTE Alexandre wrote:
> Thanks David.
> 
> I initially considered adding a Fixes: tag, but I do not have a commit I
> can point to. This looks like a latent ordering issue in the
> Qualcomm pinctrl probe path and could have happened at any time until now. 
> 
> The failure became visible on APQ8064 boards such as this jflte, and I also
> have a report that the same change helps flo/deb, but I do not want to
> add a misleading Fixes tag as we don't really know which commit really triggered the race condition.

But there are no gpio-hogs on Nexus7/flo. 

> -- 
>   MINETTE Alexandre
>   contact@alex-min.fr
> 
> Mar 19 mai 2026, à 23:03, David Heidelberg a écrit :
> > On 19/05/2026 10:48, MINETTE Alexandre wrote:
> >> Thanks a lot Linus!
> >> 
> >> This patch is required for my Samsung Galaxy S4 GT-I9505 to boot but I also
> >> have confirmation from another contributor that the same pinctrl patch
> >> helped boot the ASUS Nexus 7 (2013), codenamed flo, which is also based
> >> on APQ8064.
> >> 
> >
> > Hello Alex,
> >
> > if what you wrote about asus-flo/deb is true, then this patch should have 
> > `Fixes: ` tag, as I remember it was booting with few limited patches ~5 years 
> > back then (only one serious was hack for proper clock bringup).
> >
> > David
> >
> > -- 
> > David Heidelberg

-- 
With best wishes
Dmitry

