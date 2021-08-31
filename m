Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75AA03FC4CD
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Aug 2021 11:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240525AbhHaJIg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Aug 2021 05:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240447AbhHaJIf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Aug 2021 05:08:35 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3DADC06175F
        for <linux-gpio@vger.kernel.org>; Tue, 31 Aug 2021 02:07:40 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id c206so12879833ybb.12
        for <linux-gpio@vger.kernel.org>; Tue, 31 Aug 2021 02:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z9WReO737XvBGcFweYL9X7AjJlBEgD6o3hCVwVj5PgA=;
        b=dFSImeZWMvygJT+lci3mTcdU6P09+HPgNnkK9qhPbUelu7+o9Jbqhm61zCmm+jdVwx
         63nWBmng9QWYl31TAuLDq3sGsSv+TCrs8ZsMlmIVu9IrEd1UwnrUTZp1/62N8HBggsFr
         OJUPvAWhNgRVd0JwerCKryOytWbZ7uCRccDw/6WknPFAYnKmQH/9Mff9JjWiZ7Vl4S1f
         hqTarpQDYErTJ/im/3A2sRM/1ywMYN1nSz0Iu+3HV5NSaQje+QlwFiatgJXWW4ecETGz
         JW7u5AxeGhgxqiRI6IfqE1qvUd3tpKZihVzja1qm78S5vXJshBpbHb52RxBU60RhODNs
         KlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z9WReO737XvBGcFweYL9X7AjJlBEgD6o3hCVwVj5PgA=;
        b=k4CSP8gJ9gzNpnSptp8qEc35LDgR/7C7/n3+IdVkbXx2eHdATRTlITqc0d7FSU+Nc6
         Q+Hu1IY8M6DN8757MSf2IfGOfN+4e0gDmaid9xaPAJTvPNsPIMmK08nknPw+W1DwxiAP
         ZMJveAA89GSzvYmek1N+XKZOc7IbIYevGQ0WUyPokXOfU+A8Wi0TkSlll9yx63PS3NkQ
         cchLCFQNGQuWdpYZWMKkg7t/FX0z6AvFUpSvgxcnCbj/+6rO8zYYwZNr8TixGwL0j7Nk
         gp8d+Gtiljn7Y7sDeyqSa+ScPZ/qftvPQbi7ZtLHFWBlGBWLYvpp8hhf+iFej9wraP03
         1e6A==
X-Gm-Message-State: AOAM530eQ6yKZxT2wmbWoeek3ra4/l6wwfMJsbxLD4kh5KQg3QFh6xeb
        XdwUOh4MmJdjsoL95/LReSmlOqEarOK2uMSVByZWUQ==
X-Google-Smtp-Source: ABdhPJyMNMvSs4tK/E9ZN1j+n8cnxhnu8pdH1dz1/PqYf57AN6v9ljrv28r/XlDtmmfeqEUnSkw1EogGewK24oOrmYw=
X-Received: by 2002:a25:48c7:: with SMTP id v190mr28471081yba.312.1630400859621;
 Tue, 31 Aug 2021 02:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <32ab7b833743449b21f529cae41f4cbb60dc863c.1630387746.git.viresh.kumar@linaro.org>
 <20210831022224-mutt-send-email-mst@kernel.org> <20210831063149.gcctzqtn635mn3wb@vireshk-i7>
In-Reply-To: <20210831063149.gcctzqtn635mn3wb@vireshk-i7>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 31 Aug 2021 11:07:28 +0200
Message-ID: <CAMpxmJWeYTf4yVTJmnHf8Lqrf=J9rGxq54rPFGMYjLaKhH6fdA@mail.gmail.com>
Subject: Re: [PATCH] gpio: virtio: Fix sparse warnings
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        kernel test robot <lkp@intel.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 31, 2021 at 8:31 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 31-08-21, 02:25, Michael S. Tsirkin wrote:
> > On Tue, Aug 31, 2021 at 10:59:25AM +0530, Viresh Kumar wrote:
> > > Fix warnings reported by sparse, related to type mismatch between u16
> > > and __le16.
> > >
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Fixes: 3a29355a22c0 ("gpio: Add virtio-gpio driver")
> > > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> >
> > Acked-by: Michael S. Tsirkin <mst@redhat.com>
> >
> > I'm not sure which tree has the above commit - can this be squashed?
>
> It has gone via the GPIO tree:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/log/?h=gpio/for-next
>
> I believe it can be squashed, Bartosz can confirm the same though.

I just applied it on top of my for-next branch.

Bart

>
> > Also, the driver lacks a MAINTAINERS entry - we want at least
> > L:      virtualization@lists.linux-foundation.org
> > on all virtio drivers.
>
> Sure, I will send a patch for that.
>
> --
> viresh
