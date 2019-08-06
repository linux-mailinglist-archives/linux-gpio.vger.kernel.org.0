Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6A383216
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2019 15:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729898AbfHFNEs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Aug 2019 09:04:48 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38576 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728560AbfHFNEs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Aug 2019 09:04:48 -0400
Received: by mail-lj1-f196.google.com with SMTP id r9so82176246ljg.5
        for <linux-gpio@vger.kernel.org>; Tue, 06 Aug 2019 06:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VSP7ertTaGliFxnzQE6UZ8P7kDdh7xHsv7HJAdC4s/g=;
        b=hJ09HMiyWFDdzVON9hsczrI8lwxd4BGK2p5ZiM1qSz3r2CZVJt698v4TipIfzs08xp
         FRm/+H/QMELlqo3dO2vQM+p2Hctehj6MpcypAFq7HAg8Igvdx5GmcdiFrUPMYboPigjG
         bLwFEk1sKaAvqez/V1NxBL1JD9KDxGbupOQqk2UjBlKsGcg0EbDtzIIF8l6pNIbOqCds
         iUJsDD57mZEb/MmCL6F9Go8fYRk+NiY8xsUkpULQXTMdis/OO7s5Kayr5Km80/pYxEVW
         I4HrSaKNu1id/oWV9R0gLzaRt4zhprNKaWIFA7WSEAZu7dCHiqJdR5cTW5Mq7ZKPn+RO
         yKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VSP7ertTaGliFxnzQE6UZ8P7kDdh7xHsv7HJAdC4s/g=;
        b=jjy7bJr47Me9BTQulfMfLtV7WMXV4tJw7AIUQwZWJ4U+V38JgrLlLcdINVfTNO+tvb
         jG+4IxwUV2kTXl+DIa+mvP7KcYb5FtuvT55oqgQXYUKV//JiO8MiSBTIAOoqJoSg1FTI
         atuUsJ3m7wdAUrpp+iUXL9HD/QBI3Br0TSxplBPuDpj/pAKNd8v1l5mmnRSQUhBGf9ey
         yxSGVTtv7tJ8MUTf5VenUFR1KeNjUmpbmrswGuGcZxnAodoQmlMkNgBiGceb658dwzwQ
         4Kf1xfi9sxGG20Bdc2ufzVgU5809LAkBehtwIZVx0/Yg9dhl0r2vpd8kJecGTUf2ydx0
         4V9Q==
X-Gm-Message-State: APjAAAUlk1AJkXvnOqfEiLqOKspFWSYtXBsgyc97jBp3brXdV8ifOh9q
        NCS+hZRrYVKxIxTGyL7uDaCs1KtBNAG0VOjYxBHORA==
X-Google-Smtp-Source: APXvYqz7NqTp54GWvw+RS4Sq+oN/CGJLpirazWc5j1osUTFej5ZizfAcNEnwUaljPcS/O8sXI0XIjz6KzmkCh13Z0NY=
X-Received: by 2002:a2e:9048:: with SMTP id n8mr1761330ljg.37.1565096686312;
 Tue, 06 Aug 2019 06:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190803133436.15016-1-rfried.dev@gmail.com>
In-Reply-To: <20190803133436.15016-1-rfried.dev@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 6 Aug 2019 15:04:34 +0200
Message-ID: <CACRpkdYEdQdk62bWJ2=i2Mbvpz3kwL=9bnMoxksFsTgAHRh68w@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Take MUX usage into account
To:     Ramon Fried <rfried.dev@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Aug 3, 2019 at 3:34 PM Ramon Fried <rfried.dev@gmail.com> wrote:

> From: Stefan Wahren <stefan.wahren@i2se.com>
>
> The user space like gpioinfo only see the GPIO usage but not the
> MUX usage (e.g. I2C or SPI usage) of a pin. As a user we want to know which
> pin is free/safe to use. So take the MUX usage of strict pinmux controllers
> into account to get a more realistic view for ioctl GPIO_GET_LINEINFO_IOCTL.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> Tested-By: Ramon Fried <rfried.dev@gmail.com>
> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> ---
> Sending Stefan's RFC as patch, as I tested it and it seems to work,
> additionally, an accompanying fix was made by me to gpiolibd to fix a
> display error of the actual result:
> https://patchwork.ozlabs.org/patch/1139923/

This is mostly fine, some style nits so I fixed it up when
applying.

Yours,
Linus Walleij
