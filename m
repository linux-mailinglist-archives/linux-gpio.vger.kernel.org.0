Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3B363C173
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 14:52:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234266AbiK2NwS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 08:52:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233677AbiK2NwR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 08:52:17 -0500
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2634F31FB8
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 05:52:15 -0800 (PST)
Received: by mail-vk1-xa2f.google.com with SMTP id j19so6789001vke.12
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 05:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7QoB0zSkTK/9CzXcpMRCnSPpmfyOcbVIIYP6Tcrl6Zw=;
        b=CSlVn8lfM6dFKGc5OaO+5icorEg3mJiRHKkvW3ehGIunnbofgU7hWSMZUvEOuokQBF
         LHzs2FVw5e6ZTtmfVkgbcYF1Cd/AWFiD77LaLn5uiC10FEH20WQNcnznG3Ni8o6RknUE
         Wj4+yBAu5SVoTZ5YMH67hXUHAt6jfiJaFRiCpECydfhwikyIVWW0LlYoA63d4w+zqVf7
         E1MZYGo0hGJ0Oi+B0q8f9IsngHr3ztETS6tue/YpkU4100wDzm8a70dCVeMrdPr/JRB/
         H1fgm5+ornGKfjZqI6vqGA+KrA624tHSREjBpua8RLceAAEAgthJ7Ub5tWMniOK3Hg33
         x13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7QoB0zSkTK/9CzXcpMRCnSPpmfyOcbVIIYP6Tcrl6Zw=;
        b=ul/cEfxP29aWgg/AHAlkad+WBQHIGAhKycalH2aT0R05QyNB95fGR5v3Qt3vSGTWIw
         aTw73UesHjqeQmXpS3ihAoh1bhk48pHbiOnWjo2kJ8dPJa/Mh4z26oHlhZONMZGmXIzv
         zfxAIQMn5bakQdW3GJB8tr8aSDLrnDhum+GygyZKYab2f1pZtGZhWAB39/OzHcwzfVZP
         hX50mM/vdym0SEds5CP2NNlvCh5AijMrvu1em1/FLw7C/Ha9FAfrGz09pnUWTGMsmXMx
         Ibqt3zw1oF8K5MP6jV85SJYU21naWWtkCOKTtSQtEfipOrHuyPE59c2qRBG1k744dYUv
         8Fyw==
X-Gm-Message-State: ANoB5pl1rUj+BmBcnkkRdAcMlz66xK+908HUA+mteT2UVGaRm5KwQYEw
        h2OJNu4pr/InzeJs7nhHrsTsMmfrNE39GGZ0eFdYVQ==
X-Google-Smtp-Source: AA0mqf6XvxQU0ZLVEPXfuPfjqjZD3/4eg0CqPxgPF8qjYVU/NbaJqwOL3T7T9kVQYBjymdmXn/FIMogx8QPc8uvnFto=
X-Received: by 2002:a1f:16ca:0:b0:3bd:8e1:26c4 with SMTP id
 193-20020a1f16ca000000b003bd08e126c4mr751031vkw.3.1669729934175; Tue, 29 Nov
 2022 05:52:14 -0800 (PST)
MIME-Version: 1.0
References: <20221128190055.6350-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mcfy7HjA0DvFgkgJUZ8LVF4Nnrq39jDr82UUVQ6xsmH8w@mail.gmail.com> <Y4YNOd0pBUfqxvmC@smile.fi.intel.com>
In-Reply-To: <Y4YNOd0pBUfqxvmC@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 29 Nov 2022 14:52:03 +0100
Message-ID: <CAMRc=MeLnuxoiUrKqRvUkcL0trsvauLwDEXva3pJuqcRN2Qa=g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpiolib: Provide to_gpio_device() helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 29, 2022 at 2:46 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Nov 29, 2022 at 01:50:51PM +0100, Bartosz Golaszewski wrote:
> > On Mon, Nov 28, 2022 at 8:00 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> > > While at it, make sure it becomes no-op at compilation time.
>
> ^^^
>
> > > -       int                     id;
> >
> > Sorry I didn't notice it before but why the churn? This is not needed
> > for container_of to work.
>
> > > +       int                     id;
>
> I hope this explains and can be accepted.
>

Ah, alright makes sense. Applying.

Bart
