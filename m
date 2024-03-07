Return-Path: <linux-gpio+bounces-4196-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C86A6874AF5
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Mar 2024 10:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 783B62895EA
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Mar 2024 09:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94B0A83CB4;
	Thu,  7 Mar 2024 09:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lo2branN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0346E839FB
	for <linux-gpio@vger.kernel.org>; Thu,  7 Mar 2024 09:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709804173; cv=none; b=AMyI20/2eob265vABuF2TJv5Rd2DdhbpCz7dso8jGowADb1mNNjMag0d6RtAqK1CSX7bBkcJ3GP4zLw70oLPl7xoe5hWNgXMMZ8sw54XihpK9tIykZqyuZYGw7LaDakVE7LNlishx+I2dz4sY0g5KrjZiviw8NKySyPUTXLlaKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709804173; c=relaxed/simple;
	bh=Sv+hrVvMP8lrgliViobXyqjxjXXmu59FV2vWqkOA9YI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O5tsIrswFv4ePl1c8YK0kAeS13BNpcWXBvWfTbIJNYv4rEmPpPfs0EhiwGkqwc9U6l1GLHhO7oE1LlWJy3OWdz2hI1BANRSWFITHOkbpj4VA1DJseiWNTT1wTYLv/hibTF1NnviMYlRDliu6ep7dtyw0fTj9GaKUnuJfBS3IsFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lo2branN; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-563c595f968so861403a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 07 Mar 2024 01:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709804168; x=1710408968; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sv+hrVvMP8lrgliViobXyqjxjXXmu59FV2vWqkOA9YI=;
        b=lo2branNqgorUlfnruyEB5j5CE7hgaaxOzHKroMaZ25pmrp/UjqoMr3ssbu2I3/jFt
         WcKmP/iQ8YZiiN44h/N2/hPCjCpdmPRsrwtYjSQSGKhJ/jeHvic9B49k2BVbHuNskk8z
         R/JLUgyK4o2+LKnLO6ScEnu8r5JkET3dx1Zb1tNhJ976DQKF+kEE3rFTVsELuEK/i+SP
         crWxui3p5vrKLtU9jtrxBId6Cd2kmY0rSO5lCTrH7FoRJAq8xJB89Ipl1fbVaZLRIdf6
         qIOo9CsuOqCZHhgSuyfSn+lE2nCebzYSLgnHX9M7332RQJ/5ByxHwHnJIwvHZaBl38Lp
         0iwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709804168; x=1710408968;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sv+hrVvMP8lrgliViobXyqjxjXXmu59FV2vWqkOA9YI=;
        b=adrkMIzpQf1c+YKdLBuBkOn8m1wQABHKJy/GM4D96KvPrDoQxlu7Ngr6PjMeTbCPuf
         vssG1oS7Fqfi2tXVNtkGPtTXgHzumt3yloUUYLFIrxud6SsG6X1iwO6hLm9dUXgQjyK5
         3dIRA6hFRjwKifWgLuUecXTmlZsrJj7f++ahaI1ZmcT7+CaFjauW2G6LJNsi2kD86f8S
         Qv+IiGPxwz5wRyrvD78GXqjPFK5auQU1uo95udu295kI5Md6NICZjGJr1sCWPMuadD5m
         Zvhh9c5ea8uXkliUUrEAs878CCXMe3s1DYiYUenM7y6NpoH9LJvV2auNvpqNXtFkV9om
         mnRg==
X-Forwarded-Encrypted: i=1; AJvYcCXSEkF9bcdGPB+n8IULYNPzyyPLX78HuEUXFQTTXllHSjQ/6nE2azqRneIwEouYokr6qnswSAV6zzkJppVyaV+Ky7R/DHDDzD+SeA==
X-Gm-Message-State: AOJu0YzhSS4s5NwJ8jnEHf8qHztafMT/xnspJPqSrOuXZKd9gHglMld6
	pDX9rGp31IbsfbGL4uPZ9ivisEaiSRcaliTWSK3Y2Ds9xqIwBU/sNXU2w6PDu2E=
X-Google-Smtp-Source: AGHT+IHzujfZSL78Cu+wOI2BPQz4CPJTBG6VyJczb2gVf+PDEZiN/9ssmKT/dU6xj1pXirYhHe6kGQ==
X-Received: by 2002:a50:cbcd:0:b0:566:de7:ac4a with SMTP id l13-20020a50cbcd000000b005660de7ac4amr12116575edi.6.1709804168341;
        Thu, 07 Mar 2024 01:36:08 -0800 (PST)
Received: from [192.168.1.70] ([84.102.31.43])
        by smtp.gmail.com with ESMTPSA id c6-20020a056402100600b0056536eed484sm7883794edu.35.2024.03.07.01.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 01:36:08 -0800 (PST)
Message-ID: <fc178bde-f95d-4614-80b8-1cfd61431298@baylibre.com>
Date: Thu, 7 Mar 2024 10:36:05 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/14] pinctrl: pinctrl-tps6594: Add TPS65224 PMIC
 pinctrl and GPIO
Content-Language: en-US
To: Bhargav Raviprakash <bhargav.r@ltts.com>, linus.walleij@linaro.org
Cc: arnd@arndb.de, broonie@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org, kristo@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, lee@kernel.org, lgirdwood@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, m.nirmaladevi@ltts.com, nm@ti.com,
 robh+dt@kernel.org, vigneshr@ti.com
References: <CACRpkdZzTheR=+=in7RYTFM2dquEPmGDudB7n1zoiUU4B1UCVg@mail.gmail.com>
 <20240307091925.171679-1-bhargav.r@ltts.com>
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <20240307091925.171679-1-bhargav.r@ltts.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/7/24 10:19, Bhargav Raviprakash wrote:
> Hi,
>
> On Thu, 29 Feb 2024 14:24:16 +0100, Linus Walleij wrote:
>> On Fri, Feb 23, 2024 at 10:37 AM Bhargav Raviprakash <bhargav.r@ltts.com> wrote:
>>
>>> From: Nirmala Devi Mal Nadar <m.nirmaladevi@ltts.com>
>>>
>>> Add support for TPS65224 pinctrl and GPIOs to TPS6594 driver as they
>>> have significant functional overlap.
>>> TPS65224 PMIC has 6 GPIOS which can be configured as GPIO or other
>>> dedicated device functions.
>>>
>>> Signed-off-by: Nirmala Devi Mal Nadar <m.nirmaladevi@ltts.com>
>>> Signed-off-by: Bhargav Raviprakash <bhargav.r@ltts.com>
>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>>
>> Is this something I can just merge to the pin control tree, or does it
>> need to be applied in lockstep with the other patches?
>>
>> Yours,
>> Linus Walleij
> These patches need NOT be applied in lockstep with other patches.
>
> Regards,
> Bhargav

Only MFD patches will need to be applied before.

Julien


