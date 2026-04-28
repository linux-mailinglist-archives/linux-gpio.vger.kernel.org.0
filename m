Return-Path: <linux-gpio+bounces-35735-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLD6NyEj8Wl5dwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35735-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 23:14:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6209D48C43B
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 23:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF760304D6CF
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 21:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4B23A5E66;
	Tue, 28 Apr 2026 21:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WAjSRAHU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VfnY2f8J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F57B3914E1
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 21:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777410835; cv=none; b=fORiS+wTwYAO/XiXoU1/RvpraABa9V87x5y8QX0lILdk1jToeegjspHtEQ98du4U/dFQnUu77COQjjXhvBkJFofQIrY8duLnC3iYKa+yQi+BbHb5am2xWlPO1enLH3McgzuXhwiClcWg3Mpc6xJfYa6palyfB3Zpw5CQ7vMBrj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777410835; c=relaxed/simple;
	bh=Hrm0ZhcHcgCT1XzU3maGBkU6Snz85dUcp+3SvUfrY4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j1kIxh9MOpuahx7dn54yXWEIHgu0ChnO24MRNjmEakH/ynTGOHknFbJcIlPvAS4Lr5OMhlR12ju4YBWyo3CyA65kzVGrKj67T/16WLdzbDC+h6Dcp+F5Z6UqSzCKx1epnF285Xk8m1XHijHD+mv7bLw+tP2cKXaoCjgGlVVU82Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WAjSRAHU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VfnY2f8J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SGtH7N2984795
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 21:13:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f7TCDHNSisOZ4cJJC/DCoEBk
	+8T/g6HxxJjaANTvPeQ=; b=WAjSRAHUekQ7NED9nimZkG80gnp5uIoyFJuLDCwa
	kNNQymlHGipY+WOOrKJm4io6w6OWu8RwKxfqDO7cRU+jLhftD8235bgIqmtw4baP
	gjJXdliIxYYO1tORXlyfAf3G3JsWHQXtU4MhiDl0XXhysvyZRjWvCKk/YHlJeYO4
	fjp2+QPDaNj+m43KJyteZK128mNiSnPE2769POprj5nN+nC+x3fxgT+ilqrkV8/r
	5k9zX0P0rKhlryvA5bedIl+XkyZXbBEOlM+FX27qLh7l/2Jl+bJGjLWCQQAXK7hs
	jkSOxkUeGioZoVPVzJgk2QVImHamQUSvnJc2EMlfjpI+vw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0u1rvhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 21:13:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fbc70cfbdso197720121cf.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 14:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777410830; x=1778015630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f7TCDHNSisOZ4cJJC/DCoEBk+8T/g6HxxJjaANTvPeQ=;
        b=VfnY2f8Jz4cg13xgTl2F00rDaYO3uXMzkE7KMHzXWkzvFfPeVr/N2JafM8WNraZF+0
         dDnntalT9TLgmzDM7uC/XrF+sMkbJoLTK8W9MnqQY5g06hmKFHCqzwsZVhwq3rCS6IgX
         5KPuToyxxkbGTgDKHHnlnhswR4pGfhoDYOHOlhMK/XBhveXa47h73pZhJXyWUxFDaFRo
         Tea8pGpAfXp6PTelbgGvHgm+FRbz9pJuu1duSoVAJhp/5hEKsBte4JLKXdIewicqEDYn
         aaaWc44KCuLh+lLn/fFvGEecjDwTR9ogaiLpdObxcQAv8/CZiDyulaC2XWtioXsriFpP
         51cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777410830; x=1778015630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f7TCDHNSisOZ4cJJC/DCoEBk+8T/g6HxxJjaANTvPeQ=;
        b=EaZhDMODpZmL0rKY2EXPqyM+ckUBTyABaOkQvxPJbjipHzZRt43GdtcKxbER12Kc/8
         ZcF3TR80xbWMwR+JrdfK3XXVi3MGS80DshC5PMeEWHsZmykSN1+nODIEHviuJT2xJttd
         XXJ0INvvUnAA9hGbZW1lArWUocIgJeEbII+bZOMCqa+qmQHHehtxKVRTiNYY4VByh7Je
         9yrnnrJJi2nGLBJxLBjI0utO4XK4C4mPY7PnbkJkMZ7yaJMHHRAjIDr2jmzGYS3+ukMZ
         u0n9js/lQ7DF6ABut3qNmM2UeB8VvoD9tsmc3WY/NMnTLailV/yiiRsJPzlOddejK3Cz
         Ub6g==
X-Forwarded-Encrypted: i=1; AFNElJ/r2AZ8xK9F4/BViilBCsutK0hd1myNWdzt1ezwrVN3pUHnUoCdspd+A8ARt0sFuvXZI6cCIVXaq1OK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3KphWn7iLJywnw5Myr6xc6b1Av6dlOM93kBEzGecs66YPEaBo
	Mqrj3faXGZKiMCdFW6eGXX4sCP6sEAHu41MfDMbcL/ODamTvJkoUImyXyZQ/T8H3Zmm0Yu0D0rW
	S/DagWvhkHuPnHKA8Tb4e54kX6/4oCoBg5p0NLdBwQuZqZpNDHPCQjwLtRr2zcsdt
