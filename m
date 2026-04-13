Return-Path: <linux-gpio+bounces-35084-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELm9FLrQ3GmcWQkAu9opvQ
	(envelope-from <linux-gpio+bounces-35084-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 13:17:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A304C3EB29C
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 13:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A49DA303A5E2
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 11:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18623BF673;
	Mon, 13 Apr 2026 11:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FFiUm1o+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ed4C1o8D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323093BE64C
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 11:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776078740; cv=none; b=MDG0pPxJtAMoIcLFUbBO1xTy8P3pNetB0xg/5QMFIHPlvaTjP7a9WMSKPXIoAw0lob2q8EDKXmkHKw0a1hl9hX1Ez9Codu3diYeeWZD3EQkgxAyNBCAoyxxnArcTxlz7dJDxNY3ihR500zEYYUR4JmruH0SPfKek0KaR5shaamA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776078740; c=relaxed/simple;
	bh=Q69GnYOACQyfSvYMuqrvYCMNCmRi66oE4x2Me0eEWhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SXRJT0WJlugXDhNv49CCLRp7vEp5roCWI4NrZ+oPKG15lVhw89eCGaQRstQbomTGxVlMqdVafcbr2KrDgYJHk8UVtHr6Mg4uAv7OjhzpK9OT1QVbultGpX4qvuXvqJbQtTZtjeVIqLZhH4wzdqMT+DZFvbAZMOiwm+HNpy19Nwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FFiUm1o+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ed4C1o8D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DAUqBv2229924
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 11:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Q13pMNKvA0d7OkiErS2v3o7XzXIeya9tsuMotgXsgk=; b=FFiUm1o+fEzL4QEl
	JwwZTE5+MVZjFPn9+vJwWnKoCb2dyUKjp9x6soTdaYvmNKJ59deI2A+Y1KulYgbM
	P7n/ufXltYQT0VTfYmtOy7ZxMyq0btP1bG8S05drPskVF3V1C3a2L3gcQFx8yk0Q
	HUZT8PEMsdb6fkHlllgZ9bGd+wt5NDmc9jZxrCoWoHFgkT4TC3kBrJB/amzVHvlf
	xJ2FOBDN2/cMSM67xRwJ8nG90SFBTzvR1aN/7nmHIB5H9b9oieKwb/H3t087Qe2u
	6WlCpjAvSPZ/K2ib8vHJBi9nW0tQWHIWKHBshd/qaqPhkUgzADDM2GzT4lUwkRfA
	CB37rw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dgxt6048a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 11:12:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50da31af14cso58417461cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 04:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776078737; x=1776683537; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7Q13pMNKvA0d7OkiErS2v3o7XzXIeya9tsuMotgXsgk=;
        b=Ed4C1o8D2v8dEMdlyluzAVZdC/eotd/jQ8f4T8QRPflaQ95SlMFo4D4Nsne3lMWmec
         Uk7EqXos0ek7sd+YeW9N1NO9oOfNkMRxZygHheprEV2hr1O2/6zExnBbXN4yOiUVWe2A
         T3kgQgN4dS9qGBo6t6P+72rMGqIYX8REeQgjuhqqDH2FnurEQnSk6K9eK4y5JckPqkfj
         fvZ4pg1EIYhvGNEoaCiGmY291Hkrp5drrvdbmechsHnV7vNdZJr3XEbmdjo70pWRNxAf
         HMXivoT5csMWYSFPJK3d7zbNOpISBNHhr5fYJHDwWwyJNDxphf836yajOtzRu/MmJShJ
         O//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776078737; x=1776683537;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Q13pMNKvA0d7OkiErS2v3o7XzXIeya9tsuMotgXsgk=;
        b=qyhKEkEBibgOiVW+9sbg4+VE8AhGk6JRuer60gpAEN8WAa7xOSlQankC7G7E3PE9Ud
         ijqnNsbyRbwn+VUb41JnzQbdoVN/1NtuQFvL5dclI9N8mWFqsWJVU0dmILd24AIBRcV3
         /jMvqY4QSu0ub3HLAo7NJ9At51Ga3VWAi4QrKlhxcccB9xPK4Ug4y2z1PNmirmy3PUmt
         RE0Yl02b29HiFwns+DTdVr6A3epuDjjIjDCMA5kXAKt9IteUiITGaOYZAgNkoyddgi/m
         4OUgWfiZh0h6+EpAuSYfLLF/oHzL9cvpLbjOhCJ0QeA07NqTRy9wK115fAQmaqaBC/k2
         Uudg==
X-Gm-Message-State: AOJu0Yzqvz1XiaCFDi9lRZjNt0NSzW7z8tiIJDZIr5lAS6gOw+DHHoG6
	9qiP3ThmxEI4A5198I+jRG0jesHXNcFTEEdHeVW8nq5UY2fKBOtI2BJeOGu1i2ot0ANUIE9d3Ry
	sKyGAMKUvtUTkMnQng9wWKvtEqFVE5xaw7AEAHHuY7+/ayToFmICZQa3HUYQcogsZ
X-Gm-Gg: AeBDietQOxmU/nk9akXuwZBD/azE9kc4sjhAWkaCqhsNiQHZpApQ/3qBWRlnhn6Rx/t
	GhL4otdAvPdp3vSURm3QQJlOioi5Av+lZ/4wNoV6dTqlRI/lQY6BJUb1iHsLobPaF+SkgJWvn6X
	OdJJq8zVgnPx4tJtMOAjdvAJbepvMe+/B1VznbUnX6tS1UNVeu6lN67TH9jmQfc98OKHNbBuDX5
	E46bML+SH5QVG81rgZAq5uUVA3FXKl//AwTTNFsp7KbRUbEPxWNvZ0pNQbPO8ErKk++2QkI7VlD
	Ed0DvCiWcwxzfnMKyMTzjzfkfXk1+AgDOpZz8HZ5coj914aBMybMUUP68UcC5wVkko8Gn+JjLwj
	ZvnP6+oAJXpIjSRkn+RDBBFlzInp2PEWsYnfy8L04nj3kyW6V
X-Received: by 2002:a05:622a:348:b0:509:5dd4:7192 with SMTP id d75a77b69052e-50dd5c2165amr198617051cf.54.1776078737548;
        Mon, 13 Apr 2026 04:12:17 -0700 (PDT)
X-Received: by 2002:a05:622a:348:b0:509:5dd4:7192 with SMTP id d75a77b69052e-50dd5c2165amr198616561cf.54.1776078737121;
        Mon, 13 Apr 2026 04:12:17 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5b56d1asm277853595e9.15.2026.04.13.04.12.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 04:12:16 -0700 (PDT)
Message-ID: <dec1aa54-5bfd-4372-8c5b-983618d48291@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 13:12:14 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] pinctrl: vt8500: Enable compile testing
To: Sander Vanheule <sander@svanheule.net>, Linus Walleij
 <linusw@kernel.org>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, Joel Stanley <joel@jms.id.au>,
        linux-realtek-soc@lists.infradead.org,
        James Tai <james.tai@realtek.com>,
        Yu-Chun Lin <eleanor.lin@realtek.com>
