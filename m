Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFFE23F4304
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Aug 2021 03:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234779AbhHWB0a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 22 Aug 2021 21:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234566AbhHWB03 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 22 Aug 2021 21:26:29 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 909B4C061575
        for <linux-gpio@vger.kernel.org>; Sun, 22 Aug 2021 18:25:47 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a25so6797189ejv.6
        for <linux-gpio@vger.kernel.org>; Sun, 22 Aug 2021 18:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QqpWK2NpNMam+FVrnd5Qq4UQdG4vZMylCROkJYXdu6w=;
        b=mtHYLDxx+doZhDcK8JqpU0r2bgFOmLiQYIGB6kkMOuslrKGLPdnXfhACq0msmAHHqV
         wUSGl/V1rpTV5MzKxsKUzcrWv90OZg2d6Aq43ZEbaM8j9WbxaUhk5Cg/HfMf0OjgUaTk
         RPcOo7irbUFOg9p/PFpYoxcXZI2xfBc0qYsU+Rs8jtG6wsktBqgyfJFiKtstXvDcXvGl
         6BryYhWCifc74SPcD/Xrl5U0CwwvfWaze1TRdwesoE2CjUli9pDLPvhrD03LgyIrobpk
         myi2pB7Bv5gkYlxhrXSia6dWyqf/PfYY76vmH16/gcxECjrohJ+cUinGWq4XUNZbUs87
         oquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QqpWK2NpNMam+FVrnd5Qq4UQdG4vZMylCROkJYXdu6w=;
        b=BFOSXgvSLZw7EIhYpW6PjkDJDC/Z9NyqCcmKUDYebOwF6AQAqj9LxDCMVDXecApMG9
         XEt+Myv09Mz5uNlOpnQ4VLdhErRneC7cMOi8eKBUM3nWfmr8599lVsurIDezlphhj2N/
         2qDC2rJ3gMGoemrE3ZaYz7divzWOZgaar4bPokTQKzW5z9lxmDK1YP9sLN9r+sCQqsdm
         p81q4JTUJTpOni63MmL+4zUe3N85HZalmHHo6NkH1KZO846NG8ntqNc9m63obc9y6FBx
         0iXmUCGdQ0jASNni9Yg2TJqzK/tC1RuDYH3FSFzH4HKHyx1HxzQLXv7X+b4uHnFF5tW1
         /Hlg==
X-Gm-Message-State: AOAM5304aJAoCnmksHNAUkP14z9hKYEkZ3HxyldnqhG49SXNDwszq80O
        T07g0Omd9txwRGslnq3KywtppaaHjk9j9VONtH1Oqw==
X-Google-Smtp-Source: ABdhPJy/0sXtHHmKiUqDX9OM8jGFwko/lR4cRRRmI4r2eEOY/cer4itLJuSzsZZTroiumuKovs5s5IlI725zYJ9AWMo=
X-Received: by 2002:a17:906:b25a:: with SMTP id ce26mr1436524ejb.174.1629681946141;
 Sun, 22 Aug 2021 18:25:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210329015938.20316-1-brad@pensando.io> <20210329015938.20316-4-brad@pensando.io>
 <CAHp75VfmSKVRB+Rm+sWDjZaJwdX4qt56Qj6aehe4YnA5d6+a6Q@mail.gmail.com>
In-Reply-To: <CAHp75VfmSKVRB+Rm+sWDjZaJwdX4qt56Qj6aehe4YnA5d6+a6Q@mail.gmail.com>
From:   Brad Larson <brad@pensando.io>
Date:   Sun, 22 Aug 2021 18:25:35 -0700
Message-ID: <CAK9rFnzdPpVBZu8uxHU04pak9OxPMjFqAt_qnPQY2qK2WK4rTQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/13] spi: dw: Add support for Pensando Elba SoC SPI
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Mon, Mar 29, 2021 at 3:43 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Mar 29, 2021 at 5:01 AM Brad Larson <brad@pensando.io> wrote:
> >
> > The Pensando Elba SoC uses a GPIO based chip select
> > for two DW SPI busses with each bus having two
> > chip selects.
...
> > +static void dw_spi_elba_set_cs(struct spi_device *spi, bool enable)
> > +{
> > +       struct dw_spi *dws = spi_master_get_devdata(spi->master);
> > +
> > +       if (!enable) {
>
> Can you use positive conditional?

This function has been re-written to use the existing dw_spi_set_cs().
This is what I currently plan for the v3 patchset.

static void dw_spi_elba_set_cs(struct spi_device *spi, bool enable)
{
        spi->chip_select = 0;
        dw_spi_set_cs(spi, enable);
}

Regards,
Brad
