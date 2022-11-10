Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8F45623F24
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Nov 2022 10:56:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbiKJJ4C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Nov 2022 04:56:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbiKJJ4B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Nov 2022 04:56:01 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BAFE6A69E
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 01:56:00 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id s12so2261860edd.5
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 01:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4wCbGbG0XrM7w+kv06NzA1NFafEK5Ay6mvkAvG1Irbo=;
        b=wH0+X7HAiEfoTPv/cw0MpQw/nGK3BOONgJJGDPsOpJJBYFCb5nhi4/3MV0/74sWmNR
         seBrReKYDAvE0bHF7mWQwWuLNyjK7aRc/88d8iBD9IO6v9X1sv1XQqe7M0kX00uJqp/q
         O90fB1SLHC8VK0y3ISgKAJlaA98ymYoVgPBrP4jo6J9GpzABWVeMy8CCuWpupxy8KGrf
         0BchaO/gbEMey9UDXRjfIZwbUN66eJIxTD0KBUQO9w4b1PCGOeYTUHa+QACtmeT6uAuq
         Ycr25cmLknBXJHEOZqDGq16wxDpZyae+vS+7wNiRpcNh2Z2Kk/8bCoatWmfu1HzJg6IE
         sRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4wCbGbG0XrM7w+kv06NzA1NFafEK5Ay6mvkAvG1Irbo=;
        b=eo1nwz/3OMh5Qb3qV45kEE5D2fCKQFPquCgPMztPJ9OqeulY+EQ7RqsLQdUBzphW0m
         huQUih0SPskzePJypMwrpi2fYp7Zw9tPyRnsR/G9NkOmEoL+/wpLhDmuDPs39Qh967G7
         5amw3hh3eE5Yndf4XovrQCJCbEukgVqYW1BriiciI5h1TzZ0hn4ZJLacyrFsJpnn4+Yy
         40QdrfVL03Bn29YBmCErsrjagl3N5h4+4oSTgzhd47sDIKL2ud1pbym64u9pzLeDZnBO
         iW0S8IvOGpSejn95JJuVrHX16mkvkaNX9h3+V345x0+DbyZYwHUNxo5Qi9dv6S324JMj
         0JCw==
X-Gm-Message-State: ACrzQf3o4N3LVaC/HYT0P+8ZZioTRmtgPRogmrEVWA6sl2qVpnWylZlN
        5NesV67KtgJAhAkYLiacFJRPX4n39os9Z2qYWUs2U77OF3Y=
X-Google-Smtp-Source: AMsMyM5cZ/UkzRZNR3jouDrvuXtMOeMkxDWyOAf+CSmF1OJ1+U7ARWviY9UBVXAY3JWyIYDxgHO9F9zkSR+Sm4i2KmU=
X-Received: by 2002:aa7:c718:0:b0:462:ff35:95dc with SMTP id
 i24-20020aa7c718000000b00462ff3595dcmr61167568edq.32.1668074158763; Thu, 10
 Nov 2022 01:55:58 -0800 (PST)
MIME-Version: 1.0
References: <20221109155724.42354-1-andriy.shevchenko@linux.intel.com> <Y2vQgdzBl+MvoqQM@smile.fi.intel.com>
In-Reply-To: <Y2vQgdzBl+MvoqQM@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 10 Nov 2022 10:55:47 +0100
Message-ID: <CACRpkda=vhL_LKU1BjOBkJKPuFe5YOX8cAPpzU8SaRKRw1fq-Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: Move for_each_maps() to namespace and
 hide iterator inside
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 9, 2022 at 5:08 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, Nov 09, 2022 at 05:57:24PM +0200, Andy Shevchenko wrote:
> > First of all, while for_each_maps() is private to pin control subsystem
> > it's still better to have it put into a namespace.
> >
> > Besides that, users are not relying on iterator variable, so hide it
> > inside for-loop.
>
> ...
>
> > +#define for_each_pin_map(_maps_node_, _map_)                                         \
> > +     list_for_each_entry(_maps_node_, &pinctrl_maps, node)                           \
> > +             for (unsigned int __i = 0;                                              \
>
> > +                  _map_ = &_maps_node_->maps[__i], __i < _maps_node_->num_maps;      \
>
> Hmm... I think this is actually not okay, if we have maps be NULL and
> num_maps = 0, KABOOM is guaranteed.
>
> I will experiment and update this.

OK

> Meanwhile, Linus, do you think this change is useful?

Even if just a name change, it makes things better by being more
readable so yes :)

Yours,
Linus Walleij
