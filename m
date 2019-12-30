Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A88E112D04A
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2019 14:31:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727397AbfL3Nbe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Dec 2019 08:31:34 -0500
Received: from mail-vk1-f193.google.com ([209.85.221.193]:38472 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727454AbfL3Nbe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Dec 2019 08:31:34 -0500
Received: by mail-vk1-f193.google.com with SMTP id d17so8284475vke.5
        for <linux-gpio@vger.kernel.org>; Mon, 30 Dec 2019 05:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oNV29BbOxXflnyWwf2B0CxiU+GnStWQ9JexGoMU2XlI=;
        b=Qr8gscKlr0x3QNw5/UG6H6605ovPfe83GBn13tR7j85Yiotg6vbGAc1/tYVxW65w0L
         3xl6SGCq8hQeq6d7jVn4qp1kIrjC8SkkiXZFfcbKzWAaWEjzfo8yGnqrEnJcJYiM+y+i
         us4nfaGrq0lxpSiObbP+DPDDLtAUNSsUJn09U15Fci3PnTJR8ci02QxipCMwiT6GjX2N
         i3xkh3nQXNM9sVBkVc3H52Gu+FjKxaWE7ZoeNrANH8TMk4JCUjzVVyXtS0xbalYg9luG
         iQSHCzMwwHJNQORoT1anC7Mi3ybsVxNdecXs2n2wNnLcwqOqx9nfJoj9YAbKGj/k7rsm
         gY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oNV29BbOxXflnyWwf2B0CxiU+GnStWQ9JexGoMU2XlI=;
        b=o87M8/40iIORwEhrN5Q+mJbdXYtkndtKUbHKMUgdOc8sKPGQB6tVeST3e2CmpCDaiw
         FuUIpJzWhQro2edadBmOEZbgKrhDzlDlnD80J00gk1bG/kKR/sSqu7+QW9GDo8LKNhJ8
         l4YjOFausYNiGW5EOZPoSe9D86kavku8aNhJL0rHh9r261lubESrESbAGC6fGAq0umVq
         k1K6zNiBahcKd0RoI+bfBfdl6tSgXtwPruQWHmeuxxQiFx6qTWupwGutcYbijtoN1gLE
         5U3TJ+W7OfJokoREk67SqQscjiLF5mIC1yjjW0am+ZJJE8iGk5jhBhMSIiRhCrQK7VQ9
         RWfQ==
X-Gm-Message-State: APjAAAUjbzS53l9cv9m4d7JLDfWGK7iQd5hQD6wALp/POoocKAoFL17B
        eTseFiNF5uGEneW0Zlox/GpouSpBqrMbTciaBb39sg==
X-Google-Smtp-Source: APXvYqxFag2CvxhfF9l68e0E6H1HTPVbDP+2WETnXmzv5qTwFtUcF8TJWRh54oESNBk460c12mL7WeiqbGkL+w36S/8=
X-Received: by 2002:a05:6122:1065:: with SMTP id k5mr38200538vko.14.1577712693691;
 Mon, 30 Dec 2019 05:31:33 -0800 (PST)
MIME-Version: 1.0
References: <20191216205122.1850923-1-hdegoede@redhat.com> <20191216205122.1850923-2-hdegoede@redhat.com>
In-Reply-To: <20191216205122.1850923-2-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 30 Dec 2019 14:31:22 +0100
Message-ID: <CACRpkdaXFSJVkWJGzsVcvbUA9gpgP0Vbkwf1H-HWw8s35R9XYQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] pinctrl: Allow modules to use pinctrl_[un]register_mappings
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 16, 2019 at 9:51 PM Hans de Goede <hdegoede@redhat.com> wrote:

> Currently only the drivers/pinctrl/devicetree.c code allows registering
> pinctrl-mappings which may later be unregistered, all other mappings
> are assumed to be permanent.
>
> Non-dt platforms may also want to register pinctrl mappings from code which
> is build as a module, which requires being able to unregister the mapping
> when the module is unloaded to avoid dangling pointers.
>
> To allow unregistering the mappings the devicetree code uses 2 internal
> functions: pinctrl_register_map and pinctrl_unregister_map.
>
> pinctrl_register_map allows the devicetree code to tell the core to
> not memdup the mappings as it retains ownership of them and
> pinctrl_unregister_map does the unregistering, note this only works
> when the mappings where not memdupped.
>
> The only code relying on the memdup/shallow-copy done by
> pinctrl_register_mappings is arch/arm/mach-u300/core.c this commit
> replaces the __initdata with const, so that the shallow-copy is no
> longer necessary.
>
> After that we can get rid of the internal pinctrl_unregister_map function
> and just use pinctrl_register_mappings directly everywhere.
>
> This commit also renames pinctrl_unregister_map to
> pinctrl_unregister_mappings so that its naming matches its
> pinctrl_register_mappings counter-part and exports it.
>
> Together these 2 changes will allow non-dt platform code to
> register pinctrl-mappings from modules without breaking things on
> module unload (as they can now unregister the mapping on unload).
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

This v2 works fine for me, I applied it to this immutable branch in the
pinctrl tree:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-pinctrl-unreg-mappings

And pulled that into the pinctrl "devel" branch for v5.6.

Please pull this immutable branch into the Intel DRM tree and apply
the rest of the stuff on top!

Yours,
Linus Walleij
