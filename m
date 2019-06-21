Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6B8D4F01D
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2019 22:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726052AbfFUUrr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Jun 2019 16:47:47 -0400
Received: from smtprelay0017.hostedemail.com ([216.40.44.17]:47836 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725985AbfFUUrr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 21 Jun 2019 16:47:47 -0400
X-Greylist: delayed 491 seconds by postgrey-1.27 at vger.kernel.org; Fri, 21 Jun 2019 16:47:46 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave03.hostedemail.com (Postfix) with ESMTP id A9DC0180222AF;
        Fri, 21 Jun 2019 20:39:34 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id A98EA18224D93;
        Fri, 21 Jun 2019 20:39:33 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::::::::::::::::::::::::::::::,RULES_HIT:41:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1566:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3622:3865:3866:3871:4321:5007:6742:10004:10400:10848:11026:11232:11473:11658:11914:12043:12048:12296:12297:12438:12740:12760:12895:13019:13069:13311:13357:13439:14096:14097:14659:14721:21080:21627:30054:30091,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:28,LUA_SUMMARY:none
X-HE-Tag: space09_530743a0b544e
X-Filterd-Recvd-Size: 2484
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf16.hostedemail.com (Postfix) with ESMTPA;
        Fri, 21 Jun 2019 20:39:30 +0000 (UTC)
Message-ID: <67f6cd269684c9aa8463ff4812c3b4605e6739c3.camel@perches.com>
Subject: Re: [PATCH] pinctrl: qcom: sdm845: Fix CONFIG preprocessor guard
From:   Joe Perches <joe@perches.com>
To:     Nathan Chancellor <natechancellor@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Lee Jones <lee.jones@linaro.org>,
        Michal Simek <monstr@monstr.eu>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Darren Hart <dvhart@infradead.org>
Date:   Fri, 21 Jun 2019 13:39:28 -0700
In-Reply-To: <20190621202043.95967-1-natechancellor@gmail.com>
References: <20190621202043.95967-1-natechancellor@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 2019-06-21 at 13:20 -0700, Nathan Chancellor wrote:
> Clang warns when CONFIG_ACPI is unset:

Any of these others need the same s/#if/#ifdef/ ?

$ git grep -P '^\s*#\s*if\s+CONFIG_[A-Z0-9_]+\s*$' *
arch/microblaze/include/asm/exceptions.h:#if CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR
arch/microblaze/include/asm/hash.h:#if CONFIG_XILINX_MICROBLAZE0_USE_BARREL
arch/microblaze/include/asm/irqflags.h:#if CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR
arch/microblaze/kernel/entry-nommu.S:#if CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR
arch/microblaze/kernel/entry.S:#if CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR
arch/microblaze/kernel/entry.S:#if CONFIG_MANUAL_RESET_VECTOR
arch/microblaze/kernel/setup.c:#if CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR
arch/powerpc/platforms/powernv/pci.c:#if CONFIG_EEH
arch/x86/boot/compressed/misc.c:#if CONFIG_X86_NEED_RELOCS
arch/x86/boot/compressed/misc.h:#if CONFIG_RANDOMIZE_BASE
drivers/pinctrl/qcom/pinctrl-sdm845.c:#if CONFIG_ACPI
kernel/futex.c:#if CONFIG_BASE_SMALL



