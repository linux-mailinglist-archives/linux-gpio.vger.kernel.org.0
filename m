Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1272AA96F9
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2019 01:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727544AbfIDXRu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 19:17:50 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45453 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbfIDXRu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 19:17:50 -0400
Received: by mail-pg1-f194.google.com with SMTP id 4so259672pgm.12;
        Wed, 04 Sep 2019 16:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=9R72raBBWXijV+vBxS2q3Hmwuxv9Ffre6Ti1aTb9Nhs=;
        b=AKGsaHbLbruRWWZut5eEkFINbN1RAtp5Gc5P4ly1St6QoLFKbCCPMk1sCW6yIOJmU8
         tgKoh4yl45sNzYiOglayAY5CL082kzY1Wz8BajqyKCYe1j0o1iBp/BhUdx4PkdtJovlo
         gddskujNDf7UReyFhrKEXjpli2ejZeidxVi5sNsASu+MTUwt9s+GokTa7o04VKCCSNdO
         iSW3KLaJcTPQwfTyiUfH3u2uJFmwy2eDCGEbwP3ASCSTqzfC6REQqGAEyEVeGHMcL673
         sknyKtVLzla3A9W1v0ng4vS31x4w609YoumtFD6i0+aCcpwFyboKpck83kPrsJKNAGOV
         mJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=9R72raBBWXijV+vBxS2q3Hmwuxv9Ffre6Ti1aTb9Nhs=;
        b=CfVjE7QlJsGvOYnlGrWCPp91AsC2ztzncB1UALERYoLysJz8zfIw53XWseCHOWC4AS
         w9mLrVlYvD4DFaevkceqpzLgwdcnkQuZFBqY614qqm8b/1XxP++EUUoZQEx7wycIuizz
         MZ5muyU1SUJmqCjS0U1HS71IscevTG3GIpyxaK+Mt7FERgPTFTlpHu8bpg0J1PctMMN0
         4AENZ2w6KTCu6mCZvpAsSDO6eHfqluqYy/8jayAW69PEcfXPFFs0kFk2PqRPdHNdFNyt
         5hTlXYTbv9/xR3ea7YNgOdj+BX4ONn+rFnCQVd8sA1tstXZsCJ6uf0hwe+8K1xjmD7Uu
         nVKQ==
X-Gm-Message-State: APjAAAWyubTOL1NFlI17XH4pZKb926dQPZ10LfhQh7wTfGQ65BhYn93u
        TX/O7eZ2vEQQ3RGEEIG+/EQ=
X-Google-Smtp-Source: APXvYqxL8pWcjEkEVw7JhxurqlWcxCeyoZCsxf01cpuezRH1sJw82JW4DIXFjVgtu+WiHE3w/hwa3A==
X-Received: by 2002:a62:168e:: with SMTP id 136mr232320pfw.144.1567639069538;
        Wed, 04 Sep 2019 16:17:49 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
        by smtp.googlemail.com with ESMTPSA id r1sm177579pgv.70.2019.09.04.16.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 16:17:48 -0700 (PDT)
Message-ID: <dd62da5f10c06fae1823bf8338c2acc83fe40a40.camel@gmail.com>
Subject: Re: [PATCH 1/4] gpio/aspeed: Fix incorrect number of banks
From:   Rashmica Gupta <rashmica.g@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed@lists.ozlabs.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Date:   Thu, 05 Sep 2019 09:17:43 +1000
In-Reply-To: <CAHp75Vd_6Rpt5=BjzV8YFCiFP7qsRrYHHo7+=gWwnZH-zT9jNw@mail.gmail.com>
References: <20190904061245.30770-1-rashmica.g@gmail.com>
         <CAHp75Vd_6Rpt5=BjzV8YFCiFP7qsRrYHHo7+=gWwnZH-zT9jNw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 2019-09-04 at 19:27 +0300, Andy Shevchenko wrote:
> On Wed, Sep 4, 2019 at 9:14 AM Rashmica Gupta <rashmica.g@gmail.com>
> wrote:
> > Fixes: 361b79119a4b7 ('gpio: Add Aspeed driver')
> > 
> > Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
> >         /* Allocate a cache of the output registers */
> > -       banks = gpio->config->nr_gpios >> 5;
> > +       banks = (gpio->config->nr_gpios >> 5) + 1;
> 
> Shouldn't be rather DIV_ROUND_UP(nr_gpios, sizeof(u32)) ?

I agree that DIV_ROUND_UP is the right thing to use here, but wouldn't
it be DIV_ROUND_UP(nr_gpios, 32)?

> 
> >         gpio->dcache = devm_kcalloc(&pdev->dev,
> >                                     banks, sizeof(u32),
> > GFP_KERNEL);
> 
> 

