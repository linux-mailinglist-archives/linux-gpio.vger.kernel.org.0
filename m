Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39ECC393F68
	for <lists+linux-gpio@lfdr.de>; Fri, 28 May 2021 11:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236542AbhE1JKG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 May 2021 05:10:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236689AbhE1JJq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 May 2021 05:09:46 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4059C06134D
        for <linux-gpio@vger.kernel.org>; Fri, 28 May 2021 02:08:02 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id v8so4278409lft.8
        for <linux-gpio@vger.kernel.org>; Fri, 28 May 2021 02:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VJUFVUjwMi3jp1lDpVisyiJzn7Zhoa8E+bQf9DwQVqs=;
        b=fpYeaAiobh84ePdqE0lJtTQRLx27OqasFcegutrZktiaCGsASz+DMX4fKBLm26YlY5
         M7A6YWw3xaofHKY0wgdSuH1fc9F8P7AaH3mngotvTgh8lFRMa6ky7HvX6MZgBPWYYB0Z
         yT6Z3ymqSzYfEstFNYIvNPKqwp7fnMbcUwMVqJtZ98ZE2Z0WoF7qORBprrS/YW3LaG/A
         Ucd8lp1sbFF4vtWkEZ54MCc7R1NjuiRe//fgzBXCjU68LLCuIn97/TWMQ5wDwiqs93jz
         8LLzxcaNWPAxW/pYgxCyB9/FU/uHoupokEXnqZ3uT+NFXAfoqI2pZOZBHAcHGddIGqbj
         Gq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VJUFVUjwMi3jp1lDpVisyiJzn7Zhoa8E+bQf9DwQVqs=;
        b=Dn266u/RZylSw+v4jG8eyEnHNFjTHO4gDXt4dBIlJstFl7Jl4EOrdH4n5+KNE20dXM
         9H1OCKVeQlg6orGFHiQp5a7GgbkKTgF1Lw/WKvV1n24TMvWXE+ggntTo8u8QJ5tsZeOO
         bTrSXNIz8xXXAJX+g82gyEwRyR6G1C/4wuD/5i17OKbcVT3r+nRyXC/uZVVdUrFRdw9D
         Fk2EjJyeaiJ/dWoNCnO3Gn16Tjt9h0OQx/j5UZ9dtgo2hw2SVHRQt6EDw8x0Qfz8GK56
         ViYyWrmcCl98imV559Xd3dYQfPkvHGDbUzKtXCPcmrjdNwLgLGoWmsqNFtgc6gI5cx9P
         iP2g==
X-Gm-Message-State: AOAM5329i5NJSKJDO4FhF/lWunr25MFJhVf9XooE/sRET72F6JLOCa1m
        JIEX2iTCxZRyzVcnipPw+LNeNmSWCcWGsaJLHpiytQ==
X-Google-Smtp-Source: ABdhPJx+MczqJp0WaFPiI1m6x20/PKlEQDY+9K+GCnZ31rKGFb2DvTQymQLi+07iXyF2+WSjeSbcPFZAxbRKsMGeaqY=
X-Received: by 2002:ac2:47e6:: with SMTP id b6mr5079578lfp.649.1622192881082;
 Fri, 28 May 2021 02:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210520202730.4444-1-dariobin@libero.it> <20210520202730.4444-3-dariobin@libero.it>
 <87ea9971-9e15-c595-95cc-14c68b0b68d8@mleia.com> <1972814783.387983.1621877304255@mail1.libero.it>
 <414c9176-7922-929f-e82e-f80f07e91b2c@mleia.com> <106030092.519428.1622143415836@mail1.libero.it>
 <b25a0e33-d7e8-322a-2a73-bda6e88c8f8b@mleia.com> <2062056721.520514.1622147634190@mail1.libero.it>
In-Reply-To: <2062056721.520514.1622147634190@mail1.libero.it>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 May 2021 11:07:49 +0200
Message-ID: <CACRpkdZb4WZS8cd=nFz_J0GrBc5HJ8SMYtniB2W_Jpq_vtPTYQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] pinctrl: core: configure pinmux from pins debug file
To:     Dario Binacchi <dariobin@libero.it>,
        Tony Lindgren <tony@atomide.com>
Cc:     Vladimir Zapolskiy <vz@mleia.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Drew Fustini <drew@beagleboard.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 27, 2021 at 10:33 PM Dario Binacchi <dariobin@libero.it> wrote:
> > Il 27/05/2021 21:57 Vladimir Zapolskiy <vz@mleia.com> ha scritto:

> > Unfortunately you continue to cling to the broken interface, while I see no
> > comments from you about asked to consider pin groups and pin group functions.
>
> Could you kindly explain to me, with some practical examples, what kind of interface
> would you implement ?

I am not fully understanding this discussion.

I get the feeling that this is caused by the early architectural decisions with
pinctrl-single to put all configuration of pin groups and functions per pin into
the device tree.

Tony specifically wanted this because what he gets from TI are some raw
ASIC data dumps from the designers, that he could make a script to process
into device tree rather than into .h files, and get this out of the kernel.
(As I remember it, Tony correct me if I'm wrong.)

This makes it hard to align some concepts of the pin control subsystem such
as functions and groups because pinctrl-single assume a 1-to-1 mapping
between one pin and one group, which in turn has a 1-to-many mapping
to functions.

Is the patch trying to debugfs around this somehow?

If this hack is only needed for pinctrl-single.c then it should be placed in
that driver, so Tony can review it and maintain it as applicable in that
driver's context only, not in the pinctrl core as it appears the general
applicability for other drivers is not there.

Would this really be useful for other drivers than pinctrl-single.c?

Yours,
Linus Walleij
