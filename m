Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B660B600B9A
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 11:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230435AbiJQJwj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 05:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbiJQJwi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 05:52:38 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7372E26C7
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 02:52:37 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id r17so23605727eja.7
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 02:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zRFt+h+5VH4Wn0MXX/rMSVTPB6/xwN1Sl3zRX3T1Fj4=;
        b=foiMemMOSyPv1CfQ6TlLZtaxh9u4Zl+VyBbN59ooUGadBlVwLzLwEqCoGqvNnZNlcf
         UdIBbMC/i7Z5ItGa1LOZDY+x70f4qF6qnrAlTryBxqlkWLoHO8T+Fg7h7yJyUS/3+IOg
         ToERuM9ufvOwThrM/QOQduQ/vrKWkRCoKwshJLeJOhh3AYjdfiXEn3QyluxxS5Vne4Eg
         0v63+7N/gMo1Ne0PiYrWcIo2YPpeTSoaI0s1r/psnzjQJRge/Li8MHHVUo6nHoEG3tFy
         BdFZ0IE7m3sl1CE9ro/7crHBAT0pnI0e5TX3mnD1olWfx3tZQWB7ZuVO0x9Sl5iKYCZI
         DKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zRFt+h+5VH4Wn0MXX/rMSVTPB6/xwN1Sl3zRX3T1Fj4=;
        b=U7Y06TLM8BEMMqSXvua8cToBYQnTimD5EcfDB7LY+/FO8AcwLGQJ8a9u5x08RakGII
         1XRuqCY5qUptoEr8EA8I53mrYMhC9RPQj2LtJX8NxAKhQVStFcXLSyWJWEx72WusRYIR
         a+WXNkQ85OBkWVFBHqdORxLW6oT8CINvFb4d4znfkckMy7tWvu2pZkH3k0hPqJtKRDqE
         KdrV0+kd6a8hf9kwdJKKP7XniuZExlH0RVcVGFSQJ6eOYwwYbX+sLREFJGa+oYAU5fRc
         D9EVK1EpRxSc2u1t2cWWKbWgCJbHmmB3PCaLoxWN9NrNrxMOSB4uM5Z0qPYlW8T6gnIk
         oXOg==
X-Gm-Message-State: ACrzQf0ZqchsQMedEMYgn3ML3EU4FP4g1To15/n9lsbSwOCtH4WiSg05
        JZWvmmLTvxnIaRzbcEMOugqLA7CQ9dK7AHnNyVQsuA==
X-Google-Smtp-Source: AMsMyM5g9JldkzxkVbmCTOa7C1TRRLhTvVBc7VH4TYIa7C8x5X1VzLxieXa04uk31VplHYMb3bCiVY4fTUxBE4SA8x8=
X-Received: by 2002:a17:907:1624:b0:78d:d61c:2b4a with SMTP id
 hb36-20020a170907162400b0078dd61c2b4amr7825175ejc.208.1666000355952; Mon, 17
 Oct 2022 02:52:35 -0700 (PDT)
MIME-Version: 1.0
References: <20221007151647.98222-1-Ryan.Wanner@microchip.com>
In-Reply-To: <20221007151647.98222-1-Ryan.Wanner@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 17 Oct 2022 11:52:24 +0200
Message-ID: <CACRpkdZv0_E8o4ctYr+UEsQG8XqnFATq6jXmKTrbyWh4WJfz+A@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl:at91-pio4:add support for pullup/down
To:     Ryan.Wanner@microchip.com
Cc:     ludovic.desroches@microchip.com, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 7, 2022 at 5:16 PM <Ryan.Wanner@microchip.com> wrote:

> From: Ryan Wanner <Ryan.Wanner@microchip.com>
>
> This patch set adds support for pull up/down pinctl configuration.
> The implementation is based off of other pinctl drivers that have
> implemented line bias configurations.
>
> The second patch addes a case for PIN_CONFIG_PERSIST_STATE
> this shows up becuse the gpiod api passes this into the new config_set
> function that was just implemented. Looking at other drivers like TI
> driver, added the ENOTSUPP to the switch case for that state flag.
>
> How this was tested was by using a gpio program that I created to test
> configuration from userspace. This program was run in the
> background using & then using gpioinfo function checked if the change
> has been detected by the gpiod api. Then using devmem reading the
> regester making sure that the correct bit was set. The registers where
> checked before and during the program is being run, making sure the
> change happens.
>
> In the program Pin 127 would be passed into the test program. Before
> the program was ran devmem for pin 127 config register. After
> the progam is running in the background devmem for the same status
> register is called, the result is showing the change in pinconfig.
> The device used to test was the SAMA5D27_som1_ek.
>
> Ryan Wanner (2):
>   pinctrl: at91-pio4: Add configuration to userspace
>   pinctrl: at91-pio4: Add persist state case in config

Patches applied!

Yours,
Linus Walleij
