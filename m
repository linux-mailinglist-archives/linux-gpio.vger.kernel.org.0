Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89D5DB02AE
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 19:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729624AbfIKR1s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 13:27:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:58250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728897AbfIKR1s (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Sep 2019 13:27:48 -0400
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA8982084F;
        Wed, 11 Sep 2019 17:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568222868;
        bh=avmaTCGrf/lbFN8qYmfH/0IuryDuXNTXcd+Ii7NLHqM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=UqKNTtbh3Cb1I2mku0SqTtgVtOpxoe4iz15c1OPEZUt79sIqqCQ7YylE1IEfb4K1O
         0T3IL+gm8mHrascQNABkSeLI5Vx0o9HOa9tsmMZGctnutgxvcejngJiu0INlkLMl54
         CvhIMgdSF5w5WSDweUcoSZZ/AJy2lUjJiTgpSzCc=
Received: by mail-wr1-f45.google.com with SMTP id y19so25509477wrd.3;
        Wed, 11 Sep 2019 10:27:47 -0700 (PDT)
X-Gm-Message-State: APjAAAUTvQKSBBkvJ0egY/k+QgVJFRnWnktPBWgBOcT8Ln/94ILt7YBd
        8+0WDxcHyxwSmZ4MDy2DIbiFtAz6FiWn0DXqpKU=
X-Google-Smtp-Source: APXvYqyxQlQ0rE1nDNnXUWYV1saPJ4Y2RZ08uvicqCGXL1zEBlOw0R8w4NxllP0UAo/DIWobNk4NNw8nuCp+ukVevHM=
X-Received: by 2002:a5d:500b:: with SMTP id e11mr27169535wrt.285.1568222866298;
 Wed, 11 Sep 2019 10:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <1567662796-25508-1-git-send-email-light.hsieh@mediatek.com>
 <1567663210.1324.3.camel@mtkswgap22> <CACRpkdY7Vpy-fBHSXnjby0kK_tDWBtZaCwjCGxFy4HWeJ1FgEg@mail.gmail.com>
In-Reply-To: <CACRpkdY7Vpy-fBHSXnjby0kK_tDWBtZaCwjCGxFy4HWeJ1FgEg@mail.gmail.com>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Wed, 11 Sep 2019 10:27:34 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzqj_AwXL7r0nxh=9G5o7P4YNJaugCAm_ZpJyBoPZu9BtQ@mail.gmail.com>
Message-ID: <CAGp9Lzqj_AwXL7r0nxh=9G5o7P4YNJaugCAm_ZpJyBoPZu9BtQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] pinctrl: mediatek: Check gpio pin number and use
 binary search in mtk_hw_pin_field_lookup()
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Light Hsieh <light.hsieh@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

That looks OK to me too

Acked-by: Sean Wang <sean.wang@kernel.org>

On Wed, Sep 11, 2019 at 2:29 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Sep 5, 2019 at 7:00 AM Light Hsieh <light.hsieh@mediatek.com> wrote:
>
> > v2 is the same as v1 except that commit message is corrected according
> > to Linus' comment for v1:
> >
> > 1. remove Change-Id lines
> > 2. correct sysfs as debugfs
>
> Looks OK to me, but i need Sean's review on this, Sean?
>
> Yours,
> Linus Walleij
