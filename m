Return-Path: <linux-gpio+bounces-6212-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EDC8BEB5E
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 20:16:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1EC49B2AB3F
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 18:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0530116D32D;
	Tue,  7 May 2024 18:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rAThU3xS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF4C73513
	for <linux-gpio@vger.kernel.org>; Tue,  7 May 2024 18:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715105689; cv=none; b=Nq/hP3mj01PiTAQH4Wjc+BXsCsQ2Jyfd7vF8YCagdl5Kvs8m4Ysx+zlGvKGK/J+yD/T/6SzLMcpBRIA1GMB/UEgse4/HOQvf19Wt17RTBSvMlLhzLM8ZPlqVyBq0hOBd01XeZAmnM9K0Z8ZtgXknI/E0ZhtgTmOTmy7Z2RkXj2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715105689; c=relaxed/simple;
	bh=9Ifwdzf+BLBCB/Pq8sUmd441Gn2ZPiWzxJzH0wqn3vo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Akiu27Tz5ycmyaKgOP6BLwKQTB0Rj32NgLBZ/9buZ/kU8IB/yArl1umcEhbdQxICPqeRhIc94KyQlibLYTU1EQkXCkbVfHWZ5hYEcnmGCb+2MT66z3yz8xHsZZkd24FtK+k2wNlmZxGmFpdeioXdZNmmMAYlKxtxhjKT/GYDLLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rAThU3xS; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a59a8f0d941so919580766b.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 May 2024 11:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715105686; x=1715710486; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MKG3vCPxMeIDWy7dMjQ27D54/PVeAXq1+pgcoFyh+N4=;
        b=rAThU3xSd+iCtd9LxSkd4tEC9ndGyggz8T1qpZOysZDCNBWwzyrNwpAzpK+RI3ytNE
         ZczhXmeNJit/k9vRX6n9fNGdoGJxC+yt3IfmJ/MJJIOaq672knn8p7nQyhI8Zk9nuFHM
         uHuoW725bt8/dWIWe05bY0EEQxcjQBVsGdZ6Hp8HEjo/XanhUX10xOpHbwENPZwTYM2d
         p2jIVV+n5p9fsTwnVN4HdbkjMEhIi+vx2uvQoQtEg+zH0MFLeVsen5GGr3kK6aBLGCJx
         1s03MiyFdKewu4FlNb+gfw6XOT14cLjHYsxA5QSJmASmGZKe/w1KUi5TWExYD1M9Xr0w
         p/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715105686; x=1715710486;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MKG3vCPxMeIDWy7dMjQ27D54/PVeAXq1+pgcoFyh+N4=;
        b=WaLAqPcsjSBGmZm9Df18KeOrmz2ueQANp06jc4b6pvTGGoY4T9d29VMu5uCtn45Hfj
         PdgTrgNj+kqpRx1k2cS/GyFvq0E4+f4jLiSKTgBf1gmfIeWhspZWnHvcS0rxiGlr193U
         IcjvaGPvZGL4tqz3j/IhOLAZPBotPg6PD3FAUyJFEZFZM9TCZEJ6y4pPf2Qf07jvacs6
         8vETBKkD76K5K1y/dwtLqWuOveZHGXnTSAEQwsoyFaaoC1sa8igUcptW4A3GWBBamS3P
         BDoadgYg9cEalQOldufz4j0dwM/3bHSpESgopf8XvOudYylE44TkAIKws33pdbOiluXK
         +pXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTzw5f6szcci2rcfDpVGAtTQDFjNNE++5yqimtl9fqoyv3YzgZM/+J+ZNw+Y/54/0+/+IzxMS6RrWWDsZ3KkR2oeDOqvBVevK/UQ==
X-Gm-Message-State: AOJu0YwZuhs1cuJaUNQCBkyqdR5TbhufSkvnXeYSYgyw/Y7HO4Gro6iH
	ei2OEequ6eCDOpsc53ITksFDxJLzjnob84ApPjBfDC5D5EQGE8xyAcZ2finTNvE=
X-Google-Smtp-Source: AGHT+IHukQGajVAIgfxT7c6EtSGBonSivjXFUtAQjqO9LdhBb9jC224vD7xHt8n4BbkDE9Tw0ZEQsw==
X-Received: by 2002:a17:906:4e81:b0:a59:a2f1:5a10 with SMTP id a640c23a62f3a-a59fb94bc41mr14398866b.6.1715105686570;
        Tue, 07 May 2024 11:14:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id wr5-20020a170907700500b00a59f3e926c8sm663606ejb.152.2024.05.07.11.14.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 11:14:46 -0700 (PDT)
Message-ID: <8d2ea17c-f91e-4e14-a239-e5e999f6ac50@linaro.org>
Date: Tue, 7 May 2024 20:14:43 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] regulator: add pm8008 pmic regulator driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Johan Hovold <johan@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Das Srinagesh <quic_gurus@quicinc.com>,
 Satya Priya <quic_c_skakit@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-13-johan+linaro@kernel.org>
 <Zjkq_nWyvc6bUtiu@surfacebook.localdomain>
 <ZjpMeVk_HiixZUEu@hovoldconsulting.com>
 <CAHp75VdUFMvkj-r76H7GFZdpcoh_nb8v6CBj4wBHztNhiaWULQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAHp75VdUFMvkj-r76H7GFZdpcoh_nb8v6CBj4wBHztNhiaWULQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/05/2024 19:22, Andy Shevchenko wrote:
> On Tue, May 7, 2024 at 6:44 PM Johan Hovold <johan@kernel.org> wrote:
>> On Mon, May 06, 2024 at 10:09:50PM +0300, Andy Shevchenko wrote:
>>> Mon, May 06, 2024 at 05:08:29PM +0200, Johan Hovold kirjoitti:
> 
> ...
> 
>>>> [ johan: rework probe to match new binding, amend commit message and
>>>>          Kconfig entry]
>>>
>>> Wouldn't be better on one line?
>>
>> Now you're really nit picking. ;) I think I prefer to stay within 72
>> columns.
> 
> Not really. The tag block is special and the format is rather one
> entry per line. This might break some scriptings.
> 
> ...

I think [] can be wrapped, I saw it at least many times and I use as well...

...

> ...
> 
>>>> +MODULE_ALIAS("platform:qcom-pm8008-regulator");
>>>
>>> Use ID table instead.
>>
>> No, the driver is not using an id-table for matching so the alias is
>> needed for module auto-loading.
> 
> Then create one. Added Krzysztof for that. (He is working on dropping
> MODULE_ALIAS() in cases like this one)

Yeah, please use ID table, since this is a driver (unless I missed
something). Module alias does not scale, leads to stale and duplicated
entries, so should not be used as substitute of ID table. Alias is
suitable for different cases.

Best regards,
Krzysztof


