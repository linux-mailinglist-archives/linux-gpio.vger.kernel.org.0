Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBA63752CB
	for <lists+linux-gpio@lfdr.de>; Thu,  6 May 2021 13:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234685AbhEFLMT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 May 2021 07:12:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234672AbhEFLMS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 May 2021 07:12:18 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B6E4C061761
        for <linux-gpio@vger.kernel.org>; Thu,  6 May 2021 04:11:19 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id n138so7224377lfa.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 May 2021 04:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wMFathXdbsaDkowJoU81vrWO0kU+VvQ+Tmhu/CZVPVI=;
        b=bgCNsJYhW0+tuUuY3mc+Rp83PxkwaudgTpOEyZ7upVhDySB2D+rc0FjXEhxn2DdYy/
         CIHPZc1OG++JyD0ctna/+pypf3gxLlTy1g36xtiduhIJPcyQO+8Zrv7FFmw5/9laIfb0
         23F180/6IUwOMm8T+mR02+NBnKmPpS8hhqappwFgu+CXBQTiup0B2I3iKnrk7GVcOlOL
         OeNIyeW/43hcqYCVCWFKV6iq0xDT/ww+n1y279tcnLP7qY6uZiUOCeS82HfxM3YCrbOC
         vgXdLbW1f3qju1XR38L1nYKCv8TFZsVLcZVlbD5MedkNm3r9Oig9N2txhap5M6a2up2L
         U6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wMFathXdbsaDkowJoU81vrWO0kU+VvQ+Tmhu/CZVPVI=;
        b=IH/4VzMXNYvletr/yoit2HLNBmbUiIlOOSrnWtqnHxNMGdnYyJXtupP82SvQWD8ahU
         v+pBvOm7CJsgvreVCvMcOmgnU2NAFRk/dak8+644vNIXhaVB6WlCH/XNqyEnXFwLIz8P
         HhWGPPIqb7rbjBjC6IyV1hs9YBGLOfiuEZO1B1yjiczEJNN5vWq1SAQ1PGEquPeuypfO
         4uq+amFCEqTKRK87KZ1wpTJJcc3gmnvZyehXbhR4bjHKMtZssIydfZYmNn/+v3QKlRGu
         EivQgjxKBtdzkjgCMcPXiZo0t4dQb+okiKAnIxjAr6DQA5w4dH/dks759M+xSf9vzAyk
         MlWw==
X-Gm-Message-State: AOAM530TS2A4vEQ17GpTTS+AbkKRpeKYlJ+OhPjC6rVL9i1GXyoyx3CC
        ZmKMOYfmHYQW2SeHxVLDinvZdm7ICjLB9OjAvQ2ldA==
X-Google-Smtp-Source: ABdhPJzsuJP2WMZqZGx1KzuR34RFZ6qLuUWvvsfN2huPdEnPjyrItMtfHwqU/4mFSa/5hfhmJLQ+2fWn1Peuqhxn52A=
X-Received: by 2002:ac2:544f:: with SMTP id d15mr2482110lfn.465.1620299478030;
 Thu, 06 May 2021 04:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210426095426.118356-1-tsbogend@alpha.franken.de>
 <20210426095426.118356-2-tsbogend@alpha.franken.de> <CACRpkda7n3VL-EpwdXDxt47azFo8Wkp67-urUy7--3D6TJs7iA@mail.gmail.com>
 <CAL_Jsq+48xVScx87WYD85Ty5CxqO3L8taMeQ7S9QwHew1+TjKA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+48xVScx87WYD85Ty5CxqO3L8taMeQ7S9QwHew1+TjKA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 6 May 2021 13:11:07 +0200
Message-ID: <CACRpkdaftBRUw_m9GjrqMreAF98iNTF4807LwkY9Mt7Ceh6k=w@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: gpio: Add devicetree binding for IDT
 79RC32434 GPIO controller
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 4, 2021 at 3:44 PM Rob Herring <robh+dt@kernel.org> wrote:
> On Sat, May 1, 2021 at 7:13 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> > Why can't interrupt support be made optional?
(...)
>
> If the hardware has interrupts, then we should describe that. It's the
> OS driver that may or may not support interrupts.

You're right of course. What was I thinking.

Yours,
Linus Walleij
