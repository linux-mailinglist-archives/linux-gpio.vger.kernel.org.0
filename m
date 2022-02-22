Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79EA24BFD2E
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Feb 2022 16:37:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbiBVPiS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Feb 2022 10:38:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232110AbiBVPiR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Feb 2022 10:38:17 -0500
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56BCD9EB94;
        Tue, 22 Feb 2022 07:37:52 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id d26so16777980vsh.0;
        Tue, 22 Feb 2022 07:37:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KBcpZ9jgJoMWEogAlgZ2QiXNeISgYGA0u6kHLE5F+0E=;
        b=0U2yZgBjwR3orXqm3oQZOipDgjYPiqo3z5FrqhPWQhyqfXid4gin6IlBFC9QDD29x8
         l2t4J5TnfwvJ/2RY/fTeomw850eFD2w9cwMMmP5pDCl+WHX8MS8bIU0CH43GoN2Nyn+J
         vPbdzpxEZgFnHmpFInvoFQTBZslZ0aqOuIL2EJcQgqU/70pbytIY9IZZqR4D53WbMUx5
         2szm7tJ6ycM7gclac21G+DebJYLlwsZSpdTKETUDMXh/ol31NM04PH46vo/x5QR8IvTf
         vEvL5tPkxwLsSf5DczAtep+42K+YrqkgY3kvJj/q7lmConThPv2Oh0Dzlv6NQ6NEDkss
         dPJA==
X-Gm-Message-State: AOAM532lsMpovtlJWEtWzd/+zjE6q4/sr7HM6hNemxuJ6dnDyZC/bQ1t
        PDkSJRwy4iaLlpmrOi09CQ+i9XTR+HF/rw==
X-Google-Smtp-Source: ABdhPJwAmY/e6ylaBrqzes2fn32Q/H1kwG8HLlK27FMstcqZra6HcZnKC/sW3SLOFLtCjuvB5mvjyw==
X-Received: by 2002:a67:e005:0:b0:31b:74eb:1005 with SMTP id c5-20020a67e005000000b0031b74eb1005mr9092753vsl.50.1645544269870;
        Tue, 22 Feb 2022 07:37:49 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id x144sm2633572vkx.22.2022.02.22.07.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 07:37:49 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id f12so10598364vkl.2;
        Tue, 22 Feb 2022 07:37:49 -0800 (PST)
X-Received: by 2002:a05:6122:114e:b0:32d:4662:65a8 with SMTP id
 p14-20020a056122114e00b0032d466265a8mr10537592vko.0.1645544269414; Tue, 22
 Feb 2022 07:37:49 -0800 (PST)
MIME-Version: 1.0
References: <6d8a6a05564f38f9d20464c1c17f96e52740cf6a.1645460429.git.geert+renesas@glider.be>
 <CACRpkdaJAEivz_RVGCyDvwJtDnb7E+mpxt8a66TicZW=oNttNw@mail.gmail.com>
In-Reply-To: <CACRpkdaJAEivz_RVGCyDvwJtDnb7E+mpxt8a66TicZW=oNttNw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Feb 2022 16:37:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV4Hv4Z2dMJR4riZy=FzXjJfEenWA4RQZhNvtRkno71Hw@mail.gmail.com>
Message-ID: <CAMuHMdV4Hv4Z2dMJR4riZy=FzXjJfEenWA4RQZhNvtRkno71Hw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: checker: Fix miscalculation of number of states
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Tue, Feb 22, 2022 at 4:27 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Feb 21, 2022 at 5:22 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > The checker failed to validate all enum IDs in the description of a
> > register with fixed-width register fields, due to a miscalculation of
> > the number of described states: each register field of n bits can have
> > "1 << n" possible states, not "1".
> >
> > Increase SH_PFC_MAX_ENUMS accordingly, now more enum IDs are checked
> > (SH-Mobile AG5 has more than 4000 enum IDs defined).
> >
> > Fixes: 12d057bad683b1c6 ("pinctrl: sh-pfc: checker: Add check for enum ID conflicts")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > To be queued in renesas-pinctrl-for-v5.18.

And obviously I should have done s/sh-pfc/renesas/ in the subject line.
Will fix...

> I certainly trust you to generally do what is best for the Renesas drivers.

Thanks!

> I have a question about this checker infrastructure because it is obviously
> a piece of really valuable code for Renesas.
>
> How general is this checker? Do we have other drivers in the kernel that
> would benefit from it or is it completely Renesas-specific?
>
> If it has general value I think it should be moved to be one floor down,
> with the pinctrl framework, if possible. But I don't know the details.

Unfortunately it is completely Renesas-specific, and relies on the way
pins are configured in most (but not all) Renesas SoCs (both SH and
ARM).

I assume similar checks could be added to other pin control drivers,
especially if they are using groups.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
