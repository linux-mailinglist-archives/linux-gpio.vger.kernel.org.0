Return-Path: <linux-gpio+bounces-34658-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNPyNHcc0GnN3QYAu9opvQ
	(envelope-from <linux-gpio+bounces-34658-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 22:00:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8201E398013
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 22:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBFC63047019
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Apr 2026 19:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7433BD243;
	Fri,  3 Apr 2026 19:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QOyRI52j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iQjg9i3u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF55123A561
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 19:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775246258; cv=none; b=hA7ScWCP8rNqBZCRoMmY3KkqDTF/gp15Aq7zGjgpjuc1wBAYMlJcc62lIqk5///pcH968teMYxomN2kLh3fX10tmbBtXZ8r5S1Pq5doxwRxJ9gwDg8JWYQwx/9JQ6AFdfScoR6939YuUDoBlplUBHMa5PBcbQh25Vn4/I4Jsx5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775246258; c=relaxed/simple;
	bh=ZfgYI/B2dtQvP6itSBrOwXYKvJ/kEHeKcxrISgqQFWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AUX33rPV/A8uHYOG5g2EVIiHWfAzD1JpIRewM5rWO6wgPvNeKYx93IGYyAkcHlCVN6/88CnDAFKPuexA+x06k2tne+1HcbLe1jctGEILJZgeDEPlTPDcvUqnDqDkrTVfZwIclcDb26dVUWftEfbvcErDiuOT0bMq08KvnnZxTQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QOyRI52j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQjg9i3u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633EmadP142148
	for <linux-gpio@vger.kernel.org>; Fri, 3 Apr 2026 19:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PysCDH89SESlek6biv7T4EgV
	nU6bMf/7kJH/aTj8i/k=; b=QOyRI52jZU/NFiJJ6fKz1aayIf9ycqoAkFey0GtR
	pyeeqyduuWKWcz6wWD9oUvVqci+ZyoFCH/wiUYo9aV3HPrmwXXvAEvhr6q/FdcvH
	ZTPLpqH2Od7JFkE1IJoS+xa8BjUQ/bneIe/hVXVaF2BHKsmNLZVgF/XKJFsJ9Ng2
	woyosPJEwLV4YpHPF9e+F8QqlVb85ESw1yrzbIQ+8rUwfVigdmwv/jhoop9N0QNR
	LukiHxz/xhmxgB/1OALvKhFypm/erm+2d3ZNNu2md4riqEsRRDbSkCE89wulQOFO
	3qDJVhEAnPnKOs6PM+6WwiucPtJZF63vuLr47bYPoQ9Xsg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da83y27dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 19:57:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b802961ecso29263371cf.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 12:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775246255; x=1775851055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PysCDH89SESlek6biv7T4EgVnU6bMf/7kJH/aTj8i/k=;
        b=iQjg9i3u3gHCxpPCZvRnLprDxInJkHwjyn/jF4+9GKzwraXQIvWqUTfIcfx7sHYZCv
         ZCL1qMPm76LAezn/Jmrp5/SP7c6i3sALhoWHJOapD3mKaXnJ/b+uVH9q9pSHCgogObeK
         yputH4nFfpFTJh32Ej9E31Ud+/BEQsY4X/hYN3IEArW4P4MR4O/oeQs0TspNmVoru769
         Jrd+21AsSaDNI2O+I7zeyXmKU1MjNESfGlUIifTAJPfFJRmW9kQCwbylQ4nsbb05V1Ws
         i7SlPNmY/o4fVbfp9etOdHFXBFnVULn0zmspayuWlWPPQnYJXAF3IeyIeoB2vZMUWS95
         Dryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775246255; x=1775851055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PysCDH89SESlek6biv7T4EgVnU6bMf/7kJH/aTj8i/k=;
        b=C/sYsVMsMX+AHKZKjz5bKCuqF72wQM8Qa3pQ7j3sqkUTHDJiPh4QYdK+v5swFxh8z9
         k8xiZ96fND+PtXzIjE2exYpPvw/FvyyK1KxXeFFc2I+2Ovk1bKQxgwh5zQbjSX0No2Vf
         xoJYoXWHHVJYogaX9VYGqpXoTghqLEBReXStcZ307+q8MCHxn+loE3Bkf6YdwVaBfwbk
         9YvAvHSUPNJSBVYHVWP8yf23r0IU8q2DSJfaCL+3CpbMtiUHkcJsnS1x6y23KQxRFH4N
         dcXKLHbDpW0eSrmegtazAUmIAw/AmZMXyGI9xk0rEIo0Mx2ICoDjAI19wXp+nT5DSL45
         t4ww==
X-Forwarded-Encrypted: i=1; AJvYcCWpBEPVONfWTThzPF3jqlyjrngNFXUfDCGvoZ99RwTL4gEVtQQaqLCD7TVDbmw3YfQSDb6TrjLndjOC@vger.kernel.org
X-Gm-Message-State: AOJu0YwjAFeNZLx3DYjJzUozOJqe3/k0y+5N8YL3c/86Z3bX6aMUJfig
	hG/hgYbQw8xLTSEnI+7JnPqRvPIUtGF/RPHa5B/1vnOTtSmmbiyg/qkTITJRLCB8KcEST6gCIsy
	wd+MYv0z/88BugkT8dA7NV383oSRh/5acCwPWQ1meNhomaqjYNRf7vZCNaY1Timrx
X-Gm-Gg: ATEYQzyIJv93mVrYCjLSDk3NeLd6rsnHYFpFgAYG2lQMo5IL+WuOsF0xCMLnTjv6oZe
	G8c4M+2RsZbUs9wUvX7IGtm6J0bMnnS1Ft5gNDytG4+JoEiz7gOTr4XbB75IeM4EFpcYsiH7WEc
	hIj2ir2r1Svn5X97zulZNgY5EsKeoMhH2jpbiJ6OdXIJorkOTyK2ZSFt8gAUCTm6/k6wBCEhwo5
	0msc8rtk6dmQ3lxyOdUACn5PVJfRcg4zLSB/Z8bifUlcRiFeiaTcr0pD8x881njRyVfBIJCg9fM
	IiIwQg1xB430LnvIRiKnsNFx0LCTt0bf4ozypb2pi28XwNF4w1YQ63pFyMNM8vFyaV99bFe862B
	bYpCFv0KSfGFc7Wj9lR54NHBku7o0qnlZmYDpTtDqqMdZedcmHq30L4iA3Z7UtDFuhcB9uxOLKs
	1KeZdZxc4NYrxTtTTo7mlVVgV7HHV/TGDcaMs=
X-Received: by 2002:a05:622a:5c89:b0:50b:1e5d:992b with SMTP id d75a77b69052e-50d62b53accmr63620821cf.54.1775246255122;
        Fri, 03 Apr 2026 12:57:35 -0700 (PDT)
X-Received: by 2002:a05:622a:5c89:b0:50b:1e5d:992b with SMTP id d75a77b69052e-50d62b53accmr63620531cf.54.1775246254565;
        Fri, 03 Apr 2026 12:57:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccc9fasm1624857e87.63.2026.04.03.12.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:57:33 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:57:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] pinctrl: qcom: add the TLMM driver for the Nord
 platforms
