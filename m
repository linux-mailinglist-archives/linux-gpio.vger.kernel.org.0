Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B91EA9E86
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2019 11:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731067AbfIEJg1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Sep 2019 05:36:27 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46144 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730839AbfIEJg1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Sep 2019 05:36:27 -0400
Received: by mail-lj1-f193.google.com with SMTP id e17so1673349ljf.13
        for <linux-gpio@vger.kernel.org>; Thu, 05 Sep 2019 02:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WjrZVXpBMn10yxgscmgBI4SdhiVjTxRDrNvgJzshA88=;
        b=LLRGUPdnKhlpg+o5c9W+ASLEZjDachXniT1F7zFrkvSWQSp60pUZGdF0UTcj2Z+bbt
         xOE7Bpj/EFTegkq9X82s8NMzZe/8YMmORYaaXhSHdhSbEFmRlwFeun82EvB8HqTuqXth
         IxfWrC0lU538nPfB7iJdG3hczSG2W1Ly8hNQZskE0YVaP6o1t+Ab4FeScKRz+qyXYCI6
         jeggK9qT3c/C1XhC8h3hlZJ4QQ3Uh9gKehy9QS3uYtF9iNgQSmff48rkIDREnyQghQfU
         1N0jivZJDJYuVMJoUqRQmNxoz2sHV4plpOumEz5Ncqrx/N303TVjeefuDQCeLmoUs9R1
         uqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WjrZVXpBMn10yxgscmgBI4SdhiVjTxRDrNvgJzshA88=;
        b=f1nz7I4wtCEW+dtAmrjky5DW2wTS+BnxJ23MzbRyrXhEWT289biidhdAd5D/AH4KmV
         DcDzvjBZCwAFUct3imEvics+cOQqqnJ8bbK4PNGO3wYXZp3gCObA7lpe0RSGRfy1Fh8b
         moExSxzl4OSeK/7TCWWue+moglwrscGzsVoAeTltk/ufDpB+8uM/hs95jWzHwO0CQ2Ub
         bp65VKWfrSw2Zg4/zK+34Y2PeWmd183WKv0/YKr7Z+DcO2lHY6+JudDlEU2Usl4U8cj1
         kHmZdR6h1QVuRn2WI0g0sVb/t7uK8/hydybJoUIJIQmawD4nCpJBDjUd3lgPdTPuobLd
         cWBA==
X-Gm-Message-State: APjAAAWUZGbdHVVcl03o+ljOFEildRQaLJBLHXD0wygDTao08PpsKXkV
        NFrP1CkUxMLXDQYS57GfvY97RrQKu2G/Hs/RP2V97A==
X-Google-Smtp-Source: APXvYqyxcTqxTe5Mu69BOuS+z06ub3fHMhrvJiSmDKBrpjyWT0LQOgcxig0dg8mMXrgS5SfsPc8F57SZC5w9EOErE0w=
X-Received: by 2002:a2e:9104:: with SMTP id m4mr1406983ljg.28.1567676185467;
 Thu, 05 Sep 2019 02:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190822031817.32888-1-yuehaibing@huawei.com> <CACRpkdapgDbkm3JjywtPv=5gYKQCCXzdabDumVukFv5Dn5pomA@mail.gmail.com>
 <20190904154631.kjegnsk6cf473nr6@flow> <23aeaa05-3a59-5f01-7a67-de1d1d1de547@huawei.com>
In-Reply-To: <23aeaa05-3a59-5f01-7a67-de1d1d1de547@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Sep 2019 11:36:14 +0200
Message-ID: <CACRpkdZcfRnvSGGfpiR=Kb6TDJQjtcQJ4ikhaFC4oB8ZP35+aQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: Move gpiochip_.*lock_as_irq() to the proper ifdef
To:     Yuehaibing <yuehaibing@huawei.com>
Cc:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexandre Courbot <acourbot@nvidia.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I aldready fixed this up in my tree.

On Thu, Sep 5, 2019 at 4:04 AM Yuehaibing <yuehaibing@huawei.com> wrote:

> Interesting, my patch indeed do the correct thing=EF=BC=9A

It is a classic merge collision. Something fun for the subsystem
maintainer to deal with :D

Yours,
Linus Walleij
