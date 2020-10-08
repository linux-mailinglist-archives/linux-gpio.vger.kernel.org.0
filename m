Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD1328786E
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Oct 2020 17:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729519AbgJHPyM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Oct 2020 11:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731595AbgJHPyI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Oct 2020 11:54:08 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65EEEC0613D2;
        Thu,  8 Oct 2020 08:54:08 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x22so4310421pfo.12;
        Thu, 08 Oct 2020 08:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wP+udRW03ScOonDwfr2+rE7x2nDIe+62cJ5Bmdntu7k=;
        b=VJGEk64oBgb776ZwVsxjmdpAp6ohTbkaSqAPjtQPJ56197gqTmEytREl0thcRiS1ST
         BU2dGqlzCeHf+bLIvL+FSThoOHExUnYeGSJlnaIEW0nP9GUscP9YAWs2SpEjHmOztq06
         5j8v3kWSWvW3HhmB/qc9Ko2fBXpFKVVNyFVRDTvCa9b5/WxD31jD6BEgv6o+fvaWVG/u
         c7HZmpvFpvM8qIzEpc0KVIAT3po3qOMUq5CiMs1BEGy4Pfo5wYz/juYPrisYUctD1e/v
         ZVhfOsIZJGp4NOUGwlZzmvOA0K1VzF50QWE3+qIW0NRzPFvCMI8E28lDGqHFreISTKxx
         jLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wP+udRW03ScOonDwfr2+rE7x2nDIe+62cJ5Bmdntu7k=;
        b=DR/egR5Ne9tmq6I9ZR+c2Jyf3lHu6lZj6c35DeFk5UqJNhI15cQDpRH5rZI5J1X34R
         ssQQlq46b/0upYL7cUq8ugJ98q7QQHNA0SXG066MQQbMFxuun4VcrEHsm2Nh0Sa/d9Fi
         MSSAnlCWszEo7rFx/xc3C9g953pQVNFuDjCB2AbL+B6Zyh6HL+NYpfIxpoIl/X0b+LK0
         Cedpvp8HaNMNaeUZVizcq8LoiMgzpmFvOD09cv26cyENJGb3To1SJk49xGfj+4igEis4
         Te90EJq+TUGWzyhgQ365el2/jnRb0dQvDikZReKSUt4Z0ft8XKag7NdFOB9IRXFm6gId
         DFJw==
X-Gm-Message-State: AOAM533HyywlnKh6JmVjx/NDmyq8+ryeEGrnYhtgD41HHp+rwrOGbQJp
        i4ve6ecix7Uv+58rO6Pwi7X9+MH/DcYGiQvRZ9+FJlOpUN7SJg==
X-Google-Smtp-Source: ABdhPJzy6VdWnsJszD4ndz7auG7E75pSR6XcAx+7WS2KGUiXvEsKaAUQjprG66NcuJfPy9Izq6N8n4uIJWH1L2dmo6Y=
X-Received: by 2002:a63:4c1d:: with SMTP id z29mr8089999pga.203.1602172447925;
 Thu, 08 Oct 2020 08:54:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201007143817.76335-1-andriy.shevchenko@linux.intel.com> <20201008090851.3041aa1d@lwn.net>
In-Reply-To: <20201008090851.3041aa1d@lwn.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 8 Oct 2020 18:54:57 +0300
Message-ID: <CAHp75VfYn1SRXXhpC=YXzDzUYuc3LVwj4WY1e9k6qH7ZmEWwtQ@mail.gmail.com>
Subject: Re: [PATCH v1] gpiolib: Update indentation in driver.rst for code excerpts
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Documentation List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 8, 2020 at 6:10 PM Jonathan Corbet <corbet@lwn.net> wrote:
>
> On Wed,  7 Oct 2020 17:38:17 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>
> > When TABs are being used to indent the code excerpts inside
> > the bullet lists some of the tools fail to recognize it and
> > continue interpreting the special characters inside
> > the quoted excerpt.
>
> Which tools are those?  The docs build itself seems to work fine...?

vim


-- 
With Best Regards,
Andy Shevchenko
