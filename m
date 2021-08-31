Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8682E3FC2C4
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Aug 2021 08:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234076AbhHaG1c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Aug 2021 02:27:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42021 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234475AbhHaG1c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 31 Aug 2021 02:27:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630391197;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hEPnuo65Qwng2L+Utb7e5ueojU9F4bLfB1V9DmTMPmk=;
        b=GgxzYysI+GE9drj+9HILJ6KzaaW1QhscZjI0vIkQDmNTQbmGokypa1SaWlWrcdkiLV0TLX
        vxG6xsOpioS+YCpVHYUA3tWX5kw5zySA0I1G1yM0uQ5PjvoL0Q1O/YWkDZCA1/UQx0AFIS
        kCsBOd/GlQS6Hoj13pz1eTV3INdv1RQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-yEMPnOjvN9m9WJmcTjeijg-1; Tue, 31 Aug 2021 02:26:34 -0400
X-MC-Unique: yEMPnOjvN9m9WJmcTjeijg-1
Received: by mail-ed1-f70.google.com with SMTP id s15-20020a056402520f00b003cad788f1f6so2866971edd.22
        for <linux-gpio@vger.kernel.org>; Mon, 30 Aug 2021 23:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hEPnuo65Qwng2L+Utb7e5ueojU9F4bLfB1V9DmTMPmk=;
        b=PE9H8lwD1whfCkVo71LnOdS6EgksrWCcMH1cdxhHCs0D6UT2TKTfKl/QYuL4dzjB95
         jPX94vA5DjXN8BdjYwXaFshYN6dWYS99HFV8hK/wWJUglBp4LPwW6LJYLnHH44RFKkPG
         pGlc5iMw9kUvTJAWicg1j55Jfr6mx+PPb7KB+B/3xi9xMIvnQ2PqosUeMzlTh578zsBP
         lDwtCNvD8Ya3h9l/s48O34w3c+j/EiyQLwA4FCEVGdAhep+rBqslmADHX7PIcSqX8D01
         3/VrF8AYEAbotvUX3tMtG1vNyIjenlPPdY2hZp/Js5gvh0vWtEGEBZcKHaE8x981RgiV
         +vxw==
X-Gm-Message-State: AOAM530xBIioeNmcYLRFp6JJvvBOF2QWm2DsB1hT49XmxiJxGq1STXYH
        Dvh40ZGm7JmShzbBWwBFohytuhvPRzNUZFQbyfWJFJozWq+cMOHTSgZNu50zx3Z0SvHnkmhpgj+
        oG6qsbTcw442fKDM87F04Pw==
X-Received: by 2002:a17:906:7848:: with SMTP id p8mr28411732ejm.212.1630391193307;
        Mon, 30 Aug 2021 23:26:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0ENtKRCXEgDAfYv9QFQ79jja5d57DPHChIvu4gbEetyNiq/qMcRLJnMhi1cyEze9WmqAobQ==
X-Received: by 2002:a17:906:7848:: with SMTP id p8mr28411715ejm.212.1630391193158;
        Mon, 30 Aug 2021 23:26:33 -0700 (PDT)
Received: from redhat.com ([2.55.138.60])
        by smtp.gmail.com with ESMTPSA id c17sm8820979edu.11.2021.08.30.23.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 23:26:32 -0700 (PDT)
Date:   Tue, 31 Aug 2021 02:26:27 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        stratos-dev@op-lists.linaro.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH V7] gpio: Add virtio-gpio driver
Message-ID: <20210831022536-mutt-send-email-mst@kernel.org>
References: <56ca9b1fc803e393a67e875bed4f900c6a432085.1629347189.git.viresh.kumar@linaro.org>
 <CAMRc=Mfm7EekU_LbujfPxo+NzGTErC44yj-aB+Zg8DXqo7eX5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mfm7EekU_LbujfPxo+NzGTErC44yj-aB+Zg8DXqo7eX5g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 23, 2021 at 09:52:22AM +0200, Bartosz Golaszewski wrote:
> On Thu, Aug 19, 2021 at 6:30 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > This patch adds a new driver for Virtio based GPIO devices.
> >
> > This allows a guest VM running Linux to access GPIO lines provided by
> > the host. It supports all basic operations, except interrupts for the
> > GPIO lines.
> >
> > Based on the initial work posted by:
> > "Enrico Weigelt, metux IT consult" <lkml@metux.net>.
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> > Bartosz,
> >
> > Can you please pick this up for 5.15, the specification is already merged now:
> >
> > https://github.com/oasis-tcs/virtio-spec/blob/master/virtio-gpio.tex
> >
> > I will follow up with the IRQ stuff separately.
> >
> 
> Applied, thanks!
> 
> Bart

Um. didn't expect this to be applied yet, the driver is not
sparse clean, kernel build bot gave some other warnings too.

