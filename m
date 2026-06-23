Return-Path: <linux-gpio+bounces-38850-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N7FVKo/DOmrQGAgAu9opvQ
	(envelope-from <linux-gpio+bounces-38850-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 19:34:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E116B917D
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 19:34:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bIUQxLad;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NXUNsV4g;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38850-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38850-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 570723054A60
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 17:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D853738D6A4;
	Tue, 23 Jun 2026 17:33:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7158638D69B
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 17:33:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782236009; cv=none; b=kYJIky5r0woGVxZ1aQTqyByiOeHjc4bo0QzY2KsiU5AkCKKAcOnWiVx3YGMJlIxlvFOk6WE2B1ZgZ+6nQDyGKx9rWA30wqFzzy/FLnJTxDH7621eu4bKjcAkhUE/9NRtBzquIQwNUmRlF5SGc3qU2P3KYLyUFdLRecXOvb3qTyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782236009; c=relaxed/simple;
	bh=M/ZdaV3bWpITbQ9P7dBtvgv3HsaKtewABZW37rVuqv8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PLwiLdSFWNYBxmar6QQtletZ5kuYLxHEIKx/reroO6+CK8QGwMtJrtJ5RMh3wO2HwQkNnLxrp/PUiGtXTOl6zAZp1KWFcmGlIhr/SA6yOVST5CA1IXHqMTe16Ni5ptTeIDAPaDWHyMWjP+fJNVQywn3ax452AK0BqxnMioti4OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bIUQxLad; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NXUNsV4g; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZbcH134229
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 17:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fcBFDibJQ6H+O2JOqKjSG5XqxwtgZkRz215FbvC3s1k=; b=bIUQxLadfQ0HfT4v
	4xCMlZD7wIZEAPk5oL+4TGH7yqsnsoMUB7SGgwvJLO+rbSC/lAd3XoRMv1c+bDwA
	c8AiUB9GYiMXtWeB2XKnFSYaZx89QrCWa4Y3aHIOcejnDrKm00aQTcD8e/alVl18
	zh7hRrIHD1xU2DkAvxlFW5bZmQ0MlSwdpuPSi6FqshE0Z7n9MDfA9ID9TPRO0vL9
	9IHIkgNtyilUcviFpEj2x1INSH6yQ5iAc3pBGkBEjV2XbHMETQB0ByCOP1yq/8Qh
	9cQQgVuERquE8blsx8bOo9UeabgG0bQrGjeYjxe5E/hwrmBPBHvJbTdGxolD5clj
	/F98vQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr321u1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 17:33:27 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cfe512e871so68347137.2
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 10:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782236006; x=1782840806; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fcBFDibJQ6H+O2JOqKjSG5XqxwtgZkRz215FbvC3s1k=;
        b=NXUNsV4gwtcj+3Yf+kSTg4Nqu5/WZ0+osI9rFdVev387qq1Vz59hTnBS0TYzrHLgvR
         MLCVsankBPQRSJRHCULdSZdJ4FdNa57wva54el+O8f5CjKrect5AC0C72gfWM25YX8kC
         EJ0bEnhYxQeRjMSQW413WAAlwYC2cNn3HR70OALju91JBtqFI0rfEsqOKo1Fr/AHo6oc
         7F2tAT34/NfUK8hxM7h9CY9lofqi/bBBvW6uFntOiyoz29DrRjU13vYTJzMSAOpwCXeP
         K/lXde2xKbq53J4Yr8ZPo8pzSRVPazTRRhb2ekkVup7Wsbp2iLY2W+KRrse4Of74t/BV
         CFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782236006; x=1782840806;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fcBFDibJQ6H+O2JOqKjSG5XqxwtgZkRz215FbvC3s1k=;
        b=gCNR9FPEDAjreViy94nSvHXIMam+odOVTm4DgOjm2itAp6HpFXjh6yolWYR+M/ekbR
         atcYjKZ6pgFPok/5XKZXA4d5lUJggEo3c5kvg2/IlhRFeJm8ekmmWGfCSpFLOMFuexnF
         4gwQJkf5Y2X+2c40+0U8Yo6dJvE7qTSeuMlZWz2v9JrRSLpISo0tzp9yE0ozZXydF2Hv
         4jzJ2bJIKy6HQgbQQJAIPgEJn3h1TZNiEEw3/rsPYs5sr8xx9KJVNpaJB+bWs+SQwJEA
         uQw6ircYbRQirwGxvnIZcthYSdDAgOwsYg/+EzwtC9H44Q5Yp+oCNljHfC+9NhXNap6E
         g5Gw==
X-Forwarded-Encrypted: i=1; AFNElJ+uO3cm4prA0Rzcsza38A/42ogVOTIw9jUw48XN0t7TO0HgnhkqKcuajCEEDBtU45o4ey1/CelAbuKB@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1j7yAVhEo9BJq5Oa4yOfCP+xPCKypcbCQnhs+uqi8idziOdG0
	NPR3YKRocuIM8AFbQ2MyiB18yEgWTaXtjq+CQM3wKWX2Wr/06ihjnly/B5SXu+U1lPc3aGlwr8Z
	UbyBWMqVa3JFKH08Vv1memtN087HHKIlKN/kivowVcOkHxAmgUXb7ZSCjWWLW+/qf/Dv1Vmjy
X-Gm-Gg: AfdE7clWCxUG5uXyY6/XIDo27bCX/bCG0azxfMI3NNDPBFlfCvzoqqelfKc8oLyuW85
	raJbJTB9a5fBiBcZWN5cJJ034rfBVEhCuvnsVZhruzNFQttzkknm87LOsMYNhqWGpJoYaMTM2M9
	TnFfkyI8acFLAnOBxXYX/0fuqDTFrhQZ7YWfO0R97rs0Xb4nY8NrfUFcayrbjxP/pBBx3SUUnJ7
	5sDZjR96doRh9yWdtRTHtfswkj7QQciTkx3NKfANn64RibBgtK8IdRcOGuleYJKJbGnMxTj0ksn
	+sdoWja/W6ab6ujxQtHRgG4C5kNSBA/1AV9MACgYRcL1eAXOGS3tP+MmITSjcm3tRdf7D595XAq
	HLydvtnfRnOxm/xSMzoC4JWKxBmF2Xs7FEb1dn7iKIOUNLrEvRaqH/AdvlgMzYgKQtIc820d7UK
	+LxQOGzWAhNEnNmLR3YiDZoghekz4qAjkCVmGA4oNpW17qEHfMwSVPGKmyMLSaXT7wOw+r/umLk
	g3IRQ==
X-Received: by 2002:a05:6102:1614:b0:728:68cf:c76 with SMTP id ada2fe7eead31-72fd7c54a4amr2443950137.23.1782236006573;
        Tue, 23 Jun 2026 10:33:26 -0700 (PDT)
X-Received: by 2002:a05:6102:1614:b0:728:68cf:c76 with SMTP id ada2fe7eead31-72fd7c54a4amr2443916137.23.1782236006023;
        Tue, 23 Jun 2026 10:33:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697cf760eeesm1901486a12.15.2026.06.23.10.33.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 10:33:24 -0700 (PDT)
Message-ID: <97223cb0-59c8-4ca9-a65d-bfdbb3384224@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 19:33:23 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] pinctrl: qcom: Drop unnecessary bitmap_fill() call
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
 <20260623160457.j66dlzxfkvn3jxuj@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20260623160457.j66dlzxfkvn3jxuj@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE0NSBTYWx0ZWRfX8tlWWyJlSZHm
 28cO8BHjtiseXBsRB8E9IZ3SHn147lEEZ1qoShqn2FWwTAw7gO8WiTl9vxsRVqa5oqZg0SfLbuq
 Y2d3pJLNPckr0dKqzhuOlz1UcTIfebc=
