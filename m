Return-Path: <linux-gpio+bounces-32523-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GM4GDiTGqGmAxAAAu9opvQ
	(envelope-from <linux-gpio+bounces-32523-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 00:54:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9795F2092F7
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 00:54:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D14D8301B91E
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 23:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA5738C2C8;
	Wed,  4 Mar 2026 23:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bHnTZhnF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BsK7qQ8l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A746D35CB80
	for <linux-gpio@vger.kernel.org>; Wed,  4 Mar 2026 23:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772668420; cv=none; b=LAlTfYOdCcc20AchXG3ouGfIhGkijfWmIiWi+FKTgKoW/3LYtAk9/74D5g0PnHasXw2vZVmSGsk6mfc6i4eTeZ3Yqnn4XwUSjjGeijsmi0Q0ViziTZhIySLrEL/Wg/ENAUMZl7aI3FWOsVePPguQIz5ZK2VtKz8ivRJ/Lqta3MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772668420; c=relaxed/simple;
	bh=hM0fx+PufUG+eR0kIJ1dr4h1ANr/zb80CpZtG5LPG3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DH6DjdPSSLf7v4BoX/3WDAwj6JOA0YI0WN50x1MXbhk3r5xajl2fmuFFuhiDPxEtN28MQfozOd1nSO5LoVzC1ZY1xvZ17dKlaSE+qgxKd55xKSfHs9FE2xXqCDr49gJHIB27g3RcBlxoJ+bEajSnoBcjZDZNrUZYNYLuDNYdzAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bHnTZhnF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BsK7qQ8l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624K9MYB2049523
	for <linux-gpio@vger.kernel.org>; Wed, 4 Mar 2026 23:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V50tlCURGOSWEpUNVC/f5JBG
	lAu9WVw1+uCs3+cXy8Q=; b=bHnTZhnFYn/tiIi8J4ULThpsgbab7UrmgW5OOJJi
	m7XwaAv8gzL5i/PPJCFmKWpARNfKhBWcj2eQ98Jty0ias+PktBjqdKCkXAPaELNj
	a0Gl+BUEEowrMPAKllx/ORmbxKvdbnv06gsWNMRC4vNwMWDRsN+/Umbybcd+e88B
	r/+5sfU/Jr5rGByjhLIWV29LUZnpLgy3RQf4wS6C8MkG2aHm4Hpng0Hc/lXMymq8
	+xAymHfPQW0I/zSIuwudwEu/Xyt9EGrksONWTgra0NIIeQgGca3xHZntcQ/B1uyx
	S9yybI9F7OtwJgszxO8ID4FgfjHXJVcqqpvfDRNL7lu1yA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuhb0g4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 04 Mar 2026 23:53:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb52a9c0eeso5525853985a.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Mar 2026 15:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772668417; x=1773273217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V50tlCURGOSWEpUNVC/f5JBGlAu9WVw1+uCs3+cXy8Q=;
        b=BsK7qQ8lpgf4MccOs8W7P4/DhshR1Te1sl3mDVTFek6FHBU+SP+YnG91rAsMrSiBqI
         9ZI/l49Go+6X2HLBzEJuQUMqPhS0X21IMF5frdw7o6p9+WiUwihLtOucPB4UwcVB7gR1
         /TDtEKV+6eRrKNTjJVjUEslUBQ5NnWU/e9vVl9ATl97WjFl5qiYxpUVMnoDmE3yXf8Fl
         yGu1qjp72SH1jaPwdnfGvB4t6p8C23m19vvnRxN28ms3opiktg9gf7H+SBz7N5rm2EmS
         oZFO6InnfnmC0OlubIJXakoZV9aFBjmrxoeKGbrYw3Fk8nbvhs8RM2xp5cTA7BfjB0Ug
         XpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668417; x=1773273217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V50tlCURGOSWEpUNVC/f5JBGlAu9WVw1+uCs3+cXy8Q=;
        b=jKo8W0PGChKQn5lRiukwTcNHo+RVcpX5TH+cNnqMpHsYw9iJ5dX8AlCTwIJHJj7Rz9
         LjzB8T0biipMu9W2Z68VJ0ujxxfZgWz5N8wNk9ATqxfXlYAUlH5eH0p4ULjumRGgWIz0
         4UBvDEqw35l1ynLpFQUCDAEhPSfohsmmt3TzbkPNfH7c/BCvTNcLr2TQE+iJcvpECnJL
         iWfu59sh2rk9eP38wsQj8Ajt20D772hnJQpF9pZ1IZnL7Poih5JpPKkGDe+QAQKjomt7
         jQ1uhf2AYoRktZ/T5RWABcPGHbRE9SC2ZFKNztmJqfKyZErnlPiBIHqMi+u0K0hky9Ss
         sbUg==
X-Forwarded-Encrypted: i=1; AJvYcCWHZID8LFkFejg+6rAs2/8x6FKpdl/Qf4tzTU5N57CwrckOMNQY1jgaEd1I90IwpIpyojH5VBcUXIj9@vger.kernel.org
X-Gm-Message-State: AOJu0YyGf4hVuXn3ymtwwmZdLFmzeG/EpO0O7OiQiUtrI31RQx0F1oY7
	kjQ+2s8nPJmLcYgAji1j4Un7YE5qJ8/QRKzuKPp75S0/jGDjeUdu7FCakrE9DfT3PwJ2WQWSG3r
	I5UR0DYMhkNutfvhBr8o/G356wjlFqDZnPDcB6Uho/ofe5FEoUgF2OAqNeVVz0VOw
X-Gm-Gg: ATEYQzysHTmAQfFo0Q7cNRddTjNUKrXf6ExxSkzL1YKBB18eOYCJyu5PrAVeCG9MskM
	SFGllVkYIpswnu5xAzRhUVweJ3JQyOjCX79o2TQqArG+eUkCDNbwE4NDWAWymP1Cg0OxIy+NPTK
	lMXvY1zSDZOVrpAwf9Qnet9Emo198k1cjdS2GtT+KVSpV9CCVKa011hrox/mlDWhSVEbcXVf6g1
	i3RbGzwditiTD35gjkwBRW9UvO1/kinjVxeK24h6fpSJ7bkU3gM/BBrmw/2Y2rO99uE9lcObymi
	CKkTNe0ZjfUCwcC9qbApi2rUI3mtzGmvaQe/bcsopujsrACpvcCPtqnQZQXc7t7SrmQhMPAyjic
	eXQSBMgaJNwLTpDQ1dFY2fHksUskdj4e2ArMIE+zRYaY3YA/9YIntfYgfRSfa334lbY7A242LVR
	DLKytcD7G9PrcJjH5SIahVyLz+GbO/kTPay7Y=
X-Received: by 2002:a05:620a:3727:b0:8c7:c25:9e53 with SMTP id af79cd13be357-8cd5afa6707mr498607185a.59.1772668417037;
        Wed, 04 Mar 2026 15:53:37 -0800 (PST)
X-Received: by 2002:a05:620a:3727:b0:8c7:c25:9e53 with SMTP id af79cd13be357-8cd5afa6707mr498604985a.59.1772668416537;
        Wed, 04 Mar 2026 15:53:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1296993a0sm933837e87.31.2026.03.04.15.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:53:35 -0800 (PST)
Date: Thu, 5 Mar 2026 01:53:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH phy-next 11/22] drm/msm/dp: remove debugging prints with
 internal struct phy state
