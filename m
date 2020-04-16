Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 849791ABE79
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 12:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505790AbgDPKwh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 06:52:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505651AbgDPKvx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Apr 2020 06:51:53 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A5DEC061A0C
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 03:51:32 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id y4so7284849ljn.7
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 03:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GlIF++nu8Ug7h0uE3qnGmqRpm35mv0oidrnwnkh7B9c=;
        b=prL4/FeR8bv2MG6Cl0V6E9Ku1o+7uXcyJbztbjzweZCiBx9Hxp2gx2xVHJlovmeZGo
         qYEnpxMnkZ6hvRXMT8He8BDtsd+mBMZzcqI9c8eprJINfbrqJG03PfWmtht5dHLWcJZI
         5trDR28YZxCIA/02mnH8j4RcbQskOsmU/6yzQLNd51onivgIz59Evhk5DUQ5kIDQ7b9s
         7uwHfKzCzVwbIgyxx0ixXVUTtIOL4t2SXk0cTmPyZD17+QToyL3VCtTirBj0LQbqeQzs
         +YCUXsSX1xU/JzvCFOBZndza7FZKSctqx0U9eSocwX17I60uhTy2glxNqkBz3eJgMWDX
         Af9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GlIF++nu8Ug7h0uE3qnGmqRpm35mv0oidrnwnkh7B9c=;
        b=IsSJE74550x8v2ozamVzSBR8qivkAJsTZxr+2qU77DRQ9DjSN88+oOxZunBRBw2TiX
         ANwqm8G7rkPX8o5VOoi9pwxJFLQAEDXif/TZZ6I50L5ScbNDR02AepdeB1IXZcm2UzSm
         O9y68y1CgP6OwOlEdt5EAbjFrKjNoDUU6HIlC23+R7owpOzB4+fW+4DeJ5dCTEKPdYaP
         i6PMZhjTzvisE9aJSXA7sEmgH/0g2m194b5eaqtWObdZTtzyyKbEtUdr+fMqWnj4TGJt
         bWKUi0LJDu9QD22BUOxIThVXBLfW2xQ5knUEdzqj1+WNFo2h1Oe7BS09QSXERkiliC3c
         uWgw==
X-Gm-Message-State: AGi0PubFDk0J3MterLnFms5ptgGzL/WGcDS5x0OXWbjQGzcnxYEUhyiq
        4fU1hpbfWJr9QlcX0+ZI47B6zyQvyupKHNuetD+uj1Zu
X-Google-Smtp-Source: APiQypLDep+VjwqXW1hBjTwNlksRFgFUS2Kz+7KEpbjH0NkG1BgoTJqjsUW/HhLphKoiHD/OZe0mOzjlWJ+3bzC+P6Y=
X-Received: by 2002:a2e:9605:: with SMTP id v5mr5892673ljh.258.1587034291083;
 Thu, 16 Apr 2020 03:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200408154155.68310-1-andriy.shevchenko@linux.intel.com> <20200408154155.68310-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200408154155.68310-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 12:51:19 +0200
Message-ID: <CACRpkdYd4SOZrX0x9m9r+E70OKs=riu3R2r=_w3yH9WpEOyHBg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: merrifield: Better show how GPIO and IRQ
 bases are derived from hardware
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 8, 2020 at 5:41 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> It's a bit hard to realize what the BAR1 is for and what is the layout
> of the data in it. Be slightly more verbose to better show how GPIO and
> IRQ bases are derived from the hardware.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
