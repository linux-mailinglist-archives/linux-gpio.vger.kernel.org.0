Return-Path: <linux-gpio+bounces-38514-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tg8zCfmPMGrOUQUAu9opvQ
	(envelope-from <linux-gpio+bounces-38514-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 01:51:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8739668AA9E
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 01:51:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="UY//1OGH";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fx5iU4bZ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38514-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38514-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9557B304C137
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 23:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1EA7346ACE;
	Mon, 15 Jun 2026 23:50:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244702F39AB
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 23:50:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781567415; cv=none; b=eXLX9rMBIuR8FeG7IE7jV2E1p1Dbt45YvbbV6XLxteFBdOV1MkqUN4/CrwPZ1HyP2y8gAjDFYfk9oZ4YYEAlJcCZPbzAoPNPOm+nTUjnssYO6Pp79J8gJAOdMrQETmUD+ELbE1iDma7PSy4BjT8fXKqukbnNfSjp6xgkE9BLVx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781567415; c=relaxed/simple;
	bh=ZJE4bpawKev606p9CfK/9HaQjRenhBHPXjX4K4Jv79w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohqDitqA1Xr+yTPXLwqGXoDnCnJPU+y9QoXOf5ker+g0ahJJTotHy0Or3m1x/bcdC2bccyXkYYWkfdTJks/zTUwJ2Fte8poSRo/2UKw13X0ZZkEHujdq7Vc68kN8m4clXJU4KJQQ9GNjkpZi+DzfQhPfnIB3wjPHzRINWKgshIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UY//1OGH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fx5iU4bZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FJ1LN61433238
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 23:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PtbPkBFkYuHZJNlttISlt1Fz
	gsGmJsC9TY2z2xFeuuQ=; b=UY//1OGH8tUQ93zAAz28HmsDuC+tPCbGTemB55dg
	6MqwM/Bs9d+ynvYTPnikYjMx0Vpjw/qn45+3kmO1cqpNfdHOJq9V79qAsP3/cSp0
	lVhMJBCQa2OVONHzi759YK5R41NySz+nnbABDLo8THHA2anH7wRb9iv4kry/d4H5
	1uVXp9S7u8qVamxsJsagzxkTBY4MY7uSHHyswUDyD88efeifYAfRqnOYBmPRyPHx
	eM+f487bfW+saacHa73P/HV7OJuvzThfPZaGASwzgT9iZA4QxqMcsxYaimrVJqkR
	xpGt6va/YAtdjuypZIWS0r9Yg+bX4u/qhuwTPgSmdnZiBw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etgvhk5br-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 23:50:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91579011fd1so596838585a.1
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 16:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781567412; x=1782172212; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PtbPkBFkYuHZJNlttISlt1FzgsGmJsC9TY2z2xFeuuQ=;
        b=fx5iU4bZcHLnywoYX3dA+XMEKjagObBun0SU1Q9p2ciyKhvOdbd5tg/C06DwwqBJf+
         d0DQ9USqdfMeXnT3xXMXFafrxCrmBf/OOf0bCPOtJZEJf+zyzUUTsvcaTlb119cgmDpe
         5prAx5c7d8KZ9SIfY3PjHQCJZqVDU+6ZFO1ZlDbzC6i0DXego1WqcgWkK2sf6dtP/SWF
         LzTN68psDze+TcXo5pp0IHSFSO9BLB/jjxzSuX45TNfoDYb78qO30G4ISvAs1snrKw+i
         JH6T/wTCma4FUnGdpK8ApKULNtPgvcLsT9cJPGxjrrJSUpLi9Gh1l5v5cBBQpe9Dlw/4
         zn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781567412; x=1782172212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PtbPkBFkYuHZJNlttISlt1FzgsGmJsC9TY2z2xFeuuQ=;
        b=ooSRuFptIq06psVUXmEV5lHwfkuzipkDtslQKKFXIvXPoQhYEzMkCEp8k1UiQ/Ov/I
         iOSmv/xi8W4Emu2B/kjrT2kcyOfVhFFSVsyq7Sa9fvmQkjlEoeujrtsy4b1IxyEnJjbn
         1iBOsjbslWz+WBRZgZHFBUTXmTqcK/a6OKHYHM5mkaA8OJSRczqH8T9J5CLQS7hP4Lms
         raQDLSmMz/kZFQ2mhihJMemoOvbfbPdeyGHb4Et0HKiYIX6fWAbn0vvR1+TY13TyV3zX
         sYr52hdE6jF7ygI5RDuwybnwwH68FaWu8Fdwyk+F7iWha4CJ3ryQJLmZgpFHQ5D0DbUs
         yUmA==
X-Forwarded-Encrypted: i=1; AFNElJ//UVpWEoWEX+96siPQV4a1f6l2rrh4ewI9OdWZNnz8+60CN//YSNKrb7pxoEvZ3HGLCGKNEuEm8VUi@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm6GD9StQBFjT6OwqQPMdx1HJcHztbFdws0OzJz09TM6jkZEVo
	5jNLmsfIvNn6avm8a2V2ZVM548SF2vj1RRuDKueW5SWzwf6/ZSThy2KVQvEy8Jpf/Oge/msj9sr
	OQdn22iZCqDQ5tRUDoXOqLMthvpUHw9KPs+bpL2ZpcutuLQp1t87GqncttTE57jL0
X-Gm-Gg: Acq92OFoc6qXUBq8sd2DGzQUQFg930cOuH2ZmyJdrrP6C8r0+SBj4SP7Qp3A/OaQHaE
	rm0xSUf///PGhiaDp3cqsUpMizlV2fRSQVfZxj9t9GoHe8dLyZGTQwARmSpkHOyDsK85lXxagz/
	5D2hgVV7IVaRzurw3bqJLITVkaZ5ClvPzuToFAfsuF1Pf/AMrr5owmDyIEpAEu3h+TYpe4rONks
	JwTCNfe23BYE2VB4Y3h4w29GNHNL7DEStH+2DcVKuoiYmgNf02BolgsL595G1YmwByypnSulJKs
	WWXJh9RK35Bmpq/ZHsuwexTFDauHw4poc3+IzYXKr3eJdwmmEjdMMADJYvyV8dzJiIpEZpA6Hr1
	UOFfDEmNdK6u8ZR34yLOaYnNAV/dwWo+m6Ao+4xoRAysXJa6jsyF4QLSRouOJFRPyJFCgg257c8
	if304IOqUo/JqZ9PV+YcM7vqu8w0sQeqmy0pM=
X-Received: by 2002:a05:620a:1b90:b0:915:89d4:df18 with SMTP id af79cd13be357-91c47f6ea93mr199515085a.41.1781567412414;
        Mon, 15 Jun 2026 16:50:12 -0700 (PDT)
X-Received: by 2002:a05:620a:1b90:b0:915:89d4:df18 with SMTP id af79cd13be357-91c47f6ea93mr199511085a.41.1781567411932;
        Mon, 15 Jun 2026 16:50:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1ae1absm3015001e87.59.2026.06.15.16.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 16:50:09 -0700 (PDT)
Date: Tue, 16 Jun 2026 02:50:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/2] pinctrl: qcom: lpass-lpi: Enable runtime PM hooks
 on LPASS LPI SoCs
