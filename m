Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F17184D3FC4
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Mar 2022 04:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231797AbiCJDiS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Mar 2022 22:38:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239303AbiCJDiS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Mar 2022 22:38:18 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35A6195A04
        for <linux-gpio@vger.kernel.org>; Wed,  9 Mar 2022 19:37:18 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-2dc348dab52so44650027b3.6
        for <linux-gpio@vger.kernel.org>; Wed, 09 Mar 2022 19:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8yQTKhKZiy0dUPmGqJVBdGvAVphmdM4bBbUG0dfDJxA=;
        b=l8ZoaPWHxwzbVpBhjmxinUTGj1j+Ig58rGZSi3+BJqEfohJetEebkCtGVXGmOi88as
         RgOeKfLY2ZX5wH72NwrACWu7i3CfsGj5AHezzZzN6Xn3IYWVfFZwtjSwCFCfnCmZCqBg
         2URYSWoyX1aaT67mpJbQp4uHKr91W+6dsxTzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8yQTKhKZiy0dUPmGqJVBdGvAVphmdM4bBbUG0dfDJxA=;
        b=nJ4rOBq8UViojWn3PNNYTYc/SiqL3D0PzY3NrKshplc74pHjxBVrTkV4SEtjvcF0au
         8fIJDjFWu+gGtmTb1VjgzG0026lg7O/2PCg+AqB7uOnNbmc8Ci4G2YwMfFZlhVOXfrtS
         kwW2mJ8n0ss3GvcRctYuNPLzsjwsTfGfvzxXky6RRr09qIq+FsgFUzkYRzQy1y2SX+h8
         Z1UN1azBPO8PrSpSI7kqgtfgMS9LdUox9nCYyaG7i3gHW0s29doroBpWRJuAmlwxJRAD
         Mmwadeeq1Avz6V66O0W9Y9mO1WriRWIgo6Km3OQSjq+tdi/g1GWJSiz71NK/tCYREgNi
         XOKw==
X-Gm-Message-State: AOAM531qvL1YabLLzi3XQPajl3XLZjKo5gjdMhQfxIUS+gyTY8CYLx26
        2IVA2I3KWoAsPsKf7M/jNbAcGU/wF07Whhq4g8IZRw==
X-Google-Smtp-Source: ABdhPJzD4At+0kNDeSdaPownG05HBBbm9XR+dPHBAUs2dzK5t7RTrvr+pZUyJbh1iI5EfuV1fzcc2FvG6pci0IJKTDk=
X-Received: by 2002:a81:5791:0:b0:2dc:4a64:56f4 with SMTP id
 l139-20020a815791000000b002dc4a6456f4mr2475820ywb.286.1646883437469; Wed, 09
 Mar 2022 19:37:17 -0800 (PST)
MIME-Version: 1.0
References: <20220308100956.2750295-1-wenst@chromium.org> <20220308100956.2750295-6-wenst@chromium.org>
 <400cf2fc8cbc3887a90f50709f40adc0662ec0f4.camel@perches.com>
In-Reply-To: <400cf2fc8cbc3887a90f50709f40adc0662ec0f4.camel@perches.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 10 Mar 2022 11:37:06 +0800
Message-ID: <CAGXv+5F7pQt28m7wjS22io-MF=ms-HAWOSGC2iMz8cX=zhd1wg@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] pinctrl: mediatek: paris: Drop extra newline in mtk_pctrl_show_one_pin()
To:     Joe Perches <joe@perches.com>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 10, 2022 at 4:01 AM Joe Perches <joe@perches.com> wrote:
>
> On Tue, 2022-03-08 at 18:09 +0800, Chen-Yu Tsai wrote:
> > The caller of mtk_pctrl_show_one_pin() is responsible for printing the
> > full line. mtk_pctrl_show_one_pin(), called through mtk_pctrl_dbg_show(),
> > should only produce a string containing the extra information the driver
> > wants included.
>
> Does this function have another caller?
>
> It looks as if this function doesn't need to be EXPORT_SYMBOL_GPL
> and could just be declared static in the file instead.

Judging from the commit history, I suspect there might have been plans
for using this in another module?

I can do a patch to make it static until that ever happens.

> btw: using %1d is mostly senseless as a control, but has some
>      documentary use as a value < 0 or >= 10 will be always be
>      fully emitted anyway.

Ack. But we could just leave it be.


Regards
ChenYu

> > diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> []
> > @@ -634,14 +634,10 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
> >                       pullen,
> >                       pullup);
> >
> > -     if (r1 != -1) {
> > -             len += scnprintf(buf + len, buf_len - len, " (%1d %1d)\n",
> > -                     r1, r0);
> > -     } else if (rsel != -1) {
> > -             len += scnprintf(buf + len, buf_len - len, " (%1d)\n", rsel);
> > -     } else {
> > -             len += scnprintf(buf + len, buf_len - len, "\n");
> > -     }
> > +     if (r1 != -1)
> > +             len += scnprintf(buf + len, buf_len - len, " (%1d %1d)", r1, r0);
> > +     else if (rsel != -1)
> > +             len += scnprintf(buf + len, buf_len - len, " (%1d)", rsel);
> >
> >       return len;
> >  }
>
>
