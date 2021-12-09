Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA56146F772
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 00:30:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234396AbhLIXeB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Dec 2021 18:34:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233065AbhLIXeB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Dec 2021 18:34:01 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2EFCC0617A2
        for <linux-gpio@vger.kernel.org>; Thu,  9 Dec 2021 15:30:26 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso7953333otj.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 Dec 2021 15:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FepkuaMI2E0UPC3u5jnuq0Z4zznACFIsmRE29I20zT4=;
        b=vA+YadHRzPiZ920qQWf6itnhO6cSlzRKGuvpku8VZtT0Uqiz+NwyEt4u1SNE8hc5Gd
         3fiOKtPTqIImMKKkKPlIFip3/X4egE1tGJeZoJ67NcKvNMeeSGF9du3e7p3Xec16v58R
         s2GL9rbaQTK18Xzy4IVsoqNNwxN5vshCpTT5Lzp+BeL3lnsJLo6YB7rExN13MZsG7/CQ
         W4UVAda0tc0DjmKQcJTcVVKRGspWmgL9hLwh9q6vO1pvXvtV8GI8SA3rhzN1P9Rw5zZY
         31eU62nQV2RnUvTT6cH3UjtGs9kB497qC1Q6CJw0PMTTCUfLj4RYtCGSkn33rxBGS3I1
         l3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FepkuaMI2E0UPC3u5jnuq0Z4zznACFIsmRE29I20zT4=;
        b=phspUnxutWvaijnd+JwgeUwggKwBSTkVyxTA3SAlto1EpYg2/jgmS5Fo9p6dtm+vw4
         4t+MEllp+OvCngLaoBcFjlo18lkrU2jMGJ4afdQYQowzLQ4Hayw5JhEaot7+mUUBJwvn
         42S/M18+INwfEzE/FuOU1PXeBOj5Nl4yx9Ir+WaSnh+BPgZTuAcaizlmrAblkQ4p/7CD
         D3h2XNLA+8iv2b0Uiejk7IHZq41HaS30z3jIud77N0x7qYlpjI5C4GGhhoE02N8YEy0D
         J56o3UKBoUiZLsH9ri/jQFZaLgtLSGgqrppv4yG0MfyHYGfIo33MG32rW24Zu49DKW7w
         0RbQ==
X-Gm-Message-State: AOAM5309rByvkFLPiKpkIR+XYNuIL9jQj4OVKpEQ2fzxicB41rDbTlD/
        ZsGtkkEE7xJD08XdZfsdOxQtZ+9EFeWMpHo9HxOJDw==
X-Google-Smtp-Source: ABdhPJzSklHE2PEylrgMnWrf65WLYMvroWGO2JaHYj9wv9SCkHxG+y59KeRCyqzJbEZxRSlsELsaDB97OqqkhPeFuuI=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr8513360otg.179.1639092625198;
 Thu, 09 Dec 2021 15:30:25 -0800 (PST)
MIME-Version: 1.0
References: <1638850665-9474-1-git-send-email-wellslutw@gmail.com> <1638850665-9474-2-git-send-email-wellslutw@gmail.com>
In-Reply-To: <1638850665-9474-2-git-send-email-wellslutw@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 10 Dec 2021 00:30:13 +0100
Message-ID: <CACRpkdaBV81OCwHuFCObwv_t55B9ANHaF5jEc=oorZdjpey0Ug@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: Add dt-bindings for Sunplus SP7021
To:     Wells Lu <wellslutw@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, wells.lu@sunplus.com,
        dvorkin@tibbo.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 7, 2021 at 5:17 AM Wells Lu <wellslutw@gmail.com> wrote:

> Add dt-bindings header files and documentation for Sunplus SP7021 SoC.
>
> Signed-off-by: Wells Lu <wellslutw@gmail.com>

> +patternProperties:
> +  '-pins$':
> +    if:
> +      type: object
> +    then:
> +      description: |
> +        A pinctrl node should contain at least one subnodes representing the
> +        pins or function-pins group available on the machine. Each subnode
> +        will list the pins it needs, and how they should be configured.
> +
> +        Pinctrl node's client devices use subnodes for desired pin
> +        configuration. Client device subnodes use below standard properties.

I don't understand this if type object stuff here, Rob, help...

> +      properties:
> +        pins:
> +          description: |
> +            Define pins which are used by pinctrl node's client device.
(...)
> +          $ref: /schemas/types.yaml#/definitions/uint32-array

Why can this not $ref the standard binings in
Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml

See for example
Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
for a nice example of how to use this.

Yours,
Linus Walleij
