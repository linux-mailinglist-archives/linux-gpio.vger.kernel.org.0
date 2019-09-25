Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3ABFBE2D3
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2019 18:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391968AbfIYQvp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Sep 2019 12:51:45 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:33598 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731087AbfIYQvp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Sep 2019 12:51:45 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 4507E3C0579;
        Wed, 25 Sep 2019 18:51:42 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id igRcfk_nOYsN; Wed, 25 Sep 2019 18:51:36 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 671E63C04C1;
        Wed, 25 Sep 2019 18:51:36 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Wed, 25 Sep
 2019 18:51:35 +0200
Date:   Wed, 25 Sep 2019 18:51:33 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stephen Warren <swarren@nvidia.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Phil Reid <preid@electromag.com.au>,
        Enrico Weigelt <info@metux.net>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH V4 2/2] gpio: inverter: document the inverter bindings
Message-ID: <20190925165133.GA4164@vmlxhi-102.adit-jv.com>
References: <1561714250-19613-1-git-send-email-harish_kandiga@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1561714250-19613-1-git-send-email-harish_kandiga@mentor.com>
User-Agent: Mutt/1.12.1+40 (7f8642d4ee82) (2019-06-28)
X-Originating-IP: [10.72.93.184]
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi All,

I've additionally Cc-ed Laurent and Stephen, since their fruitful
discussion in [1] back in 2014 concluded with a useful documentation
update [2] which is precisely related to the interpretation and usage
of the polarity flag in GPIO specifiers.

I've also Cc-ed those people who have participated in reviewing the
previous patch iterations (Geert, Phil, Enrico).

Before leaving this thread in limbo, I would like to attempt clarifying
what it actually tried to accomplish, one more time.

First of all, it stems from the need to implement a specific customer
requirement. Whether this requirement is sane or not, that's actually
a very important question, but I haven't found much discussion around
it the comments posted so far.

To paraphrase what Harish stated in [3], the customer has a list of GPIO
pins which need to be controlled from userspace. Of course, the customer
can set the polarity of those pins from userspace, as pointed out by
Linus in [4] (thanks!). But, keeping track of GPIO polarity in userspace
is seen like a burden. The customer thinks that the right place for this
HW-specific detail is in device trees. Do you think this preference
is ill-formed?

If we hog a GPIO pin in DTS (which allows specifying its polarity),
userspace no longer has access to that pin. There isn't a way to define
GPIO polarity by means of DTS without affecting userspace access
(can anybody contradict this statement?).

Whether it is obvious or not, the main goal of this series is actually
to provide the possibility of inverting the default ACTIVE_HIGH polarity
for GPIO pin X _via DTS_ while still allowing to operate on that pin
_from userspace_. My two questions are then:
 - I hope it is something sane to desire?
 - If it is sane, how can this be accomplished, if the functionality
   implemented by Harish doesn't pass the community review?

[1] https://marc.info/?l=linux-gpio&m=139204273132477&w=4 ("Correct meaning of the GPIO active low flag")
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=51e8afc1c43c75 ("gpio: document polarity flag best practices")
[3] https://marc.info/?l=linux-gpio&m=155721267517644&w=2 ("[PATCH V1 1/2] gpio: make it possible to set active-state on GPIO lines")
[4] https://marc.info/?l=linux-gpio&m=155713157122847&w=2 ("[PATCH V1 1/2] gpio: make it possible to set active-state on GPIO lines")

-- 
Best Regards,
Eugeniu
