Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57E6E2BC4B6
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Nov 2020 10:29:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbgKVJ3A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 22 Nov 2020 04:29:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbgKVJ27 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 22 Nov 2020 04:28:59 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50DE4C0613CF
        for <linux-gpio@vger.kernel.org>; Sun, 22 Nov 2020 01:28:59 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id d20so3725013lfe.11
        for <linux-gpio@vger.kernel.org>; Sun, 22 Nov 2020 01:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sXt5vpx40ce9lr20UD80jY3Rhq/h8sioxR/mHZJTx6Y=;
        b=szeguPXXuRNBNLMq96cAA5vnTJ4ZYjc8EfxJk5hoaL8+bNSYEu4/zw8AdZZu8MWYog
         kwDfBdI8T5layxjl+DE5DpYrx41xHSdKdPxO5rCkx9+AiY4R6vfhFZv7+lrKVE6PxSIb
         iJnF7zKv2G9Vu1aDS3aYyrANesjV5HfZkuZ3SE1xAHf8+d0d1NMfsaPTnQwGaawZ/zer
         y2YdXj6b7VVdzafI+gWCAO3r5uXyXQyrHntawGKfNGEVIIr7pBJpXHYkqiAhg1kUX6ts
         DWcaFuHioytobnkuDVoIYdmA6MNzhtq+DtwOv3h+VnRgAewCgOSGAYaY7VxBlJzWy3Sy
         bRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sXt5vpx40ce9lr20UD80jY3Rhq/h8sioxR/mHZJTx6Y=;
        b=Rq6F1BB7228iGCFY6eCGqS6A/kzGqwtYoRJHX0HNQm2/KjlPKiswSYFfD+W7Kw1gjT
         SjQg8lBq9H3Kfm9jHTNyjNd2uPbaYKq4u0WZBq+HzQSX1r5TLac7rudNL09H+eDivp1C
         hrteO0xhIYpAtJtbmJFC8JwID07ksFTbYub/Q3HeQlYn0oO+BJwqgr5i7RR99NaaUjz2
         mgx+gQUhyS1sHX03hJ3K+H8+sFN9LVTO7CjIHhLLU3kQSjju7jX4CjdbJIJXKtqqkTkx
         5np9jJ/Yc/rQGvaY9G+mSYxzYyts79JlXR773s4qsKaWJ15734iwr1ocLfwUt8Jq/UZA
         JpnQ==
X-Gm-Message-State: AOAM533V2swWRV4TKPtCwQJ0lDwju0jxLI2l17YP2DbxA4sE+lXUeMl8
        VauKnPfzkHFKpgBlEKgoZH8LUN8u6w5n4RHsz8ZljZ++8jgjKg==
X-Google-Smtp-Source: ABdhPJzm0pgABSg5f8Ga7PVTXsahnN3XJoDIYqIaqvD2kUnvnFV2Wpfi7k7fqe9tsFXD3Mqt2OFD2LrSoAM2sqxcgb4=
X-Received: by 2002:a05:6512:528:: with SMTP id o8mr11956947lfc.374.1606037337136;
 Sun, 22 Nov 2020 01:28:57 -0800 (PST)
MIME-Version: 1.0
References: <CAHp75Veqdv8JnASmmsnv9AmrktByWH3R7Z36wLMyjJh0VffExw@mail.gmail.com>
 <CACRpkdaAryt0PdbMQ-LMjJ=LNvmNVSHrjHfPn15uJo7WALpNEQ@mail.gmail.com>
 <CAHp75VfdRfROFwa+wsL6rW7v5=E+qYrE+rwy7zBP2YkZsgjdgQ@mail.gmail.com>
 <CACRpkdYjHERoO-rzoXa77VCjDrF0N+3q+q_MXOstMEkk3Y2CnA@mail.gmail.com>
 <CAAVeFuLRWsxeZW=0jWyXb7N=o1n53F6n1Wwd0t=dUSppk9-xrQ@mail.gmail.com>
 <CAHp75Ve=_2Ye7K6rY8sLhpYh7DF9fqVbS7c2OVSWDZi3XYBbzw@mail.gmail.com>
 <CAHp75VdnNi-wWeRnOCLYi+K-x0sKz4s2=OqtHdkZJWQw4-d8wQ@mail.gmail.com>
 <CAAVeFu+YtiZ69btLyiZvPwXJYo+KW6T9SyhrJvd_4L=qJqJhpA@mail.gmail.com> <CACRpkdbK=AAPQNGaDkHwS1o7xopZkj-7cwJGtFB2N9=q=sLjDw@mail.gmail.com>
In-Reply-To: <CACRpkdbK=AAPQNGaDkHwS1o7xopZkj-7cwJGtFB2N9=q=sLjDw@mail.gmail.com>
From:   Alexandre Courbot <gnurou@gmail.com>
Date:   Sun, 22 Nov 2020 18:28:46 +0900
Message-ID: <CAAVeFu+id4=-frfrvVaH6D2XY-eG6b0R5vNpZWfV69PnMaONnw@mail.gmail.com>
Subject: Re: Is consumer documentation correct?
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 5, 2020 at 11:49 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Hi Alexandre,
>
> long time no C! :D

Hi Linus! Indeed! :D

>
> On Fri, Oct 30, 2020 at 3:36 PM Alexandre Courbot <gnurou@gmail.com> wrote:
>
> > So yeah the documentation (which I have written as far as I can
> > remember) looks a bit clumsy at best and I probably should amend it a
> > bit. Now I don't want to give the impression that these functions
> > should be used as they absolutely should not. :)
>
> Yes pretty please with sugar on top can you send a patch to clear
> this up once and for all so I don't have to!

Sorry for the time it took to get back to this, but you should have a
patch in your Inbox.

>
> FYI when it comes to GPIO descriptor refactoring we are churning
> along with it, my tentative plan is to finish it before I retire.
> I still have ~22 years until regular retirement age in Sweden so
> I think I might be able to pull it off!
> If you would feel an urge to jump in and help out here is the TODO:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpio/TODO

$ git grep gpio_set |wc -l
2649

Yikes. ^_^; but it looks like we are gaining ground nonetheless:

$ git grep gpiod_set |wc -l
1548
