Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 775905AD3BF
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 15:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235897AbiIENVx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 09:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbiIENVw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 09:21:52 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DE7743338
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 06:21:51 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id e28so6112240qts.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Sep 2022 06:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date;
        bh=tRVO25AcCcbSeZW/Fy4DwIgCZUwPpZ+5FJPg/p61Qg0=;
        b=Nes/Mg2wXfdFvd7AZumPHtZsU2I8sbHfQphfdXYmzjv6f9hQUd/1h3Agnvuh9NVwWp
         UPVhQGc08SO9jJd2a6GlmqJ4+9GtSmsa6EzSPO6SdN0fvlJDCSwSMhFW57tglel0hGMI
         P158xTd8k5CiBy6v1oMdb5sCIUVvwDeUWXPAH6PBBRlAKxMIP+3NMV7pAG8dRDFzwHzK
         dASvf0jaoGrydYS8AAUJg7VsEh7erKQgtUzxVdoEpL5cwiXhowUuV1rY9670y8kR1nqH
         4BW0nForbuUh1ObCNulHVB8LIYISBM7+0hvFAJqbkutOSleRNZQKcnjnyW5Yyj7Yi/ju
         SK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=tRVO25AcCcbSeZW/Fy4DwIgCZUwPpZ+5FJPg/p61Qg0=;
        b=TWJHZS6csNk/X1oPxq4dk+XF9tNFt/jZy9ScVoKlwxQvMCn1qbF4vywWw1ughmyHrx
         dzCtRfiamwbiS/16QQXkKaucjvtvDKPaRHy65en7HvSR9Ar0L++cZ/Ovng2gkY4mtopG
         X8L3yiCbJyNSZ+e0lULnf/IxUa7/BOxDyB8MgJIhZmy8IJYf0GSC/2xfIKW22uMsQLjH
         GTSGng/zXqK3edkxsup86fwZli5JqtOssPCFbAajLKw9I9LnnDsTIRihcmQasCFboJfW
         l15fWSmURraXnDk4RiJvn5ApYS4JzYS3f4GPDdvdulEow+2J8YeETWiIxslhkarexQeq
         TzDA==
X-Gm-Message-State: ACgBeo1e6Qg+NNfLRPcAKKPHg7wGNy00Y1tLBU1qr7y2QpP2F+FCCQEx
        FtQjAQHKVU/DPoG/jyX10wibwHkRq2/kSLwPwCw=
X-Google-Smtp-Source: AA6agR5WC9BIvyhF37182/SlXTa2ogTIjrHQEXlHRBYbwVP4xYmsR20rLV75XEOC4tjrsXaYitpjnwospoQni6JysHk=
X-Received: by 2002:a05:622a:40a:b0:343:77ba:727f with SMTP id
 n10-20020a05622a040a00b0034377ba727fmr39864351qtx.481.1662384110603; Mon, 05
 Sep 2022 06:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeg-003t9k-Mc@rmk-PC.armlinux.org.uk>
 <CAHp75VfW7uj=+vwGRLsUJEjF-bQLL2EdVNfAnF6iDUqryksC+w@mail.gmail.com>
 <YxXjimYiR+cxasgE@shell.armlinux.org.uk> <CAHp75VeDGCp8J6wnmCqGpV++vs2Zur9Mfp71Dk8dVXcuHFnCrQ@mail.gmail.com>
In-Reply-To: <CAHp75VeDGCp8J6wnmCqGpV++vs2Zur9Mfp71Dk8dVXcuHFnCrQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 5 Sep 2022 16:21:14 +0300
Message-ID: <CAHp75VeGb9oG_MDgE-K=aHPrURw9ZPnhRdcpoGGQnURptmdNnA@mail.gmail.com>
Subject: Re: [PATCH 6/6] gpio: macsmc: Add IRQ support
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
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

On Mon, Sep 5, 2022 at 4:04 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Sep 5, 2022 at 2:54 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> > On Thu, Sep 01, 2022 at 09:03:49PM +0300, Andy Shevchenko wrote:
> > > On Thu, Sep 1, 2022 at 5:18 PM Russell King <rmk+kernel@armlinux.org.uk> wrote:
>
> ...
>
> > > Usually we want to have handle_bad_irq() handler by default and in
> > > ->set_type() we lock a handler depending on the flags. Why is this not
> > > the case in this driver?
> >
> > "lock a handler" ? I guess you mean select a handler.
>
> Yes, I was a bit confused by API naming (irq_set_handler_locked() was it).
>
> > I don't see a reason why we couldn't switch between handle_bad_irq()
> > and handle_simple_irq(). I would guess (I don't know the implementation
> > details of the Apple platform) that the SMC forwards a message when the
> > IRQ happens, but I'm guessing that this is well tested on the platform
> > with the simple flow handler.
>
> I have had a real case where it makes quite a difference:
> eb441337c714 ("gpio: pca953x: Set IRQ type when handle Intel Galileo Gen 2")
>
> The missed ->irq_set_type() call shows a bug in the IRQ flow in the
> code. This became visible due to the switch to handle_bad_irq() and
> was hidden with other default handlers. After this I ask people to use
> the default handler to be a "bad" one.
>
> > Changing it to something else would need
> > discussion with the Asahi Linux folk.
>
>
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko
