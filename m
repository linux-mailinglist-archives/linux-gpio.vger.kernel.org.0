Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7AC3B92C0
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jul 2021 16:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233426AbhGAOGW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jul 2021 10:06:22 -0400
Received: from mail-io1-f54.google.com ([209.85.166.54]:37788 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233309AbhGAOGW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jul 2021 10:06:22 -0400
Received: by mail-io1-f54.google.com with SMTP id b15so7642954iow.4;
        Thu, 01 Jul 2021 07:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=1KEpUUn5ssXosCMNXJTQraquls1BU59xvOvU5XZ7ts8=;
        b=JifJwUgJNJHvF85eZvzbHH4ZSNn9Qtf2jk+G5y7AeJcaRNKoI9AAMxiWqYOPRkARJB
         zD0JKr4sNiBmxYnbnCRCfgc2zixPofWYyfPj8QMnB9Hjwkz1LGtmHde0VZMDJY/OIuhh
         U7g+jRh1vs+fIx2jemAL0+eTqRSN8OV8uDxU3XjFqlclqLg8aVRBm1MsG27/Nj4wn8yS
         1ZubHc5pwm5GnLcnzChyem3H3I+lPyaashUqTX3ehWC3hre67Fwt6/rJDqU37Vr16Qjx
         kZpC1wTJMA12CXlnd4h7AP+SzbAp43yiI0VijrWXXH/bN5pFXtwr3BRFhM5EJ0zcVZeW
         0w0A==
X-Gm-Message-State: AOAM53335YAU4wyZNf64lRdJnF06Z1paQskPQLcVf095+Ps9YJ03z/k7
        mZO2W1GofNJfAMc72vvV3g==
X-Google-Smtp-Source: ABdhPJy63M0bJsbg79biPVUzG7ZQw8xpN1tjyx8H3FpitBkJqnFnUkZM/bc9QfLhYqRA9EQzWvJ5hA==
X-Received: by 2002:a6b:c40d:: with SMTP id y13mr12728560ioa.78.1625148231075;
        Thu, 01 Jul 2021 07:03:51 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id a10sm10053911ioo.9.2021.07.01.07.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 07:03:49 -0700 (PDT)
Received: (nullmailer pid 2278696 invoked by uid 1000);
        Thu, 01 Jul 2021 14:02:43 -0000
From:   Rob Herring <robh@kernel.org>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, linus.walleij@linaro.org,
        thierry.reding@gmail.com, bgolaszewski@baylibre.com,
        linux-doc@vger.kernel.org, warthog618@gmail.com,
        jonathanh@nvidia.com
In-Reply-To: <20210625235532.19575-5-dipenp@nvidia.com>
References: <20210625235532.19575-1-dipenp@nvidia.com> <20210625235532.19575-5-dipenp@nvidia.com>
Subject: Re: [RFC 04/11] dt-bindings: Add HTE bindings
Date:   Thu, 01 Jul 2021 08:02:43 -0600
Message-Id: <1625148163.519744.2278695.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 25 Jun 2021 16:55:25 -0700, Dipen Patel wrote:
> Introduces HTE devicetree binding details for the HTE subsystem. It
> includes examples for the consumers, binding details for the providers
> and specific binding details for the Tegra194 based HTE providers.
> 
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> ---
>  .../devicetree/bindings/hte/hte-consumer.yaml | 47 +++++++++++
>  .../devicetree/bindings/hte/hte.yaml          | 34 ++++++++
>  .../bindings/hte/nvidia,tegra194-hte.yaml     | 83 +++++++++++++++++++
>  3 files changed, 164 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hte/hte-consumer.yaml
>  create mode 100644 Documentation/devicetree/bindings/hte/hte.yaml
>  create mode 100644 Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml:40:4: [warning] wrong indentation: expected 4 but found 3 (indentation)
./Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml:41:5: [warning] wrong indentation: expected 5 but found 4 (indentation)
./Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml:45:5: [warning] wrong indentation: expected 5 but found 4 (indentation)
./Documentation/devicetree/bindings/hte/hte.yaml:34:7: [error] no new line character at the end of file (new-line-at-end-of-file)

dtschema/dtc warnings/errors:
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1497480

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

