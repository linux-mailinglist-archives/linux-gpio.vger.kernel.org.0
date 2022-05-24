Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6CD532C5A
	for <lists+linux-gpio@lfdr.de>; Tue, 24 May 2022 16:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237273AbiEXOjO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 May 2022 10:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235060AbiEXOjN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2022 10:39:13 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F40D88FF8E
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2022 07:39:08 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id n10so35782973ejk.5
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2022 07:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BHIrU1h8o3PeeWtEXAqmXklmD9PPjR9mX00xsQz9MDU=;
        b=GQp/I3roQikMivJnfms/VckCrxa6PcjgSV+wapm2zOjBujUpM++eN6dLiRIn6nafsW
         G8UnLlnmv1P0k83DWBZM7zGe07EjZWXUwimx8cYVxO6EPmzoJPQLlpqVryvwQ03vuRyx
         8apLelmjEUzVADPAAo1LErYnKF6ynWx74RFcQgSbEuF3LFPxO+/NYXR2pQPr2CURQrjb
         t/q6bwN5PSNIHjuZkfEBH5BJc5l/TjQJW3tBmjl4ex6ZcEuGoySEiyF6fNl1+ZdUsmXZ
         6ziHMtW2n2ToH28mdIPg4I56b/OmoMojhc4Ch5ELBaI8rXO0fAMkat49MTqnHXRB0NWG
         8YSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BHIrU1h8o3PeeWtEXAqmXklmD9PPjR9mX00xsQz9MDU=;
        b=ifSonWf+/0w/zj0SZ1Rg3iJ2wtz3vtMcMFXh9QABfrFOivb+19KxWxGjgjuuJCZ0hC
         3nlR/GR+CA2VVmdedIAS6RbybNZ8QMH/j4aDyVvJlnCaW2lZNzTGcBrXPDg7kBNTzoiF
         XsfnH0XgL0X2YzdtT1zDbJmN6toKLNHDCp7k3RJntIvOXixEmLDQZhqUdq5i/AMUk6g4
         sleo73SQ0r9xLsFdsJYJMRgj+Zu1sWFkANu9hB9yfz+1vg3vN2FoLg2MPf3RxWHhRAVo
         q4+8XrYCadpEgL25CqHLLZbOu/eimEQzmE6k7XAPhHa/dudhJFd1c8+zV0bhlXcBlZee
         M3zA==
X-Gm-Message-State: AOAM532dSCf/AUzSGCwfRFVuvXJvQqR/RNgoXyTk0ewAGeg9TjXHaYDw
        kdLalZQRp8bDceN0JznOZVzKo4GVcyoQ/FXb/TQuwYRDvGQ=
X-Google-Smtp-Source: ABdhPJzQTKp4+CTlp05mzJhXaW2mMUL3EiLh2HNU+72NM0eSDta+baa0lu219sROu/Y3YnnI2LGCxpqEAsHv/4m7tWA=
X-Received: by 2002:a17:907:868e:b0:6fa:2fe2:92d6 with SMTP id
 qa14-20020a170907868e00b006fa2fe292d6mr24360856ejc.639.1653403147551; Tue, 24
 May 2022 07:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220524074007.2792445-1-Basavaraj.Natikar@amd.com> <20220524074007.2792445-2-Basavaraj.Natikar@amd.com>
In-Reply-To: <20220524074007.2792445-2-Basavaraj.Natikar@amd.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 24 May 2022 16:38:31 +0200
Message-ID: <CAHp75VfQgzMF7gZ+_NHpE5jb3EF8mOEjCr6DrghN2xyrTwKK7w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] pinctrl: amd: Define and use PINCTRL_GRP
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 24, 2022 at 10:13 AM Basavaraj Natikar
<Basavaraj.Natikar@amd.com> wrote:
>
> AMD pingroup can be extended to support multi-function pins.
> Hence define and use PINCTRL_GRP to manage and represent
> larger number of pingroups inline.

This is good idea, but please make it available for all pin control
drivers, since the data structure like

  pingroup {
    *name;
    *pins;
    npins;
  }

is used in many drivers.

That said, I think the AMD_ prefix will be misleading in this case.

...

> +#define PINCTRL_GRP(_name, _pins, _npins) \
> +       { .name = _name, .pins = _pins, .npins = _npins}

Please, don't forget spaces and commas, also it would be better to
1) split {} on the separate lines;
2) make it compound literal, so one can use it in the code.

-- 
With Best Regards,
Andy Shevchenko
