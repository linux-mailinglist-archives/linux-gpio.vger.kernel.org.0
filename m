Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05757FADAD
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 10:54:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbfKMJyv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 04:54:51 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42178 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbfKMJyv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 04:54:51 -0500
Received: by mail-lf1-f67.google.com with SMTP id z12so1406917lfj.9
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2019 01:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dv9PErOjQWP4MBTFjfzSVHBEyXy1w32qea4Oz46T0bI=;
        b=DsqlNcMOUEMPbHnz8UC8FCoIgRp5xN0qvT6QkpgJQCyZyPZ70X2pC4aZDWRz4ldj51
         u3L4nerBpVGPAmTTN1KYDVD5DJI/6kZXGTdErnJ+KPAfTc26I4GTYpl96a821u2LJnAb
         uhjgxUUmZzjAjtPyH/76yjpIB8q3SsK9zQZCo+MNB6OwT8pL2XzBcG1R9WlK2BdJL/NB
         oLtkFK4A2cx8+9aavpWqHXHikSjk5XFaQmMMDaDpRpZuc5w+JYw713NbpG0i/OaaCSsa
         3V/WsgdSCAOEZx9tiVBhFEKXgy+nxQNkQJieMmKVvJfZFEPVP3HSgdHDEqoRIRVPGb4/
         a/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dv9PErOjQWP4MBTFjfzSVHBEyXy1w32qea4Oz46T0bI=;
        b=YrLw611GzKTG22PqmcSncDeEOushmPfiqZRlG86EUGVJ3l9gyhJzMILbc1HWGefAA6
         covHA2LHzqov56ayRr3LFibhDvbumLZ9JMsWwIIOunVPHR3Fxcx7E3PoJuB6X3IKpR7G
         9DNvvWw5kFZiumWD3yMlzgG2oO5XhTP1s2+i7WL/aK1rQhpdqhOTvTwDYAxZ4k60ziVU
         URFNCYwrLlayBMYey4+sicoa/FxJUxUHv0tYyCojugZ2RXlU9xcTguGpihqAdPSFijfC
         xMKCuXKhb/eFXSci0b2iAIMSDHk6rOkMdmUnmWL0TF8P6QSccqGcozn2MR2H7EBR/v7H
         Ejbw==
X-Gm-Message-State: APjAAAWcRqt0yH2C54VZo/48JQB8PTqFkFRJxmtXvuU9OBV+mMGn/Ybb
        zOhjd4K13S6QgzWmCRF1qWbW1QvnpUzqUwTkAwgEyg==
X-Google-Smtp-Source: APXvYqwTT4zO0ABQb2IuuaUjdJVhY2+UY7092FU6feNE8zD6YbO1sNMa6L3wzjSDSCZWWZFP7LHXoCyFkFsYEcBjdv4=
X-Received: by 2002:ac2:51dd:: with SMTP id u29mr2055974lfm.135.1573638889394;
 Wed, 13 Nov 2019 01:54:49 -0800 (PST)
MIME-Version: 1.0
References: <20191106144829.32275-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20191106144829.32275-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 13 Nov 2019 10:54:36 +0100
Message-ID: <CACRpkdZ39j=Ld4WW0JRv0XCdNqXVD+Mgo4RJKgykAN0Z7H8V1w@mail.gmail.com>
Subject: Re: [PATCH v1 0/8] pinctrl: intel: Move Lynxpoint to pin control umbrella
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 6, 2019 at 3:48 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Intel Lynxpoint GPIO is actually half way to the Chassis specification that has
> been established starting from Intel Skylake. It has some pin control
> properties we may utilize. To achieve this, move the driver under pin control
> umbrella and do a bunch of clean ups.
>
> This is the first step. Next step will be to convert it to the actual pin
> control driver.
>
> The series has been tested on Harrisbeach Ultrabook where Lynxpoint GPIO is
> exposed to the OS.
>
> Andy Shevchenko (8):
>   pinctrl: lynxpoint: Move GPIO driver to pin controller folder
>   pinctrl: lynxpoint: Use raw_spinlock for locking
>   pinctrl: lynxpoint: Correct amount of pins
>   pinctrl: lynxpoint: Keep pointer to struct device instead of its
>     container
>   pinctrl: lynxpoint: Use %pR to print IO resource
>   pinctrl: lynxpoint: Switch to memory mapped IO accessors
>   pinctrl: lynxpoint: Convert unsigned to unsigned int
>   pinctrl: lynxpoint: Move ->remove closer to ->probe()

I'm a big fan of this refactoring.

Can you send this series as a separate pull request that I can pull into
the GPIO tree rather than pin control, or maybe both, once you're
pleased with it?

Yours,
Linus Walleij
