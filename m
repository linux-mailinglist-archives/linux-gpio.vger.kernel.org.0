Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BAC233163F
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 19:38:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbhCHShd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 13:37:33 -0500
Received: from mail-io1-f48.google.com ([209.85.166.48]:38028 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbhCHShH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Mar 2021 13:37:07 -0500
Received: by mail-io1-f48.google.com with SMTP id k2so11047439ioh.5;
        Mon, 08 Mar 2021 10:37:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GZuaYRcTQYr29WcRo++hbhX56RPiFxHTN4yTc4AVz3w=;
        b=ueNg0eXozQn4GeZW4yb/OAzU/nlETfHF/8IooElZdh57U4/kRZgSa+u5kwvBfoCP9i
         +39/KKkK2/2IUNSkQr7tRZf4Oal2Ha34IQZC8Uv6Ok4+g9Sc2d3ytiG2akiCWpY1wT0F
         qIAOCLrlLnWBunHj5svVdxrtX0J0Ijgx9FlISC66DqB/SO3z5q11uhyl+7LYJ93HH4ni
         rMwLFSqNRpqKkqwfLoE4c1Rvc2+vDH+tw8MsDlOjuWXPNQM1/ukN0ggup6+M4cFP2AOp
         GtBF1RDu2wLdwGlflRTQ8k3whWOM8S9HuMdhAfTU5wkYaxb54OWWokcqYLr7YYnuhQMH
         a2NQ==
X-Gm-Message-State: AOAM531QyGRMqdNbfXJGQXtHe0P+bBWGXtmPqxrxiWmuv99d2qdRSMh3
        9E2xaoLtCdQD5QYQZ6UhW0lG+NutKg==
X-Google-Smtp-Source: ABdhPJzJvIobBSjcBQqRLygEjVIi4wqh95GdW3xy8229pOCjpvroGq1otlgfjqRkUCIo0gL3y4TMig==
X-Received: by 2002:a5d:80d5:: with SMTP id h21mr7273322ior.11.1615228626850;
        Mon, 08 Mar 2021 10:37:06 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id h13sm6224496ioe.40.2021.03.08.10.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 10:37:05 -0800 (PST)
Received: (nullmailer pid 2758433 invoked by uid 1000);
        Mon, 08 Mar 2021 18:37:04 -0000
Date:   Mon, 8 Mar 2021 11:37:04 -0700
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpio: omap: Honor "aliases" node
Message-ID: <20210308183704.GA2747088@robh.at.kernel.org>
References: <20210302011813.2331879-1-alexander.sverdlin@gmail.com>
 <CACRpkdYErJH5RUjL+jPC5vnaqGiOqBwHsr0E42wOWrpBGrpS3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYErJH5RUjL+jPC5vnaqGiOqBwHsr0E42wOWrpBGrpS3w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 02, 2021 at 05:21:23PM +0100, Linus Walleij wrote:
> On Tue, Mar 2, 2021 at 2:18 AM Alexander Sverdlin
> <alexander.sverdlin@gmail.com> wrote:
> 
> > Currently the naming of the GPIO chips depends on their order in the DT,
> > but also on the kernel version (I've noticed the change from v5.10.x to
> > v5.11). Honor the persistent enumeration in the "aliases" node like other
> > GPIO drivers do.
> >
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > ---
> > Yes, I noticed checkpatch "WARNING: DT binding docs and includes should be
> > a separate patch."
> > However, the parts below are tiny and barely make sense separately.
> 
> I've shut it down in the past because the instance ordering is a
> linuxism and the needs are in the Linux userspace somehow.
> It is different from a UART for example, which always need to
> be at the same place on any operating system, hence it has an
> alias.
> 
> For kernelspace the instance order should not matter, since
> all resources are obtained from the device tree anyway
> by phandle.

Thank you!

Can we remove the ones we have already for GPIO? 

BTW, It's been on my todo list for a while to start requiring 
documentation of alias names so we can reject new ones and get rid of 
some of the unused existing ones. Some platforms have numbered 
everything...

Rob
