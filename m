Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E857EA587
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 22:36:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbfJ3Vf7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 17:35:59 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:37434 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727285AbfJ3Vf6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2019 17:35:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=oZE9PLQkCNqVdXZKdyI2tvc9yH25xqcUJOKWm/BFDc4=; b=H6kn4x8eafHW+zT8MA8DZo/7m
        10m3usqaiRcsUGtruQ1nB9zh4kFZuo3BtMRMQvgvkwcftfx5ss2voVRdDWvgjNSQaCuiVO1kpgZUi
        m+fiVa9aKYKxxSmTgN6OvCofwC1LLKg0CH9JBFEPANHerRoT71FRlKcovaJrnNFDd/UXSxHV4mhiV
        4Uc6dgAxfO602UaQiF/v9SyeuluZf6h7LXyt6AXiC/L+CqZp0EDfWr7O92UalLHiJd4KribvJ5CkA
        3rmnr4AVikO9CH08MyUoXJaGzX5TZ4Z5/2XEpzQSCVGFsDajuvmWd2aLXjLtS6bjSCI0VPSHre31F
        P9JTWBSiQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iPvdD-0008Vj-UC; Wed, 30 Oct 2019 21:35:55 +0000
Date:   Wed, 30 Oct 2019 14:35:55 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 0/8] drivers: add new variants of
 devm_platform_ioremap_resource()
Message-ID: <20191030213555.GA25515@infradead.org>
References: <20191006053916.8849-1-brgl@bgdev.pl>
 <CAMRc=Me3Q=67fCDrFM38LAGXCd+apJybLYVfyrfwmwYa5L1CmQ@mail.gmail.com>
 <CAK8P3a3tUg4SBtO0xb2GAHfegp23WF4TLymzqFfra2-fGLRO7w@mail.gmail.com>
 <CAMRc=Me8g2gFiag0UQwuu4UZONcowQw900+MUbGF+4-E0z09Zg@mail.gmail.com>
 <CAK8P3a2mh+Eh+W1GFL2Mi5R3t55SRwWyXW_iBxXB-nBhdCO8LA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2mh+Eh+W1GFL2Mi5R3t55SRwWyXW_iBxXB-nBhdCO8LA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 21, 2019 at 09:29:30PM +0200, Arnd Bergmann wrote:
> > Is Christoph's work in next? The series doesn't apply cleanly on next,
> > I needed to fix a couple conflicts. What branch should I rebase it on
> > before resending?
> 
> Not sure, maybe Christoph can comment.
> 
> Your patches would best go through the char-misc tree and be based
> on top of that, for Christoph's I think the idea is to have some go
> through the architecture maintainer trees, and have whatever is
> left go through my asm-generic tree.

Actually I thought of just doing an ioremap tree for this merge window.

What kind of changes does Bartosz have?  I'm kinda missing the context
here.