Message-ID: <jo3nelsqepovnmjc7ycsxehfc7iprzzplx4lzei4s774fb4xh6@t2pb5vv5kbf7>
References: <20260522204644.4101640-1-ajay.nandam@oss.qualcomm.com>
 <20260522204644.4101640-2-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522204644.4101640-2-ajay.nandam@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1MiBTYWx0ZWRfX2oNVwJ5SD8dp
 m8i2AlOY9tH1MMETx8RT7Wm2pBJ7mEbY2NyiFdFGjjqidRLOg49U2bqOhVGkJHQszxABcmP3QfW
 KNyDDoXpCeJNtSd8AHXwdugczLpAPoA=
X-Authority-Analysis: v=2.4 cv=Zqnd7d7G c=1 sm=1 tr=0 ts=6a308fb5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=1z5vHLmaq52fhps1YVsA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: cYClMJKSjqy2Ifi2TFwdL5KfFlOanmuJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1MiBTYWx0ZWRfX0dC5RAoEPzET
 4/Tp3XKxqb7yhk8xjwegXxp7/CFhWzQziS4sKIsoGgnZWLPMwbx1RqG36BQCcKM5WZJH3WdFqu6
 730DsnPwhKcnC61lMjmEoxS66zJ0SnweS2QVd0KUW/XqxSzTiWUE5gElWuxjuuWp9At+I9bgBz8
 CKVDxoVuxo+fhOswUEc9FfMRKPXoaIaNK7YJaNL8B4E1S9hGxH5z/XnD+XyHy1jf2fxZJrPPTpD
 9T+gJQtJhoTWtkgnfex953g+Kez9UHww5U6p9Fjje/tP45nlblmfajNyXbhk06MDlRuZTgTbalz
 n2DtS8wts/Kc5O6Vfpobj3ks4sxHtvaAYPGXysBaa1kWIxmDlu0VkT2iOHCdkrpmE2Gb79AW7Jn
 vAaYWzhHc6Ir2vU3m5JjrLytYOlEUEabkzpHOmfVHBtykp+xSSG2pZqCVTMu4XE9flqZrGApyrn
 Lh8FRpELx6lk+zgjWlw==
