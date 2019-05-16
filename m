Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 063D520735
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2019 14:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727227AbfEPMrp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 May 2019 08:47:45 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:37982 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726995AbfEPMro (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 May 2019 08:47:44 -0400
Received: by mail-qk1-f194.google.com with SMTP id a64so2136406qkg.5
        for <linux-gpio@vger.kernel.org>; Thu, 16 May 2019 05:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W184LUt3OLZpc35GbIgyfbdRWYWzS470rOoUrNJBmxU=;
        b=TRma6EWmVqtTh6oyWeOyXuXYl+5HLkiD+FLBf6YYv1n3LTrxOJcXtDjC9qMNgWV3IM
         9/L3ct4DLiJQOWk/6Vr+Zcmy4GqUrvJkXz80l5T6lMeDYVdK+B2rz9KW/QoYjrG5fcXu
         dYY57kMN4S4l7szDwWKXb9Qsvi5JOUOtVT/i4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W184LUt3OLZpc35GbIgyfbdRWYWzS470rOoUrNJBmxU=;
        b=jlX8Gew0hjfvToLXRx91GL3Y7Qn39aAYsngUEd5ZE+oBtCRGe20GGQ+L8T1b2xZQfk
         AxZNggiP/D7tjstPiEcx9FTf0eQrVVq6Dg1oKTi5iBlW3aLi7o4ezmM+P1Ro6b65HKxj
         CWs0ZZ54zwkyQ1s2K6if4Hufh08hreIfFiK7FQxqiSklPrs6aPl8qqR/hOpSq4rV9jZa
         wjMuVwuSOtlqrdHawwH2kWjRTxuRrUHJr/KJQViCL55LVVn4Yudu32sJORAPR/xyH+cX
         YmumNVcx0+ohFUh9Et2M38dbK9T/ZT0QC1R+cXtKx57ry9+VwuoLI/8GNMJXE3Nnrzzn
         xs/A==
X-Gm-Message-State: APjAAAWo5Zjb9UzDS+fAJyIzfcSnyIiCvlSAi3gaWOmD0kTFyjiepHii
        V7H8x8UDtYjdFkd7vAxILjSAP3j5uioWrm8l3uVvTw==
X-Google-Smtp-Source: APXvYqybed54iK4vV+PN2Aj3PjQ2Py6dcAunCb38T+fR74fZCjJqmxhGgna5I/pOr2f8Y6E05PAXezd/gE5bKfmgw6I=
X-Received: by 2002:ae9:f818:: with SMTP id x24mr37963214qkh.329.1558010863680;
 Thu, 16 May 2019 05:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190508073331.27475-1-drinkcat@chromium.org> <CACRpkdZb73vNyepcfjzEGAopc7BBxde_N1wxn7PSJ3aGC0=Gig@mail.gmail.com>
In-Reply-To: <CACRpkdZb73vNyepcfjzEGAopc7BBxde_N1wxn7PSJ3aGC0=Gig@mail.gmail.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Thu, 16 May 2019 20:47:32 +0800
Message-ID: <CANMq1KAOeuDCZEvV2A18nUts3WP2MbhUpY7gQ+vk0oTOz8TRQA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: mediatek: mt8183: Add support for wake sources
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chuanjia Liu <Chuanjia.Liu@mediatek.com>,
        Evan Green <evgreen@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 16, 2019 at 7:55 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, May 8, 2019 at 9:33 AM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> > This adds support for wake sources in pinctrl-mtk-common-v2, and
> > pinctrl-mt8183. Without this patch, all interrupts that are left
> > enabled on suspend act as wake sources (and wake sources without
> > interrupt enabled do not).
> >
> > Changes since v1:
> >  - Move changes from mtk-common-v2 to mtk-pinctrl-paris, as
> >    recommended by Sean, to keep better separation between eint
> >    and pinctrl-common features.
> >
> > Nicolas Boichat (2):
> >   pinctrl: mediatek: Add pm_ops to pinctrl-paris
> >   pinctrl: mediatek: mt8183: Add mtk_pinctrl_paris_pm_ops
>
> All seems to look fair to me, but I need some official ACK from
> Sean on these.
>
> I see there is some discussion on a related patch set which
> also has two patches so I am a but confused how mature the
> two patch sets are? Are they at all related?

They are somewhat related, but I don't think this depends on the other series.

This series adds support for wake on mt8183, and makes it similar to,
say, mt8173.

The other patch series fixes issues that affect all mtk pinctrl
variants (i.e. I think mt8173 pinctrl on current mainline has similar
issues). It's not impossible that the answer to the other series is
that we need to refactor code, but in that case, if we merge this
first, we'd just have to clean up one more pinctrl variant.

Thanks,

> Yours,
> Linus Walleij
