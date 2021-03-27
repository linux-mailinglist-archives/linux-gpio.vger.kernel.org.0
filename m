Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9103434B8D6
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Mar 2021 19:17:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbhC0SQm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 27 Mar 2021 14:16:42 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:36726 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbhC0SQ2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 27 Mar 2021 14:16:28 -0400
Received: by mail-ot1-f48.google.com with SMTP id g8-20020a9d6c480000b02901b65ca2432cso8363519otq.3;
        Sat, 27 Mar 2021 11:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EiWtY8HAoFaOHhO63HVuyEaJaKbqYOtxk9O+hQVc9lM=;
        b=V6xvQKSedAMY3/rQjNo0qsZmIJqSJwAObTUro2HJq8pEZXTvJjA65OhDXAA7aOv0Br
         FHOWg5DEGvf/BpSa5Tmo7RLjMH5TuaBu3QhMUy2vCYrK56VBeC/GnR/LFpjdtbqfErDw
         sEkQoA0rSBLqrmeFkI0ISj0FCJRlk25dpv/YbNNqSSTw+KZCT+c281OfYy6HfW+cgqvJ
         H0QLUgf28QFSPHR6aeIt8oHsRJH//BRsDTDPZyl3EC0lm+CMiQPyGk9xzX0Be/J4BbXq
         D+2g6hdBOGzntIxW7zVOW5q/UuS5HveZ9oD9v/eEbj8AIWbsnFuR3KW5mOHqT88NK4ok
         yS1Q==
X-Gm-Message-State: AOAM531jI+Gf1dDmKdneAlQgg5dpq6KZaNbXQjM4C9bE/sWugn0Q7Iwa
        MB68SUa84YkDgfxkCKN8fA==
X-Google-Smtp-Source: ABdhPJwDYQJ5WcvZEadfqIsyZqwt9zAduXFDT6jUipxdUcQDw9Pe45WBjGQLJV4oV4Vz2u+NK2mjrw==
X-Received: by 2002:a9d:7a87:: with SMTP id l7mr16121284otn.367.1616868987398;
        Sat, 27 Mar 2021 11:16:27 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.41])
        by smtp.gmail.com with ESMTPSA id m14sm3087890otn.69.2021.03.27.11.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 11:16:26 -0700 (PDT)
Received: (nullmailer pid 344794 invoked by uid 1000);
        Sat, 27 Mar 2021 18:16:21 -0000
Date:   Sat, 27 Mar 2021 12:16:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sander Vanheule <sander@svanheule.net>
Cc:     devicetree@vger.kernel.org, maz@kernel.org, tglx@linutronix.de,
        linus.walleij@linaro.org, robh+dt@kernel.org, bert@biot.com,
        andy.shevchenko@gmail.com, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: gpio: Binding for Realtek Otto GPIO
Message-ID: <20210327181621.GA344012@robh.at.kernel.org>
References: <cover.1616760183.git.sander@svanheule.net>
 <cda4ad68a031b60d407629e9232df495d3e260c2.1616760183.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cda4ad68a031b60d407629e9232df495d3e260c2.1616760183.git.sander@svanheule.net>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 26 Mar 2021 13:03:46 +0100, Sander Vanheule wrote:
> Add a binding description for Realtek's GPIO controller found on several
> of their MIPS-based SoCs (codenamed Otto), such as the RTL838x and
> RTL839x series of switch SoCs.
> 
> A fallback binding 'realtek,otto-gpio' is provided for cases where the
> actual port ordering is not known yet, and enabling the interrupt
> controller may result in uncaught interrupts.
> 
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/gpio/realtek,otto-gpio.yaml      | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