Message-ID: <esbforcln7bi4e5enmgwqj7d63usdyoobxyo3hwd4paou56aoc@kjlizz3ubksd>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-12-vladimir.oltean@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304175735.2660419-12-vladimir.oltean@nxp.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE5NiBTYWx0ZWRfX77WuS8D+DQ4E
 R9BoXNSL+L0B+P03GxX+EJ9+tRMFkfXvFWSV2Di3/5yqN0R15fPxouV4S112yLWEIhzbD8tmNxd
 xsXsUhtMmRd1gVAGzNNorxl7VLLdXmh15ii9scWWTDlKuJB8lsjx+3fk9B6kmHURoCll2ybgTGg
 zOU21LXKOUhtHh6mDDbK6d5ADpjjXx6MiT1fxsM/gMnKzFw3kJOOguJOU8RWV7ffM5R/SBcsZeU
 HUpOPbo+yP81FEZ7VxzYKjWmDASyF/Zgt4lMbsDmbaYQVOW/nsSEWD7KGC+AaJt3Pm/jyUcma2O
 zi5J5xoLGWaCxHrlzusgffm62Q3OmhMRQjpD79xyKwxulS9Nx6768kTYImxTqhFdGtm2ylXEH1X
 SxGout5GZzQvnBg2W97xWeVcnC4emMpQG/Ja/5IKsIt1NVpbglpq7QcBMgTRIzbdwZh5ob3KuUP
 ZFZNVBQbY6e92cwAJvA==
X-Proofpoint-GUID: D0-LkbzqntYOPJz8RUgsxjQeyA8ZFTxg
X-Authority-Analysis: v=2.4 cv=SqydKfO0 c=1 sm=1 tr=0 ts=69a8c602 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8
 a=3ogKHO_BN1K2bhpmqR8A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=ST-jHhOKWsTCqRlWije3:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-ORIG-GUID: D0-LkbzqntYOPJz8RUgsxjQeyA8ZFTxg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040196
X-Rspamd-Queue-Id: 9795F2092F7
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
	TAGGED_FROM(0.00)[bounces-32523-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,linaro.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,microchip.com,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[poorly.run:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,nxp.com:email,somainline.org:email,ffwll.ch:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 07:57:24PM +0200, Vladimir Oltean wrote:
> These do not provide much value, and will become hard to maintain once
> the Generic PHY framework starts hiding the contents of struct phy from
> consumers.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Jessica Zhang <jesszhan0024@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 18 ------------------
>  1 file changed, 18 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

