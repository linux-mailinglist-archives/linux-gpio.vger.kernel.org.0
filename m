Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 194B33899D3
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 01:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbhESX3M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 19:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbhESX3M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 May 2021 19:29:12 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E31C061574
        for <linux-gpio@vger.kernel.org>; Wed, 19 May 2021 16:27:50 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id c10so615187lfm.0
        for <linux-gpio@vger.kernel.org>; Wed, 19 May 2021 16:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JJEJbgRPnMBu2f8ndkVjFvRlGE1bDrbkWqaeWQqS4qg=;
        b=bmyI9zT7D6VywVO0FZYWVtTHDbNrUjUkXVxolFMUdDeEnMBLdC7WLCM/qVZf0gLrkB
         38HpWU/YBYXIVw+em1s8JK6FdLxutwITf2ueNcN/OWecZUzx/KS1Owa3erdFfzZ+6Hav
         wu04qZHdyorG6YixuVe8bV4KC7/lhYqGR6n4nUKIVpoy/qnlZLarxH5nK/Dvrv4Thd9v
         z/rT9lCJaKw1mGQhS78Y3ElvmGHjB0ZaByGVboZCovpnGqQbItihDjlHUJa7jbsm5Kni
         axIuR+6wNTXGZ4a/azftCRWKmCsWltEhdasogAMhU6AALm/SucRIVdDJ3C+/LAocPs+Y
         Gahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JJEJbgRPnMBu2f8ndkVjFvRlGE1bDrbkWqaeWQqS4qg=;
        b=AQ6ok1Co2a3N+2vQ1gUZGtbxA1NG2KwkW6kQYIrAaVvpOWfQ/S2/mcfkxZaqhO9dIk
         tqLeZs4I5OcZ+kKZfMWjzUNJyozmz2kfRNRm7I99upbvRyQmKmUst9MoDMSzqoPfIRvj
         mKY+WxoWD+E5ECyUsf+j9Y7MfSXRb1oT3nJ4/JDct2R7JRppg2n2AUG+5cMc8nLTCant
         eJkHmbs30K1TKuo+ehtS6fAKaAjVE4EB1SEoFwMz3RbC8N2zzf3Z4Dd1JYqCiMwew01L
         uFwOzmdyMgItaeozoI0yaLb/HqxmynVZ5WD5MZVPyjZlAoJB1xoW2bLzXNJP1xzgKmPQ
         aOgw==
X-Gm-Message-State: AOAM531saTItd5x+APY5qKwKMPXpsk1tf6dRi/x9ETsULsuuvk1DnwRS
        qyh9+h34ji+sL9B+UD6SI56u1N0JsGeYE6NZ78o97g==
X-Google-Smtp-Source: ABdhPJz/cPPzI7GxXKzBS+Gom60rdG2Gq8Pyt5scUUUDZl7Es1gZjna7v+VwnSx19MRL4DcKqfOm3IcmAfkZkzaM/VM=
X-Received: by 2002:a05:6512:1185:: with SMTP id g5mr584031lfr.586.1621466869121;
 Wed, 19 May 2021 16:27:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210508142000.85116-1-kettenis@openbsd.org> <20210508142000.85116-2-kettenis@openbsd.org>
 <20210510141955.GA58072@robh.at.kernel.org> <5612be5a12568600@bloch.sibelius.xs4all.nl>
In-Reply-To: <5612be5a12568600@bloch.sibelius.xs4all.nl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 20 May 2021 01:27:37 +0200
Message-ID: <CACRpkdYPsL+5ZN3WOovwqkGydaGoJZCskwMkT6rhZ1BYpYVgrw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add DT bindings for apple,pinctrl
To:     Mark Kettenis <mark.kettenis@xs4all.nl>
Cc:     Rob Herring <robh@kernel.org>, kettenis@openbsd.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Hector Martin <marcan@marcan.st>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 10, 2021 at 7:06 PM Mark Kettenis <mark.kettenis@xs4all.nl> wrote:
> > From: Rob Herring <robh@kernel.org>

> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - const: apple,t8103-pinctrl
> > > +      - const: apple,pinctrl
> >
> > A genericish fallback is maybe questionable for pinctrl. That's not
> > often the same from one SoC to the next.
>
> Krzysztof raised a similar point.  It seems that Apple isn't in the
> habit of changing this aspect of their SoCs.

Rob what's your stance on this? Does it need to be changed?
Else I'll apply the patch.

Yours,
Linus Walleij
