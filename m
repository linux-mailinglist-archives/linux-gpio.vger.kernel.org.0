Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3DE34E546
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 12:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbhC3KUj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 06:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbhC3KUK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Mar 2021 06:20:10 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB11CC061574;
        Tue, 30 Mar 2021 03:20:10 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id w8so7500305pjf.4;
        Tue, 30 Mar 2021 03:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=apAgZvbfdBeJeBhXYDfeacjBnyJ1xcC6uDlNLXeRT88=;
        b=PFzZhzr1m78y4x/1LZdpGOFMeyr/NOWkgUL+Svn19EwA1Ywx8yq6FIptnzLGcIDNsU
         kAafxZ6S6cUwos8cDsR0cX0dmtvw2mqBn9DeSGnkAqVYx/71kW0HX4atPqdBf00HLv+P
         Grii6RKF7HVVLAkNw7tP3kFlMsVP/sd0js8FLmAT5pHtbNDXNWMCQDd+QK3/VO3V+ExM
         xBESdQsEyNqZ0klcgmgkP9BTLheIHJA6zI/5TZl9K4eR6Q+KQmSY0V0v2Z5NfdBpVopu
         VyO6lustlQY8UlbD3FN6GNgmvooCeCR5Jc2Vh+lWY7otlfKM72bhVKdsOZZ+YuCjamKb
         ihjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=apAgZvbfdBeJeBhXYDfeacjBnyJ1xcC6uDlNLXeRT88=;
        b=CkCg4uI/mKlAI5MHiEdoY3D/CKSNN/P5Z6ZuzlIZWe/LT+arUhTsbWLT96S4VCZCU9
         SA9UN1kpLLDqv1/+UOma2UxINXmkyPs96thURc/KngjW3XJcHLsxYnbME/Kxml37O+1K
         KdAOqrJsRCmFzHS8nKuZ44EEVMxM7OcsDlhBmCI9gQrbutjGyi45Sd3r7KBqn9HvtFQD
         RN8nCkuApMu7oqrpaKHJUchO24Bvha6U7db+TEpuhpFDPxHpm/ovtfkAJKgnILNy5NO/
         JxnTymuDIuaUkPBxdgddyFgbg0aX7DvTorlXx6+GZURGX5qIszHpgnlPE4CoeRXvNSMl
         5nDQ==
X-Gm-Message-State: AOAM531uU0/SDsnO92eIEyeGsi8Uzn1ibhUwgplT3Q0rp2cpJuwgU6kY
        ekgyZ9AzRnIg9uOkIMPGMoPp1yFZ3tVrrh0LvhOXklpQUPE3gw==
X-Google-Smtp-Source: ABdhPJz/L3AANQrNCOwj5j5Zfq475VfMNDmexqeW+DJqikKjnrSmndxc4mF4geLvLCnfEu/cjBIE22WG7Rn6Mh8JUZM=
X-Received: by 2002:a17:902:a406:b029:e6:78c4:71c8 with SMTP id
 p6-20020a170902a406b02900e678c471c8mr32350643plq.17.1617099610374; Tue, 30
 Mar 2021 03:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
 <d2c8b7f9a3b420c2764f645da531a57db16905f3.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
 <CAHp75VdXa2bkJ+ej+HNYstLeK4TF+L5H3wTgm0CgJ9hYQeU+ZQ@mail.gmail.com>
 <bf12f668db2f0dce7dfc09351780e295da30714c.camel@fi.rohmeurope.com>
 <YGHWZuNfbSDe+B6y@smile.fi.intel.com> <92243c7b428d2025c1a9f3beb8db46995c9376d0.camel@fi.rohmeurope.com>
In-Reply-To: <92243c7b428d2025c1a9f3beb8db46995c9376d0.camel@fi.rohmeurope.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 Mar 2021 13:19:54 +0300
Message-ID: <CAHp75VftvsHR3bKJQrCSSS6KnTUod86T7XRdTSZ4EgmbbsU=eg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpiolib: Allow drivers to return EOPNOTSUPP from config
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Joe Perches <joe@perches.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 30, 2021 at 7:32 AM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
> On Mon, 2021-03-29 at 16:30 +0300, Andy Shevchenko wrote:
> > On Mon, Mar 29, 2021 at 03:20:07PM +0300, Matti Vaittinen wrote:

...

> > I think the error code which is Linux kernel internal is for a
> > reason.
>
> not all of us thinks the same. So maybe I just don't get it? :)

Thanks for following me now, appreciate.

-- 
With Best Regards,
Andy Shevchenko
