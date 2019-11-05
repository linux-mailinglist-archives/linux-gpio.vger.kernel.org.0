Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3469EFB72
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388400AbfKEKff (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:35:35 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:40339 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387905AbfKEKff (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:35:35 -0500
Received: by mail-oi1-f194.google.com with SMTP id r27so17038280oij.7;
        Tue, 05 Nov 2019 02:35:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iyU7I3+wA8xz3yY7wIVDgPQ0SwWRU8/JQIMa0TOkIFM=;
        b=A7KxlgqiLTNJsdSBCIEeTc7PB9BF8WSNt0RxR7uldZ8qFC5JArD33EHT4mYjluY+9Z
         VTPmDzJKLA12PEAwWCTBULbzXlKQJ8q2Gh5/n5VWljHx4BML3JuFCX2f+NfYobUwbyqP
         5c6ewCWeQw+lcggZJtFcIbCvL2FrpJbqBKuiUe2Lo6A8wkidjtiRaiQqUuK9mrugjDGa
         z1rnyfvVhLRLqqNETixXXoQAHBRz+iQdXl/gHn0ZMoxMwGZopGbxIHzYVL6EDPljRGuR
         e9sgfeMCMCQxxfpWtkuJUR0UDmsVWeGTrcvsCHYAJIS8N27a5RHG/nqlPY7bCgwVtC4z
         knnw==
X-Gm-Message-State: APjAAAU5se8JXPiin/hv0zDOTlHlm3pl7PK8TTLPVVmtjDgPGO38oa5M
        ManHRVJPFKeq7UgTMOoP8AjjzwyPvyt5EIUeqmU=
X-Google-Smtp-Source: APXvYqwyERHWrdOBjvkBSN45thPVbHDDZEOyeN1melsUinK0lcf2ZdeESdND4aZeiIPObbAnBKZrODfZQQO3knl8Ttg=
X-Received: by 2002:aca:3a86:: with SMTP id h128mr3213259oia.131.1572950134371;
 Tue, 05 Nov 2019 02:35:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1572945872.git.matti.vaittinen@fi.rohmeurope.com> <7217327d1ea69f886a2cdb8abf201a2cc7bb02d3.1572945872.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <7217327d1ea69f886a2cdb8abf201a2cc7bb02d3.1572945872.git.matti.vaittinen@fi.rohmeurope.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Nov 2019 11:35:23 +0100
Message-ID: <CAMuHMdU2Y-yyXpRLz1RK_veqoEiOEPPhzg91Vw1UWf2BhFwguw@mail.gmail.com>
Subject: Re: [PATCH 33/62] gpio: gpio-pl061: Use new GPIO_LINE_DIRECTION
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 5, 2019 at 11:29 AM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
> It's hard for occasional GPIO code reader/writer to know if values 0/1
> equal to IN or OUT. Use defined GPIO_LINE_DIRECTION_IN and
> GPIO_LINE_DIRECTION_OUT to help them out.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
