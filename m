Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D514E28DB18
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 10:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729033AbgJNIT7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 04:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727767AbgJNITf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 04:19:35 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBBBCC05112A
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 00:59:41 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id ce10so3500318ejc.5
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 00:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BbQ9zezJOZt5q13rquXSx1mp5UXjcu3g5SCKCd2+BGI=;
        b=zXqVtU5tyznYTGXGamMS7R1Z0U+3OWxDZ5rx7TdXTWrbrG9jQSLWHCtsy1BoaGDwV1
         2lfYhnqpt7af6sBlRIHuk5g/r5JFMUNK/kQJaFoL4kh5NkQ2VzXceSHfSrh9zrQWwmSn
         ZtTgFpMRXM6FEBD+yQbkE5B2/vp/Y4WEb5tqWJgcBtiri5bIgcOtziYB2JChbf5mZoMS
         dNVwZP+vGgddtow1WzjrwzPP134g4vR0++jnyg9aCsrlb40lzYLGA72egHRGcRdHSd/L
         R2Vi365QPPg7MDo3sepnTYfQHIqYwY12XzSdJrgLpX8IiqUeLHFtf4kd1EW9M7IFz4Vn
         XYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BbQ9zezJOZt5q13rquXSx1mp5UXjcu3g5SCKCd2+BGI=;
        b=jHQ2VVUaVk3teWvbVZ5Hno63bvnxWuX7oWEqYBhFLVDa4jHnYGPTlGjxgsxnKk8skS
         DR6iviZ1sHd0SV0lhDyqkPPhG0rnv+bUsvIWE4yIGGUZCiZyijGaURNrGvIaZUqQEBny
         PcZllvf8Ndf4qT2LtZaV+kO8VCzJVe4YPw2vyxnuoI46tRxdsvUfv32u0lCeH7II0hbB
         8CsZzTpO7/clYK7pHqwvOzaZ788LgxaiXwypflAzslieJUUxQPHRYT7hSNFWjEw3HTcp
         Mi7clLloImp2Gx703Mj8UVOkV8kdn3OFOBozcuQK5XqpoPTmiY6DmSvC+85RP4VDOWmi
         RkhQ==
X-Gm-Message-State: AOAM533aRg41To9lVk0It4rVbPWh0Zr8HzU4LMOTc0/kNfKqanJUjc2z
        VdINPcjwIb6JDm8ekRVSLkjw+VT1qWPMR+SzpEE7ow==
X-Google-Smtp-Source: ABdhPJzkQzh/qaNuPB64Ddr441/RAk3dMGcpPwYi6lMJJDMCh/gCShOoRmWm5DeXsA8uu/uIW9HngERTGPhVVcNAnfo=
X-Received: by 2002:a17:906:d159:: with SMTP id br25mr4178974ejb.155.1602662380571;
 Wed, 14 Oct 2020 00:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <20201014062740.78977-1-warthog618@gmail.com>
In-Reply-To: <20201014062740.78977-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 14 Oct 2020 09:59:30 +0200
Message-ID: <CAMpxmJWkUc-ZnDj56Q7_1ba73RXFFHos3MYas2TZSe-Q2AwhPQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] gpiolib: cdev: allow edge event timestamps to be
 configured as REALTIME
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 14, 2020 at 8:28 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> This patch set adds the option to select CLOCK_REALTIME as the source
> clock for line events.
>
> The first patch is the core of the change, while the remaining two update
> the GPIO tools to make use of the new option.
>
> Kent Gibson (3):
>   gpiolib: cdev: allow edge event timestamps to be configured as
>     REALTIME
>   tools: gpio: add support for reporting realtime event clock to lsgpio
>   tools: gpio: add option to report wall-clock time to gpio-event-mon
>
>  drivers/gpio/gpiolib-cdev.c | 21 ++++++++++++++++++---
>  drivers/gpio/gpiolib.h      |  1 +
>  include/uapi/linux/gpio.h   | 12 +++++++++---
>  tools/gpio/gpio-event-mon.c |  6 +++++-
>  tools/gpio/lsgpio.c         |  4 ++++
>  5 files changed, 37 insertions(+), 7 deletions(-)
>
> --
> 2.28.0
>

The entire series looks good to me.

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Linus: do you think this can still make it into v5.10 as an
improvement to the new uAPI or do we have to wait until the next merge
window? Will you send another PR in this cycle?

Bartosz
