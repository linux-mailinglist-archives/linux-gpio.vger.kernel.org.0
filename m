Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60B6224C70
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2019 12:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbfEUKNb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 May 2019 06:13:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:43986 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726138AbfEUKNb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 May 2019 06:13:31 -0400
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A6400217D9;
        Tue, 21 May 2019 10:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558433610;
        bh=OufmRIYJQ0nbYLIvqyUNnOhI9i9mkYrk0LMrip+KEiI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ryfrH3Wpwo2adEt4OeWEHICRHYnhpBhlyK66YfjCP0puw45cAuqNoYm8thn9W3mkd
         kWQ4RlSa8sMKzjuBwR/QImifJYSWp8Q0Slhnu6jVxxtfSmQWup7R5D05uId9XdsFuM
         AxlIZzHLF+n+PEvOThSGF8l08U2XN+RCqv/PXWJk=
Received: by mail-wr1-f45.google.com with SMTP id w8so17920365wrl.6;
        Tue, 21 May 2019 03:13:30 -0700 (PDT)
X-Gm-Message-State: APjAAAVWgMuhgwjbXfo2jBiwytazeYtcIxzPSXYgNJRXkt5BDom62/gF
        ZaiB8udKmjOegIEqVEzwJSqi5D7iPF0sPGdYja8=
X-Google-Smtp-Source: APXvYqzmTjjOL9v8MqfbpV2G5sAp6vg4KFpwg98Fgc4v9EVuXBUC7juwUBRFOmLuLrdEoaon7lkrW6QqVeiKkYCEMQ4=
X-Received: by 2002:adf:ee0c:: with SMTP id y12mr24087711wrn.34.1558433609178;
 Tue, 21 May 2019 03:13:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190508073331.27475-1-drinkcat@chromium.org> <CACRpkdZb73vNyepcfjzEGAopc7BBxde_N1wxn7PSJ3aGC0=Gig@mail.gmail.com>
In-Reply-To: <CACRpkdZb73vNyepcfjzEGAopc7BBxde_N1wxn7PSJ3aGC0=Gig@mail.gmail.com>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Tue, 21 May 2019 03:13:17 -0700
X-Gmail-Original-Message-ID: <CAGp9LzriFJTf_pqUDx3Tmp2dbJBy7Rv1y73Tq+Rw5WeXPT94aA@mail.gmail.com>
Message-ID: <CAGp9LzriFJTf_pqUDx3Tmp2dbJBy7Rv1y73Tq+Rw5WeXPT94aA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: mediatek: mt8183: Add support for wake sources
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Nicolas Boichat <drinkcat@chromium.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
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

On Thu, May 16, 2019 at 4:56 AM Linus Walleij <linus.walleij@linaro.org> wrote:
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

sure, it looks good to me and thanks for Nicolas' help

Acked-by: Sean Wang <sean.wang@kernel.org>

> I see there is some discussion on a related patch set which
> also has two patches so I am a but confused how mature the
> two patch sets are? Are they at all related?
>
> Yours,
> Linus Walleij
