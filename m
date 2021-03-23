Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4CE6346D1F
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 23:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233872AbhCWWaG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 18:30:06 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:37838 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234071AbhCWW2N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Mar 2021 18:28:13 -0400
Received: by mail-io1-f51.google.com with SMTP id b10so19433483iot.4;
        Tue, 23 Mar 2021 15:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=AzkohYd3kUih3TZCVMouqfzpZTJsGSRhLg2MnFuqzvA=;
        b=NrE496Xwh0NWtE2ycOD7/je3GOt/DRavy0j8kQX3fd3SBCKSxZoJkEV5wKwnEO9W5/
         W0ToOOXxveKOQgFuRnNNOHvSfhaVfjxkbiOnOaSnCGb7DIc0Qxw9k4G1FSEKo74/QYM9
         +UoeF+zGQFDwDugoo503frOXK+1TiuZPa0UCGqfPBVu8WFeWPw5089hsfSiO8cSWzK8B
         YHvFydaMnBGiX1SonVoabP+E2Tsp/W0vMcpcMhgEhknqvvztIXEqCWRVPSKb2/725PS9
         WIenzZjHKMl8OqkDltk8XOcsToiBzE/oFPlDzNTfdyJ5Wqfi4q8rAoZmExo5/cbcGJX4
         YL0A==
X-Gm-Message-State: AOAM532Go1mb3VLu9jzf6GXU3OeRbXW93q5JsKr3OgwXWTdifzlN1QWK
        UrpGgPptJ7fCbbVyg8lX0A==
X-Google-Smtp-Source: ABdhPJwyGH1IunqWJwhmn4xqhhWQz6Ox0KmXdBd05TOTtd7URPPLd6f4EeJpzLcm5oq4o0HLn0I5/A==
X-Received: by 2002:a05:6602:2f0c:: with SMTP id q12mr254220iow.82.1616538493243;
        Tue, 23 Mar 2021 15:28:13 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id m5sm100739ilq.65.2021.03.23.15.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 15:28:11 -0700 (PDT)
Received: (nullmailer pid 1458916 invoked by uid 1000);
        Tue, 23 Mar 2021 22:28:08 -0000
Date:   Tue, 23 Mar 2021 16:28:08 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Michael Walle <michael@walle.cc>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH v8 21/22] dt-bindings: add BCM6318 GPIO sysctl binding
 documentation
Message-ID: <20210323222808.GA1458865@robh.at.kernel.org>
References: <20210317143803.26127-1-noltari@gmail.com>
 <20210317143803.26127-22-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210317143803.26127-22-noltari@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 17 Mar 2021 15:38:02 +0100, Álvaro Fernández Rojas wrote:
> Add binding documentation for the GPIO sysctl found in BCM6318 SoCs.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  v8: add changes suggested by Rob Herring
>  v7: add changes suggested by Rob Herring
> 
>  .../mfd/brcm,bcm6318-gpio-sysctl.yaml         | 177 ++++++++++++++++++
>  1 file changed, 177 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
