Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7708CE95
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 10:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbfHNIgR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 04:36:17 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45661 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726604AbfHNIgO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Aug 2019 04:36:14 -0400
Received: by mail-lf1-f65.google.com with SMTP id a30so15671148lfk.12
        for <linux-gpio@vger.kernel.org>; Wed, 14 Aug 2019 01:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9m/ClKWZBZ4cKiuiDXlzmOAFeeYlFwcr35QV9Gd9YOo=;
        b=lQCO0wdj4cBFymMjPac0TynRfsXFyNg+5yMGu9feG0KP+a+4yM8+eM1GfChG8bkqS8
         05JUSJJ88TvTBcqRbNosmozevJ/uITH1hLF7YI+YkMwa9/ScmTrCq2YNeJ19lCyikFfn
         tMEf3nfpQhwXTU6RRxbsZahJdyuPCNibAKpol0j247AOOgoch4G85EQ5whTQ5eIM18mv
         3cYYVZGdbgWLw1FISkT4XIy37uU2dIJI8SVzU1cBeNEELWQ13/oNRMPTK+/BMtxO65m9
         15l4ZrXz4powXzJMgqlbddMyAVwOYPN9jEU0duoewvy83pwOvWWDd0wNzuySdh3ooTpX
         PkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9m/ClKWZBZ4cKiuiDXlzmOAFeeYlFwcr35QV9Gd9YOo=;
        b=nE44w7s2sfOpyHXrJpOvYJekZQ4NIWZlt+cCMCWs/AWe5Sg15nbBMZO/tdOa20SmzO
         omF4WuTmYPgKD43fdo1Idb3EDGUUjV7dadpYQ2cHDB0cZq12bZK+3TSAQaKmAdQWDKc5
         aSx0rwvhaZ02pwt8zwqJI7W/ruOGtvEnfinDSv/ztmLdqF3SL1S76eYKNMCDcqOtMa3t
         susH0w1euSmX30e9B6YTW7HYvHmnJHS1zjNSxdvfR6QRqqxQaSt3D0mvtZ7zjlTi4jcS
         MyFRsgqqSz9Yi1ZadvmVUyDk6dWE3DZu9NTMYbIYzU9PGrlkhAgKfpW/rhOlT//C6r3i
         Jusw==
X-Gm-Message-State: APjAAAVwL9fGUXcL5Tal4CZkcSEJJIS4v0+S5hn4siv6D/x+tFkqSWqz
        6tGO9KYywdTGuctQvHwiQtYYio/1uG8M8znhLfJ6wA==
X-Google-Smtp-Source: APXvYqznbmtSAAQS/LW5nR9i4yrmWUGYLkBCD0/kjsmr5yLyxGjMyWL3WMpAlXpxiLeD6i4k4a5/J5sHITEp2/ghPp4=
X-Received: by 2002:a19:ed11:: with SMTP id y17mr24953593lfy.141.1565771772948;
 Wed, 14 Aug 2019 01:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190809162956.488941-1-arnd@arndb.de> <20190809163334.489360-1-arnd@arndb.de>
 <CAA9_cmdDbBm0ookyqGJMcyLVFHkYHuR3mEeawQKS2UqYJoWWaQ@mail.gmail.com> <20190812094456.GI10598@jirafa.cyrius.com>
In-Reply-To: <20190812094456.GI10598@jirafa.cyrius.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Aug 2019 10:36:01 +0200
Message-ID: <CACRpkdao8LF8g5qi_h+9BT9cHwmB4OadabkdGfP0sEFeLbmiLw@mail.gmail.com>
Subject: Re: [PATCH 1/7] [RFC] ARM: remove Intel iop33x and iop13xx support
To:     Martin Michlmayr <tbm@cyrius.com>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Vinod Koul <vkoul@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dmaengine@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Peter Teichmann <lists@peter-teichmann.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 12, 2019 at 11:45 AM Martin Michlmayr <tbm@cyrius.com> wrote:

> As Arnd points out, Debian used to have support for various iop32x
> devices.  While Debian hasn't supported iop32x in a number of years,
> these devices are still usable and in use (RMK being a prime example).

I suppose it could be a good idea to add support for iop32x to
OpenWrt and/or OpenEmbedded, both of which support some
pretty constrained systems. I am personally using these
distributions to support elder ARM hardware these days.

Just my =E2=82=AC0.01
Linus Walleij
