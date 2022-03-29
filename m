Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20A6E4EAE3C
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Mar 2022 15:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232320AbiC2NUF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Mar 2022 09:20:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235163AbiC2NUE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Mar 2022 09:20:04 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CF031A3BC
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 06:18:15 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id lr4so26657894ejb.11
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 06:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JWA6mlXiJvWNSWOj54sl/B0BQZznTOM9hbik+wtU45E=;
        b=kdPpJYVS6sKUqSSZkrLfPp9g0cP2qxTFPeQXSDlr4wZlDy9aJCdqhW3gr+KB3wVABR
         MiyrJEQaIBILgAnCiuGoBNVd+qjQKepVBmmV/oJ7fyIyX41CaxEso+MVgWUs2j6TzWcI
         9NrJ2MuXBK/85JZW5r4hKpmXEoV1bJrHblL83wA+sEMD5wlnTTl1JoeDlISGRAVb8+LW
         xjX7c1gMfNwF8PUOrQAabMlr36QUpAzlGZh848+Q3MJ+sXoNMByLMzm4R3ibQLn28Ur9
         hs44huT2qrXeg7o0jb8vLXpXop/040/6KYBW5sV2C1Go5IrIGIsyQKzf2GYYyKkQWHZY
         IeAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JWA6mlXiJvWNSWOj54sl/B0BQZznTOM9hbik+wtU45E=;
        b=CoRH0Ar5989bZAtqDZjcTRaODUWgeLLBI8YCdXnnkg8oMx79O8gICQ1q+UQyFkfTpq
         IPuE58KID1GPE/agSykM8kJnFIqSolFRFaDldSNQ4EDqfEbjBp4sQ5UOyHJIvJS54poQ
         svGtDKLBHJbyUD7DZxouYt0dfMQY0PoDV3xyVd+UU6UVuTbtgT2QQJJZCksxnSrqgXmS
         XscHtmRaVtlj0cGoV/PqwoGVHz7NRNDifl3d/NUIXN6HeKDoy/W3UWOdE7VN05+/fzSB
         v6658ibzZ3rWN+ZdoYWTAq5JzL2YY6sqICrsEnBJvQlwWcT7kvuiEE9kluuscIb0kS4W
         RH/A==
X-Gm-Message-State: AOAM530lfUw0KbrhO67xMy2x9UsmZLXi9JWBXYqGwjOjHb5zV8suOb63
        4eSen2MAzFWcS5YzTtVlUWEZ6LOYg417Vvs39kQUhw==
X-Google-Smtp-Source: ABdhPJwIIdlAEt4bHMGZGZ7EIDlGY0/cF7iBWK8eBqQ1fmf/2y7/XRXrFPwAjqgYk0MxmOlrQyVUV4ErYQvA011szS0=
X-Received: by 2002:a17:906:d554:b0:6df:a6f8:799a with SMTP id
 cr20-20020a170906d55400b006dfa6f8799amr34289133ejc.492.1648559893859; Tue, 29
 Mar 2022 06:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220303225525.29846-1-kris@embeddedTS.com> <CAMRc=McesjKviO=5gK3GN+XukZfSr=um9W8+sqXw9GSFX0QTgw@mail.gmail.com>
 <1648489760.3393.6.camel@embeddedTS.com> <20220328175857.dvmvh5knabc6sq3x@pengutronix.de>
In-Reply-To: <20220328175857.dvmvh5knabc6sq3x@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 29 Mar 2022 15:18:03 +0200
Message-ID: <CAMRc=MdZm1HU3vZcYK=cStmCE6+tQ6R4-ya5t3ZRovf0RZHJQQ@mail.gmail.com>
Subject: Re: [PATCH] drivers: Fix Links to Technologic Systems web resources
To:     Marc Kleine-Budde <mkl@pengutronix.de>
Cc:     Kris Bahnsen <kris@embeddedts.com>,
        Linus Walleij <linus.walleij@linaro.org>, wg@grandegger.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-can@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 28, 2022 at 7:58 PM Marc Kleine-Budde <mkl@pengutronix.de> wrote:
>
> On 28.03.2022 10:49:20, Kris Bahnsen wrote:
> > On Fri, 2022-03-04 at 08:24 +0100, Marc Kleine-Budde wrote:
> > >
> > > For the CAN part:
> > >
> > > Acked-by: Marc Kleine-Budde
> > >
> > > regards,
> > > Marc
> >
> > On Mon, 2022-03-07 at 10:22 +0100, Bartosz Golaszewski wrote:
> > >
> > > For GPIO
> > >
> > > Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > >
> >
> >
> > Inquiring about the status of this patch. I have not seen it show up in
> > any repositories. Is there any other action I need to take at this time?
> > Apologies if this time frame is normal for such a low priority patch, I
> > am not sure what to expect. Thanks!
>
> I'm taking the CAN part. I think it's best to repost the GPIO part as a
> separate patch.
>

Yes please, and for the future: if possible separate such changes into
patches aimed at different maintainers.

Bart
