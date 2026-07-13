Return-Path: <linux-gpio+bounces-39990-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iK4VE/z+VGpvigAAu9opvQ
	(envelope-from <linux-gpio+bounces-39990-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 17:06:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA2F74CC8E
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 17:06:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tuxon.dev header.s=google header.b="gl/BwKPJ";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39990-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39990-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E55333066B4B
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 14:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E64A43932C;
	Mon, 13 Jul 2026 14:57:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3E7357CF4
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 14:57:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783954624; cv=none; b=MW0IxfJcwC3fn/g4rHkQl3xI9lJQLiq4ZSphJfwZGu+f69uWtNbVhHakqGbzsdRzzaLEOKD/9R0/3kMdEwwa8S/C4noxOFnqvOYszCGCOyKtg+TJiWnSe5/zeyK8hv4VuOndHRIABuIah3PfZvp8mhCb4x1J4QPyhPpXHw03pcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783954624; c=relaxed/simple;
	bh=GvbPec253HtmUZcFYN5kEFBWuyCLl3ll6NkcMmhhp04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l2jsTWvD7Lc/zWqyaBINezJ8uKUFtB8ow5yy9op7XFTNaMQax89/w5CWsqvs+3ZNZ2I5OLltlgFWG+n7+mkS/gFoKH6tetRbl+mPjWactx7GSICowKm0Mr3dLp1xEv2BvgVw7RRnH+iY9Xr7VwAptsuzPnktxf//Cwokuyx+MEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=gl/BwKPJ; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493b27c7451so52948725e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 07:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783954620; x=1784559420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zhGPgrCiAKM0klE9Xgt0VhiaixjcmpUvU0wtA/aA2BE=;
        b=gl/BwKPJM5xOREEfNKIcF5gpfOnvWc52gh22OJRGHL9qXk9pU5H6+k+r4HFFSuNXZ2
         oy2CnbBjrsuzOQT8U8QpRaU0hzMidyoxvI2H6sFn2FWZeXMowPyb8DtokuKLBJ5O9VQu
         ZFQUgjO+sIGe2fjsgYOoB5plJed0JSAJ47RexQMH8edm0V2GP7r6mTlbD4XgqzHFJJ1n
         YkLXB/DW1C8h3V8InUc1wYmZ6R1KzHqkTT4gKwZFOANv4z3GrtQB0rOlr22u/4cZ9bar
         dn02CBC8rDVXskHUl9zO1rRz9/sFXDL79PCzfv2VoWByf8XkxcEiULjyz+Pb0Nh61Q9M
         VKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954620; x=1784559420;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zhGPgrCiAKM0klE9Xgt0VhiaixjcmpUvU0wtA/aA2BE=;
        b=blA0vaJ2sSr/1Pn0j+9bbW+4DNs6W4mpDJWvpEt+6hRs10oD675BQHSrMEGdjM+Sfc
         vGNSXJJfAHr1ML4t3U7XF79xlPgKU5m8M1SPEMyGPoEN6YMR+jZyrBOdOZTHpwxMnUoC
         Ce/uhjQr+vCQVz/URdNoEcfT+3xKqB4+UuBeBiJarlgDdkDzLCn82NNxhji9X/Yv8Il8
         Jsj8NuuofjNdefUUPi0SMwNJJDFmU4NWEC0thRbQtvnuH44HtB3fRn1Khw8xql6bFg97
         U4gYBddcuqQeHBMUMVM7+YZ7LlEK6QIpm5LtLrsczLBZIGAplz+AR0NDYNsyqVQrYNvp
         BBUQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYb26+kQADZXolruXzSbYuLItvRRpLAuKsZhrOcJfsZEfbCrxqBa9+UI3NdsUU5P/AkmeD0U5QHwdd@vger.kernel.org
X-Gm-Message-State: AOJu0YyaORBA0rtDMD5mPe274zpatgfw7s9/I43LjXH/1pDWqfRzupzk
	HRfmF5PeQ5nI7ZXA7XUsuBE8h7gALzJeRk+jL8ZUsNqg6niMFcT/37a/gGl0ZISMt0U=
X-Gm-Gg: AfdE7ckirMTZrwy+3L0Q8vPejqd6HdCt27OFdChGt4qntuzu3SKos6YqB1R0HaDeLHg
	6N6XUzXunyym4i03+EOf8E8wUG2q7VvS1N7uWOAHNjDoo+VmbAvPvOejv/ZYQ27470c/GXFXih3
	LGVMCwff65HOb4DBGNoA9xDiN6BLbly1nD7WpYp1ZoaxU5kPbRyWdoppxIbvVhYniDTlq8QzGcA
	yP45P/xq9du7pGyRjoKQ45NVS4hNdrhLZcIjckcnW8Yr2K7WH5CcR8wcgNQB+F9VHFqDydrUJA/
	0leLLdhs9qUF0tcu/1k0snaLLXMPapzYH8fB/atWifHOjNKlDNUQMbpvVbpiCLWhziJP2M1fzw8
	4LQmTQEVpJuNBT965yl2zdbpa1WXGc284xvmWsXMotkFRUnFdXpy23zSdSGj6CJ/HjfcQ4YiHUu
	WlcorgMZ8j/36wvPOrRKtPU+c+60aRAi3Cggc+DJpWQg9cNqQDeY+013rZscuBwW8=
X-Received: by 2002:a05:600c:8b32:b0:493:c566:7bd6 with SMTP id 5b1f17b1804b1-493f88db5a9mr98448365e9.18.1783954619544;
        Mon, 13 Jul 2026 07:56:59 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:6402:500:e91e:fe5e:857b:d0c? ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32b9f3sm1035545e9.13.2026.07.13.07.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 07:56:58 -0700 (PDT)
Message-ID: <7cd113ad-3673-4f2b-97f3-aa1df4259a53@tuxon.dev>
Date: Mon, 13 Jul 2026 17:56:56 +0300
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
 <f5b7441a-d72a-41c1-b67d-5225d8e9ced0@tuxon.dev>
 <TY3PR01MB113468890DC8B12E1E43A54A986FA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB113468890DC8B12E1E43A54A986FA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:biju.das.jz@bp.renesas.com,m:claudiu.beznea+renesas@tuxon.dev,m:geert+renesas@glider.be,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:wsa+renesas@sang-engineering.com,m:claudiu.beznea@tuxon.dev,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39990-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	FREEMAIL_TO(0.00)[bp.renesas.com,tuxon.dev,glider.be,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[claudiu.beznea@tuxon.dev,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DA2F74CC8E



On 7/13/26 16:56, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>> Sent: 13 July 2026 14:19
>> Subject: Re: [PATCH v4 4/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for selecting the I3C power
>> source
>>
>> Hi, Biju,
>>
>> On 7/12/26 17:55, Biju Das wrote:
>>> Hi Claudiu,
>>>
>>> Thanks for the patch.
>>>
>>>> -----Original Message-----
>>>> From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
>>>> Sent: 10 July 2026 12:37
>>>> Subject: [PATCH v4 4/5] pinctrl: renesas: rzg2l: Add RZ/G3S support
>>>> for selecting the I3C power source
>>>>
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V.
>>>> The pin controller provides a register to select between these two options.
>>>> Update the Renesas RZ/G2L pin controller driver to allow selecting the I3C power source on RZ/G3S SoC.
>>>>
>>>> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>>> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>> ---
>>>>
>>>> Changes in v4:
>>>> - none
>>>>
>>>> Changes in v3:
>>>> - collected tags
>>>>
>>>> Changes in v2:
>>>> - none
>>>>
>>>>    drivers/pinctrl/renesas/pinctrl-rzg2l.c | 73 +++++++++++++++++++++++--
>>>>    1 file changed, 68 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>>>> b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>>>> index b52a85066f63..9a0706fea220 100644
>>>> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>>>> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>>>> @@ -69,6 +69,7 @@
>>>>    #define PIN_CFG_PVDD1833_OTH_AWO_POC	BIT(19) /* known on RZ/G3L only */
>>>>    #define PIN_CFG_PVDD1833_OTH_ISO_POC	BIT(20) /* known on RZ/G3L only */
>>>>    #define PIN_CFG_WDTOVF_N_POC		BIT(21) /* known on RZ/G3L only */
>>>> +#define PIN_CFG_IO_VMC_I3C		BIT(22)
>>>>
>>>>    #define RZG2L_SINGLE_PIN		BIT_ULL(63)	/* Dedicated pin */
>>>>    #define RZG2L_VARIABLE_CFG		BIT_ULL(62)	/* Variable cfg for port pins */
>>>> @@ -186,6 +187,9 @@
>>>>    #define PVDD_3300		0	/* I/O domain voltage >= 3.3V */
>>>>    #define PVDD_MASK		0x3
>>>>
>>>> +#define PVDD_I3C_1200		1	/* I3C I/O domain voltage 1.2V */
>>>> +#define PVDD_I3C_1800		0	/* I3C I/O domain voltage 1.8V */
>>>> +
>>>>    #define PWPR_B0WI		BIT(7)	/* Bit Write Disable */
>>>>    #define PWPR_PFCWE		BIT(6)	/* PFC Register Write Enable */
>>>>    #define PWPR_REGWE_A		BIT(6)	/* PFC and PMC Register Write Enable on RZ/V2H(P) */
>>>> @@ -257,6 +261,7 @@ static const struct pin_config_item renesas_rzv2h_conf_items[] = {
>>>>     * @oen: OEN register offset
>>>>     * @qspi: QSPI register offset
>>>>     * @other_poc: OTHER_POC register offset
>>>> + * @i3c_set: I3C_SET register offset
>>>>     */
>>>>    struct rzg2l_register_offsets {
>>>>    	u16 pwpr;
>>>> @@ -265,6 +270,7 @@ struct rzg2l_register_offsets {
>>>>    	u16 oen;
>>>>    	u16 qspi;
>>>>    	u16 other_poc;
>>>> +	u16 i3c_set;
>>>
>>>
>>>>    };
>>>>
>>>>    /**
>>>> @@ -272,6 +278,7 @@ struct rzg2l_register_offsets {
>>>>     * @other_poc_pvdd1833_oth_awo_poc: PVDD1833_OTH_AWO_POC mask
>>>>     * @other_poc_pvdd1833_oth_iso_poc: PVDD1833_OTH_ISO_POC mask
>>>>     * @other_poc_wdtovf_n_poc: WDTOVF_N_POC mask
>>>> + * @i3c_set_poc: I3C_SET_POC mask
>>>>     */
>>>>    struct rzg2l_register_masks {
>>>>    	union {
>>>> @@ -281,6 +288,11 @@ struct rzg2l_register_masks {
>>>>    			u8 other_poc_pvdd1833_oth_iso_poc;
>>>>    			u8 other_poc_wdtovf_n_poc;
>>>>    		};
>>>> +
>>>> +		/* RZ/G3S masks */
>>>> +		struct {
>>>> +			u8 i3c_set_poc;
>>>
>>> How this POC is different from Ethernet, SDHI and XSPI POC?
>>
>> Different bit mask and offset for I3C SET_POC compared with ETH, SDHI, XSPI.
> 
> RZ/G3L has i3c_set_poc, which has same bitmask as other_poc_wdtovf_n_poc.
> Maybe create register specific masks??
> 
> struct other_poc and struct i3c_set instead of union. So that both RZ/G3L and
> RZ/G3S can share the same struct for i3c.

When RZ/G3L I3C POC support will be added the i3c_set_poc member of struct 
rzg2l_register_masks could be moved as common member:

Current code base allows for this extension. You can have:

struct rzg2l_register_masks {
+       /* Common masks. */
+       u8 i3c_set_poc;
         union {
                 /* RZ/G3L masks */
                 struct {
                         u8 other_poc_pvdd1833_oth_awo_poc;
                         u8 other_poc_pvdd1833_oth_iso_poc;
                         u8 other_poc_wdtovf_n_poc;
                 };
-               /* RZ/G3S masks */
-               struct {
-                       u8 i3c_set_poc;
-               };
         };
};

// ...

const struct rzg2l_hwcfg rzg3l_hwcfg = {
         // ...

         .masks = {
                 .other_poc_pvdd1833_oth_awo_poc = BIT(0),
                 .other_poc_pvdd1833_oth_iso_poc = BIT(1),
                 .other_poc_wdtovf_n_poc = BIT(2),
+               .i3c_set_poc = BIT(x),
         },

         // ...
};

The rest of configuration and initialization code remains the same.

Thank you,
Claudiu

