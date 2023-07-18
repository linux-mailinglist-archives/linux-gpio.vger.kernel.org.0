Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7572A75848A
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jul 2023 20:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbjGRSVD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jul 2023 14:21:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjGRSVD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jul 2023 14:21:03 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C924DA
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jul 2023 11:21:02 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-4468a772490so1887672137.3
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jul 2023 11:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689704461; x=1692296461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrugx7KI1EVrxuOX8UYknjbUTHEed/rOAZZDAg45sNo=;
        b=fONXT3gIOLqAdNT92yIJWsaEBJcCpfqrLAh5LfKVz021q3iNnvd/wVAZkPJeoy1pVt
         gsdn/7BsjQq697y5LFuu5ZqujTCqQguuMn+SbGekSpPKBWA3HpHWsCTbEKS2PKMNR9zb
         4YxrXizTL07CZyQT567urzA4KNJbskptw6KU0eMFzcrrK7Ijbzyr5FT3JnzfX+m9q3ym
         HiN1fzTimyZ1r55CdZ4wtrrEm2+poVc6QX96mQxi8vbSR2Gn6AHNnVduwW9+V2L3abzE
         PwaNfD5oQca/3hzec+w+dZQl70ajhAWkW7migjR08rPyo1zh0jjim6Gpk7y++PZm2fKt
         3gwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689704461; x=1692296461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrugx7KI1EVrxuOX8UYknjbUTHEed/rOAZZDAg45sNo=;
        b=K9QZA2RygXG7RpAdNryGvZFWBlEk5jYJbxBMrQfQXHU5j03g7iw5URQRBAORKIRTzh
         nFwob6WmTHQHo/sPg8/rxSMtT9TmHvhKVdSTiOO7Ft22M4Xsb2u6LDdouDFLoKreiK+/
         5hIKJSJFB8SAN7uXp2mFAfvMxUJ5z1X3A43PfUKHkkwZ5FplF9I6hT3IcnjIPsTXz9VB
         F7XO7Ixv28pMWwYEriySqW6I22FCWtpBNJB5ez4XiEWAUEjf0fqpL8+kExu/neXs+o+G
         Z3/UQNhrLFPtM+iw9C4VVZzXQiWUM7D8rSCqE+47iH+Od2LZ/w6lQAU0c10lVkYIy3gG
         7ciA==
X-Gm-Message-State: ABy/qLZWxRrJhH8Z8saY+gMjre1p8ukzYo4tX1VugCi4IBoAxPf4g2ZT
        wIwyqYtvYhtleBAv/pE8SB6XA4vJGvet+IaWLUCXPQ==
X-Google-Smtp-Source: APBJJlHcXlOqL3+TOAeF7hpsjENS1RHB+L4LNghHklUSMuVl3b39D6vUyvUy6A8isCrU1weyrGbAfYlpi8FAmOpY5SU=
X-Received: by 2002:a05:6102:24b:b0:443:73ac:896d with SMTP id
 a11-20020a056102024b00b0044373ac896dmr6866028vsq.27.1689704461617; Tue, 18
 Jul 2023 11:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230711151248.4750-1-asmaa@nvidia.com>
In-Reply-To: <20230711151248.4750-1-asmaa@nvidia.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 18 Jul 2023 20:20:50 +0200
Message-ID: <CAMRc=McCwXeJpKuvHY4aheURimqh3ZznvVXKxsV2HzeT0=QYGQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpio: mmio: handle "ngpios" properly in bgpio_init()
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     andy.shevchenko@gmail.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, davthompson@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 11, 2023 at 5:13=E2=80=AFPM Asmaa Mnebhi <asmaa@nvidia.com> wro=
te:
>
> bgpio_init() uses "sz" argument to populate ngpio, which is not
> accurate. Instead, read the "ngpios" property from the DT and if it
> doesn't exist, use the "sz" argument. With this change, drivers no
> longer need to overwrite the ngpio variable after calling bgpio_init().
>
> If the "ngpios" property is specified, bgpio_bits is calculated
> as the round up value of ngpio. At the moment, the only requirement
> specified is that the round up value must be a multiple of 8 but
> it should also be a power of 2 because we provide accessors based
> on the bank size in bgpio_setup_accessors().
>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---

I'm confused. Is this the final version after all?

Bart
