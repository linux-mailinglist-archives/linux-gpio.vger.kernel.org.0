Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89961301EB1
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Jan 2021 21:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725969AbhAXUWk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Jan 2021 15:22:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725968AbhAXUWh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Jan 2021 15:22:37 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71CCDC061574
        for <linux-gpio@vger.kernel.org>; Sun, 24 Jan 2021 12:21:57 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id e9so6331354plh.3
        for <linux-gpio@vger.kernel.org>; Sun, 24 Jan 2021 12:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bD3SXbeL/6FwvVJX5jUZA9y02YRqLfZuUZdGdw3c+c8=;
        b=rhB/cJmyjRDIMozDqB+eOOftxsuZJRRAoBIFGHJzcEV5Zao3axs7AEEMoqr4ov45Fj
         i/NT5xIxOWsQOZWxlznP/qM5LOyExeAaU5UktYM8iT6bQ0/KApjq06Tx3bssInkpjs3P
         PzEtiy9YVUFVTzNkYjZp5zJIiD83JkmlF2lULSvsyq0sdv/7TLBL1MnYVGn20KwWmqD9
         MCoabEH6mIVim3IyvDlYCn8UI/CyQkV1HWECRR0ITX8NS9isHTxoSjnLIGppWtBSvP2M
         efKSwr+3QkULRTFzwF/p+S1AD+3RJ4hwa9sNYSzeh/NeVbckKaNbov/OP0t7zUo7it4j
         8KBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bD3SXbeL/6FwvVJX5jUZA9y02YRqLfZuUZdGdw3c+c8=;
        b=FfThcUthOp5LD0sClDHCXAVlxnbYr3eAC8S2j/b3tgcybaYtvyVVKhRnPyNr60jDti
         UT0EQBOPx4S8m3oqAgO9GK7xaEaF81wo/jOAC9KzIvHxWhaf6FtGcLoje4gDZMxceuHx
         ZRGUjUVZUmEffLP5fYp7ckB0t0qOixZRBahO8epYS20K+BM2HwV0Prht+/ai8oJvMMy6
         x1K0+Fy/b95vXALtA5NYMFHvTVD8XJSpSVzCFzim5NeHwB3x1ctqAVVZBmjNriRRB55n
         MkqbmnuGHrSvDZamxiRTnpZYPkgOhoBj3bO54ooQsvO+6T6ccnlooz6fmrvmqgb/VrD8
         crkQ==
X-Gm-Message-State: AOAM5308AVemjsWhmJam6gTCAHo+TYSBvvlQX+0Uw8rfszRRJ4ld9IY7
        sxyTwZvBKuAdbmtjLZj2Y/63UA==
X-Google-Smtp-Source: ABdhPJy+TlGD6bOoPP7ae6ep0VpnURVA+9K5RQzwVyzBkClTcY/PC8ldlN26u1jgFIJaet8+N5AH1w==
X-Received: by 2002:a17:902:9005:b029:da:f580:c5f7 with SMTP id a5-20020a1709029005b02900daf580c5f7mr16574699plp.85.1611519716942;
        Sun, 24 Jan 2021 12:21:56 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:8a9d:dc2a:dc68:7009])
        by smtp.gmail.com with ESMTPSA id p15sm3048393pfn.172.2021.01.24.12.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 12:21:56 -0800 (PST)
Date:   Sun, 24 Jan 2021 12:21:54 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] pinctrl: pinmux: add function selector to
 pinmux-functions
Message-ID: <20210124202154.GA585361@x1>
References: <20210123202212.528046-1-drew@beagleboard.org>
 <CAHp75Vfa2iS0RTXxaoUv9zwr7+GvaUwm0xqu4tiSF8zu1CkECQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vfa2iS0RTXxaoUv9zwr7+GvaUwm0xqu4tiSF8zu1CkECQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jan 24, 2021 at 10:01:49PM +0200, Andy Shevchenko wrote:
> On Sat, Jan 23, 2021 at 10:44 PM Drew Fustini <drew@beagleboard.org> wrote:
> 
> 
> > Patch note:
> > This may seem trivial but I found myself coming up with series of pipes
> > in the shell just so I could see the function selector in line with the
> > function names. At first, I thought I could just pipe to 'cat -n' but
> > that counts at offset 1 instead of 0.
> 
> SO advises [1] to use `nl -v0` instead.

Neat! That is a nice utility to remember. I feel bad now for piping to
perl to solve the problem :)

I know this is rather trivial change but I think does seem to make sense
to print the function selector along with the function name.
> 
> > The only downside I can see to
> > this patch would be if someone is depending on the existing format but
> > I don't believe that is a concern for debugfs, right?
> 
> Debugfs is not an ABI.
> 
> [1]: https://superuser.com/a/1433656/415970
> 
> -- 
> With Best Regards,
> Andy Shevchenko
