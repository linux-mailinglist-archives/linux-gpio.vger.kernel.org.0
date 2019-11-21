Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF861053EB
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 15:05:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbfKUOF3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 09:05:29 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42899 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbfKUOF3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 09:05:29 -0500
Received: by mail-lj1-f194.google.com with SMTP id n5so3336335ljc.9
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 06:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G2/sklMlhAS/DsSbXiPGWFAmZjJdz+mNHg7blLW5E68=;
        b=jlN1i0ROpARoj2MDUsXw7lr+2+/3/iYSJgRCSBSWQ3N/i3iDz7y5mDFndm07kF3WUd
         00XzFXXD3x1KQ9cLeQ9jSPi60LmpD6FfjfAvTLYdjczIVxj4Squks4xcxeZdArgSMTQW
         iVHvOIMhZPlyBoky33W0HiXHRgfCAFelX7epOqmoZF5e2UAOlRpRpaJnHGCA2fYCnpYG
         IibuyofBIyBjTYMt+X7e590EcEF8t6dFoFpv1fUYRsirKw27T/3fG+b3UrDK9ieZW8dg
         AEfMUa/ApPVom3D2JNqfj634N0QL4Y2+sxbeuuIk8ZrI7fd/Kr7F6tFaNRvrTIuR4zik
         YWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G2/sklMlhAS/DsSbXiPGWFAmZjJdz+mNHg7blLW5E68=;
        b=HYj6YPBFQw46al8T6TnLLskvgkbemKes2QXlLQOSLCMTMDnslDB6O3itmWslFayIjn
         6niPDZM80f7N6PCwjw3rGnmkXbSCxO42ikkNa0V9vm6YBw/YUprGh8I0RgK8RXKHW7UI
         D63Xa1csLi83dBUzQ2a1Z9vn3jlKcwxNaDnuAwpN20iQGo87XMZ0h+0B7KLVjMEMQEPD
         /tV52NyjR4uZJ5q5rV7ljFd1WUwgbyuGwK17YmW2gUVa+IZJOcX+RnUTZsneG4sr77rU
         te9prQ+CMkYfKxF7QuIisfK7tj7LRI62RsB4ruMMPAYE1rWoKNXkOHg2rUuDnN5KvMJs
         Xnyg==
X-Gm-Message-State: APjAAAVMjUvQ3TlI2ROq9MoHbmrr0saQEb/W/0R+/bbGjNgQwvnLi1oE
        dvH30buL06OonslmXjfQQPR60dIa6jWdOuTlctxGMg==
X-Google-Smtp-Source: APXvYqyXgFctzHX1AYs7WL6sl/mBFwatoS0326lfAOzcutzI7ZaJAv1xJwemXPUS0Z8lOT4TCyD4BYAmyPPtVD+IG0c=
X-Received: by 2002:a2e:5c46:: with SMTP id q67mr7417021ljb.42.1574345126890;
 Thu, 21 Nov 2019 06:05:26 -0800 (PST)
MIME-Version: 1.0
References: <20191120133739.54332-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20191120133739.54332-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Nov 2019 15:05:15 +0100
Message-ID: <CACRpkda2sGhZFNAZNXaBc0zx+iFPQf3h=QoFz73notLp4UH6aA@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: lewisburg: Update pin list according to v1.1v6
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 20, 2019 at 2:37 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Version 1.1v6 of pin list has some changes in pin names for Intel Lewisburg.
>
> Update the driver accordingly.
>
> Note, it reveals the bug in the driver that misses two pins in GPP_L and
> has rather two extra ones. That's why the ordering of some groups is changed.
>
> Fixes: e480b745386e ("pinctrl: intel: Add Intel Lewisburg GPIO support")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied directly to the pinctrl tree for v5.5.

Yours,
Linus Walleij
