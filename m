Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD2963BF98
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 13:01:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233673AbiK2MBr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 07:01:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233429AbiK2MAr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 07:00:47 -0500
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2971A5CD08;
        Tue, 29 Nov 2022 04:00:34 -0800 (PST)
Received: by mail-qk1-x730.google.com with SMTP id i9so9498989qkl.5;
        Tue, 29 Nov 2022 04:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ye/jdZEmZA++LNdEUd8a+Tg3GQWyQjg8OouT2UQGFzg=;
        b=c1lVCrVMoyI6YzsWOnisq0diXTPPWuBDXnGQKsCisStbvpDQxx95YNR3tG9mROSIe9
         IZ9Y/yFoIjLtoN4kdGfmmncWRWM89dBSHiFJ5ulBfbFAF0ni2beDZKdQA8tsQ/q6xoHG
         SkVVg3BCOHzY8l0hEVCXt6qOABDU4/kiX3TyUul4f2PF2OGOrN75H4adjzVVwAja3vbO
         moS1VM4/ZdNMwnLGUxJaFTOZEQUK7AG2j7xWz2YxVLuUnlUM91oKrgOwzfK6Aoo2n1TS
         jORcXKIcCFqNi47ODjXWB1DPev3ZNp/7HUsfULaKBWTXEFOzbqZc0b1E4iMQGi0GDTPg
         AtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ye/jdZEmZA++LNdEUd8a+Tg3GQWyQjg8OouT2UQGFzg=;
        b=QKbvCVPplZD1OVjAOzPM1MponhbCxfBN3c2yzRfEZz9z3pdw1PlDvW4SSLGP3TwMsy
         JYYEcu5RDGT9Q2V2v9qMfex4Rrzc1mCFiwvNS6XDq3+LuKzvvbGX3Ts3HbCsLWg6Z1VS
         o/jPV3x+aCZpiHfj7MaXcH7EUQUP+umusiUmVANDHo65OzGGaSMZibN+D2tNdxs6MlVy
         cOdqAo9wxhBjaY22Np58nSGgwecOyLNCDotP0JyQ80q+o9EWv4ZfIhSAHil+C7odXgWj
         Zh+sZL24EvSAFreoKZeDdr6ccEDArPgP07wctX83+O3uoFPEzaCUL7OeaXivmgDncVRj
         nfkA==
X-Gm-Message-State: ANoB5plsd9XkP8O7qIYtM6T1fjJdsGVXWqcqY+lZEnbLqIVlY435pWXa
        1/gwSSmqDnnw7HuiD+BWmjnuUL2+23H4Jj0pLD4=
X-Google-Smtp-Source: AA0mqf6jM6EwTnIln7Mw1I4Yy0xUkIKvGYtO65UY6uUFY6THGY/zrS6Jod3OnhYlmtiakQS8bRRPOZ3llok9UVJDdGE=
X-Received: by 2002:a37:f504:0:b0:6cf:5fa1:15f8 with SMTP id
 l4-20020a37f504000000b006cf5fa115f8mr50253452qkk.748.1669723233162; Tue, 29
 Nov 2022 04:00:33 -0800 (PST)
MIME-Version: 1.0
References: <20221128214408.165726-1-hdegoede@redhat.com> <20221128214408.165726-4-hdegoede@redhat.com>
 <CAHp75VcJJtYsxbAYt2FjqSEJGhjpok7Dsh3vp46VyOm3=5_2FQ@mail.gmail.com> <007a6345-62e7-20ee-1a48-4adb4a9fa9df@redhat.com>
In-Reply-To: <007a6345-62e7-20ee-1a48-4adb4a9fa9df@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 29 Nov 2022 13:59:57 +0200
Message-ID: <CAHp75VdxRbFmqUzjmMbtmh1tDGMXre+A+2u-hz5H3HSLEBX+OQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] gpio: tps68470: Add support for the indicator LED outputs
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 29, 2022 at 1:32 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 11/29/22 11:28, Andy Shevchenko wrote:
> > On Mon, Nov 28, 2022 at 11:44 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> The tps68470 has support for 2 indicator LED outputs called
> >> ileda and iledb, at support for these as GPIO pins 10 + 11.
> >
> > add ?
>
> This models ileda and iledb outputs *as* GPIO pins 10 + 11
> on the linux gpiochip.
>
> But yes it also adds gpio pins 10 + 11 to the gpiochip, so
> either one works I guess :)

I had to be a bit more precise. 'at support'?! Perhaps it should be
'add support'?

...

> >> +static void tps68470_gpio_get_reg_and_mask(bool get, unsigned int offset,
> >> +                                          unsigned int *reg, int *mask)
> >
> > Hmm... Usual way is to put the get/set flag at the end of the list of
> > parameters.
>
> For functions returning values by reference I always follow the
> pattern of input parameters first, then output parameters.
>
> > Also why not naming it as 'dir' to avoid confusion with the _get in
> > the function name?
>
> Because dir is meaningless without an enum to to define what a dir
> of 0/false means. Where as get is clear without such an enum.
> get is set to true when this function is called from
> tps68470_gpio_get() and false when it is called from
> tps68470_gpio_set(). It does not get more straight forward then that.

But it's about the buffer (in hw sense) to read value from. What about
naming it out_or_in?

-- 
With Best Regards,
Andy Shevchenko
