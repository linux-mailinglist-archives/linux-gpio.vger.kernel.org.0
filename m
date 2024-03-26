Return-Path: <linux-gpio+bounces-4628-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5766B88BAFB
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Mar 2024 08:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B5F41C2FE42
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Mar 2024 07:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F374D12C819;
	Tue, 26 Mar 2024 07:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hw0W6ozW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F29071B4C
	for <linux-gpio@vger.kernel.org>; Tue, 26 Mar 2024 07:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711436992; cv=none; b=bShQvb9OPF4fB1ecZiTA7PYBnMp8cYRlixKmyd8POR2ZHgbnPMWTCv3sccuUUQalZ9P0FMH0xdPbTfOD5oGLKJ16n2oSbLr+zd7p85r7jN0nvVCIJMH71a+a2NXfNADytIGliFBWlaotAixQYDDERiB1sJ99cDVERF5tylvaXmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711436992; c=relaxed/simple;
	bh=g2+AF39CAd4oHhBts26Z5bZHPbqAxurIuEBzeiXs52Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ubhpzmZM+G0psMDuC4ebxO+XPFwIpUqR3ik5poFqEfG/olskuuzYi/Tq485LKHvYp2KsGf+6/a4lIRtEu7mQaXzoSnT2yfP5wBf5ziekGoIq2QKxosI6dFVapd6zk3InnJuGstrEJd92AwPkV7mcNeQn52xjRtjkrpDbQnnTHzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hw0W6ozW; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56c2787aff5so596434a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Mar 2024 00:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711436989; x=1712041789; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jkl0qyofTqqEdWRvpRAFACB5BTqxnIP6F+xsdrsHhvI=;
        b=hw0W6ozWb0z+TYAEeI7K6jG14xrm/jUW3REBsec3YEfuR4EBtDTHgoEz0OisuxYwmV
         vNsLEKOTXhNyz5r5WMSQ0dSnDVTEz9msMeOXCEaHia1gi0Cd1Q4Be7zgrEZX4Z4lgYty
         RU/TbFGqm2O7tqQi2zwaXBxqwv6YkVHKaWOSNUQpF69+7i+lObWx3t/yevANGP9XW3lZ
         tFdDL7F/hf26MTfab+HTk38r5n/Afgcy+tBfO/5aKnItv9odlecG5osRX9BlL9Dkns79
         LfdugUCSCTJkHnmY6z6szXV7cUtTl/Ul3VnEr611/VCHoTo5ZLJMwCJMlaUIavz7kdLi
         +YaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711436989; x=1712041789;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jkl0qyofTqqEdWRvpRAFACB5BTqxnIP6F+xsdrsHhvI=;
        b=oKCJcpWDiqomM+klUema16x2J75wymgwMqg4WogZoY9o/4SNM3YorSUuJkSgqcmud5
         Hcx6TxRRePHb/Mi/80gFd9RHyUZGar1D1ciisPJPvfEcn6M8Lxt5dQu8LJ/+6muBKJDK
         phTSSkKOxOGrfam77Pp9wnJz7RMoHvo4vYVwgY/ve+6lMUj0G1WrC8GmMLD1NOl0INJB
         DWfgY6euGeF1tbkUn4nsWwGbRkxM+Ys4oiovdF/JSnPIVHg5CcRN0IOGZP7lkCyadcGZ
         Lp81W0+PARhihvuPKGBdVknHBbOAaNJAOk04YmUfHvB0X8da3dheUianG0b9t3ZuW3mW
         6OnA==
X-Forwarded-Encrypted: i=1; AJvYcCVMEE711dXXWoGRTcx4Ywr1UbQUiwOUx/PBuhme9mP08wib8YeyyhonnItDO/qWIi7L66O+6Yw6Q6wCW1sdglnLB5/ij4TCiojoIQ==
X-Gm-Message-State: AOJu0YyyDrMyGQFwyoZpJgkpURpzMmi6Nz/Cqbp0fxMRchitZBHnUP37
	ocyOBky6SPh/lbBTLu9EwkbLNQDMxoZJsZwxCP/immaRzvNIJ98hUKlgFyQa7rI=
X-Google-Smtp-Source: AGHT+IGWmrzZ1EP5AVByJP3m5+LuywecgjzSYEz9ZtRWRqVXkHwPVoDiDEWJi1p4nqj/YVYUK5xxLQ==
X-Received: by 2002:a50:9988:0:b0:566:4a85:ceba with SMTP id m8-20020a509988000000b005664a85cebamr2363606edb.1.1711436989527;
        Tue, 26 Mar 2024 00:09:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id g17-20020a056402091100b0056c0cec810bsm2130837edz.85.2024.03.26.00.09.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 00:09:49 -0700 (PDT)
Message-ID: <8f4ef49a-74a1-4e05-a2fa-f6bc29e80c5c@linaro.org>
Date: Tue, 26 Mar 2024 08:09:46 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: arm: bcm: raspberrypi,bcm2835-firmware:
 Add gpio child node
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Eric Anholt <eric@anholt.net>,
 Stefan Wahren <wahrenst@gmx.net>
References: <20240326004902.17054-1-laurent.pinchart@ideasonboard.com>
 <20240326004902.17054-3-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240326004902.17054-3-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/03/2024 01:49, Laurent Pinchart wrote:
> Unlike the other child nodes of the raspberrypi,bcm2835-firmware device,
> the gpio child is documented in a legacy text-based binding in
> gpio/raspberrypi,firmware-gpio.txt. This causes DT validation failures:



> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        const: raspberrypi,firmware-gpio
> +
> +      gpio-controller: true
> +
> +      "#gpio-cells":
> +        const: 2
> +        description:
> +          The first cell is the pin number, and the second cell is used to
> +          specify the gpio polarity (GPIO_ACTIVE_HIGH or GPIO_ACTIVE_LOW).
> +
> +      gpio-line-names: true

You could provide here maxItems, if this is known, but it's fine as is
as well.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


