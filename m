Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 469B92D9552
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 10:34:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729194AbgLNJcE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 04:32:04 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37915 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730023AbgLNJcC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2020 04:32:02 -0500
Received: by mail-lf1-f66.google.com with SMTP id w13so28423939lfd.5;
        Mon, 14 Dec 2020 01:31:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iEQOa1KyD8rRBQoesPEdwYar8HlmHpIMiNq3+DeVMcg=;
        b=jF93oqSx/QnQu8k7xce0IThC5TzX5hcKnuUQi1Ct4Z4cWmb7Nb1DTCpG8uMCAYDe8r
         NNx6V7/XBs58Q41IVLsh5NKvqyJXwltCoUVLo6ELvXJSMFNvP+MvSklz+HitMkdCyDZZ
         T+1ScAMu3cuxCyo86R84ltTrUw1GrKNp9rR4N5W6e3JYD1o7ffHhuafbLwT0nLMGHT6t
         yI6l4D5/+8rEHn8aO4WyjzCeSm3X6x+R7M8skQPEzcHYFexiY74I5xfPHy8YtEc638SI
         DX6ClxjbY8J+JJkASSIWozvwOf7td1p6GVA0bVzBHNDJsa+Xgr2QYHsLy6E+kquOiAqL
         KG1A==
X-Gm-Message-State: AOAM531yxpxKDNz5h6cGsGS4zJVjCtnP3yAv7NGcaUMCXF4FDP0gw/3G
        6BXfklFPUf7BLPmbZn0LEyE=
X-Google-Smtp-Source: ABdhPJwOQnT9fbmW4xE+ehve1pKCvrchgtgamhzLGlhSGTHXpGbNWkXLPlwK38YrO1V7Xs+CJ9z63g==
X-Received: by 2002:a2e:7c12:: with SMTP id x18mr4285319ljc.324.1607938280113;
        Mon, 14 Dec 2020 01:31:20 -0800 (PST)
Received: from xi.terra (c-b3cbe455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.203.179])
        by smtp.gmail.com with ESMTPSA id l19sm781887ljj.87.2020.12.14.01.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 01:31:19 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kokCJ-0006ac-3U; Mon, 14 Dec 2020 10:31:15 +0100
Date:   Mon, 14 Dec 2020 10:31:15 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        patong.mxl@gmail.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Angelo Dureghello <angelo.dureghello@timesys.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] usb: serial: xr_serial: Add gpiochip support
Message-ID: <X9cw443vY2RPlSMO@localhost>
References: <X8ZmfbQp7/BGgxec@localhost>
 <CACRpkdZJdxqxUEQaKUHctHRSQAUpYZJtuxonwVd_ZFAsLBbKrA@mail.gmail.com>
 <X89OOUOG0x0SSxXA@localhost>
 <CACRpkdavm7GG8HdV1xk0W_b1EzUmvF0kKAGnp0u6t42NAWa9iA@mail.gmail.com>
 <X9DsWahl6UDwZwBn@localhost>
 <CACRpkdYm-j9QcK8hgNrC33KruWE17Q0F4+T=UanE7PCEZEtu6w@mail.gmail.com>
 <X9HiGaIzk4UaZG7i@localhost>
 <CACRpkdZ6MUzRe9m=NrqA_5orhZXDtWj+qoFMHX7v6Zjsx-rVGg@mail.gmail.com>
 <X9cpQO3IV4IgX1dh@localhost>
 <CACRpkdaGWpk=hB6osfXDqx_aSx0aYDyqJRNtY3Gr8z4bLPxZcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaGWpk=hB6osfXDqx_aSx0aYDyqJRNtY3Gr8z4bLPxZcQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 14, 2020 at 10:19:07AM +0100, Linus Walleij wrote:
> On Mon, Dec 14, 2020 at 9:58 AM Johan Hovold <johan@kernel.org> wrote:
> > On Sat, Dec 12, 2020 at 01:03:32AM +0100, Linus Walleij wrote:
> 
> > > If I google for the phrase "Detected name collision for GPIO name"
> > > I just find the code, our discussions and some USB serial devices
> > > warning about this so far.
> > >
> > > Maybe we should just make a patch to disallow it?
> >
> > That would make it impossible to provide name lines on hotpluggable
> > controllers, which would be nice to support.
> 
> I merged a patch for this now, let's tighten this loose end up.
> 
> Also: thanks for poking me about this, I should have looked into
> this ages ago :/ focus you know...

Yeah, tell me about it. :/

Johan
