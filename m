Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3EC578DB7
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jul 2022 00:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236016AbiGRWsA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 18:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235692AbiGRWr7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 18:47:59 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFDEC31376
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 15:47:58 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id l11so23505137ybu.13
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 15:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qolLFWuKdiYI62AFKCu974H8q25eVpSfVOUryfjouBM=;
        b=Q7hsm8N9967oVOGqVd8UHRMKAjY9nrR933mY93k9vYBclm4xJN79WDlUUnnrDWiPtL
         SXeBz12JkMmnoustrv+YTsDaeLfNQjh+FNnfHW8CDGZC1xl7Y1S+CoU7OdDem/pBoGfL
         aEgxNNeSI2RVurzLJ0BknTkK16EsnH4AyaSN0n4sW0Cqr3e49SZeg9taiEn1Wp+5ol7V
         h9nCCThs2bSLognyorwJka59JyyCVW4JxaIg2xBqaQdi7AXge4dhONPED75YONCpzBit
         b509mp3LeI8/DQpTmvEs7UelEDbzEc6fE1haOoIzD0mkI30WbwH5u4h10CLmmwSXOeAx
         DlgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qolLFWuKdiYI62AFKCu974H8q25eVpSfVOUryfjouBM=;
        b=HFLTIXxUdLZtyhdX0Ty+k95WbWUpggCYARJH+wyn4klKD1Bfgl1v1PdttLhg4xSC/Y
         NFXzJ0Et7WsMSWJkUE4eZnY5z9QlsHizmjFV7mqXAiIuayF9O/EVz2wBa3I68KAOXmvO
         ekJcwAxSfnkpJ0n/SBf/3e4ELfbvip5/MrK6eI36efhVO8fXSu78Xa5AML0T9Hh9+aB0
         whOOHK3r+Tk2VJIZYcxlbGcQISCzkJAp6d+XJJ4WSVmdha3LFa4tmLNA3Tpe2zqGdG/X
         bFLC0JI1sw3lq0FA5WoDkWK3lylyHdkl6BaSqLwfnTM9zFAKA3GmxyvsclWim5DhAwW8
         bzpg==
X-Gm-Message-State: AJIora/6k2u6HMjIEXhFP4EmJrkfN2rL8UchYUl4m1Qhf8f18jcf+XS4
        fswLbF06rjRPmNubqRTYthuEvTnUEesRLirEFDClow==
X-Google-Smtp-Source: AGRyM1tiaRSIdp3sBehsOn+o7ve/l74jiJVV6ahHPRdqNZAxJy5hvMS4ID9Zj3gM7addqOpdzsrohFqzWd05UXSewsw=
X-Received: by 2002:a25:f508:0:b0:66f:3c5f:c39f with SMTP id
 a8-20020a25f508000000b0066f3c5fc39fmr28146462ybe.374.1658184478277; Mon, 18
 Jul 2022 15:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220718220252.16923-1-andriy.shevchenko@linux.intel.com> <20220718220252.16923-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220718220252.16923-3-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 19 Jul 2022 00:47:46 +0200
Message-ID: <CACRpkdb--xdd0RKZuuups6q7mC7oyEPSrW_F02RYr5UNT-QHWw@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] gpio: 74xx-mmio: use bits.h macros for all masks
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 19, 2022 at 12:02 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Make use of the GENMASK() (far less error-prone, far more concise).
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
