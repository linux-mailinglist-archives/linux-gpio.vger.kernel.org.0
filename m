Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD88162686
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 13:55:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgBRMzz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 07:55:55 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:43142 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgBRMzz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 07:55:55 -0500
Received: by mail-ot1-f67.google.com with SMTP id p8so19333769oth.10;
        Tue, 18 Feb 2020 04:55:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7m9U+ZDjRKStbdCgNtr/9vPYhAsJaG0K6XoFskR7rjM=;
        b=HTDGFE7MDfusUpPauKOQmkI1cfqc2acVjOEqzeJcSsUgafIhuXNoISnv8S9gpFjYwN
         AiKcG7lNLXDLyrWiSmJ2NaKCAlGq6+1hSjaL+QM5MurapUXNJNnEymufUvjFgB/ewipq
         e783BAHhvsAgNnOMYRxPMzXx3qqn9PwlEDxSvitCVQDLPaXzc5Wm35544r2hnTw1kVva
         pw2iW8Jg/1lBNCDhaIV8AeDOx//O9KvAwq0sTHOGa98ia2ESeHSiHm2Ga9xOYgvfORX4
         aLXHffUmbetufzMnJW0UNM/qyitd00GlLaP1OjxFQyx9DOr0RCMeZVBEhAqYUr/b1La8
         HVpA==
X-Gm-Message-State: APjAAAWnGS7GxlwOx4+hFO549pNKoQjLzb6eC9p7OTLZChg9eio2x95N
        vmSCVXxXsEySO5COXO7bvNay5/uhcfpomwDHyU4+583b
X-Google-Smtp-Source: APXvYqxXI6z4p7G3Ac9Z9fz2+tsg4pGdYtK2i4VQFf85pL9mYaENBRLND7dGkiaDzNrpblFjz7pXPc1c+Y5gVxoun4A=
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr855945otk.145.1582030554347;
 Tue, 18 Feb 2020 04:55:54 -0800 (PST)
MIME-Version: 1.0
References: <20200218112557.5924-1-geert+renesas@glider.be>
In-Reply-To: <20200218112557.5924-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Feb 2020 13:55:43 +0100
Message-ID: <CAMuHMdUDZ8ErGRYwCOiarKfvTKV4=p72j3FYAQ05Ab_Pt0CQiA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: Remove use of ARCH_R8A7796
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 18, 2020 at 12:26 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> CONFIG_ARCH_R8A7795 was split in CONFIG_ARCH_R8A77950 and
> CONFIG_ARCH_R8A77951 in commit b925adfceb529389 ("soc: renesas: Add
> ARCH_R8A7795[01] for existing R-Car H3"), so its users can be removed.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

ARCH_R8A7795 in the one-line summary, of course (thank you patchwork-bot ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
