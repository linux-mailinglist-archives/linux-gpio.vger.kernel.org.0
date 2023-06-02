Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 266F171F853
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jun 2023 04:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232839AbjFBCNn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jun 2023 22:13:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjFBCNn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jun 2023 22:13:43 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8B59194
        for <linux-gpio@vger.kernel.org>; Thu,  1 Jun 2023 19:13:41 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-53fa455cd94so876874a12.2
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jun 2023 19:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685672021; x=1688264021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+EZAk8miYbhrGULvgahJtsK0DP1PdFcW5CiWVQf1ejQ=;
        b=OHL7GY78fMXLzUsL5cRoznMCgcv8tlCyyTR+r55NWyXX36peMPriKyu8EP6OJD/n7d
         hX6pvf+YGqdYBPRg0aH9wjXf+SpXLf95W/7QTOnUaP2T68HXZHLdR2Sd6KwI7cZonDqz
         +ChF5uYz/E3bBIwE3fzhW+lCLDFf5kZRCOnQXiRnxmU7i7VCScLmudgOhvrEbbPFIhFq
         Y3WZbnUlMRAJ8DMY8jkC9+MlsZP7U5ujedkVK2AWPYScpnRkS+IRpTJIzO+hxVDp9vy9
         jKXO5SzwXpLhbmh61zq+ICPYCGro3oO5JImthpR5pnmlr5ESBZP7qMC/Gv2eODQBC8iv
         8GAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685672021; x=1688264021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EZAk8miYbhrGULvgahJtsK0DP1PdFcW5CiWVQf1ejQ=;
        b=ZuujPxFZvwBBt8d8DyeY3BksluzM4cgYUmIfMikr8wiJ/Ukgm3lDA4A7ttrISYlleg
         IkSrpTmwjrzJ3Rm4M+85GgVPDtCzRTgd8qfflmSbusLT7TYGOUI308kUA+doZ13R/l+c
         IEgnotp7kHtVFiXb5WeKHO91Oh0qgzFR/UT2WnCRDXd6M6GqrWs78RNRKxY1jEfyC6cC
         OuW02/hynlnAjGX7+aRFZfttn1wwXgSc/Wv30hatqgz8SnVmJcBPVAI+tJupWmNuHMzi
         mzeBngdh+kLM5ZRAXzs4uWdNT9SeB0uLSn2MUXANcj6i1riAfeiBEFkIWerATVCaYBuN
         cb2w==
X-Gm-Message-State: AC+VfDwrbtOrH5jXkRJse2UQipoDLvGymCQn7g66w42J5K2BeSRHfAqM
        h/Av5XG1+Dz2g+CV0JR6HdGTq9pnEFY=
X-Google-Smtp-Source: ACHHUZ6WqcRkl5tyZn/uOkTzsbsMKNm3EsFUrUeb9xx0sJa3juBqe2DDh3UkbQ9x/RRwl3TXAmJVqQ==
X-Received: by 2002:a17:902:ce8a:b0:1b1:9069:db59 with SMTP id f10-20020a170902ce8a00b001b19069db59mr845916plg.36.1685672020905;
        Thu, 01 Jun 2023 19:13:40 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id o16-20020a170902d4d000b001b0395c4002sm54608plg.210.2023.06.01.19.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 19:13:40 -0700 (PDT)
Date:   Fri, 2 Jun 2023 10:13:35 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] tools: tests: replace egrep with grep -E
Message-ID: <ZHlQT5KeU+7GkYba@sol>
References: <20230601140950.779453-1-brgl@bgdev.pl>
 <ZHirBqDkd99qWGX8@sol>
 <ZHjONQW0qVMseySZ@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHjONQW0qVMseySZ@smile.fi.intel.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 01, 2023 at 07:58:29PM +0300, Andy Shevchenko wrote:
