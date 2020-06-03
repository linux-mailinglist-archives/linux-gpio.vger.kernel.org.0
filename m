Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DAF41ED869
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2020 00:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgFCWJD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jun 2020 18:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgFCWJC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jun 2020 18:09:02 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73103C08C5C0
        for <linux-gpio@vger.kernel.org>; Wed,  3 Jun 2020 15:09:02 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id z206so2323627lfc.6
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jun 2020 15:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cGmwYW9BzpYkE3b5BXMa4x8r+iWYDMrACAFEn5/TXJs=;
        b=HKtt7Ce2T/uv0uuk+ikmeaezZFR7KV+O78D0r/pRwJ/pvjEvYLfSpoVYCPmGMlXgAH
         vklJDoXat2X4tk+UWGiPrV1fAJzjDYjto173ALf43iPuLmlA7XTETrfM1n42QfDFYA6G
         lybqZRxRsnxahb0rFMHSsWDGaHfUwLYJcRCM3DQs1xpf/3lnHy6DC75yQNYuwQT7hyC7
         aI3VznFrKb81GMJMV34Mg5laOi3kTzCSe4MyP4nCHPbGBrMF/l/O5CUyDc96d9qfMTyw
         /u1HgOiHC0+TbH7IDV7ts5kgOQS0aTGs9WtayvOuKAcQsbrJtu+D4ZrcZ7BbOqgXazYA
         Sdzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cGmwYW9BzpYkE3b5BXMa4x8r+iWYDMrACAFEn5/TXJs=;
        b=lKtTh8IQS+2VdUzStAeRu+Cd4loaw2P5wqmTZrjb3BCotuiitvm0+hYscf34zFCvvW
         4hBQNOYCAxHKGLRc/EwkUKEGKJagt4M9fwO5rsF0elXIu6dXJjI20uGUyBwlECTTaoqP
         7AQn5+M7zyj6m+nQ9y+b2ZpYGsKfw+FDKMlpBhRANXSidfrORyuJZTNH5mArkX5rJyit
         lPrDAe173+HXY/W3lPohj2RM+DYmLZcLgupxqFfL2Rw6hEBkIFFTaIql4YGNSEyeqAZK
         S7I6aClUNAK603giIcOQYS2Ct38J+nsRWPgh/ThKeEbWs2Bw+xFIkXDgRru0e/pJ4S/4
         dWPw==
X-Gm-Message-State: AOAM533LQJ20oUDVk2DnZnH3AlO1wsJCfquyrUqAcPzAW7YlsdDBIW94
        CaNd80vtCYGpIIvGgJPMI7gtKwfcsI4achjdQwHjqA==
X-Google-Smtp-Source: ABdhPJyk+KPR2lsjSvLKNRHP6aN4z/UirZhICS+CEfRNQ+r3j4K/FSNVE284NtSnzx9V5dXUQyG8xe1LglaugjNvlLo=
X-Received: by 2002:a19:c8cb:: with SMTP id y194mr820722lff.89.1591222140898;
 Wed, 03 Jun 2020 15:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200531073716.593343-1-christophe.jaillet@wanadoo.fr>
 <87h7vvb1s3.fsf@belgarion.home> <a2e34c9a-676f-d83f-f395-7428af038c16@wanadoo.fr>
 <20200601183102.GS30374@kadam>
In-Reply-To: <20200601183102.GS30374@kadam>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Jun 2020 00:08:49 +0200
Message-ID: <CACRpkdasbS-4_ZwC-Ucm8tkSUW5tAQdUrXjxHXQ3J0goVYfgHw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pxa: pxa2xx: Remove 'pxa2xx_pinctrl_exit()'
 which is unused and broken
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 1, 2020 at 8:31 PM Dan Carpenter <dan.carpenter@oracle.com> wro=
te:
> On Mon, Jun 01, 2020 at 01:31:23PM +0200, Christophe JAILLET wrote:
> > Le 01/06/2020 =C3=A0 10:58, Robert Jarzmik a =C3=A9crit :
> > > Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:
> > >
> > > > Commit 6d33ee7a0534 ("pinctrl: pxa: Use devm_pinctrl_register() for=
 pinctrl registration")
> > > > has turned a 'pinctrl_register()' into 'devm_pinctrl_register()' in
> > > > 'pxa2xx_pinctrl_init()'.
> > > > However, the corresponding 'pinctrl_unregister()' call in
> > > > 'pxa2xx_pinctrl_exit()' has not been removed.
> > > >
> > > > This is not an issue, because 'pxa2xx_pinctrl_exit()' is unused.
> > > > Remove it now to avoid some wondering in the future and save a few =
LoC.
> > > >
> > > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
> > >
> > > Would be even a better patch with a :
> > > Fixes: 6d33ee7a0534 ("pinctrl: pxa: Use devm_pinctrl_register() for p=
inctrl registration")
> >
> > I was wondering it was was needed in this case.
> > The patch does not really fix anything, as the function is unused. Or i=
t
> > fixes things on a theoretical point of view.
>
> There is no concensus...  We should call a vote on this at Kernel
> Summit.  :P

Fixes means it fixes something that was wrong in that commit.
That's all. Whether syntactic or semantic or regression or
serious or not does not matter. It is also not compulsory to
add it is just helpful.

If it is a regression or critical bug, we also add Cc: stable.

Yours,
Linus Walleij