Message-ID: <qzmdcdda2el6ixyhwjzyaptagujt5zjdfwuunbhcproua7r2lk@6i7dc3byefxm>
References: <20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com>
 <20260403-nord-tlmm-v1-2-4864f400c700@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-nord-tlmm-v1-2-4864f400c700@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ar6/yCZV c=1 sm=1 tr=0 ts=69d01bb0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ngLGKwS_UPeau5fYbXgA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: X3pYwYfBRRdM8EeiWrN1Az0s6T71DpG0
X-Proofpoint-GUID: X3pYwYfBRRdM8EeiWrN1Az0s6T71DpG0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3NyBTYWx0ZWRfXzTJ3LaIRPgOS
 Fxh7j4jvGOHDL+DXtK7EoeOJ5DADU7PTCfS1XOdykbDYqgl0upJyBaXQYjyXrsFODoHx1gjp1eS
 JU4/nNAquqzuIcGknu7cF/BYvi0z7oBSnjk87tK87/S3UK6gw9X0SBoXXrImcvKBeb0pPBJyiTa
 9x9lWaOlGX5vghmU5Y2Kf44f1y9bg55UZpW0Sa06IMT0PYjJtml/rVvoSDZtvnmUAXY46+Gfbw5
 YATEMFmuOPjtVe1HqA3CIThkIdGqEeHRBERKaqQFv5UECDbUYqljIT8bWZCT8EOj93Nl58kJCI2
 D4Oheb6CK1uKtLHS7KNaDzgppKYzvzL7jYRhShVmvP4Bp+8M8H6Y+p92pd86mfSeycdp1JlPzj0
 9YPMag1/0m5ID+J81apHBTZ6tHgUFuZmDRAtVhRiSq5RnaSYI2beJbrBMiegB+S6i1ld5VU99fm
 ClLqg1yFy1buOomEopg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030177
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34658-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,oss.qualcomm.com,arndb.de,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8201E398013
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 03:27:56PM +0200, Bartosz Golaszewski wrote:
> Add support for the TLMM controller on the Qualcomm Nord platform.
> 
> Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm    |    7 +
>  drivers/pinctrl/qcom/Makefile       |    1 +
>  drivers/pinctrl/qcom/pinctrl-nord.c | 3297 +++++++++++++++++++++++++++++++++++
>  3 files changed, 3305 insertions(+)
> 

I didn't perform a complete cross-check, but looks okay from my PoV.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

