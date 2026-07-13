Return-Path: <linux-gpio+bounces-39983-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RqXPH9/pVGo9hAAAu9opvQ
	(envelope-from <linux-gpio+bounces-39983-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 15:36:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E985E74BABB
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 15:36:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tuxon.dev header.s=google header.b=pdGeRzlp;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39983-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39983-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDEF432B8CBD
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 13:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1B4423A8A;
	Mon, 13 Jul 2026 13:19:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D72422552
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 13:19:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948774; cv=none; b=UCaKhLxZrHyS9IP1CIYXfNi00tLUlME8qLmDKRuRtvpIsDNoGbacelZYW6863yx8LnQJdP6r3eIc8usMjgUJjz6dgs7X4IkXczeYT+goruh7988wluo4C7n69W94Mk+Vn6U8gDcQcXRilOYS3I9QJGq+nb8PT7kqN9NnvGKK3DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948774; c=relaxed/simple;
	bh=3Wr4e31xsL5FxE1yKBLHPMDVMdK7LAWRj9VzDWkA7xQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gxlVaoBKxlqx/Zay6Z/c/mF/dO7ITbzN+3zdIES/2iEt19Azpp/o7ohQqprDljzKYybXwwHJ1tSAMRmR+Sv4pazDu2aG+F8AwSCz5pK6gIpkgM17isGg6TxkDW0S5+DH2REYH8cJ/iudroCTS9p0zIURbE3LVxYzNRfD3yWD8sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=pdGeRzlp; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493f60208a5so27269385e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 06:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783948771; x=1784553571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KTbNJLihYo7bkMewNpvZJfJ0V7h5dxKS3F/GHCAlNdU=;
        b=pdGeRzlpM/B4egrGVhmKf4IvfSiuuOXlaavRDiSvx8lLY/ejSsh1w7L6HdYjQsOJzl
         VzmeRGAsvirPbWz9jHTpQdEDNAKLQUdvjtgHosbwB1bhYwfdQ91p+c9BL4roSez/WPk7
         LGDh2EZg0GXZl0fqip+bdXzit978GHNaQiHpo2L6P/FSpIwbp8A7BDY+xLzxA+OwozSx
         RtPx8dzIdvGMMmkJlTw4QhxBKca+iAkI4dyJXNR63zar18A5iadQ4FitkIKR7/6ALBoS
         jo6bXDRtC65htHeNmdIKcv88HXB0xL3IEbh0rJZVU4mxeSZg1mkMS0fMq3QnmAzRfPTq
         ufMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948771; x=1784553571;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTbNJLihYo7bkMewNpvZJfJ0V7h5dxKS3F/GHCAlNdU=;
        b=EzCJjNxzWqOX3+IGUskzZfnaQv7QK6yizNin3gBNcGVkyARTTDWoIsVF2MR92mvIpq
         ldJ2E/6RCQi9I7vARf89wxfUmu22imgo+D7gUVE6fYTksHOqEvlKCmc6l7/oWwIhPkIE
         P+xe5nhxzRPRxPws2DDkdMggd22ZjRnC2dItz1sBeGsRamUAD54+LiHTCbwIa5j/lhvR
         w0cj4/1sYCibEf9e3j3myJIeiYvUoLWRJReAJNfNwlj8FayGNsVh2Rbm/fD9fDqv/DLW
         So5g7HBexRW/XVS6bBagKSX/iouq9LedabPrtUqXAGa8mFu6avcCGgwK5ldNH6EwJjmO
         oUWQ==
X-Forwarded-Encrypted: i=1; AHgh+RqbYqqtisCuTWqWj3UXxYSXsY0gYsVHOxHB5RyXY5GgNN24KwNTBuJfl+TdKBRJUGAiv95z6BygZuu3@vger.kernel.org
X-Gm-Message-State: AOJu0YwCDFfB134QQp+hv+M/ptgJsQguotI411J+HEQyC3CQH4FbDNI9
	GmJhBojFIVQiq8U9PfrxAtQ7aIleEYX1FerT1ZDRYSN3pyjzLDojX1w/CGRXCEmQkj0=
X-Gm-Gg: AfdE7cm1L+TYrQZgsbkWfUU2EppADE1oqUv3zLH4+0GEnFv05j6VSVhd8pehgiK3d/j
	8aoso04SefYGXEI4gBsFzt1ntRa/natzCZeYrWM9m04zP8cGhU4otesZASzI5oB2t0rLwIaSGWd
	gNcMtKfGq0+nTjlu4KTWI22T2ZfR3KaHu7JbNFiAw0pRJBeurhDVIl09yI9y6Fy7jeuMe0qPDTn
	n84ih2IJi9iMQ63kqMkBYLqBMrxDCFExQbFAptQmJdNMapePlrNshIpqwIKQ13YkVplAIHRnYOT
	FrGvTBRehVEDFd4jUg/dY6hlKagGDVkzUcVsChv3qSyyFOkIM0Xi/wRW8VM3EoJ8SA/wSCBQ3uc
	b5UhYFQs2WvHOwErLmqQL+pX54ZqZPJaxkqmB5pDKoXHuRApCfU/UDc+T25qMT6kOAuQrruMnDm
	qRnK/0lXmKNufjXDJe0ZYpA38o7lBiMHYWeRUKV3Ni3wWZsN3/7kLqP/zzLKl3ttw=
X-Received: by 2002:a05:600c:5307:b0:493:f278:ba2f with SMTP id 5b1f17b1804b1-494033f4fd2mr26419545e9.9.1783948771139;
        Mon, 13 Jul 2026 06:19:31 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:6402:500:e91e:fe5e:857b:d0c? ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493fd3ccfd4sm120499685e9.2.2026.07.13.06.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 06:19:30 -0700 (PDT)
Message-ID: <f5b7441a-d72a-41c1-b67d-5225d8e9ced0@tuxon.dev>
Date: Mon, 13 Jul 2026 16:19:28 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "linusw@kernel.org" <linusw@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "magnus.damm" <magnus.damm@gmail.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 wsa+renesas <wsa+renesas@sang-engineering.com>
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev>
 <20260710113637.1328000-5-claudiu.beznea+renesas@tuxon.dev>
 <TY3PR01MB113469434A4393A02DAA45DDF86FB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB113469434A4393A02DAA45DDF86FB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:biju.das.jz@bp.renesas.com,m:claudiu.beznea+renesas@tuxon.dev,m:geert+renesas@glider.be,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:wsa+renesas@sang-engineering.com,m:claudiu.beznea@tuxon.dev,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39983-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,tuxon.dev,glider.be,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	URIBL_MULTI_FAIL(0.00)[tuxon.dev:server fail,renesas.com:server fail,sea.lore.kernel.org:server fail,sang-engineering.com:server fail,vger.kernel.org:server fail];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[claudiu.beznea@tuxon.dev,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,tuxon.dev:from_mime,tuxon.dev:mid,tuxon.dev:email,tuxon.dev:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E985E74BABB

Hi, Biju,

On 7/12/26 17:55, Biju Das wrote:
> Hi Claudiu,
> 
> Thanks for the patch.
> 
>> -----Original Message-----
>> From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
>> Sent: 10 July 2026 12:37
>> Subject: [PATCH v4 4/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for selecting the I3C power source
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V. The pin controller provides a register
>> to select between these two options.
>> Update the Renesas RZ/G2L pin controller driver to allow selecting the I3C power source on RZ/G3S SoC.
>>
>> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v4:
>> - none
>>
>> Changes in v3:
>> - collected tags
>>
>> Changes in v2:
>> - none
>>
>>   drivers/pinctrl/renesas/pinctrl-rzg2l.c | 73 +++++++++++++++++++++++--
>>   1 file changed, 68 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> index b52a85066f63..9a0706fea220 100644
>> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> @@ -69,6 +69,7 @@
>>   #define PIN_CFG_PVDD1833_OTH_AWO_POC	BIT(19) /* known on RZ/G3L only */
>>   #define PIN_CFG_PVDD1833_OTH_ISO_POC	BIT(20) /* known on RZ/G3L only */
>>   #define PIN_CFG_WDTOVF_N_POC		BIT(21) /* known on RZ/G3L only */
>> +#define PIN_CFG_IO_VMC_I3C		BIT(22)
>>
>>   #define RZG2L_SINGLE_PIN		BIT_ULL(63)	/* Dedicated pin */
>>   #define RZG2L_VARIABLE_CFG		BIT_ULL(62)	/* Variable cfg for port pins */
>> @@ -186,6 +187,9 @@
>>   #define PVDD_3300		0	/* I/O domain voltage >= 3.3V */
>>   #define PVDD_MASK		0x3
>>
>> +#define PVDD_I3C_1200		1	/* I3C I/O domain voltage 1.2V */
>> +#define PVDD_I3C_1800		0	/* I3C I/O domain voltage 1.8V */
>> +
>>   #define PWPR_B0WI		BIT(7)	/* Bit Write Disable */
>>   #define PWPR_PFCWE		BIT(6)	/* PFC Register Write Enable */
>>   #define PWPR_REGWE_A		BIT(6)	/* PFC and PMC Register Write Enable on RZ/V2H(P) */
>> @@ -257,6 +261,7 @@ static const struct pin_config_item renesas_rzv2h_conf_items[] = {
>>    * @oen: OEN register offset
>>    * @qspi: QSPI register offset
>>    * @other_poc: OTHER_POC register offset
>> + * @i3c_set: I3C_SET register offset
>>    */
>>   struct rzg2l_register_offsets {
>>   	u16 pwpr;
>> @@ -265,6 +270,7 @@ struct rzg2l_register_offsets {
>>   	u16 oen;
>>   	u16 qspi;
>>   	u16 other_poc;
>> +	u16 i3c_set;
> 
> 
>>   };
>>
>>   /**
>> @@ -272,6 +278,7 @@ struct rzg2l_register_offsets {
>>    * @other_poc_pvdd1833_oth_awo_poc: PVDD1833_OTH_AWO_POC mask
>>    * @other_poc_pvdd1833_oth_iso_poc: PVDD1833_OTH_ISO_POC mask
>>    * @other_poc_wdtovf_n_poc: WDTOVF_N_POC mask
>> + * @i3c_set_poc: I3C_SET_POC mask
>>    */
>>   struct rzg2l_register_masks {
>>   	union {
>> @@ -281,6 +288,11 @@ struct rzg2l_register_masks {
>>   			u8 other_poc_pvdd1833_oth_iso_poc;
>>   			u8 other_poc_wdtovf_n_poc;
>>   		};
>> +
>> +		/* RZ/G3S masks */
>> +		struct {
>> +			u8 i3c_set_poc;
> 
> How this POC is different from Ethernet, SDHI and XSPI POC?

Different bit mask and offset for I3C SET_POC compared with ETH, SDHI, XSPI.

> For consistency, can't we handle like others?
Everything is handled the same way for all functionalities in 
rzg2l_caps_to_pwr_reg() from patch 1.

Thank you,
Claudiu

