Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFDEB216065
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2020 22:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726280AbgGFUiw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jul 2020 16:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgGFUiw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jul 2020 16:38:52 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28DDAC061755
        for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2020 13:38:52 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id e4so47192993ljn.4
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2020 13:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y91B4XtZzdwHhKKWu5m+kzoQpUWkTuadJVYLglISTuY=;
        b=Il4VGWDIiF+HWLrGuuLZDsNxk+PZpkL7wKjFAjcnFZbRtBWnixBmqrau+aU0mI04Kr
         fZKbU2NyZOc7knjBhclm6ATIDoTCKbj0CdC78/5WljMxt5t8UPQVzpb+L/lXyMgckoyj
         +gtjH5P0bHg7J4odnqhIoLBHwRndZKLqDlazUinuu3t7e5qXGvkNTEh+r5DRsHrkEEw9
         5juUpv70zCsjDpY55ezxy+H8edhlPzt/x+Yen2FvVwzhWQrj4LFFTGDQFPCdJ+kS9Gts
         TJHIDLXZl3EsxgGmM28cWufG5jli+hOm4VGTRSeQ3R6StvPgiNEkZ85EJNiGh8/bu7KW
         LKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y91B4XtZzdwHhKKWu5m+kzoQpUWkTuadJVYLglISTuY=;
        b=jli8Z1lscW9fLUqrsTUR/B8eCP8pCOomtQBB1IzLtkDRDGo3zAtaFMFmfPrS4rZxKv
         EuYRNrjSzhjaIFn6l0FgsQxRzmJAAA0hSTZea6Ru7+BMD28zCqeKopOFOb2kBCwehlZm
         J9pptzkraEETdGGgW+i6hEMnXMMRbM+VeSKt0ZmbcyA9bnyT6h2PRsnUrzUOx0G3i48M
         SFQRr4X0KwZvx4fPQU9iOgQxLPGMdmlGvykx/5F7QMJVH1ZNMuTfDnwXfxLd9BoyIp5S
         mDE+wJyMIXg7fYkRmLpj0PHMTmDKKAKGVEjPS8m1oEYjtFX1O7DhAOb+ENKf4HBnneFG
         buww==
X-Gm-Message-State: AOAM532hD6lZjp3M5WVYOOlhDPhX2VIVs2eXATgT/Nc1TDZswdX0sU+y
        m+diGDkOogAe43ncIR5eQrBPESAaPkYY3s99p+C6Q7stOe8=
X-Google-Smtp-Source: ABdhPJwj1iwhHAC05Sk9uWh1QCMdlwAJHwHcBX03M3aGBpcX9GwVDVyN5wKr32B/89enbNWFPQDhxHUKlUK/SX+y2iM=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr14178321ljg.100.1594067930597;
 Mon, 06 Jul 2020 13:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <01afcac0-bd34-3fd0-b991-a8b40d4b4561@enneenne.com>
 <CACRpkdbX9T9EuN-nxkMPC=sN74PEdoLuWurNLdGCzZJwwFrdpQ@mail.gmail.com> <1c4f1a83-835a-9317-3647-b55f6f39c0ba@enneenne.com>
In-Reply-To: <1c4f1a83-835a-9317-3647-b55f6f39c0ba@enneenne.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Jul 2020 22:38:39 +0200
Message-ID: <CACRpkdZPjJSryJc+RtYjRN=X7xKMcao5pYek1fUM2+sE9xgdFQ@mail.gmail.com>
Subject: Re: [RFC] GPIO User I/O
To:     Rodolfo Giometti <giometti@enneenne.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 6, 2020 at 5:33 PM Rodolfo Giometti <giometti@enneenne.com> wrote:

> > With Geert's GPIO aggregator userspace and device tree can conjure
> > special per-usecase gpio chips as pointed out by Drew: this is
> > very useful when you want some kernel-managed yet
> > usecase-specific GPIO lines in a special "container" chip.
> > To me this is the best of two worlds. (Kernelspace and userspace.)
>
> Maybe this is the "best of two worlds" as you say but the problem is that board
> manufactures need a way to well-define how a GPIO line must be used for within
> the device-tree and without the need of patches! In this point of view neither
> the "driver_override" way nor adding a compatible value to
> gpio_aggregator_dt_ids[] can help (this last solution requires a patch for each
> board!). That's why at the moment they prefer not specify these GPIO lines at
> all or (improperly) use the gpio-leds and gpio-uinput interfaces to keep it
> simple...

I think the idea is to add a very generic DT compatible to the
gpio_aggregator_dt_ids[]. That way, any DT can use the aggregator
to create a new chip with named lines etc.

But Geert can speak of that.

Yours,
Linus Walleij
