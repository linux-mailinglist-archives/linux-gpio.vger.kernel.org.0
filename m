Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0798FE1A8
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Apr 2019 13:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727977AbfD2Lzl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Apr 2019 07:55:41 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34681 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727954AbfD2Lzl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Apr 2019 07:55:41 -0400
Received: by mail-lf1-f68.google.com with SMTP id h5so7777128lfm.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 Apr 2019 04:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/rPuONNGSTiyrFw5e49VWbx4wW4Nuh0y3B11Ms6hq6w=;
        b=rcIhuSOW3GD8sy3gDeWdXg97tk/SubJFKPYF3jsb5hu+ic/+/5laq8LTdJVcBD+o2I
         sTs/B2aMM8YGuXH3NY6HtEaKGaG1Gn6+SKF0MOhOnOJPRmojjKodDMmOmx8X2oolK3+2
         x9RQDkbPBZm4bThesPcFEvfPsQKdTqHtDYmMT8QDp7IMj5a9kss0/KhUiLozAv8lLebw
         pijP3WndVopJ3hALx4Z1EZIueGoGa8U2CM33tKbtgbXi791hC7bDe6ZM4bSu9D6J+x+w
         aXqEb5IqzhKwvst3/zIW7uu7pP98eSmugr3D7nW/HrUezbj0anpUIsm+0jM/bfCKEslB
         F2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/rPuONNGSTiyrFw5e49VWbx4wW4Nuh0y3B11Ms6hq6w=;
        b=SCIpjwPrWtP4KKovjwLR9wnG7tqFNOQNS/G1Tc+A31iwOVwm7hS387V/PS6rJbOHcc
         4GDGtyMyKlaIY7RRoriT79QHXVXrHQT+F8FZG4OfGT2o5j2bndJjvF3diorgQBUWlOjv
         syVsSiNKnkj7ghDtXAqW+MGTx928XqTl0ZBDTDaxjNMcelMkYoi+4s/SqLPgDZoeIEWg
         hMUuwbvb/27pXV0JFYdh2zDS7p8+7xR35+dNCOv2ljhMGqgSldiqLYlaxQLyx7xUXRQ7
         aOft4d7fIsDPEA0fiS98QL/bt4Dc3aM9U8cwP0T7Z6qtNzONAJqJnTYPekmjeiRMpBrW
         bAlA==
X-Gm-Message-State: APjAAAVdwSlgsrauc0qKwwDsEFz5NU2dWwe2dvjNAvj9H/MzoMSiR4gM
        GbUmc+3Pk4xGS480h1FE0gc6UPzjGAkM8YmU3x0snATL
X-Google-Smtp-Source: APXvYqydkuVdTQQfaAL0PrSk48egRwhm4wiMeHytMgxYw3UAwUwbK1J7QFV084gahJGg0hJT9+RXZFZRkIFMlEZ3TGg=
X-Received: by 2002:ac2:4a86:: with SMTP id l6mr31393914lfp.51.1556538939836;
 Mon, 29 Apr 2019 04:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <0fb34aa5-60d8-cf6d-ffcf-237298977347@eurek.it>
 <CACRpkdaWGBoV_OFkjj6y0Rayz1hNziDCaA7VXh+1Uf5soh46Ww@mail.gmail.com>
 <7e0af1af-a565-a12e-8356-e9964d8174c4@eurek.it> <CACRpkdZs_E=6cjPa+vaNvqcXF1DmtMPujtPLS-nPQqysYhG2pQ@mail.gmail.com>
 <4a854870-d294-8a84-8d82-51a90e20b362@eurek.it>
In-Reply-To: <4a854870-d294-8a84-8d82-51a90e20b362@eurek.it>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Apr 2019 13:55:28 +0200
Message-ID: <CACRpkdZPnuQz8psnOXo-_Jy5UWOVoajicmGGi_dXf0SSrdj4XQ@mail.gmail.com>
Subject: Re: GPIO Character device driver
To:     gianluca <gianlucarenzi@eurek.it>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 29, 2019 at 11:49 AM gianluca <gianlucarenzi@eurek.it> wrote:
> On 04/24/2019 07:07 PM, Linus Walleij wrote:

> > What happens next is that the kernel invokes the uevent helper.
> > This used to be /sbin/hotplug but udev+systemd systems
> > nowadays use a netlink socket to send the events to userspace
> > and I have no idea how that works, sorry.
>
> Well, in my systems I have systemd disable because we are heavly
> customizing the boot sequence as we are using sysinit for booting...
>
> Is this behaviour forced to *NOT* have gpio characters in udev /dev
> structure during boot up?

Hm you need to have something like udev and the ruleset from
udev that creates the devices. No idea how that looks on your
system though.

But something like this seems to be your problem, lacking
the right userspace recepies to handle hotplug from udev.

Does it work to plug in things like USB sticks?

Yours,
Linus Walleij
