Return-Path: <linux-gpio+bounces-548-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EE17FB2BD
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 08:29:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94C5C281E46
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 07:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34D3134D6;
	Tue, 28 Nov 2023 07:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ftkc4t92"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20047182
	for <linux-gpio@vger.kernel.org>; Mon, 27 Nov 2023 23:29:34 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-54bb9024378so64916a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Nov 2023 23:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701156572; x=1701761372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8HhAg3HGx+dCrzaldRtNF0z0A4KKZODNNDBUQrJGE4c=;
        b=Ftkc4t92tNZTjjfCaIPy6RUhSL7NDdPSJrrcgA7rPQka9gqNbGJVO0jdUNENbl3JkX
         l2HzCA5Bib0evleN68sijzITuEUU3sYMjekU5oXN/AJpPKQh64k4kCwnecOlmk6Fl3PX
         sIBgYQnvKexmET9f55zDZyewItOo+tSjThZ91LKiKMuF3gu3wRhLl08ImxDPyl27SZnw
         GdFpSaocp4HJssYENRtpYha5iU1xpNDcQiQYtdQ/vFrxDppB6YV81FM3izRNhm2pjEdt
         1dYHQbGNgJS3XIHVNdsWAwjwZndEfnb61vXpGaMj3S5ihUE8iXU58g5Ot2oEyucMwNFM
         FaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701156572; x=1701761372;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8HhAg3HGx+dCrzaldRtNF0z0A4KKZODNNDBUQrJGE4c=;
        b=Uh4MMhBQZCBeXiEUhRfC5U049j/BSmWd7I6V6cNGMz4bb/2p1rT8bQBx4H2XVaFERJ
         8NigySgWIuWZRoL6jj6aecAVx7gTwYkxGWsyDXeMHqtfQypq9TTDW5qalAg4DxXb3b16
         hEM1XZ+AUxOXl8fJv4RXPgsk4YkIHoqlCjxm3uXEW4Qsgzg+/DQfOoGpxTqo1GaQhZIa
         HqqN4vQ5f9nitAOpr+GecwHFTKdXlL8MyWwMklytLeZlaG9xJp413OrLdg35L863hCLC
         vIghFMfKj5rT9fff6JZ5ti25+Ycf0cqwqnO6tWKLoDxAfdWvuwdq4oj9iP42Nf+YSnOR
         vi3A==
X-Gm-Message-State: AOJu0Ywh2IImkKp4Wvb/IO0/qdBXU2oupqy7KOwCVw2/xUrWybN97Qhk
	uCKnLEfNLAwnFo/YGZs4YWJFRg==
X-Google-Smtp-Source: AGHT+IHDTd+j++C59qIQGKF0egEm45p5caSoaodLsq6Y3IPB41RPjR1l++I/9svYgkhuhB3ehzoAXw==
X-Received: by 2002:a50:8d03:0:b0:548:656c:5371 with SMTP id s3-20020a508d03000000b00548656c5371mr12508831eds.16.1701156572583;
        Mon, 27 Nov 2023 23:29:32 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id b9-20020a056402350900b0054b7e312b97sm1432048edd.38.2023.11.27.23.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 23:29:32 -0800 (PST)
Message-ID: <1fd55b36-0837-4bf7-9fde-e573d6cb214a@linaro.org>
Date: Tue, 28 Nov 2023 08:29:30 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: samsung: add irq_set_affinity() for non wake
 up external gpio interrupt
Content-Language: en-US
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: tomasz.figa@gmail.com, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
 linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, semen.protsenko@linaro.org
References: <CGME20231126091120epcas2p4a1320e3b0f9be8f8a0f575a322981d38@epcas2p4.samsung.com>
 <20231126094618.2545116-1-youngmin.nam@samsung.com>
 <bb738a6b-815d-4fad-b73f-559f1ba8cd68@linaro.org> <ZWU75VtJ/mXpMyQr@perf>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZWU75VtJ/mXpMyQr@perf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/11/2023 02:01, Youngmin Nam wrote:
> On Mon, Nov 27, 2023 at 10:54:56AM +0100, Krzysztof Kozlowski wrote:
>> On 26/11/2023 10:46, Youngmin Nam wrote:
>>> To support affinity setting for non wake up external gpio interrupt,
>>> add irq_set_affinity callback using irq number from pinctrl driver data.
>>>
>>> Before this patch, changing the irq affinity of gpio interrupt is not possible:
>>>
>>>     # cat /proc/irq/418/smp_affinity
>>>     3ff
>>>     # echo 00f > /proc/irq/418/smp_affinity
>>
>> Does this command succeed on your board?
>>
> Yes.

Hm, fails all the time one mine.

> 
>>>     # cat /proc/irq/418/smp_affinity
>>>     3ff
>>>     # cat /proc/interrupts
>>>                CPU0       CPU1       CPU2       CPU3    ...
>>>     418:       3631          0          0          0    ...
>>>
>>> With this patch applied, it's possible to change irq affinity of gpio interrupt:
>>
>> ...
>>
>> On which board did you test it?
>>
>>
> I tested on S5E9945 ERD(Exynos Reference Development) board.

There is no such board upstream. How can we reproduce this issue? I am
afraid we cannot test neither the bug nor the fix.

> 
>>> +	if (parent)
>>> +		return parent->chip->irq_set_affinity(parent, dest, force);
>>> +
>>
>> I think there is a  helper for it: irq_chip_set_affinity_parent().
>>
>>
> 
> The irq_chip_set_affinity_parent() requires parent_data of irq_data.

Hm, so now I wonder why do we not have parent_data...

> But when I tested as below, exynos's irqd->parent_data was null.
> So we should use irqchip's affinity function instead of the helper function.
> 



Best regards,
Krzysztof


