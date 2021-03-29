Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A5E534C0D4
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 03:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbhC2BIU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Mar 2021 21:08:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231679AbhC2BIC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Mar 2021 21:08:02 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56CB2C0613B1
        for <linux-gpio@vger.kernel.org>; Sun, 28 Mar 2021 18:08:02 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id hq27so16838780ejc.9
        for <linux-gpio@vger.kernel.org>; Sun, 28 Mar 2021 18:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=349fMBgcvLa2+pNSfzfycVChb5yT8zGK3bjeXkh2b54=;
        b=tYAV3AJw8goKt1/I7O4N9gCWAgwEW8sSZRa14XT9mZfyxwEeObMDl3W42OIKtzffuv
         hU4x0UFkFi8+rMG3TDwCTx3teYcimezXli/2hwxG0Q2DxNIRn5b697BGR1AIzhlrC3xd
         X2UxFk3DpKTYoYgAbJUWRKnszi8byKrP6EDHBMYS2BLEUN80cmWm+KjJZyYtfjLgZePW
         Vuuvf2SDnJJ14TroALOxjjQEqhnZe5Q9qqrfXSQjR6BM4oC0QryXWiTXQA9AbisGjsc/
         NFRXKpaM31T02m1hkP+9CX+F+RsEb4rigy77KDGuIdsJ8HQzes+kWnK4njaFgdwZwWu1
         y1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=349fMBgcvLa2+pNSfzfycVChb5yT8zGK3bjeXkh2b54=;
        b=lv7xfANpSRFSvk8S3Fe9EdQU8S0oZLWWsKUtnGPysguPC+G3wWr1q5ra4pGHqmA1cO
         EWSR1VGuCUM15HbIAQSMPyHpzSTsti+RWbXKoXNvWGIJGZUzllFsAyp/qIoM8GZYmxAk
         QUzWi8jelsbQvzdeRL8tYIcbJ+tUFuQcAVSJ+uXdg0Ox6n7C9nGdtXH4Svg/Io5kJSwk
         aRB4BlZSSSwrcrr1Uz910DY4H3EW/yYHB2auDSiP/pH2A2PzdfRhS/Sr2CYcDof9h/tt
         l0VTM2dMUmH0R73sJbECOTDprNX+CYacoy6Z+FeSIYxlLhgROArqONtWsa5j/uXPIX+4
         ynrA==
X-Gm-Message-State: AOAM5304JOzebqaOJKLosSLdqa/by5htNFxSijf6dKKUVRYqhBQd+LtP
        ozROl5u31A9qNSZWwFb0V/YC06lMyg53X2vh9YKVgA==
X-Google-Smtp-Source: ABdhPJzkNiPyCnBppUUGbv5MVnPLDaLWeyH5f2w/Q4QJP77DBRiwNOzHDtPrBNoUB6HHPhXJcxOs61+ET0MKzh7YrWk=
X-Received: by 2002:a17:906:52d0:: with SMTP id w16mr25994658ejn.172.1616980080843;
 Sun, 28 Mar 2021 18:08:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210304034141.7062-1-brad@pensando.io> <20210304034141.7062-8-brad@pensando.io>
 <20210304080355.cc37g7jagswro3dg@mobilestation>
In-Reply-To: <20210304080355.cc37g7jagswro3dg@mobilestation>
From:   Brad Larson <brad@pensando.io>
Date:   Sun, 28 Mar 2021 18:07:50 -0700
Message-ID: <CAK9rFnwwo6Ww_r4rxcs+QHev4DtqZ-46BTyr3TkePZuoc=fUbw@mail.gmail.com>
Subject: Re: [PATCH 7/8] arm64: dts: Add Pensando Elba SoC support
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 4, 2021 at 12:03 AM Serge Semin <fancer.lancer@gmail.com> wrote:
>
> On Wed, Mar 03, 2021 at 07:41:40PM -0800, Brad Larson wrote:
> > Add Pensando common and Elba SoC specific device nodes
> > and corresponding binding documentation.
>
> This also needs to be split up into sub-patches seeing these are
> unrelated changes like device bindings update, new platform DT file.

In patchset v2 this is split into sub-patches.

> What about converting this file to DT-schema and adding new HW
> bindings in there?

Converted existing file devicetree/bindings/spi/cadence-quadspi.txt to
YAML schema.

> > +&spi0 {
> > +     num-cs = <4>;
>
> > +     cs-gpios = <&spics 0 0>, <&spics 1 0>, <&porta 1 0>, <&porta 7 0>;
>
> Oh, you've got four peripheral SPI devices connected with only two native CS
> available. Hmm, then I don't really know a better way, but just to forget about
> the native DW APB CS functionality and activate the direct driving of
> all the CS-pins at the moment of the DW APB SPI controller probe
> procedure. Then indeed you'll need a custom CS function defined in the DW APB
> SPI driver to handle that.

Yes, with an Elba SoC specific gpio driver.

> So that GPIO-controller is just a single register which provides a way
> to toggle the DW APB SPI CS-mode together with their output value.
> If so and seeing there are a few more tiny spaces of config
> registers added to eMMC, PCI, etc DT node, I suppose all of them
> belong to some bigger config space of the SoC. Thus I'd suggest to at
> least implement them as part of a System Controller DT node. Then use
> that device service to switch on/off corresponding functionality.
> See [2] and the rest of added to the kernel DTS files with
> syscon-nodes for example.
>
> [2] Documentation/devicetree/bindings/mfd/syscon.yaml

To us it was more understandable to implement a standard gpio driver
for the spi chip-selects.
