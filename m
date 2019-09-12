Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21E0CB0A2C
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 10:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbfILIYJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 04:24:09 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33120 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbfILIYJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Sep 2019 04:24:09 -0400
Received: by mail-lj1-f194.google.com with SMTP id a22so22760971ljd.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Sep 2019 01:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w49o6bLlxe70T8dk8RcKOKQ6ege87Mzu24iLNFJSi6U=;
        b=r+RtCQ+QSzYgod49oCaqYCkPTh5kZ0t0Sd0c4Z0+s2eYFento9RBH+cJ6oV9udoLxV
         UAOH78eysBB4GLzpWHG+n3DdyMpTG7bjHG3OJeNy+YTbh7rBITWWJ8UHrdYbqbOvjhKU
         wBTdN/oCGKDqPSMGUinbCLXh34ir+lHen6smdbyfGfv6TgiY+CpSyJIftKzl59psWfws
         otcFJcFnELrgNmLbcSAaY3WNMrDE3O2jMbPXOMUIuJikgcaKm6OPJYCvJZrtz4War3NN
         ajFA0ei1LXIJFhOzIOd53cSYdpBzThBf/siT6WVcfCVmFGAVjjLSKvEWboTgzARw8sLQ
         cIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w49o6bLlxe70T8dk8RcKOKQ6ege87Mzu24iLNFJSi6U=;
        b=EzK+LAeh9qP2BQJOJUfDK174Z062vrq8kUP9SzQlZml+pHfHP96J4mUFqZ7d3+Q6Eg
         WOWjUJomE7cWTFYEvY0VbL3H5LAziUmASxu3+EsPJwx1ziExkG6RwSCqqmjrrwHapoKl
         zZ8Q1XYs2q+xjRxLrC7LCLSFbAkTwHzK5pbPGnYMT6fVJ/DWTVBH8xU0L9mhx2pyHHjD
         aCqkpQy6r1Hpggx+utsp/WcWLflnRPz2SBFWVHZrWS/Kc9KHavpWVhltmAywxM2jEt3c
         rLLAAiSWgSzZ3sGVecbOm55VRZkZE64jaMfv8Tyd9D0D8BYiIp/8D/RPRpRz5DTZwlqM
         3KVg==
X-Gm-Message-State: APjAAAWkHymvFkavM5OSDf6o3dNfrG6NhUHbg/uoZiTC8DFugqK/ushV
        uNXdTk77SAE0bztAoCgIjlFYB+lNjJfFKRa2Ef30gA==
X-Google-Smtp-Source: APXvYqxJDL4FyhE3BXAv2E4B/4JEGQGPdbnrnZxx+n3oo9L0E7CyQ/g/GKuusfARHUSvwKnun6uC2HwM7AK4drFXwyc=
X-Received: by 2002:a05:651c:1108:: with SMTP id d8mr17993431ljo.180.1568276647071;
 Thu, 12 Sep 2019 01:24:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190829071738.2523-1-andrew@aj.id.au>
In-Reply-To: <20190829071738.2523-1-andrew@aj.id.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Sep 2019 09:23:55 +0100
Message-ID: <CACRpkdYW_PX7npB+b1YJ4pfFQNLVOsMx2hpKtntBeHg=C1j-Cg@mail.gmail.com>
Subject: Re: [PATCH pinctrl/fixes] pinctrl: aspeed: Fix spurious mux failures
 on the AST2500
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        John Wang <wangzqbj@inspur.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 29, 2019 at 8:17 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> Commit 674fa8daa8c9 ("pinctrl: aspeed-g5: Delay acquisition of regmaps")
> was determined to be a partial fix to the problem of acquiring the LPC
> Host Controller and GFX regmaps: The AST2500 pin controller may need to
> fetch syscon regmaps during expression evaluation as well as when
> setting mux state. For example, this case is hit by attempting to export
> pins exposing the LPC Host Controller as GPIOs.
>
> An optional eval() hook is added to the Aspeed pinmux operation struct
> and called from aspeed_sig_expr_eval() if the pointer is set by the
> SoC-specific driver. This enables the AST2500 to perform the custom
> action of acquiring its regmap dependencies as required.
>
> John Wang tested the fix on an Inspur FP5280G2 machine (AST2500-based)
> where the issue was found, and I've booted the fix on Witherspoon
> (AST2500) and Palmetto (AST2400) machines, and poked at relevant pins
> under QEMU by forcing mux configurations via devmem before exporting
> GPIOs to exercise the driver.
>
> Fixes: 7d29ed88acbb ("pinctrl: aspeed: Read and write bits in LPC and GFX controllers")
> Fixes: 674fa8daa8c9 ("pinctrl: aspeed-g5: Delay acquisition of regmaps")
> Reported-by: John Wang <wangzqbj@inspur.com>
> Tested-by: John Wang <wangzqbj@inspur.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Applied for fixes already yesterday!

Yours,
Linus Walleij
