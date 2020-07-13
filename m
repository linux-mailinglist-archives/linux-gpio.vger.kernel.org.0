Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A784721DFF5
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 20:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbgGMSk0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 14:40:26 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:43563 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgGMSkX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 14:40:23 -0400
Received: by mail-il1-f195.google.com with SMTP id i18so12085063ilk.10;
        Mon, 13 Jul 2020 11:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3ceFnqYCGbooIgXW6yeKtrYkD957sdZYTwp/DqsXTjY=;
        b=jB6oD5dzDw/NwLSyWylWa5oGFyxxYqCSTAerEZaTDY5+ErVkInxqRy0/YEn/2trFZU
         MmkPuFxzzrGs1+YescX0dn3tuYik5fcX/gCETScWEJvT3x0WyZLAnJIoNwoBdD7gefID
         odsxb10wSdMF/5IE3YvL5L8IBf0xTsIrR8SrKswCEnZz2bNRAR4237rOT0Y1OBJJchsv
         LzeMsOYJqiNr7El2joj34RJRC9pEmjOiYl2Tg4uonQeOPLqdTXRWAiSNPNnC6GG8jTPk
         LfCup65uwBHrbPEKuFrNqFnyZZhW1g9spxYCOaXZqbKoLwsi3wg2tbOtJSulkMKQf2sd
         pxGQ==
X-Gm-Message-State: AOAM5306t7G6DDt8snouHz8G/Ud1u6rYHlWC2KD9kP0aurkfkEAXPumc
        vqJK1LRvZZtXkmIjyp4M/w==
X-Google-Smtp-Source: ABdhPJxNqX+fHZQXrj1AMm21bB9hIFXpqoxh2URqWHJxUCuGiehKP4/THhmB17kOUxJ7RVx4n0Gl9w==
X-Received: by 2002:a92:cf42:: with SMTP id c2mr1181124ilr.13.1594665622822;
        Mon, 13 Jul 2020 11:40:22 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id x5sm8189715iow.37.2020.07.13.11.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 11:40:22 -0700 (PDT)
Received: (nullmailer pid 515652 invoked by uid 1000);
        Mon, 13 Jul 2020 18:40:21 -0000
Date:   Mon, 13 Jul 2020 12:40:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Olof Johansson <olof@lixom.net>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        linux-clk@vger.kernel.org, SoC Team <soc@kernel.org>,
        linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org,
        Steen Hegelund <Steen.Hegelund@microchip.com>
Subject: Re: [PATCH v3 01/10] dt-bindings: arm: sparx5: Add documentation for
 Microchip Sparx5 SoC
Message-ID: <20200713184021.GA515585@bogus>
References: <20200615133242.24911-1-lars.povlsen@microchip.com>
 <20200615133242.24911-2-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615133242.24911-2-lars.povlsen@microchip.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 15 Jun 2020 15:32:33 +0200, Lars Povlsen wrote:
> This adds the main Sparx5 SoC DT documentation file, with information
> abut the supported board types.
> 
> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
> ---
>  .../bindings/arm/microchip,sparx5.yaml        | 65 +++++++++++++++++++
>  .../devicetree/bindings/mfd/syscon.yaml       |  1 +
>  2 files changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
