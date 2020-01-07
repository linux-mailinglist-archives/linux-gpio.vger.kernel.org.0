Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07E421326C0
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 13:52:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727858AbgAGMwz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 07:52:55 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37763 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727722AbgAGMwz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 07:52:55 -0500
Received: by mail-lf1-f65.google.com with SMTP id b15so38801153lfc.4
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 04:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L8QAs8mXhglioLsPrlc/f2d1DW6plEBLWoC91qHtQLU=;
        b=Yn2TyRB1A6iQIcJmRjrzeaQqGvJOWo7XoWbfKsG+WVNnyHmbbqAm3wws8axVbSrvx8
         OYAvdEREwIT61Jq7XS24FPZabB6NFf6CBMS+nk0infpFkx8TMso1GTjbUKZSWQSBei5w
         HeMofh8JjZTxSuMRQYKXswWZEJVsyKirJsdh84VnRNEDBHVnCQmLzMcMRmtA3ydGNgfa
         5L30k/tpjPghGC26xYQZDChA/vk1hkf75dK9VaZF9Qi9vccEh9vpmh4STE4jsKJj/QfX
         RrhfavmoM0fIfBpoXr4XH95IpmY9v05ug4VeNSkEk9IJolXbtwHfYdXRZEAMEgz3UTAB
         nZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L8QAs8mXhglioLsPrlc/f2d1DW6plEBLWoC91qHtQLU=;
        b=I7qcsgWgzZj7KEVDgJmoZLY04Nli7KMAsPm/33U4KYbHFbCDroC3IR7bcPcHCizZ7a
         9HMo1BqDs96tXU+LSkRhT1U/2tL8aaCnju4S6g5VKk8BCtjRWwyMuP3B0DnJd2EbJsXa
         RypWWhU4Fzz6z1Nko8go0hCMAglKITmBhrttGBQiOby5A0sZjuIra2ulDfgfS7KauUxw
         b9iCyl+slFgjbKR+h/GtNP6Gmnxrhv3jerYi0SeQsi3I+fpydIizJnj31PsH2bpXdSsx
         WQSLVrCXoFg3LXCTjnXL4+hlS0zIdOZ3LZo1hzfU0W6Y0+cyg7ZjygKuPuElVB9H1+VX
         afVQ==
X-Gm-Message-State: APjAAAWHN5txjAUsIhEP2FnXjYOf+ZxDOakK+E7CMyUNHLm/X921wkne
        8WYJoz9F17jIDULGpqjXDKLwHd2kAFsSCsnUa2w7sg==
X-Google-Smtp-Source: APXvYqzkwnIC5nKfdjXTDBBv2eSE257wx56BzcThYlaspGGuetJJ+vOHhNKo0xsogQPtM2m4KtEFsYSOjhMxMQYb2yo=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr58545952lfi.93.1578401572910;
 Tue, 07 Jan 2020 04:52:52 -0800 (PST)
MIME-Version: 1.0
References: <20191218101602.2442868-1-ben.dooks@codethink.co.uk>
 <20191218162616.qsxsltfsrxotzqhb@axis.com> <048c9653-114b-f726-44b2-9eb1d460b5b5@codethink.co.uk>
 <CACRpkdYFzHCMLj5oU5JMCkQkMZyOvM5351tpO6iEsE8e5nBZWQ@mail.gmail.com> <20200107111836.uzvja6m4nb5hh56j@axis.com>
In-Reply-To: <20200107111836.uzvja6m4nb5hh56j@axis.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 13:52:41 +0100
Message-ID: <CACRpkdau_eTe7xgSCMeE=6dv_M5Ef+Opy6EzymxewuU6aecKHQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: artpec6: fix __iomem on reg in set
To:     Jesper Nilsson <jesper.nilsson@axis.com>
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Jesper Nilsson <jespern@axis.com>,
        Lars Persson <larper@axis.com>,
        linux-arm-kernel <linux-arm-kernel@axis.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 7, 2020 at 12:18 PM Jesper Nilsson <jesper.nilsson@axis.com> wrote:
> On Tue, Jan 07, 2020 at 10:39:34AM +0100, Linus Walleij wrote:
> > On Wed, Dec 18, 2019 at 6:32 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
> > > On 18/12/2019 16:26, Jesper Nilsson wrote:
> > > > On Wed, Dec 18, 2019 at 11:16:02AM +0100, Ben Dooks (Codethink) wrote:
> >
> > > >> -    unsigned int *reg;
> > > >> +    unsigned int __iomem *reg;
> > > >
> > > >       void __iomem *reg;
> > > >
> > > > We're using as an argument to readl()?
> > >
> > > yes, readl() shoud take an __iomem attributed pointer.
> >
> > Shall I change it to void as well when applying?
>
> Please do, sorry that my comment wasn't clear above.

OK I did that and applied, let's see if it works :)

Yours,
Linus Walleij
