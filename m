Return-Path: <linux-gpio+bounces-34126-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPeKKKzEw2kVuAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34126-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 12:19:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CF7323C61
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 12:19:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1118C3025A7A
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 11:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833DD3C9EC0;
	Wed, 25 Mar 2026 11:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJuAi33e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VN980Zhe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460A03AF648
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 11:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774437106; cv=none; b=fcT5Q79OfdsOiwGAEB5NXZFw7QvN4gpV6+GeRxkrY0zjFyIchKaKKRMUQjNFtL0aAJByOd3MB8e0kHOW4UVyW1M+NXejB4IrGXyJLOGoMRS66+9YmrOiMebe7Kc2XXxk4pqJGP5PZsnJIMT9zhz1vukVzkmU0iMBkaExGJWQk8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774437106; c=relaxed/simple;
	bh=Zf4AmoMpNCQ+Jf635aSLjwHyUcI58E6olwIri5Zu2bw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YZEvd8J44taWVkj4EGM8U6vs8mFkRfyxtAUQAp5GKARTTDut4xAAXtUIeDFUVkvp4W7EX3RsJIhXiIvcqi5sbmSPRwSd0xOwPFCC/jtvojuODBM6cGBbScsgQRp+sEyuyVnA54bGAR7Zm8u/6FguOtOGYflUff+84MYElXip/U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJuAi33e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VN980Zhe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P9Gps13057310
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 11:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QgnThs1pPIH+xWuA4iDL/UeJHsTD400ryps3PwpmI94=; b=FJuAi33egFEdD6pr
	/ZG4u/qku6YwGLJJS9uUEQRUsVmBEObmKdEw3jaO+1rFhlavNp9gtVKuS98freVi
	eWewLi8G/xBoxrmrUCoIaVqF7gfcjC3/Dh05VKe2i439XcjhTy0rlSdaKkHmZD0W
	K+3ZsSLPSaL+Ad4ZkSHcEbqDOTFj6TqEdgMdJ9DnrVTZfa3jNKAoK3RlPUAxhjPL
	oLXnssfO7CBpN1rEfQ/zkVNpKkjRkHWrpX3kZpjI7KZd0UuoLK3AnlrkmA9WgSY0
	x80zruvCVc71zdfSoLCQgRhKSIMcKIOeBPrAhL7R/SPudsaJlimbz8gN8bbIN9Lo
	y6z7kA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d46tp1rwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 11:11:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b27636835so55906751cf.3
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 04:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774437104; x=1775041904; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QgnThs1pPIH+xWuA4iDL/UeJHsTD400ryps3PwpmI94=;
        b=VN980ZheX4426NdxzbPzK43xRmOnpwRT4m/iNel1GYw6CXAc0Vpum+imev4iDH4+gv
         Gj7iM63AXwINT5OyGT2p4IEAjQ4mzNIhR1zbfwCsZ8Cj3902Ir81pyGx59NgqvF7wSI1
         qvYjeMnfbUUVpjSucUd3ST8zLjA1Kc7Py6E8PWfxJ/rpzQx/DI+XZ6QYEXeapkkychNN
         LEv5WRfFMbv3eyJnv2EIaZ7sEN6CEJ2SLWb8h9MLSHyaYFVThc7inKtMAWWpN6BloJ6E
         5yHyZrit9Ff5Zrr0HPMbQbxAI/upUh42/8n+HO3kx8spsXv2tcNH5tuhauwwcqWixKMo
         1Kaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774437104; x=1775041904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QgnThs1pPIH+xWuA4iDL/UeJHsTD400ryps3PwpmI94=;
        b=WJc41P1ubfQ5IxpaUkI9yophw2uHAMph1ahIKxI9sDsrQIvMbSuVhN04phb1f7fuPA
         /bkGDRPbXhgExLFJHwBBpXWSXoccXhDqS17WE8STUXYY0ylcEEkBaysV1DPLkvRdB9T/
         780qUvHkBjmZtXYNL4ntOrmgaWMqU11DtaFQ7v+4vTIv0/BYaRpoN2mjysAktljecwdY
         Bj6C+7toVHUOF9uCeS6jCtxXZjHiDbtTipAcqjCHLeMpW92aEmnEwqzeHCDHN9ThY1XE
         ZWS4UCkchasMpZNQNexjdt9bV01YdTsWFgto10TiG4chcVtK59oAu5+gUHgi2PJLarTZ
         EObw==
