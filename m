Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 941BF6A0117
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Feb 2023 03:11:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233083AbjBWCLO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Feb 2023 21:11:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232463AbjBWCLJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Feb 2023 21:11:09 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 008CD3E087
        for <linux-gpio@vger.kernel.org>; Wed, 22 Feb 2023 18:11:07 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id c23so6353713pjo.4
        for <linux-gpio@vger.kernel.org>; Wed, 22 Feb 2023 18:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3si7p3fkilqHdR2QtdQJ0BnGhLu5r3eUvpHNmBBoNfU=;
        b=bsFuVPw9vMLv26aqo9rLQRx7/ZVG4PePcZshzIzVuFz5INf2SWCHG9gP5avkL6UPuE
         jOIAaILC/67VYC4ERhYe+q36FdAaIwvKpRGm2I2XR8NuwCPTd72izbhdNriDU46wKrT8
         NhXeJ5oW+USz2LY6ZXW/MAiF72lf7II4eMSJdY42424pQ1J1sudzsMP/A+Tt7Trk4UIw
         gaXrswFhwc3oCG1whc8va1rxaUZP0XtQaHOUD9aoFZgo/8HBqn2GfoQTaVkGjB/IXwo1
         t1iFrWGYslswuVL7Thwaj7JDkNK1LGwiKLl4MOwu666w/VQiAKp4QuSFJRroFpnYM6KQ
         ktcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3si7p3fkilqHdR2QtdQJ0BnGhLu5r3eUvpHNmBBoNfU=;
        b=lDWWQMO+WQ+F6xgSL/VCyHsIwgyt5wzX+ORKdmA6HIZRONkwCxxOB2O6c2NhAO1BnO
         khusHwgBCa8VN457omLp/WAxxVMyV46RhuUbbDqe/yi+t8kubka88fKEjsTN24Zdwsvw
         neX4j9JpwheX7rPNvExhlS6Coc4PqtUmqMBWa+RJivqk7c5QSGOzHGmjjQPxnqVmWh8B
         nYMpcBIbuKF4S7CWyRgUV+HUJpxdv7UUlGMY/phjDzulh5yal+pNraWAY2LIcjOy94Ld
         R6gFvn1V0KSCQO8Ga28QtbaGdf4glovYMXYk6eGYL5WtjMFs81y6FCT2vgA6O3mV+Eep
         j4Zw==
X-Gm-Message-State: AO0yUKX/f+taxax1xb0cAnk877JRY8gvl1RcPyBiM7EKD21DyFKkgD1K
        e318cPg7TsdhBQaISmLKJz3wGztfq91LO8WXHMyzAg==
X-Google-Smtp-Source: AK7set/X9X8T6QrYsvmm11hBvxajjqfZG2IuKmEmJYtfAlMFwGwqcIvdXb5K48h1llDIIkRMFxc9g5o0MC5kLe30Tpc=
X-Received: by 2002:a17:90b:1e05:b0:236:76cb:99d6 with SMTP id
 pg5-20020a17090b1e0500b0023676cb99d6mr2735818pjb.73.1677118267027; Wed, 22
 Feb 2023 18:11:07 -0800 (PST)
MIME-Version: 1.0
References: <CACRpkdYy8nPeJbBVMsyh6DAeKXPMnsdp7CwK0O2oLWG++oSgDA@mail.gmail.com>
In-Reply-To: <CACRpkdYy8nPeJbBVMsyh6DAeKXPMnsdp7CwK0O2oLWG++oSgDA@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 22 Feb 2023 18:10:30 -0800
Message-ID: <CAGETcx8TiZ1s7s1midKTqbVMzy6oPEkMSQhZkmccHFzyg22+Lw@mail.gmail.com>
Subject: Re: Question on device links
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 22, 2023 at 1:34 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Hi Saravana,
>
> please help me to look at this device link stuff in the pinctrl
> subsystem!

Hi Linus,

Thanks for reaching out!

> I started at one point to add device links for pin control and GPIO
> based on something that was done inside a pin control driver,
> resulting in these patches:
>
> Enforcing links in some select drivers:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=consumer-links
>
> Enforcing it over all drivers:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/commit/?h=consumer-link-enforce
>
> I am under the impression that your generic dependency work
> now made these patches obsolete, so I can drop these branches
> and forget about it, is that correct?

Short answer is, yes, it'll be superseded by my work in driver core in
the cases you have in mind when asking these questions.

Now for the long answer that makes it less clear:

