Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 364B7B24E9
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2019 20:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388369AbfIMSOH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Sep 2019 14:14:07 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46420 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388309AbfIMSOH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Sep 2019 14:14:07 -0400
Received: by mail-pg1-f195.google.com with SMTP id m3so15613532pgv.13;
        Fri, 13 Sep 2019 11:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oHI3ikYqXzAdUNCPKfhgQpi2fjCqkIS9s53pB9/KNOM=;
        b=WK71UwCLKy/d92JyOkdXgJqo6xCcT+XSPTGWvhoKDmLWkStOy1941DZMKgIO+gMEhx
         nR2nxsuj6fEihvaxVrrkUA1itA+ruzOnmZfqNf9sVD6baJHsn/0WFxIoZwgaolcG+d6M
         i+/cqJsEns5aQuZ49Rf5gxY0AQ+sMrB89BpP3wvAoEYoX+tSGePe7YHo57hJaL81FGI7
         QTs8bGIU0p5ji+oEnDZBfQLHXsQd9mnq2TV9kQ/9NlbVLjf1r6FNJlPqU7aK779lLMP7
         GuUlJ63xWWGFTO9186hyyNnImA5erNIWmyPZmjg5nzzKvBDiO5b/mr6bO3mfS3CUNt7F
         xj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oHI3ikYqXzAdUNCPKfhgQpi2fjCqkIS9s53pB9/KNOM=;
        b=Z/xAQtqg/vFwnHz3/tqOuO1BpQpEVscVPMKfYuEwfmDRM0K04mjbJV/dmvdZ8P92kg
         XhNADGX3QUziqnAv1U6hskSWOFD+biHz4Yk+D9/FtN2VwhpTojgK6sz0Gf/4OP1QOTfa
         qmYzYkquPWWMtOsn6Al2QrLZ/3NM6+SI1xw6Vso8r77A1F/Q1LGMnsveQgnRLcxMbErz
         JxiEPy78weOQ89RqiVQjAl7Tvl1IYl8xfEoNOkvPpKaRaup5C/t9uWucs9ZW+FXip/d4
         wTeWUdeF4FOSgs07IVJps0q0b1IC2yNbNPK9thu0/q3YXhnG55eHgNjz8E07z7fhTNkP
         +HnQ==
X-Gm-Message-State: APjAAAUQMm3LP3sXlt0HNUUGi92xIT5+e4KPJ8FcXUy6pbqVlayID9q8
        Lhb/+bUwuAidNfrgPEmJDs8=
X-Google-Smtp-Source: APXvYqzMP4z/EOxxztYL+OQIyYlisljzYiYP6eq+qQ7qUpdF/yfrq8ZzjsPtwNu5Q56knzM5rwg67Q==
X-Received: by 2002:a65:6547:: with SMTP id a7mr43979483pgw.65.1568398446059;
        Fri, 13 Sep 2019 11:14:06 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 195sm4553824pfz.103.2019.09.13.11.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 11:14:04 -0700 (PDT)
Date:   Fri, 13 Sep 2019 11:14:02 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 02/11] gpiolib: introduce devm_fwnode_gpiod_get_index()
Message-ID: <20190913181402.GB237523@dtor-ws>
References: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
 <20190911075215.78047-3-dmitry.torokhov@gmail.com>
 <CACRpkdZjZZKQqkN-HC11PJ5SgZbZd1Gnbeh8ApJ7+cS1eOOMbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZjZZKQqkN-HC11PJ5SgZbZd1Gnbeh8ApJ7+cS1eOOMbw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 12, 2019 at 10:48:13AM +0100, Linus Walleij wrote:
> On Wed, Sep 11, 2019 at 8:52 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> 
> > devm_fwnode_get_index_gpiod_from_child() is too long, besides the fwnode
> > in question does not have to be a child of device node. Let's rename it
> > to devm_fwnode_gpiod_get_index() and keep the old name for compatibility
> > for now.
> >
> > Also let's add a devm_fwnode_gpiod_get() wrapper as majority of the
> > callers need a single GPIO.
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> The patch is good because this is in line with Rusty Russells API
> manifesto:
> 
> 7. The obvious use is (probably) the correct one.
> 6. The name tells you how to use it.
> 
> It doesn't apply to my "devel" branch as of now:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/log/?h=devel
> 
> If you rebase this and the next patch and send them separately I
> am willing to apply them already for v5.4 to easy your refactoring
> work during the v5.5 cycle here, provided we try to fix up the old users
> ASAP and delete the compatibility fallbacks in the near future.

Done.

Thanks.

-- 
Dmitry
