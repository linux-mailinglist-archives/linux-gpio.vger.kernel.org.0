Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5909C22AAF4
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 10:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727900AbgGWIqD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jul 2020 04:46:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:42594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726594AbgGWIqD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Jul 2020 04:46:03 -0400
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 93C7C2080D;
        Thu, 23 Jul 2020 08:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595493962;
        bh=AAiUgOHYkF4OY8C6u9wcRgK0SkjrjcT7mFquV/ZkHu0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=H5hGkMUvREZ+iwFO8+i+SMcFqmmp+BgQjRUFBJrapf03C6UEjOgNXbFryaTNgUscY
         Zbi2nll/Xxe+hY84F8zM0kqcU9jYpAQnK8DhnnwXcAMOvxrR4YOwKcanTCOyMms7Pe
         T2g+n4wkRygjCR7qIpYjy7tHYUBh5Zk+/2Mph7U0=
Received: by mail-lf1-f48.google.com with SMTP id i80so2822963lfi.13;
        Thu, 23 Jul 2020 01:46:02 -0700 (PDT)
X-Gm-Message-State: AOAM532+LdDsZqfhNr0xqOVdtS67SF/wkYJM/Os27lPJTHOEm6QnPfhh
        92kspo5OXq0karlcpVJUPtq+keGGv/IjWosjQdE=
X-Google-Smtp-Source: ABdhPJx/xNBqL8xTZq1HPeSBfk0iFlOL0yeDMtBtfDUNemHPw2W6G2d6snW23uvP0RNxqZmdOY1npu/21VDSfjgonzU=
X-Received: by 2002:ac2:4144:: with SMTP id c4mr1722866lfi.118.1595493960868;
 Thu, 23 Jul 2020 01:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-7-lee.jones@linaro.org> <20200720142714.GA6747@kozik-lap>
 <20200720144955.GD3368211@dell> <20200720145219.GA23990@kozik-lap> <CACRpkdaYQ3PEh838Qoxig4n1iNFp8AOj_Wk9jdvB-qMy0PBRKw@mail.gmail.com>
In-Reply-To: <CACRpkdaYQ3PEh838Qoxig4n1iNFp8AOj_Wk9jdvB-qMy0PBRKw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 23 Jul 2020 10:45:49 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeaQvSnCtUhcDxYRxNM=fxWgsasBccPJEtHUPaek9HQjQ@mail.gmail.com>
Message-ID: <CAJKOXPeaQvSnCtUhcDxYRxNM=fxWgsasBccPJEtHUPaek9HQjQ@mail.gmail.com>
Subject: Re: [PATCH 06/25] pinctrl: samsung: pinctrl-samsung: Demote obvious
 misuse of kerneldoc to standard comment blocks
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Thomas Abraham <thomas.ab@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 23 Jul 2020 at 10:44, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Jul 20, 2020 at 4:52 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On Mon, Jul 20, 2020 at 03:49:55PM +0100, Lee Jones wrote:
>
> > > > Thanks, applied.
> > >
> > > Same as the others.  Already in -next.
> >
> > Thanks for letting me know. I dropped all of them.
>
> It's a bit tricky at times with clean-up topics, I want submaintainers to pick
> it up if possible so sorry about this, it's just too much to coordinate
> sometimes.

No worries. Recently Samsung pinctrl driver is not that active so I
could just provide you only a review. Maybe there is too much hustle
to apply to sub-maintainer tree.

Best regards,
Krzysztof
