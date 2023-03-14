Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A6C76B8DAC
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Mar 2023 09:42:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbjCNImn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Mar 2023 04:42:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbjCNIml (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2023 04:42:41 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFDAA64846
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 01:42:23 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-53916ab0c6bso290427817b3.7
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 01:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678783343;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RyfJlLPgjERQcTzZdEIvIGdNCCYbhGHEmYJcVkMFQx8=;
        b=sAKlkh+PD8fSIcuCtZF3dp6H2rffw4yT6e/1S6gniQdexILJ4kNwGDKmWE5Yb/Z7Rf
         J4nTSihP/wcKeEb6OlFGId6CldujUB2jfNkKJeQbZ6IiUWPQMMvrf9RiTBt+BYPnMoml
         WFEgS1t8TaPpiy5QmNNUqbegmtn22gfHHQsS+L1o1/r07vxUdHth+NZsPgfAZkx3bfX6
         SPmw2tAfweH/Mjyc0qIY35493OZu49je1M6yqTLgmbIeu3UnB7McqZKb+J1xX1be+Rs9
         SMo8GVkG//UPQL5EZSObC//ZwnqvROh9sHb1IqA8UabHg/d3I77dZAxJhP5h6npQE9Hg
         YA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678783343;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RyfJlLPgjERQcTzZdEIvIGdNCCYbhGHEmYJcVkMFQx8=;
        b=ej1u0EhUVPUb7rfNr7tnmFH9E3zI7iktAmKWsizRKDXT2E7XRRpwnmgheTO+lGl8Ve
         vGsHsj9h/eb8CiRKem50DIhWQfsSqJgPf2azmHwD3SxeiDE4AFRR8PbDuy7Py6kU9cIm
         QaVcGiVNNrXPL2wkUg7D5PUegytvYQzrcro3Rmuk5BBIaNmId9jH2DLpbnkpY/sdFCu3
         bsA/WMF8CJSGVDovWqIybL2mbKmp0cttkC8HNB5vHTkGGNh4CIomdWhrUGWL996otEP/
         hhN96gUMIk7cBUuAh1ieWqtdGLsbBchvVKNkkO8gFOmmFZaTON9+Ls9TZtHYJ4nGuA1i
         nsaQ==
X-Gm-Message-State: AO0yUKVFRvfZ2BPL5WR5lzrxuFbRrzMoKEmTXym2B8tF8aFp3dsAjghH
        bCh01siToqfoXwvGTiAvqfzp06ihJVrovkNoZ42Y2g==
X-Google-Smtp-Source: AK7set+5W+F4WPOOqhDRx4CVAT8IMDCIBpyCU/Ol0rUg1nVe96Ns9ilnkVMyyby2mh6+/aPqtuVgkHjoUuUWlWwpiPc=
X-Received: by 2002:a81:b605:0:b0:541:9895:4ce9 with SMTP id
 u5-20020a81b605000000b0054198954ce9mr4816352ywh.9.1678783342936; Tue, 14 Mar
 2023 01:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230306090014.128732-1-biju.das.jz@bp.renesas.com>
 <20230306090014.128732-2-biju.das.jz@bp.renesas.com> <ZAZ4LY+xG2LGiHwh@surfacebook>
 <OS0PR01MB5922EA0703F259A99C157D3286B79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75Vd6qTG67_1DGiemy8n-mQn=9kiGrC0rEYw2XO0rm4Tbag@mail.gmail.com>
 <OS0PR01MB59224CECBB888ADC9214145286B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75VfDL74cEUQkxC1JuUB7SS1vYTPj_K7+VkQ-i-MKXad5Lw@mail.gmail.com>
 <OS0PR01MB5922CC51889D094129820C0C86B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CACRpkdZS5UKc7bDPs-zx_QyJU9GwJAhB7372oSC9tB-txgghtw@mail.gmail.com> <OS0PR01MB5922D0321A0779A8E78B96AA86BE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922D0321A0779A8E78B96AA86BE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 14 Mar 2023 09:42:11 +0100
Message-ID: <CACRpkdbLonPgBMD6f2Rc-E3sFtMhoc0Mzt00uTUmiAnx59JC2Q@mail.gmail.com>
Subject: Re: [PATCH v6 01/13] pinctrl: core: Add pinctrl_get_device()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 14, 2023 at 9:27 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:

> If we cannot do it in user space, then we need to make it as part of
> Dt bindings and users will define the use case they need in DT.

That sounds like a much better idea :)

The kernel is for protecting hardware from users after all, and it
seems you want to select one of these use cases and DT is
excellent for system config like this.

So I would say work ahead on this path.

Yours,
Linus Walleij
