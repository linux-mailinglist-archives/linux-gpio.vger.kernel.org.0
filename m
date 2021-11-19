Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD37456A2D
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Nov 2021 07:25:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbhKSG2B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Nov 2021 01:28:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbhKSG2A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Nov 2021 01:28:00 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58F14C061574;
        Thu, 18 Nov 2021 22:24:59 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id k37so38657265lfv.3;
        Thu, 18 Nov 2021 22:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=YLDD0XXsK6C7jqrtFHU8O5g+iM4eBUzH3ep6c75/yJg=;
        b=Ty0seJOK9kirb9kCapP+nZ18SRE6vmjp5ldS/55jRibp3JGlezyoLe8AEE8JgK6o8M
         WViow/aYgesS9RBMljZAlCjlOJTS7k8xm6csprT6vyQZXvZef+j57jen+Wmwl8noQti9
         ipnxJlm3CFNzuPc551UU2K+EnT2QlNiitQS5oDuQiErAgvIZtPsBAZv2NrnngNrGB7Pl
         EPUqfRaXB5V/ry0qbjLntJTNFJiKVQzHZy9goRho8+s7ukFYDgHCcGqw3JQHOwViZRTQ
         GUE3SjyDWhw4XzigGPY/p5YbL9Qx72170EPL3Z44PTqp9fBmM1sX36tmqBwXUlBHXQ2U
         fkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YLDD0XXsK6C7jqrtFHU8O5g+iM4eBUzH3ep6c75/yJg=;
        b=xHS7ntzS7Z2d5Ex150eb3bv97ldov5OH71ZecFPyqpgu265sLeBVuZ/f/1OuMxy372
         gRIJFqC7VVrFczsTU+vSPEXX2jvf+uMGX2RR8ao+3IVOVBOHgIlevM3I8gZKM5upcPbX
         x8wl7rCjQa7R0fzWq0eRGFtXh5BZScrSmDmDmgnEG0D3bMFv3j2XI6Eqg2WykeAQdfHK
         hrHsig1hYSYIpLDMCub5YjNyz9j61lLxBPrA/3SXQgqmbBR8Zwc4O3i2u70EXZBHpqWg
         0GsSo56lD3GcYa7jrV/VXG0dGM3DroBky3Z4BEmYxALX5tyIRtrCR3CYi3t8B/+qFRe8
         SZjg==
X-Gm-Message-State: AOAM533tCPKZwTcWD2NkZv0nfkXEkusezkRmTUW3dYOmfkCdGJzGwSM2
        NNwK8VHJM+2V3u2pjRaUHRU=
X-Google-Smtp-Source: ABdhPJxF7v1AuFcrUVIy3QBLwyL6NrWrgnEoIzjkegt8CSjWQ8/40kis0jG5hZ8IHKSx8sopq1NEfw==
X-Received: by 2002:a2e:7310:: with SMTP id o16mr23184632ljc.394.1637303097617;
        Thu, 18 Nov 2021 22:24:57 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id f14sm291375lfv.180.2021.11.18.22.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 22:24:57 -0800 (PST)
Message-ID: <81e80ebd-3ee7-a2f0-b93f-cc68839dd74e@gmail.com>
Date:   Fri, 19 Nov 2021 07:24:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:95.0) Gecko/20100101
 Thunderbird/95.0
Subject: Re: [PATCH 2/5] dt-bindings: pinctrl: brcm,ns-pinmux: extend example
To:     Rob Herring <robh@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>
References: <20211118132152.15722-1-zajec5@gmail.com>
 <20211118132152.15722-3-zajec5@gmail.com>
 <1637273394.255655.1841662.nullmailer@robh.at.kernel.org>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <1637273394.255655.1841662.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 18.11.2021 23:09, Rob Herring wrote:
> schemas/pinctrl/brcm,ns-pinmux.yaml: ignoring, error in schema:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml: 'additionalProperties' is a required property
> 	hint: A schema without a "$ref" to another schema must define all properties and use "additionalProperties"
> 	from schema $id: http://devicetree.org/meta-schemas/base.yaml#

I forgot to mention this patch is based on top of the
[PATCH 2/2] dt-bindings: pinctrl: use pinctrl.yaml
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20211110165720.30242-2-zajec5@gmail.com/
