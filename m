Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD8888182B
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 13:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728483AbfHELaE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 07:30:04 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42571 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727328AbfHELaD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 07:30:03 -0400
Received: by mail-lj1-f196.google.com with SMTP id t28so78984838lje.9
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 04:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b27Uxet0wS8heQ/uw8g5KksWqeArgR34fWuxvwa86go=;
        b=okJuwlFFgvTnn/ENXSu5uVLZd90esmr0PeAasyEAjvvQOBioQ9CraF3qaK1yHy4Tsc
         05Ax1mQL+MZtfVgufZvPgI7hFgVPUQCn5R3wPoFj+Pk1COAuj+FvYi2goUZyvm/26/J+
         +QW4FoLOBSgcpnI9cQAciCUXFGt/Rz9n5bU/j17HrjmCaEdULpMhnrMCSB1buBCtfO8L
         lPXsHxCRQNoKliMkLwhXohkAqw2qP9Ak5uY9RfPakkL1eysnWxN1CahKPVGsFqDq5ANh
         Y6roI+60yj//+P1IJXT0e/EwMBTMFM+LpZc2z4c2cC2b5TDXfAsKxupjovUqZKAqaek6
         1BDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b27Uxet0wS8heQ/uw8g5KksWqeArgR34fWuxvwa86go=;
        b=b39IDEs1cxBnvkClNhkP7900VHPGPI97P57YajOrIRJA0vZxGTDoNivw0w9LBVf+9R
         ean0GGB4VyE5vngMwo5dDGJ2NwHsEMGYTwWkXfGcfvrtJf/Z86zNLE8rDO6R9ATKbUvY
         +3+oSF+uSBt6q+fpQfbhRcGdXzGxy8PiSVImdqZcrAWeMYZeMbXOFpIdClyZFtl6UGXm
         TLKX9rg6A3KvC/o5VcZRCjAofBIOGfjW0WhjQOfhu3ELRkk46djafmS5qaJTsJWw1MhA
         Vo5heXkjXs+a92higmOTDXUoPzrnAFQbQh3mocGr59stnf+50y6sk/At4rWwxbrlXx55
         nyaA==
X-Gm-Message-State: APjAAAXajsZPT32riHdg8xYDPZfadmKgQz2rpYLagDlyY7oHUChPvScJ
        vaKXMbpVUdQfytXz7vSr+E+/86ftp4kKDpxDgup/ug==
X-Google-Smtp-Source: APXvYqyWjX7ImD434EUnGcBL+cAcnTOa29T0Gg9vkUy0uyuDubU+396J3QMFCOfCS8owfk3sgIVLrR367Ak25N4S+Do=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr16587126ljs.54.1565004601793;
 Mon, 05 Aug 2019 04:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190731132917.17607-1-geert+renesas@glider.be> <20190731132917.17607-2-geert+renesas@glider.be>
In-Reply-To: <20190731132917.17607-2-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 13:29:50 +0200
Message-ID: <CACRpkdY0A5dTORVD12jvTJrQQq0jJUtF78uF4g42PE_LWCxYhw@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: devicetree: Use strlen() instead of
 hardcoded number
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 31, 2019 at 3:29 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Improve readability by replacing a hardcoded number requiring a comment
> by strlen().
>
> Gcc is smart enough to evaluate the length of a constant string at
> compile-time.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
