Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2D60EFB60
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:33:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388856AbfKEKdn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:33:43 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44582 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388854AbfKEKdn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:33:43 -0500
Received: by mail-ot1-f65.google.com with SMTP id c19so1073751otr.11;
        Tue, 05 Nov 2019 02:33:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CLxcKpR57AeVPC1myNpuQgoJUr8sS+LxErFWmA6gmHk=;
        b=MkFDPkOJfPZnYs5JwJ9FLXkH3rZFx3nYUxRNGWFhtJTYNNo1dND42XtlMj4jq4F52F
         VASRnesabWCLwWFl50oz0OKuD5LueIiASZq9/+pZ6f+l3vwgYAuWoHA51qPKv0e0ZrZu
         0sAbetXHgbDpRgPtD79NhKLkH2NrW5hdlPYBcgYVKrosO+x/KPYJnkxnyVPvVpJcNCFm
         W8qs/HPRr9X0lOman66Er03KiI25LuwQIuR6bcXW8m28hkRyDzMd8WByrepIkY5eViIn
         oHpgIgNLaRrkm7VEuNJcjxuVoNi7xwC4l0T2bgnYjGqDZ0ziB8Pz0IjzQvBlVsVbRcVX
         7MEw==
X-Gm-Message-State: APjAAAUdJ9NI6dNavsTdPcyIc6XkqHiZE/OOc2MeBBr7sS15qHq/oSnk
        MGfc25C2tUV/8823rF0kjZhJjdER3G1nlA9Z/sI=
X-Google-Smtp-Source: APXvYqy5NY1Lm3trzQDRn2McZLoUH8ufk0ARivat+LACPW8DIgJhJ2Q9X29jTNdD2/Hl/+9ucmI4t6DniMHWlseAZTM=
X-Received: by 2002:a9d:191e:: with SMTP id j30mr12586322ota.297.1572950022421;
 Tue, 05 Nov 2019 02:33:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1572945854.git.matti.vaittinen@fi.rohmeurope.com> <88f0dbb0b6dd84ffafa9294808b78526b1a9c160.1572945854.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <88f0dbb0b6dd84ffafa9294808b78526b1a9c160.1572945854.git.matti.vaittinen@fi.rohmeurope.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Nov 2019 11:33:31 +0100
Message-ID: <CAMuHMdX3eq2yjuVf=u7zSVhkF4=+-B4jFhQq4po+Y+PrergMdQ@mail.gmail.com>
Subject: Re: [PATCH 29/62] gpio: gpio-pca953x: Use new GPIO_LINE_DIRECTION
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

On Tue, Nov 5, 2019 at 11:26 AM Matti Vaittinen
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
