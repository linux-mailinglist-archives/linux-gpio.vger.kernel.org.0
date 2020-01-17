Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB4F140527
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2020 09:17:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729536AbgAQIQ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jan 2020 03:16:59 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36329 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729441AbgAQIQ7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jan 2020 03:16:59 -0500
Received: by mail-lj1-f193.google.com with SMTP id r19so25540134ljg.3
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jan 2020 00:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eumIjdkn82CgKdbcA/3L7gfEiqOIGScZ7l1uaCLBeSY=;
        b=gal77KdrDv3aXpDleCBEPdV9VFlP7JmkBx4mWLLkT4B46bDGdyb+kQi3cNEwt4xJyB
         Nrz8CcOL9BTCfRv/NLKQRkdgWbD6Rm+1meXS6L2Nv51LEYKE/c+x36aOTA7IE6jHzjdP
         Wsj6jAshXygjrcwdUdAxl1vYQxp/lmwD3kmOTXGdY2Gjf3zWpMnl/S/B9P8LorCdPKQY
         N9KybhzW90peNVcdU3m+WxHReT2EOOzOviSh+W1lPEJ4N/hJ5lOx+wSBuvoDkO8VDvI1
         SI5S8IaHHUPl6rKh+SjWYBcoT8CnMJtSnKY4tClzU/ozrm8w2A7KuiSZfMuPIThf/PjS
         TJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eumIjdkn82CgKdbcA/3L7gfEiqOIGScZ7l1uaCLBeSY=;
        b=C2aaTZXHUvSNUMcfdotOP/3kKTJkK0Bx501EQPb4E644dIjnapYUNShqmeZycfZtot
         cDs7RStksLNW8/A1ard9CEpQBOYMWrl4gxygg7+rGeKBwHEe7nvoLHpvW8e6b3WNjxSY
         CoNztbquk5urV8Iu0jo21m0mVcHylWXqPhRAtyOdi6xCYh2fNljaHlNYpV87e7QLYs/l
         99G0s4BYBmEfTF3ctWZsIToECi7RX7nfY+n5Tk+8b/m+BDd98+8aYWAhncljXRY39PdA
         ZzNS7L8Fee/RdtpEl50EOSInuxF7S/Np7Zasm8dJejCO1Nf0PfepSOKeO4QfPFiWH5Dr
         P34g==
X-Gm-Message-State: APjAAAXNNb8vPViNbO5v4GyuGY6YAZwkf17WBeUVXhznb/F4DjhgF3xX
        k01ukU3WiSVz2RSaUQTRcAEy9sH3UX7ETuyXi8kZG4w8GFE=
X-Google-Smtp-Source: APXvYqynZ3geNnXUWrPvbN90CBox0dC1N8R3nvFQWoXv6XPzU9ZIleOfyLNCPNG+wfshRvylkCa3nZEtkNjMjJIcpVM=
X-Received: by 2002:a2e:98c4:: with SMTP id s4mr4927401ljj.102.1579249017305;
 Fri, 17 Jan 2020 00:16:57 -0800 (PST)
MIME-Version: 1.0
References: <20200108104746.1765-1-m.felsch@pengutronix.de>
 <20200108104746.1765-4-m.felsch@pengutronix.de> <20200115162915.ccudevxvre3v5c3d@pengutronix.de>
In-Reply-To: <20200115162915.ccudevxvre3v5c3d@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Jan 2020 09:16:46 +0100
Message-ID: <CACRpkdbwuaA6CnUW_s1i=cf1ix_jHrqGoZZENXdAG-VXcAd_Mw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] pinctrl: da9062: add driver support
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 15, 2020 at 5:29 PM Marco Felsch <m.felsch@pengutronix.de> wrote:

> Hi Linus,
>
> On 20-01-08 11:47, Marco Felsch wrote:
> > The DA9062 is a mfd pmic device which supports 5 GPIOs. The GPIOs can
> > be used as input, output or have a special use-case.
> >
> > The patch adds the support for the normal input/output use-case.
> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
>
> Is it possible to get this into 5.6?

It's patch 3/3 and patch 2/3 which makes it useful is not merged?

If you are convinced that 2/3 will be merged I can apply it.

Yours,
Linus Walleij
