Return-Path: <linux-gpio+bounces-33159-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAPfA+uBsWmjCwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33159-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:53:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC95265CDF
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36D6C31B41C0
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D552A3CF03D;
	Wed, 11 Mar 2026 14:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bDxadHvI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DA7xQc5S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE47F3CCFB2
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 14:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240631; cv=none; b=BsYEDixWKrw2fa5iUpqFkyN9/O4Re7sprwTpHX9LajrhlUAWwKxry0Y+HuAcnnSXIDgs57dB4Hadb/v8Humk51Fm/lPJxglgrYcYDqdd8kdjJRJ0gQ8AVvZNBGmHVPKaY4rRBbXyuz53lEy9gdOu6bJr+SmMCv+HodL4XF4QwHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240631; c=relaxed/simple;
	bh=sqSC6+/K44mssFzse64hRisr9Lwqqa7dRnsrkspm/nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LGu/F5liJ4Qma9QaOEllJAAWNmlAmghd74bc4XKqKEUWMhAK9Vi661nsfs2b6GHW3Y4TW889MlusW5VpDydiqhjKTBbOL6RjRXrrYPs1w75AufV9606pY+v8rpsdpc3MZAKthsNoeA4D6UFQZcPiPi0AnrvTDqyiuhlqSwzfIJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bDxadHvI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DA7xQc5S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BBIY5Y2677070
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 14:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YvrtAHy/lbnLFEN+e13f6AZn
	kCjI5WMhkOhjmIeICPw=; b=bDxadHvIawOHnBUjjGeNuA4s8/UiVOiZMhoj11U9
	Ug3TnUYZ09Iq1vbDY+ZRpltmngoQy94Oqthi2RBxi2PE7xjkZrBm4DkAe6hXjLFa
	CLfGNBHNxv1qLjdvdTE3I1y1lcK/4soESX5xfWchsJ6CRldW7OlijRuC2yHfPdv4
	cereTc03W2fU4JgoulCEnJMEloTHPtnLFkikin7YEI6qfU+1vpfWaMzni9X7ROM9
	3pXC3dlzrDsYyDtUP0BqKhYy2SofV4UOUw+9/sDk41MQZmqVq2ne6AvF34710jez
	AdlojjzleXYPgOVibnoleVsdrPcsTDeh2Nr+VguKmnWxmQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu3cd1u78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 14:50:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7f6ac239so2347678285a.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 07:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773240628; x=1773845428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YvrtAHy/lbnLFEN+e13f6AZnkCjI5WMhkOhjmIeICPw=;
        b=DA7xQc5SntshUHnvjd1FvxUk5rLbX6ab2rJu+QY7YhTZXc7Oa97FUb5AUysUUCCxnG
         wujjqJmjLPCT+ArmjcTRM1qL+dn6repgvu0RIS+ZV/uh/2B1l2TVafZSem8vnIeJC+Nc
         Zsb94Y7kE33iij8d+TKEQ9sGHRDj+XYtW4ADjYzk6HlMyYcEY8bTBfDLFer7V8fOr7cK
         bqpK7gvVaZbnurzKCAbNJYdZl5mndQoe7R+fATJZSw8vQ/vlNcs+ZXftjT8mrXny/zs8
         R0exVzuDaCMm0rQAnpiR7FjeCv+n1jd/Pg0KvwQH73UFSZDR8iiCjgKDLHMNcGjzs9qI
         QZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773240628; x=1773845428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YvrtAHy/lbnLFEN+e13f6AZnkCjI5WMhkOhjmIeICPw=;
        b=L0LH64StPIZ8czt/7rB5WNYCqB0lEdPP0Nm+NCweBhKElcjy53J3alGz1H/iHHXbh5
         eZznOQ0d0/DeqeMbl/Q7fIVeCpzvUf5ao9oHMxWPwENcF4MlNpOy44qtcU1U32cHxJZW
         DAHqLK/LLcEr7NDD/4TR6QO1oVvmIVynO/OxqvqUdJqGXzIOM0Jf80Jew/c/jGonDA+P
         1myNCW5K2Xdr/mfRq63y6/X+UgpINItikQkUhdx0euS+P7VEDOPi5RKBLfUH13pHjGwa
         PxTmF8Hp29bzwNK8wnmrzCw0OvdI2HQHIMo+sSCXag4lvw7xpDbCOAy0hx7JOOawrzav
         snEA==
X-Forwarded-Encrypted: i=1; AJvYcCXX7nem1Fo45BN6GCPFbJxK5wsvRYbuCnqRDuiEYKMeQXIu/yfaL8zaMt5Um/yArIyaYcU2ev/YF7q5@vger.kernel.org
X-Gm-Message-State: AOJu0YwLyNdyZaO4g0FUjOMwGIWiXnumbykQqGTx0OtrJEskp15mQv2Q
	mjTUiplCPs+1b/4mKXVhDWi4ZEcYRDgW1gjLXyU5RDOW5lTyGgelxntJWuVSJ6SPYn3PZqAadrw
	ufegvLUsAbwGvoSbNDYH61scAx7Yziym+oLoN0gk5eRg1gJ+vNtXpgHI5tKdtMsXRhAf2wHrn
