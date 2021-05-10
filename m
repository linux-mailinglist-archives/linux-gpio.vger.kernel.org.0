Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 339F7378F80
	for <lists+linux-gpio@lfdr.de>; Mon, 10 May 2021 15:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236986AbhEJNl6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 May 2021 09:41:58 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:44298 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238635AbhEJNEh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 May 2021 09:04:37 -0400
Received: from mail-qt1-f198.google.com ([209.85.160.198])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lg5ZB-0007DH-0P
        for linux-gpio@vger.kernel.org; Mon, 10 May 2021 13:03:21 +0000
Received: by mail-qt1-f198.google.com with SMTP id r20-20020ac85c940000b02901bac34fa2eeso10321700qta.11
        for <linux-gpio@vger.kernel.org>; Mon, 10 May 2021 06:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MbGqG1sl2bPlNa6+74LoXiACLGc6BiOtk88NxsSE+AY=;
        b=RoxRTBYr+e+JMfTauDH5R5sYyp+bEVfvFt/9BILt73x8xeo5KjLCbeqwRG+dRFyMME
         WSJCoputdJ6JihNTHkbp9uJOGjGe4nFWNfOL/d+l4QW3FWo3iGvmB9+krHZ6B2+sBPvQ
         VLngkOdbf8VJBFtg0sMCdj9Mikbu816BRVF56wRBKJS5RC9cf5umyyFurWmuJhIvNcrM
         wYIM5gxvNbLNB0/M91IKIq5mjVPapQi5Kh7b/4aA3zeRZ5tECS8k5LNC9h38u4VcMH7i
         makev00RfKDvPFPS0YHnx5/BSjtTEPvehpeBQWQYTImt4DAGiPgS8WCh4DyxGwynDwSc
         1T2w==
X-Gm-Message-State: AOAM531vGNywhsMiyUNltlk2/62Q2nbX4nudVKyXrRk1NWPhJq+c9TWO
        Qp88ZJMC8EM6qI4dzgeecBi1xq2C4PvLFcsdJQ6OK5pAcwfcjYKMVr2zop46rHOlhM62Tl5QCNh
        GuDz3HXM/mBl2UAFuU2hyVNaHjO/y/OsIHLycl9E=
X-Received: by 2002:a05:620a:15f7:: with SMTP id p23mr21786082qkm.178.1620651800142;
        Mon, 10 May 2021 06:03:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzd8s28LSxq8tUMy7z9+LnTPfJPs32ao6LYW4bs5JpkeVNJFE9Gh7LFTqRifB+Q6AdPYAjS0w==
X-Received: by 2002:a05:620a:15f7:: with SMTP id p23mr21786045qkm.178.1620651799761;
        Mon, 10 May 2021 06:03:19 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.49.1])
        by smtp.gmail.com with ESMTPSA id q13sm11608797qkj.43.2021.05.10.06.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 06:03:18 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add DT bindings for
 apple,pinctrl
To:     Mark Kettenis <kettenis@openbsd.org>, devicetree@vger.kernel.org
Cc:     Hector Martin <marcan@marcan.st>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210508142000.85116-1-kettenis@openbsd.org>
 <20210508142000.85116-2-kettenis@openbsd.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <3bad54b9-599a-91c6-48b8-dd1c494f61b5@canonical.com>
Date:   Mon, 10 May 2021 09:03:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210508142000.85116-2-kettenis@openbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 08/05/2021 10:19, Mark Kettenis wrote:
> The Apple GPIO controller is a simple combined pin and GPIO conroller
> present on Apple ARM SoC platforms, including various iPhone and iPad
> devices and the "Apple Silicon" Macs.
> 
> Signed-off-by: Mark Kettenis <kettenis@openbsd.org>
> ---
>  .../bindings/pinctrl/apple,pinctrl.yaml       | 103 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +
>  include/dt-bindings/pinctrl/apple.h           |  13 +++
>  3 files changed, 118 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/apple.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
> new file mode 100644
> index 000000000000..cc7805ca6ba1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple GPIO controller
> +
> +maintainers:
> +  - Mark Kettenis <kettenis@openbsd.org>
> +
> +description: |
> +  The Apple GPIO controller is a simple combined pin and GPIO conroller
> +  present on Apple ARM SoC platforms, including various iPhone and iPad
> +  devices and the "Apple Silicon" Macs.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: apple,t8103-pinctrl
> +      - const: apple,pinctrl

What is the point of having very generic final compatible in the binding
which does not relate to actual hardware?

Let's say next SoC will be
apple,x-abcd-foo-2323-whatever-nothing-in-common and you still have to
use generic "apple,pinctrl" even though HW is not at all compatible?
This looks like wildcard, not HW description.


Best regards,
Krzysztof
