Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D41FEE3F7
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 16:37:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728188AbfKDPg7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 10:36:59 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40343 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbfKDPg7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 10:36:59 -0500
Received: by mail-lj1-f193.google.com with SMTP id q2so11568849ljg.7
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 07:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mdxeFfhQgznpfAiSWIisxt5zYno5MrBI+bRv45ilKfM=;
        b=LtF+hy7+QduhX4D1sBo/t8cAdWbvTGDJSrswP3Au2jV9SJPsCup7keYfG3iuhkS1no
         zzgayqbcnC8bGkqgp0wE0bCP4jkgpZBf9Sf339HmjjAVG0Y/D//d7GMtj8t7iyRMuM4/
         uHaovGQiqn3yZyFTU+XQ/ZBBq8/nGYvOJ/LAPqo+QqlYX+f0QZuXUzEY7Un7PFIDfQuT
         ZyoNS4OAbhVscOP8Ujkxz3CCOb50T5wQ3YKtnK8ZowT4NT/Ngr7HSoTWF+/7V0rbXlU/
         UcmGh14P/a4YUh6DZg5+a5FtVaaHU2pgGYdnzyRgkY3C025yOsklAjhWi4IuZVRsSxIJ
         Pn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mdxeFfhQgznpfAiSWIisxt5zYno5MrBI+bRv45ilKfM=;
        b=rBVN/TzOKkPowBa8lKEnF2NlymC2Jdfa+W/y+Ul1wOlHSgXrAJze5zBH3dACivXmaE
         JMHkJn0Qt5yJ+dpI3nzgDgSTgAuUAhaf+NHgwjxDID9g7M4JmfM90N0XplA0tZl8JDn2
         x0V5H5ZxaIBdPiEsQD0fPXGzy/mz8mQU478z4CT6xaN3zLs3dvISDTiyTd7CsGfGupec
         9sYgXCRhR2HXFjRQJHYy06Ln0cPdj+5bQ95x0aQst6ICAXA/mczVcsLT4qXBdR3wvc2l
         HnDs6LbyHVEe9FC4XrTMSUu9FJm3I0kZHo6UAaKGT4Lkza+ydDdDH2jpdCQNa31cMNWt
         66iA==
X-Gm-Message-State: APjAAAVTaP0w4TV8oQXBMrb3NsgGzJzxl/yDzFKoMeNhSUi/mwCYXPYo
        Eamaw57x0CG3C279VPTyIHDBJF+tMztIzdChljSTig==
X-Google-Smtp-Source: APXvYqyD/PWAgwBFdTE576nF/DEWwR43uXjHxOXVUrs2eN44diLVHtAsTMDUcHc9UItK6bxTkRj5qhwvR2CtIw2DfHQ=
X-Received: by 2002:a2e:9a12:: with SMTP id o18mr11827632lji.191.1572881816784;
 Mon, 04 Nov 2019 07:36:56 -0800 (PST)
MIME-Version: 1.0
References: <20191024122224.11776-1-geert+renesas@glider.be> <CAMRc=Me9Cc=O6t_3cLW5Ow=-XgurQ1x_RpfHe4Lxhb2QB6_WgA@mail.gmail.com>
In-Reply-To: <CAMRc=Me9Cc=O6t_3cLW5Ow=-XgurQ1x_RpfHe4Lxhb2QB6_WgA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Nov 2019 16:36:45 +0100
Message-ID: <CACRpkdbbLWfp2Nb7=83VrQ4LHgF8eR8z5y7fgKYGO6Qg2LkAuA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpio: renesas: Use proper irq_chip name
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Oct 26, 2019 at 2:08 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

> Both applied, thanks!

Ooops missed this, I pull them out of my tree.

Yours,
Linus Walleij