X-Gm-Gg: AeBDietgYD8t1Kk9mcybt+pwBYmujXb4x7BU1Ez6xT3ZSFW0Brph4L+mYdpz4y6BWdQ
	DxocDi4KhM6h/rYe4xZTrshbxR2M/YiDANJ/YAZbF6cvWamtJBQfcEE8omK+bVrn7zQZ5eJIuZG
	lKf/+6YFJhf9fHqt9oEQ8sf9SQRKG3EcpocD05YFcD+Gn9Vrl2231GC7hS9GwswhX8GK4p9asTa
	aTI4CG+yagpFbd0UjbZg2pVk9MqWNT2xGNm7aytAIEsSUNTbF7y7QPmpM3rNo0uymQaU/WmTqUY
	99vScnTcQZd9qF/BqkXd86ZcXXNz0w0j9hDhGVt/TgxsdFrgkwZRemH6qXIFNCkKGrivI5r6B1X
	+dQDehHhLuu8tCMK+n0OF5Q2Jyyd+gQPVUBTJcPRKfimtvJeaZr0RuMreESLpjijxZPVnElBj+1
	zwLHvb1CO0My3cU53IXjoaoI4NFhCPhl34UP0kYtURmnSwLA==
X-Received: by 2002:a05:622a:4115:b0:510:1325:58b9 with SMTP id d75a77b69052e-51018a8d7f6mr19041361cf.41.1777410829599;
        Tue, 28 Apr 2026 14:13:49 -0700 (PDT)
X-Received: by 2002:a05:622a:4115:b0:510:1325:58b9 with SMTP id d75a77b69052e-51018a8d7f6mr19040911cf.41.1777410829073;
        Tue, 28 Apr 2026 14:13:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a74a756d1bsm34384e87.47.2026.04.28.14.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 14:13:48 -0700 (PDT)
Date: Wed, 29 Apr 2026 00:13:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] pinctrl: qcom: Make important drivers default
Message-ID: <lccuj5tcir57c3pzlcvyjmle36alr64zv257si4taqis3novrs@exgphqb3k6tx>
References: <20260428163548.154392-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428163548.154392-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-GUID: 1nyRYe3KiseC6x-Il9JubyTAqwV5RxvP
X-Proofpoint-ORIG-GUID: 1nyRYe3KiseC6x-Il9JubyTAqwV5RxvP
X-Authority-Analysis: v=2.4 cv=aPPAb79m c=1 sm=1 tr=0 ts=69f1230e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=_EZUpx9RV_GiafN7jJ0A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDIwNiBTYWx0ZWRfX6Wq33aJwfPR0
 z7ZDtNO3vjBuU47TsbuIXQC7iUainayvxKBwsPKL2lSA/X5B1haU22dZ1IN0l+E2qworiOV9lJw
 R1GzITK5Rcjs1YvrsUME1Z7VtJrhah6ZwZbqv5i3BKzG7TkHR75PC8b7Cnn/yLV5/Or7IVSRyYQ
 oRQVrUbTQKuxln0954Kozkl3i95u64QIBYwajCSqUMB+IQ/2grS3BfAnZN1q3OlbuzNQoj9gmu7
 a4K75BbH8seLjTHeSUPXHeLsOEkJMA6Zu/lAWQVLU48Z8WhmGq+pE1MUge9rIIRApFQhm2RdcZM
 zeywjsvizLCvAZ8w+yJ1/7odDywwBNoqcSwcIEl2dMmrmNunHtBTYKFn9KrLN6dNnsaTgyRIfAN
 lhF7yBY+tuWi1+Uf8vCtXO1lTd40sPsrX3sd5+OI1/GqqdmxV83D5kqaelncDSSMfct7DESyGPj
 9YoYBpcR3AbbMl3+9hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280206
X-Rspamd-Queue-Id: 6209D48C43B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35735-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, Apr 28, 2026 at 06:35:49PM +0200, Krzysztof Kozlowski wrote:
> The main SoC TLMM (Top-Level Multiplexer) pin controller drivers are
> essential for booting up SoCs and are not really optional for a given
> platform.  Kernel should not ask users choice of drivers when that
> choice is obvious and known to the developers that answer should be
> 'yes' or 'module'.
> 
> Switch all Qualcomm TLMM pin controller drivers to a default 'yes' for
> ARCH_QCOM.  This has impact:
> 
> 1. arm64 defconfig: enable PINCTRL_SM7150, PINCTRL_IPQ9650 and
>    PINCTRL_HAWI, which were not selected before but should be, because
>    these platforms need them for proper boot.
> 
> 2. arm qcom_defconfig: no changes.
> 
> 3. arm multi_v7 defconfig: enable drivers necessary to boot ARM 32-bit
>    platforms, which are already enabled on qcom_defconfig.
> 
> 4. COMPILE_TEST builds: enable by default all drivers for arm or arm64
>    builds, whenever ARCH_QCOM is selected.  This has impact on build
>    time and feels logical, because if one selects ARCH_QCOM then
>    probably by default wants to build test it entirely.  Kernels with
>    COMPILE_TEST are not supposed to be used for booting.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> I did similar change for clocks and I will be continuing with
> interconnect and other missing pieces.
> 
> Changes in v2:
> 1. Rebase on Linus W. devel branch. This should go with pinctrl, I
>    think.
> 2. Add tags.
> 3. Update also PINCTRL_IPQ9650.
> ---
>  arch/arm/configs/multi_v7_defconfig |  8 ----
>  arch/arm/configs/qcom_defconfig     | 15 -------
>  arch/arm64/configs/defconfig        | 46 ----------------------
>  drivers/pinctrl/qcom/Kconfig        |  1 +
>  drivers/pinctrl/qcom/Kconfig.msm    | 61 +++++++++++++++++++++++++++++

I think it would have been better split into 3 patches, but this way is
also fine.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

>  5 files changed, 62 insertions(+), 69 deletions(-)

-- 
With best wishes
Dmitry

