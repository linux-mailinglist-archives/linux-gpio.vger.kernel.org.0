Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45EE017429F
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2020 23:59:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgB1W7v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Feb 2020 17:59:51 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33938 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbgB1W7v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Feb 2020 17:59:51 -0500
Received: by mail-lj1-f196.google.com with SMTP id x7so5149638ljc.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2020 14:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AOJFUJdzIm13OFCRNYI1AsCX1VTgfBtdl8shek8uR5A=;
        b=ge3fHElFyMyC9s+cSl+vea/RZpvtvR3z63lvcku+VRD89zT9fR5Ej+kCeX4SCrFSo/
         fLt+YpAtSBYyGnAhcKH6Vi5+6UueLy37K73MguKfZvEe4GqjgdpcngqYsc0rbYJjoY6v
         pFPtL3XehCPWFMpJha6YMCMNdVrtf4S3uDOT7kQ4JHf4J4MEedOVr95KVn/ntJD9b686
         bUMLtp05HNIr4Fsc+reEj6cebB4Ne6mGWwqS3dA8NkenZUbtXQrwRIvms3RIQib6FlAQ
         7QFCyX2HtSuqDcXKH8NkYSgGA8M0VsNlQ1PkgoKulCw4236EtN+otTenlpgdn3uc5pVF
         hBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AOJFUJdzIm13OFCRNYI1AsCX1VTgfBtdl8shek8uR5A=;
        b=tBBkT5l/k6pEy0DolqaYQetzgf/26VzwmWv0FFZeCtZlwjbsEqbDTmYMV8pHL+e6Aq
         VsgmeeglvJ8KQO9jk9D3ZZzPnOQJw8QS1szVswTk39FNPuSIgDw3/E+YQ+sF4c+ch5Bk
         TA8yaUbLQX3Bd8I3ldsHnidRlSyjBOuk0zb6wePWyxmfrpfdrkrNdQbJ13vhXUqYSjbK
         2sBjuPpRZyxPqbDuGIze9W+b1NhSdBaBiQTm+cb3clhUD+iDJzcB4AVPqpdIunotNnap
         rEs8QxYrDGZmwavbvdqHuDAXYyWVMB8QrvYxEjhsyhzn/Va+PjPZmCrLEW4UmZdQtAqX
         iEiQ==
X-Gm-Message-State: ANhLgQ0corxvdgR9HOA0TdQIYUpIhxN1AHB3P/Nxup3cKOVtgHRcgEHQ
        SvHSGl/JwYtDEkQS/YBxjIs/k8K3TUf27OJGoQbQLg==
X-Google-Smtp-Source: ADFU+vuC67bowJW12vD2MyrNqs5xCNNslGUDoa1wBIHg7gA4iZyEJio8USu0NRY7cNnyJnFzrVYm43BHihGcMJObYFc=
X-Received: by 2002:a05:651c:216:: with SMTP id y22mr4415196ljn.277.1582930787984;
 Fri, 28 Feb 2020 14:59:47 -0800 (PST)
MIME-Version: 1.0
References: <20200225114725.839-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200225114725.839-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Feb 2020 23:59:36 +0100
Message-ID: <CACRpkdYdbC=xv2J7FJgO24_xu8gh8g-QyQs1chkPzfHV35aPUg@mail.gmail.com>
Subject: Re: [PATCH v1] gpiolib: Optimize gpiochip_remove() when check for
 requested line
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 25, 2020 at 12:47 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Here are the following optimizations have been done:
>  - break the loop after first found requested line
>   - due to above, drop redundant boolean variable
>  - replace open coded variant of gpiochip_is_requested()
>   - due to above, drop redundant pointer to struct gpio_desc
>  - use 'unsigned int' instead of 'unsigned' for loop counter
>
> Note, pointer to struct gpio_chip followed by pointer to struct gpio_device
> is still valid, back link is not.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Looks neat!
Patch applied.

Yours,
Linus Walleij