References: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
 <20260410-pinctrl-testing-v1-3-6f708c855867@oss.qualcomm.com>
 <a5e993d2b6c8b57d2057909812ce831877762bd6.camel@svanheule.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <a5e993d2b6c8b57d2057909812ce831877762bd6.camel@svanheule.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDExMCBTYWx0ZWRfX7L5b3ZrMIRZT
 8lXXymRJQe7mnvf7wjPTPE7IvAIp4HLlodzV8h8Tlyq2SW/63pQqi1vJGeifd5eM8rwr4468FGK
 ZjHbq0bTgndeIbXbbyVtSeiDJs2aP4oizGI0hCTlb4ueAaa4ny1Rfl3KfsvS4eCxzcXASbP6GhX
 wef2o9mNZ1yxtNwZBwjjR2WnT2ca3q31TYTUY+ulZ11jI9tXg6L/qiY8Q1T98O8kaBYaN1CfkQT
 jgNgx41h6GT9KoENPf03bZN7HOjkdR/3WxpgXUD6AANl5Aj1BlfhV9L9d/BEqH7/F5iAD9befiC
 R12c7cEN0s5oPwmCwp7zwmoAsqOAxHRervz0IcKy+kmB28NHx417xwARZXrL3sEjgYeMeNn2Zec
 6QqKcYjq69JwQTexvAkOK97O589Q59KUovET+4uyTzQnhzyOLviqu4vDfSvnmgZ/bEi5Ry6DEhk
 S2GS5SmgDTpS+wUDHkg==
X-Proofpoint-ORIG-GUID: 5C9aH7Kf0SK_yeEG4l3GOuBZ94CF1J_C
X-Authority-Analysis: v=2.4 cv=br58wkai c=1 sm=1 tr=0 ts=69dccf92 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=kD-Xf_iB5HnCcHWKTSQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 5C9aH7Kf0SK_yeEG4l3GOuBZ94CF1J_C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130110
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-35084-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A304C3EB29C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10/04/2026 23:22, Sander Vanheule wrote:
> Hi Krzysztof,
> 
> On Fri, 2026-04-10 at 15:04 +0200, Krzysztof Kozlowski wrote:
>> Enable compile testing for Realtek pin controller drivers for increased
> 
> Small nit, but this looks like a copy-paste error from the other patch.
> 
> 	Realtek -> VIA/Wondermedia (or vt8500, whatever you prefer)
> 

Yes.

Best regards,
Krzysztof

