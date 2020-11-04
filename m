Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE902A6EFE
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 21:41:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730842AbgKDUlu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 15:41:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730143AbgKDUlu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 15:41:50 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20135C0613D3;
        Wed,  4 Nov 2020 12:41:50 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id u4so5752691pgr.9;
        Wed, 04 Nov 2020 12:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sM+nzIGxkHOdgoAI6FNOyuGOwSE82BOd/kFKaU8OJ1g=;
        b=SfWaStZ1dN9t6Mb8OVMMvCZIJRmYZYqANwTSYpicZs2aH7wUbqoaM2SUm0yNjWfF+f
         4G7u79nj5EszYtINpbanIufjk1maq4eGZTaA+sS/bfN8kXozi7lbimhKE/0ezaq9EhN2
         QN65h9K2xERxxRe+y9BLySNLkpPoMPxPoLEQEsYS94ahDVEYldZfh6v07k33N713q+Mn
         86nhfY0cfQXz81XTyECcREI2nEwSuB0AY8ODXGFyzcHKqIj3MyPv4My9WtCwA65N8rwf
         TDu2QY9j4Y2QC1jLp5pgrLV9LuthgxeDxmpR43PKFBgocTanfEi3zT3cS/sfgNAttaAl
         rHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sM+nzIGxkHOdgoAI6FNOyuGOwSE82BOd/kFKaU8OJ1g=;
        b=EcCOw12rwTd4ROod0q7nV/2F4FahZmBgRnwweL/UCDeNI8g5y6EwoPnKcypPRj5xSU
         UxEHGSUWCzdB3IZLAOfqO41hPhMdzD9I+FDDD9dQYdmNsggXRbjQog21S8a4iKvP1ynt
         EpBFaQWEFjUIf82EV3W23RKre2VwEketptGEL6BdzAjVy1LXOIdiB094GjyLmfA8lMq8
         EfXstmcBi5n4a0zvXL/5Leg64kKTmpodMqPMMwRpI9HoHxF26s7ysZnQvUWcJIeoL7iO
         DdrISXxwt4oWsi0GDuG+yHcqEAa62qQm8/Q5XIJiZ9CLpThGX+f4Kbko+1EOnhjI14/H
         TS6A==
X-Gm-Message-State: AOAM533tQWTJSo8oHc77B4upfK8/TR0v0zCtoUJm3+jEsFiXePvs+OPN
        1ikrUy6fz60Z+YDJ6ZRTifljRxVHJPGXvIblbh0=
X-Google-Smtp-Source: ABdhPJxsd365astWLWiAEbYaM9Y74ThNnaHzk7t1zp2IKhE8eS0pu3ItPwZ6xXT0330S6mP9+HRBPrQk0iQKMCVlMEw=
X-Received: by 2002:a05:6a00:850:b029:18a:a8ce:d346 with SMTP id
 q16-20020a056a000850b029018aa8ced346mr22646133pfk.73.1604522509683; Wed, 04
 Nov 2020 12:41:49 -0800 (PST)
MIME-Version: 1.0
References: <20201104160344.4929-1-coiby.xu@gmail.com> <20201104160344.4929-5-coiby.xu@gmail.com>
In-Reply-To: <20201104160344.4929-5-coiby.xu@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 4 Nov 2020 22:42:38 +0200
Message-ID: <CAHp75VcA6vk0dXQ0iOpSM8YdmBBBoU+veqBuK3hur9sbCiwkww@mail.gmail.com>
Subject: Re: [PATCH 4/4] pinctrl: amd: remove debounce filter setting in irq
 type setting
To:     Coiby Xu <coiby.xu@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        1887190@bugs.launchpad.net,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 4, 2020 at 6:05 PM Coiby Xu <coiby.xu@gmail.com> wrote:
>
> Debounce filter setting should be independent from irq type setting
> because according to the ACPI specs, there are separate arguments for
> specifying debounce timeout and irq type in GpioIo and GpioInt.
>
> This will fix broken touchpads for Lenovo Legion-5 AMD gaming laptops
> including 15ARH05 (R7000) and R7000P whose BIOS set the debounce timeout
> to 124.8ms which led to kernel receiving only ~7 HID reports per second.

to the kernel

> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Cc: 1887190@bugs.launchpad.net
> BugLink: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1887190

> Message-Id: <CAHp75VcwiGREBUJ0A06EEw-SyabqYsp+dqs2DpSrhaY-2GVdAA@mail.gmail.com>

Link: https://lore.kernel.org/...

-- 
With Best Regards,
Andy Shevchenko