X-Forwarded-Encrypted: i=1; AJvYcCUhL3ZfDKuxuyq0TKt4HhFaFeN4ZURyXqmg5w2uJdFKYTIX1/qheZsimVB1evaJFu2QXIHfbCoFRKuW@vger.kernel.org
X-Gm-Message-State: AOJu0YwOeGPXl6uNDyopc7dfgKrdoij5F4y72cXWwL+bWj+pfHe0kass
	EpPUfZBND1bITPRjdaDn15uGrPQTHldeCl35D5wE9NCiznZKj/hOFhq8zw89xFdrsoAx1+CIptG
	GUg0WEnBWIkd4Nfi2FG5tp8CL/NOBiTFyb7Wxkw8vavyMuysiRH8QqISkpnD597ws
X-Gm-Gg: ATEYQzyh+Jmg0ikT66GYeujcsLfxaw6iWB9euXJCxx+EinIIKa39m99nXVFsh6YZh71
	98c/XDpLBz6cnkVcsN9I3x3g9R8SwP3WERFTIpfSo/FtaaVpU4AbFHpOhARRyqL44u1Hc6N120s
	DakfPRBf36JfmA6/7ARhTd8sS+W4EtCXhT1BJ5Np5f0qIoAIT6ubG/H7MumhyjMda3S6r8idhMW
	+1iNcqRxmtgKQHVLa2KjGqzPhXdL9KC+9uETRQga2tTZRzF1mdApOimcYxxrJjTq0W0uwQl4N3p
	Ibsn4j8f4HiKsDhMPoH4oggLKozP6a1SC86pLI/Wv9lsmRMW3boZc4Kae+ueb5F3c5IpV6k/POU
	F99Ll0Ng8+yJUsLHez0dyO8KAysyov3WoS0oUAQLtqsrVMQAJjVbLyKT8RMzFwc+6GxI//Mqafz
	d+mgk=
X-Received: by 2002:a05:622a:1145:b0:509:219f:8e34 with SMTP id d75a77b69052e-50b80acaf59mr29402091cf.0.1774437103619;
        Wed, 25 Mar 2026 04:11:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1145:b0:509:219f:8e34 with SMTP id d75a77b69052e-50b80acaf59mr29401771cf.0.1774437103118;
        Wed, 25 Mar 2026 04:11:43 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983387085fsm781041566b.52.2026.03.25.04.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:11:41 -0700 (PDT)
Message-ID: <d35f5048-5ddf-49a0-8af6-974c712598de@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 12:11:39 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: Introduce IPQ5210 TLMM driver
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260325-ipq5210_tlmm-v3-0-3a4b9bb6b1fc@oss.qualcomm.com>
 <20260325-ipq5210_tlmm-v3-2-3a4b9bb6b1fc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ipq5210_tlmm-v3-2-3a4b9bb6b1fc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wNstnw5WJd7PnoH3W4bnSsqnb88KjIom
X-Authority-Analysis: v=2.4 cv=F4lat6hN c=1 sm=1 tr=0 ts=69c3c2f0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GNHHtjWgAF3xncG93AYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: wNstnw5WJd7PnoH3W4bnSsqnb88KjIom
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3OSBTYWx0ZWRfXwMYCHDe1zNVL
 /yPiVLlgoN3RbOT4jrqxqoNqelnljNGAzXmRFHY6uIEJsaixjjdzapPQA+6NMS6mbGfKJtbisqG
 ZGPBf2AtXf4ZS0f4THR4prj2Cn7IK3g6tNItUiu9DJPn3nMMcsdYZkw3X4Cj+DJaTMiZA33AtVE
 ER3NMohni55v+8yFPdy9V8HBnVSdCJqfKIAQ7FKHncJal2NT1lQQZl3CsxKJA2kWdLI23e3ppRH
 qCHYMmip/slFAXB+IzIQxYyx74HxPSPepOAY6FJ3glNd7iJqpH5/Zkan9edd9bUcjPdMmJddlhj
 uyCrhHhLKWqtBNsAG4mkTuH0qDACw4Pvsx+L5JW8/AtjZ9jWHb/I5VAd4OrQpiQVBpLvPP+C1MG
 s7bmv8uO/nvntLyy7C3FbZ2tuR7nLdDxKrF7nxRH/p5MOV9dsrBxOv/TQedaEvhJ5OejleLxUvY
 efhWTbYAmtKQYbjmd1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34126-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 59CF7323C61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 8:35 AM, Kathiravan Thirumoorthy wrote:
> Qualcomm's IPQ5210 SoC comes with a TLMM block, like all other platforms,
> so add a driver for it.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

[...]

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

