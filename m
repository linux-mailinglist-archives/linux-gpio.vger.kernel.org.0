Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87BFE262B5D
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 11:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730111AbgIIJKX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 05:10:23 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:43787 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730092AbgIIJKO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 05:10:14 -0400
Received: by mail-ot1-f67.google.com with SMTP id n61so1663476ota.10;
        Wed, 09 Sep 2020 02:10:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pb1HZ5RJoeUYiz4tk2uhQAXcCJ3Ei/QOgrU0Cul6qKU=;
        b=JhT2iPWPH5sdVONawIGq9z6GsleYDZTpnlniuzNdqh4C/eIGuNHTePAunWMhKlquRf
         VazCZ/DOEHvgvbqQOM/if2xeBpfUIwii95foAI6tn7+mKOIlTnNRKwH7kzlWkuUdp9XO
         +kCXLjwpDxe3mLR/L+QJHYe46Ps+XQ4tEyK2FIdFzoJ3MzC+oNdHtXogk5sIEWHIHq7V
         6XtjnJo/tUgrxWDr3HNFBsaIyICXUo2y4rNghvEvRMhYQ9spTqCPxeYyCWPjfUAWYEYc
         b7+Myscm6x15RyDzuHSzP3qzteD7Joap97iwtBM55d0tP+ogk5xatNhlFAJnUFvWLSza
         u2Qw==
X-Gm-Message-State: AOAM533XhrTPjHC51+BH6siNrd1IfBIJNQF1P9+X2FFpbUCbcTbhJRw+
        /Hg8ZiNeedw8smZg42yz5ZomHzhwOm2NMT6uouTiWd9D
X-Google-Smtp-Source: ABdhPJwxlsSWuII7HixN72Z0MrF7mnU6wJolhyzRHgrKbigFEdcW2X5OW3JBHQoVLrX5EbtgYNYKNGXFVx4kpk20cg4=
X-Received: by 2002:a05:6830:1008:: with SMTP id a8mr30284otp.107.1599642612947;
 Wed, 09 Sep 2020 02:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200904114849.30413-1-geert+renesas@glider.be>
In-Reply-To: <20200904114849.30413-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Sep 2020 11:10:01 +0200
Message-ID: <CAMuHMdWcCNJa2Czq=bCF-ZG7h4rQQdV4XGOhJPKYd4o2zNJC6A@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: sh-pfc: Updates for v5.10
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Fri, Sep 4, 2020 at 1:48 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:
>
>   Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.10-tag1
>
> for you to fetch changes up to b9d7f1448846a98d49a5567536febbef297b20b2:
>
>   pinctrl: rza1: Switch to using "output-enable" (2020-09-04 09:45:32 +0200)

Please drop this, as I've already asked on IRC.

> Kuninori Morimoto (4):
>       pinctrl: sh-pfc: Tidy up Emma Mobile EV2
>       pinctrl: sh-pfc: Collect Renesas related CONFIGs in one place
>       pinctrl: sh-pfc: Align driver description title
>       pinctrl: sh-pfc: Tidy up driver description title

Following discussions, I had updated the third commit above, but
forgot to update the fourth. Will fix, and send a new one later.
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