X-Gm-Gg: ATEYQzxalZyuitzJNbs6TItr4VqDeWA2TN75Pb8qGc2uWiq9HmZ+EMELROSRD7NS6O1
	jtgqIB6N82BdrToEZnNf24kYXIz1NCWhEITNDT7PEFEYsPVmF8VX5Gf1VQyNFrofiIvc9MYbbRq
	TqTHuDTtqG4/UgZmEBb6HapA+7Sb27i/+QVkpj48G1wHT5c7/ZQ4aHrzvRFmsG3BZuztoyO7yqo
	nYepzhkL2l2AX5QveXkd3mkOJkfYpFB7pnv02DcIJcKtZ0C0rNtOMoaKCTzCrm7YjmXOlYGbn03
	QNf9KgMrTnQWnP04xB6CQSU/o6Iv/gRgli3TwPzw1zJZ0KumAf3SROZAhtxUOpA9HkcaT/3bcyt
	4/pw/ZLXYaPv8DknzmXm/Uoco6u0Ai75CAnwgHcLRmeR3x5gb4bNnwy5sS+bilI+QYt2Oc4E48m
	XKB4Z1JfH9UHmdtg9jd42laNkBqD78LrG18Sk=
X-Received: by 2002:a05:620a:2942:b0:8cb:32eb:e02e with SMTP id af79cd13be357-8cda1a81d9emr339024185a.76.1773240627746;
        Wed, 11 Mar 2026 07:50:27 -0700 (PDT)
X-Received: by 2002:a05:620a:2942:b0:8cb:32eb:e02e with SMTP id af79cd13be357-8cda1a81d9emr339020985a.76.1773240627283;
        Wed, 11 Mar 2026 07:50:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1560348e5sm434123e87.39.2026.03.11.07.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:50:26 -0700 (PDT)
Date: Wed, 11 Mar 2026 16:50:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org
Subject: Re: [PATCH 2/9] clk: qcom: add Global Clock controller (GCC) driver
 for IPQ5210 SoC
Message-ID: <yzw4ruhxaznndpyzlrqnxlbrveenlpl4yp2ebbshyh2yo7te2n@64gldqqmk3nb>
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-2-fe857d68d698@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-ipq5210_boot_to_shell-v1-2-fe857d68d698@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEyNSBTYWx0ZWRfXxQXnN+YqBy/I
 GFX3ujEiHJ5Evx7SNiLCgfjgXTYeKv/F6lfSicYvN/7luF80qdJezQkA+aIZqFInTUPlmiS7py0
 M+qGggXfHAGeR8VUt4yOVg+4xiSLCggsD3ueg62hn/9oaJ+92Ku70iMbHZROXkH37e8beInYWNk
 OP+P76KWeb7jjUaHXVqHd0kJ1JwUrNA689n+TCWFxRqAdquaAKbHGV7boIFUAFgmgLIbDtxi/k6
 Kr9mXTze5dYXM3X9ggHxs+g0ONpaIdiFkLx6twnR39RCFFS+YCC4EjMNpj2nqrzK8o9BPlpMpbF
 bIpi8d70J0EJIcxV2hgN71U4E2JO3XD1ncaBZpcSE5QfjrDtVo9qKsmurZ4Y5weXkcJY7E/TV1a
 8PkVzY/50dacHp362QhmQ/HHnXoXfVD6LCHo6a3aA4tX4IW19AKCEWgIqhOus0dL6I9lRHQ7IUN
 k1TdelVH8cNHeNHzDlA==
X-Authority-Analysis: v=2.4 cv=O/U0fR9W c=1 sm=1 tr=0 ts=69b18135 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VZZ92KuHIUFcEntCV44A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 9POX20ih5bP6Z3xSqJXzO8PjHApikU2O
X-Proofpoint-ORIG-GUID: 9POX20ih5bP6Z3xSqJXzO8PjHApikU2O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110125
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33159-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7AC95265CDF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 03:15:44PM +0530, Kathiravan Thirumoorthy wrote:
> Add support for the global clock controller found on IPQ5210 SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig       |    8 +
>  drivers/clk/qcom/Makefile      |    1 +
>  drivers/clk/qcom/gcc-ipq5210.c | 2641 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 2650 insertions(+)
> 
> +
> +static struct clk_alpha_pll gpll4_main = {
> +	.offset = 0x22000,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT_EVO],
> +	.clkr = {
> +		.enable_reg = 0xb000,
> +		.enable_mask = BIT(2),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "gpll4_main",
> +			.parent_data = &gcc_parent_data_xo,
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_ops,
> +			.flags = CLK_IS_CRITICAL,

comment, why?

> +		},
> +	},
> +};
-- 
With best wishes
Dmitry