X-Proofpoint-ORIG-GUID: cYClMJKSjqy2Ifi2TFwdL5KfFlOanmuJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150252
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38514-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,t2pb5vv5kbf7:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS(0.00)[m:ajay.nandam@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8739668AA9E

On Sat, May 23, 2026 at 02:16:43AM +0530, Ajay Kumar Nandam wrote:
> The LPASS LPI core conversion to PM clock framework relies on variant
> drivers wiring runtime PM callbacks.
> 
> Hook up runtime PM callbacks for the LPASS LPI variant drivers touched
> in this patch so they are prepared for the shared core conversion.
> 
> This commit is a preparatory NOP on its own, as runtime PM is still
> disabled on these devices until the following core conversion patch.
> 
> This is a mechanical per-variant driver update that relies on the
> same generic PM clock flow (of_pm_clk_add_clks() + pm_clk_suspend/
> pm_clk_resume()) and DT-provided clocks.
> 
> Runtime behavior was validated on Kodiak (sc7280).
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>  .../pinctrl/qcom/pinctrl-milos-lpass-lpi.c    |  7 +++++++
>  .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   | 19 +++++++++++++------
>  .../pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c | 15 +++++++++++----
>  .../pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c   |  7 +++++++
>  .../pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   |  7 +++++++
>  .../pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   |  7 +++++++
>  .../pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   |  7 +++++++
>  .../pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c   |  7 +++++++
>  .../pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   | 15 +++++++++++----
>  .../pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 15 +++++++++++----
>  .../pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   | 15 +++++++++++----
>  .../pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   | 15 +++++++++++----
>  12 files changed, 110 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
> index 3bf6fe0cf1bb..72b8ffd97860 100644
> --- a/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
> @@ -7,6 +7,8 @@
>  #include <linux/gpio/driver.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_clock.h>
> +#include <linux/pm_runtime.h>
>  
>  #include "pinctrl-lpass-lpi.h"
>  
> @@ -203,10 +205,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>  
> +static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
> +	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> +};
> +
>  static struct platform_driver lpi_pinctrl_driver = {
>  	.driver = {
>  		.name = "qcom-milos-lpass-lpi-pinctrl",
>  		.of_match_table = lpi_pinctrl_of_match,
> +		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
>  	},
>  	.probe = lpi_pinctrl_probe,
>  	.remove = lpi_pinctrl_remove,
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> index 750f410311a8..a61df10d46cb 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> @@ -7,6 +7,8 @@
>  #include <linux/gpio/driver.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_clock.h>
> +#include <linux/pm_runtime.h>
>  
>  #include "pinctrl-lpass-lpi.h"
>  
> @@ -129,20 +131,25 @@ static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
>  
>  static const struct of_device_id lpi_pinctrl_of_match[] = {
>  	{
> -	       .compatible = "qcom,sc7280-lpass-lpi-pinctrl",
> -	       .data = &sc7280_lpi_data,
> +		.compatible = "qcom,sc7280-lpass-lpi-pinctrl",
> +		.data = &sc7280_lpi_data,

Split whitespace changes to a separate patch. Never mix cleanups (like
the whitespace or formatting) and the sensible changes in a single
patch.

>  	}, {
> -	       .compatible = "qcom,sm8350-lpass-lpi-pinctrl",
> -	       .data = &sc7280_lpi_data,
> +		.compatible = "qcom,sm8350-lpass-lpi-pinctrl",
> +		.data = &sc7280_lpi_data,
>  	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>  

-- 
With best wishes
Dmitry

