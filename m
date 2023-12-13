Return-Path: <linux-gpio+bounces-1342-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D46A9810A39
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 07:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7EF91C20A61
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 06:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7ABF9F7;
	Wed, 13 Dec 2023 06:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f9PwBLkO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AB89EB
	for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 22:23:20 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-33338c47134so5981384f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 22:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702448599; x=1703053399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OOeFpJK4OYoAw3qn3oCy1TCCDOQeXt6aQHprsTtnDUE=;
        b=f9PwBLkOm51cobyqkGF1oGiWRE0BJ0QUqduOv0HDezLOVAmCZ0aCiBnHtsrPGI7fH4
         zQbDex2aTijmFgR+tewBsPc6qZ4QOqhGbBNTehd7SFlOkOOJ/uswsi7tthpSp1LKHEkF
         NNQGeeQZkz5+9P68FX5u0E1jPPwwXPplsx0nVxmKm4E8a2KDTznvMIhJwdzNPy+wttlM
         7Brs+1LM6mqsiyYMysspGRzEEarWMfzhPPefte1EcMtOZJn38Q25J0hAwqFNayCzDAz/
         8B0BpNHlIXJqEvXeALa0C+krN24U7gdfRqS4mYU6aQWF/ddWORTEpBfy9ODYMH61j1Mk
         vZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702448599; x=1703053399;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OOeFpJK4OYoAw3qn3oCy1TCCDOQeXt6aQHprsTtnDUE=;
        b=jOftSyhWkdCL1tkxkR/QT8qVpgjnkKNaS8P2t5GwN5ORX2BXoXsI0q9FXRQgLfqWp3
         5JKQO+L0qv4yGfKT7Am0vwIfyB5sa6WiuPyKydvWUbDgyAR7DlutMMIivKXYlJF0+oVe
         SiAvwZUz1WnbAdfztwq5oNvsNJj/lgoQLrJAa3wVjYgnpJnZ7vYSo0Sc6jZp4Tn7lHbX
         T+D7Xf/Jqk0DJ9uy4+tZ3BBgSB8PqJEkxrNQrs61cx4fz0JKpQr9OQ0dGah3/NeI0e+k
         G54frqErSsxSLtow6I2qKaPdHOgdwOferYsrlg7QPhYOFQ+z+2Ysn4/5pK2KvSS8nH66
         lBQw==
X-Gm-Message-State: AOJu0YyaqPzWsQuolDApukwyk+Y7YRJjhB2phJ6Q4HkScqz5bg5yXSNy
	vcrp4t9Jn0VuT2qQaLrgaKgLVA==
X-Google-Smtp-Source: AGHT+IHizJKfXzdrkxg67JeIOicbOp8AjE+tlskqBNgEFMLN9azUW98KEjGCmuWVK9irIdOHQvedrQ==
X-Received: by 2002:a05:6000:b0f:b0:333:5eea:921d with SMTP id dj15-20020a0560000b0f00b003335eea921dmr3597691wrb.61.1702448598836;
        Tue, 12 Dec 2023 22:23:18 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id m1-20020a056000008100b00334b3208700sm12332952wrx.49.2023.12.12.22.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 22:23:18 -0800 (PST)
Message-ID: <3ccfae77-eaa3-4928-9ad6-c61c73d96bcb@linaro.org>
Date: Wed, 13 Dec 2023 07:23:16 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: nuvoton: Add NPCM BPC
Content-Language: en-US
To: Tomer Maimon <tmaimon77@gmail.com>, arnd@arndb.de, pmenzel@molgen.mpg.de,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 avifishman70@gmail.com, tali.perry1@gmail.com, joel@jms.id.au,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 j.neuschaefer@gmx.net
Cc: openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231212100703.3374555-1-tmaimon77@gmail.com>
 <20231212100703.3374555-2-tmaimon77@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231212100703.3374555-2-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/12/2023 11:07, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton BMC NPCM BIOS Post
> Code (BPC).
> 
> The NPCM BPC monitoring two configurable I/O addresses written by the
> host on the bus.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---

It's v2, so changelog?

>  .../soc/nuvoton/nuvoton,npcm-bpc.yaml         | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-bpc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-bpc.yaml b/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-bpc.yaml
> new file mode 100644
> index 000000000000..30033cdac8f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-bpc.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/nuvoton/nuvoton,npcm-bpc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton BMC NPCM BIOS Post Code (bpc) controller

s/bpc/BPC/

> +
> +maintainers:
> +  - Tomer Maimon <tmaimon77@gmail.com>
> +
> +description:
> +  Nuvoton BMC NPCM BIOS Post Code (BPC) monitoring two configurable I/O
> +  addresses written by the host on the bus, the capture data stored in
> +  128-word FIFO.
> +
> +  NPCM BPC supports capture double words, when using capture
> +  double word only I/O address 1 is monitored.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,npcm750-bpc
> +      - nuvoton,npcm845-bpc

Your device driver suggests these are compatible, so express it in the
bindings and modify driver respectively.

> +
> +  reg:
> +    maxItems: 1
> +


Best regards,
Krzysztof


