Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECD482026DF
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2020 23:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728989AbgFTVcr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Jun 2020 17:32:47 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37403 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728942AbgFTVcq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jun 2020 17:32:46 -0400
Received: by mail-lj1-f194.google.com with SMTP id e4so15302437ljn.4
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2020 14:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jPqxfVUy1Gzl1fLE6PCdAwbdXrjoXBidHDbOe2gfB/Y=;
        b=ybSMxPbji04GXBgQMUj5fbCOpXQxnIB+/uxJxJGkNZzsUGb1pf7fMjBkoUoCYE1fZx
         Un5rLRNRQWJetGwQ7bHr3XWi92A7i1cYTAVM0s9HcGt2WLAOVTRDgFZtI2E7+UYz5tVB
         lN97L+omd7SQNGhzCgcrckDFtsOmKhuxcFilXbYrbUaWuwxWhWLGXWMsxk28x81Kza6H
         1naWcYaBoOgsQdxYZ9wouu5nlMGls2EdKSQIWN6Jt/Xp9dV7VXvfyAubx1Av0NraH3yW
         spSGsrEEbO6Il25BAVb2L72ZRxta9QUtP3J9pz4CzzYVLbokoxIEtRVXVftlW8ZUQHhp
         DG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jPqxfVUy1Gzl1fLE6PCdAwbdXrjoXBidHDbOe2gfB/Y=;
        b=tThMqyBN1qtWKAGhFmv9rImhPwfCXCf1/XmMX2uvuX3FqEt+anCA1CEtymEV7k3swV
         FJ1MBPOShWWwuXSt0P+oAPFQa9jpyKgLgSQNZy5tTBDhLevBYmA92NEdpfchwpMFtwBX
         M/Eml9N9rY0KNnF8gCYuKL+dH/FqPR+R7QwZ/1Ez+VuK8BfnJw918i974O5i97o4bltu
         zKfk+fk3jzuFFEe9Qd+wn1sQKgs6N+Qr45NeZHUYe36EuKQhjp2/u2cEO1hyK24jeDbR
         FeVbGfPOK8T5QZ7IBgTFpimIS794ux+C4oE6elgBFj/25zq41Q05WyF94HS7FWq/rhCr
         2yhw==
X-Gm-Message-State: AOAM532KlCxYYQ+XpseVDcC1n3qw/2nyeHD9ne/KHjUCXl1eeQiXPlUJ
        F3rFbCd8ritHYG5AWlcWv3mdPJuNFZ8kzx8v91HPEarCyn8=
X-Google-Smtp-Source: ABdhPJyX0/YcVM3NDYVudiZWpJg0yQTwjqwbFIl1YUal/YA0hvXTcQ+p+9pzF3dbVB57FdkR85fcY03rZyyxXP0NdrU=
X-Received: by 2002:a2e:7303:: with SMTP id o3mr5238694ljc.100.1592688703993;
 Sat, 20 Jun 2020 14:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200618114906.79346-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200618114906.79346-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 20 Jun 2020 23:31:33 +0200
Message-ID: <CACRpkdbWMS+qNQFsJ+9QrphTcqw+2EVRw177X0wTvTLoaXNuyQ@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: pca953x: Fix GPIO resource leak on Intel Galileo
 Gen 2
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 18, 2020 at 1:49 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> When adding a quirk for IRQ on Intel Galileo Gen 2 the commit ba8c90c61847
> ("gpio: pca953x: Override IRQ for one of the expanders on Galileo Gen 2")
> missed GPIO resource release. We can safely do this in the same quirk, since
> IRQ will be locked by GPIO framework when requested and unlocked on freeing.
>
> Fixes: ba8c90c61847 ("gpio: pca953x: Override IRQ for one of the expanders on Galileo Gen 2")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

This seems to go on top of what Bartosz applied so I expect him to pick
it up!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
