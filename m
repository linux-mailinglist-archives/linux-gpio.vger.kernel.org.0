Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD2553D393
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jun 2022 00:21:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238977AbiFCWVC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Jun 2022 18:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345452AbiFCWVB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jun 2022 18:21:01 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B536C30F71
        for <linux-gpio@vger.kernel.org>; Fri,  3 Jun 2022 15:20:59 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id e184so16078633ybf.8
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jun 2022 15:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iBmGnyk/fT87aTvwCZ7SGg/w21dxvgBIz/PICCr/er8=;
        b=pS+AMKNqRiVvzo6ZVTD8dg69G/k4sqIacy5qIAm7y+4E5KP1VLpfWKv1Rucnx/2Q1F
         xutvw/gH7feLph6noEf1cY2ysvt9kdh3wzl8TASEtEwEkxF05jukK89RfkikcZet2X2B
         lWkD+7WUqf62+qGfPl+PkldnQIwcwgW4P0iSM3IzfdI7I7oGUAa/MzkF0bjh1CWL8tiJ
         gwvDDxR0juJe4TX38pAAnF5VC0BiyWUnrOX2lHZW+VJTTewwdcUHAditX1EXWRnVcd7m
         KzHLHsLkdDAQykNefJFpyj4NT+0AJ8Ed+/pN81fYcViOF8Nvxwb8PjSmh1GgxP5xhaBc
         cyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iBmGnyk/fT87aTvwCZ7SGg/w21dxvgBIz/PICCr/er8=;
        b=RKoDwZR5pQSMuuApiBXsEzZ8e2z0h8Bz7itmo85AYj7eDfxP3VCDblDKYbVt32u/wQ
         irgEFr9Rm2xOH1HbkRv2ywpGWxp+JfKGOu8cOddzgYoAZYmRzNCCT9XoSZSNAHp1F8+Z
         WJQ3xzz7jP/g2RHhM/SiVUtR8V2J+ZaCqN4XvelyR4kOFUQ6NdQAnC71hkY7ElH7Uxb8
         owDeWkPqC5/H43jgrm7YF6QgIl2qZrs7qDLz4x7ZsV2IV0DY1El4IAzsbdaBTfO0Sp00
         5PhoQXngDDHfIEQlshBn0ZvWkFWhUGp7Wz9xZwc2NsyeWeUyiX9saS7ryLSyn2L7c6kA
         IXTA==
X-Gm-Message-State: AOAM530dWuaRot6/GSguRImvQkCAHEG1Sn8OTcBgM4uuorrGjcwmjI12
        YN2HBDRQRMs+2lYYHSs++Ea9Q8PHNiqEoXa4sl88zA==
X-Google-Smtp-Source: ABdhPJz3MCvbJp+EF5TmzD/07fbTOmvJe9al4WPPRfctVqBJzUo1AAw8BTN7TagCtID6Uu8GNv7hKbBDl0Y9BxX+T4I=
X-Received: by 2002:a25:dc0b:0:b0:65d:e5d:a87a with SMTP id
 y11-20020a25dc0b000000b0065d0e5da87amr13101954ybe.295.1654294859010; Fri, 03
 Jun 2022 15:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220526143707.767490-1-krzysztof.kozlowski@linaro.org> <20220526143707.767490-8-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220526143707.767490-8-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 4 Jun 2022 00:20:47 +0200
Message-ID: <CACRpkdYS1yV5v7MfqF1hcTe7ETjqOjCYzyLB6KeHHzTzaJbLsA@mail.gmail.com>
Subject: Re: [PATCH 7/7] dt-bindings: pinctrl: deprecate header with register constants
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 26, 2022 at 4:37 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> For convenience (less code duplication, some meaning added to raw
> number), the pin controller pin configuration register values
> were defined in the bindings header.  These are not some IDs or other
> abstraction layer but raw numbers used in the registers
>
> These constants do not fit the purpose of bindings.  They do not provide
> any abstraction, any hardware and driver independent ID.  With minor
> exceptions, the Linux drivers actually do not use the bindings header at
> all.
>
> All of the constants were moved already to headers local to DTS
> (residing in DTS directory), so remove any references to the bindings
> header and add a warning tha tit is deprecated.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

This looks like something that needs to be merged on top of the
other patches so if you wanna merge this through ARM SoC:
Reviewed-by: Linus Walleij <linus.wallej@linaro.org>

Else just tell me a merging strategy and I'll use it!

Yours,
Linus Walleij
