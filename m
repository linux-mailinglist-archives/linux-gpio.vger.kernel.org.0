Return-Path: <linux-gpio+bounces-24841-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9600AB327BF
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Aug 2025 10:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A012AE2899
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Aug 2025 08:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C6B235BE2;
	Sat, 23 Aug 2025 08:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XWAFgJd9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890F1238C3A
	for <linux-gpio@vger.kernel.org>; Sat, 23 Aug 2025 08:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755939504; cv=none; b=R27Inyb7uxjn8snPghy59eBKL27Lj0jWdalTbmZO5IFssZ38uhh23lK1MnVLEF2sA3Jd5xbSI45XcwDkFhxg3OV8HS9VHAXz+w8C2m5IkKrQ6wQ4kisUUOWDJvWHxf0hqAzZMjJh0yCwLEhrJqco3CA4D+ITOgDsIn98UXrSvxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755939504; c=relaxed/simple;
	bh=PObtwKdfbFpwMmLEdwJTBTTUkfPM03mvQi5/aXjANRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QN8wCe0U6WlqLmxCqpO2fQmyOOdjkyEzBjyX7D/mYJVK3iIgZDwcV5jZscVxa40MCTxcrsBHdb6W9pDGPXe+Bw3fBcaChQiZy6QbeUmxi1HvK+eKL9Y3UtOyp1mJoh4vf2sXMwTmAc50gmCa8yUlptnColxfjr2E1kw6XcR7Oxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XWAFgJd9; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afcb7322aa0so39295966b.0
        for <linux-gpio@vger.kernel.org>; Sat, 23 Aug 2025 01:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755939501; x=1756544301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ePE9Dw20L6SlufcmjpXW4urwfW8Opv/KYmQhGsNogQA=;
        b=XWAFgJd9pVVuJTkbiZAXV0gvCwONyzmLOjtwMUh10PK5jpWRKnnq6Ho9NmeP6lqcEa
         FD3yRo0Dx4tOj+pZzlCcY/i7rm231bKyxRwzDakj5HOK9tvnplOuB/GiJXVaHONT5C2s
         eztVLtQ8CnSaWf03c7VVMmQ5470LyKb+U9d2QyxfeAyUVaMfkjUY42LHz7+cahJRuTyA
         sZyTnejVtCsgvMFJXCy3myNqoit94m8nKRg0K04p1uexz0+M8kMc7vEZWOcSMAuUDndc
         Pz7JwmxYS2KWet9MqY8/4ViKIMHgVmAOdNCDqPpXilPRdoZeLqQB2UWHI2EFvNxECjW9
         4KoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755939501; x=1756544301;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePE9Dw20L6SlufcmjpXW4urwfW8Opv/KYmQhGsNogQA=;
        b=n+Ug0RzB7qKHQsJ9uR0JRmav7Mz2V/wUc4X3h2A+kbTbe/2vlmjtrcWia/h46c15l1
         ofUveLDXk5pnzyVjW2/D5S9b3TdNfvIEkNpwHwPBVuZ5KtxIAAgSbrHP3D6MwKby+0h8
         FW0uCRRs20mh4cm1Na67J+O2tpzlZq/QZia40RHhebCNLaTSW07QgWjKeBy0rATZtZwl
         80nTCkvaWb0VJd7a+skAuiWbYq/zcWNr8c3vRJxzI2j+OghzgXvOqE+sf4u4L8RkK9hz
         OTs0LMHxRt88BeozWY4mIZ6JEs8c2Kq5xjbNRdojTPIUeqK+Rw25mZkjUyqiqfqLv62I
         69gQ==
X-Forwarded-Encrypted: i=1; AJvYcCUArZoMnigE9s8VnlI89jkAotT8hz8+mwiqV7LaqEAjdaAcUWGOphCbMg+ewSZLHpjBzMa7VwJZAYQ4@vger.kernel.org
X-Gm-Message-State: AOJu0YwpDQrS3WgsE6IWL+ojbG51+7tuYhCFwDdQHgPS8fRZdmqlYAQp
	nnsL+PUQPOvIN5StifSILjwmUS+h8OBROnl6uFaEgmFvRIGbCSETRhEoWGQo+keEZHY=
