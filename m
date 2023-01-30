Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C45EA6813FE
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jan 2023 16:02:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237912AbjA3PCD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Jan 2023 10:02:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230469AbjA3PCC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2023 10:02:02 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6177C18ABA
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 07:02:01 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id d8so12376914ybe.9
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 07:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EG2B1C4s+f5pn+Bi8s8Q4NvNTKcXVJS31lh0+wFrn/U=;
        b=VryTxW12v69eSAOCYlc+ZiHSN5T8IX5NnyfG19u+pawUNe3pZ44QF5nTb8O3uk4rVk
         kBd8WG8KWRbM/8GoM/xnhYidGBzjCEE3f3pLrm+KYfHHk7Xu/o9fCW7oKRZKfTyHkB7i
         9MQHak4htUodor8cSAX/CsZb+vnXmm1z0dDP1iwzqwGrXtDe3iiGczQGn/1nSK/HOPB7
         Kndd66WgwGtGXH64TAXcQL8EVoY5RR358NFKtzot9ZZSTq4fyIV100OS0ZC7uXfkPoJl
         CS4FSclmSkk7Cc87DbfNHdMzb6idH6WfHkqJDJJfT4M9dMjHCy3q8BmlyryMVHA7xbh6
         KPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EG2B1C4s+f5pn+Bi8s8Q4NvNTKcXVJS31lh0+wFrn/U=;
        b=7hpmz2lfFpBQoPKAG18OKgru1hm0xUKVos5kDrJABFvrzRopwjTRjISGWAimPUkBD1
         5ucOStOz1bMRj44PLdClX99qXz6fn6xLVSEPs586jZIIch3YszsILK900aSi+ttHAa4S
         sBYiTe8yDFIeURMWn87aPUf4RADm2H0knZaX1ErrswOmmT1R4N5DcqY6DIRFk7t82Qt+
         Rn97b5C3LnxJ12IoJhcmu9cnV1Uj/rlWAKFXP2u6BAIkHVouzubde4kO2o9KcdySyi+B
         1rdMPkcEqJ08rCYrZt4WYp/o7CXp4oRnz2hDTllhczeJ/o/W2ejpzbQYDIwqwCPEo1+p
         NRhQ==
X-Gm-Message-State: AO0yUKWcKA7ip249/BkdnhXfz3NyTaelxjUyfbL7ZGGKLZCYeG4N3Mo3
        bHxuZbcfd26KB27/tIPdZH2uUhnm9ZPX22rug3ZfVQ==
X-Google-Smtp-Source: AK7set9ZzMA5OCWOES+epiJBxN9ILSuemeYx87ZkjsyliWsq8rH8EIY1ddcbucjnwLB82hNnmW6wU4BRWITQf0vzMoA=
X-Received: by 2002:a25:d1d1:0:b0:80b:4d84:b25 with SMTP id
 i200-20020a25d1d1000000b0080b4d840b25mr2071588ybg.584.1675090920554; Mon, 30
 Jan 2023 07:02:00 -0800 (PST)
MIME-Version: 1.0
References: <20230120104647.nwki4silrtd7bt3w@pengutronix.de>
 <CAMRc=Mdo0tvJUJ2G+9BGfyVYBwUQKRZU36JEUZdxVVnXETZHLg@mail.gmail.com>
 <20230125093548.GB23347@pengutronix.de> <CACRpkdbcrTv+=7Ev750O=UO=V=afp5NnTT4znb0rzWLkom+_cg@mail.gmail.com>
 <20230126104927.GE23347@pengutronix.de> <20230129183339.GY24167@pengutronix.de>
 <CACRpkdYRynwJJZR5uCEn9rmE3c8p7R8SQdXC2FkzRUkBYRjErg@mail.gmail.com> <20230130110252.cnw4ex6g3gc5bl3w@pengutronix.de>
In-Reply-To: <20230130110252.cnw4ex6g3gc5bl3w@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 30 Jan 2023 16:01:49 +0100
Message-ID: <CACRpkdb-LbRrg0gwB6ArJ-=YdM5TtXVN3oZf58hPCppnt8ZUjg@mail.gmail.com>
Subject: Re: GPIO static allocation warning with v6.2-rcX
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Robert Schwebel <r.schwebel@pengutronix.de>,
        Sascha Hauer <sha@pengutronix.de>,
        bartosz.golaszewski@linaro.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        christophe.leroy@csgroup.eu, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de, shawnguo@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 30, 2023 at 12:02 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
> On 23-01-30, Linus Walleij wrote:
> > On Sun, Jan 29, 2023 at 7:33 PM Robert Schwebel
> > <r.schwebel@pengutronix.de> wrote:
> >
> > > While this could also be done with a daemon offering a dbus api, this
> > > would be significantly more complex. In a critical environment, one
> > > needs to make sure that the daemon process never fails, otherwhise the
> > > power of the DuT would maybe be in a random state. Then of course one
> > > can add a watchdog, but with the current sysfs interface it's really
> > > simple. Of course that would also work if the new interface would offer
> > > a "keep this line as it is" feature, but adding a dbus daemon just for
> > > keeping the state of a pin sounds overcomplex when the kernel could also
> > > provide that functionality.
> >
> > One issue we face as developers is scaleability. Things that
> > seem straight forward on a single board computer in a lab get
> > really complex in a big system with man GPIO chips.
> >
> > One of the big dangers of the sysfs ABI is that it is dependent on
> > probe order which the kernel sadly does not really guarantee.
>
> Does it? At least the drive I listed (e.g. the imx gpio driver) uses
> aliases to make it reliable.

I'm not sure that is the intended use of the aliases in device tree.
(Rob can maybe answer this.)

Besides, the problem exist also in ACPI (think every x86
laptop) which does not have anything like the alias mechanism
AFAIK. If it does, Andy will tell us.

Yours,
Linus Walleij
