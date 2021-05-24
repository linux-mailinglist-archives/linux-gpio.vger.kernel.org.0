Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDC7B38F1E2
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 18:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232920AbhEXRBC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 13:01:02 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:38467 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232543AbhEXRBC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 13:01:02 -0400
Received: by mail-ot1-f49.google.com with SMTP id i14-20020a9d624e0000b029033683c71999so14675486otk.5;
        Mon, 24 May 2021 09:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=TOA3bDdEMMFRDP4kZXTONZi/Xy6SI79VL7CIlLaKLO0=;
        b=Ykd/iWa3QcAcjrENV2SCrtJzebcF9vyoB9ujTbLBLjC6mC62ZkPiDR8TqfDtz+3s+2
         fHZCVwkNubfRDNPvn8hFYL2dtMN2BrpVnel6B6zI0wX9QUTpKojgvcqJbsjN0+bwgSk0
         p+H58GDTcAf/HyzvDA5X0887QrBwXRP0Oyxbg4pTGo6rVuModdDIy3bOWJaFzuCA/y58
         f5Y8bY6MoVVHjbZisNZjgKqF7dVwatDJq6j3suBlhsDnDtixVvLEcttdhaoRc5B8FWwK
         mFu7b7V2bolQaHLX+FdYqWyeqsTeidXnxcBw+lGxOFKcge6Q0dQijQncQaleaSZsXzj7
         jFMQ==
X-Gm-Message-State: AOAM533+t3Mnn3DRdiANCTobJf0CjaAZTDgd8XdZcoD4cKeZ44Ia2lCH
        d6yo7Yh3X2N5+EcKQdvG6w==
X-Google-Smtp-Source: ABdhPJzCF1AjIDiFvsfcB85y4/1aKWchPZ+c8mSUgYDUel9fJ26poawYgLDrsZQX8maOVfC8yC7mPw==
X-Received: by 2002:a9d:c64:: with SMTP id 91mr19392039otr.130.1621875572585;
        Mon, 24 May 2021 09:59:32 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q5sm2472868oia.31.2021.05.24.09.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 09:59:31 -0700 (PDT)
Received: (nullmailer pid 20323 invoked by uid 1000);
        Mon, 24 May 2021 16:59:30 -0000
From:   Rob Herring <robh@kernel.org>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Aswath Govindraju <a-govindraju@ti.com>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <20210521223236.18324-6-grygorii.strashko@ti.com>
References: <20210521223236.18324-1-grygorii.strashko@ti.com> <20210521223236.18324-6-grygorii.strashko@ti.com>
Subject: Re: [PATCH 5/5] dt-bindings: gpio: omap: Convert to json-schema
Date:   Mon, 24 May 2021 11:59:30 -0500
Message-Id: <1621875570.377768.20322.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 22 May 2021 01:32:36 +0300, Grygorii Strashko wrote:
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
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/gpio/ti,omap-gpio.yaml:22:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

See https://patchwork.ozlabs.org/patch/1482351

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

