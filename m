Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC29F680AAC
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jan 2023 11:19:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235595AbjA3KTZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Jan 2023 05:19:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235232AbjA3KTZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2023 05:19:25 -0500
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 026DFC5
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 02:19:24 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-506609635cbso153090137b3.4
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 02:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PbXYa+1h3JGvPkI2e2r9wC2zYeWqmL9dDlStBP8aWMM=;
        b=P1Afal8LKNvPUJSin0zCuWNGxjS37wy4usQNo6LkXuXy6je0VuAuIqfB8tCwih5irG
         y4ZfLXI9SlU15jdPOWs14HIIdKbBCvrEJVKhsv1iiQofNDDtlEuQ6Wes5WEvzBJPv+B/
         Elc1GyKOdAViuqx89zYJTmYSwJXGjtM1itHKqKb/VBZIVx90+6Bg+RBgV464cn7wFctt
         G4Lzw8wlvMqr3keW/p5lBzfCaAyKUDB1mcz4KWznWrmfO97t82BEnNt+a1jBP6vClPf5
         6o8ahX95k7fpvoxuOXSReCWuR0WY9UwAbosEGoVLSHDeOaN7dv+7Yl8+z66CyTYWw4M/
         lveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PbXYa+1h3JGvPkI2e2r9wC2zYeWqmL9dDlStBP8aWMM=;
        b=rXpmAnY67ord73wYO7Yx2oW/p+d54MC09MaC9xsauNS2bv4hb5R5L1xOrbeAawsiJn
         JqAhlp0whJCKA1HbwV0J1y52ick+Rzjjv0eB9BJrFKqgTRijl94Z1HF+/4PbbCvbd7Vg
         VxN4OBuAwNP9mK7Ic8cp+MNos4yLvZSSls0JREEUohz5M5cIBxRvhPy3HiVn5KsR2ndO
         bbPnKbiIO8ftstplk4Zg+8+qU3DZaXJABOqs5Dq/DtorPi01f7PtVFPMqdxsUTdYqLhQ
         9FyHtGKyu6nWV5HOtmwAg+ohagmbnzCVs1BVLbdzokpHEPpkPfXNlDDrAjAV39vYsdbf
         1QlQ==
X-Gm-Message-State: AO0yUKXK5xO5YdHuhgwxAkEXK7HHjEhjEQbhwypV7tthVpjk+mbgOXia
        CY7s6+VtSUStArouGL1ATFDhfYt00JHzRzMxqOSNLA==
X-Google-Smtp-Source: AK7set+0MAxUtAkN4x5F4XkIljJVaPumURc09EsRCucecuM5EIkR9bNRXC57l1nStthPhJvMbVWYb7913x3oESiOiu8=
X-Received: by 2002:a0d:e701:0:b0:506:66f5:fd24 with SMTP id
 q1-20020a0de701000000b0050666f5fd24mr2863987ywe.130.1675073963201; Mon, 30
 Jan 2023 02:19:23 -0800 (PST)
MIME-Version: 1.0
References: <20230120104647.nwki4silrtd7bt3w@pengutronix.de>
 <CAMRc=Mdo0tvJUJ2G+9BGfyVYBwUQKRZU36JEUZdxVVnXETZHLg@mail.gmail.com>
 <20230125093548.GB23347@pengutronix.de> <CACRpkdbcrTv+=7Ev750O=UO=V=afp5NnTT4znb0rzWLkom+_cg@mail.gmail.com>
 <20230126104927.GE23347@pengutronix.de> <20230129183339.GY24167@pengutronix.de>
In-Reply-To: <20230129183339.GY24167@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 30 Jan 2023 11:19:11 +0100
Message-ID: <CACRpkdYRynwJJZR5uCEn9rmE3c8p7R8SQdXC2FkzRUkBYRjErg@mail.gmail.com>
Subject: Re: GPIO static allocation warning with v6.2-rcX
To:     Robert Schwebel <r.schwebel@pengutronix.de>
Cc:     Sascha Hauer <sha@pengutronix.de>, bartosz.golaszewski@linaro.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Marco Felsch <m.felsch@pengutronix.de>,
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

On Sun, Jan 29, 2023 at 7:33 PM Robert Schwebel
<r.schwebel@pengutronix.de> wrote:

> While this could also be done with a daemon offering a dbus api, this
> would be significantly more complex. In a critical environment, one
> needs to make sure that the daemon process never fails, otherwhise the
> power of the DuT would maybe be in a random state. Then of course one
> can add a watchdog, but with the current sysfs interface it's really
> simple. Of course that would also work if the new interface would offer
> a "keep this line as it is" feature, but adding a dbus daemon just for
> keeping the state of a pin sounds overcomplex when the kernel could also
> provide that functionality.

One issue we face as developers is scaleability. Things that
seem straight forward on a single board computer in a lab get
really complex in a big system with man GPIO chips.

One of the big dangers of the sysfs ABI is that it is dependent on
probe order which the kernel sadly does not really guarantee.

It's a bit like /dev/sda /dev/sdb after you boot up a system with
two USB drives, certainly you know which one is sda and sdb
if you plug them in by hand, but if you just boot the system with
both in, what is the kernel expected to do, and what is expected
to happen? What happens in practice is first come first serve...

This means a script can work for years, and then some random
day a PCI device is sleepy and comes after some other device,
and the numbers of all GPIOs are shuffled.

However, if you feel safe about that, for example if there is only
one GPIO chip on the entire system so there will only ever be
gpiochip0, what do you think about my debugfs proposal?

The below is cut and paste from the drivers/gpio/TODO file:

-------------------------------
Debugfs in place of sysfs

The old sysfs code that enables simple uses of GPIOs from the
command line is still popular despite the existence of the proper
character device. The reason is that it is simple to use on
root filesystems where you only have a minimal set of tools such
as "cat", "echo" etc.

The old sysfs still need to be strongly deprecated and removed
as it relies on the global GPIO numberspace that assume a strict
order of global GPIO numbers that do not change between boots
and is independent of probe order.

To solve this and provide an ABI that people can use for hacks
and development, implement a debugfs interface to manipulate
GPIO lines that can do everything that sysfs can do today: one
directory per gpiochip and one file entry per line:

/sys/kernel/debug/gpiochip/gpiochip0
/sys/kernel/debug/gpiochip/gpiochip0/gpio0
/sys/kernel/debug/gpiochip/gpiochip0/gpio1
/sys/kernel/debug/gpiochip/gpiochip0/gpio2
/sys/kernel/debug/gpiochip/gpiochip0/gpio3
...
/sys/kernel/debug/gpiochip/gpiochip1
/sys/kernel/debug/gpiochip/gpiochip1/gpio0
/sys/kernel/debug/gpiochip/gpiochip1/gpio1
...

The exact files and design of the debugfs interface can be
discussed but the idea is to provide a low-level access point
for debugging and hacking and to expose all lines without the
need of any exporting. Also provide ample ammunition to shoot
oneself in the foot, because this is debugfs after all.
-------------------------------

Yours,
Linus Walleij