X-Proofpoint-ORIG-GUID: 3l0DlAOsjPq3faQxQExhDuyWo_GhlWZB
X-Authority-Analysis: v=2.4 cv=HrxG3UTS c=1 sm=1 tr=0 ts=6a3ac367 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=sg1wl6nj3Ose853SHysA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE0NSBTYWx0ZWRfX9fbCA+Y6gNKP
 melzlXXGK4OzFvuphsWfRiScDGuqN6xQSV4zNtKflwQBUynnDs2a61zTp5pXe2Z4laRSVzMv16D
 LrnSFl/efOqwrb2/QduPpezRWSObjwc5qixE47QFva89i5SX3O9TYe1Ymv7TSDq0ObznIzhidvg
 rNyNtn+pkAXfEtlHPVb5LTLILMsPH9s4ZBKZEuJ862PHYzzXtygeYq8/eWSgPO4v2mz6Z9LQDpq
 zvw0YMzIYhiA7+1tgjOrg/Kh/gO33AiTAtGRip79ECutV0p26uhRYuVyy8DjoTmiAj5D77NOODL
 juJNiCJ3OZYCq8+deab2ou8jMs+8GAy9RKn0xYdT8olAfspcj2RfdROkr/xhiKNdF7sCIl0yqbW
 yKdH9N//hQabNutX90BjuHtW1zT/Wyym6DJZJddOiPe6zhKboAP6NwdO69u95J4M+HlapBpbVsV
 doJqeSdcJuv6chTHMEQ==
X-Proofpoint-GUID: 3l0DlAOsjPq3faQxQExhDuyWo_GhlWZB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230145
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38850-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42E116B917D

Hi,

Thank you for the reviews.

On 23-Jun-26 18:04, Mukesh Ojha wrote:
> On Tue, Jun 23, 2026 at 02:27:31PM +0200, Hans de Goede wrote:
>> Drop an unnecessary bitmap_fill() call from msm_gpio_irq_init_valid_mask(),
>> this is unnecessary because gpiochip_allocate_mask() already does this.
>>
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> ---
>>  drivers/pinctrl/qcom/pinctrl-msm.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
>> index c2938494c6bb..419342ab45e1 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
>> @@ -1047,8 +1047,6 @@ static void msm_gpio_irq_init_valid_mask(struct gpio_chip *gc,
>>  	const struct msm_pingroup *g;
>>  	int i;
>>  
>> -	bitmap_fill(valid_mask, ngpios);
>> -
>>  	for (i = 0; i < ngpios; i++) {
>>  		g = &pctrl->soc->groups[i];
>>  
>> -- 
>> 2.54.0
>>
> 
> Looks like you missed to add kernel mailing list to the series.

You mean lkml ? Generally speaking I don't add that to series which
are subsytem specific and not really interesting for a wider audience.

Regards,

Hans




