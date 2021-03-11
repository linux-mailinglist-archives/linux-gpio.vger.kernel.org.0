Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D892433697A
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 02:18:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbhCKBR3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 20:17:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbhCKBRG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 20:17:06 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72871C061760
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 17:17:06 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id q14so227731ljp.4
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 17:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=B7suaILMqkwRadnzQQxPfSqPrJ+7maZjfwE653KBZsY=;
        b=I5asAXLdzh8hgadBtI0ePVcXHJrnN3OmbnuSEAkDUiL0l06QmaBO6SEvt38EGF78gw
         4pYxRtg/ieeD8DN8YCl4k7jqQ279+qebcaI5JCfgzkfCSUTDbm7oPeSyDia1K4POiRcE
         svhAa93OB6ht1jgc3bJptcPsnmUNrx+ASd5wg5GFTiwyrv9eb0tv+225S/E5ieGTSimn
         5kaUwzH+jvzR/B17DSTBMtW2JtMPFpZ3JDJC+8VHAqlwo6oDf9KG9TJXxFi/MO0d6Eb8
         wCtp3I0jIoQ9Uh2F3fPVO4HUrle8NDDBjTb/VBolSr75a8Aw4LtePcfXea5S3CwR7ZVw
         l2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=B7suaILMqkwRadnzQQxPfSqPrJ+7maZjfwE653KBZsY=;
        b=kqjoXJoorsA2UiGUoc8e05bjH5uuoOcctdetGuyix94ypHX99u7m6YyUpXOveu+tTr
         Vv3iF8ATRGz2wQ+On0AJwYKGy+OTQcsqZ856zCs1GF3wTh1t42fO2r3esmUEpEvP43fh
         AUCGFd+9+TqP5QYKGT5Grj7aU4RdmjVRsdOHBW3HaeqbNii+i1734wyyvokM0n4u75PG
         N0Au1ETF8Bm4wsj/ddy3IdnIdrDUdnq3xYIQvEn42gMHkGgqcH0rl0OM/ozVkqpCmndc
         yvA+BG84S5cSvuyhd6lvw0DPJVFZpjAQMpLvO3/YfHXf3z4f8ADK/ClKzslgI6OKBlUY
         w3DQ==
X-Gm-Message-State: AOAM530F9DQykLU+nD01lQJSKEIiuPaHVpwzjsEnEG2R37xZuO1rcNs3
        Pgcsho61poH5vt38HdZRykpifYgIA9cTXIyW0Tri+Q==
X-Google-Smtp-Source: ABdhPJw4+/D839Q6QR+cLunMDw8nqYj+e0QUG0rP80PVTMnqGi4QCWr0d3t0u6bTJ/26oZMuJfs1lIwcmmW3VWl7mIQ=
X-Received: by 2002:a2e:9004:: with SMTP id h4mr3415908ljg.326.1615425424782;
 Wed, 10 Mar 2021 17:17:04 -0800 (PST)
MIME-Version: 1.0
References: <20210310125504.31886-1-noltari@gmail.com> <20210310125504.31886-3-noltari@gmail.com>
 <7e35bfd395f3ae40029b0f3cb2bc8f70@walle.cc> <DC6BACCE-C76F-41C5-8CB9-BEF3257B3B57@gmail.com>
In-Reply-To: <DC6BACCE-C76F-41C5-8CB9-BEF3257B3B57@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Mar 2021 02:16:54 +0100
Message-ID: <CACRpkdam6kbGNywdaoxMJ4gCisyne_PNmXQfVczwi8ToABGgUw@mail.gmail.com>
Subject: Re: [PATCH v6 02/15] gpio: regmap: set gpio_chip of_node
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Michael Walle <michael@walle.cc>, Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 10, 2021 at 8:12 PM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:

> > If there will be a new version, please add the following comment:
>
> Right now I don=E2=80=99t know that either, because I=E2=80=99m honestly =
getting tired of this=E2=80=A6

IMO there is indeed such a thing as over-review when it comes
to migrating legacy platforms: as subsystem maintainer I ask the bigger
question: does the kernel look better after than before this patch? If the
author is stressed by too much review I tend to just apply it and say that
comments can be addressed by additional patches.

DT bindings are different because they are written in stone. We just need
to settle the DT bindings. Give the patch set some rest and come back and
poke me to apply it when the chatter stops.

Yours,
Linus Walleij
