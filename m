Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 467CC346CC4
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 23:26:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234270AbhCWWY5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 18:24:57 -0400
Received: from mail-il1-f171.google.com ([209.85.166.171]:46717 "EHLO
        mail-il1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234314AbhCWWWV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Mar 2021 18:22:21 -0400
Received: by mail-il1-f171.google.com with SMTP id j11so19605670ilu.13;
        Tue, 23 Mar 2021 15:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Lsd3JZQm8JZcQF66tUklgJKPkCMFSVQcW29hFT1TSjY=;
        b=nZVksIKtv+hko0NL4ZucbHTwCuFns0Je1QC3xAhao3CYCQoNczCLRmtD54SA6fSap8
         dNAGGzIxRshJZvkEQmOkk6GATGjsfZQAZtq8vsg/RBWR4Mih3AeBs9ieME+0N7CyXptl
         wEewWLCFx31RmTMvh4RKZCsw+eZ+8NeONVPYZodIh5OzNS6PaN7r17XKUQ9ukQ+YTzQD
         GFXXOhpHWSb//cLamQ9u2rDYI32eYwGgmqTzxKjROcmhInrRZfnd1WvvHaDqjJ8J4R36
         YIzpzyXh1SHVbT1SVYtOX5YZGmsi7SiPgAcGdFNUa6oDZfNi1JBN56HeGFoQFV8Q181s
         7BaQ==
X-Gm-Message-State: AOAM530kKW/MhNTID2JTeSsK+1VTtPLTTF62d9yuHLaFWMg00RcI5ERm
        XBJ2yg23K0Nja+bLIJE6Zw==
X-Google-Smtp-Source: ABdhPJy1mfm2ar/RBe8uqyNsXyrCuWeqAUwQtroz7ofYeqG9JJ599ISfl+6oOZJP/gF5PpfZNfJc3g==
X-Received: by 2002:a92:7d11:: with SMTP id y17mr314366ilc.93.1616538140810;
        Tue, 23 Mar 2021 15:22:20 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id w1sm87900iom.53.2021.03.23.15.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 15:22:20 -0700 (PDT)
Received: (nullmailer pid 1449360 invoked by uid 1000);
        Tue, 23 Mar 2021 22:22:18 -0000
Date:   Tue, 23 Mar 2021 16:22:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Walle <michael@walle.cc>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v8 15/22] dt-bindings: add BCM6368 GPIO sysctl binding
 documentation
Message-ID: <20210323222218.GA1449305@robh.at.kernel.org>
References: <20210317143803.26127-1-noltari@gmail.com>
 <20210317143803.26127-16-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210317143803.26127-16-noltari@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 17 Mar 2021 15:37:56 +0100, Álvaro Fernández Rojas wrote:
> Add binding documentation for the GPIO sysctl found in BCM6368 SoCs.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  v8: add changes suggested by Rob Herring
>  v7: add changes suggested by Rob Herring
> 
>  .../mfd/brcm,bcm6368-gpio-sysctl.yaml         | 246 ++++++++++++++++++
>  1 file changed, 246 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm6368-gpio-sysctl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
