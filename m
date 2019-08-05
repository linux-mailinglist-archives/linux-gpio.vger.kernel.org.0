Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3215A8186F
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 13:52:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbfHELwv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 07:52:51 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:37784 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727357AbfHELwv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 07:52:51 -0400
Received: by mail-qk1-f196.google.com with SMTP id d15so59772544qkl.4;
        Mon, 05 Aug 2019 04:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xKtVGE3rpCwv/3bqrrMS3xiPOphPK7/lrqwml8nvLlk=;
        b=FAmsexYTtobQhd7fNuqkZ2XdIJc207wkA24spum/HpXIMEE62kUBoEfQkrilKmJO2E
         3ArHL7Bem0w0csOR/GJlheWdYBNBHfT39Poy6V+rdse6/onZtkD02JR37GmfX0yKleII
         L/zxD+MfwXGXRHnDGOIyB92Qe31q5t43MxRD0kRNf8oSwPMtfPZdASOnNJVtHrjjLIdH
         si+f9Lr5LC3sGEJmquT6AOd+brT/Gv9OD9+9lLkEjwTknkcewtydulSag0DNMGKacbcs
         P/rrc3s75kCxX1sBZXOoM2VVeMSb9axB5rFvLyU6Nffdxr9AiD2xMr1H+Nq1q7B5Coc9
         i/Rw==
X-Gm-Message-State: APjAAAXYm0kZ9kZBNdbxmQSIxZ3usyNoVMPTYQrxkRTG5pC9AUhb4DF9
        oOfQRsyrK3wzhRgY8enMaxkMxvrl39xgbTV8JXG3D1H0
X-Google-Smtp-Source: APXvYqxvOG2SbkhRQVVwD2Ivuymr0DZ6dSq1F/N2FfD3nrHUdnd+YFrVvlDxEDd5w4W1Q2CPl2sSyO/FitAC4s2mZ0o=
X-Received: by 2002:a37:ad12:: with SMTP id f18mr55336948qkm.3.1565005970143;
 Mon, 05 Aug 2019 04:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190721125259.13990-1-hm@bitlabs.co.za> <20190721125259.13990-2-hm@bitlabs.co.za>
 <CACRpkdZ0OYt4q3a=kEWswKZ0z779aDFNg8wbm9Tqa+ddgiW3dA@mail.gmail.com>
In-Reply-To: <CACRpkdZ0OYt4q3a=kEWswKZ0z779aDFNg8wbm9Tqa+ddgiW3dA@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 5 Aug 2019 13:52:33 +0200
Message-ID: <CAK8P3a3Qx34-XNtaCjL0GxaG=75Cgcr2fS_4Nass=Ta0vrSQwQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] [PATCH] gpio: Explicitly cast from __be16 to unsigned short
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Hennie Muller <hm@bitlabs.co.za>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 5, 2019 at 11:11 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Sun, Jul 21, 2019 at 2:53 PM Hennie Muller <hm@bitlabs.co.za> wrote:
>
> > cpu_to_be16 returns a __be16 value. This does not break anything
> > but does cause sparse to generate unnecessary warnings.
> >
> > Signed-off-by: Hennie Muller <hm@bitlabs.co.za>
> (...)
>
> > -       gbmsg->val = cpu_to_be16(dir << offset);
> > -       gbmsg->mask = cpu_to_be16(0x0001 << offset);
> > +       gbmsg->val = (__force u16)cpu_to_be16(dir << offset);
> > +       gbmsg->mask = (__force u16)cpu_to_be16(0x0001 << offset);
>
> Ugh I don't understand this.
>
> Arnd: you know this better than me: is this the right thing to do
> to get rid of sparse warnings from the code?

No, the structure should be modified to use __be16 fields instead of u16.

        Arnd
