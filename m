Return-Path: <linux-gpio+bounces-38181-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OqMCMEcWKGrN9gIAu9opvQ
	(envelope-from <linux-gpio+bounces-38181-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 15:33:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBB566097C
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 15:33:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ACMT/mhw";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Pa5IgPyW;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38181-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38181-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 12BBD313AD93
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 13:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64D95283FE6;
	Tue,  9 Jun 2026 13:25:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5219287510
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 13:25:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011546; cv=none; b=WW1lj/OQFpeodlLAuEBTQr87hkfmJtaR5lzS8YnZNWKvdqO3Jx0CXip8dWVitpqoyCK7hS5mGMbYw6V6MYJy+z/+C/GXBq51PmHbGuKaeUbQsZnSx3axHcSRf2vbD/CE4gCLNdPx+Zu5PhJzYIc2Ypz63cIX6WOex++RRbeyMZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011546; c=relaxed/simple;
	bh=jzhsn/O6XyLp+WT3Wx18KSisIedMV1JTeNkm6Z8hpCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qvv95kOG7NIH8by0eRAfUznD8mekslDzoZ6Ibi80AWR77QH2vvxg9OtrGdMsK+JlND3hkWDzKcZkNe7PUKJZoJHyy8yrcuOA5Xr8QszpHP1Gfhodt8s+dY2tomHSMvV8Zc1B/qcafqVcSyx74d9yeso6xC4m/dYfzlWLdclOR1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ACMT/mhw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pa5IgPyW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClOLG2249695
	for <linux-gpio@vger.kernel.org>; Tue, 9 Jun 2026 13:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U4il8q0fdu1RbUBbkZZbrP3BbzW/PKmlpDX1qefse54=; b=ACMT/mhw7ad78tP8
	FPByep6d3VxI1PUQn0qxPNEsBga+zLlT4gewTXiGazFLW7i3oUlylKRkjSRF7dy1
	OEF07umt2JG1RPsMZ7GuR6hZg21f5aHhbk/PCNeGefuQlz9OpdopG5YeH2uN00oO
	VphH9gc4oyDxlIvBk4C0hnmJ3tGlHfoG6T655JKHwApUH8XnB2O4yk20rgAbsAMp
	Z9LqNTckFJd1Oi1g8QyufQg4CCyceO+phGvZt0kxjMBg1GvWWGGpKbtfIDEJs+D8
	a5wB+F1tevrmK7gocF18t9o3mudVrlR3lM47JhOC6aGOP+wMFT6E/4LalcJVH7Pz
	tiiMAg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3wh02y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 13:25:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517865e6219so11637301cf.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 06:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781011542; x=1781616342; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U4il8q0fdu1RbUBbkZZbrP3BbzW/PKmlpDX1qefse54=;
        b=Pa5IgPyWEh7GD6cjpscL8WIQ0Zak7kzEftkACvHABAAmV/LVM6pSBN9auGU1kelb24
         GfTa2iu1Fb3RDMNRO1vgfDKCNveMfe7QlFFfoMcchn3wuOuLlwMgkqVp/pFGnBJQxFiL
         ngohcyct+sebqHwtdggebh2FcV9Aqn9q+hRk9Kd/SKeiQJzJ6qdwYThvNcz9it0nKUkk
         /5h4PEt9XeRQG4/e7cWCKtakkZSqaGPraBWZNSvTUfGp1REZG/QGHp1n1ZThEoIaqxvU
         JxWKY+l4OfFkbUNXP7ZdWGIioPScMfhuzPul7c8lV2N/2qbzLwH41QbD+dIO7BmLKFG+
         YsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781011542; x=1781616342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4il8q0fdu1RbUBbkZZbrP3BbzW/PKmlpDX1qefse54=;
        b=g+ErxQj3r5p4h/Z3O44UW6MCxaj6wG1LHvr4IlzklI170gVUD1eNbFLk/FG0WpnURC
         +p5NBLAXz5jhGa39HVVkfgBwCjuNjKU7I3HDU9jPwCq/H9EqIUuy8EkCf3i5mYuvkczX
         G+orzesvrtLeNX22vJJO71xUI53fo3mcFHJw1Nh7n53r6S+UF+jbIfHGXUGtqdrk4x4O
         OkstO/IAHl87VvK4KhZLFLm1/Z8U3OZjbdv29uDrRgTGENL80mJdK5gYgVTO6fmiHAnH
         O6anh89eZLc17wd1Gzfqny7EBuTgv6mru+q/8SefInnZzDpODqAcwXDZOmIPX6VSO3VJ
         zkJw==
X-Forwarded-Encrypted: i=1; AFNElJ/kqcfbhxs6nn1qTStZKeZ0YcFeTKiAqfdLZ0+/nyf6BEMMdFiWvKl1G9xex4wp1/niqyZN+4wsarWP@vger.kernel.org
X-Gm-Message-State: AOJu0YxmKc6K/XWnuf13dEMSGSEmrd2qGzx/gwrqOlW+ATErSaS0p1x1
	Ea42IqJJFEZIMCOrvLRfnOFiCIHXB5ZhMjxY6BsUsWKdM5oPa2FE2po+LoCKrEEfxLsn8tkqpNT
	KqX7dZCUOD2QnPN3xIr/ntajHaYx4VkT758MA77nnsDc2addQUVcZKydW3G9gPBVN
X-Gm-Gg: Acq92OGRdEAaU0pIkfuf46AQhtZGWPi3EOEM6k+/kbCyR+OMvGqh0fUkTlQjZJyznpP
	7nF/GMjltYwbeC6i7OSpy9/mr0+74yAbr2qutOS98mgqUMvU0w+FoLRh7c+pjjxR9SpWgYgy9IN
	xD8gmBoX+41a9odSQge/ApT4Y1fMTcZYa6XrPQUj60Lf+sJCvlP7H+SF+dTK4BC196F3/4xaPgZ
	IBIDk+4a2bQLYd65jQyuCLdnNYXVXHHf3A4M+cumbHEEp5ZkJZFVFR1cwhHs5c2qG54i4sNEyUD
	4/VPTBaMGcLdKczvMXfFlIKaX2GKvowzr+r59uRTMrFSclZOCgtHuAwGOL7U35mRx5eoH7172WA
	KpYIvBEP3DDPO4CGnQ4N9hXWk95Pojt8FANmnsd7bfJ52xIsDQ0SBPBJo
X-Received: by 2002:a05:622a:650:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-51795c6ecdemr167578721cf.7.1781011542076;
        Tue, 09 Jun 2026 06:25:42 -0700 (PDT)
X-Received: by 2002:a05:622a:650:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-51795c6ecdemr167578321cf.7.1781011541522;
        Tue, 09 Jun 2026 06:25:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05176fd14sm1051546966b.11.2026.06.09.06.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:25:40 -0700 (PDT)
Message-ID: <03ec182f-b1a2-4ebe-8e48-9e88168f7694@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:25:37 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: clock: qcom: Add bindings for PDM GP_MN
 clock divider
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-1-1522662b6c53@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-1-1522662b6c53@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyNyBTYWx0ZWRfX0BsbYp7lu2OK
 e3GZEwCpqbNpURD+GSb4+KWvGlQ5dbtzl1xmahDZuwzqA3duj69F0XzNB1FbB1r8EErOYO8krau
 0GdjB6sTFvztsR7VR+fqtELUcpW5mN2svpS4iTwxNFZ1hi3LqdVCH8D5KEPweHs5gIBQWrbtbdm
 onpVypLLdGO4XIay/Oz1MEzPTnkkxkdbLcY4aU9sdy9bgwQeL/kA3+JjtBZPCncOH/LxlWc9NNP
 /EBh4cF8OMCNrpMtAygoKrXnK4/0yosCiuxaMby4sI/8SblIvXCUUkWt0UauT467SsiYhCngm6g
 o9miHrqT3EN91ZXWZ3IZSY7QMT1YcnhAo6LEnfB2GWKF4DbnrctpUYuChC9u+b28f2jTRC/Y+Ic
 +4EoVBI+GQjzIIBtHLvQAWnCuCHpqCug7l/JBmsfZ9bFBnZ5wVEF4rZRq9kLHH8iiddWT5ilgld
 o6NcBPrn0pqURm9PtAg==
X-Authority-Analysis: v=2.4 cv=csWrVV4i c=1 sm=1 tr=0 ts=6a281457 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=5seiv-aHSsnqfVfbp2gA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: VtC-LNhwNSj-aYISAMDsoM8fVJKx7h0i
X-Proofpoint-ORIG-GUID: VtC-LNhwNSj-aYISAMDsoM8fVJKx7h0i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38181-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,redhat.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:richardcochran@gmail.com,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:netdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2EBB566097C

On 6/2/26 5:21 PM, Taniya Das wrote:
> Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
> clock divider. The hardware generates a fractional output frequency
> from a fixed input clock (typically TCXO4) using the relation
> Fout = Fin * (M / N), with duty cycle controlled by a separate D
> register. The clock output is routed over a gpio controlled pin.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]
> +  clock-output-names:
> +    maxItems: 1

This should be deferred to the driver

> +
> +  pinctrl-0:
> +    description: Pin configuration for the GP_MN output in the active state.
> +
> +  pinctrl-names:
> +    items:
> +      - const: active

I think these 2 are always allowed/defined

> +
> +  assigned-clocks:
> +    maxItems: 1
> +    description: Parent clock phandle used to set the input frequency.
> +
> +  assigned-clock-rates:
> +    maxItems: 1
> +    description: |
> +      Rate for the parent clock in Hz.
> +      Supported rates: 19200000, 9600000, 6400000, 4800000.

Likewise, we could simply set_rate on the GCC clock which is the
parent of this one, via something like CLK_SET_RATE_PARENT

Konrad

