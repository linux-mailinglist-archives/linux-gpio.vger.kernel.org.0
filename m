Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C13B5A17A8
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Aug 2022 19:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237654AbiHYRGX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Aug 2022 13:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbiHYRGW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Aug 2022 13:06:22 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DFD7AC24C
        for <linux-gpio@vger.kernel.org>; Thu, 25 Aug 2022 10:06:21 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-3378303138bso517846997b3.9
        for <linux-gpio@vger.kernel.org>; Thu, 25 Aug 2022 10:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=SOy68UEC0YgOxRxAM7LgXUvCsgIpZ6R1Pgijw93SqxM=;
        b=gx+Erd/icC6qh4IpZ0BSBdmpw72IdDomoBSPsFosYc0KoaDrWd1W9SM9staylbgCNc
         MPf88UCEPkXGCaLJenxA1lV92FL/7Tytze7zn18IyirkGA3f4FW7S2ZPVZiyQ87rhIlv
         BA+2ZCv+U6jBOexCd2weKguHWIl0L6x/13GKSEoKla7Y1FdiXagdokJBwVMPdIoeD3r4
         7qF9JZnVZiG5e8VqAL4XtxEb6Gxyd/8KpR/4fJNHIb31YnikFRKxIbPpEMYl1Az5uF+L
         vQs1ogcJ4Qg65HcaDMHd9jxwXAcrqpEXuCx6xxi/57iFcFdsmp9DViLsYfC1N4HpflD3
         dyIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=SOy68UEC0YgOxRxAM7LgXUvCsgIpZ6R1Pgijw93SqxM=;
        b=Ef5d2sKGLYZnx4qfTUnTyYHsTa4CgPXoveET3ZWYzbyw9AAMoIR5xrT5tElemVTOnW
         CzB14Q8n5hulROdhtyWHC8nOZwRnG1Qm5lwjb4SgQhXwUzS05HlhaeNiAs+kPujuetfq
         0oiec+VDj6NejvCB0hHdck4BSuNdZPh0iipaW0fmhRTbAa8OMX2YJNdRFU/gV324UTBk
         6l71Fv+DZVH5s2e2JrK2Jc35FmrC5YPpxyou+CWjRUEYsblJwbzn43fUr1DbvejL6wzW
         FCFsnvyH9IkYfyUxr2t7PPW9RzVd7Lkbv0jv4AYCJ7fbcZeao7pO/k2+nZ9a11ExoX2D
         Q1Ng==
X-Gm-Message-State: ACgBeo2ACTuMX6JoAJYHsWulxLaVP/hbE5mrtBQVy/GJOGWRD7MBT5Dy
        TXGc1V11J/X2TpLAeTnd26//XU79e/a9TBPTlUAhVw==
X-Google-Smtp-Source: AA6agR4amXEIKvXMXuUDe8G8QYLGEe0SPU95eszKZrRMSzAgG7u84pGBQ/1fQFxjQQcM+hKkbwNc/Si/sXNJBxpChlc=
X-Received: by 2002:a81:7992:0:b0:336:8015:4889 with SMTP id
 u140-20020a817992000000b0033680154889mr5015363ywc.80.1661447180125; Thu, 25
 Aug 2022 10:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220727013349.3056826-1-saravanak@google.com>
 <49e4f45a-51da-ec4c-9ebb-dfa022bf8a88@linaro.org> <CACRpkdbS2SGUMktB4a8T-cMW5d=s_BiygrSmAbOix=BUg0JOSw@mail.gmail.com>
 <13dde9ca-35de-bd8a-ec47-87fe1f844308@linaro.org>
In-Reply-To: <13dde9ca-35de-bd8a-ec47-87fe1f844308@linaro.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 25 Aug 2022 10:05:43 -0700
Message-ID: <CAGETcx86fMqRVgFr9yzemcwLAJkJWUPH3+WxPAtHoaNckNFkNw@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: samsung: Finish initializing the gpios before
 registering them
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>, kernel-team@android.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 25, 2022 at 5:11 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 25/08/2022 15:08, Linus Walleij wrote:
> > On Thu, Jul 28, 2022 at 10:32 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >> On 27/07/2022 03:33, Saravana Kannan wrote:
> >
> >>> As soon as a gpio is registered, it should be usable by a consumer. So,
> >>> do all the initialization before registering the gpios. Without this
> >>> change, a consumer can request a GPIO IRQ and have the gpio to IRQ
> >>> mapping fail.
> >>>
> >>> Signed-off-by: Saravana Kannan <saravanak@google.com>
> >>
> >> Looks good.
> >>
> >> Linus,
> >> It's too late for me to pick it up, so make you could grab it directly?
> >>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> Otherwise it will wait for merge window to finish.
> >
> > I sadly missed this during the merge window, as the commit message didn't
> > make it look like a fix or something urgent. (I don't know if it is?)
> > Just send me the patch as fix or for -next, I let you decide.

It wasn't anything urgent. I found this issue when I was refactoring
fw_devlink, but that series hasn't landed yet. So it's okay if it's
landing only in 6.0.

-Saravana

>
> I understood, so I already picked it up after merge window. I'll send
> you this in a pull.
>
> Best regards,
> Krzysztof
