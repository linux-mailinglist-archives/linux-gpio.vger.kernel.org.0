Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADB0E27E54B
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 11:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728957AbgI3Jh4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 05:37:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728884AbgI3Jh4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2020 05:37:56 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 954CAC061755
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 02:37:55 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id q8so1321423lfb.6
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 02:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w0Z5IZe45kS11Zh2eo8ETv6iymlzpohKQf7navdOdEE=;
        b=Y9GE9JkOdYGmLgM6pZmzvIlSStWw4CGSNLwKzM9SvZd0Kmz83SYSrefDbXfs2U+TSc
         Liv4S8yFfjxT6pD/TCAbvYZUnSFxK/jRDLUoxB82cNKhdgZ2m1OlRYL/DAWMht/aepyn
         Vznx6CNuAIFDlrPTkT4QuEiAhLrQUQpYC0zLTiFxHfJhpMXTETh18qhekWI2VKCgv1/0
         gEORxiuofCW5BRQjjtd4g4KlRmJxrT8+0kTkTEx9a4Nbca1RQo1LcPKIwkI5jlHYMT54
         84shR7etsYW0SvwLh8B4/21WDZQFTT1H5M3tTWswe2WHT0yy5F6LAg2PrsZ+w8wDba44
         ff5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w0Z5IZe45kS11Zh2eo8ETv6iymlzpohKQf7navdOdEE=;
        b=BIVwawb1zFnfg/59h/SHIBFGuZJsZs41fvTqKoIKzMrvWy7HK5jWDW8/BcUIOmzCTM
         tA9maombgXAlXEux/WtkJWI/5bF1fRD/13tGFS5ma8u4GqXCwqWi69wYkDS3+9S3Dqqj
         EH6fqFz7XIsQJjoP2m8bAUZ5UvvYXH8sL1h4hoIfTIBmyeycgkU0C1jvbecIlj0n6Vi5
         qHO4gaCl9CfoM1to0FMYmGuW29Wwx1wMuY2q+tFQMc2l8ZVrxfIoqHUe1ckO0caWt/Eu
         08tDTXj1RVhq9hQnsApxceq7dYoSutPnb/F5LGCfbn26vjP4ZCl5V0qwbh4xuNN0I29d
         pGsA==
X-Gm-Message-State: AOAM532iMU9pTWE3eD/g3H4mA4j2xhudrRbXrlOMqBrYcOVpdGyUHI3V
        V0LTLEnBi6HqH68rpPt48Z1jDOxxr0MSbMXIQaQ0+s3aBOaLeA==
X-Google-Smtp-Source: ABdhPJx26GAPXFBHS2aofeh+66Lxha/0T6CHLwbSJsYqqVEbURIr1CPw387RervJQHlD5LVuVcZ/R4dHvif4q1V/7zA=
X-Received: by 2002:a19:6419:: with SMTP id y25mr535616lfb.333.1601458674061;
 Wed, 30 Sep 2020 02:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200930091703.8778-1-brgl@bgdev.pl>
In-Reply-To: <20200930091703.8778-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 30 Sep 2020 11:37:43 +0200
Message-ID: <CACRpkdbMyAavReWG0taSWWGmGa8dJsb7L5sV9YDH7Wqz2tCnWQ@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.10 - part 2
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 30, 2020 at 11:17 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Here is the last batch of updates for v5.10 from my side. The biggest part of
> this PR is the new uAPI by Kent Gibson - it's time to finally get them
> upstream!

Awesome. Pulled into my "devel" branch. I will test this on the build servers
and then submit to linux-next.

> Other than that we have some refactoring of the gpio-mockup module and a code
> shrink for gpio-mpc8xxx.

This is nice stuff too.

> There's one commit here that's in your fixes branch but not in devel - the fix
> of a resource leak in gpio-mockup. This is because the refactoring patches
> depend on it.

OK let's see if I figure it out.

Yours,
Linus Walleij
