Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF32DAE7AF
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Sep 2019 12:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392189AbfIJKN0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Sep 2019 06:13:26 -0400
Received: from mail-lj1-f182.google.com ([209.85.208.182]:36329 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392140AbfIJKNZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Sep 2019 06:13:25 -0400
Received: by mail-lj1-f182.google.com with SMTP id l20so15835334ljj.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Sep 2019 03:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lKHgomJalitF3xAuJSH7kZXFARPzQ7fixgfscyxk508=;
        b=mJjwYJ3s4R+nztO3QODKofz1vH+S0Fthz44+NwkbkarMoBvhPqpP4aFSJkSTlgNwzZ
         qu4IdYDoVv4AnP5sKO2hBnJS4NuzIm7HOAN2lhcAj+naWsNvt7XV/flEQIZXroIdeRtI
         TOCfBEWuoxFtwTsPF/MtoYEjqY8fmbXTB5IiCk96bCSdZvdF6hG1rVHl5t2YdCteL8H3
         ldsK3Nzb6FCGs9JL6HSGZcOiW1CDCFff7CFXzow/PlLT/gdTUsHK1x8MBlzK3kxu3VNx
         WfocVOmd2ZrXZ9Nb5LuWUdOGBHulTtHKH6NXkERk43jk+0O1wkIDf5Nw3CY698XW4K+C
         xkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lKHgomJalitF3xAuJSH7kZXFARPzQ7fixgfscyxk508=;
        b=NJYx0U7QNADXdO1Wn+9LgDTSUgdYnmjOO2t/zlrwiZKya4ON9Bi424y10ns/Y7dVgT
         kikB13OaZBSdQTXe1TFblUmW/cfy4MrhT5yqZDW8S6fkWC0iYES5V9+Yr5KDn8b7DeDf
         iylRqsniDWPW1rSdkLjmktQJPk2z6milEDBjjqC0eacipvLBBqVtXDkUuFmiYtDRkAng
         iTl4wtjinFwwq6ZrUeUZ2MHNX9Q0tv54kb35sakdgzC6jefPyFDEuyWWZkWhfiJIo/FR
         mQ6mCOR1PUioVC2dIrAzNeZEs0HJi0Po1tZl010xYVqFFx9ywb/5AP0+CCnG52FEl0VX
         GqXg==
X-Gm-Message-State: APjAAAXMPYdecXe5FsNNh99RJS5e3MN/0MK/yZNt0aBn4XTI+0s6z3t8
        Dt0/eJXAf2bTZ0XcHF8frQ+UtxQXhbmQtk4URN31R7EkeeMEFg==
X-Google-Smtp-Source: APXvYqzkUibWHOaDUCSgQdVKHf7BUPrPCoU+CUNscAKWcBCZYnmsldITjrVCZZ1lysh6WzxTCy9rvbWLnbsJpPiCJLE=
X-Received: by 2002:a2e:7d15:: with SMTP id y21mr12099214ljc.28.1568110403734;
 Tue, 10 Sep 2019 03:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190910082903.2727-1-brgl@bgdev.pl>
In-Reply-To: <20190910082903.2727-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Sep 2019 11:13:12 +0100
Message-ID: <CACRpkdb4tu4h3uZz-TWssNXiRLJF8TjTxTG1VHO-sDTkVJR0_g@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v5.4
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 10, 2019 at 9:29 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Hi Linus,
>
> please pull the following (hopefully last) bunch of fixes for this release.

Thanks Bartosz, pulled to my "fixes" branch for v5.3
I will try to get these to Torvalds ASAP, just give the
robots a chance to look at it first.

Yours,
Linus Walleij
