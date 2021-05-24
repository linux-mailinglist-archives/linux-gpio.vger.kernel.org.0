Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B827D38F5DF
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 00:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbhEXWyN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 18:54:13 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:34751 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhEXWyM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 18:54:12 -0400
Received: by mail-ot1-f46.google.com with SMTP id u25-20020a0568302319b02902ac3d54c25eso26811261ote.1;
        Mon, 24 May 2021 15:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P62xUqJ5CP78WJwgJVtNm8/Wb7e85Qi9HRBgUg+ou5o=;
        b=FumNzdYT7SLyZGF6Jz08WKgiO8EmoyFwp5FnYjPUarJmwds+ovoc1NCsSZEtk+DJbq
         qe2S21BV/XnbtG0Mp0mvYFaAUbpahzVMG0pVL+edSlKBauquZinKEkkZ+18JHM9NDq1o
         mSMZHsOlwoEiKC+iPGyts0TKOSRr5j+JKl0oGEkKwskFYjyUtX0H278BDcXABYwf/sSe
         T8MX5d8Yxi8KfQYQkiv9wHICGfCk06yMz7L2Cequge04jY0F9m642LnmrK6eyMb1GIXJ
         GY/YXOGIUnGqWjnrC2D/dQ8E4BVeFJ6vyYYrpLgkmFLNaPtHBV+s0LIPMcODaeKsPn3G
         J7tQ==
X-Gm-Message-State: AOAM530kRamYBymZFQNacWKMuQPsCUCZykOxGXQJjNhUCzl2gY7mx5HQ
        +8bETJhRB1/TkYM868LfAA==
X-Google-Smtp-Source: ABdhPJxQzyud8LXXP3ohLaDtGNiEUzNllPix6rvYk5xlABI4dxlh8sO6GqbosKyCgmEm/A8mlrnXDg==
X-Received: by 2002:a9d:7419:: with SMTP id n25mr20205706otk.1.1621896763681;
        Mon, 24 May 2021 15:52:43 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k21sm3304017otr.3.2021.05.24.15.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 15:52:43 -0700 (PDT)
Received: (nullmailer pid 1322542 invoked by uid 1000);
        Mon, 24 May 2021 22:52:42 -0000
Date:   Mon, 24 May 2021 17:52:42 -0500
From:   Rob Herring <robh@kernel.org>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, Aswath Govindraju <a-govindraju@ti.com>
Subject: Re: [PATCH 5/5] dt-bindings: gpio: omap: Convert to json-schema
Message-ID: <20210524225242.GA1319212@robh.at.kernel.org>
References: <20210521223236.18324-1-grygorii.strashko@ti.com>
 <20210521223236.18324-6-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521223236.18324-6-grygorii.strashko@ti.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 22, 2021 at 01:32:36AM +0300, Grygorii Strashko wrote:
> Convert the OMAP GPIO Device Tree binding documentation to json-schema.
> The GPIO hogs node names defined to end with a 'hog' suffix.
> 
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---
>  .../devicetree/bindings/gpio/gpio-omap.txt    |  45 --------
>  .../bindings/gpio/ti,omap-gpio.yaml           | 108 ++++++++++++++++++
>  2 files changed, 108 insertions(+), 45 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-omap.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/ti,omap-gpio.yaml

Other than the indentation,

Reviewed-by: Rob Herring <robh@kernel.org>
