Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A51CD519179
	for <lists+linux-gpio@lfdr.de>; Wed,  4 May 2022 00:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238959AbiECWh1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 May 2022 18:37:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbiECWh1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 May 2022 18:37:27 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A35D44132F
        for <linux-gpio@vger.kernel.org>; Tue,  3 May 2022 15:33:53 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-2f7bb893309so195216697b3.12
        for <linux-gpio@vger.kernel.org>; Tue, 03 May 2022 15:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uHut9YTrq2rx909OxaomvrduIodDXBJREhUsJ7gIxo4=;
        b=hXw0mh/H9RVgiFFjARa0v1GhKnq+y7KOBH+SMzmD+jJHJPxqFbmAjLw44EUnWTlexo
         OT0DBYILHRuOVkVDqeGe3VdpPn1pnFCZZQ6Ht8ImVXmtDuEdIuvAQuWdMOhdTN98buxo
         eMej7ebiqNGbdgamtw1uwq0DkWsau3CkiMBCdBQMhY/C3RM/i8cKJ1BghPze4rsbw+j5
         7e3ur99s8qxtCKbawZFWmTnl/6qaRhINIhdEIFDjdEDfZVOhAATvpMaxN6UJpO9UCNeS
         5SZvxe9GIjqMnTLbI26TBJWnmfNuWbpWLEjRZGM6wxD4Rg0fiBwKPNyxqmgNWXFo6e9Q
         r+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uHut9YTrq2rx909OxaomvrduIodDXBJREhUsJ7gIxo4=;
        b=3WCGf3xDA6OrH85riUWeHwC4Gd56Msf4yP2l8Q6yBthmBIbj6pInFer3bmrEjogxjU
         RB5aN08+VRpptABlv80VoXoSbHvXvjRAbK8W2EkwZCWQIsdZEGc59GFQhwpHAT/La1xs
         7nf3hqlYpnI/+uoXV8oNb4pdfQ4A04z1lXrxZGu0QKxxEcx1n3HPcDOTAzGYqbMRR/y5
         5IJ4IjXgHIdDjJ7WDZKzTJNlTlrUYV3HoyiDcOMw8RGAXepRkFuKwcs1/1ftHs3MWGhT
         rLIKC6zdPcfmrHeTXQ0XJtJFkTKtnMjzLT6NbFTkWA9S368nQMfNy9Z3nMkXzeaibRmg
         J+JQ==
X-Gm-Message-State: AOAM530uJ18FoYuX9f+6Q69nkjEtDrVt1SQ33UE8LSd3GJUv+0rmJqKX
        IjCzNC1MlnumSVAjD2e2p1yYhhnAmIelVGQL5WHIWQ42oII=
X-Google-Smtp-Source: ABdhPJyPQ6HtBXvpmbbSdXZpDlXtIN1SEd1fXA/kBCV99YaE4V11y/NlUXgYCYwKO+9J1ENVq38VzprhArgyobg937M=
X-Received: by 2002:a0d:e612:0:b0:2fb:103f:4067 with SMTP id
 p18-20020a0de612000000b002fb103f4067mr39820ywe.151.1651617232916; Tue, 03 May
 2022 15:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220502093416.22744-1-brgl@bgdev.pl>
In-Reply-To: <20220502093416.22744-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 4 May 2022 00:33:41 +0200
Message-ID: <CACRpkdaPyPcQFF8JDUmGNi0ERN569d2Z79F0JR4de7SJfR9GJA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update the GPIO git tree entry
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>
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

On Mon, May 2, 2022 at 11:34 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> My git tree has become the de facto main GPIO tree. Update the
> MAINTAINERS file to reflect that.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Reported-by: Baruch Siach <baruch@tkos.co.il>

Thanks for taking it over!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
