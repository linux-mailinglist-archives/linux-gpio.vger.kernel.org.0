Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF7F32E380
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Mar 2021 09:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbhCEITE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Mar 2021 03:19:04 -0500
Received: from mail-vs1-f49.google.com ([209.85.217.49]:42196 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbhCEISm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Mar 2021 03:18:42 -0500
Received: by mail-vs1-f49.google.com with SMTP id v123so516912vsv.9;
        Fri, 05 Mar 2021 00:18:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=frr7Psk12tIGcsSy5WyVmhf8hp/xoH8Q3T4PKTXrUQk=;
        b=dVCfmAUxzYomVehH2FxWJEVX2HU4QlG/U6/kfsOwLiH89A9BnWy2q2gSBOqTmMltwp
         7m+ijDL9Z6AB4Lr3ROeKeay3te/W5KRjF8fODrx582onNnq/SBwGUWMOcZEyPgG/xkFY
         ILNn6r6+rEjgQCnkQBTaDk51VOl6ELKdGu7KlcqxkRTxaNrTFWsLMIHEzEO/qgP/4f0h
         ZumdMLg1Ga75uXD62jItVfIejvfg5Tz8ZFMCj//XjqwBKaBYeuatualAHQgDDFBa1epW
         Li3ppCIY7DX7ljHCtCvb9trhGkdvheEedr2FMun3piMpNjn6pUmXilrry8ktCrETWssg
         ofEg==
X-Gm-Message-State: AOAM531k0zQjfl5jOxdjCMWptqHUSnr+U55Td6zRrT41FdunK6ZV/f85
        9AOI9+VTXt1b0wcMMnfJNdEsZPAqWlJ7NVXt1Bs=
X-Google-Smtp-Source: ABdhPJwKfU7R7aWmEg3CAwHGuD6dBu+OYpEsCFW5WA2UBAw++9ZFIh1wyqQcV4Pr8HpON5jmfjjdulJRUJODYW45Ih4=
X-Received: by 2002:a05:6102:2403:: with SMTP id j3mr5023007vsi.40.1614932321174;
 Fri, 05 Mar 2021 00:18:41 -0800 (PST)
MIME-Version: 1.0
References: <20210304102452.21726-1-brgl@bgdev.pl> <20210304102452.21726-9-brgl@bgdev.pl>
In-Reply-To: <20210304102452.21726-9-brgl@bgdev.pl>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 5 Mar 2021 09:18:30 +0100
Message-ID: <CAMuHMdXRK5=w1-Z=EbM60Sf2bLY1EiVaxbZjMP+XyQ3g7nBpZw@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] drivers: export device_is_bound()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

CC Greg

On Thu, Mar 4, 2021 at 11:30 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Export the symbol for device_is_bound() so that we can use it in gpio-sim
> to check if the simulated GPIO chip is bound before fetching its driver
> data from configfs callbacks in order to retrieve the name of the GPIO
> chip device.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/base/dd.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 9179825ff646..c62c02e3490a 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -353,6 +353,7 @@ bool device_is_bound(struct device *dev)
>  {
>         return dev->p && klist_node_attached(&dev->p->knode_driver);
>  }
> +EXPORT_SYMBOL_GPL(device_is_bound);
>
>  static void driver_bound(struct device *dev)
>  {
> --
> 2.29.1
