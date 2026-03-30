Return-Path: <linux-gpio+bounces-34445-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCDYKQXFymmL/wUAu9opvQ
	(envelope-from <linux-gpio+bounces-34445-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 20:46:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8FD35FEB2
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 20:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 67969302963A
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 18:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681C93DF015;
	Mon, 30 Mar 2026 18:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JiBx9eEG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W6Ut/joI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227BD30BBBF
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 18:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896383; cv=none; b=pY/1SS0oc3xkrce8xf2NF4SGx22GRJa5824ZFiWwKRETetJO1irlDiF8UqhnT8BgjaGFCc108yccWVQ50LdhDOVjFFo/NZXlSieWuxh31JpUiBUssz4TwiGC3ACqczTtK3pQmhJGwPuLamXBQimTXe5epR7po6J4nIEZaNAyefY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896383; c=relaxed/simple;
	bh=S9lc86k/Y4qFuxBgxCfmBhcIc2Sx+VaWysuoANFpZCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IrOz1Ux6iua85Hi58gUGkPGvicNxo50TL85WA3rLiBpOeh9oJAu8C+I5zN9TnUggc6n0L/VW4VVh0O6Fgi5CHRWK8n+OUdzH155MiR+WU9zuijhAnkl3mZWnpLxVr9YYOEK4f1cTtkUcwxIpu7hD8+eup5OOmBM8vvnR9i4KsPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JiBx9eEG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W6Ut/joI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UE4Y752458298
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 18:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YlM1ScDcIC7T/OBmrEsNdkdT
	nKpBO+7YzO81PCK6Dr8=; b=JiBx9eEGpxQdmtUhtTl5YYOTwFKWij16Of7HUJ8k
	PBC+ue9M779pE/hIEDdY1nESVDTeuPR2odw2yWYW6D1PR1D3Mv9RzpwZ7RsyORsn
	gDHw0iEddFs/cxeWThDWiUVfZUmIFiaOxDmT4NJHn657SBZWzCovyHhatx79YaqX
	K0e4rNmH8G5lYwtWGbmRGkncUeY+AufQCkBXUskyyp5f3XulVpXUSCMNQ+OES5Lu
	DRQQ/D5CmMpKwIx6IHJvfbe7rCA+bp6V+1mCOpLQ3Bn4xRiaSy1bys1kEVqoYSde
	1P5ddDv1K4yrdst6sryfdz85S4f6w3B2N+HNrZJXv54IvQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7nnmtjy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 18:46:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b274f94f8so69049441cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 11:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774896380; x=1775501180; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YlM1ScDcIC7T/OBmrEsNdkdTnKpBO+7YzO81PCK6Dr8=;
        b=W6Ut/joIXRxnEd2GrntVHio1oIJNeQryXydOoboV5+FC4GScy/y5sCaJSTRkmUEf+b
         Jmoi/JbQnXrTDYGBwHMKgcq6Bzx767QfSy8gdAY8dZpuDC3Ux7xmHcpfdqWr9ruWz+Nw
         6/nQqi1OTgRCbqci6+kUPwuLbixXCNqV4qV3O1pelSRGQHaoTnie7fd08niMY/foJFfT
         VQ9ex7R3+tQJ3kgOY0THNd35+pBhLCRiMTu9xANlaIpiIDYCl7N3S9SeBIakECBRjNHO
         UgoBqKq5OAl4Z3EUSO4q59ZMTQdobVQRkcKjWSFJXIMz5+TmK6FQBuwxzJhoRhu7K7Vs
         KDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774896380; x=1775501180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YlM1ScDcIC7T/OBmrEsNdkdTnKpBO+7YzO81PCK6Dr8=;
        b=nqDz1bxDAhn9XS1hEufQ1i0GgkHm4qzfq4jr0fU6G7FC6O7JfWb5sPv0bc+qmiOeIP
         eblJrszdq1ZCohEy3k0qVZhaSHCcAZj2/gXddg4GuCOYKmjipJQmT2NfzRD6EG+6nL0n
         2H7N8jVOOfgH2fiOdY51QKQLitrCOUCARSA+ilIkYnwxUwDQWAV1TZoWgd0hnyLLL4+b
         Ph6hwnl9gTihkvS0j6DTI1Y9xBHunngn2mWCm8MJZHS5QbsUmCv3lV0LSonZz8F0VxJd
         p5r94jmbdsg8YdUi/nBqGvZcUplrHrJjGcd2hBVHnP45TqYiqJuqeM9MKWy51MYUSQGr
         1IyA==
X-Forwarded-Encrypted: i=1; AJvYcCX0AYAk8coXX7A7Nthwp5/Jomb8+2sM6OE6vjp3mSKW7hxBoyjsujHDfiWvW8E+O5TXHbpw6sJNT4yq@vger.kernel.org
X-Gm-Message-State: AOJu0YyGx0i4b90FWOiAFhK8Cjhp4TVEY8k5icl12ELPoPB4oIQRFEKv
	NpgwAJ5hjoSy8r1bFLRsWLg6UaoeHmO4y/lR+3aexzI3S19hExh0eGoAb52xXdaIkNOOzB9opEJ
	9y7yxMMmZZjVKdE0ztP4jqmdN9DIKLlrI4TEByjEYWiA0ouTVZ37dUGqptWaRBG3z
X-Gm-Gg: ATEYQzz10KG7197h3sJpkNzUQ3alj7JkVaFKZyD96ZOW+NhmhArBxWB26YICKHgYDTS
	DuXD5cjAE90NVdFFKo+V4sm56dnwujI7Oj4bz1KsBi4Bjq/A90eCkqF7IFe4QDNcBIcgadpNkim
	YSPp9oyQJd1MBTHsPbA1yJts7rdRyT7pmkNe+XBYg/RgcbbzfHRf60ZSgjNgQuTrzzPzmqQgigS
	abSFobvHzpgCv1zI77go1kjHUC4cTaiPTlzvu4dy64+aGgZcAvcoObl0p+XNU3UTmBCDCgyapNG
	C2nhBUXgcfSJoQD2TdpaZDLTrXEZ2011yFacZ1QCyi4vPlzpFqVN7kER/2N5Ubh2veCYFSF53zj
	Q0hUa/X+XzSKkDHkEQVIXNV5qL1+KDsL8UTvzpvBzvR4w+xwilf6whBjTtAPPiIPJ7xs2lcY7Ch
	JxgyAd3Is9hfAjYFDix8NuAWk5z+kHpCCO/b4=
X-Received: by 2002:ac8:7f06:0:b0:50b:8b8c:f68b with SMTP id d75a77b69052e-50d2c98a762mr8895401cf.39.1774896380346;
        Mon, 30 Mar 2026 11:46:20 -0700 (PDT)
X-Received: by 2002:ac8:7f06:0:b0:50b:8b8c:f68b with SMTP id d75a77b69052e-50d2c98a762mr8894871cf.39.1774896379804;
        Mon, 30 Mar 2026 11:46:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1444c7dsm1859500e87.52.2026.03.30.11.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:46:18 -0700 (PDT)
Date: Mon, 30 Mar 2026 21:46:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google: add reserved lpi
 gpios
Message-ID: <j2oopd5rmctqh2dpavwhertyllashi5h7gzbxtsfddoy35tpqs@mlxlkbatetj4>
References: <20260330164707.87441-1-mailingradian@gmail.com>
 <20260330164707.87441-6-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330164707.87441-6-mailingradian@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1NiBTYWx0ZWRfXxUbDuo8E+IDr
 ZkduIuXXTzbknWlNFsKKhN8QsGJvnqNJDR7RTnNAsVqbvaDytcdkYxDWGQRe7jt3IetoUMfZ+kD
 em3P/C/0ikweB7hzKZK0kdOlhUMAMiouPnYS5pmpl87U/Tx0JRRV2N+vpQ7oVzVffKaQzXJZhpX
 PtOrutc+NEacStlrEQdaCIsvaYb5bC5WF9i5Idwh/1GR/ujS/g0ZuF3Ki7uG437K8ZmSyWl14JD
 PLLInO/nuVkSrpUZ0E2VmxqCzJ+rPpy8OuNmEoi3YtI3vQdWG7a7rgP/IIgNDvDpp3V+B+/UlK6
 gJxNfGOY8/ru/lmWHTlx/lHXRIkfRRU9CqDzsV4JeN/gQJMkEstFXKiGP9ZQisxM7bhQ2TKx9OG
 lz23XXczp7C+DfItNs6zIQP+2q7nEDGztq00UqHBveyrHB+/zP97F4v8N59gVs7vd40fGylQIcV
 M/aPFhTTOsEmNlZP5kw==
X-Authority-Analysis: v=2.4 cv=M4FA6iws c=1 sm=1 tr=0 ts=69cac4fd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=vCJQlnQIZA-1Kgvoe8oA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: pY4advas933gPQnavi-j4AtWnvV1hx9O
X-Proofpoint-ORIG-GUID: pY4advas933gPQnavi-j4AtWnvV1hx9O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300156
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34445-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,0.0.0.12:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6B8FD35FEB2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 12:47:07PM -0400, Richard Acayan wrote:
> Some of the GPIOs are reserved for sensors since the ADSP also handles
> sensors on SDM670. Add the reserved GPIOs for the LPI pin controller.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> index cf7b130ea0c4..b0da24fd1aee 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> @@ -519,6 +519,10 @@ rmi4_f12: rmi4-f12@12 {
>  	};
>  };
>  
> +&lpi_tlmm {
> +	gpio-reserved-ranges = <0 8>, <12 6>;

Could you possibly add a comment, what are these pins used for?

> +};
> +
>  &mdss {
>  	status = "okay";
>  };
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

