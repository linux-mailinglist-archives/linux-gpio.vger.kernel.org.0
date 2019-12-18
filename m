Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF5981248EB
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 15:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727217AbfLROBy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 09:01:54 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:38641 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727211AbfLROBy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Dec 2019 09:01:54 -0500
Received: by mail-vs1-f65.google.com with SMTP id v12so1434292vsv.5
        for <linux-gpio@vger.kernel.org>; Wed, 18 Dec 2019 06:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nWpZ8hAd7FUovUz3VnEeC9jKUVwXFStq4OLlcUe32fk=;
        b=tVAIlo8SBCEWTUL6sbCZVxY5xl1m14gicgIkuld11jK7G5ONmMleDzHNwIK33DUi70
         cDk/Y7PgO0/R6yhq9tXzGNeXH4Q1M0Ajamh5wxpIPfCDcbCDgcLD+Djq15Dl72Ad0k9z
         CLmEBpXHiEQjd/SzN4W4f9JIPcclme1w1+YgVTL8QY7czFHk2tn9I27FU2xBoKSid3wb
         TxVYK/9aj9dD+ZjTG7IXhPPoO99FTRYhGBYdTMEcj+VE4lYTQn1gtCYRSdf2P49X68kx
         9f0rXjru96p+slgnvel8TE/JtCATu38U6xMPWipb6hM1LLjo89QNsPF3xC3YVQ2PwSGP
         K+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nWpZ8hAd7FUovUz3VnEeC9jKUVwXFStq4OLlcUe32fk=;
        b=juxhBqhTHHs4j7EWTijCmQtX2+XCSNiCvXNzxtQk4aKMIda4mwQKVg/PI/cQ6s8EEt
         i7bhXjenC0iWfi+hTOpB1muyUvXpZCHimrXQjr11pQsNhJWDFy5P/p8IOA7vzOCByNE8
         4nck9KuA6yd1rthE0N7CIDW+vOo6m6DFiGehKRlj74FCBBltV9+wWUP+mNjP4ZXXH3Uv
         ccwe/eVV7zjZUjAR1pMVhnZ2IdG5YiyfViXv1JW5arfuf7kDp+cj6rywbiUEEAXnKJsd
         rFyqGYK2gehy6kdJjeTT8o/aXrd5+1ZYVJUCN6KvDJrGSu3wkSX9z4VefS4kAO424hIm
         saGg==
X-Gm-Message-State: APjAAAVRAGXvfpjORdONotMjjq4CMJu4Fu6P5x+Vb1Y+ksCHzw2yBsf/
        IELV3fpnWNqr5NweoDFw8S2K7mws2xa5MqorcJrYEw==
X-Google-Smtp-Source: APXvYqzkFH1g+PqryFVGtuG+lac1yFJaK7FtgFUUP582cfTjMgRsbmSAikWTkyPuUzV8Z+ThYeg5wJ031sxAgsbSxkM=
X-Received: by 2002:a67:ff82:: with SMTP id v2mr1450518vsq.35.1576677713314;
 Wed, 18 Dec 2019 06:01:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576031636.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1576031636.git.mirq-linux@rere.qmqm.pl>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 18 Dec 2019 15:01:17 +0100
Message-ID: <CAPDyKFp62ZVzNeReNmk3NWeqjWVoOVFj9BYQza9nU=E-iDvvVg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] mmc: simplify WP/CD GPIO handling
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 11 Dec 2019 at 03:40, Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qm=
qm.pl> wrote:
>
> This series removes convoluted handling of inverted CD and WP lines in
> SD/MMC host drivers when using GPIOs.
>
> First patch adds an API: gpiod_toggle_active_low() that switches line
> inversion flag in the gpiod structure. Next two patches modify MMC
> host's WP and CD initialization to apply all the inversions onto
> gpiod's active-low flag. Final patch removes now-unused argument from
> init functions.
>
> x86 allyesconfig build-tested.
>
> v2: move argument removal in sdhci-esdhc-imx.c to last patch
>
> Micha=C5=82 Miros=C5=82aw (4):
>   gpio: add gpiod_toggle_active_low()
>   mmc: rework wp-gpio handling
>   mmc: rework cd-gpio handling
>   mmc: remove mmc_gpiod_request_*(invert_gpio)
>
>  drivers/gpio/gpiolib-of.c          | 21 -------------------
>  drivers/gpio/gpiolib.c             | 11 ++++++++++
>  drivers/mmc/core/host.c            | 33 ++++++++----------------------
>  drivers/mmc/core/slot-gpio.c       | 31 ++++++++++------------------
>  drivers/mmc/host/davinci_mmc.c     |  4 ++--
>  drivers/mmc/host/mmc_spi.c         |  4 ++--
>  drivers/mmc/host/mmci.c            |  4 ++--
>  drivers/mmc/host/pxamci.c          | 12 +++++------
>  drivers/mmc/host/s3cmci.c          |  4 ++--
>  drivers/mmc/host/sdhci-acpi.c      |  2 +-
>  drivers/mmc/host/sdhci-esdhc-imx.c | 15 +++++++-------
>  drivers/mmc/host/sdhci-pci-core.c  |  4 ++--
>  drivers/mmc/host/sdhci-sirf.c      |  2 +-
>  drivers/mmc/host/sdhci-spear.c     |  2 +-
>  drivers/mmc/host/tmio_mmc_core.c   |  2 +-
>  include/linux/gpio/consumer.h      |  7 +++++++
>  include/linux/mmc/slot-gpio.h      |  5 ++---
>  17 files changed, 67 insertions(+), 96 deletions(-)
>

Applied for next, thanks!

Kind regards
Uffe
