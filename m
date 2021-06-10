Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2333A3095
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jun 2021 18:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231173AbhFJQ3Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 12:29:16 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:36647 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbhFJQ3Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 12:29:16 -0400
Received: by mail-ot1-f43.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so278615otl.3;
        Thu, 10 Jun 2021 09:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EK1mjQ/f6ITujp115mW7JL3SX+0ni6SRT4tA38v94s8=;
        b=R99UAnvNu2JpX8nTSsbEpgjrVV5j4Sk0jcdy48zekAq6YcI0myIjCWzwpnPCBVBM9T
         EWk17p41LHIKX9MwldLsQFrmLx2VBUAzmZ6SMrwva3cp0jZqNS35N7Win4r9ZZ3uw2uW
         fxdTtK8eGnVBxA/O5vBO3vqFfgM/cPomf8rWvSBYZyGBkZtwZ2ojC6AmehSsWISxlW8e
         wmh7GnYGANFtCI7WQPHrMmMnq4fBQ6ieYHJdIFU+b7+Gp4svgbTLuJwsNDJJVYo5xigN
         7/DuHGbpD4Xrinz5vEX3Kji8TrZkvFm+iZ/33heG9jGkoxB+sshVHcn2qZ2nM4bXmyie
         9aOw==
X-Gm-Message-State: AOAM530b8f1LoUnsqKFQ04wjigoiqfp724vjwWZJsKB3+W5VqGNh0XCy
        c7zDOoMoEQd8frzMIWdHn44VingI+A==
X-Google-Smtp-Source: ABdhPJwMG5KQzeXTml4Qxe43YPpLaVrfXTxJx+3v3r2q4/7IYsKPox0ZydBayDxAopu9ZE2DafgDcw==
X-Received: by 2002:a05:6830:2415:: with SMTP id j21mr2971197ots.224.1623342439617;
        Thu, 10 Jun 2021 09:27:19 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.113])
        by smtp.gmail.com with ESMTPSA id k8sm604856ool.5.2021.06.10.09.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 09:27:18 -0700 (PDT)
Received: (nullmailer pid 1921923 invoked by uid 1000);
        Thu, 10 Jun 2021 16:27:15 -0000
Date:   Thu, 10 Jun 2021 11:27:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Aleksander Jan Bajkowski <olek2@wp.pl>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, john@phrozen.org, robh+dt@kernel.org
Subject: Re: [PATCH v4] dt-bindings: gpio: stp: convert to json-schema
Message-ID: <20210610162715.GA1921873@robh.at.kernel.org>
References: <20210603135945.3495-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210603135945.3495-1-olek2@wp.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 03 Jun 2021 15:59:45 +0200, Aleksander Jan Bajkowski wrote:
> Convert the Lantiq STP Device Tree binding documentation to json-schema.
> Add the missing pinctrl property to the example. Add missing lantiq,phy3
> and lantiq,phy4 bindings for xRX300 and xRX330 SoCs.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Changes since v3:
>  - Removed description of the reg property.
>  - Changed regex pattern property.
>  - Moved lantiq,rising to properties.
> Changes since v2:
>  - Changed phy numbering in description of pattern Properties. Numbering
>    should start with 1.
> Changes since v1:
>  - Renamed node to gpio.
>  - Dropped default pinctrl from this binding.
>  - Converted lantiq,phyX to patternProperties.
> ---
>  .../bindings/gpio/gpio-stp-xway.txt           | 42 --------
>  .../bindings/gpio/gpio-stp-xway.yaml          | 99 +++++++++++++++++++
>  2 files changed, 99 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-stp-xway.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-stp-xway.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
