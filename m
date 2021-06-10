Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0FF13A305D
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jun 2021 18:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhFJQUQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 12:20:16 -0400
Received: from mail-oo1-f45.google.com ([209.85.161.45]:33594 "EHLO
        mail-oo1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbhFJQUQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 12:20:16 -0400
Received: by mail-oo1-f45.google.com with SMTP id v17-20020a4aa5110000b0290249d63900faso31952ook.0;
        Thu, 10 Jun 2021 09:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zowArRjAAnzKvHBN+RPg0/JH6reTanVtBG1ZhO+au30=;
        b=EI5YcDTe7N1MF/8ijscPU/eVMz2TiVMpb2ivL0fUIz6bzODo3IDqWdbjrYE+DWBUoe
         hY+wXF4MJhrz9cWpKzzcDFUVaNjiPGWTA7Rghho7AlwFjyW20LM7l6qjKTKnC/APULVs
         dYSVend+KeS4kU8pKalnXOltYUpVOguT/UTa+8wy8PGdw+AGSAWYnGdh1VwFryeLq3HI
         QDmSShOek/0xwriO8FaHAwwVuZRBBTnhhSc5ElJShTwyuDGdw/mrR7WcWkTKLl+97Owq
         /8hcQxPZ372O3blEIujqGivs3rBcecnBaIDl8LdsyXg4oeeRsrUJhQTD/xXuRf8tQ/+g
         1vsQ==
X-Gm-Message-State: AOAM532OHdwJyhwUgL/ZErvnL4bSUvIwKkhZz1gGXPJuguhy8Cfd1iPD
        trcn9fcYuXsC9zI2/Ze5Wg==
X-Google-Smtp-Source: ABdhPJxDa2nJg5IbToRfbbwFxUmVIEpzV4GOafbjOpqGflOC3KFiwmEQEvu7SFxiC9JxpaBHK8QyWQ==
X-Received: by 2002:a4a:a9c8:: with SMTP id h8mr2975424oon.1.1623341899426;
        Thu, 10 Jun 2021 09:18:19 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.113])
        by smtp.gmail.com with ESMTPSA id x187sm637622oia.17.2021.06.10.09.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 09:18:18 -0700 (PDT)
Received: (nullmailer pid 1910178 invoked by uid 1000);
        Thu, 10 Jun 2021 16:18:15 -0000
Date:   Thu, 10 Jun 2021 11:18:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Steven Lee <steven_lee@aspeedtech.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Joel Stanley <joel@jms.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        billy_tsai@aspeedtech.com,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, ryan_chen@aspeedtech.com,
        Hongweiz@ami.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v5 01/10] dt-bindings: aspeed-sgpio: Convert txt bindings
 to yaml.
Message-ID: <20210610161815.GA1910106@robh.at.kernel.org>
References: <20210608102547.4880-1-steven_lee@aspeedtech.com>
 <20210608102547.4880-2-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608102547.4880-2-steven_lee@aspeedtech.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 08 Jun 2021 18:25:36 +0800, Steven Lee wrote:
> sgpio-aspeed bindings should be converted to yaml format.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  .../bindings/gpio/aspeed,sgpio.yaml           | 75 +++++++++++++++++++
>  .../devicetree/bindings/gpio/sgpio-aspeed.txt | 46 ------------
>  2 files changed, 75 insertions(+), 46 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
