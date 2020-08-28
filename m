Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D54712557CB
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 11:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728269AbgH1Jhv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 05:37:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728016AbgH1Jht (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Aug 2020 05:37:49 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B329DC061264
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2020 02:37:48 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id t23so586221ljc.3
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2020 02:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H61KW0cO/8vC8auZZfnwBx0eRjehicYI06KTiTAxhPE=;
        b=sGZldq27qtqQkS06o4Etfh2b3RBgWQ83/hREu2x5IPz+gxqzrUoI4b/0HYic8Ozd9o
         O+Vrh60X2q1O2YD6tsYIU57c3aXZPkIDfoB5x5JLpUwb4QLlXsbc7cMjuNEQoWY0MzGx
         swDdh83XnpzvM5vfFFlD3Xv7x4K3WwgzjiKb+yNQHjgxEQTEVCJ3vlDUlcsvFdaqpisu
         fvtCa0rKsQ9h2gaJebRBy65s7TKGqlXH2e5jw0DVSxEPHiGFi9i8qSQh87Do5K7jdkL8
         gF5nSuh8qIO5Mo9zCty+v4qqWH2d6GcvqoxvCi2vBvKuOAVpP1tOXnpVt0wcNmMvG27Q
         6ddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H61KW0cO/8vC8auZZfnwBx0eRjehicYI06KTiTAxhPE=;
        b=hUBluOQXgVaS0RPW8di7y9+O4tty6U+ft4mHIr0f8eafEfmauGTgap8LztPJehbxHl
         zRHfvZHx2uDIkc2MN9dbpBATPbLfwLMCdoEnm+a2ygIAfsmkgRP+xgdgMBqvl0xVWiMy
         APBaoZA54muOaWvOZkTkbL1Z6WgVJBAGsxtRiJSYDue5XwBF2Cdu7ZfVk0q/e4X7M+0M
         9QZ0Qn79dPr8rTu4T0YRY/ITy4oX5+WjqKAI9vMSvCaFBBq8jDwAM0IyRga3JhxCtKcm
         DG+2jpky3OLdSa6/SI8kKgQmlQrQlqKwGChEelXmEdrqow4s687CUCfakzqkOxTxfL0D
         PaWA==
X-Gm-Message-State: AOAM532lz7BWjaU6p6DPzK/mqrP2sl7L5MHcsBgKRj8BVBvxrq9i8BnC
        IfzeGCqFlPXHZB5wc13DbO/DrnjLQrEfcmFDoLu5UQ==
X-Google-Smtp-Source: ABdhPJwNru2VlFUiB5J5tlfq4WYCIDhWoJlbw/HjYQx7ozhe4gph5iyDtDKkBmQY1aerEngIdqRZ4yFpIAXJzTu4SbY=
X-Received: by 2002:a2e:b80b:: with SMTP id u11mr511080ljo.286.1598607467095;
 Fri, 28 Aug 2020 02:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200821111127.3771-1-geert+renesas@glider.be> <56474631-119b-d64b-3545-a14f800aaa61@gmail.com>
In-Reply-To: <56474631-119b-d64b-3545-a14f800aaa61@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Aug 2020 11:37:36 +0200
Message-ID: <CACRpkdb3ODnScRUkJYV8VswPfn6RhrSJK2YtoYLanS3MYjbJ2g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: renesas,rza2-pinctrl: Fix pin
 controller node name
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 21, 2020 at 5:27 PM Sergei Shtylyov
<sergei.shtylyov@gmail.com> wrote:
> On 8/21/20 2:11 PM, Geert Uytterhoeven wrote:
>
> > According to Devicetree Specification v0.2 and later, Section "Generic
> > Names Recommendation", the node name for a pin controller device node
> > should be "pinctrl".
>
>    Ugh, what a lame name! :-(
>    And they say DT should be OS agnostic...

Ha ha. :D

The device tree standardization is driven with the bureaucratic ambition to
be generic, predictable and non-personal. Mimicing the characteristic of
the impersonal objects in life, such as the planets, or the plants.

This is just an ambition, in reality the people doing it are Linux-heads.

We (the DT community) try to be better people, we just fail regularly.
That is OK, the important thing is to know one can and should do better.

Yours,
Linus Walleij
