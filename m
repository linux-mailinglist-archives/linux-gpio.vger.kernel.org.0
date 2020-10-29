Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 649FF29ED97
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 14:50:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbgJ2Nun (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 09:50:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726184AbgJ2Nun (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Oct 2020 09:50:43 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30810C0613D3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 06:50:42 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id b1so3352393lfp.11
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 06:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DV9j3mWRQQ/e8EPhgXTMg27q5v5Sz0Ec8IDmTMOPcSk=;
        b=nBT2jYDyaYsr1QJXFfUgyQVQnLRaNWWMLs1iffiHEfTtM3zcEiep0L2HAdYrkU6F+j
         6mXHND9ujiBn7uod+NTY+SdWPBAKINNFxMeenHDhT0/TaFaHOVA7MdRtCoh9jmMqcKi4
         QgmGmHuZ8WyfJRK7kYslIS+4sL6uQpAopLlW8EeL2ZBzYEo0DT+MpipAuQkqX7o2oJHL
         BifJUSf7wvxhsX6pWwEHmRhiYWtyiZcCcu5uGr9B9c4PPWvDBo5kAC+WYgXBxYomeqif
         M/mTHPBoi+BYE7rU2HhxXNXGkOhHTzIsVS85oHYgLhxejKbAtN6s/ydQjTKuH6PM4ar7
         F0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DV9j3mWRQQ/e8EPhgXTMg27q5v5Sz0Ec8IDmTMOPcSk=;
        b=W12gSiwegsY9umdIA6QP9NztaAmoG6Fx2G2ftZXbWOHUdbjX6zENbDbL8Va1TwekYJ
         ZYJaefYin8HvKpDIUfZU9DJzQeLMc+guuqLsooVPPzOr/d4a6jhQlioQAj1Cuvw7Nlxu
         xrcppZAAkqWsHN5s/tiOoFtxX3M9gbc2ERrXF+MoldVdOWcwDGmWo18VzoCaXwm2RFLq
         buE59BNQe5bTrD0ZiqNNV5rLRQWBbm5zEvvvQHwg9E10Z0Lpw9QnNv+IwAeupl+0vSgZ
         oeMxpO88AROPqlPcdGtQx+RUaf2MyxFC9EtUBdVIiH5BfcwzagmXc4j3ZZqQa8D0knFV
         P/Iw==
X-Gm-Message-State: AOAM53207UZ7mwvzRd68p8GZ6iTL8M1sd02BpZbXYklb5Tn2PdAFiXoD
        m52Zsb8fh2Loj2BuEQMfzlIQgb3LflITd/GV+2tD+w==
X-Google-Smtp-Source: ABdhPJzb8986butDF14EyA3khOvIicXRON/UZzUyVEgsBpxzESAjZV/ZkrGQcrDULPaiptTzdCCMmdvkp14g2Lk+HrY=
X-Received: by 2002:ac2:50c1:: with SMTP id h1mr1544294lfm.333.1603979440574;
 Thu, 29 Oct 2020 06:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75Veqdv8JnASmmsnv9AmrktByWH3R7Z36wLMyjJh0VffExw@mail.gmail.com>
 <CACRpkdaAryt0PdbMQ-LMjJ=LNvmNVSHrjHfPn15uJo7WALpNEQ@mail.gmail.com> <CAHp75VfdRfROFwa+wsL6rW7v5=E+qYrE+rwy7zBP2YkZsgjdgQ@mail.gmail.com>
In-Reply-To: <CAHp75VfdRfROFwa+wsL6rW7v5=E+qYrE+rwy7zBP2YkZsgjdgQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 29 Oct 2020 14:50:29 +0100
Message-ID: <CACRpkdYjHERoO-rzoXa77VCjDrF0N+3q+q_MXOstMEkk3Y2CnA@mail.gmail.com>
Subject: Re: Is consumer documentation correct?
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Alexandre Courbot <gnurou@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 28, 2020 at 9:29 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> The section titled "Interacting With the Legacy GPIO Subsystem"
> describes as far as I got it the interaction of gpio_to_desc() and
> desc_to_gpio() with new / legacy APIs along with their scope. But is
> that description correct after the above mentioned commit, i.e.
> 14e85c0e69d5 ("gpio: remove gpio_descs global array") when we lose the
> always-present data structure (if I'm not mistaken)?

Yes I think it needs to be updated...

Yours,
Linus Walleij
