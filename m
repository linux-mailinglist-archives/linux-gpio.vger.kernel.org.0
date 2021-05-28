Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C016393A3B
	for <lists+linux-gpio@lfdr.de>; Fri, 28 May 2021 02:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233938AbhE1A3M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 May 2021 20:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233038AbhE1A3L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 May 2021 20:29:11 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D3E5C061574
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 17:27:38 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id d25-20020a0568300459b02902f886f7dd43so1948823otc.6
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 17:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2pUDinl+k1Y3SOfjLGyhu+yxm4zsyFOY3HXw6T+FBrw=;
        b=XgL6or6dlFJNwuu0qexviUNUTAQymPEn0fwNU1ohf3FeamIRBN+vLD3cB+NN4aLBpG
         gjXkghukW7VKxUaaXdkqcJQtA3ezJ3uXJCNs1586VlsOHjWegPxGqxnWKlK5JYGQl2gg
         k/sTJ0o9WaQ5J2sWpJBf+tC2v0mdxTUZMemrnPKkSTGgMDJ0/YCzXDkf3piWOJ22wLC3
         EeMakRqi1ToJxkFYlFKQh0XPpOFv2IFA9+9t22A6AGoZA8Weoh91OIQ/il98YFEQ9pMH
         jEMq2fUYVGgljcc1m+7IDqAsk/5AHkwSIuvvE3idZFJH+yoswG+D1iMhYuu3Muqcurdd
         EMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2pUDinl+k1Y3SOfjLGyhu+yxm4zsyFOY3HXw6T+FBrw=;
        b=A9AootCn0i2hX8XC/1CRPIiUAF2kVujfWfDNdsIsGiSNwKDbsnvL+VNsKwAbsxobsI
         KBdKhUU5SZsnyMsYI/2quqxTX8PVebnHGp9E3veJzZglHh5UHo/30kDuVKwcFN49Su2M
         VBRr7bPcKi/EPaBdesDsRWjHMbNHQZQ4CA0WMMBA0kzoTTtKwl514fzCwHRmqp7mpRJA
         CV4E2Gtdj4tNazZMSKd7WAw2X3vJQpwgiTuRfzv6dgyQ9t22WNQQFjW/EOE/n9JrpT22
         OyVWhAIetYuVYpdAL8tMcaC3HEDyuLaJEZ9/m7K3KdAI48bqTkr8RxF+GLn43ZLHA+o3
         LOZA==
X-Gm-Message-State: AOAM532BfpT2jZWdLrK9AS2P46HVWzwurYsk7WJt0i2VAhFdg2dNEuY8
        abtShC0ta8ffj1ygLXdE8yb3aY9CWZsZit8FyVxZyw==
X-Google-Smtp-Source: ABdhPJyv0+ibep+sdnHmq0Bg9hVKz6WSmkFPB54kLsk12TTYcd2IW7qv4oh/THflZ8c8Rxwa89TF+/k463nDVrGZhVE=
X-Received: by 2002:a05:6830:a:: with SMTP id c10mr5188305otp.114.1622161657594;
 Thu, 27 May 2021 17:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210517165847.206316-1-sandberg@mailfence.com> <20210517221343.GA2936462@x1>
 <CACRpkdaSESz7UFUKoRwpVFfyE8Vjz=zszh2NyPGf9khiJGQKmg@mail.gmail.com>
In-Reply-To: <CACRpkdaSESz7UFUKoRwpVFfyE8Vjz=zszh2NyPGf9khiJGQKmg@mail.gmail.com>
From:   Drew Fustini <drew@beagleboard.org>
Date:   Thu, 27 May 2021 17:27:26 -0700
Message-ID: <CAPgEAj5Ys4Cwjkh+V93Q=c8fK+19dWuw+QDUohUHZZuEKsEAzA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] gpio: add generic gpio input multiplexer
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mauri Sandberg <sandberg@mailfence.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 27, 2021 at 5:23 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> I can't see the mails in this RFC series but it looks interesting and quite
> useful.
>
> Looking forward to the next posting.
>
> Yours,
> Linus Walleij

That is too bad.  Hopefully Mauri can repost.  Here it is on lore:
https://lore.kernel.org/linux-gpio/20210325122832.119147-1-sandberg@mailfence.com/

I tested it successfully on a BeagleBone Black with a TI CD74HC153E:
https://lore.kernel.org/linux-gpio/20210524212538.GA3756746@x1/

thanks,
drew
