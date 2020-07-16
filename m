Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 129D42223A9
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 15:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728532AbgGPNOp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 09:14:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728087AbgGPNOo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 09:14:44 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9231C08C5C0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 06:14:43 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id d17so7127897ljl.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 06:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bBoOhm+GV/yHPZh33fMz2aVrUQ8YpA+qKh/3LyamqOs=;
        b=lnD2/ao0AusGxOT5rQ8o0aaxmWDu0KuU4mCKD8GmqAlMnn61XfetlQXd8z2nAXa/Ev
         PCrXuisiZHfDNjy/LFjKhyZycHaPjSTyZZPWNRuCVY4x7yhf6ZPpZa+v9HAvPoGKdePt
         N5yz0o10tcqY7jUPAS8+k26sWFXuz5v4TsN7XPjROpVsUivQcGtf6IDFAfgybSqYGHQK
         9vGqxoV4+59ruRRjdAlbb5WQqaKpN8E1tSZXHPxXkaEN8+Zcbrqc92K4eU4I+CZ8k6jT
         7IjxGhlU6lszhda2/pjerfnJDRz9dcNyBdsL0Ih5CSPOMXZwY0nAQblu/+5w0jdMMIKb
         csbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bBoOhm+GV/yHPZh33fMz2aVrUQ8YpA+qKh/3LyamqOs=;
        b=mo8j5yyf2uWwXnjVEgOE5SmLGuB1n7qfVU2zy3J5BRLxn7DoJ9mWTMB3lAtdeff1lT
         l/BhtQwSi6mqAWeRKtFIHr5ClLLLjnBCyepExLWqZOus+pH9CCf7jNPIwvIWVX2Xqe4q
         9RAJhXPcs4Hfhv+PFuA3ZwLciqMCfg7W3sz2uIOel06x6A+0lyo4zziAgZSHu20qtCsT
         Su8Av/SXRkpElHnG/+Yi1h3PgaCRLdEncXcP9ahZGY4lic2P5yZI7QrNKkjgMNCQHgR4
         hoUq+xoM//XxLt8W0x1TkSmra88ct8IMAAcj1OmcVqmPrX+VWM9LYkUinO+NSiP5N3Xs
         2gqA==
X-Gm-Message-State: AOAM5329PRH2X0Sf5xrmt/iwbP8E4/fhRPU1IVibrpKWVAFj4k/Ir5X1
        0d2dQoafZqa9qq7J6Y4Dk1Mt/e47N9bcEYO2uAbdqQ==
X-Google-Smtp-Source: ABdhPJwmvWwrnn/zXFAaqbiFIZZ2k9t59pLji33UNkp5uvoqHLuaSdq0MMGTcbRxQFHJ1hNqXP/I0e7IFNSw0UUqHHo=
X-Received: by 2002:a2e:810a:: with SMTP id d10mr1948021ljg.144.1594905282186;
 Thu, 16 Jul 2020 06:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-17-lee.jones@linaro.org> <20200713200244.GA23553@piout.net>
In-Reply-To: <20200713200244.GA23553@piout.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jul 2020 15:14:31 +0200
Message-ID: <CACRpkdYcr9Tzt+=15KGhcbiBRhyZWYw8=ieNs=ZaX8CMdZv9qQ@mail.gmail.com>
Subject: Re: [PATCH 16/25] arch: arm: mach-at91: pm: Move prototypes to
 mutually included header
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 13, 2020 at 10:02 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 13/07/2020 15:49:21+0100, Lee Jones wrote:

> > diff --git a/include/linux/platform_data/atmel.h b/include/linux/platform_data/atmel.h
> > index 99e6069c5fd89..666ef482ea8c0 100644
> > --- a/include/linux/platform_data/atmel.h
> > +++ b/include/linux/platform_data/atmel.h
>
> The plan is to get rid of that file so you should probably find a better
> location.

OK I dropped this one patch from the set for now.

Yours,
Linus Walleij
