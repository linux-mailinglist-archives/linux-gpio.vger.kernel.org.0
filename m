Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 327EF276B34
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Sep 2020 09:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbgIXHvC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Sep 2020 03:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727103AbgIXHvC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2020 03:51:02 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAC31C0613CE;
        Thu, 24 Sep 2020 00:51:02 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 197so180303pge.8;
        Thu, 24 Sep 2020 00:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1ou3bbGe5th7uUnDB+XZd2U1A6RJKgi+roKFJ78TGSE=;
        b=BOb+/LYGXMai0U9rgCSZN1L6+ZoTk3gCQR8/xpp7xEbyARJ35XA8xhwOLFdzXIby9+
         hgayC9UPcQKtS7AMaXA5L296CGHBqtkB8e7IC486yWvTu5dqUBovaFsGj3ANae7uCZNU
         7TbMQsUXG2riuoPg9rkz6RrwyWuQ1rrGobD2jj/FBqXmtPQlofAITn8aLHtwhJXqPcjS
         Rj6NgxzUeyNgRTx0cL6sm9jn8IpWQrtG8Z0o+XWkkUowvs+iCywG7fAOPnsoIF9qtDsb
         f0eFY4i//YZeUtIaa6hWCvJ+1b96JN4IN85KoO1Nyk4wA0wAUEDFWZc9tStrWOZsp0q+
         jF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1ou3bbGe5th7uUnDB+XZd2U1A6RJKgi+roKFJ78TGSE=;
        b=J1+mJemvEjmcgPGJdVvQiAuhtxvUGORo9z0qvrFER5ueJvCKeLvnN3ZHhDnFgyOYHz
         l6Fx5eGEwinRAaiJBaJqUA52nj0bYg5tHo8+uhtyd+ZeBTj/tkUpjzD6COp02G4zD8DE
         Ippen6DJ7QOX4DpY919ySv3CntCiVItdnMg9p38y01sns2M+42XiApGkrm7E99FWnoHx
         WmgZCYnc1E6obqCBxYxksrmxCLzYkW2Ok92jHdm1sXPyo/h5QjxvxPdGZ6XPRNsq9ok8
         +h7PYsNjoA08T3nFY9snIKe32HKgvWHiZM7GXCJOKMmlaH0KJdXLXmMRghmz+SF/7cYZ
         4GHA==
X-Gm-Message-State: AOAM530hwSrE1mIur2MDGhfXgqaoYJGawkaOgM+SjLg+28t4uYoE1P4a
        ATzKd+qzfY39w/rksg5tdaMnpJserXe2FQ==
X-Google-Smtp-Source: ABdhPJw4MgmARHZwrEzuIpcQpWYfGdKEOkw+oB7mtLkaloOH2ms8EUdNOmvxD62oFX0h8kVM1sDFqg==
X-Received: by 2002:a05:6a00:1491:b029:142:2501:34e0 with SMTP id v17-20020a056a001491b0290142250134e0mr3355943pfu.57.1600933861944;
        Thu, 24 Sep 2020 00:51:01 -0700 (PDT)
Received: from sol (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id t24sm1879687pfq.37.2020.09.24.00.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 00:51:01 -0700 (PDT)
Date:   Thu, 24 Sep 2020 15:50:56 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v9 17/20] tools: gpio: port gpio-hammer to v2 uAPI
Message-ID: <20200924075056.GC17562@sol>
References: <20200922023151.387447-1-warthog618@gmail.com>
 <20200922023151.387447-18-warthog618@gmail.com>
 <CAHp75VenmSn0MV+FOfX=y9h3ob=Hsg741MjUJ-DEHcvxRT6wYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VenmSn0MV+FOfX=y9h3ob=Hsg741MjUJ-DEHcvxRT6wYA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 23, 2020 at 07:30:52PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 22, 2020 at 5:36 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Port the gpio-hammer tool to the latest GPIO uAPI.
> 
> _BITUL() and _BITULL() are part of Linux uAPI. Why not to use them?
> const.h
> 

Yeah, that is an oversight on my part - will change for v10.

Cheers,
Kent.
