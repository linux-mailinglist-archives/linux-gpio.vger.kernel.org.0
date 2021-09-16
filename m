Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9F940ED87
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Sep 2021 00:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234289AbhIPWu5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Sep 2021 18:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234223AbhIPWu4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Sep 2021 18:50:56 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CF54C061574
        for <linux-gpio@vger.kernel.org>; Thu, 16 Sep 2021 15:49:35 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id c8so24901698lfi.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Sep 2021 15:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MvX8mRC9UAIof2DnPhx/XFUw8LmLQuINLwlmoEGG1Nc=;
        b=Ixtd4QV1cx2hyenOQXhVZIooRY5myJLRlHlCfh/G2ZFs/72eML3288PruwrjSfQDQQ
         Eiz1sDytzFhJNVzwjkGHLZLtpa3a3Gjm7LHa8lZqNgcn9Au7GsmNfeSxhLvsjhbS7/V8
         OQotSU/suX0MOTbmcBQyWID/SSiPSRHALKlX8AnroQ3xQwUBL8z7AXqgkYCtU7VT6j7h
         zXyLL3X3FpS8/MVM8oaCr6wwVwZyqJdB+ioIPYjPu7FmBhHPfjvnOsetvu4K5x9fyx2t
         8+HnRsRMBzwCJsQAl0S+PWkBla3eyCkPPFskWpAu7sMPSU54a88uax+SlYYMW42RM4Gl
         uI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MvX8mRC9UAIof2DnPhx/XFUw8LmLQuINLwlmoEGG1Nc=;
        b=3cTioIdDIQ0FIuB5D2zgJqv6CQJD+A49hqMjlWQuklvswg0MPtC/Qo3+v5vn3nTEqQ
         3CG4iSAzEDnf68QbBShq8H+mb25+9j5k8yBHzspCXPaNF33Mz/5Jrb3FZbd1aUbmPuE7
         ztVT5HAVBtfzmVoWG5sB4dgIdesz1RAPbs90BAjlrqJ2PiZ2LlmE7Ry1rZijPJ12D8PG
         KyzS4VrsTL0H6FT2y7OrZOZDcS+vP3ITBrTrOxO3c2p1L8Bz9HOEmPYBAVC1+MwrHo/F
         /eB7x0I2OohFWRQBU8e+EZBXloAaIONRsfw5Pvsq2llxCEIWR9W9vtkRISSRxuESOB+m
         LK1Q==
X-Gm-Message-State: AOAM530BfX/ckcMjJ3oqpOs3flzJNl3Qp6gjSbLBaj/TQ90AHVeXfpVj
        zEZA0GieecUPQcQpzxwHJN2n+S54ViKDBBjQTjN5dQ==
X-Google-Smtp-Source: ABdhPJwtDBnADz4YaDSGjwwceNUgDfJsrBtldcEMh4OZNzztuVTiCDfBwYUBm5bUdFBsaKQuWqNKCBtmqUCGc3ithfk=
X-Received: by 2002:a05:651c:4ca:: with SMTP id e10mr7132887lji.259.1631832574040;
 Thu, 16 Sep 2021 15:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210831120613.1514899-1-Basavaraj.Natikar@amd.com>
In-Reply-To: <20210831120613.1514899-1-Basavaraj.Natikar@amd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Sep 2021 00:49:23 +0200
Message-ID: <CACRpkdb17ovQnF=_-sU0Vy07vMQ79Z483v=oYgaw+Lz3yurOdQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add irq PM wakeup
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 31, 2021 at 2:06 PM Basavaraj Natikar
<Basavaraj.Natikar@amd.com> wrote:

> Changes include to handle IRQ wakeup mode wake the system from sleep
> states like "suspend to RAM".
>
> Basavaraj Natikar (2):
>   pinctrl: amd: Add irq field data
>   pinctrl: amd: Handle wake-up interrupt

Patches applied for fixes.

Thanks! And sorry for taking so long.

Yours,
Linus Walleij