> On Thu, Jun 01, 2023 at 10:28:22PM +0800, Kent Gibson wrote:
> > On Thu, Jun 01, 2023 at 04:09:50PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > 
> > > Since version 3.11 egrep emits the following warning to stderr on startup:
> > > 
> > >   egrep: warning: egrep is obsolescent; using grep -E
> > > 
> > > This makes the tests fail (though that seems to depend on BATS version)
> > > so replace egrep with grep -E as suggested.
> > > 
> > 
> > That works for me, so I don't have any objections.
> > 
> > Though FWIW, my global sim cleanup script looks like:
> > 
> > find /sys/kernel/config/gpio-sim -type d -name hog -print0 2>/dev/null | xargs -0 -r rmdir
> > find /sys/kernel/config/gpio-sim -type d -name "line*" -print0  2>/dev/null | xargs -0 -r rmdir
> > find /sys/kernel/config/gpio-sim -type d -name "bank*" -print0 2>/dev/null | xargs -0 -r rmdir
> > rmdir /sys/kernel/config/gpio-sim/*
> > 
> > So no grep at all, just find and xargs.
> 
> Maybe you can even use -exec... :-)
> But I don't remember if it forks for each entry (and I don't remember by heart
> what -r does for xargs, which usually adds as many parameters as possible to
> the command line of the calling tool).
>

You can indeed.  The basic form execs for each file, but the '+' form
execs on the set, which is preferable in this case.

And the redirect is a hangover from a different form I was using
previously, so that isn't necessary either.

So

SIMDIR="/sys/kernel/config/gpio-sim/"
find $SIMDIR -type d -name hog -exec rmdir '{}' '+'
find $SIMDIR -type d -name "line*" -exec rmdir '{}' '+'
find $SIMDIR -type d -name "bank*" -exec rmdir '{}' '+'
rmdir $SIMDIR/*

is working for me.

On a related(??) note, I'm occasionally seeing Oopses when testing this
- when creating a basic sim with a shell script, not when deleting it.
In one case after a fresh reboot and on creating the first sim, so it
looks to be purely the construction.  Yay :-(.

Not sure if this is in anyway related to the other weirdness I've been
experiencing lately.  Wouldn't surprise me.

The aforementioned Oops:

Jun  2 09:49:58 firefly kernel: [  612.194725] gpio-522 (hogster): hogged as input
Jun  2 09:49:58 firefly kernel: [  612.194729] gpio-528 (breath): hogged as output/low
Jun  2 09:49:58 firefly kernel: [  612.213120] BUG: kernel NULL pointer dereference, address: 0000000000000080
Jun  2 09:49:58 firefly kernel: [  612.213436] #PF: supervisor read access in kernel mode
Jun  2 09:49:58 firefly kernel: [  612.213668] #PF: error_code(0x0000) - not-present page
Jun  2 09:49:58 firefly kernel: [  612.213899] PGD 800000015b18b067 P4D 800000015b18b067 PUD 102095067 PMD 0
Jun  2 09:49:58 firefly kernel: [  612.214193] Oops: 0000 [#1] PREEMPT SMP PTI
Jun  2 09:49:58 firefly kernel: [  612.214391] CPU: 3 PID: 25493 Comm: cc1 Not tainted 6.4.0-rc3 #22
Jun  2 09:49:58 firefly kernel: [  612.214657] Hardware name: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006
Jun  2 09:49:58 firefly kernel: [  612.215049] RIP: 0010:anon_vma_interval_tree_insert+0xd/0xc0
Jun  2 09:49:58 firefly kernel: [  612.215371] Code: 48 8d 70 c0 eb b5 0f 1f 80 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 48 8b 17 49 89 f8 49 89 f2 4d 8d 58 20 <48> 8b ba 80 00 00 00 48 8b 42 08 48 2b 02 48 c1 e8 0c 48 8d 74 07
Jun  2 09:49:58 firefly kernel: [  612.216127] RSP: 0018:ffff92138079fcc8 EFLAGS: 00010202
Jun  2 09:49:58 firefly kernel: [  612.216391] RAX: ffff8fb784053bc8 RBX: ffff92138079fd00 RCX: 000000008010000c
Jun  2 09:49:58 firefly kernel: [  612.216692] RDX: 0000000000000000 RSI: ffff8fb784053c18 RDI: ffff8fb747e7d400
Jun  2 09:49:58 firefly kernel: [  612.216991] RBP: ffff8fb747e7d400 R08: ffff8fb747e7d400 R09: ffffffffa9624c00
Jun  2 09:49:58 firefly kernel: [  612.217289] R10: ffff8fb784053c18 R11: ffff8fb747e7d420 R12: ffff8fb743699c80
Jun  2 09:49:58 firefly kernel: [  612.217589] R13: ffff8fb77fd19f78 R14: 00007fd1a0a99000 R15: 00000007fd1a0a93
Jun  2 09:49:58 firefly kernel: [  612.217891] FS:  00007fd1a0d81ac0(0000) GS:ffff8fb7d9d80000(0000) knlGS:0000000000000000
Jun  2 09:49:58 firefly kernel: [  612.218224] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jun  2 09:49:58 firefly kernel: [  612.218531] CR2: 0000000000000080 CR3: 000000013ff40000 CR4: 00000000000006e0
Jun  2 09:49:58 firefly kernel: [  612.218883] Call Trace:
Jun  2 09:49:58 firefly kernel: [  612.219086]  <TASK>
Jun  2 09:49:58 firefly kernel: [  612.219264]  vma_complete+0xba/0x270
Jun  2 09:49:58 firefly kernel: [  612.219496]  vma_expand+0x116/0x190
Jun  2 09:49:58 firefly kernel: [  612.219722]  mmap_region+0x781/0x9d0
Jun  2 09:49:58 firefly kernel: [  612.219974]  ? arch_get_unmapped_area_topdown+0xf6/0x230
Jun  2 09:49:58 firefly kernel: [  612.220274]  do_mmap+0x3ad/0x5d0
Jun  2 09:49:58 firefly kernel: [  612.220492]  vm_mmap_pgoff+0xd8/0x180
Jun  2 09:49:58 firefly kernel: [  612.220726]  do_syscall_64+0x3b/0x90
Jun  2 09:49:58 firefly kernel: [  612.220965]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
Jun  2 09:49:58 firefly kernel: [  612.221247] RIP: 0033:0x7fd1a0e790d2
Jun  2 09:49:58 firefly kernel: [  612.221477] Code: e4 e8 62 64 01 00 66 90 41 f7 c1 ff 0f 00 00 75 27 55 48 89 fd 53 89 cb 48 85 ff 74 3b 41 89 da 48 89 ef b8 09 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 66 5b 5d c3 0f 1f 00 48 8b 05 89 8d 0d 00 64
Jun  2 09:49:58 firefly kernel: [  612.222340] RSP: 002b:00007fff20f0a398 EFLAGS: 00000246 ORIG_RAX: 0000000000000009
Jun  2 09:49:58 firefly kernel: [  612.222759] RAX: ffffffffffffffda RBX: 0000000000000022 RCX: 00007fd1a0e790d2
Jun  2 09:49:58 firefly kernel: [  612.223111] RDX: 0000000000000003 RSI: 0000000000002000 RDI: 0000000000000000
Jun  2 09:49:58 firefly kernel: [  612.223463] RBP: 0000000000000000 R08: 00000000ffffffff R09: 0000000000000000
Jun  2 09:49:58 firefly kernel: [  612.223817] R10: 0000000000000022 R11: 0000000000000246 R12: 0000000000002000
Jun  2 09:49:58 firefly kernel: [  612.224195] R13: 0000000000000000 R14: 0000000000002000 R15: 000000000000000d
Jun  2 09:49:58 firefly kernel: [  612.224550]  </TASK>
Jun  2 09:49:58 firefly kernel: [  612.224728] Modules linked in: gpio_sim configfs
Jun  2 09:49:58 firefly kernel: [  612.224994] CR2: 0000000000000080
Jun  2 09:49:58 firefly kernel: [  612.225713] ---[ end trace 0000000000000000 ]---
Jun  2 09:49:58 firefly kernel: [  612.226407] RIP: 0010:anon_vma_interval_tree_insert+0xd/0xc0
Jun  2 09:49:58 firefly kernel: [  612.226912] Code: 48 8d 70 c0 eb b5 0f 1f 80 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 48 8b 17 49 89 f8 49 89 f2 4d 8d 58 20 <48> 8b ba 80 00 00 00 48 8b 42 08 48 2b 02 48 c1 e8 0c 48 8d 74 07
Jun  2 09:49:58 firefly kernel: [  612.228179] RSP: 0018:ffff92138079fcc8 EFLAGS: 00010202
Jun  2 09:49:58 firefly kernel: [  612.228464] RAX: ffff8fb784053bc8 RBX: ffff92138079fd00 RCX: 000000008010000c
Jun  2 09:49:58 firefly kernel: [  612.228815] RDX: 0000000000000000 RSI: ffff8fb784053c18 RDI: ffff8fb747e7d400
Jun  2 09:49:58 firefly kernel: [  612.229199] RBP: ffff8fb747e7d400 R08: ffff8fb747e7d400 R09: ffffffffa9624c00
Jun  2 09:49:58 firefly kernel: [  612.229555] R10: ffff8fb784053c18 R11: ffff8fb747e7d420 R12: ffff8fb743699c80
Jun  2 09:49:58 firefly kernel: [  612.229917] R13: ffff8fb77fd19f78 R14: 00007fd1a0a99000 R15: 00000007fd1a0a93
Jun  2 09:49:58 firefly kernel: [  612.230285] FS:  00007fd1a0d81ac0(0000) GS:ffff8fb7d9d80000(0000) knlGS:0000000000000000
Jun  2 09:49:58 firefly kernel: [  612.230733] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jun  2 09:49:58 firefly kernel: [  612.231040] CR2: 0000000000000080 CR3: 000000013ff40000 CR4: 00000000000006e0

Not sure where to go with that.  Will take another look at it later
unless someone can see something obvious that I'm missing.

Cheers,
Kent.
