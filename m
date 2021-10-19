Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D754B4333DB
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Oct 2021 12:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235166AbhJSKvb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Oct 2021 06:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235258AbhJSKv3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Oct 2021 06:51:29 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B9E7C061749
        for <linux-gpio@vger.kernel.org>; Tue, 19 Oct 2021 03:49:17 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id m20so19704533iol.4
        for <linux-gpio@vger.kernel.org>; Tue, 19 Oct 2021 03:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S8qU62v5ABSqw8uHLGFA6G1Wsae+M8SptK2YZCIED20=;
        b=4nCu9j8hZHb4nBfjRvjVINhLDXFKdtQd38DuyJTmPyBjUNgAJAZWabGhsTciNk4GAc
         427FyusGK0wRzyP5mK95FFKk5xE+/LptfuNW3i0icvifyyP/CvnOBhwWp2Fh6TA5Yh1o
         B/uRg2wcsO2OO3f/JOdlgBpHO4e/ODEgDMzIfDhAZNNAyzCjxjw/i1tk5qvz79POWaUM
         xQYKWMhFn09ax31sdovt6iHW05trDF8EJmWVro3RfLi8EKNAZqQkAcn8oZLkNg7VBjOl
         51WClz0XZMSkaAXUzQoMr1DtORmDqs40nD1+j/nE1cqCSG7ys3GS4eS8GdUmsL7JfwLq
         Bw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S8qU62v5ABSqw8uHLGFA6G1Wsae+M8SptK2YZCIED20=;
        b=lTyqRf1uN/SMbfc02ZBwIp3XTb2d/qyy/22omseZZ6fSuX+ElpWViRwiKILwEZTPQz
         Xexd9lWEv3b8T3x6C9OE1gemfPPVs8ExTWmfqzF2U8YzN6pcj1vzbak3UlFZNvA4mwZ0
         FsQ4DO1chNlztQBMV1JOz6bRerd1zyGdSZZ9JNzhscciBYYTIxQqNde67R8Vyz2V+znA
         WoPC0UnqUbTEER3zbCQmzTBgtK8O9ITVLNq1nY0NBkyycSA7hDfOGY12Yvcr3jmwkdHs
         2SorJ6cKqbfg8EVYU00kSJFtHz6bdFvwcLi8eevZhXJQLPZslHvL6VGXbp5xsSXKtn7M
         Yzlw==
X-Gm-Message-State: AOAM533CsfVaUYvLKuRRUBlslfO8rEVh/y3UppeBEG6D2o8MsudSvvJu
        ZT5BVBMoSIUfMFVi174xYMq9wFWvMASEiycJqHRcKg==
X-Google-Smtp-Source: ABdhPJwnIonL+/XK5k8HqiIuHro2Y3pbpLIttvFLCUZAL3irD4adnb7DqD/Ox2bNwS5GtVH+xGM1GbQ8lsD8aZhjA/Q=
X-Received: by 2002:a5d:9813:: with SMTP id a19mr18348121iol.74.1634640556207;
 Tue, 19 Oct 2021 03:49:16 -0700 (PDT)
MIME-Version: 1.0
References: <CA+HBbNH7wcpfQOX2=vZmW78GoWy_WL3Pz-dMKe0N0ebZDp+oUw@mail.gmail.com>
 <20210713222528.GA952399@robh.at.kernel.org> <CA+HBbNFj5+6sLKxmL8XtsZQ48ch8OjTbJ1bwkDC8dfRiOyWY1Q@mail.gmail.com>
 <20210719225906.GA2769608@robh.at.kernel.org> <CACRpkdbq6Jow6AT9OpsR7Q0JVCWVMcmamh9KHPXMtUnkoe7ZFw@mail.gmail.com>
 <CA+HBbNFEs-=5XTK7PUL+LsgBCcPfwHsCPe4v6byK0x=O_7TRPA@mail.gmail.com>
 <CACRpkdZfZLQMgpMAF2FwSVt1YAzhQJ9ZWkVUjVc2xpmWL7yEvQ@mail.gmail.com>
 <CA+HBbNHZyYnnyz9=4Hgav96ZH8-R-nYoi300j2x3fgei8aa4zQ@mail.gmail.com>
 <CACRpkdaBUrgnyFnO0Tdae56PKR4pLN1boLpK0FMCk7eYshZ5LA@mail.gmail.com>
 <CA+HBbNFeTN45cz8G75V94tF9cBcOGNzeenTMjdJ-4oKFCvHYLA@mail.gmail.com> <YW4iIP7jpRj4qcNN@lunn.ch>
In-Reply-To: <YW4iIP7jpRj4qcNN@lunn.ch>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Tue, 19 Oct 2021 12:49:05 +0200
Message-ID: <CA+HBbNH+4US9U_ZfGZHS2J-pBou2k1LCOAZwuestQHK1GmH0Eg@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] dt-bindings: mfd: Add Delta TN48M CPLD drivers bindings
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Luka Perkov <luka.perkov@sartura.hr>,
        "Jonathan M. Polom" <jmp@epiphyte.org>,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 19, 2021 at 3:40 AM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > The SFP driver requires GPIO-s, it only knows how to use GPIO-s, and
> > its a generic driver,
> > it covers any device that has an SFP port that is implemented per spec.
> > So, I cannot just extend it to suit my devices needs and I don't see
> > how can I extend it in
> > a generic manner so that it controls the pins directly via a regmap
> > for example, especially since
> > each switch has a different number of SFP ports and thus pins and a
> > different register layout.
> >
> > I have added Andrew Lunn as he is one of the maintainers of PHYLIB
> > under which the SFP driver
> > is, he may have some input on how to proceed with this.
> >
> > I honestly think that we have some kind of misunderstanding here and
> > look forward to resolving it.
>
> Hi Robert
>
> Can you describe your hardware and regmap in a bit more detail. What
> do these registers look like? How do they map to the SFP cage pins?

Hi Andrew,
This board is simple as it only has 4 SFP ports so they have split the
respective
pins into individual registers per their purpose.

So TX disable pins have their own 8bit register and they map pins
using individual bits.
This is how the register looks:
+-----+---------------+-----+-------------------+---------------+
| Bit |     Name      | R/W |    Description    | Default value |
+-----+---------------+-----+-------------------+---------------+
| 7:4 | Reserved         | R/W | Not used                |     0 |
| 3   | TX_Disable_52 | R/W | Enable/disable       |     0 |
| 2   | TX_Disable_51 | R/W | SFP TX transmiter |     0 |
| 1   | TX_Disable_50 | R/W | 1 = TX off               |     0 |
| 0   | TX_Disable_49 | R/W | 0 = TX on               |     0 |
+-----+---------------+-----+-------------------+---------------+

Presence and LOS pins also have their respective registers in
the same format.
So you can see that the register bits map directly to the SFP cage pins.

Regards,
Robert
>
>           Andrew



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
