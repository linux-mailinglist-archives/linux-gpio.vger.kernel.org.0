Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD7BFFBB2D
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 22:59:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbfKMV66 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 16:58:58 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33470 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbfKMV66 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 16:58:58 -0500
Received: by mail-lf1-f67.google.com with SMTP id d6so3258657lfc.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2019 13:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T1q7SfihOS8NviFx09KnB1gIXL9J9+o7l0TfyBx4YEg=;
        b=jr9/Wl9Y0GGOjEb+azHnuwN6tBinfS7fCAg1wTMLCYyF0mGMguHr+zyzIr+aDkXOkF
         5c1MjRE4aOnAay22f21KstNbb0+AY+odG7N8zuhY166mtBA4aBBB/wTtxpJb8qYECQmk
         6IPIfJHQV4/OhskjobWjn3en19M5qVeh6EKWiQuyfnykETEqUIqnQZWo9rgAIV9jsQlb
         pjdjNgDLfRRfxD4dVKwC/wmvQ4gknDrFvMHrSciSASVS7coaqpVHUEToF7O09NETGKDr
         kZlOTRoLVzVPStNVFlXSjflf8TPk6u4sRjc1bvYa/ZPeN+dtwsRikxNbhg+/eFfaiEL3
         gUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T1q7SfihOS8NviFx09KnB1gIXL9J9+o7l0TfyBx4YEg=;
        b=jU4H8Z3A9XRyTxqvS6NT9nl7ncnnZQrtljqLLRCpPvs5DZ4b33UwIduQdxgzQdzHUb
         zNtctgQvEaY7PYk+552kJL/0OID0W45NaAhr3KYW+mh4N4KKN94v8O03DkWhq0A8/oXy
         5bT1OA3khrmKYRvaVwMnx+GdnqMFBsaBHePWCmQ+XFH8k3ht154yIi76saI7fVZDF0Pf
         WoQbWKL05JpBrVMQS57Lrf9L3ECo99Gc3nr9yJC+oFjv+OAh2FdgEpcdn5ukQjcRF2Dj
         dr525VxQAdPlueWLWlJmkZX2867cs+3FyeTzbVPtB5ssLkUBWitipW3wZknolNrlwonr
         NseA==
X-Gm-Message-State: APjAAAXYptpjAhW5JVmVAagibEq2Kp4hv3yuwgmXYHl8NWJvVMy0AnUp
        9OZmhbrQZuMMNdOUpmK8DnU60Zjgn/EoCV+pL4j27PGXAXg=
X-Google-Smtp-Source: APXvYqzjMAOZL4aQlAxSkkFWpPlq1+N9TEOOnHP5ULqfGSHJjDIvzPUMvcfzD95Sg8mAB8h7I8MaRJSd3tNKW3hBTgU=
X-Received: by 2002:a19:855:: with SMTP id 82mr4183444lfi.44.1573682335673;
 Wed, 13 Nov 2019 13:58:55 -0800 (PST)
MIME-Version: 1.0
References: <20191113153024.18507-1-brgl@bgdev.pl>
In-Reply-To: <20191113153024.18507-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 13 Nov 2019 22:58:44 +0100
Message-ID: <CACRpkdZPacy5fvpyZRJ8v7O9Nk76HiE_oi6QpZsgzLcVWjQ0Vw@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v5.4-rc8
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 13, 2019 at 4:30 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Hi Linus,
>
> this is probably my last batch of fixes for this release. Please pull.
>
> The following changes since commit 31f4f5b495a62c9a8b15b1c3581acd5efeb9af8c:
>
>   Linux 5.4-rc7 (2019-11-10 16:17:15 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-v5.4-rc8-fixes-for-linus
>
> for you to fetch changes up to 0161a94e2d1c713bd34d72bc0239d87c31747bf7:
>
>   tools: gpio: Correctly add make dependencies for gpio_utils (2019-11-13 13:46:04 +0100)

Thanks Bartosz, pulled in!

Excellent work, as always.

Yours,
Linus Walleij
