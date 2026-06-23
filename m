Return-Path: <linux-gpio+bounces-38849-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xAsaH7WuOmq4DggAu9opvQ
	(envelope-from <linux-gpio+bounces-38849-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 18:05:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8BE6B88D1
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 18:05:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aqurw5LY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="XzzG9p/w";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38849-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38849-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E71FA30465F6
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 16:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2313330C608;
	Tue, 23 Jun 2026 16:05:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEB2307AF0
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 16:05:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782230706; cv=none; b=fQHrywsKyBG5G3WvQA5K+aRlS1ux7TIc7kKO4zfFEtHJDQ4+zYCIvaG8Ph9SQZuMj5lu3EqO3gCUjsokk7n0Dp8dwnFyOvt3JDBfJC6XTauzNEoj92Z1Zej41oB3vvN1vkhhL+46U5qQ5xaTD/E5ggczJevQAJpz5SonNXMi9o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782230706; c=relaxed/simple;
	bh=6dPZAhxmblZx3o1TnvfD1vhQNrUxfxPrZLK1keutCxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lypPdHP6tMYSD88Fd6zabpuOogHFlIMOcTvhMOuoGewjLaKjuKEPTLiFpFOLfKn64EhHTlm1YR5DEaXLJmexd1lCzXzbuTlinWkSByBvUEs0J1wTczRq6qMEm7ImarUfHNEWIGiv5ME6cECBAwzbfpouwjbacw0SKnxNcsZv9TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aqurw5LY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XzzG9p/w; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZtnU4018030
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 16:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ba4JmPIhyOix7J6UGNQsATfR
	esjlvTIh1uzBfnXSHKc=; b=aqurw5LYd+SAucGEvdzzsXEvhRZ/FD5PbreVRzfT
	5zOd5EfoxErSVSDXyUzbFtsaudrWRKiyB3VZ4toocr0QQuyL1D6sKQGHKxXmTMWH
	cYBtz2GrcwwO6xMuj9ruGaiqcZfJ75LI2k5HfkLv6BnKJfV3LUL1jpGO4svfN0Mb
	UdwTmuqNm6rD9dNKCIJbSaAnSeFkkFkXGwfc5AuQk7pl3J0hMRmfyinsIBLrf1cb
	D6p3oextWExOhcpkG2PILdZxAKhTewZkAT3Bjf6YSRHF3ZD55xEyjla+lvIhPdck
	wqTKQoh+NN6bsClv1e9e/FfqT1b7tzozgS6YfNf1zfYDYg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjk74x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 16:05:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423970cb30so51813b3a.2
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 09:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782230704; x=1782835504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ba4JmPIhyOix7J6UGNQsATfResjlvTIh1uzBfnXSHKc=;
        b=XzzG9p/w/ieRJQrUghn6WfmCOGxBZk07RrfEPrJoOl6TfZF2vuQdmHUkUsNtvKGPhU
         +3X8jcY4gFSP1xJx/gkc3k34hWRP0NaMlyN7/rOwnKSLqvpcXatEg2SUstXAgIHaZd3Y
         ULjdgObr3QGtV0li52f0zedOu/Lu/t9MnidA+Mr981xSL6b4ur8vnR5YTpkY4UiQqayj
         V1GsOXTTc5Reo6Lkkw9apJaq+jA07PIkV+11XIYxBf31hTqFs+9TDtK3WCztPcOcQc7j
         EvM/o/v7VuttOjetvSvEF3m1KpOtfs+sVYGslkf8Ksp1rZ72XwbqLVk8hlc29NpgRo1l
         kE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782230704; x=1782835504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ba4JmPIhyOix7J6UGNQsATfResjlvTIh1uzBfnXSHKc=;
        b=rDEj0PtZ4A1xSn8i5lt/sG6ntjUX156S3pVbg65QUYHpwTmTtQeYOVBI/E0hMHGo1u
         Vbjm+qJ2ndzBsuSJpcqBoMKSiF9QhIU5nSCKu9s4/nPvJN7L/EB/MVcPg7JhWkwxXt9N
         9ndxAR2bn7hFS5tUXFPUyAWCxW9JtJjDzPzgvcTehR2jAnLYOAQcEX2V6N65SwUjuSGG
         kNYdqHfDwrWWxhkuIvqq+LER6z/nY6Frb3GSdANQHupe6PYk79Dg7bjwpx8AduckYs2q
         /vOMJBR50rfFIbFL8OBxgBYXMKi4+4IupYR+dHeKEHqoiIyRmE642JXA6vYlFimyQwQw
         vzAQ==
X-Forwarded-Encrypted: i=1; AFNElJ+QO9w8LUQH+PLE2S+4IoqHjeZ6XtrecFMO///lO+D1RPDNYKAKeav0CtFK5VgbemGo3FxHMBH7BDzT@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6EzUyfv3mxLRFW0hqsVVFo5kOMuJNR1cfdLoA9/oFSB8aHzHV
	EQNv5YwpYmPpa4tkJLXPkO2+3idwhfARIi6PxprwR9Kci9PhLB/EaF9DbEFeOIsvzmyumQRoyNT
	yf9FIpOO0tlxntYXdlKnz4rBKzsRqgwffbIvneZooa74F9WImgb2yD7CPzBE8wACnABMHJ3vQ
X-Gm-Gg: AfdE7cmp9ouwWwc03r6Hbt7YL5Thg78DRnpVUO2n/C3rLEYezLAVGWq2EUNAJYrq4s/
	eqi5KS/sM8R1tqD5nmZM1T29WSiL1VFug36V6YlwaXRgBc4p1k6JvAnov4PdwfiEHcrjxxqnKTW
	gZ/EbZ9mMneV/4Y5TQxavXnJ4XY8G2TLEs68lPn8AB70DkpS2WVY9cbkcVmCILuZ1jfySCtV4kc
	4DJSisl6H5NN63xxHCVl8+hX68qhSMywFZyPfzsMwT9c4nXgpEk5nwGeOJ9MTfUuRae7W8VJTJp
	vZjryEuHkNQ3dN0aW07MkzMHTTUKVWg+HB9Lj0Ma3R1kzUbrIQYEcRXact0EQf0LR9nGWhQswmS
	HpC1VHuVOEIciNo+kGZeJG72imguJBcxNBAf+vg==
X-Received: by 2002:a05:6a00:27a8:b0:842:6849:2180 with SMTP id d2e1a72fcca58-845971251f2mr3726663b3a.37.1782230703775;
        Tue, 23 Jun 2026 09:05:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:27a8:b0:842:6849:2180 with SMTP id d2e1a72fcca58-845971251f2mr3726598b3a.37.1782230703213;
        Tue, 23 Jun 2026 09:05:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564eca7fcsm11145523b3a.52.2026.06.23.09.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 09:05:02 -0700 (PDT)
Date: Tue, 23 Jun 2026 21:34:57 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: qcom: Drop unnecessary bitmap_fill() call
Message-ID: <20260623160457.j66dlzxfkvn3jxuj@hu-mojha-hyd.qualcomm.com>
References: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzMiBTYWx0ZWRfX8lLZ61D4qcco
 01p1agqvDqHL/WFw2zz76Of1KcTBBD/QuZpkL2/bJvJuPL2mO7aytak3Oxe1WVOAXvocMAxd6LL
 33UCWedSF8os6DpmJeMLDzT3+2Z9/zfERwZt4OiWp6N2SyZrzsF4zXRRj9o76DT0wRLQAYGvlVc
 JJqKXVn0XtciVf47ROGnZ9to4+MmFCWr5UaXEuLpNO08IuanMDQs4ATICkGOglxO6U/yauEztHB
 jZ9He6aRjrWYlpHjRmmFFJrK20uFlKVTg1ffFB3F4borSfrRl4oSGVG927DPbU4KYQqHS9IDD9K
 0vD5U2hxCQH+7i3OE39jTGbgZIhvj5Ed1VRw0LIsIImNWSwiymsVc2nEQqb2BzGt6UMKVgiGL2/
 ejWzXydVlDlLEYt6rZHuiglt6mazxctwHQeq6ezJNJU83gYrjdusZ72aEXwXx8Evw3A528Xzojd
 6UY5StJvKCJzF4ZK6pw==
X-Proofpoint-GUID: AFNaPBBbrK-sg_p0bB1ZPEqU5gdgCUNu
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3aaeb0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=CudRCQxTT4vl8MJ7sxAA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzMiBTYWx0ZWRfXyjpyQLEcogDm
 y7dEKfqy4vb871Vd50MAX3xPAAvH2rzaQ17wckKprT1up3X5kRY107kUPysajQl4nsJ6UzF0T+G
 lBQvMjI+tmk3ZeWxfwJ/E3PG4EdBowQ=
X-Proofpoint-ORIG-GUID: AFNaPBBbrK-sg_p0bB1ZPEqU5gdgCUNu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38849-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:johannes.goede@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-mojha-hyd.qualcomm.com:mid,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC8BE6B88D1

On Tue, Jun 23, 2026 at 02:27:31PM +0200, Hans de Goede wrote:
> Drop an unnecessary bitmap_fill() call from msm_gpio_irq_init_valid_mask(),
> this is unnecessary because gpiochip_allocate_mask() already does this.
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index c2938494c6bb..419342ab45e1 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1047,8 +1047,6 @@ static void msm_gpio_irq_init_valid_mask(struct gpio_chip *gc,
>  	const struct msm_pingroup *g;
>  	int i;
>  
> -	bitmap_fill(valid_mask, ngpios);
> -
>  	for (i = 0; i < ngpios; i++) {
>  		g = &pctrl->soc->groups[i];
>  
> -- 
> 2.54.0
> 

Looks like you missed to add kernel mailing list to the series.

-- 
-Mukesh Ojha

