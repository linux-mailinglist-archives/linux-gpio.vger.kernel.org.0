Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 607EBB24E6
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2019 20:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388492AbfIMSNO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Sep 2019 14:13:14 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39159 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388369AbfIMSNO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Sep 2019 14:13:14 -0400
Received: by mail-pg1-f195.google.com with SMTP id u17so15638965pgi.6;
        Fri, 13 Sep 2019 11:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tsmYK4DAhAwYKB+mrwiynGG5Ek57iVJkACEef+dCQ3U=;
        b=Xlt2Gp3OXC3RvA8OqV+NdLsu2qrqj1PsOodxviaqdomFKZvXDTIzvWT4YHYcu6Eiqw
         s3OIRjo0bFjJKSSet3ZJkgr9waiFxxmpnB8J4ThcTPawTK0ErRGePcponusbVlWZUeUi
         jcrqrdVoy6nu+lAEfurK+c849uU6uUw2Gj2a+JR0bZ4qILakZ7fsljm+br+T5sb9wgO1
         yb/+piGUv/bwqEAsMJuzDpk/EI6UtDbYMmJb/znexV32jqBHrso/D6tCnjWvCddYKEaY
         AwKfhiZE0SAoJ/j63WbhwmcWGtOS1gTRBm8nZ3gL/f4UdzXQ3Iv1Ik1KqzECQ5c3R6S5
         EgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tsmYK4DAhAwYKB+mrwiynGG5Ek57iVJkACEef+dCQ3U=;
        b=dA8RTeFh9ZCIXmcP3bo+OP0zUgxirpMOri0oN7pP22BfqOmTMgf4cnyrEhH/BcttqD
         XXbEcAxZxL+AJBhhl2E/9HZsZIOkQ9Ekq11zhLHehAAFw/E22ecEdaiUZ8r3Ca07gYNC
         5+vF0pRx/GMsUMTQ4uKtEEv1WR8A0liHQKdQTTEgusoHkJfQBLkG2lQFMZfJ5PKwMbsx
         6P/Iu++safxqt41GILVjzffcjot+akHL7u7Jnyw4p80Ir5t27fQt7HbScUsvlx0/HG80
         m8HDvcS2xjMgMuSZbf0DBV8V12tfFTCl4yzgwbWwJ5ya+7OC29ae/v76+67OXdw75eNf
         wjCQ==
X-Gm-Message-State: APjAAAVmzrSiyyOPyoVBLPCUcLQtj8CQ7NvWgzVZ3zNffzOCSf+MVty1
        ftWZP1/Ct1fnGMnRTSVkp6I=
X-Google-Smtp-Source: APXvYqwKJ6SDncTarJ6A0ILwmeDbxaPmbiXtfNCbIx0whqhnR25hVsM+7UOiE8OAi88kkuMD9Ne72Q==
X-Received: by 2002:a62:e917:: with SMTP id j23mr10254556pfh.186.1568398393546;
        Fri, 13 Sep 2019 11:13:13 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id c17sm27985606pfo.57.2019.09.13.11.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 11:13:12 -0700 (PDT)
Date:   Fri, 13 Sep 2019 11:13:10 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 1/2] gpiolib: introduce devm_fwnode_gpiod_get_index()
Message-ID: <20190913181310.GA237523@dtor-ws>
References: <20190913032240.50333-1-dmitry.torokhov@gmail.com>
 <20190913032240.50333-2-dmitry.torokhov@gmail.com>
 <20190913094007.GE28281@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190913094007.GE28281@lahna.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 13, 2019 at 12:40:07PM +0300, Mika Westerberg wrote:
> On Thu, Sep 12, 2019 at 08:22:38PM -0700, Dmitry Torokhov wrote:
> > devm_fwnode_get_index_gpiod_from_child() is too long, besides the fwnode
> > in question does not have to be a child of device node. Let's rename it
> > to devm_fwnode_gpiod_get_index() and keep the old name for compatibility
> > for now.
> 
> Shouldn't we convert all the users and drop that monstrosity
> devm_fwnode_get_index_gpiod_from_child() completely?

Yes, once we land this in 5.4 I will start blasting maintainers with
patches.

Thanks.

-- 
Dmitry
