Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADFA629D53A
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Oct 2020 22:59:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729316AbgJ1V73 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 17:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729310AbgJ1V72 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 17:59:28 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90725C0613CF
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 14:59:28 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id n15so689782wrq.2
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 14:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9BkbuooCI0n768ThkitRHsqLUEbJ24gP+vaNxySeBwg=;
        b=TwZ57T8uWrT4ee/xv/UgV3k0J2vKc/wFx+wAMvRH+1BeKLWw9B+aAvD6EoOb2d09M3
         HLpfUTNR0cl8bGSQqazyzH+h7wm/zmxdppXHPBlWoUyE++5DRLXId4KfPkc2edeAiGnw
         tE5ZN1XAk8u8luHR/85HHYLPttm5czRmV1mLTNr8V9LZIXo4QACn+wAzfNEX8RVeZ6MM
         9wosN8Gp1xgvn0k3XSP271BTNPZ0Q22yYhPoes8+L2RGZh/qPQWqN+tg8UPEGJPoCfQG
         hctS2jJjaaOo5TsSOl7RO99cfz+aBBxX911cwhmNon48DatwDTkBFqAvB1BrCTprdMlN
         jRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9BkbuooCI0n768ThkitRHsqLUEbJ24gP+vaNxySeBwg=;
        b=jY5dhf0f33+fdBr1w0NSKJ0xog1UQjc/m6QRXpyHyMEk6GZKwSzMEchD9tukkLm76K
         pwdbGQfzOSj7vXbMoNThAnaiP42Cd7vmOJy60cGYnN/xabNMk2VoC5v3pTvfobFYhs1c
         +EwtAHsWyuscUejKLd89WMpqq3h0bKSEC1V3cbA6OaDtYK/I1Sftmu6EDVaPrJnyX9Y3
         npuae0/Lp6K8/lhIOMJ8asksVq75xXAsM5fCeDFzS7uYlGxUg23ONQz1RDHQsmGfJvS6
         xp6ZGt/U0Hhmw/eSxVCp/DIqBfuW9KA7LyVEYB7mAO8vFmkiWksv4yOSQDlQWsL0YYeJ
         Vaiw==
X-Gm-Message-State: AOAM530L8S89BecvlNNHD9YlR6L5rpjUvgs3iEdiKpZMeeq0ioMmH1Ta
        SVhK/a+zchWNUtjFCjjJooh/P4SFpN9F5iMnrDy/6S/nrnO8dw==
X-Google-Smtp-Source: ABdhPJz+I7dct3hsj2r3Rcpd2lCTcuG+4DjTAN0aWpDxsVhUB5wrskoZwb4MAaRrE7QQ17++h/GygH0kCBzUOuFkYcE=
X-Received: by 2002:ac2:50c1:: with SMTP id h1mr2824880lfm.333.1603900571005;
 Wed, 28 Oct 2020 08:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <20201013063731.3618-1-jay.xu@rock-chips.com> <34840448.7XeAIBGaoL@diego>
 <CACRpkdY8kRVJptQxCQNzbumjj-H+t-atJdguF39stukmiTfYyA@mail.gmail.com>
In-Reply-To: <CACRpkdY8kRVJptQxCQNzbumjj-H+t-atJdguF39stukmiTfYyA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 28 Oct 2020 16:56:00 +0100
Message-ID: <CACRpkdZuptedcF5c7fDY8VQBx5ubr9ROrbuRiCtj9eim0AKVMg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] rockchip-pinctrl fixes
To:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc:     Jianqun Xu <jay.xu@rock-chips.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 28, 2020 at 4:55 PM Linus Walleij <linus.walleij@linaro.org> wr=
ote:
> On Tue, Oct 13, 2020 at 10:22 AM Heiko St=C3=BCbner <heiko@sntech.de> wro=
te:
>
> > > Jianqun Xu (3):
> > >   pinctrl: rockchip: make driver be tristate module
> > >   pinctrl: rockchip: enable gpio pclk for rockchip_gpio_to_irq
> > >   pinctrl: rockchip: create irq mapping in gpio_to_irq
> >
> > looks good to go as fixes.
>
> I record that as Acked-by :)

Aha they are already reviewed-by in the patches. OK then,
sorry for the confusion.

Yours,
Linus Walleij
