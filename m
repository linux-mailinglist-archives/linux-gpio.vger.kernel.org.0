Return-Path: <linux-gpio+bounces-38839-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GeFNLlJPOmoo5wcAu9opvQ
	(envelope-from <linux-gpio+bounces-38839-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 11:18:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 179A66B5B70
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 11:18:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=A4mS7UH9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FTrE63RZ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38839-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38839-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 528DD3026178
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 09:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E76348C5D;
	Tue, 23 Jun 2026 09:14:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EF130C37A
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 09:14:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782206043; cv=none; b=urW9kNRA3EYk4RaMjo0RJPxPLxXj/gu93tg77GyNWGP31ljSMJCQ4AV5WWoqbW/9CaE93F8/REzhTmNNRYSgEMkH54ADGw/6AM2XheLpsyD5aaQLAviZQjb/J398PTZH++zvt+Q4Rn7BzHVL8FdS8btFsm9HOm8zC/dXldPETfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782206043; c=relaxed/simple;
	bh=cQKjFSMQE+XeYyiWc+t1WYLYYKCy4O9bStOxNKaGyvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tJ9kKFya56TubRE51s6d6b4t22+wXoWaaaw/ePzakgU8fjNcMQdnkfgBJ9TkUHSnFgwrNq/bTR8r0Bm2zSIajk8GE8JaVTSyju98yHJIKmZy0a2WpT1QQVtaf4QdO+VyLIk6e1zFN+T+tuV8AEw8VMuRwOsYih0S7qHrNqDUrk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A4mS7UH9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FTrE63RZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6cWkN3338322
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 09:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	24B/vWc0OHfdLJwPCzXWYKyFsXHSMgBg7admOM5KrsU=; b=A4mS7UH9cMUAFje6
	A0r8LqRcNxoAq7P0nSPp7j7UH+rGGDrFJ6XHXWLsqzS+YWI3HvZiMZwWJqIkrA4I
	AoUVIo+2n0Qks0KtLcggUx9+rPxok5ME4EiHCtEk3HdOU+C8Lmt1GEyZNUEVXqSy
	5/P5OL7cE/GhGd8rVLAzZcGLTrIMJHqoMFRJze7Ct6AVBGTG+ccWCdIKO3/dnITf
	ElE4W8bwg7Kjx8ZgIM3IgyM9+8LgzyJljD54Q1/TLJj/VZjuxKGw8ouZpleqURJX
	RQToHzvomedlloJJZ8sdKpIPQZpqSpH2pw0tm+apD02wy8kNm07e9Bwfe8Frpqd5
	4KmKbw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjhg8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 09:14:01 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-845317fa7e6so7697295b3a.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 02:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782206041; x=1782810841; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=24B/vWc0OHfdLJwPCzXWYKyFsXHSMgBg7admOM5KrsU=;
        b=FTrE63RZTZXpWOmNB5p4G7awUJHn2DDWLB1S2RIeAGtDG9m06+eVvMCWB5Oug6Way6
         jcOEjD8FYkuuvADjHK8nesOsEJTJ8lTLV1S8SFYwSlJeVcqe/bcn/Uzv71AyaP2eVAFK
         mEXpQ5KaBOD2xSwVp80BFdJUU/RXGsAJaN+cXddqIj7tvNx61Xn81E5m3HEXJNVFxcoI
         y3Tmw3h9vU7gGdYLdxbqVfizlxOF+UpLrgON2arpGA6fF7nnfLAJFfRTNXiEXAKia3cf
         yk271TUgK80oWLPZNfId95M4Snr7VagYFpo/Ao2cND78ECxYfMXY36HmVfBtaLJl6fBJ
         kV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782206041; x=1782810841;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=24B/vWc0OHfdLJwPCzXWYKyFsXHSMgBg7admOM5KrsU=;
        b=G/L53BBGLpJWHfAZzp5Q+VpMozX2X9Mu9soUiq3GMmXRYIgQj6NPby36QbW6g/wiaV
         js42TR36OySisNKNC58fkhUCgx1JYcP20DjqO4sbPtKG0s7z2LL4sfsdgtx65jbGLLU4
         BZng29Uh7GUc5cVD7cvmn2MhJkirQHdJ9EEaboL4GTQAbMZzkQn1Hg2AmrRSKUVNOuPe
         xFzHPHc0129j0zWdw9B5RqN36XzELMG/sDif0bCItptw1WpYDehI2kKRBOAScRV1Dg9j
         El1rJwZjbvBT9WHNmeHH17nlzAZoDONu7NInWmyvGxLlGTI9SN+r3z+bZn8uT2flDSvL
         241A==
X-Forwarded-Encrypted: i=1; AFNElJ+gZky8gPS5LESZz9i8rr/ukjOilK91yjfXxMogBn6CO5pZSE5qNCOKU4oGZiDoyVOGV0CvEtQmx2h+@vger.kernel.org
X-Gm-Message-State: AOJu0YzL6SQPOnOggfU1twRUuhIiBU4bZgfnVtM+x6iOTfl2hq7bnn1V
	GF1MpQI1asGf0kyaPjqKRxc2LUJiz6RHS/OBL+qPrTqdzQEDfp/qg0qubPiBgU3UKeLwm63xu3N
	qCsqmGPB2eDOrOKAcSKv15dc9K1zX305lqugXOjC6QgC9SpOmugAqtCN8u7em0wEQ
X-Gm-Gg: AfdE7cmSK9HaussIkG4s1YjlXLAQjy1XH7X+Hk2hszArWJSaYIjKafxg+dPtRTFghaz
	aTX+LNyWaTCWXu2FMUYLdT7Gruvac/Vqvo7ljIkNVwCK5XMEnaKqqAaVspI2A6mZvrPuw3jBuGK
	pippCj9pbwMA4BijWMNpcgA7QsrS12eBwOGqGSetNX0qc+aQ7qAKNs9SdIvQ31kDxGMCPYXkZwZ
	qR0/bDiqRx4kcnmMdB76KgBm69LXTy5yOv6yuuwDJlC8ZOmlKEqaH3C0dIXnA8FmkyenaXzHp4e
	4hKiV5A8XF8Kh823gSK9nhexNll7rX9LkrXUWC2ua0CDJ9ZuzUEmoEfbCSPCIN1+VjAAHlLrOYe
	dF+4pvAZJBo9Myd35TGM4axxd1aL6UD3SesC79CkuebCJ
X-Received: by 2002:a05:6a00:14c4:b0:82c:b808:4c59 with SMTP id d2e1a72fcca58-845970ff8e1mr1946819b3a.46.1782206040619;
        Tue, 23 Jun 2026 02:14:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:14c4:b0:82c:b808:4c59 with SMTP id d2e1a72fcca58-845970ff8e1mr1946786b3a.46.1782206040140;
        Tue, 23 Jun 2026 02:14:00 -0700 (PDT)
Received: from [172.20.10.7] ([106.192.20.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ed3bd8sm9568565b3a.56.2026.06.23.02.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:13:59 -0700 (PDT)
Message-ID: <81f10859-b7b9-4a37-a260-b77e36f0267a@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 14:43:49 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: codecs: add Qualcomm WSA885X I2C codec
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260610155708.151067-1-prasad.kumpatla@oss.qualcomm.com>
 <20260610155708.151067-3-prasad.kumpatla@oss.qualcomm.com>
 <20260611-straight-refined-beetle-e2c934@quoll>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260611-straight-refined-beetle-e2c934@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3NCBTYWx0ZWRfX9gzU2+kh0yhe
 +8cE+IRJ/+0Ua8boyXaPNBJQu2joDfkCzCzYGXBspyVnyITwWZi+jVKT71rbRf+RPym/xRHZHhu
 H4Y1KLqEL/hVT3X/OI42VQy460xInbT05Y7XfU971ejOc0ndr3Ak5NhmkRGFcw3TGI9uR2xY1dT
 gjkTolhgK6brxPKPxgyQz6fpKDnEuAalFiw13vFLAZhtaJT4XKOWs3p9BlufIR/PZuN2YKK1Rtc
 Yes32Pge9ZhWoMDFzRkrA+5uz8Cq0Gb5EVvSB1vgZE5SfQ3E9qNS+rwqV+IojqDGLkqUeoKj+jI
 sRrJwFwlFFHCM+41FnMaQgQmd6+Ganf8GeZisQhp17g5RtU4sqfHS8JU+tQwS8BrM7emh5CLib9
 GGRBLMOscLj5ms6dXhNRrWn7FsB0ALx9wrediYg3IoFAFS0BqzYc87LmOvOe5/RGMBicwKG3RxU
 Kyjnpz/jMNIV8UtTTZQ==
X-Proofpoint-GUID: pXIV20vZ5jgDbUCP24A6tT-1AWSu2Lep
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3a4e59 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=GtHFPjVsJ1z6j8OeKiQY1g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=YAGGjYiUH1UqZGlMsp0A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3NCBTYWx0ZWRfX5Aq2V4RvGt5l
 9nqy80BA288PRunHEyfIMEGUTPoqCbVpeFtuTisUiEAjSs0SEAN2FRdHLajFWm3MRlg+vJjdv09
 FO1EIn6Uz49jBJjeeFCPMrhHAIBhi5U=
X-Proofpoint-ORIG-GUID: pXIV20vZ5jgDbUCP24A6tT-1AWSu2Lep
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-38839-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linusw@kernel.org,m:brgl@kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
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
X-Rspamd-Queue-Id: 179A66B5B70


On 6/11/2026 3:09 PM, Krzysztof Kozlowski wrote:
> On Wed, Jun 10, 2026 at 09:27:08PM +0530, Prasad Kumpatla wrote:
>> +};
>> +
>> +static void wsa885x_gpio_set(struct wsa885x_i2c_priv *wsa885x, bool val)
>> +{
>> +	if (!wsa885x || !wsa885x->sd_n)
> How wsa885x can be NULL?
>
> This wrapper is pointless. Avoid creating abstraction layers over single
> call to standard kernel interfaces.

Hi Krzysztof,

Thanks for reviewing and comments on patch.

Agree. The NULL check is unnecessary, and the helper does not add any 
meaningful abstraction.

I'll remove the wrapper and use the GPIO API directly in the next revision.

>
>> +		return;
>> +
>> +	gpiod_set_value_cansleep(wsa885x->sd_n, val);
>> +}
>> +
> ...
>
>> +
>> +static void wsa885x_gpio_powerdown(void *data)
>> +{
>> +	struct wsa885x_i2c_priv *wsa885x = data;
>> +
>> +	if (!wsa885x)
>> +		return;
> How is this possible?

No, I will remove all the unnecessary checks in the next version of patch.


>
>> +
>> +	wsa885x_gpio_set(wsa885x, true);
>> +}
>> +
> ...
>
>> +	if (count > 0) {
>> +		if (count % 2) {
>> +			dev_err(dev, "%s: Invalid number of elements in %s (%d)\n",
>> +				__func__, init_table_prop, count);
>> +			return -EINVAL;
>> +		}
>> +		if (count > WSA885X_INIT_TABLE_MAX_ITEMS) {
>> +			dev_err(dev, "%s: %s has too many elements (%d > %u)\n",
>> +				__func__, init_table_prop, count,
>> +				WSA885X_INIT_TABLE_MAX_ITEMS);
>> +			return -EINVAL;
>> +		}
>> +		wsa885x->init_table_size = count;
>> +
>> +		wsa885x->init_table = devm_kcalloc(dev, wsa885x->init_table_size,
>> +						   sizeof(*wsa885x->init_table), GFP_KERNEL);
>> +		if (!wsa885x->init_table)
>> +			return -ENOMEM;
>> +
>> +		if (device_property_read_u32_array(dev, init_table_prop,
>> +						   wsa885x->init_table,
>> +						   wsa885x->init_table_size)) {
>> +			dev_err(dev, "%s: Failed to read %s\n",
>> +				__func__, init_table_prop);
>> +			return -EINVAL;
>> +		}
>> +	}
>> +
>> +	ret = device_property_read_u32(dev, "qcom,battery-config",
>> +				       &wsa885x->batt_conf);
>> +	if (ret) {
>> +		wsa885x->batt_conf = WSA885X_BATT_1S;
>> +	} else if (wsa885x->batt_conf != WSA885X_BATT_1S &&
>> +		   wsa885x->batt_conf != WSA885X_BATT_2S) {
>> +		return dev_err_probe(dev, -EINVAL,
>> +				     "Invalid battery config %u (expected 1S or 2S)\n",
>> +				     wsa885x->batt_conf);
>> +	}
>> +
>> +	for (i = 0; i < WSA885X_SUPPLIES_NUM; i++)
>> +		wsa885x->supplies[i].supply = wsa885x_supply_name[i];
>> +
>> +	ret = devm_regulator_bulk_get(dev, WSA885X_SUPPLIES_NUM, wsa885x->supplies);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to get regulators\n");
>> +
>> +	ret = regulator_bulk_enable(WSA885X_SUPPLIES_NUM, wsa885x->supplies);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to enable regulators\n");
>> +
>> +	ret = devm_add_action_or_reset(dev, wsa885x_regulator_disable, wsa885x);
> Why you cannot simply use devm_regulator_get_enable?
Ack, will use.
>
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "devm_add_action_or_reset failed\n");
>> +
>> +	wsa885x->sd_n = devm_gpiod_get(dev, "powerdown", GPIOD_OUT_HIGH);
>> +	if (IS_ERR(wsa885x->sd_n))
>> +		return dev_err_probe(dev, PTR_ERR(wsa885x->sd_n),
>> +							 "Shutdown Control GPIO not found\n");
> Messed/misaligned indentation.
Ack, Will update
>
>> +
>> +	wsa885x_gpio_set(wsa885x, false);
>> +
>> +	ret = devm_add_action_or_reset(dev, wsa885x_gpio_powerdown, wsa885x);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "devm_add_action_or_reset failed\n");
>> +
>> +	i2c_set_clientdata(client, wsa885x);
>> +
>> +	wsa885x->intr_pin = devm_gpiod_get(dev, "interrupt", GPIOD_IN);
>> +	if (IS_ERR(wsa885x->intr_pin))
>> +		return dev_err_probe(dev, PTR_ERR(wsa885x->intr_pin),
>> +							 "Interrupt GPIO not found\n");
>> +
>> +	ret = wsa885x_register_irq(wsa885x);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "wsa885x irq registration failed\n");
>> +
>> +	ret = devm_snd_soc_register_component(dev, component_driver,
>> +					      wsa885x_i2c_dai,
>> +					      ARRAY_SIZE(wsa885x_i2c_dai));
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Codec component registration failed\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id wsa885x_i2c_dt_match[] = {
>> +	{
>> +		.compatible = "qcom,wsa885x-i2c",
>> +	},
>> +	{}
>> +};
>> +
>> +static const struct i2c_device_id wsa885x_id_i2c[] = {
>> +	{"wsa885x_i2c", 0},
> Used named initializers.
Ack, Will update
>
>> +	{}
>> +};
>> +
>> +MODULE_DEVICE_TABLE(i2c, wsa885x_id_i2c);
>> +MODULE_DEVICE_TABLE(of, wsa885x_i2c_dt_match);
> Don't come with own coding style. Each above goes IMMEDIATELY after the table.

Agreed. I'll place each MODULE_DEVICE_TABLE() immediately after its 
associated table to match the existing kernel style.

Thanks,

Prasad


>
> Best regards,
> Krzysztof
>

