Return-Path: <linux-gpio+bounces-38183-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 21uYL9sVKGq69gIAu9opvQ
	(envelope-from <linux-gpio+bounces-38183-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 15:32:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EED660958
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 15:32:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NU83Q0qa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gua2nliO;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38183-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38183-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78F7E304A914
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 13:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF09533F582;
	Tue,  9 Jun 2026 13:28:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72ACD1FA859
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 13:28:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011702; cv=none; b=V8LzuavalzvP4wiyVokV1cJnJfMGrA5d34Do0tbjGoeGIcRFOzDzbdpc3SwpxNopB1fKim4H30bW4SpCIddMiyG/fFN38DkrUo27iXQaKMFda54kl6oerM7RVkt87xfgPiQBEfGrALiFXm/pL7mq2UkdWIPU0ufTdgtOJA31HvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011702; c=relaxed/simple;
	bh=lh7VcJd5s9opK+qhKTvgPwy9qXS6LiR7Bvx1T8En7g0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qtdiOkzvpuSGuHLcY9Ym5uTL3JsoQT6fEP1gf+7GPOAIfryVgS3LMcvIU5aLozxZzS/hlH5phIR2DaagQI37a/0FKtLyJBg1clepbXlGmvlEnq8IMjz7nCWawGCSGPNHOVCscBfMwWzy3jwacVhWn+eo4OBdqhQk3gjvki8vFug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NU83Q0qa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gua2nliO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CmWau2588647
	for <linux-gpio@vger.kernel.org>; Tue, 9 Jun 2026 13:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PK8zmUvBTXUruM9Ga4dY+eCgp8SW/s+tzWaRTY5T1co=; b=NU83Q0qaGMsKOQ8y
	vjR3I6Hqytny9QBqb1i+qplpOH1MG8n2qafEW/cJBI8+O+Hy2MMuMlpnwD0c48oc
	FEYRpJfMz1ZoxRjhglZdSr243khOfc7Xj9J+kPh20u+VjdOEOGLNz+52sqJRN3Mg
	pLYhTA8wD2GUPA85QjD32TDu0jTyzen+sYgGqCtvQbhS6hUb5WZLDN56sNe4oIv5
	SGpx7juakN0kJSuapPq7ovhUrX9y+o6NdCcx51vJy2jqGlwWDFaV+UODsr4ZeEEg
	jibqbcRaqlUFrKD31i5zoMx8LcretX3HJfQV5I+6+oFcGZYY4ZdxCkj8t0yXBi3O
	SnrTFQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epee4hh0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 13:28:20 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cc6b92b8f3so175256137.1
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 06:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781011700; x=1781616500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PK8zmUvBTXUruM9Ga4dY+eCgp8SW/s+tzWaRTY5T1co=;
        b=gua2nliOmLV9232rI28au58p9+ELWLmZxBN+EwIO6WRCB5LM1kZOol4JUa5IzpXlfI
         /hKxkgl20Ig2kZ4aKdTgy3qeWrO4d8pWN9c0wH5n5DhmkTeUiiXelwoCkFDj8XQIuV8r
         iPvf/s7He2DdBBuHtwJyamHEZHywnfMqTmypWHm+ZVbgzVGznU+TXvC6d49orn6F30SG
         BUqAYIkRQITqt28sgIPyw57EMpuyw5+wOx2MFgGpobXJegvoPTK8C+qJYwspWNxGQpVe
         ROASZcYTP6GD/4sGGTgir5Ws7xnaPDXNB/sO/56g1H1UZvQUGDLxTO8QE844GCDYdsNv
         +Mrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781011700; x=1781616500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PK8zmUvBTXUruM9Ga4dY+eCgp8SW/s+tzWaRTY5T1co=;
        b=Ik4lp3MrdUSgVrePT5auNc5HBUXgwPvvdhDGJAwIOokccnnhN83oxAt0btLi88ea8q
         P80G4Wcko9ExcTpBF2okoGO/7sRrxErg/ivf/6ksShs0ByjYV1+4n9Azl2nwuE4DpsY5
         rCBY0QcWuz+M0CN10wxJHzh9/PZoVCAf0rGN7CuyDRgOSoQ4fAi3xXBXwbxDGWLW9UW3
         DwQzENiYp2bitvwP9VteEVnnxGqT69O+/yLwrDIoPjCbbbJG1w+jNt+oK88UUc2DxCt4
         sVV9dfpofxYvhGTBeLAKpoW3i8nvLcj+ywZ0DobZoggMskNvYFR2HywMHMklSYMRJIb4
         hLVw==
X-Forwarded-Encrypted: i=1; AFNElJ+gezsao0kB4yHhgjAm9pJrgA3O26/86elQzxwljrXoZMEmcag+QT+mvyToWeWtcmDpH3IceHd/k4Ds@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0AvksnsuHnT0YK0inrGAPi2ms+UTcLXoBZrIA77WLRr4Y6PVo
	gJivVMhQ/BPNZLbN0bg6ypvnCLt+t59tcq/pEXCJZGvL8DxFzDtOdyf7OO5rsN2OZZ9eH0Cbnyx
	l6p5zwE1elmDXAaBT1QnpkRnf7DfRwFaAIeBMiu866C6Bl4lMF5TBoJQ6mUIUFc6g
X-Gm-Gg: Acq92OFWK3PWzRoh0dOPQb8XwjhjXgi6kIUov2Lu4skXArEqnV8JhsGtl07KVbKj1TQ
	SDjms/TfS5Z8AV0Obt5rRzY/zrQpkgW0s/W/qthuCCrXEvniimLxYd/tfUZ4PlmRO4X/fzNCJyk
	BT/rZNjZW/TToWdzIOzEGoZLXz7NJNK8KMjUPxHH3ZaZcIMGDsIfWv2f1V0xD5kWd3HUd5N0on9
	ki1aOt32se54vD8/mRSQoTiJzourEMozKRjGP47/A6OfsCOhPFLfkLyeQsllSzJI/bWoVPVB1lr
	5Hrtt0+XedpHlzxdGKJabz+v78lAQgZv3PPY6NHZ9btmoFoyjQikfGMhF49MELSwZHMbtcElVkG
	NHqvGxK91MWwu4VQUMnXJfzbvnIDl0U02ooHIwpjYkDnmSSRhgfiUzdBn
X-Received: by 2002:a05:6102:41a9:b0:62f:46c:40bb with SMTP id ada2fe7eead31-71925fa9013mr444762137.5.1781011699778;
        Tue, 09 Jun 2026 06:28:19 -0700 (PDT)
X-Received: by 2002:a05:6102:41a9:b0:62f:46c:40bb with SMTP id ada2fe7eead31-71925fa9013mr444753137.5.1781011699394;
        Tue, 09 Jun 2026 06:28:19 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307ce3sm1038231866b.43.2026.06.09.06.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:28:18 -0700 (PDT)
Message-ID: <f6fc66d2-b40c-48a3-9dc9-bae849353e74@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:28:15 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add gp_mn pin state for GP M/N
 clock output
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
 <20260602-pdm_clk_gp_mnd_v1-v1-4-1522662b6c53@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-4-1522662b6c53@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PIs/P/qC c=1 sm=1 tr=0 ts=6a2814f4 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=a9V9PMWcc79cobRO0OcA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: eIiTToWfl_ifjyfomAeEQkdFN4nqTk92
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyOCBTYWx0ZWRfX4TDHE1nLyw+r
 89A4y6uauowEcnU1ops7wWMQYxRkHWg/RChSeDSUnwXrC/lB2l9vaeY2zI4Y14s78HyLpPrpdmA
 VAsGJ0VTmj/oOESdxlKTOfL3KEgWj/07cwx8Ze1sIIhRQCcAv9rYB5hyikR+fiwqhfxEn8YGVTd
 /a2rwwohbx0dlq2bjhwu35zYkHfzaOMOE2PKP1VMqdkUDD2MbaU+SYj9fndzDpyeAYWMfvYEhDY
 Xq5Zsb3izZwviA6t+51SOXDOW7tTrQca9kzojhfc8TX5IHZ0Bbetns9drmC+kd+yOh58OTRlwuL
 0CtHADWXzyVgKW6wPVTfq50mdBnZ0gR55ns3L9Dr2eah8OeIIkHhGVDzQ6En2G2F/XGCh+jeBY5
 Q4nGdbtNNrlhpY65ctiVRFT58yXJA4x27W8EijkrkuEL8PC6Kukpiq8I9asPKNYIneqNey+vhQX
 7dT7svX9g9bnKc53YTg==
X-Proofpoint-ORIG-GUID: eIiTToWfl_ifjyfomAeEQkdFN4nqTk92
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38183-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,redhat.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:richardcochran@gmail.com,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:netdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 61EED660958

On 6/2/26 5:21 PM, Taniya Das wrote:
> Add pinctrl states for the GP M/N divider clock output pin across
> multiple Qualcomm SoCs:
> 
>   wire it to the GP M/N clock controller node via pinctrl-0.
> - kodiak (sa8775p): Add gp_mn_active state on gpio35 (gp_mn function).
> - lemans (sa8775p): Add gp_mn_active state on gpio35 (gp_mn function).
> - monaco (qcs8300): Add gp_mn_active state on gpio32 (gp_mn function).
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Please squash the pinctrl addition and clock controller node addition
patches together (single logical change), and separate them per-platform

Konrad

