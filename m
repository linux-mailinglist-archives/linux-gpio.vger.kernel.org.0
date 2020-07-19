Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0A54225385
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Jul 2020 20:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbgGSSgD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Jul 2020 14:36:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgGSSgC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Jul 2020 14:36:02 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4427C0619D2;
        Sun, 19 Jul 2020 11:36:02 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id k27so9263802pgm.2;
        Sun, 19 Jul 2020 11:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sY6yoJK7n313gNhifc/ruWkdji4zjYN/sZWct3ewZp8=;
        b=dKZLawbb1kpmrdq+ONhwPuDhDtRLQ5sf0Fx6hybaSuP7JQegE9OwVqrIZEhBDumtnd
         IIazLgfYVkOjidxMIipflq1hTSXNjFsAMV2rwnsQi7r4Vs6WrxN7dRCh5A7SJel+sxnR
         i19mGf+CQLZDraTPdiAdvwPbHxx6O1q26WGP4O9qimCOeK7RLqTU7BtLF3sP4MiJT1Ia
         1/0+pSSF1ALgB886ntm0tGhOlf25yHPVbKR5aql/Itnjl7V3Rc6Q4AkhIER9Bj+Pnkbs
         YBNIMlV+x4zTbJFNfA8xIxZPCN7TXWYwT2n3O5m1RaNjY9gCpEPGnsOe94s0dxuDWqUl
         SROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sY6yoJK7n313gNhifc/ruWkdji4zjYN/sZWct3ewZp8=;
        b=UfE6Q1eetbKvevEPKHp9eJG2CM5rGrLqoSiqvknKJ5XSrxyjytzKErjilmfINZyz1x
         f419a/eB3m9FgjxGWivCMvVDK1f9UyCe12H7Ma5tWYjFkb+I2xZxOL0d8IPWwJfaf3x/
         e/bJPjTratBAvBWovnO2vqQelfkVy+wTvdNrWWH1fBQFHqJLRBszcVn+egIQV+TomdhO
         XKqZZw4Ey6w3vMrsAtDQS55zlaJPYhPJfycAFQxgaW1Vr6RWkEq2tQZzuWCzGOvGzDLH
         9aITDJDQF425FbFQs4cEGiWFSHyJTB33Qgvqihy/b1IrArwI6CBDLOAqiZBaab1XF+w0
         HX2A==
X-Gm-Message-State: AOAM531kAL95AYwGFKGHsQ1e12jcV6Mhy3e0rWxp0qZJ4o494tDazKER
        aiRUDtzyb3Dv/cf0wazmE+Ky8eet7rjsmg2Fu/k=
X-Google-Smtp-Source: ABdhPJysOG+lEBrx7r/irP580NL19hL0iNrok9ERpQjiyv4dBgaa/kolMq3BlTQ0I0wZHRDRiHkVtsMc4h3epTTRirI=
X-Received: by 2002:a63:ce41:: with SMTP id r1mr16517190pgi.203.1595183762060;
 Sun, 19 Jul 2020 11:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <01afcac0-bd34-3fd0-b991-a8b40d4b4561@enneenne.com>
 <CACRpkdbX9T9EuN-nxkMPC=sN74PEdoLuWurNLdGCzZJwwFrdpQ@mail.gmail.com>
 <1c4f1a83-835a-9317-3647-b55f6f39c0ba@enneenne.com> <CACRpkdZPjJSryJc+RtYjRN=X7xKMcao5pYek1fUM2+sE9xgdFQ@mail.gmail.com>
 <CAMuHMdUtguuu4FWU4nRS=pBUyEwKM1JZ8DYPdCQHXBYN0i_Frg@mail.gmail.com>
 <87efe96c-3679-14d5-4d79-569b6c047b00@enneenne.com> <CAMuHMdUght0hkJT1N8ub5xR5GB+U18MAhAg+zDmAAuxoRSRaYg@mail.gmail.com>
 <d30e64c9-ad7f-7cd5-51a4-3f37d6f1e3d8@enneenne.com> <070fa558-6e20-0fbf-d3e4-0a0eca4fe82c@enneenne.com>
 <CACRpkdYFAW2bcB53M3_b2LsveJO_PWZJhprGhdTtfmW11B1WmQ@mail.gmail.com>
 <f66dc9c4-b164-c934-72a8-d4aca063fca5@enneenne.com> <CACRpkdbjc6vvpHVjnJNGisRw6LiLZd-95aHWJJORwvaRNigPcw@mail.gmail.com>
 <cb6e208b-446e-eba4-b324-d88aec94a69b@enneenne.com> <CACRpkdZBUw5UPyZB-aeVwh8-GiCifbwABZ9mOsyK90t3cdMQ+w@mail.gmail.com>
 <80bf1236-aacd-1044-b0e5-5b5718b7e9f0@enneenne.com>
In-Reply-To: <80bf1236-aacd-1044-b0e5-5b5718b7e9f0@enneenne.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 19 Jul 2020 21:35:45 +0300
Message-ID: <CAHp75Vc1ezuW9m8OCQUmEJoNVoD-Z3eWF=Lzcr2v32Br8Gr60w@mail.gmail.com>
Subject: Re: [RFC v2 GPIO lines [was: GPIO User I/O]
To:     Rodolfo Giometti <giometti@enneenne.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 16, 2020 at 6:17 PM Rodolfo Giometti <giometti@enneenne.com> wrote:
> On 16/07/2020 15:38, Linus Walleij wrote:

...

> I see but this interface is not designed for such complex usage nor to compete
> with the current character interface! It is designed to allow boards
> manufactures to "describe" some I/O lines that are not used by any driver in the
> device tree,

Why are they not in firmware tables? Platform is a set of hardware
that makes it so.
If something is not in DT, then there is no possible way to know what
is that line?

Or in other words how does the OS know that the certain line is
connected to a relay?

> and that users may desire to manage in a very simple manner. Let's
> thing about relay lines, or just a locked/unlocked input line which can be
> easily polled.


-- 
With Best Regards,
Andy Shevchenko