fw_devlink currently supports "off" and "permissive" that are less
stringent than the default "on". Not sure how long we want to support
those option and whether we care about the device links in that case.
The reason I haven't removed "off" is because 1) it was a good debug
option during the early days if fw_devlink to see if it's breaking
things. 2) early on during fw_devlink work, there were some debates
about memory usage and one could argue that there might be low memory
devices that want to save memory by avoiding the creation of device
links (not sure how valid this argument is). fw_devlink seems a lot
more stable and less "breaky" these days -- so (1) might not be a real
concern anymore.

Similarly the "permissive" option was useful in the early days where
you still wanted to make sure sync_state() functionality worked
correctly, but didn't want fw_devlink to order probing and break
things. So, if anything, we can remove this even before we remove
"off".

The current default option for fw_devlink is "on" and doesn't set the
DL_FLAG_PM_RUNTIME flag. fw_devlink=rpm does set that flag. But it
hasn't been enabled by default so I'm not sure if there are any hidden
bugs there -- unlikely when probe ordering is working, but still a
possibility. The ideal goal is to make "rpm" the default and delete
all the other options.

And then, there are cycles. When there are cyclic dependencies in DT,
fw_devlink doesn't enforce any ordering between the devices in the
cycle because it doesn't know what the real probe dependencies are
(and by extension suspend/resume). See [1] for additional context. So,
if the cycle is A -> B -> C -> A, between A, B and C it only creates
SYNC_STATE_ONLY device links (ensures correct sync_state() calls, but
no other enforcement). An idea I have floating in my head as a TODO is
for fw_devlink to learn the real dependency based on what it sees the
drivers attempt to do. For example, if driver for B tries to create a
device link for B -> C, then fw_devlink can start enforcing that going
forward even if B defers probe for some other reason. The usefulness
of this is very limited if B is already creating a B -> C device link
-- it just avoids a few hypothetical deferred probes. Also, Rob was
okay with adding DT properties to break cycles at fw_devlink level,
but I haven't thought through what that would look like. So, at least
for now, when there are cycles, there's some use to the frameworks
creating device links.

Another point is, what about old ARM32 boards that don't use DT and
use a machine specific .c file to create all the devices. fw_devlink
won't do anything for them -- or at least, I haven't bothered to try
to see if there's any way those can fake a "firmware" from fw_devlink
perspective.

Btw, all the comments above are only true since series[2] that landed
in linux-next. Before that series, fw_devlink uses to create device
links between the consumer and the parent of the pinctrl that was
registering all the GPIOs (typically a platform or i2c device). But
with [2], fw_devlink is smarter (see cover letter for details) and
will create device links to the actual gpio devices (or whatever
resource).

Oh, and even if you do continue creating these device links from the
pinctrl framework, it doesn't cause creation of separate device links
from fw_devlink. The device links API just bumps up the ref counts
appropriately. So, the real benefit is about reduced code in the
framework and not any memory savings.

So, TL;DR is that if you don't care about all of these:
- old ARM32 boards
- cases where someone might turn off fw_devlink
- the corner cases where there are cycles (we could push the
responsibility of creating device links to the drivers in that case)
then you can drop all the code you are pointing to.

Hope this helps?

> What about these two drivers we already have:
>
> $ git grep link_consumers drivers/pinctrl/
> drivers/pinctrl/core.c: if (pctldev->desc->link_consumers)
> drivers/pinctrl/pinctrl-stmfx.c:        pctl->pctl_desc.link_consumers = true;
> drivers/pinctrl/stm32/pinctrl-stm32.c:  pctl->pctl_desc.link_consumers = true;
>
> The effect will be to enforce links for each handle from a consumer
> of a pinctrl handle:
>
> static void pinctrl_link_add(struct pinctrl_dev *pctldev,
>                              struct device *consumer)
> {
>         if (pctldev->desc->link_consumers)
>                 device_link_add(consumer, pctldev->dev,
>                                 DL_FLAG_PM_RUNTIME |
>                                 DL_FLAG_AUTOREMOVE_CONSUMER);
> }
>
> Is this also in effect superceded with core dependency tracking
> so this code should simply be deleted?

My comments above apply to these too. I think if we are going to
create device links outside of fw_devlink, we should do it at
framework level as much as possible.

Thanks,
Saravana
[1] - https://lore.kernel.org/lkml/20230207014207.1678715-9-saravanak@google.com/
[2] - https://lore.kernel.org/lkml/20230207014207.1678715-1-saravanak@google.com/
