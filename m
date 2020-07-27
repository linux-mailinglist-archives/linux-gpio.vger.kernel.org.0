Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C50C222E3B4
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 03:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbgG0BqH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Jul 2020 21:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726797AbgG0BqH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Jul 2020 21:46:07 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09776C0619D2;
        Sun, 26 Jul 2020 18:46:07 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id o13so8519074pgf.0;
        Sun, 26 Jul 2020 18:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FkewYi4NEj9DYPkGcNYYj0thN1u6i8LoJmF6J427G24=;
        b=W5GnH5zfdSudcBo7qCazalC4ZSXSOYqNKlrGTJ8f+lEm7c2BVM2nBoC97NLCxz8Ecw
         IhGkIfz8LRCbGdRkYIBxqBXvDjp6NOweULfKOCfoBseFL6i+3IFTR6nH6OU/wFUb/mMK
         h7SKDxAEd2Zii4siaC3NZK+qYX7ZQZ5YAlf0EHJKUjR0gnEFw/t/p4+u4d/1Ca5RWBfu
         AsbM4OhrPVAgIZFi+Y9ZcAxP4QfLSU9h2B5aWBNwV30/AkGMxQs4tVuF22b6orkSlhyB
         idfPxRstz30HihkGVL7zTLO5AaYyBi/uK9tHAnKJThD/D+mncYKL42Ze4ElPniTxlYgW
         FrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FkewYi4NEj9DYPkGcNYYj0thN1u6i8LoJmF6J427G24=;
        b=e01A8E/SWyGBaH1sN8FttXVicHHCyMAVzYFQP387g+lvTopTB/dJSg6IHVb/5WDzrq
         eI2UvFdOTziendZIvKZTs6531MgFhjZEC1IzVaUDSUCwcuW5XtRZjHyxpoR0+ZpVGhBx
         Br/FHGc9lxlL0mu1begNehO+gjc70jU9YNJjOKzmsYXmSB1sZJ1vAbFzSFOFK5cQW5sT
         bMMxaEyYIEuZfCN5aj7NVXxZJ2T+QC1EzJ+iea0uV6EKb+bPYK7u83dZMleD9pZLpjps
         ghRPg6JiBN58lgC61UmaizxvIx+zFhj94oPmzwYBn9RUJ0NipVXBhj/caWBIn2ljVi7Y
         hncg==
X-Gm-Message-State: AOAM530bOgeQqART/Aolnwk0JTYpFqtwqRVSBPneM/F0EVR6oa7xRK0D
        genjfWoav2Gs1SW+KSIKTpc=
X-Google-Smtp-Source: ABdhPJytt0icjy2kS8S+uy58W68c1qkGUJk9cKVJo/3bRIx1J3Iy6gKw07rxLgO3+N0Gk30soflAMQ==
X-Received: by 2002:a63:5a54:: with SMTP id k20mr17555354pgm.226.1595814366497;
        Sun, 26 Jul 2020 18:46:06 -0700 (PDT)
Received: from sol (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id c2sm7009210pgb.52.2020.07.26.18.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 18:46:05 -0700 (PDT)
Date:   Mon, 27 Jul 2020 09:46:01 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 03/18] gpiolib: make cdev a build option
Message-ID: <20200727014601.GA10761@sol>
References: <20200725041955.9985-1-warthog618@gmail.com>
 <20200725041955.9985-4-warthog618@gmail.com>
 <CACRpkdZymmO9ku5OmCO74eiX3Y3jq_1g5De9Tx4hg3Lyrdt6bQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZymmO9ku5OmCO74eiX3Y3jq_1g5De9Tx4hg3Lyrdt6bQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 27, 2020 at 12:25:53AM +0200, Linus Walleij wrote:
> On Sat, Jul 25, 2020 at 6:21 AM Kent Gibson <warthog618@gmail.com> wrote:
> 
> > +config GPIO_CDEV
> > +       bool "/dev/gpiochipN (character device interface)"
> > +       default y
> 
> I don't want to make it too easy to do this, as I see it as a standard
> kernel feature.
> 
> Can we add:
> 
> depends on EXPERT
> 
> as with other standard kernel features?
> 

Fair enough.

But what of the GPIO_CDEV_V1 option to disable uAPI V1 added in patch 04,
and that depends on GPIO_CDEV?
That is equivalent to GPIO_SYSFS, which is not dependent on EXPERT,
so I'll need to restructure the dependencies so it doesn't
inherit the EXPERT dependency.
Unless you also want it to be dependent on EXPERT.

Hmmm, and maybe patch 04 should be later in the series - after V2 is
fully implemented and V1 is deprecated - around patch 11.

Cheers,
Kent.
