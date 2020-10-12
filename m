Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C43228AD00
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Oct 2020 06:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725967AbgJLEaN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 00:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbgJLEaN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Oct 2020 00:30:13 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5A57C0613CE;
        Sun, 11 Oct 2020 21:30:12 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id 188so16643144qkk.12;
        Sun, 11 Oct 2020 21:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ix53B+4PxpD3FvNrquTS4wrFrQE1rmLNYwUdzsQBz70=;
        b=Vi0Okto4r2twCBe/iUIb9WvlHH1xO2X3Pgp/nljP/qcnaXwYhnCYzuh1+uReRXwRdx
         TPoGM9Rlp+ghbeEWUbk+eDkR+uz9q51GERSJbC0puwH+q4lKe8vhqMSjFp+Sge2IR07V
         Yz5TD89m4VosCu5dlVKyhk/N9QRS5LXdMkwaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ix53B+4PxpD3FvNrquTS4wrFrQE1rmLNYwUdzsQBz70=;
        b=eIQ0eICtr791UJxgyG5Dj8yCwjrPSblsnR0/dvIx4v9rcYwWVTB+sywWaOz86YndSr
         ZaFuF625hZHa5RIFkDf84Mrh5zsObfmZot/JQ6qkkFTst5h9bFUnS4LIvAhiCzTCxkb9
         MXfsE6CLihSbeJ3Q0OFRAUpN4S7oKGxYdwp8C8pOFk3h4hYM/Z4wnstrVixtJC8tccC6
         smjln3TJQEn6FhUJIPOKtaHZCsUu1n2hsUKNrQhjfwOSMOasUWbxUMMtQIQQzl1LfNzV
         xcSTvTkwDzqaNHjfhzEWk0CRs0tcS62LhkiYvJFwae7LKCWJNjuEv+qzTaWo9zankj9F
         /vWg==
X-Gm-Message-State: AOAM5327c/VDGzi8UB0A+cV8iXkjHwU03fcTSFrulfSn4A+yryjRUu43
        PQX90bHUlxfqQGSLqpZ102C1aTDxS+Sso2Bu2mw=
X-Google-Smtp-Source: ABdhPJyNBsj3Xl5S6RY3Rvn00/GtfkhS8Ore3QHLa1prcwNZOO4RsI2temxvhrolGiYtx4NchxSTU3LmSRQ/3KhH1ts=
X-Received: by 2002:a05:620a:16aa:: with SMTP id s10mr7987574qkj.273.1602477012120;
 Sun, 11 Oct 2020 21:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201012033150.21056-1-billy_tsai@aspeedtech.com> <20201012033150.21056-2-billy_tsai@aspeedtech.com>
In-Reply-To: <20201012033150.21056-2-billy_tsai@aspeedtech.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Mon, 12 Oct 2020 04:30:00 +0000
Message-ID: <CACPK8XcQ+uodvYCyL7_RO9W2QF+AA2LidHhXi2tR3_uriQFccQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] Arm: dts: aspeed-g6: Fix the register range of gpio
To:     Billy Tsai <billy_tsai@aspeedtech.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        BMC-SW <BMC-SW@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 12 Oct 2020 at 03:32, Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>
> This patch is used to fix the memory range of gpio0
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 97ca743363d7..ad19dce038ea 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -357,7 +357,7 @@
>                                 #gpio-cells = <2>;
>                                 gpio-controller;
>                                 compatible = "aspeed,ast2600-gpio";
> -                               reg = <0x1e780000 0x800>;
> +                               reg = <0x1e780000 0x400>;
>                                 interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
>                                 gpio-ranges = <&pinctrl 0 0 208>;
>                                 ngpios = <208>;
> --
> 2.17.1
>
