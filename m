Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C70C170B34
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2020 23:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727859AbgBZWHZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Feb 2020 17:07:25 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:43070 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727670AbgBZWHY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Feb 2020 17:07:24 -0500
Received: by mail-oi1-f195.google.com with SMTP id p125so1153554oif.10;
        Wed, 26 Feb 2020 14:07:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mh9L6UBbZd077xS3dYC1Wgq1kmV8/0MwjWPhr3ALxzw=;
        b=N9w+Nq8poK4jaUe38on2fXvkH2viynFW13WNQroqsmRAJ+UHToAw5A8VL0AlDvGfZb
         MLEuJeUvVvkqCNUQcun/AJba+hCkBuZgcOwWvyBQ+CVvre8rBf0lli8uk4hrEx+ccfni
         wUkZJh0qH460B2Zl575crgh9/gTv3WcukfrMPewuM4wi1tKo9+zon9JGQNRhVD4h4jh/
         0H2zypsL6VKsyui6kKHan1Ct7A1VAbGx6C647KpQfNiJb2YGHT5u4bo+zIpJaruy/FOx
         1/iZVXYB5r9QtcJ4VdmGjyiuWeLL5AR2T0Hu9gfQtVcjD/UkkH73hru4B1VsngVLwIts
         fSKA==
X-Gm-Message-State: APjAAAWOrGu/vJxpAgAROAfSpc/ALKXZN2jLTC+K/tGuwazXx2N5VuQG
        3bzUz7ndS6zMJqIpoyXpsQuDx4QoWA==
X-Google-Smtp-Source: APXvYqw1VLx2OrRQwWC2sH4XIbmcGTHpYpjGcFlcP4IOlWJurHfS6aQcTHXktgvzJUWnvB4nMfEaPg==
X-Received: by 2002:a54:4510:: with SMTP id l16mr969952oil.70.1582754843674;
        Wed, 26 Feb 2020 14:07:23 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j45sm1220921ota.59.2020.02.26.14.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 14:07:23 -0800 (PST)
Received: (nullmailer pid 18100 invoked by uid 1000);
        Wed, 26 Feb 2020 22:07:21 -0000
Date:   Wed, 26 Feb 2020 16:07:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bingings: pinctrl: Convert UniPhier pin
 controller to json-schema
Message-ID: <20200226220721.GA18049@bogus>
References: <20200222060435.971-1-yamada.masahiro@socionext.com>
 <20200222060435.971-3-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200222060435.971-3-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 22 Feb 2020 15:04:35 +0900, Masahiro Yamada wrote:
> Convert the UniPhier pin controller binding to DT schema format.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> In the original .txt file, there is a description:
> The UniPhier pinctrl should be a subnode of a "syscon" compatible node
> 
> I did not figure out how to represent (or check) it in dt-schema.
> I just moved it to a comment line in 'examples'.
> If there is a better way, please let me know.
> 
> 
> Changes in v2: None
> 
>  .../pinctrl/socionext,uniphier-pinctrl.txt    | 27 ------------
>  .../pinctrl/socionext,uniphier-pinctrl.yaml   | 42 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 43 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml
> 

Applied, thanks.

Rob
