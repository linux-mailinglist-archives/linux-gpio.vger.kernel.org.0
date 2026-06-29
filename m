Return-Path: <linux-gpio+bounces-39101-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ikqVJkdBQmpJ2wkAu9opvQ
	(envelope-from <linux-gpio+bounces-39101-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 11:56:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 320956D885D
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 11:56:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oJu75Ot5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bi3DO1iR;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39101-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39101-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 243B1300C320
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 09:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D0B73B71B4;
	Mon, 29 Jun 2026 09:56:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C0B3B71DE
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 09:56:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726976; cv=none; b=iOlsZuM/Yyp0GGkAOgCpOOu5Y0M6Yo3so92m6QjjEMIG+cUpm66eyG813chQGubEShYQC1nccUyBeNbOIFdyNXfq9ptwvj79rPSNpbP30DSwfNsNYJs+VvAoKDl58gsy54wCwiIfDpi9ElZ+43nlKmiwSaX40xFDxN5pkLih96Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726976; c=relaxed/simple;
	bh=TrPGv/zl/q9riZcQ557K3m/9tohKczPiBQpjOOFNp00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YQG080mS07WKD2fQM7TRzvybn1N9T7QqH0OzCS4qgFUw8yQOJH1sWgiImAz2sDMI8z4+lxWXBj9g7CxLOjVy5ca0B1dfruADLCC0j/kQS9lK9hZbIA6pES8CYUzTE+gBOhCnUiPzJ4YYIZgZLaU1U9cWV0JwcDOfkE6f6Vp3Mjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oJu75Ot5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bi3DO1iR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T7Dx6A2188882
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 09:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+GpxxFw2UM30Ce8Qa2rv3JI9XcKMO4o2jYpPU5f/yv8=; b=oJu75Ot5ed9PVbIe
	goukbMpUXMmZO0aBBSV6tGMj7UYIo7EI280cIOrF1hyDLCjx7cf5pGTE5FvMv0X6
	UINAqxzguJvgq1PiRK/Snv6541tVOPwQ3ZnMytFJFK5XkdOeMKJN+5DZxL/RMZqh
	+e5kaIwY9vPgmUBMifJ5LAID4V+TgNH+9q1utRjJENdU5LTNn4G7Q1tAz2I6+Ghu
	/Yts4ukPx2bBtKSkC9KFcgL+UbYpd6aG/xRQHPRw36IZCSv+Lkyf1e34wsqnedxB
	fvcB6/M4UEQNVWWUvXu2gD0qUTHxwJiyN92xqDakvzg+ZVcxKT7sW6Ei3r9phv5p
	ETE3ow==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4trpbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 09:56:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfd1772d8so1566741cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 02:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782726973; x=1783331773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GpxxFw2UM30Ce8Qa2rv3JI9XcKMO4o2jYpPU5f/yv8=;
        b=bi3DO1iR0pKW8EGf/lxp1ZIfOk+Pn/RrI40R9iYEmdlM7HdkhkfYssFWLbk6A4b4XI
         piETdB5jf5dlX4NyGxXMxYTp90zXetJZigHOkP4bVtQ4HOI0SPx0ZQQv4wzlaD2ZhyIO
         ZxAYFQbfFqBTgB61km1plrDM5wZme/M5HxF4wFeY/hoYqfrlY6XfoMSzb0LDz1X92j3k
         EwAiGt5pLJ+32A4+ADAcFfLF4DgxmPByaXkFn++PA/rRzDZZqZF1DOgFWDAIP31sl/fL
         RYLyePi4iLJd5SLUexcRPPu1J6c0QJVAk/uW1BeytFUMPnnDu/6fUmc8tt27bZ/Rl5jq
         HPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782726973; x=1783331773;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+GpxxFw2UM30Ce8Qa2rv3JI9XcKMO4o2jYpPU5f/yv8=;
        b=fvD5KspHJXp9xPm4yQFYH0A8BWaf92SgL/dE1OSx71mwE5jmzEcpGup14D/lPyUY7/
         wxulEURFoOyfuxjpWbOuONqH6xTet9rUbI6owN+OxvEHsX1E36ZMktRllJRppTi5QhJe
         Rbqx5G3PcR6/9cHhDa5XC+AXftyG1cUzFlOHgyTucUi2IXZOkparhEbuYS2FzEdi9ICM
         Ef7HZCESdO6nZ56XrXG2ddGa2TcGgAiDa3zUWSZE/0lDW3Rd0RK2ZlzaLezhsmv7rGXx
         +qvvqj14ZnHHC/e/c1lU4rOsbdod/DDmnrjM17cHtTR3p2pGFL+znmYlptmFBLyA59l2
         gVYg==
X-Forwarded-Encrypted: i=1; AFNElJ/6BbGXHIg6NFYu8ycB9IZZTlP14HkBKDdLVtPZer7JSSOHT4EMwXMdqQwbfWR6QtNXjFqzuhN1SdpG@vger.kernel.org
X-Gm-Message-State: AOJu0YwffopgvQ19YAC8wBdJDl8ODFKZn/STGMnnwZu9wzijjw0gQ/Kf
	2GJ77LGwDDzPpnzxzshEquU6tefk4W3pXOBTxNHAU2BVOgW+HucnKLAPt7EdGMsoAPmzlhMoy1I
	t99Tz+zkgJ/r1FDt9qQ8HbMm7wIFJju3ZWjaCnIoDlSU9XqDwpFaPgKH14/NW+LDW
X-Gm-Gg: AfdE7ckJmkxrUOb0zzsS9xevwpDYnqis0q9HigbwmB1WXy9+hF1wuWZbmWcqMj3MSOV
	sWl+zFn/plZQXvcf4+JF01+/hbucCGK81yUZhBdsMS4kO2lqlHWguHifgvaobC3HwlYs/8CbxWM
	lcyujkiQdHxAtK25DRAKToSo8IJTXmU7U8EFbYnUTUFtVAr0OSu+D+xh1rsb3xT7sFjRzBX8TOj
	aaBhq9oSRZ0sH71TM/jBsvYbkCatIBy4IfGroNb17ghavZGTxp2mN4Sm4AqXLbVAWEro/+qFnsa
	Ggx/A/ZF9JN2rux95IABrE9koQaA84T0DowDwAhgMFwUQ2P8lRI1m8wtgOf8eK3t5n9eb7ZwbkT
	4lIjxFcNAf/hQ69vD1/oGoJuipcse9wIS6eE=
X-Received: by 2002:ac8:7f82:0:b0:51a:8c9b:6494 with SMTP id d75a77b69052e-51a8c9b94admr77692431cf.11.1782726973114;
        Mon, 29 Jun 2026 02:56:13 -0700 (PDT)
X-Received: by 2002:ac8:7f82:0:b0:51a:8c9b:6494 with SMTP id d75a77b69052e-51a8c9b94admr77692291cf.11.1782726972635;
        Mon, 29 Jun 2026 02:56:12 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1252b4e6e0sm231458666b.2.2026.06.29.02.56.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:56:11 -0700 (PDT)
Message-ID: <2d6e7b56-01a8-4b92-921d-629417c7f5c9@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:56:09 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] irqchip/qcom-pdc: Move all statics to struct
 pdc_desc
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-2-4d8e1504ea75@oss.qualcomm.com>
 <8754de51-bfbe-42f2-84bf-36cc000afa3f@oss.qualcomm.com>
 <91fa4b98-d99e-401c-bb1f-f235034f3aab@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <91fa4b98-d99e-401c-bb1f-f235034f3aab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3OSBTYWx0ZWRfX/P45oCMT4BQE
 png2u5xWm9XVBVZrs9QFcfeQUGDsiAfHoVlhBPshrVaut/ZHJjjFmjTL04/wsUDJbxpqj0hU7rI
 1sDuW/pnUidaSL6mK1ReWm/BvecHVrhGBux6Xe+FMIUfV7oISnQZHUAy+lBxK24zgKzRp46bgyW
 FOwsCz2LK/WI8lkwtoibce4DiJLdyS6ONPG1EL0A4Kcz1MnQ4HPsERgfq7sS7XNdpS+huGnChLF
 wPv3rtji+ulfB7Gn67eBH6x/4S2FJ5NqbAmrSD4ZE4sM7CdmzrRMB6plXeDpoVzOhEYB9aYGo+P
 XZgTjIhsCwjCjYMKQjDCr3Gxv0URo3GuVp8CT4oKpUy63AjzuIPGPLFFxQYWZCyjsR/sSyA62Jx
 GQopZFd/ASI/3lbqcvxRE931euHniRaJdgmQs2yGlXPpickuaRrthtda3c2cC3ixw3Fv5W3a781
 QKhePNQf/Rd+mppT5Yg==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a42413e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hGRUbYMsCoS4gC--qvEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3OSBTYWx0ZWRfX26yZKwbW0AJp
 N73yWXQ5io3YvdL0yAeOlcvbj3bNkezhwDwS8CXOhj2tMAK8bpci1OEEMwI3R7pSqzIgLhTxYrS
 Ylugw68YDY7ESF9XiV9h3Vjjk7rsMLA=
