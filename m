Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08D0F4E6909
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Mar 2022 20:07:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345232AbiCXTIp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Mar 2022 15:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352831AbiCXTIo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Mar 2022 15:08:44 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F69FB82DA
        for <linux-gpio@vger.kernel.org>; Thu, 24 Mar 2022 12:07:12 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-2d07ae0b1c4so60900457b3.11
        for <linux-gpio@vger.kernel.org>; Thu, 24 Mar 2022 12:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pseG2z7S6drXw7B6bZFmu5Aq0qIPkTegmGqNFv03N28=;
        b=YV8zjBbDPKhPuua63RB0aEnfwtnQRi2RXudWvZLwzJ6TbcetrLsgZP2EXKryNkqqNs
         WzObgFsfIMMm8KL8SyoRILWYW3dOaaD2QUYX9QCWsy+YSBLUgn0t8woNrgmak24MCpeA
         bkXHLnIYyUWVOmJitwEmeQ8kfrl88nff9tzE+TnhF+NmDe4vc/B0KtfInUxKdfHFEvPf
         jAtgjS6GqSAV5VDDLJfTHZHWKdteM1is/qGpgTzJElZ8oryga8khQztvmc1tTSETeHAR
         DX0HC6lRwhkVx3TZIxVjZmCzbX/lTTQOGTUFrPuhAKObpAh2f7sUYrS67XpgBlBd6RDJ
         bn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pseG2z7S6drXw7B6bZFmu5Aq0qIPkTegmGqNFv03N28=;
        b=YCx0o26v98OgozM2tPvcVD8R1jDFsWHVbK4pILaXHpClydHXAZR8sXAH7pGqDSNZQs
         c3ZfsDJN1xXMhQxSZpzEmLGgOF9MCy53B3eMWaX5UZRZ5mSBCOdn4Ep3imQCIK+wfFhA
         tLmylWP59FqZUDvYgZ5cmnBCDWx3+6FXDVijkyoOKecefjJ9yQsKYgDuu6gFdjcVyNpW
         xPNZM+aIH/cjWkceB3QY5+Amq8OB/8kkbXI3NMLy5mV9coWq5wYfts6kOLqrEiRhDeER
         atiecdITbVhxmLO21YgyIDV77I32NHvZNz/uBajfE9nnQebjzMy7d3Flah64T+CjApLt
         HQIQ==
X-Gm-Message-State: AOAM532O4TpU0JRy6BoJ81H05gtZrLbRo6PaUFjgb5PkT9ECD62Ilim9
        SmkVlFJoDXFBoGwt4pJegi6IRlKcpSzUWcfwyQM4chP/hAA=
X-Google-Smtp-Source: ABdhPJy3Tun+JOoRB0PYnpMrTm04joB8Ft64Szzjf/r0Dh8SbNJEXf+JKX1agsVDSy3HORuyZGHZFxe9asZz1qxEwjw=
X-Received: by 2002:a81:d542:0:b0:2e5:c060:a0ac with SMTP id
 l2-20020a81d542000000b002e5c060a0acmr6382708ywj.118.1648148831342; Thu, 24
 Mar 2022 12:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220317000740.1045204-1-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220317000740.1045204-1-aidanmacdonald.0x0@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 24 Mar 2022 20:07:00 +0100
Message-ID: <CACRpkdbEukaSdZDbA0JRuwCFjK5WLdMWB1Rs2VLe=WNSvfjBZA@mail.gmail.com>
Subject: Re: [PATCH v4] pinctrl: ingenic: Fix regmap on X series SoCs
To:     Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Cc:     paul@crapouillou.net, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 17, 2022 at 1:07 AM Aidan MacDonald
<aidanmacdonald.0x0@gmail.com> wrote:

> The X series Ingenic SoCs have a shadow GPIO group which is at a higher
> offset than the other groups, and is used for all GPIO configuration.
> The regmap did not take this offset into account and set max_register
> too low, so the regmap API blocked writes to the shadow group, which
> made the pinctrl driver unable to configure any pins.
>
> Fix this by adding regmap access tables to the chip info. The way that
> max_register was computed was also off by one, since max_register is an
> inclusive bound, not an exclusive bound; this has been fixed.
>
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
> v1 -> v2: use regmap_access_table
> v2 -> v3: compute max_register instead of putting it in chip_info
> v3 -> v4: explain the fix to the max_register calculation

Patch applied!

Yours,
Linus Walleij
