Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E393A2156EA
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2020 14:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729016AbgGFMAY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jul 2020 08:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729005AbgGFMAX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jul 2020 08:00:23 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A30D7C061794;
        Mon,  6 Jul 2020 05:00:22 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id t6so18298686pgq.1;
        Mon, 06 Jul 2020 05:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k2wZVBCbFmyS4f19I96bMfACN0zJyTtZkt6TGll4q3k=;
        b=hlaatayaR5fM1opYuZxRQLjh4ia6UrS5+Yv1bc51QztaZUkLdZqiiFOlARsV/10S+g
         wAS+W4QYhOVXxXbgq5TQkVkrSJ85UafIRr4amXG5cPrHTh08pZAcj7sZFZt889Dy33WE
         AKD13FxipQxWJi3e17SAXeR8Pl6RlECF49No27zMOnymNDFN0vgkswwL32JsKk5dNAsQ
         tdA/1QXmjwSK3FbslaFy1djWK9pS2DLpD1be8JBZyiLMkWFhhdY+UFF3H4JhUbakzU2s
         +UehpbLn1c9La4/0z6Nn6GUnu98WfQuOpf2tCH4/s2KxHPlSoPp71BQBpPSjdpzwfjbB
         wF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k2wZVBCbFmyS4f19I96bMfACN0zJyTtZkt6TGll4q3k=;
        b=eamASyljo05LcW22bQGuXBivnD9apjAsjCXYJQvOE53Ztuit6G94xls0Cx2Hd08rfM
         x7RFb9O/irml1GBrhjvhwxjuEYVAPjQTOoiN0PFARTA7L2D+724adqW7cg8+ChJJd2P3
         +Ia2ZJI/yBzf1MLCAh4Uo0mheT9Pod+jzNRkg6l7UHwJRUfFttvct9K9zJCDVpw+FECQ
         xPcxKERjMVMMbDRfHVNx31bv24k2laI8YDxz+OIH/wZt+4ZRvSVxmHyanBi2Yv/mxJtA
         agSTaXZL5YJfxL2C3RTlEsJO4k1VxpkvL9V+wGpoGtfMXM4DYdhgfowTg5GfEngiXMAY
         2QLw==
X-Gm-Message-State: AOAM532b8Rzbe15M9mk7+LcKr/CqrRrC9q7/8eGzS69H86T2fE/6sLeU
        q3Akdv4Ki4pBvX3h9iQM3MGBWQhRyGFAf2+n584wax1S
X-Google-Smtp-Source: ABdhPJyZUDdsT0fW5oP+iefGIEpVQz6jAxKgMmdAQvjFqCUC77UY7uGD7cjaa+Huw//BrBpqY2aJROFgCll8Wr/laqo=
X-Received: by 2002:a63:ce41:: with SMTP id r1mr16751991pgi.203.1594036822196;
 Mon, 06 Jul 2020 05:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200705133038.161547-1-mans0n@gorani.run> <CAMpxmJUxGq3_R7BRGv68ApeNC+g9PDm_kBd0r=8TjFSyTNxFWg@mail.gmail.com>
In-Reply-To: <CAMpxmJUxGq3_R7BRGv68ApeNC+g9PDm_kBd0r=8TjFSyTNxFWg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 6 Jul 2020 15:00:05 +0300
Message-ID: <CAHp75Vf4440V5Oh1SA5tjVgss134qGkx591ANDY3aQ+oecEzmw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] gpio: add GPO driver for PCA9570
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Sungbo Eo <mans0n@gorani.run>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Walle <michael@walle.cc>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 6, 2020 at 2:21 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:>
> On Sun, Jul 5, 2020 at 3:31 PM Sungbo Eo <mans0n@gorani.run> wrote:
> >
> > NXP PCA9570 is a 4-bit I2C GPO expander without interrupt functionality.
> > Its ports are controlled only by a data byte without register address.
> >

> > Datasheet: https://www.nxp.com/docs/en/data-sheet/PCA9570.pdf
> >

No blank line here.

> > Signed-off-by: Sungbo Eo <mans0n@gorani.run>

> This driver looks nice now but why did you remove the mutex in v3? I
> think when Andy commented on that, he meant not understanding why the
> error check is protected, not the i2c operations.

Right.

> Are you sure you don't need this lock?

It's a good point!

-- 
With Best Regards,
Andy Shevchenko
