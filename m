Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A037264B737
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Dec 2022 15:21:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235481AbiLMOVS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Dec 2022 09:21:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235633AbiLMOVO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Dec 2022 09:21:14 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AFAF201A7;
        Tue, 13 Dec 2022 06:21:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1FFBCB81189;
        Tue, 13 Dec 2022 14:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3CCC43392;
        Tue, 13 Dec 2022 14:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670941269;
        bh=R9A9J+e3CDPOH/BI7j1nVr0BirXUObPtfsiRW2sTLp8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hTGbVG7R57si5fBN3eMRGFVZT8KXhmGsLV11ypypLcudjUz7ESe0w/OCmoJnsMFk7
         q33im5oHoSyxbNJTZihpi0k6vslmiW6+g2gI5tmgUa+UwbG8arGpSuyBkPZHbOI0kT
         6QPij8/nBQ1g4N102KKjOwHeSWdnpm2wxJrBTRiKg6hcFKVoYm9Q0eMeuXUFogRNLD
         8581bEZzztR3RxkVbAHxrA9my4M9of6BBDDtRyFBkSVlk5pLRXJSTsHv/IOsAGwY9z
         55GPknpuHHijPSsuIgwLAt/MJu4JgALZ9Io+5VLS4kMi+WCKyL9u2qzO+LPguJpM5C
         UCrcwfgWTshLA==
Received: by mail-vs1-f50.google.com with SMTP id h26so14743606vsr.5;
        Tue, 13 Dec 2022 06:21:09 -0800 (PST)
X-Gm-Message-State: ANoB5pllaj7f24LSIoCRjQLAsE/tzVIzhCiJbSg8wiBSLtJGSus2V1Ex
        YA13hxFd/Iua9kA0dZzJO3Brw60CJpSSQIVSpw==
X-Google-Smtp-Source: AA0mqf6lndP1jG37h7rTNuIoxKBTupXom7QJ1uaEw9bekymB4G9xkTqMO7ujQRFhmMdFy+oMuwcHHCntjB6lWxSLTa4=
X-Received: by 2002:a67:af07:0:b0:3b1:1713:ba12 with SMTP id
 v7-20020a67af07000000b003b11713ba12mr15217550vsl.6.1670941268717; Tue, 13 Dec
 2022 06:21:08 -0800 (PST)
MIME-Version: 1.0
References: <20221212103525.231298-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20221212103525.231298-1-alexander.stein@ew.tq-group.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 13 Dec 2022 08:20:57 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLeqpMuRkvpT2-x5q+8e4bHf4oLDML2QqCOgRMAg8=CsA@mail.gmail.com>
Message-ID: <CAL_JsqLeqpMuRkvpT2-x5q+8e4bHf4oLDML2QqCOgRMAg8=CsA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] gpiolib: ramp-up delay support
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 12, 2022 at 4:35 AM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi all,
>
> this series is an RFC for a general approach to solve the issue at [1]. While
> a device specific property works as well, a more generic approach is preferred.
> In short: When enabling a GPIO the actual ramp-up time might be (much) bigger
> than what software usually assume, in my case >100ms. Adding a delay to each
> driver is cumbersome.

At least for DT, I think this belongs (if at all) in the consumers,
rather than a producer property. The options there are
'foo-gpios-ramp-us' for 'foo-gpios' or add some delay bits to GPIO
flags. We already have some of the former for various 'generic' power
sequencing related delays. Of course, there's no real pattern to them
as they all get added as we go without much foresight. In this case
even, there are 4 possible delays: pre and post ramp up and down.

> Instead the (optional) ramp-up delay is added to each gpio_desc. The delays can
> be specified per gpio-controller, similar to 'gpio-line-names'. Actually the
> parsing code is almost a 1:1 copy of devprop_gpiochip_set_names(). Due to
> (temporary) memory allocation, I opted for a separate function, there is code
> duplication, but handling both properties in a single function seemed too
> tedious, let alone the to be added ramp-down delays.
>
> This feature could also be added as a callback in gpio_chip, but the callbacks
> have to be added to each driver then. I would prefer a single one-fits-all
> implementation and another indirection in the GPIO call chain.
>
> Laurent suggest to add a GPIO delay node in DT. IMHO this increased the DT
> complexity unnecessarily. But comments are welcome.
>
> The following 3 patches are a proof-of-concept on my platform, consisting of:
> Patch 1 is the proposed bindings and straight forward.
> Patch 2 is the current implementation
> Patch 3 is an actual usage example for specifying the delays
>
> TODO:
> 1. Adding ramp-down delays (Just the inverse copy of ramp-up delay)
> 2. Should these delays take active low flags into account?
> 3. How to deal with setting multiple GPIOs at once?
>
> I skipped 1. for now, because this is just a copy with ramp-up being replaced
> with ramp-down.
>
> I'm not that well versed in gpiolib code, so I'm not sure if I got all placed
> where GPIOs are set. So patch 2 might be incomplete.
>
> For now I skipped setting multiple GPIOs at once completely, so to get some
> feedback on this approach. A possible solution is to check for the bigest delay
> in the set and use that for all afterwards. But I'm not sure about the overhead
> in this case.
>
> I hope there is some feedback. While thinking about this issue appears to be
> more widespread than I expected.

Many/most GPIO controllers can read the actual state of an output
(IIRC, i.MX ctrlr can). Perhaps that capability could be used to delay
until the state of the signal matches the set state. And you'd
probably want to measure how long that took and then add some more
time based on it. This of course gets into the electricals of at what
levels a low or high state will register. If you can't read the state,
then you would be stuck with some maximum timeout.

Rob
