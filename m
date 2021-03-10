Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EDB7333FFC
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 15:11:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232776AbhCJOKn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 09:10:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232768AbhCJOKh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 09:10:37 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B36E4C061760
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 06:10:36 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id x29so11484583pgk.6
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 06:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Io4Fo9oeBefHkX3YgJtNGOO2NvhPutjp6z80gE0N9MQ=;
        b=vIZC7LPfFfzO7hKo1euzRJePCnL3oXBbvtqOhJThmqPgxOpWvO/PBMSjNuy19gwhLG
         aKlu1pEVHxjLATMltlQriGK+Xs3NWA9U1PFcWri1F5shDK3kJTA095MkgVLLXdKQXSo6
         JwRXiCBuL190sw5X15bVuUkdFuRzuyajfCH63nBIbCW93/TSNKHGUuMpXB9aVI6i+je6
         Zk34lX80+atJRN8dKZBCP2dJdSM3jNB0Fg/48pV28yLDdZSpWAJUeTFHK4a3F1s4A1PV
         Q4N8Y/jkDbWz9p1XWsP6NuAhJCMVxFPEf92vnXOX5g9kLUJinR9kNEnjvIM+N036oakO
         /AiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Io4Fo9oeBefHkX3YgJtNGOO2NvhPutjp6z80gE0N9MQ=;
        b=ddzkvvh7eqesxdwWztS7kX5impScZzjrU444wQBf1Cph2DebLIQ9AzsAc/3aXL1F15
         YZSuxrQY268Oj3KQEs83wW3uULRb5eRL5ROFO5bAQo+GxLHAsWjg1JIlZXOyjZqPmucU
         dQXk4SpNNIKLjtdBolmJbRZAn33nXUlYocLp5gOe1uhzZoNUwr+ROyyEqrEyixGpO8z4
         a84cpURzpPK7Gogq+nCiCqrX77NNbIRi5aZ7WeNWd+dqAdcxXxRtRG5f6MCqRqHfDyDl
         JtlDSQXrwUP5Qkf6Tv206WilnlVuAZHS31T3k2e6542IgtI2ZGwwjnZA9sEuYgGbACrG
         /Oug==
X-Gm-Message-State: AOAM532c4nx/AGPxb3M1yiQb0PVb0DuDNS2Mjav6WvFjpJx1hbNQhPsE
        K31U5krwIsnSdPpoDg9o0H+b0EQ4fU0g0NTFA88=
X-Google-Smtp-Source: ABdhPJw3p3IcxcuNvft7cvzsUUcQU1W5A+FV21zT3AdaAkFcntdjHQxMELAKhfHdB1YWPKiURrpJ+gW4J6d1zA2GttQ=
X-Received: by 2002:a65:4bc5:: with SMTP id p5mr2943014pgr.74.1615385436189;
 Wed, 10 Mar 2021 06:10:36 -0800 (PST)
MIME-Version: 1.0
References: <fd30cc89-8048-700d-edc1-95bf38184b0b@vaisala.com>
In-Reply-To: <fd30cc89-8048-700d-edc1-95bf38184b0b@vaisala.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 10 Mar 2021 16:10:19 +0200
Message-ID: <CAHp75VfU40Vvg3bq6UajM7oiwXJOUEXiOiMKObQ10q27bgmDbw@mail.gmail.com>
Subject: Re: Shared access to gpio pin
To:     Tomas Melin <tomas.melin@vaisala.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 10, 2021 at 3:38 PM Tomas Melin <tomas.melin@vaisala.com> wrote:
>
> Hello,
>
> Is there a preferred way of providing shared access to a gpio pin?
>
> Use case is such that there is one application which only monitors the
> state of gpio pins, while another
>
> actually controls those pins. It would be enough if the monitoring
> application could read the state of those pins regularly.
>
> With the old sysfs approach, it was rather easy to share read/writes to
> a certain pin, but is there a
>
> way to provide similar functionality with gpio character devices?

I think it's a matter of having D-Bus interface and corresponding access rules.

I dunno what the state of affairs right now is in libgpiod.

-- 
With Best Regards,
Andy Shevchenko
