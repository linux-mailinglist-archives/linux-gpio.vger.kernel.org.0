Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0B554EE7
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 14:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729722AbfFYMbO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 08:31:14 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36333 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726414AbfFYMbO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 08:31:14 -0400
Received: by mail-lf1-f65.google.com with SMTP id q26so12526827lfc.3
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 05:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kDFY+QTqqiMEOnTov2xDeNaIk7HwyPkPWyRkRRHSyzk=;
        b=Vii5TMev7BoCq2nTcUAUy4RbuYP5eF8K02+yxiVUgFGihW7crvsellgGLrySBn9T4t
         +ZkRMd97gjWfE+XgGd8lum0sPzBVxoZ2K816B9DvAM0Ki/jqLCcrmv3VTVxg7HhnpGJp
         SBMWg7UYzZhnl+uubEvGQjLsZDamg4LCVbD6Z8taj5/U/uA//cusuoJF11bC0dy+/Uiz
         qplUPH0xN3gxA8LErE1J7X4fM8KBREa80NElm64vR/wg1VorhA73iqTMYiSCRzSdyLv5
         UYsxileELIgN9UTwdRejFzAe9xZTj31cPdZ1M5xPnuAKfukfgIw6HyLcOEoajwel5ji6
         Xmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kDFY+QTqqiMEOnTov2xDeNaIk7HwyPkPWyRkRRHSyzk=;
        b=RQksR7NEAT8x1HbKuYViPnsPHpbLdARtII10yzOUL4l89YZTOwHyHdu6AMiQhVa5AQ
         5yKXdndVT3nwQNATI6qONumJ7g/C6SGpGDlhgcA6nuHtaSS3rlYh90O6u1hnSnaNVIEe
         /Cw9ZcTXcxjCJhqF4CqPWi+7upLsg31Rho9epxu8Rr6fs+8KCPIu5P2+MCLKHbg+ZqIF
         89j79ZhxC030kFOhWr/zcfpOXzMxjeZMoiXJyV3Yw1n+s5TYqGShe5+/40TzJp3gBhSR
         X0L692afZ2LD/Ae/6dPE3NmteMZW+1tkJ1oxExmmDJPOBtbwXgFxl4fCgIEwoBWWt6kd
         FUuw==
X-Gm-Message-State: APjAAAXPaP+8Rkvgyl9rkQqhoiGKvKH/rcA/9fPpwj9Nn+/4sBk554vX
        T24hX7SpkMfA07dqNf8HlTJN6zf63iFYPJ8Tmq+oZA==
X-Google-Smtp-Source: APXvYqxJtx+kv4xSwtZ2Oh9SZIkuBtLHG+NnPvuNmG5fGRPD0rBSI3dyCsgfek9QsPqek/vYbO/dzGax8Uzv7n1exuo=
X-Received: by 2002:a19:dc0d:: with SMTP id t13mr52002001lfg.152.1561465872654;
 Tue, 25 Jun 2019 05:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190618160105.26343-1-alpawi@amazon.com>
In-Reply-To: <20190618160105.26343-1-alpawi@amazon.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 14:31:00 +0200
Message-ID: <CACRpkdYgXZzvFKyvySWnsJ2_1pA1e_VHEY-QNzNYCikMUc_WVg@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctl: armada-37xx: fix for pins 32+
To:     alpawi@amazon.com
Cc:     Benjamin Herrenschmidt <benh@amazon.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 18, 2019 at 6:01 PM <alpawi@amazon.com> wrote:

> From: Patrick Williams <alpawi@amazon.com>
>
> The 37xx GPIO config registers are only 32 bits long and
> span 2 registers for the NB GPIO controller.  The function
> to calculate the offset was missing the increase to the
> config register.
>
> I have tested both raw gpio access and interrupts using
> libgpiod utilities on an Espressonbin.
>
> The first patch is a simple rename of a function because
> the original name implied it was doing IO itself ("update
> reg").  This patch could be dropped if undesired.
>
> The second patch contains the fix for GPIOs 32+.

This looks good overall. I am waiting for a maintainer review.
If nothing happens in a week, poke me and I'll just apply
the patches.

Yours,
Linus Walleij
