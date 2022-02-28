Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4DFC4C7888
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Feb 2022 20:15:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbiB1TP4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Feb 2022 14:15:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbiB1TP4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Feb 2022 14:15:56 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C57ADE2EC
        for <linux-gpio@vger.kernel.org>; Mon, 28 Feb 2022 11:15:12 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id y24so23109090lfg.1
        for <linux-gpio@vger.kernel.org>; Mon, 28 Feb 2022 11:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RaHvQvU+g+DJPHB4pwP7EaF4IEodKDmqN1Ss46lBbuk=;
        b=eva7/zFozRLyNBFcsYg1XG44yt+LkiFwgUQHGuPMMFE9jumunmKXgw3Oaj9bSWnnks
         sjxO/gP2sXtD10iEbogR1SRuM1/llu9YnuNBLr4/cZN7DYKUzrwy0ttJwSMs9j7FUkia
         Hf3uPSgvlT0mtpwZJ4nVHwkRgrSh2Duk7pXBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RaHvQvU+g+DJPHB4pwP7EaF4IEodKDmqN1Ss46lBbuk=;
        b=y/X5k1A5QBFoMMQx5+yNvYM3osFmAv+f20H5duF9V3WjY9CxXiChdjiseJiHTQ0g6X
         9tzEJR5jmA84+Qv1q+qj/XPZ0tzMlwuM6rW7JKuUqgA6RaDp05lGdC84MES0Wbeaoyyx
         Mv84VhfMNiNW84tqRTuwpQORAcHZW50soa1dkNVv6CdNDlLWLauJD5LJlHWq5XDIGnZU
         fnjahGDmwYi19CZfli/BHOVmsvLmyhLCwoTK0weYfgyc+w/LPYH9//f+EwY1Xbb35URZ
         /O9tHmjPsRLYnuOd7nbJvMBMxmNKY6JhSDC9fTra8iolGlH7ucH/fLdNrEqzBlBcRP/h
         KMHg==
X-Gm-Message-State: AOAM533kWf6P5xjtQgJUY+x/+u2cTaN8Cwr5+Vqv/KnkSl20NP8lQCYp
        Pe2JiKPI2AVAJbxNNvCM1G3Um9MIhx736AcvmjA=
X-Google-Smtp-Source: ABdhPJx+DqGU/SbZ7jqfhPJKGDVPZwWycNAsbr7k68ovSZymOKCawdDfXjGZCWWfLy6SgvXXaGE1Ew==
X-Received: by 2002:a05:6512:5cc:b0:443:9843:a8a8 with SMTP id o12-20020a05651205cc00b004439843a8a8mr13762973lfo.160.1646075710410;
        Mon, 28 Feb 2022 11:15:10 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id bf31-20020a2eaa1f000000b0024637000209sm1478518ljb.10.2022.02.28.11.15.09
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 11:15:09 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id f37so23035479lfv.8
        for <linux-gpio@vger.kernel.org>; Mon, 28 Feb 2022 11:15:09 -0800 (PST)
X-Received: by 2002:a05:6512:e8a:b0:443:7b8c:579a with SMTP id
 bi10-20020a0565120e8a00b004437b8c579amr13597040lfb.687.1646075709682; Mon, 28
 Feb 2022 11:15:09 -0800 (PST)
MIME-Version: 1.0
References: <CACRpkdYM21hcH5d9rXyvjMPHQp429OZ1Zcy7uLU2tndoJcOmUQ@mail.gmail.com>
 <CAHk-=whg3eRY1nOJjHam+jORmVymU539CxhBUjp4=tGoFitotw@mail.gmail.com> <CACRpkdbWkm1WDY30qoGLEQba+G2cDEhT+M8nCdJbcD=ZQiu6uw@mail.gmail.com>
In-Reply-To: <CACRpkdbWkm1WDY30qoGLEQba+G2cDEhT+M8nCdJbcD=ZQiu6uw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 28 Feb 2022 11:14:53 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjNdW6Tdei6+6OJy6jGqY=PCJ2TWFKpV+g0projUC1eag@mail.gmail.com>
Message-ID: <CAHk-=wjNdW6Tdei6+6OJy6jGqY=PCJ2TWFKpV+g0projUC1eag@mail.gmail.com>
Subject: Re: [GIT PULL] pin control fixes for the v5.17 series
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 28, 2022 at 6:44 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Sun, Feb 27, 2022 at 9:38 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > Hmm. Am I confused because I thought I'd see a fix for the orangepi
> > problem that Guenter has been reporting?
>
> OK let's poke Hans, he usually fix things quickly so it must have been missed.

Well, part of me being confused is that I've literally seen you reply
with 'patch applied' to the fixes.. Ie:

    https://lore.kernel.org/lkml/CACRpkdZ1nFAmzRvsvKvZ08fsP_MgsnsiNpD7LdRRXUDWtO_w=Q@mail.gmail.com/

but then I didn't get the result.

Afaik, that patch is only relevant if you applied the previous fix
("pinctrl-sunxi: use the right offset" or something like that).

I get the feeling that you didn't realize that this was a 5.17 issue,
and have maybe applied them to the wrong branch, and they are pending
for the next merge window.

            Linus
