Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94BCC3E9029
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 14:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237601AbhHKMII (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 08:08:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237585AbhHKMIH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 08:08:07 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAFC1C061798
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 05:07:43 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id y7so4188429ljp.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 05:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ObQ5OAEUd0+X1eMi1qcnnAwRcSYfFxDtxdcEgN6ufWM=;
        b=OMRmvbDwPkn8fEqA2OPAXWB6I+etzg1ysA5y8KNf4rT5LZO3Wpb0CgwaWeFQuvXgmd
         4F0zctL9WdpflzYh9lDHUKC76WIE12Cny8oKlyB9tHB5HqTaKylIYEm1adesWNVGZBIG
         JU5JGbz5cUrkgeHli4AKOSJBeyoqid4nfOFRCRHT0JQnnFjTq/NIhcQZL50CkoIAtuyy
         hsTVeI0+nh5h0NLmHh5q1IQQsK+YYsJyrkx5kGMv8CtLZIlnS8VG6Tf5OlvbtFgtQs41
         hcW0vlYj1PO6GDwdVCabM0+xze+vKZFVUJMIsR9diuC3pTtNqBBOeKia0ieLbqD/hSkV
         7q6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ObQ5OAEUd0+X1eMi1qcnnAwRcSYfFxDtxdcEgN6ufWM=;
        b=eTgghbpWOhiXBW4nz3+EWTcVRDy480LqHQOIXX0J5GdANA4pcN8FQNUqfEGWO5WZ5x
         6z/lyrOHVwTFBwWkOlkH4+nwLX4+sXpuGg+IsLZkUWLvjw4otyFqImX825MiuvEL4DZ+
         5JY+vtI/YHTTI6ZQMgX6kGPHf+wEycBPK9PgM0exZQuqXkwVmPvTNJTUNhKIRqa8prQr
         rk8KgGR6d6KqTMPOTv3fWaBoYC/jl5r3W/diH41UbIa+894fAEtBPOEyiKK08lIVgtim
         kXne/oJP53S6fV3ndHvgR6m22XjzPkHmbYJhLzCXNFmhDed13ER6VVKRhaLo2B1I1Sxp
         Z6lw==
X-Gm-Message-State: AOAM530pI6CHh++/E3nSHWt+TKgFJLbaptIzC78igKbkxPaspZtK2eaE
        0MtnJ4Pn1tLXXWjL9Jx24N4i3G4iNcKVLVNigb2oig==
X-Google-Smtp-Source: ABdhPJzY2UMetNipVATu+xcWql5w7ucY3+3H1SvB5mkMuZDL9wTMQKa9NEl1S74qvlbCJIHPSpWeiReYNbTevn2LyM8=
X-Received: by 2002:a2e:a4ab:: with SMTP id g11mr526868ljm.273.1628683662147;
 Wed, 11 Aug 2021 05:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210803175109.1729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210803175109.1729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 14:07:31 +0200
Message-ID: <CACRpkdbEPsRUUxNTfFoAghFiRur6eG9BbXqzXdWWnSZGuOreKQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] Renesas RZ/G2L IRQC support
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 3, 2021 at 7:51 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:

> The RZ/G2L Interrupt Controller is a front-end for the GIC found on
> Renesas RZ/G2L SoC's with below pins:
> - IRQ sense select for 8 external interrupts, mapped to 8 GIC SPI interrupts
> - GPIO pins used as external interrupt input pins out of GPIOINT0-122 a
>   maximum of only 32 can be mapped to 32 GIC SPI interrupts,

This looks good to me but I count on Geert to do final review, merge and
send pull requests for everything Renesas.

Yours,
Linus Walleij