X-Gm-Gg: ASbGnculYVDuncOfo7/2iE6FPZxGZjQW/IbW8drRqSa9nB48hmZfQnbhEyyekScarWF
	zbMBDoCNm84bOuiX1n/PCIihB+hAFt0XP8Do/e/qYw3Vre+TUNsBf9TzZm+wb57lAY6xLb5N2mA
	cXRk59qbtoRaxeZf+8gI5tB8P1CglVEnAUDcvogC5CumSfv8vMnpJBTvl/K51kyEtkHJ4yLC2zc
	v1va+z4X/We/e154NHLkiHeRpzjLeQLfie/O6hJxSAKizSvzdiZxy6NokW62oj5YOy6hct6Ysp8
	rZKh+WTBEY5NM5LHqrFrgmxOLUzQa1YyT5Y6eUoprbtTaaLwo3qqk+CK7Xuu8cUXPIouTkBMJ8U
	v8WTbCErvUaG5CVvvVDXS/PrB0VJbD9vj+1+lTaQb/ec=
X-Google-Smtp-Source: AGHT+IE5Kj/tNqfuyToKzvzvaC9n0CcN3DlFEwwJPvxFSpgq3gCwweIjYQFV2Y8GFhKp2y+Z1KhycA==
X-Received: by 2002:a05:6402:42c7:b0:617:d608:86e0 with SMTP id 4fb4d7f45d1cf-61c1b217ddemr2487383a12.0.1755939500828;
        Sat, 23 Aug 2025 01:58:20 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c3119ffdfsm1245064a12.9.2025.08.23.01.58.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Aug 2025 01:58:20 -0700 (PDT)
Message-ID: <99f27c6c-50d9-4290-9a78-c3461a136798@linaro.org>
Date: Sat, 23 Aug 2025 10:58:17 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: mfd: Move embedded controllers to own
 directory
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, Tim Harvey <tharvey@gateworks.com>,
 Michael Walle <mwalle@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jean Delvare <jdelvare@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>, Lee Jones <lee@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, devicetree@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-sound@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Mathew McBride <matt@traverse.com.au>
References: <20250822075712.27314-2-krzysztof.kozlowski@linaro.org>
 <20250822204027.GA319356-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250822204027.GA319356-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/08/2025 22:40, Rob Herring wrote:
>> ---
>>  .../bindings/{mfd => embedded-controller}/google,cros-ec.yaml | 2 +-
>>  .../gateworks-gsc.yaml => embedded-controller/gw,gsc.yaml}    | 2 +-
>>  .../{mfd => embedded-controller}/kontron,sl28cpld.yaml        | 2 +-
>>  .../devicetree/bindings/gpio/kontron,sl28cpld-gpio.yaml       | 2 +-
>>  .../devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml     | 2 +-
>>  .../bindings/interrupt-controller/kontron,sl28cpld-intc.yaml  | 2 +-
>>  Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml | 2 +-
>>  .../devicetree/bindings/pwm/kontron,sl28cpld-pwm.yaml         | 2 +-
>>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml     | 4 ++--
>>  .../devicetree/bindings/sound/google,cros-ec-codec.yaml       | 2 +-
>>  .../devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml    | 2 +-
>>  MAINTAINERS                                                   | 4 ++--
>>  12 files changed, 14 insertions(+), 14 deletions(-)
>>  rename Documentation/devicetree/bindings/{mfd => embedded-controller}/google,cros-ec.yaml (99%)
>>  rename Documentation/devicetree/bindings/{mfd/gateworks-gsc.yaml => embedded-controller/gw,gsc.yaml} (98%)
>>  rename Documentation/devicetree/bindings/{mfd => embedded-controller}/kontron,sl28cpld.yaml (97%)
> 
> Who's the maintainer for the 'embedded-controller' directory? Fine if 
> me, just need to know.

It does not have corresponding driver subsystem, then I guess you.
Placing above bindings, whose drivers are  MFD, in the MFD subdirectory
made it obvious. Now it will be a bit less obvious, but that's the
drawback of organizing bindings per hardware, not per Linux subsystem.

> 
> Other candidates:
> Documentation/devicetree/bindings/platform/*
> Documentation/devicetree/bindings/misc/olpc,xo1.75-ec.yaml
> Documentation/devicetree/bindings/misc/ge-achc.yaml ?

Indeed, I'll move these as well.


Best regards,
Krzysztof

