Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C210B346CF8
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 23:29:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233680AbhCWW23 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 18:28:29 -0400
Received: from mail-io1-f49.google.com ([209.85.166.49]:44712 "EHLO
        mail-io1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234578AbhCWWZ5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Mar 2021 18:25:57 -0400
Received: by mail-io1-f49.google.com with SMTP id v26so19459760iox.11;
        Tue, 23 Mar 2021 15:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uUYCAkvTyDYnArC0z1XGmhz+dcZuGsv7Ialg/jzSCcc=;
        b=KfHNJTiDxN7wrP/qBqwwu5L3JpZ52eXXb1vtPklR45u4bgOQPr9D6SRwmgMVXqCxJn
         45If9gzx2za3JLFfTly5qFtmjFw7zVlhgwobp1A79BFkqCIuRlou4M6Tm/ptpnVbvbWF
         gM68+AXOdWK/yBAijLDogS4jvoW+azNUM9SZLvvjvUsaFFsZUu+VeNYgr1q8dWFmChTf
         IPTu8oLj4tZp0F19427yuI5aqJe8NZ6SjAHZAXMp3Dy6EsXRqJRx9t79zA1os6kh/tzM
         vma3Qs4hq+ft/TIYT82seY4Hy7x5GkbLV9bWSFSQR0w6GzN4ZniH97kUFtbe0KZcgSkB
         mKbA==
X-Gm-Message-State: AOAM531FXgBa4k64YJylODm2xyErlrtKSIGnfFokEhl1yfGCx+eb3CX5
        Qnn+sMIm/aoLa0t/gilGXA==
X-Google-Smtp-Source: ABdhPJxKnLx+8mQ81rY9G7hJ7WigQga4SgRV8dnC+sMieZLPEElG3yv32Oxkko8NSqLqCueQGkh4BQ==
X-Received: by 2002:a05:6638:58f:: with SMTP id a15mr192544jar.35.1616538357235;
        Tue, 23 Mar 2021 15:25:57 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id h2sm95313ioj.30.2021.03.23.15.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 15:25:56 -0700 (PDT)
Received: (nullmailer pid 1455179 invoked by uid 1000);
        Tue, 23 Mar 2021 22:25:54 -0000
Date:   Tue, 23 Mar 2021 16:25:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Michael Walle <michael@walle.cc>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v8 18/22] dt-bindings: add BCM63268 GPIO sysctl binding
 documentation
Message-ID: <20210323222554.GA1455125@robh.at.kernel.org>
References: <20210317143803.26127-1-noltari@gmail.com>
 <20210317143803.26127-19-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210317143803.26127-19-noltari@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 17 Mar 2021 15:37:59 +0100, Álvaro Fernández Rojas wrote:
> Add binding documentation for the GPIO sysctl found in BCM63268 SoCs.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  v8: add changes suggested by Rob Herring
>  v7: add changes suggested by Rob Herring
> 
>  .../mfd/brcm,bcm63268-gpio-sysctl.yaml        | 194 ++++++++++++++++++
>  1 file changed, 194 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm63268-gpio-sysctl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
