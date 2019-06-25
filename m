Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FBFC550C5
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 15:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbfFYNwY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 09:52:24 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40107 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbfFYNwY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 09:52:24 -0400
Received: by mail-lf1-f68.google.com with SMTP id a9so12707588lff.7
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 06:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1iPCXBWydY7xCYkvB8WzAfUNgl288BVJPxiE7eymZwc=;
        b=g2V0fCvjO8+3g8khRYtLAnbQ17g4lqT6qVl4M0mCKmKWq+YJk1oLO9Zg92WOT9LoK3
         OJ0TbgMvhLM3u8/sWKSIZnczTTXm3pxHjZ4hcg2+xP0SHdqLuUhWnjCO/nyI7mCxfOZe
         pF55T17XglR3n4eL9/x16BxWXrtrXiwjNXvgCiX343miHdOa3JauxcHH2Pd3VPLIUbju
         dBu/T9IuBycyeZef+ZDn9NmJB//VdJvSTJAMDSW+w5UCFyoprRYxlkFYYs2xjZMCWpWd
         RF5Hj9cmTdbwLsAbZTQBlRpUofp+ZrJLl6R3kfCA1vvdesl9yKlln8Lfu898J7b2oa5c
         iQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1iPCXBWydY7xCYkvB8WzAfUNgl288BVJPxiE7eymZwc=;
        b=faq2XKniU2sTwBeI1tOY1Utp4Ho4v3wPCzZ+TDpXUGSJj/I+b6HoxKOlg/3EDwCPBN
         iCFfWEtLAc9Dbw+y8OhLgXJQ5NXxLl5DARH1IGCCtp6Eym3UP/hcUpoQeqP7shk/djGB
         doOFZnW2OHNLNe9IhQ6CEgTNGh6sp5sATD6rLX8XL5XZS5ziFpEM1oTAF1NqvKo3MK3W
         6ROiLnnQjGXYb2Cm6XBAh4mN1rFq9amjeq6fIRwA/6WrBI7Xtz2YOIxGCX+KCtGvTfUS
         kYTOWPiAgesKZjkZu4GmsnhM3lagC7eye7yrsEhNEAZSiguFv+UpNoY3sTf1ox22TJoc
         1QKA==
X-Gm-Message-State: APjAAAVFSlA4DM8WXSjIKTbqyqaBVePlILI4tcBSzmIZJEXBuw/nGpIf
        cIHXa21so1W1AuM7XZC1zeLYueIwvCHkxzmEiAD9JQ==
X-Google-Smtp-Source: APXvYqys2XmtNKJMpGTxiNNF5eq3ErgW9CVtNHeSeJ6lfHCqj5xUU5+RhbLY8XHHRGOBrv8+Gr2dB9NfGnaPQOSPrJ4=
X-Received: by 2002:a19:6a01:: with SMTP id u1mr14173585lfu.141.1561470742590;
 Tue, 25 Jun 2019 06:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190429035515.73611-1-drinkcat@chromium.org> <20190429035515.73611-3-drinkcat@chromium.org>
 <CAGp9LzqyRQ0knQ8+NanTAC0VVqBudAFPuCQJiyymmabaT1Hyfw@mail.gmail.com>
In-Reply-To: <CAGp9LzqyRQ0knQ8+NanTAC0VVqBudAFPuCQJiyymmabaT1Hyfw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 15:52:10 +0200
Message-ID: <CACRpkdZmNug21=6rz9U8-G5ONPywjCh6_y8-=msY+Y8WvZEm5g@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: mediatek: Update cur_mask in mask/mask ops
To:     Sean Wang <sean.wang@kernel.org>
Cc:     Nicolas Boichat <drinkcat@chromium.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Chuanjia Liu <Chuanjia.Liu@mediatek.com>,
        Evan Green <evgreen@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 21, 2019 at 6:20 AM Sean Wang <sean.wang@kernel.org> wrote:

> The change is worth rewording the commit message you added above as an instance
> and adding Fixes tag as a fixup to mean you're fixing the existing
> problem in the driver.
>
> And then Acked-by: Sean Wang <sean.wang@kernel.org>

I'm waiting for an updated version of this patch.

Yours,
Linus Walleij
