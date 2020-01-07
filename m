Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7806F132327
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 11:04:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727427AbgAGKEN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 05:04:13 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41396 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727154AbgAGKEJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 05:04:09 -0500
Received: by mail-lf1-f68.google.com with SMTP id m30so38432406lfp.8
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 02:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x2i9D0Ihitkev4ht4FSFiTVw1ZbJ3RS0U3X+Z21+sD0=;
        b=Kujj5nAsF/McaOhQh4QC/ZrO+uigeQKBkK1y6VnnbagQPt38lsaATNnpWZ44kW3Eup
         LYeSOwaKJxE5OXfOWa6OYbwpBxD6bdvzNDIhmrPKq2icgV4OD9OLencx+lGj1n8ke29V
         rFzdLzuQ/dz+ArrxHdcF1YHhgkzAiGrXYot51k7aWbpOcHFSmiqXa+aBDcnKQl/tKfp8
         pAUXIBM5IUQ4groRh2LWmayWsQ+reuh6Tz3kwPuh4/kLTVwTlgAIoaITz7NU0AZLNvcD
         a8hanYYcp5ZlGomDzh3uAHWKRIP/Vmgtc1eNdyL35GRLM5Chn3inD0gN6gjmGvlzbShS
         dPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x2i9D0Ihitkev4ht4FSFiTVw1ZbJ3RS0U3X+Z21+sD0=;
        b=HODLzpV29WXFx886rw4lBpGZK9OJNDF4hw6BAFqZT7i7VN7kfVlcpCY4rtuTpOCa2n
         Q0T/FpCb4hXiQPkJ9eiI6k5ov4jyvf3QnLUxJRH0A/40HNdcqWwDSt34FwJX7FUt6ubr
         CaEJNtXHS8qZyh4ztwqVxAsi1D11Me+fzYe3GC8t8vb2Ob4s160CGDIatW9I1hstHO+t
         99lvfYxXwiU/CLY2MIDajDsTbTtP0eFDoJgX1XbEQQPIsNynusZp4D3vBhYzULIZVoeV
         pEAFgSPrP+N8p2Etl0Mpzsbj571PbkbzzXgp3oM9vhJn/HTZn2PclzAAsntUGf7tgop0
         QzJA==
X-Gm-Message-State: APjAAAW4Vsb6a4oADQrG070PVHDgrrac2NfacRWArHUWLnK5owOBrewf
        9LG4qkUjrSWz5sjCbVS1nfA9EgGpSSXvm5evZbr3DA==
X-Google-Smtp-Source: APXvYqzw07li0joRnv19MMgwtPGOY2q0x9rVIibcmal6BmQL0ylqnZ3awHBmzcLvX9uirEHXIJmwvppn5akTDicF4Ss=
X-Received: by 2002:ac2:5c4b:: with SMTP id s11mr58360297lfp.133.1578391447708;
 Tue, 07 Jan 2020 02:04:07 -0800 (PST)
MIME-Version: 1.0
References: <20191224120709.18247-1-brgl@bgdev.pl> <20191224120709.18247-4-brgl@bgdev.pl>
In-Reply-To: <20191224120709.18247-4-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 11:03:57 +0100
Message-ID: <CACRpkdY6mUsydabXJDNZC2Wyu0Hx0Ut8xhqpYO5Rcr+FBHwMJg@mail.gmail.com>
Subject: Re: [PATCH v4 03/13] gpiolib: convert the type of hwnum to unsigned
 int in gpiochip_get_desc()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 24, 2019 at 1:07 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> gpiochip_get_desc() takes a u16 hwnum, but it turns out most users don't
> respect that and usually pass an unsigned int. Since implicit casting to
> a smaller type is dangerous - let's change the type of hwnum to unsigned
> int in gpiochip_get_desc() and in gpiochip_request_own_desc() where the
> size of hwnum is not respected either and who's a user of the former.
>
> This is safe as we then check the hwnum against the number of lines
> before proceeding in gpiochip_get_desc().
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
