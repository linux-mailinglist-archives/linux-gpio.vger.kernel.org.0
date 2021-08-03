Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52B633DE669
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Aug 2021 07:58:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233693AbhHCF6O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 01:58:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233677AbhHCF6M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Aug 2021 01:58:12 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69A0CC061764;
        Mon,  2 Aug 2021 22:58:02 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id a12so13281579qtb.2;
        Mon, 02 Aug 2021 22:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A8r1SOnghP/MBO4ignCwnrhJci8PgXDgxCYfoAoBqoM=;
        b=diBrfg3sOAjAdEgR2fwx5obH5BQMLqcZg+0HoS3Mm+v0wWlsTHJim4DrIaVp+06oco
         yq8pEbh/ioAUlzrWbFtle+fHa9D23Uu1hCDfgRSrZjQ1cjtEz/Q+ITDYifLNb1YWLoMo
         Qktc+tzAtpyX4SIqgjp/anumj2joR8zCF00co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A8r1SOnghP/MBO4ignCwnrhJci8PgXDgxCYfoAoBqoM=;
        b=dZxCciG3kmJcyDjyM1gxuA+/dEFmSggsCpvLSiedKkR/N7kuf1CbAWTYHce+91fBkv
         q2iNuw26G6/wcvsklphzugkGeK2s028pXRQHNp8jWL+wsIj9cq2q9hmliawJVbsp1tn9
         Zf2DvaT9mbkdA9G/CVW8+RrkSmsueYQEJw0XvvGJOrRtrQ+rJSBGULt6QDFOKa+IeQ+M
         kOGcf9/lIm8lJszqpSq3z3ETWb0QW1LF00+uxB2pSoxs2fm5JbNDECQsIE3ztYMbqZW7
         MrdSAt366MW3Nk+hn3al5lSkR9KuQS3NsLJR/mEzQw0sX7XzQArQel8xi05pj7HBgbP+
         u5jg==
X-Gm-Message-State: AOAM533OqqK1fmTNWLad0bpdL/9i74V3eL3vT449/muaQK7sgbHEXzqJ
        4kGMkQU2aWC1pekBoINdifuUS6PnaoDkWUt9JksIWSx8
X-Google-Smtp-Source: ABdhPJxqNKg77SS3jHcROLjxWjGxNdgL8Z+BYVHbG4gOIjY5GnEIA0nxzuTN50vPMyHjoExsVMAkoBiep3qlFYYYuHA=
X-Received: by 2002:ac8:6697:: with SMTP id d23mr16993913qtp.135.1627970281534;
 Mon, 02 Aug 2021 22:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210712100317.23298-1-steven_lee@aspeedtech.com>
 <CAMpxmJXfUterUdaGHOJT5hwcVJ+3cqgSQVdp-6Atuyyo36FxfQ@mail.gmail.com>
 <20210723031615.GA10457@aspeedtech.com> <CAMpxmJU4jN-hpNYPLHLbjx4uZ6vDqcyuMVQXhHg1BWXOqyS22A@mail.gmail.com>
 <58256e8f-6c9a-4ad4-b51e-4048b6feb42a@www.fastmail.com>
In-Reply-To: <58256e8f-6c9a-4ad4-b51e-4048b6feb42a@www.fastmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 3 Aug 2021 05:57:49 +0000
Message-ID: <CACPK8XdfisvSzr3uWYmfd+u1UtM5+cyMBMvcDZJ+jQ38A1BSXg@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] ASPEED sgpio driver enhancement.
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Steven Lee <steven_lee@aspeedtech.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        Hongwei Zhang <Hongweiz@ami.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 3 Aug 2021 at 04:49, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 23 Jul 2021, at 17:00, Bartosz Golaszewski wrote:
> > Joel, Andrew: can I take the GPIO patches through the GPIO tree and
> > you'll take the ARM patches separately into v5.15?
>
> I think that should be okay. I'll poke Joel.

Yes, that's fine. I have merged the first four patches into the aspeed tree.

Cheers,

Joel
