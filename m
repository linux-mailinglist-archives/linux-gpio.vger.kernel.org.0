Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3C2E346BE4
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 23:14:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233787AbhCWWNu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 18:13:50 -0400
Received: from mail-io1-f45.google.com ([209.85.166.45]:35801 "EHLO
        mail-io1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233659AbhCWWN2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Mar 2021 18:13:28 -0400
Received: by mail-io1-f45.google.com with SMTP id x17so8143413iog.2;
        Tue, 23 Mar 2021 15:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=lURkJQFF6a+Fl6KmVAwQaHv96A5GQ1e8JC4SF4cwCMo=;
        b=NWDTCVyjJlt4OshTeUGcpF2inaUfOnl6ab7YNTBdu/tD5sIxiSLzRTeJCIGd6Mq27o
         wh4LWD9UUXKele/BhcZH2VDlcWiIRQmNmkDimfiB3QHA2PLr7ccN1Eqsm7nQKEWdzpxb
         GRRHCyYk0xy1mqTpKmTMv+lMpFTZTFC9xJm8NQxigRembao8p56a3rHajaOrjBL+GXiz
         Pll6wfNm2JRmRKZ5PQAJfZIMYznRpGopZyQPAAXo3BADDFTjpBMp1wxgYw3j/4z1kN+E
         mAtbgmNJuYd56bIeJrgFqXodj4oF2x39idJH3ke7E6QEnnjM+Co0/wVTEwROd58pDrGU
         Wx6A==
X-Gm-Message-State: AOAM53295p+mM/pBEPs479gqVMJLvq1u9z1weQivSLcxSCwf+u2swI3x
        XWTcrRyfNLWkDSzEbJRZIQ==
X-Google-Smtp-Source: ABdhPJzi1phylGUUJ/v++6U8eYJrzSQpIPi/g9zQkseb5Ax9nxaFHpFeUKXNbaXb7sNYoEQhv+v0hg==
X-Received: by 2002:a6b:fd07:: with SMTP id c7mr213320ioi.198.1616537608204;
        Tue, 23 Mar 2021 15:13:28 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id 14sm88636ilt.54.2021.03.23.15.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 15:13:27 -0700 (PDT)
Received: (nullmailer pid 1434672 invoked by uid 1000);
        Tue, 23 Mar 2021 22:13:24 -0000
Date:   Tue, 23 Mar 2021 16:13:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH v8 05/22] dt-bindings: add BCM6328 pincontroller binding
 documentation
Message-ID: <20210323221324.GA1434635@robh.at.kernel.org>
References: <20210317143803.26127-1-noltari@gmail.com>
 <20210317143803.26127-6-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210317143803.26127-6-noltari@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 17 Mar 2021 15:37:46 +0100, Álvaro Fernández Rojas wrote:
> Add binding documentation for the pincontrol core found in BCM6328 SoCs.
> 
> Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  v8: add changes suggested by Rob Herring
>  v7: add changes suggested by Rob Herring
>  v6: add changes suggested by Rob Herring
>  v5: change Documentation to dt-bindings in commit title
>  v4: no changes
>  v3: add new gpio node
>  v2: remove interrupts
> 
>  .../pinctrl/brcm,bcm6328-pinctrl.yaml         | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