X-Proofpoint-ORIG-GUID: z7G5ISiW8978kG3YGf44I1dqb2C22klt
X-Proofpoint-GUID: z7G5ISiW8978kG3YGf44I1dqb2C22klt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39101-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 320956D885D

On 6/25/26 11:19 AM, Maulik Shah (mkshah) wrote:
> 
> 
> On 6/17/2026 6:56 PM, Konrad Dybcio wrote:
>> On 6/16/26 11:25 AM, Maulik Shah wrote:
>>> There are multiple statics used. Move all to struct pdc_desc to better
>>> align with versioning support. Document them.
>>>
>>> No functional impact.
>>>
>>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>>  static void pdc_enable_intr(struct irq_data *d, bool on)
>>>  {
>>> -	unsigned long flags;
>>> +	guard(raw_spinlock)(&pdc->lock);
>>
>> tglx suggested to use guard(irq) around "the other callsite"..
>> which I'm not sure where it'd be - maybe around __pdc_enable_intr()
>> in pdc_setup_pin_mapping()?
>>
>> Otherwise this patch looks good to me
>>
>> Konrad
> 
> All callers will be from irqchip except pdc_setup_pin_mapping() which was
> invoking lock-less because at that time irqchip is not setup and as such
> can stay lock less.
> 
> Once the patch-3 of this series is applied pdc_setup_pin_mapping() too
> will use the lock as it makes direct use of pdc->enable_intr() where the new lock
> is kept (only for v2.7 version specific enable function).

Ack, thanks

Konrad

