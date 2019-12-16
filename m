Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FAC511FF81
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 09:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbfLPIQe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 03:16:34 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:36257 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726722AbfLPIQd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 03:16:33 -0500
Received: by mail-vs1-f65.google.com with SMTP id m5so3588899vsj.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 00:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uNL/md3eBXURlPuzMpt+NNW2vHDC+deKynwVOIfF2jc=;
        b=ZR1bDqm1sBrbGQOrhQCGhzMkwGgIGGPWNy0UiW+R03u70yVQeYsJ+q09N5CsZm8+H4
         u5rqgmSwDu/1esfl/LXurubXpL+IaO6DEgbsWCM4V8Pp2qgrlRIPIukat/vWCWbUzzNy
         7iAUp1hPK+wphwibDujKFThkphRiHjPDrpuK96gq5dWkK83EAYHTjt422DRW9Q5NHUWA
         UVpxKcEFKlsjWFKl6H+pMIJ1PHHfnzNEx7bUvXjd8focSsTWq63mulVF0jJKU0Bj7o7P
         KCdhgL78MZfjZHzx4bvLZKnxeIG1t8r24zj2Zq8O8hYlTdTnoe+eiQpzQWh5iXwSoLVx
         /DSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uNL/md3eBXURlPuzMpt+NNW2vHDC+deKynwVOIfF2jc=;
        b=kiyUZdDZxj8QRRiR+I/ru/q75ye5GOs/Q5khCJWTGUDp04YRfBy84Csdh7gQHNCzWZ
         R7KOUA3csUkmk3df78faFD4Cv/Dqrj7TPl0t8nv/AJPjO0qD3I5Kr93mPYGienPmTTZ2
         BMvlxTKlCvN4EdcYd/UcMXsPba8hSJgPvagslhibWIo86GVrAH0hApkD254Xrz3t729X
         kYSwCER5zt1StxO5ToJ6V79GNo/4gII1raS/SPuHIvaJi2HgMSjhkccWTrz5ehkQVJRd
         qpWMxIRG564md7HXEZOBRHf0cH8DP9f864AsZSCDEMjIWyxEwACHhueUA8hei6+owrX2
         +5mQ==
X-Gm-Message-State: APjAAAWHb9HdoQAoJ+sIR/XkfUtVnDRBOzi1RsgZOnTDmfZ/4oYK2ztL
        MOGQnJbbJeFEJwzrQYRTvGzklRRDaSOz91a/ThiJXg==
X-Google-Smtp-Source: APXvYqxZgmG+r2lTV8LKe+Xl0XG0KMUrLOVjhm5O5XKw+42XV8qr8FSzvIn12G9bZTlTbNGjb2WiK96uAA1oxkXvC7Y=
X-Received: by 2002:a67:d592:: with SMTP id m18mr20632386vsj.85.1576484192909;
 Mon, 16 Dec 2019 00:16:32 -0800 (PST)
MIME-Version: 1.0
References: <20191210195853.883483-1-arnd@arndb.de>
In-Reply-To: <20191210195853.883483-1-arnd@arndb.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 09:16:22 +0100
Message-ID: <CACRpkdb88egVZr400QaAL=B_2qx3W2FsdWPZzZMWcB1u-R0YKg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: equilibrium: add CONFIG_OF dependency
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Rahul Tanwar <rahul.tanwar@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 10, 2019 at 8:58 PM Arnd Bergmann <arnd@arndb.de> wrote:

> Without this, randconfig builds get a link failure
>
> drivers/pinctrl/pinctrl-equilibrium.o: In function `pinconf_generic_dt_node_to_map_all':
> pinctrl-equilibrium.c:(.text+0x96d): undefined reference to `pinconf_generic_dt_node_to_map'
>
> Fixes: 1948d5c51dba ("pinctrl: Add pinmux & GPIO controller driver for a new SoC")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Rahul sent an identical patch that was previously applied,
but thanks anyways!

Yours,
Linus Walleij
