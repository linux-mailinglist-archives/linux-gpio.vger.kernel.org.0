Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1833D3753EB
	for <lists+linux-gpio@lfdr.de>; Thu,  6 May 2021 14:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231628AbhEFMgw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 May 2021 08:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbhEFMgw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 May 2021 08:36:52 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 252FEC061574
        for <linux-gpio@vger.kernel.org>; Thu,  6 May 2021 05:35:54 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id x20so7561261lfu.6
        for <linux-gpio@vger.kernel.org>; Thu, 06 May 2021 05:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2/ZmLbtrYVGn+DSAZJpx6aR2WIjOEoDo2T5mjjYPzTs=;
        b=mRjXV2LTKDkUHdBoHDPBOo0SIk1NqnE8T4eNXjd80NFYKUcSi8w0+5CGLa/ewy/HLR
         B5UceZ7jPLNnMte5P/bakSnDGw0AAdTWxnKMu7OGINKHfIa88jaBIZmt1Ygumu/9Az4r
         wSYsXMXFQSSe+x5TwljS6YpUtRjxh5awk91LAO/1tsUzo361MplCr6r/w7StDzgqGgjF
         0DlmHHXMZZ02dwN1xc+CY/E+8hkqPRzVmhKTABKyJ3BZQczo63rywBFs9MiR/4H5f7H1
         t1W+I7RQ5NO3Fq9SUUO4TsYagecqD4eIlOrokYSkdqG7Pot27GsDX5ebGnsGjIHY2r4B
         D6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2/ZmLbtrYVGn+DSAZJpx6aR2WIjOEoDo2T5mjjYPzTs=;
        b=grwoq3ZR1pLR48tMrml5yd67kV3GTIHjvXooVCqbN6uLolYoJNIHsTL7RWXa9qpAuN
         VrvpCQD5xGc6HMqGDSwRcKHh8HJrehxSMNaaEhSonba8KRPw4Yg5IgT8ZJx1MFUjdmyD
         8cO7JTWRgXfWvpxYtzYjXlLEGjzAsHKzdk5S/88AunpyDgiWEU5KmaInZ6lS2eoUUS64
         gpFxhssMpxCVUQk1YKXxTzFFX8XXFHSE0WGmKd9zTNcCS5oa+FUBMNGHhXq+wuvhK3vO
         7HpwTP5AN3zAjc9JmqDUlkt7npPSCg1kmdr7v/fMkS7xWO2Vrd+ZIgm5HGw6533yZqNo
         z4yQ==
X-Gm-Message-State: AOAM531ISalFT7NQMnl2hp39x7kaUbrQy0AHLnZbRnAKvRo+Y4AVbati
        pwiNkSn2nk1z9KJ9pb3YTEhUvPAzDIwMI0/YVh7LkA==
X-Google-Smtp-Source: ABdhPJwjEiT3esgblNl5oL8PYhIDR+bfD6j0Y8+/+akNo7N2Tsc8Fq2BFSNap3ZLzp3tCQ/FCTsiBkzaFSI05AQ33EU=
X-Received: by 2002:ac2:5e36:: with SMTP id o22mr2807016lfg.529.1620304552671;
 Thu, 06 May 2021 05:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210503210526.43455-1-u.kleine-koenig@pengutronix.de>
 <20210504025546.GA13356@sol> <20210504091459.clb5nkwgrgg43ixq@pengutronix.de>
 <20210504102454.GA21266@sol> <20210504105653.bfhtqd7ildoipcqu@pengutronix.de>
In-Reply-To: <20210504105653.bfhtqd7ildoipcqu@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 6 May 2021 14:35:41 +0200
Message-ID: <CACRpkdZvZKR5g-=YRHWEgtEJyzd9NUoMsV-VH6dvPxACTXNGJQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: introduce hog properties with less ambiguity
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Kent Gibson <warthog618@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 4, 2021 at 12:56 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
but not active
> > know if there is a good reason not to go with active/inactive.
>
> Linus: So we're already 3 out of 3 who would like active/inactive better
> than asserted/deasserted. I'm curious about your preference, too.

I suppose it depends on where you come from. In electronics
the terms asserted/deasserted is commonly used and
that is where I'm coming from. Maybe just the materials
I've been subjected to, who knows.

Yours,
Linus Walleij
