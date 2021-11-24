Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F0CF45C805
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Nov 2021 15:52:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350912AbhKXOzO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Nov 2021 09:55:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357825AbhKXOxM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Nov 2021 09:53:12 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96AF8C07E5F6
        for <linux-gpio@vger.kernel.org>; Wed, 24 Nov 2021 06:42:28 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id x15so11548358edv.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 Nov 2021 06:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dBMiRtL7ooW6xH3nu7TfIIajyoHPfIIF3xHL53JOmPI=;
        b=QdoqLWuCtGPnsdc6cmdbmtVgi+F96Q9dHwzqiYNbVyeSCko1MBUAuM3PZvYkvFp8fG
         eM1dB8Df7YX51+7IC/hYoTRdcZYw1BczQJdjhsfc4P1HmuLwHjQMnfG5KKng6pXbzUS2
         GPHcZHe5FSSAAC/v4YcIKJNqfswKzjFERuixKYROylQHdEH+SV9X5esv1bKy6mXTwLh6
         pWA3giIFGLtr4EIBuH25MzB5SbsTQ3Uw1lnIY3iw+Sfz5906nkQqZi26XeXHlySQ270s
         JslWWOH0PQfoArMSJEIfFedyAMRJnZmQDxyy4u3c6Za/h3p4sOmBxJHXTOLtGJ3wazUz
         r1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dBMiRtL7ooW6xH3nu7TfIIajyoHPfIIF3xHL53JOmPI=;
        b=k9in6n1KocAUV7gv/KlLA2MeNMSxBkSxQBhEMOfNVzFAEhH0Kqi9OPsinMp+Xbj0ZG
         FfW1FmAbzaqGcBTNlprQem9JyU4nIzHjiJ/z7/BRyCk4saC+5BaNqYCE4Uu+FE/49Cdy
         l40BST+MvMYsVgpUJ0bSPTQwuabQkG/nO2WyOnuNm/QW1BRmEZvyASshLmp8QEAy+HXm
         q6PxTUgg4RbBhddrkZNrZ72+A1udzKhi1cO6Nz8aXyISTjz+vtigRExaPGwzMQxEg98g
         QAgKOOce+uzAwoUCidSV4e4yGMrmTALPzte7ayxb73Sp38k9WGXAJW/jaJD2rXBGZ2+9
         rBew==
X-Gm-Message-State: AOAM532xc2qjmFuNVJCNlzjqqUmSXcKWJkLB4632KASOvP87eecfGWKJ
        vClVnhCrKJLr18gL7qh//LYb3R+ERoOzYO/CaIa2Nw==
X-Google-Smtp-Source: ABdhPJw+51+u0lBSwzZ48gKrf+ZsizrDYLAUS0gZg5orDfwg4fZJ5s+dPRyMJOhlCmNfWhNl1Ey8AZlcYq2mMN76kh4=
X-Received: by 2002:a17:907:9847:: with SMTP id jj7mr20460657ejc.508.1637764947181;
 Wed, 24 Nov 2021 06:42:27 -0800 (PST)
MIME-Version: 1.0
References: <20211124122850.7095-1-brgl@bgdev.pl> <YZ5NvolYXei2qsBU@smile.fi.intel.com>
In-Reply-To: <YZ5NvolYXei2qsBU@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 24 Nov 2021 15:42:16 +0100
Message-ID: <CAMRc=McvXozXCWLU6W3W1DmaxRKOREyT_gbp2d3oWw54zPxFNA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpiolib: improve coding style for local variables
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Johan Hovold <johan@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 24, 2021 at 3:35 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Nov 24, 2021 at 01:28:49PM +0100, Bartosz Golaszewski wrote:
> > Drop unneeded whitespaces and put the variables of the same type
> > together for consistency with the rest of the code.
>
> I thought I gave my tag, nevermind, here we are
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>

I removed it because the patch changed. Thanks!

Bart
