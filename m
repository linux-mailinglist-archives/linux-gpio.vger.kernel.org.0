Return-Path: <linux-gpio+bounces-39888-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MGopOupVUmoUOgMAu9opvQ
	(envelope-from <linux-gpio+bounces-39888-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 16:40:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A49741CF8
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 16:40:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=MPtg9XWD;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39888-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39888-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2562B300E3DC
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 14:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC442D9484;
	Sat, 11 Jul 2026 14:40:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF192285066
	for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2026 14:40:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783780837; cv=none; b=seKv/lMJ4lCoUNXMvQdIA1BvmTQys0UJupPxgs5ByeIFP2FBu9+oR/wxlzJoR2oha5IUfowAZN6bRdiuEuR+CK7XY+BNw0ipFm9tavLjOjsevalcwL/aBZUsib44FrLD8lddtl8vHNdX9+pJdDcE+LQjNuFQyhoNqU2XRzG3vWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783780837; c=relaxed/simple;
	bh=9tEQngaiXFQ6p90XQLZu9+Hlb+ftUsJNMXOIDlcHt1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k6/bxiyZIGsupzLex/5p+pOXQFabNFpd3q9gHD5uLTplZTqTkgIWx2LPeVG+gmTViWzJ94/K5Nbs3vkORZA+TbQYFdII/XILNToc2AKz6hoXfVi7HHcExgdoYxZ1tvrOsrhw3CJ9+tPtoaeax13z41LCTdS3Ktjrsyd3tej0Fg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=MPtg9XWD; arc=none smtp.client-ip=209.85.167.181
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4a43c2a126fso58751b6e.3
        for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2026 07:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783780835; x=1784385635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1w9ieWr9XroIO1XxDfVO0TVOPppCJVnMpU4FYzzgrNE=;
        b=MPtg9XWDV0VpnvaPqQpCt8aW3ICQydJvTC5FuGx3Myn7HWv9DC8F4C0Vdfq85mRkiW
         CNmQCWqI6xw0x+8VvmJbCJcvwxu8DhPb5tj76Me3y2u/GCR23e1Nd9fAlwhbz/moMz/I
         H+h1mfk0KTieAQl+TSLOoZjajaDMoIhy0kLZsEaRp1Fi8AQoHXHcvFG8kAoCgWFaAPu5
         F3AFt81ANdpY6p5T5FP2QpTD6h5j+BbkwNMOvYYvf5/GN5Rjukk1XXJu0yxPo7WR1a4z
         a2q+HS74apXBF+mohkocSRmtgmCAeBDOcBMKKaCtNsVdg88TXEVxL+4prGYcDVQM7+Ul
         o4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783780835; x=1784385635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1w9ieWr9XroIO1XxDfVO0TVOPppCJVnMpU4FYzzgrNE=;
        b=o/GWcUnm2RW7IWf2I/J3UYwewPAuiNujiFeGpFHjaDi0f5bFrS0TB/AYv6rmK9J5yP
         FEXehmFKSmqoDCnnRQuLH9d3wejQdMAIQc63rs8iRsYHMYOa+2piKL2f4FfxZ/od5cSN
         FRAKNeQ8MLbw+26KaKBQQR6Zj3QSePfXU8tMm1WbRscvMebVLoBjRUDmQC8A/Z7XSl/2
         Qe6+tbWq1W+FzwwQm5wREdUdnqmt4KP4tpQa0BDbNUyBzFAAqRQsa/yq+Je3JRdjG/Dy
         WA6cPjVCUALyWwq+Fh/veNBeEYggMf/D3RXBH2U8znwj2Ie6qOzqVi90Mzpd2Ke0TB1T
         hqpQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Isj2xY9NLsILi1dxl/NN3yrj11kmMxjcasfIgMcw2jQVU5SfFW2mEjgJAaxMyuOdfFnZz0cSOk1J3@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmc4KLm2IK7qQG1kcpQcJB8CcMsJJZr3L7yp6pq3picHDWU9Gi
	WAgtq/a7v2FbPZ9jBaJEZ2G9m4vLYba6bpVqe3ux5GFOeoKBepcXrhdxK7qtrti925k=
X-Gm-Gg: AfdE7clvg5pfA1rQf4+YfgqXoz1ZVe53E7Jii7n9UWVxTba/pvRx3fYStIo7uEjrScp
	XOWEGR+M9YEDrwajaiTAhrFIow+xirYgAKTK/cpCSSiz5U8nzvDMYrsa1nSnewwHWO78K0SYdrM
	xaUyL+77I00t3wkZQnN1Zei+to9cUPu4G2ArcAbK4p+6wK4iGhXfePejhHqj6PLwGT5mld/ZwAm
	bj+6d0EVTLY29WW8g8ozsC7XAzBQGmPNDADFS76QZBzXIA61lDnkEIPk7Mx7eJnPQ0vsQK30UXq
	kI7WS/6OqEv2/6XWo64ClyLENtcNLeh6syozez/ZIWRRkwE0PVPrLEWrMxiGjdBRvQyiWb3SbVI
	wWJvaskn8ft+nkpGe6peH4oFaUobr0o+qZmi4qNalRt/EeCX+mqQrcmhTWglaXzMRh3rVRe2zgZ
	FVEk6wTjVFzSoeHoNAAKGdc8R+NKqvq7CBQzwLqD0CSf0wgm7TBDLt8x7l1lnqMyM=
X-Received: by 2002:a05:6808:178f:b0:495:da89:c578 with SMTP id 5614622812f47-4a42ace7138mr2433350b6e.9.1783780834868;
        Sat, 11 Jul 2026 07:40:34 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:a950:74e5:81f2:8c89? ([2600:8803:e7e4:500:a950:74e5:81f2:8c89])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1afbf92b1sm7672879b6e.10.2026.07.11.07.40.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jul 2026 07:40:33 -0700 (PDT)
Message-ID: <a96caaaf-5cac-4bc0-9e74-e48b6fe0afc1@baylibre.com>
Date: Sat, 11 Jul 2026 09:40:32 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: iio: adc: Add AD7768
To: Jonathan Cameron <jic23@kernel.org>
Cc: Janani Sunil <janani.sunil@analog.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux@analog.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, jananisunil.dev@gmail.com
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
 <20260709-ad7768-driver-v1-1-44e1194fd96a@analog.com>
 <36df7c4f-82ea-4ed5-a4f9-3a29c75dc99a@baylibre.com>
 <20260710013322.595f8ee4@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260710013322.595f8ee4@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39888-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:janani.sunil@analog.com,m:nuno.sa@analog.com,m:Michael.Hennerich@analog.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:olivier.moysan@foss.st.com,m:p.zabel@pengutronix.de,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jananisunil.dev@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:jananisunildev@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[analog.com,kernel.org,foss.st.com,pengutronix.de,lwn.net,linuxfoundation.org,vger.kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3A49741CF8

On 7/9/26 7:33 PM, Jonathan Cameron wrote:
>>> +  adi,common-mode-output:
>>> +    $ref: /schemas/types.yaml#/definitions/string
>>> +    enum:
>>> +      - avdd-avss-half
>>> +      - 1.65V
>>> +      - 2.5V
>>> +      - 2.14V
>>> +    description:
>>> +      Common mode voltage output selection.  
>>
>> Why not using standard regulator provider bindings for this?
> 
> Interesting question.  If that was done there would need to be
> a consumer which means explicit modelling of any analog circuit.
> We do that in a few cases but so far (and yup this is a driver thing
> in a dt-binding) I don't think we have any way to consumer data when
> a backend is involved.

There is also the regulator-always-on property, so strictly speaking,
a consumer is not required.

> 	
>>
>>> +
>>> +  adi,vcm-power-down:
>>> +    type: boolean
>>> +    description: Power down the common mode output buffer  
>>
>> Is the buffer separate from the output? In that case I would expect
>> buffer to be in the property name, otherwise this should just be
>> part of the enum options above (and the default one at that).
>>


