Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D67813B5F3E
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Jun 2021 15:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbhF1Nnz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Jun 2021 09:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230154AbhF1Nny (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Jun 2021 09:43:54 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79FA2C061574;
        Mon, 28 Jun 2021 06:41:29 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id b1so2459655pls.5;
        Mon, 28 Jun 2021 06:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J0zWLnENjoZcvSkz0GaaLHvicuPlecPlHuFYuJAX7Oc=;
        b=KxFAuX6JnjLzFtLeIvbW9xVGLQkYU5APMZG7yJYfy3KH+1vxiTi8yTPN3weVUz4sH+
         p5wNqPH4HRuv3pv1+iwZplQbU58eMLUK7r1b9RwWsl1A5sLEwt6LubEVg0vrWtYUa6PP
         NIWxVPv3Ttri+C6vXj5PPnF9ScNhiUt4bPtPueTRizV4b/gqEjuzgNfbOhxMCT5c05zM
         zpHIukQ1jzEy2OBZvuldeW2Telpus0/sqLiyaPfVl7On6htx6ZzfH8PbdykWOKRDRkAy
         nAu9yHvralGM5092TlQQKLfnTkjkmU4gocadwIFH3+OYasRkJZVsN4F07tuynUMYlyvQ
         63BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J0zWLnENjoZcvSkz0GaaLHvicuPlecPlHuFYuJAX7Oc=;
        b=eBoDNe8c0VWAYZG6o3K0eeKFuvoOtgHpdl4oWfJzPe1csFNRCXGK7Zp457snkfTA7q
         FDl9oLxlzzMfCRkbsTtgrnOaTso1GeubVGS6h+Pd/1z6ni/W3HWZrdPT9JXfjI2cu2EC
         hrfHw5kJz0OFnvJLeyQirISvmHH4jYn/W8yLCoUIOo8ZK6ji48QtgevFBXhXWb2sGaPw
         Rz8Fmex0n6PzqHUVC5atzxROWUxLPGH6QpJQ/P4DSBHEFLL/N87M57oDD5BsZgFieb2v
         q+7itWvJzlLuEcEi3DnYoEU8FQtU7yx5V4+Wb/jp65gYRq3eBGf6EQ4nsmLCXMYbfTmH
         Gf2Q==
X-Gm-Message-State: AOAM5318nfygEB5W3sQ/JeL0Vbgy8dLVxDJKBloNNWU/lxewqDKW3IIe
        +ZLIf0bL3dSYAwsZI7V61UbRG6/JkBezcfhqbtQ=
X-Google-Smtp-Source: ABdhPJxlB+h0XWEqkCThUJapbV7dEugW+IqA5etEWhYXmNtmVm+YtSGhY0TzsWXZe24vh9XtpqOLhTp8Oe3qtxMTmbg=
X-Received: by 2002:a17:90a:bc89:: with SMTP id x9mr28051362pjr.228.1624887689062;
 Mon, 28 Jun 2021 06:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAF78GY0jB_oeKgfZc4SHWBVusGnNfxKk5jTC4UBDsteSEVEzTw@mail.gmail.com>
In-Reply-To: <CAF78GY0jB_oeKgfZc4SHWBVusGnNfxKk5jTC4UBDsteSEVEzTw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 28 Jun 2021 16:40:51 +0300
Message-ID: <CAHp75VeZwUiK2v8HZ=MLGSkK8wLudDEJFhBSm--Wu9gzABhmSg@mail.gmail.com>
Subject: Re: gpiochip_lock_as_irq on pins without FLAG_REQUESTED: bug or
 feature ?
To:     Vincent Pelletier <plr.vincent@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 28, 2021 at 6:37 AM Vincent Pelletier <plr.vincent@gmail.com> wrote:
>
> Hello,
>
> While trying to debug an IRQ handling issue on a sifive-unmatched board
> (which is a very recent board on a recent architecture, so I would not
> be overly surprised if there were bugs in hiding), I realised that I was able
> to claim via sysfs GPIO pins which are being actively used as IRQ sources.
>
> Checking drivers/gpio/gpiolib.c and kernel/irq/chip.c, I believe this is because
> gpiolib (gpiochip_irq_reqres, gpiochip_reqres_irq, gpiochip_lock_as_irq)
> does not call gpiod_request_{,commit}, resulting in a pin which is available
> for use. I could confirm this by adding (just as a debugging aid):
>   WARN_ON(!test_bit(FLAG_REQUESTED, &desc->flags));
> early in gpiochip_lock_as_irq, and this statement gets triggered.
>
> Is this intentional ?

IIRC the GPIO can be locked as IRQ without being requested (perhaps
for legacy/historical reasons). But I forgot all code paths anyway, so
I'm expecting that Linus and  or Bart can elaborate this better.

> Does this requesting belong to something else in the codepath from
> request_threaded_irq (and similar) ?
> Could it be something missing in the devicetree for this board ?
>
> Also, I notice that both gpiochip_hierarchy_add_domain and
> gpiochip_reqres_irq call gpiochip_lock_as_irq, and I am surprised I do not
> get any error about this: in my understanding only the first call on a given pin
> should succeed, but with my WARN_ON I am seeing both stack traces and
> no other warning.


-- 
With Best Regards,
Andy Shevchenko
