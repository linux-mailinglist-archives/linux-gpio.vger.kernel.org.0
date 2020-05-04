Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD8A01C397B
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2020 14:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727930AbgEDMhb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 May 2020 08:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726625AbgEDMhb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 May 2020 08:37:31 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E349C061A0E;
        Mon,  4 May 2020 05:37:31 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 145so5410602pfw.13;
        Mon, 04 May 2020 05:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6gbrmq6FrgNGtrSILlAV+rPedEwu6SsSkZaNYC9dK3U=;
        b=PsWKHA+QtU+Ahl8eGOiKkZmaiTmeVH9ebW3Mzff6eslXqeukM0nd0GZ28yIirvxZrX
         t6oVDs/0VbyEPaTDqFQuJfmyK7uNhfX2ztgh0tYlJQIbKQ49aXwRPOSradUlAQiW1oPo
         7LwHiYgNAxBs0/9biBCFVOrq6503SCk2tH5o93Wr5c1BjxyLsUY3KCpHTse1X6tQ1Zfz
         Or3oj5Te2J698TzqiyNB96Zr8cIbvxzSgXKimIc/ciXOF4Y4N7UJlu7TmsppQsdx0BZZ
         GIubu2zBnskGSaI2Y2ID43KlFHemHf85pEriaduOPPdCXJrNqaOQc12HBSLx5vpqgTWa
         HMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6gbrmq6FrgNGtrSILlAV+rPedEwu6SsSkZaNYC9dK3U=;
        b=G+ro1haGyiy09PSpoT8mDu/3CchWfbaKLToilkYGjSkHCvykFGvkb1Lk0o7K6TlbCf
         q31EGX8hbJsyyv7iiPkyWDbbI3jjGJ0ht5N7hdgKw6UwL2BCFVOFyspvtEvEvDof5hy5
         BwBwgxbkpbL0TReqIUHVXeKp7jjnYvPKKJb+7/4AROvTIGAB10cw78pLjhJhzxdKITCx
         HE9MuVZwmCSRkCxHkKwr66MVCa0V9Ip8P6RRi3XqSeK+98EMp+u+8DnJ2dxs7sMKwBEm
         6cEpXvUarpDkfT1poAj2sKriHUdOccDrnooPX3PbZD4Aqc/cOBK3J5eS444nkoQEQj5/
         Xz4Q==
X-Gm-Message-State: AGi0PuaQY7YHWqrpFNYwF6JjkSSrlK6tyY0r0IzOgteLXbs61Y7Au99W
        jHshC1EadZgj/WvlXPQVi31avrxj2F1XMe7IaSU=
X-Google-Smtp-Source: APiQypIbWMNMFqZ9xa++2jx9gxWODbg6xRneVFnCqtkRlHYTL0ouTAxlrvffkp+pfeyKIKsVPKNNI0ancl9ZxwDnCmk=
X-Received: by 2002:aa7:8f26:: with SMTP id y6mr17686564pfr.36.1588595850616;
 Mon, 04 May 2020 05:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200419001858.105281-1-hector.bujanda@digi.com> <CAMRc=MeHun_WEApEXP59ZszGa2n+wbU9qq3wU1VO9o590rO-Pw@mail.gmail.com>
In-Reply-To: <CAMRc=MeHun_WEApEXP59ZszGa2n+wbU9qq3wU1VO9o590rO-Pw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 4 May 2020 15:37:24 +0300
Message-ID: <CAHp75VeFCFbjr02BiwbKOAHim-xys3N1Lieyfr99xgwN5GoVLA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: add GPIO_SET_DEBOUNCE_IOCTL
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Hector Bujanda <hector.bujanda@digi.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 29, 2020 at 3:09 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> niedz., 19 kwi 2020 o 02:19 Hector Bujanda <hector.bujanda@digi.com> napi=
sa=C5=82(a):

...

> Finally: we can extend the gpiohandle_config structure with a field
> containing the debounce time which would be read by the kernel if the
> debounce flag is set in gpiohandle_config.flags.

Don't forget the 64/32 ABI.

The configuration structure has padding / endianess issues

Should be something like

{
u32 x;
u8 y;
u8 padding8[3];
u32 padding32[2*z];
}

I.O.W. each member must have padding / endianess agnostic place along
with whole structure to be multiple of 64-bit words.

--=20
With Best Regards,
Andy Shevchenko
