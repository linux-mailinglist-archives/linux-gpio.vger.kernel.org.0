Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 094C96B0433
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Mar 2023 11:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbjCHK2P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Mar 2023 05:28:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbjCHK2N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Mar 2023 05:28:13 -0500
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCCC818AB9
        for <linux-gpio@vger.kernel.org>; Wed,  8 Mar 2023 02:28:02 -0800 (PST)
Received: by mail-ua1-x933.google.com with SMTP id n4so10835557ual.13
        for <linux-gpio@vger.kernel.org>; Wed, 08 Mar 2023 02:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678271282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2H34LSs9luC8X2nYjKB2UbV+PWLUKH/eRRQbVVLaZs=;
        b=kDnaNqwoDaoMIJq3D2LxVEKc+snL+50VUTXKeaqTOIoXTMSqFVMMse0I39ZhPIcDzc
         mB0IqYj4ysI443lmVx7rR64JJ5rWNRumOb1Sy8mBZvASWwDvE2wQvJsL7/W6WvVcDpT8
         P6WBVn6WUZ1FdJriCf/Hq2b9uT9Lqcd2yDp4hlSlIDM9Ho+fm5JU8rjdghmMVAhvCNr4
         o+tiNgHAikFSpP3LgW49DRlSmd1fULUJwPPDt9Dt72365WYd/9EekAjQ0lpMWrxI/2pB
         PfY4YnS5q+Vzo3mN4nhpsA2ScTSG/keooALILajMvXpPMtEkDBr7DsXijqP5OG/s8zKN
         VmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678271282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w2H34LSs9luC8X2nYjKB2UbV+PWLUKH/eRRQbVVLaZs=;
        b=WaHqZDE9Zb12Xr4M/zXyLSUGlarXgyMdlB4WgK0aDYMNoQGFMZZbKB88F4fHV5O0Yn
         XEZIaqWilxOEJ6Mhc+qAgOF1j5b7PgZPem/XOcVhpqI5d/tsJq71m0V82ZuODxklaFB9
         rMilxmFLs6Ee5+X5cF0FRFhdWWoza0NfzxN03FRNllDln9IIg93XBpuz9N8URR3Fc0LA
         T561HXtNPAFGm4DWDecqfdth3kS3fOYkcPSEd6OhEpJukec6WrgOk04S3hA/OUNdFVKU
         1qhMFDB0hILUB6ZzfP0KwJpiniMHPv2NPXqSthOOzZ5zNW6sjZHg/rK+VJ7fSDT4n4Pu
         4y/g==
X-Gm-Message-State: AO0yUKXeRnt119GPaC6ILnEe0BG6UoSzE6O5RXQR366q8SkK/K2MOBG/
        HBT6oSdeqqf2uWkf5tGEJk0wBNju1ZFnRzpZHgKAGw==
X-Google-Smtp-Source: AK7set93pHJp55WrjJJbOce1lxNN/L0Rpv+yTU3C/ZyXzLBWI8m14MDoTvphEluEd4D59Xbb+8bjpDcFj1/QMFplqlM=
X-Received: by 2002:ab0:5402:0:b0:688:d612:2024 with SMTP id
 n2-20020ab05402000000b00688d6122024mr11684729uaa.2.1678271281802; Wed, 08 Mar
 2023 02:28:01 -0800 (PST)
MIME-Version: 1.0
References: <20230307165432.25484-1-afd@ti.com> <20230307165432.25484-4-afd@ti.com>
 <ZAd35D4C96MP5Qrm@smile.fi.intel.com> <b6e4ae3f-a3ff-b118-43ce-a45d007ae2e9@ti.com>
In-Reply-To: <b6e4ae3f-a3ff-b118-43ce-a45d007ae2e9@ti.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 8 Mar 2023 11:27:50 +0100
Message-ID: <CAMRc=McBp6DQvYTQXwC8hNjpcuOe_TAnj4S__Q79b6wjgYkK8g@mail.gmail.com>
Subject: Re: [PATCH 4/6] gpio: pisosr: Use devm_gpiochip_add_data() to
 simplify remove path
To:     Andrew Davis <afd@ti.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Peter Tyser <ptyser@xes-inc.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 7, 2023 at 6:55=E2=80=AFPM Andrew Davis <afd@ti.com> wrote:
>
> On 3/7/23 11:44 AM, Andy Shevchenko wrote:
> > On Tue, Mar 07, 2023 at 10:54:30AM -0600, Andrew Davis wrote:
> >> Use devm version of gpiochip add function to handle removal for us.
> >>
> >> While here update copyright and module author.
> >
> > ...
> >
> >> -    mutex_destroy(&gpio->lock);
> >
> > You need to wrap this into devm.
> >
>
> I was thinking that but it seems there is no such thing. Most drivers
> just ignore unwinding mutex_init() since it doesn't allocate anything.
>
> mutex_destroy() is a NOP unless you are doing DEBUG builds were
> it sets a magic value to check for use-after-free issues.
>
> Andrew

And this is precisely why it's useful to destroy it. :)

Bart
