Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D0D51CBAD2
	for <lists+linux-gpio@lfdr.de>; Sat,  9 May 2020 00:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727787AbgEHWh5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 May 2020 18:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727774AbgEHWh4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 May 2020 18:37:56 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B4AC05BD43
        for <linux-gpio@vger.kernel.org>; Fri,  8 May 2020 15:37:56 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id a21so3320767ljb.9
        for <linux-gpio@vger.kernel.org>; Fri, 08 May 2020 15:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZlYo6LZ2gpdvKx2XP7UDcJkPEoiNb0owpdOZ1yEc1Mg=;
        b=r0n6p4DB0bWrlcjLZw0RSl3bAyAzRXd/zLX7d0rs4qadWsSsdFsQvAc4wycpHhd4YO
         FoU7YYDi7P9iavRROvBNdXjoQETN/jOU5/4xC7jHu7q8Rq6xO7Id4EC9dgbQQL9zIXAv
         QtmeP0BMlwAsv/+b0XCeI/Py0x92giTi6Bzze1lbvf000MouECQTn+GTuwTvlI2Zaumo
         3Lf6rIzPjl3fLqraHDnXDvORWf+tDz9ui6KwDApwETx0LhjqExvI5vuGNMxMFjOqdiEK
         E0s+GhMGHozYDM1qmoXckawjGNjkcAIxzNSaCxpMy5dlaxWIWfGFGrokciZfx7aEWUf7
         KbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZlYo6LZ2gpdvKx2XP7UDcJkPEoiNb0owpdOZ1yEc1Mg=;
        b=bUW/KmlJ4bNcF47k9sG1o4eOLC26YPyY2qb+mkLdFYG4YFO5ELoBzKHTtTBENF+Z9g
         z4dSutjMmTwIc8HU8se1fG6M/lRJ0skpocjYsYw/rTrMsrhQJcthEfTpI/TNxvgeUbZR
         TmBBhUagK55gN8j8pLzVgti2xVNbs7XMUStetZOBYa9sDr/ZXvbDN/nATZodqCDMPwMc
         Eb0GlQWDeccYp/pjysHAnfG0C9w7VTWzIgQjMsiiCZ+5R95izHpncTtSCzEGnv+JVglB
         8ZmzAUnB8s9cF2x5p/gb8x/rohq6LQG/ogauvSx3RYidNka0vYs34f5913osHCZfkJD9
         /MHQ==
X-Gm-Message-State: AOAM53251Fnd04BVePv6f66QmrMubPeuXYN4Mf8/7ZPCNlyQAbXz+U74
        6ruulHGHPyuMGXBx5sKx1ZhS1bMu+E2I4lnIcrm8NA==
X-Google-Smtp-Source: ABdhPJwDt7XzSPqwCMNilNpy09YDkKREai65X3sDGcBHM2TEacPehqO+GwHDIh/0lGk9YRvw8iDzZDUlUbMHBuvKTjA=
X-Received: by 2002:a05:651c:1058:: with SMTP id x24mr3239576ljm.39.1588977474765;
 Fri, 08 May 2020 15:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200430084909.1599-1-geert+renesas@glider.be>
In-Reply-To: <20200430084909.1599-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 9 May 2020 00:37:43 +0200
Message-ID: <CACRpkdaz12TVFhggYMWGDeiSD+AJHRjsLE5WGOZCpcWK_-FqWg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: sh-pfc: Updates for v5.8
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 30, 2020 at 10:49 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:
>
>   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.8-tag1
>
> for you to fetch changes up to 41fe32ecc7aff4527a4ee477870d9b1164be95a4:
>
>   MAINTAINERS: Add DT Bindings for Renesas Pin Function Controllers (2020-04-20 13:14:05 +0200)

Pulled in to my devel branch, thanks!

Yours,
Linus Walleij
