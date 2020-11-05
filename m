Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E71182A7A3D
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 10:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731198AbgKEJOL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 04:14:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731211AbgKEJOK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 04:14:10 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23DC3C0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 01:14:10 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id t13so771694ljk.12
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 01:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a5EvDes2mzEH21PsuVHEvhfe9s1+v+vUUboqD8o+qXg=;
        b=yomWPI9E6p8BoxvD0WQ/GtEqnFHq6kGWctspOEorR5UAjdN2kc6Fbi0ko477mQB1pw
         S1u3SSMzOsNlCLmXkU3c7u4W/tdZZWKYHvGjUmvzX61XYIXGjAhyt9XqhE4pdBh9a20y
         xjZqUARJib3p8iTrUVGupUEGnumPCnPBH4q+31xnVo89s4FJ/NvHwuukNJpR9/B05V3R
         GQu23uuePPNNKw/MCQWJi3KAMiDWPGjK2ewynTSoKw2pY5ZOLWQf1N93KT8U+iKOU8ow
         RMYk5XfVtxkzXXVly6BrUYajnzCS/hboKAC9gOba81ME2YgYXGz5XeaYdn8St502qeAi
         dgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a5EvDes2mzEH21PsuVHEvhfe9s1+v+vUUboqD8o+qXg=;
        b=t64J6PI+/nemMU9Nmg+M0SWG57Ul79hgHYuLBL5UrlZNKH6bKZUpHlMKoKiqVGmVYv
         +zE8BHodRiQBRqVWDM/6dStYl00ne/bY0s7dL2aSrZi2tDnfL8PKEOc5GeBMb5Lorba5
         bcO8LYjwzXaWh68VNpjjvd/L560HLKCtuDZYyxDfVaBK4qPDyQueIO/aK6fndDJOPiei
         eFE1VjErL5FApADMPOVpi7+P/eGt7FSQQffCR1DuOkZVGRbcibk5YuTre9tale9iGk7D
         Q/zPBlddoy3BIzYuMJkeFK0Lnk0MLk2E3m4BS1pjR8t98nVKRURIF1w1e/mB54mXc4Dy
         bX4g==
X-Gm-Message-State: AOAM531uZwWYwp3ZbZdZDhstuKgOUAND+u7/LLcJCvxNtBoRe2TidUHD
        8vK2uMmMhNwGayS1UcAkGqoqOrJw1m22euUAJtVrvg==
X-Google-Smtp-Source: ABdhPJxSzuOlML38xjmjdsVf6SqLQJ5np08U4vhJotjmL21O/pD0Pwm4/jAUucEfTMJSFq/ScyZzijTlTalZWAVxNuI=
X-Received: by 2002:a2e:9a0c:: with SMTP id o12mr507459lji.104.1604567648665;
 Thu, 05 Nov 2020 01:14:08 -0800 (PST)
MIME-Version: 1.0
References: <20201011024831.3868571-1-daniel@0x0f.com> <20201011024831.3868571-2-daniel@0x0f.com>
 <CACRpkdZDyp83AiGkX9eFe2_w9eK1NXREFG896DZfPUaHboy+0g@mail.gmail.com> <CAJKOXPecUBTqbyiQQRdSPq_YuBAF+ut3RbM9AcW8nyciJyw8ig@mail.gmail.com>
In-Reply-To: <CAJKOXPecUBTqbyiQQRdSPq_YuBAF+ut3RbM9AcW8nyciJyw8ig@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 10:13:57 +0100
Message-ID: <CACRpkdZDD0zTxBjfSfWXBsA=R2TSJ-J+nt+Y849QNipNhp7a5w@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: gpio: Binding for MStar MSC313 GPIO controller
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 19, 2020 at 6:13 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> The generic GPIO controller dtschema got dropped because Rob wants it
> to be part of dtschema (outside of kernel) and then
> relicensing/rewriting property descriptions plays a role. Only the
> GPIO hogs went to common dtschema package.
>
> Therefore as of now, one should include all generic properties
> directly in the GPIO controller bindings.

Oh now I am confused.

Rob, what is the plan here?

Am I *not* to create say gpio-controller.yaml for $ref:in into
other controllers?

Yours,
Linus Walleij
