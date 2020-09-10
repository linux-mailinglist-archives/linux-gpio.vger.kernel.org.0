Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E349264AB0
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Sep 2020 19:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbgIJRHr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Sep 2020 13:07:47 -0400
Received: from mail-ej1-f66.google.com ([209.85.218.66]:40527 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbgIJQyc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Sep 2020 12:54:32 -0400
Received: by mail-ej1-f66.google.com with SMTP id z22so9728574ejl.7;
        Thu, 10 Sep 2020 09:54:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=z+RRvOyKYsSB07pFbec6LrWNZNZGtC9Skn84W6Crqbc=;
        b=mFIRBviG67oPi7GvSQ7YoMkkKwQDBqGPStCwOgxWTo96mbmHDxixw8DSuAuu4tGF0f
         YRk0s/D8aUvDLD7s8GZsB97DJ9KFxdWV2GCpVkE0026Hplo/KyvZkvnguomhF6uZ8BRv
         +YxWpg85UQyCDieSLNNIt5UlfUAogNI4BXBTz+rQTyYbx6cnldg0F4S4ABZjXV3sANU9
         jPv54qXwUiLhR1u14lgW6apJ9AX0KUHlNL/jdiuh2mSS+OEpa3zLXnPYvH4tUay7VcBo
         LhkOgq/1sStz83zVtT3A5ahpJgtGD2gbPF7PbDS58BdbImACCS0gREdTrkRHw1eu2Aln
         n0NA==
X-Gm-Message-State: AOAM532hPN/V8y+ByBW1lmhbhDM49M81B9LgP9dJtfsHYFHOD8kt2xeV
        H5lPMAgBG4k1KJgqfEbC4lU=
X-Google-Smtp-Source: ABdhPJyj5xfspeBLG8ppW3CbSisewa6vNwOrvIyYECPfXCHzGxITo2vMAJd3CXmp+RnBY0Xa2JprUQ==
X-Received: by 2002:a17:906:cf9b:: with SMTP id um27mr9876859ejb.66.1599756856544;
        Thu, 10 Sep 2020 09:54:16 -0700 (PDT)
Received: from kozik-lap ([194.230.155.174])
        by smtp.googlemail.com with ESMTPSA id p20sm7917053eja.18.2020.09.10.09.54.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Sep 2020 09:54:15 -0700 (PDT)
Date:   Thu, 10 Sep 2020 18:54:12 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Stefan Agner <stefan@agner.ch>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH 1/6] dt-bindings: gpio: Convert bindings for NXP PCA953x
 family to dtschema
Message-ID: <20200910165412.GB11510@kozik-lap>
References: <20200829094024.31842-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200829094024.31842-1-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Aug 29, 2020 at 11:40:19AM +0200, Krzysztof Kozlowski wrote:
> Convert the NXP PCA953x family of GPIO expanders bindings to device tree
> schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/gpio/gpio-pca953x.txt |  90 ------------
>  .../bindings/gpio/gpio-pca95xx.yaml           | 138 ++++++++++++++++++
>  .../devicetree/bindings/trivial-devices.yaml  |   4 -
>  3 files changed, 138 insertions(+), 94 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
>

I will resend the dt-bindings replacing unevaluated ->
additionalProperties.

Best regards,
Krzysztof

