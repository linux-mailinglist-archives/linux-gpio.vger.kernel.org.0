Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 856FE8156A
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 11:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbfHEJ0P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 05:26:15 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33846 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726423AbfHEJ0O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 05:26:14 -0400
Received: by mail-lf1-f68.google.com with SMTP id b29so50126220lfq.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 02:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vDnwC1sRX891ja7MrREnsLX3Gypilc9tkmj0BZcGzyg=;
        b=klSSoLHFds39D/tjuz0Uouf+k0MFSWUUmt0MXglw0jFkrtp7DgmQlIDeXpebYGGcPY
         REoZZDtMMNpeY+qJIyxVFlCYM5OxfYnu2xFXWFtr/udugFA/sxdnjaL3H3cHdBo0A9JD
         B9F08bseI78Iv8nqwzJ88MNI/RmQvD/CAzdAZjO/3nHa2FnJbZoBpygz8Y4cGw70OHpV
         tycISGMzl8e9j06kvw98NiST/mYfrc28eJ9KfxWkJQWgf6KcgyMAV7ZaGNSgOb3bBIGe
         Ncf8sKt7wF695jUT/9/ZEKyq2ZW9cX8gjXd3nAhABc2/hGIjy9tEIiBCi7xGZ9sEXlTX
         wztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vDnwC1sRX891ja7MrREnsLX3Gypilc9tkmj0BZcGzyg=;
        b=gXFpzDOzLoUPDEN11eDEXkWuoq70h1MesvKF8+I27OdbUwJcU1O/wyuuc/JVXtRoeJ
         5rO4w+vdZC72ioMAfj08Z60C2/av6xN2CHUjBcu4ce9n2AupsC+C11JT23u8HbjK1xko
         OrAiAw0DnNFpqN//dDi4ptZPaFE2ZhUGcdSjrtC59kGFjKHetNOMFzOtIHCm/w2aulSL
         ReZh81pK65P+taHwsTCtm6pAuQYJM1Y+d+p16kDJajyuducD6FBX/ESinLtCctkk6LHK
         U6R+1BQsmkc5T0eWvHY9WLRFW2QcUQrxtNjjkOgXGMTGz7Dso3Pz3FIZUucN6iJGmLvC
         M9CA==
X-Gm-Message-State: APjAAAV22v84uvmiXjXbDMqbf1rEPdsH4zBF/AdpHpEqWdFrK4vee3JS
        Q3G4vCEFHaxlKDOfdJkGh7D879Dhpx0XV4NfqcweL0Fp
X-Google-Smtp-Source: APXvYqyUv4njfTztLWuTYouFJHkECKq+fXZxeFHpI4KhokX8BPbPnioEMqwOxONQdEfZDKlADcF9YE7PEnlncumSd5g=
X-Received: by 2002:a19:ed11:: with SMTP id y17mr1700886lfy.141.1564997172789;
 Mon, 05 Aug 2019 02:26:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190721125259.13990-1-hm@bitlabs.co.za> <61045f29-73ca-cb62-ba6f-5b12970735a9@electromag.com.au>
 <20190722045154.rp2sqr2mxdmfn5qj@manjaro-1>
In-Reply-To: <20190722045154.rp2sqr2mxdmfn5qj@manjaro-1>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 11:26:01 +0200
Message-ID: <CACRpkdYO2r0EuCY6EOt=Px-O6J9Hxzu_LqbXziXk7axea1o+Jg@mail.gmail.com>
Subject: Re: [PATCH 1/2] [PATCH] gpio: Replace usage of bare 'unsigned' with
 'unsigned int'
To:     Hennie Muller <hm@bitlabs.co.za>
Cc:     Phil Reid <preid@electromag.com.au>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 22, 2019 at 6:52 AM Hennie Muller <hm@bitlabs.co.za> wrote:
> On Mon, Jul 22, 2019 at 10:05:00AM +0800, Phil Reid wrote:

> > I've encountered these checkpatch warnings as well.
> >
> > However 'struct gpio_chip' callbacks define the function signatures
> > as 'unsigned', not 'unsigned int'. So I've also left them as is, to explicitly
> > match the struct definition.
> >
> > Be interested to know what the official take on this is.
> In hindsight, I saw most of the other gpio drivers follow the same
> convention as the viperboard driver. which means
> a) my changes add no value and just creates inconsistency.
> or
> b) there's an opportunity to fix up the rest of the gpio drivers as
> well? Which I'll be happy to do.

I think it is fine to fix this in drivers and we can fix the prototypes
as well.

Yours,
Linus Walleij
