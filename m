Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1658296F95
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Oct 2020 14:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463969AbgJWMoS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Oct 2020 08:44:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S463968AbgJWMoS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Oct 2020 08:44:18 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF34C0613CE
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2020 05:44:18 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id dn5so1389148edb.10
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2020 05:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MIeOvpkzyWPH53MnEJZgPzMzdcwfx+u8hSGtweDNtJ8=;
        b=IR1zc0W2lT95OQxkKQPqD4WnSP9cvyBGDBqm/yZrbp4QMArCbo29QLepApoGxBKAU+
         sQq9xSVVFyOoRzUWmlNXmDDeoUJqf1rToJhfFWW+Gyi8Jm5VRb6jeiJo/KBvMOTNw83D
         9xg++K0vjsYq5GU+3393OnWpYwQT4Xx8DhcnPj7ewQHfyHbjJajGAs0xCUFAKI+r2gJm
         Z+9W+vSFMbY9EnuEL4/PQctI/Hwn1AxtLXGBBMdml1r948y6CXEOOb8vnGKRokjfzUaz
         t3FwXdKO0YGPK3qZWAs6eNTBJFBLMRppypHEEU3y9KkvuRZWqyFaIgdm4uSAroBw3fbi
         iGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MIeOvpkzyWPH53MnEJZgPzMzdcwfx+u8hSGtweDNtJ8=;
        b=CN6Kj8vSJN2rd0Ax9tYAZwlEzlOl0zGvkJKaIqYskLuUY9OuqidqZ5eMmrYj8ZS2j0
         O0S8H/yXlcrbifkEeqbq7mgr8WWznXIsXeJYC59V6DopoibkYHVeRom5HoG9Si+ZiXXK
         jp8fp7O2ZiEeKvKWvGRKJCpmf/RlvbZDQGUrEPtr2SMvvaSXmC6AJLtIrgol8vG2GeTC
         36j9ngDgTUXt8Cgo1gNEqaCNFVxOpz9PuEoKaiixQja2ylLAnesWKNhlQ8GMhwItC+QJ
         PayweUueiDFGK8B11d5zCYq66D6iis0A4HCIERzcjKk47z1oQlSBHoBX5lGGgAvckGGB
         Nwmw==
X-Gm-Message-State: AOAM532NSHIvZLF/Fshojo7zr3c8rb0n49GadzcLzAs9W1ENM8bxdD3J
        BuZSizcQH9uFUJT7I9mNV2WuSy0rNXXG+yNBH26sTg==
X-Google-Smtp-Source: ABdhPJxv+kBxxzNSWlx51PaCGLX5nayXaFTWeIz01EgVQdsZHbxa8V2uLHwTPmcCoZ5nsw4UQ9oDrr0tY24Xl3KWWkc=
X-Received: by 2002:a50:9e0b:: with SMTP id z11mr2031207ede.341.1603457056896;
 Fri, 23 Oct 2020 05:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201023092831.5842-1-brgl@bgdev.pl> <CAHp75VeiGSJO5XnpQLMs=0nT=otVjC1tOsR7xp1gJ3tLHwUTaA@mail.gmail.com>
 <CAMRc=McD7jtBQ_CPV26Pzr63T6-o_aPpYt_CT-48H_mGuhxrGw@mail.gmail.com>
 <CAHp75VcxaqmJocQ8jYouJ80P0anN5ENheH2yK2Sm-sHXjA5NoA@mail.gmail.com> <CAHp75VeGFuF7NrGJ9sc+kXz3e-wzGi3kTDmW56oaNKJf65NZLg@mail.gmail.com>
In-Reply-To: <CAHp75VeGFuF7NrGJ9sc+kXz3e-wzGi3kTDmW56oaNKJf65NZLg@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 23 Oct 2020 14:44:06 +0200
Message-ID: <CAMpxmJWWt5MhqObJabOxtdm9U4rQ6EPvJR3PHBRH_J1uLMat+Q@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] treewide: rework struct gpiod_line_bulk
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 23, 2020 at 2:08 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Oct 23, 2020 at 3:06 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Fri, Oct 23, 2020 at 2:39 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > On Fri, Oct 23, 2020 at 12:24 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
>
> ...
>
> > > Nope because gcc will scream:
> > >
> > > error: flexible array member in union
> >
> > Ah, of course. Should be
> >   struct ... **lines;
>
> But it is not gonna work... we need an array here. or just one member
>
> struct *lines;
>
> bulk:
>   lines = malloc(num_lines * sizeof(lines));
>   xxx->lines = lines;
>
> single:
>   xxx->lines = line;
>

The definition I used is clearer - it's explicit about using an array
with a single member by default and can be extended as needed when
allocating.

Bartosz
