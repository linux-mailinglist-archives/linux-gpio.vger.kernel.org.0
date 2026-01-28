Return-Path: <linux-gpio+bounces-31258-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDrjGd6Kemnd7gEAu9opvQ
	(envelope-from <linux-gpio+bounces-31258-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 23:17:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB747A97B5
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 23:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6E9113007218
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 22:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4677A25782D;
	Wed, 28 Jan 2026 22:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GNd6cFec";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MYVrfl1s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0C129B200
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 22:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769638618; cv=none; b=BKdu3ZG5WzT9D+kFO3uypapGZ87MzbBRzjff0FrWCrdTAgNddodc3k7Q9sKMIE+uk25sPtw/TcED7QpLsrKQXrTE9VRdOOnITcbFO8eEHhGw082IrNXYizcgmiUMRtyRGj0g3h96aKo1kkg4zHjHisszeqZspV9zGeB5ytWY0Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769638618; c=relaxed/simple;
	bh=YaESPBqOnkUcIkx/6aDkUMz4rynF7sBFcZ5NMbkuJjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSHIpER7Jb5AWTTDv4Pb1wzvv8f4TgKWwvEXEoVXLDjudvkQUHQmJOvRdXmR3yzbUijIxVva4Jxev5mK3DdVfSA+Bq8HIP1srT8BetM661ikx5gWaHkEuf1hv4i9M449lLbC1c3T/JVtwB1Lm2hM+oVEI6PrnI9BO21KZ/FZ0cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GNd6cFec; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MYVrfl1s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SLpWOx1399064
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 22:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=78YU5e+9hc8xzn+2Vdz7AwKA
	cJfxmpv8KIN8i1ABzLY=; b=GNd6cFecJEr7OEvGkj5qttsZELuy5Dp2BH9wLqiz
	qLhK/zbHKatwGp9krlH4ERdHfHxOUtc63NcnPhtd5Gioh541NTTHpqFhggr8Hwzy
	BY9A48MGjriELAKkGS0w032VkrUPVdJ/qrI2TMz2ZVIK0UPqGHXxi69Fai9A5hHT
	zz7trSoJYvXw7HgDjP+ZvaqoYNd63Djp5rU4Yw89vTNs8cUFFshtrM77I1en0NDe
	9VO4ckfkcuXkMADh8vyGxn3PVCXWE+Ojl7m7DG7v82gy3i7Pm6SVgum76BNoeaRv
	v6lOjzii0EbVIkToRUu3eH5KY2ToNdaMdirCHaXl9uHLCg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bytqy01x7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 22:16:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70a62ca32so102193085a.2
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 14:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769638615; x=1770243415; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=78YU5e+9hc8xzn+2Vdz7AwKAcJfxmpv8KIN8i1ABzLY=;
        b=MYVrfl1sXtKlx90yVjrkx5OyqupKNw1sC1CyK+lG0eBNbL8keMp0F3FlKNQMWmGRiY
         3oAXcMTtZFfYArnGQgSlJY8vnCGh5atuXQ3ffFkDMLiJ6ALcFS7iqMm6N9GS30O1dHDq
         l9iY24hFD5EpKWbW9vkyhOlnWatbobR0TmGB0MSV2K+XY+FtmfyWrkx2qUhk12ARWL6/
         5aRBHExtMhqAwSwah9yLSx71KEfJGA/ZAL8280TOySzJ1aAc6t+M0T87tMp2acpM5UMa
         opWUAOj2qnWkPVDxI7XRtUpmBR/UwIbReXJvwR/1Dc9h2EgnZZYO6p4RkN3KrgL4/OqB
         AQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769638615; x=1770243415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78YU5e+9hc8xzn+2Vdz7AwKAcJfxmpv8KIN8i1ABzLY=;
        b=CPOTJmC9fEbNFKmLkyHyVpnLuCUQPTMuDuv9DpGfNvF2FJZD2mLzwlHPBzUh9EkBQw
         cMa2CVfPA03j1nyxEWj/vjqWwNEjAgzB6n8HpeETcIxZo2j8baM0EfuGVgkgR3OV4eqD
         XKsB6xU1WySjEi94wPVp8ZnWeK322wtyzb7Jupn1iBPMCBLVB8VVK1gDmCQCOXmmxUYP
         8JcC8dQ++FKsAJXIIcA9WOyaWt9CjL3LenF0MwI6CYst4T275LiChACtPiAoudKClO/s
         mk/7J93r5n3LeRtXddtDcS0bEqkCCYiQz8Dx/7JTkcnkCdBjYnmRXDIKMYtKF7ohdnyw
         l1oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDXaousI8rhgjdIS+CTROhKtuy2dd66UJiVpY8fMKOIfrWLadE6UZfPYf9YW/0nKqzFE8uzCSEBt0l@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa/6m0FV+xXZ7tl18XTVGH4+E6CchanlztzLW+kxglDamxUUry
	ZIP8nVKQadkUBEU3oDO3G2lAdAVtK6jLVwNJyrGfs/R+7YAi7jxfq7JecmVWSqNoVbiqVFReCAK
	WPf41MK2morNjYe638YQ7BtV9YrXFDiHq5LyEgWEjOq5y/hwaoJFnuu7st7vT3Imk
X-Gm-Gg: AZuq6aLaDQFyjMFjsuOD553Mctf6y/si7g6290rqM/j+3MdoT4FWOibeiQ39rx4TxHb
	+olyhgLRC9pkKiV4DNReG2XLf70I8/R8uEMsZ7ie9cjyPEK79/9HiLMncBK2UEjTpqqeGIwUFfS
	XcRLmOBzhaGGtv6PG+Z13NKs85M7EwSFpsk0wdnqDzj8nXvVpIGw61+CivMAfMbnoynCcNBYNM4
	CeHKZwXNf+rtx8LrDc0J9H+ho4QD9nDPtckLD2CQOO6iyGP+tRQ/xYG1OCTgOs9PG0v9G99yO2r
	ljiiFQJim/8EvwuImhL8w5fbjGngauRFLfFyDtEtti4S7BvwE+ypjJQhsfTt82+kS0F+dn7cq11
	hOlepBWblpqd7UDcl9IN0XfXv4uz80uM/lToz0iZPGlWa8eNCq2IBtCXzvlLf5mQxXgGBUTjjcc
	KLy/lo9JDSdUT3iel27rsDkVo=
X-Received: by 2002:a05:620a:2805:b0:8c7:8cf:537c with SMTP id af79cd13be357-8c70b871e01mr814909385a.37.1769638614864;
        Wed, 28 Jan 2026 14:16:54 -0800 (PST)
X-Received: by 2002:a05:620a:2805:b0:8c7:8cf:537c with SMTP id af79cd13be357-8c70b871e01mr814905785a.37.1769638614395;
        Wed, 28 Jan 2026 14:16:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625f9873csm6621871fa.35.2026.01.28.14.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 14:16:52 -0800 (PST)
Date: Thu, 29 Jan 2026 00:16:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm6350: add LPASS LPI pin
 controller
Message-ID: <d3upp33rbn66ioxpc65n7uqwz32kxghzue2n3dkd5k4lch3iwg@qgcppndlte5a>
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
 <20260128-sm6350-lpi-tlmm-v1-4-36583f2a2a2a@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-sm6350-lpi-tlmm-v1-4-36583f2a2a2a@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDE4MyBTYWx0ZWRfX/rDnJENjQv2k
 W7eVQJrcfFD9F5hm/dzVZ4l0nYRE7T6iWeFisE54gmeyK4zVsR5c1DwWAm7Z//1zHX+p1zIdOTC
 vJFyDhes6BD3unJAdjTLDgOmCk2qheXvOD+4pQXnPGs+xwxDmv88etGuOVNQ8n1bedSzLQf2WsA
 3x0aAVcYR+6owniP/2NHQ7wavswbtxGTfCrL2otQZMLaAD3LILpI0jEtojCvrRnre8UmDmXHj3T
 wnGeJ/ofT2VzTOL2n4Ua/7FhUXisik1bFFNIFO51IAtcu1RaL3PSKUAPB4kub1NkLsREg1XdJb5
 Jg3DwgDCwiCW/BlY1ihtASiDOyPw0+CFSQeVYKxHFWUVPpN8+yIXrWr3N+uMjANxSJmuTgfQRw2
 TEoj1djyw3MYP5U5uqraEMiHAe0L9Ha/1tQmR5Yusc8+yWiIU2TkNPuHdSKqm3i9tT0GuKZ+zl7
 dSATwdMjBBStLKyGoQg==
X-Authority-Analysis: v=2.4 cv=Je2xbEKV c=1 sm=1 tr=0 ts=697a8ad7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=0AnWZtR2Y3YE4tC-k7cA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: OTBlqJw6-1iAo990sUoVhOR8tXCw-1mp
X-Proofpoint-GUID: OTBlqJw6-1iAo990sUoVhOR8tXCw-1mp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280183
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-31258-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,fairphone.com:email,0.0.0.5:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AB747A97B5
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 01:26:52PM +0100, Luca Weiss wrote:
> Add LPASS LPI pinctrl node required for audio functionality on SM6350.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 66 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> index 9f9b9f9af0da..b1fb6c812da7 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -1448,6 +1448,72 @@ compute-cb@5 {
>  			};
>  		};
>  
> +		lpass_tlmm: pinctrl@33c0000 {
> +			compatible = "qcom,sm6350-lpass-lpi-pinctrl";
> +			reg = <0x0 0x033c0000 0x0 0x20000>,
> +			      <0x0 0x03550000 0x0 0x10000>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&lpass_tlmm 0 0 15>;
> +
> +			clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +			clock-names = "core",
> +				      "audio";
> +
> +			i2s1_active: i2s1-active-state {
> +				clk-pins {
> +					pins = "gpio6";
> +					function = "i2s1_clk";
> +					drive-strength = <8>;
> +					bias-disable;
> +					output-high;

This looks suspicious for the clock pin.

> +				};
> +
> +				ws-pins {
> +					pins = "gpio7";
> +					function = "i2s1_ws";
> +					drive-strength = <8>;
> +					bias-disable;
> +					output-high;

The same

> +				};
> +
> +				data-pins {
> +					pins = "gpio8", "gpio9";
> +					function = "i2s1_data";
> +					drive-strength = <8>;
> +					bias-disable;
> +					output-high;

And here.

> +				};
> +			};
> +
> +			i2s1_sleep: i2s1-sleep-state {
> +				clk-pins {
> +					pins = "gpio6";
> +					function = "i2s1_clk";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +					input-enable;
> +				};
> +
> +				ws-pins {
> +					pins = "gpio7";
> +					function = "i2s1_ws";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +					input-enable;
> +				};
> +
> +				data-pins {
> +					pins = "gpio8", "gpio9";
> +					function = "i2s1_data";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +					input-enable;
> +				};
> +			};
> +		};
> +
>  		gpu: gpu@3d00000 {
>  			compatible = "qcom,adreno-619.0", "qcom,adreno";
>  			reg = <0x0 0x03d00000 0x0 0x40000>,
> 
> -- 
> 2.52.0
> 

-- 
With best wishes
Dmitry

