Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA27C58047F
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Jul 2022 21:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230468AbiGYTeu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Jul 2022 15:34:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbiGYTet (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jul 2022 15:34:49 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 045161FCD3
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jul 2022 12:34:49 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id mf4so22480733ejc.3
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jul 2022 12:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xh3UKl8Q5rAd0qWPy+oNZTzRQbMt625CogTHbG8NRII=;
        b=M+gDrcjYWH7tIA8D5EWXm/6l6EMxYFPldTZRN5pPy9VC6CznCB5+sh1vFIpzGl0YPC
         QrTiiZfTr3xsU9y4CrIopREBuN8KJZ4qh1nT06UOCabI/wm4cVYuvuRFxha1W6qkSbsc
         KOkTNRarLskHX/QscocjY0xhfnIIzsf7MX3zXyUrJQS6exR5ifxGlvOhuToW0ilyLMra
         TekIESuWREIhN2IBgnV44rdKW5vrglrPj2WZuM6uS8BrKyr8jb2wrOY/uNWRBBY72Rjp
         cnH+wKuq5K+DnMD8wFfTitR1gSd6Glyjecu0fyjEyfbSpIKZ7tWbnnCOC+oey9O4DNCQ
         GWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xh3UKl8Q5rAd0qWPy+oNZTzRQbMt625CogTHbG8NRII=;
        b=DQZSbAhshqe625uWDgRSsSckbVPXq91FtOFJJsIiYhNSpD46BpnLAgUNejj6/gg7am
         fZoJVy6OA9K6vQaKE0NsBsGoJAGWGlmSnF79RCCqllg7xbN5DPjG2AkftNE9b8Z/EkVk
         +Lct9oxUXZiTwG/Nr9uhV+NDNVJIPs0S7+j1D1c166Kok1OD/MT64158rt6cfbtdvunM
         +6V3jNx4orYbudb1zqzj/IpO9BWpGp0X7LT3KMXNRhPSfHgNLEMLWmNi5uLqfjzi+HV4
         drWcFgjBP4BmvZ60gswp091PYEQZppzr1pKBKFSRiXSfxA4PX2ljCTkFngOKMZVEOVq0
         XPog==
X-Gm-Message-State: AJIora9aFrvvRf3hRdtXcdUOVSCDx+Km0xAB+ZXC1Vb7C3DcB6qkGoyx
        bsoTvD8akaX3ZuMta1lbc6uEZlRRODDFMryO01jqnKknolfrsA==
X-Google-Smtp-Source: AGRyM1tv41lg9srpF1YUnJDvvAgxwpK0Bmvn3Ou3nSKtOHG5Gu/J5pW+uWc7AomYkQLfG5H4kv/x/s3hsaQbNNzhraI=
X-Received: by 2002:a17:907:75da:b0:72b:3ce0:2524 with SMTP id
 jl26-20020a17090775da00b0072b3ce02524mr11283757ejc.394.1658777687258; Mon, 25
 Jul 2022 12:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAEBpM+ZPZNpJNJAU=2iji8+dCnLEcordRLwH3-mKhYqWS_zr6Q@mail.gmail.com>
 <CACRpkdbVRm7SdCPm-RP7pD2v7ce+i+kSh05wdFsmMmBbDk+1YA@mail.gmail.com>
 <CAEBpM+ZDiCD7Y5au9ng4iaptbQEHMXwUFLY370_uVBKCjsR+EA@mail.gmail.com> <CACRpkdZ139Dhonh82Zs_DGewb3KkocpU7yE5wuhukm=TfZBkOw@mail.gmail.com>
In-Reply-To: <CACRpkdZ139Dhonh82Zs_DGewb3KkocpU7yE5wuhukm=TfZBkOw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 25 Jul 2022 21:34:10 +0200
Message-ID: <CAHp75VcTu5+Jb1La+Db=SM_Ec=cq9q4xn-p3KrM7HQF-k5u5Gg@mail.gmail.com>
Subject: Re: To write Java binding for libgpiod - need help with looking for references
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Meena M <scientistartist@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 22, 2022 at 3:00 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Jul 20, 2022 at 11:37 AM Meena M <scientistartist@gmail.com> wrote:
>
> > If I get to know more about JNA will share it, but going by what I have found online,
> > JNA is slower than JNI. I am very new to this too.
>
> Good way to learn!
>
> > At present I am going through JNI programmer's guide which was recommended in
> > a resource(a youtube video) which by itself is old(2017), the programmer guide even older.
>
> It's annoying. I would check the opensource Java git to check what is going on
> over at Oracle.
> https://github.com/openjdk/jdk/blob/master/src/java.base/share/native/include/jni.h
>
> > I am getting a failure delivery message for linux-gpio@vger.kernel.org, how do
> >  I get to mail everyone in the list?
>
> The email address is correct.
> Maybe it is because you're using HTML in your mailer?
> The list servers will reject any HTML-formatted mail.
> Make sure gmail is configured to use plaintext when sending mails.
>
> Yours,
> Linus Walleij

Have you spoken to the authors of recent (to some extent) active projects on GH?

https://github.com/sgjava/java-periphery
https://github.com/helins/linux-gpio.java
https://github.com/NickZhang1024/java-periphery

(Dunno if first and third have any relations, GH shows none)


-- 
With Best Regards,
Andy Shevchenko
