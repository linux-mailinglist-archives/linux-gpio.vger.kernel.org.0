Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B03028CECF
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Oct 2020 14:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728288AbgJMM4r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Oct 2020 08:56:47 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37517 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728250AbgJMM4o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Oct 2020 08:56:44 -0400
Received: by mail-oi1-f193.google.com with SMTP id t77so22376498oie.4;
        Tue, 13 Oct 2020 05:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M8tT6t+SMkSYGRLbiqjiihdCsiur/8BZS3zekXOuO4c=;
        b=UCArX8MonEEocLfBP0HI7+7/ofbGmvv/YaDLRsTwSCCx2StCUZHkhW6hQ3L0mTE+XK
         fdh74Y6V1eHVZMsj3goHI9DF3KTkgG6usozq4XBaQNypRJDRmzeMn/e4J84ymvSJM7uH
         fc5G2J39nhNzwtK5WuCYWFJTNik2ami27OjylvpIo1MDoN6AQnkcmBNJtJd7Ekq5f2Ms
         1NU8z5GA/JZx+LxPYLgGe3P8gcGkMPkLEuyn5s7Jz3nbynS+SeixKh5ELQya8URrZjqP
         XC+deQKNwMcSBTW6h6x/C+tX4baPRZuKrdwDC5irUfKpkiHmgKz+ef3uYFINh2Jj6vPR
         q3pQ==
X-Gm-Message-State: AOAM533iQ/tLcHU4jFBIkZu/UyrjZ5BNHEfu1kw+5gFtjTTqZlPNunoj
        Cm7gVLUJVYg2RcPCjRvJeQ==
X-Google-Smtp-Source: ABdhPJy0nqJVWcIvEuGEkLDuJgWPKNNfKS2wBdK+81G1IEouvcyKDFK4oBL31UtNsTqi9Qt0fW3G1w==
X-Received: by 2002:aca:4bcd:: with SMTP id y196mr13052481oia.151.1602593801944;
        Tue, 13 Oct 2020 05:56:41 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b17sm11787338oog.25.2020.10.13.05.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 05:56:41 -0700 (PDT)
Received: (nullmailer pid 3335678 invoked by uid 1000);
        Tue, 13 Oct 2020 12:56:40 -0000
Date:   Tue, 13 Oct 2020 07:56:40 -0500
From:   Rob Herring <robh@kernel.org>
To:     Vladimir Lypak <junak.pub@gmail.com>
Cc:     Andy Gross <agross@kernel.org>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: pinctrl: qcom: add msm8953 pinctrl
 bindings
Message-ID: <20201013125640.GA3335626@bogus>
References: <20201007160611.942754-1-junak.pub@gmail.com>
 <20201007160611.942754-2-junak.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007160611.942754-2-junak.pub@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 07 Oct 2020 19:06:12 +0300, Vladimir Lypak wrote:
> Add device tree bindings documentation for Qualcomm MSM8953
> pinctrl driver.
> 
> Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
> ---
> Changes in V2:
>  - removed "wakeup-parent" property.
>  - changed pincfg property pattern to '-pins$' and added its description.
>  - added "serial-pins" subnode to example.
> ---
>  .../pinctrl/qcom,msm8953-pinctrl.yaml         | 167 ++++++++++++++++++
>  1 file changed, 167 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
