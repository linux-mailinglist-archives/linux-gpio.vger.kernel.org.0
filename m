Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FFDE21B251
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2020 11:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbgGJJcC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jul 2020 05:32:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:51484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726615AbgGJJcC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 10 Jul 2020 05:32:02 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C58B820725;
        Fri, 10 Jul 2020 09:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594373521;
        bh=2ioudtQc6QQppoHtkDmhZJNHdLY6ybvVTlBgojYMHAU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=XCbqTxHSBzXfpY3U1m9jI4jXf6emvK+4iahRI2bxaAoST0EHYJNUPvO1d1jj34BGr
         DXyavBdTCzTKgejhEHNZJA53gVjJFs6slXrEfVf5eQET6XyLC4l7rrAxJviyX4Q3di
         vZ8okrQej6ZqMytVCGwX+3yeKiZNkIhm+HNP//ds=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=wait-a-minute.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jtpNw-00AdQt-9k; Fri, 10 Jul 2020 10:32:00 +0100
Date:   Fri, 10 Jul 2020 10:31:59 +0100
Message-ID: <87imevemwg.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Alexandre Torgue <alexandre.torgue@st.com>,
        kernel test robot <lkp@intel.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>, kbuild-all@lists.01.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, marex@denx.de
Subject: Re: [PATCH] irqchip/stm32-exti: map direct event to irq parent
In-Reply-To: <202007081232.bA2RH80f%lkp@intel.com>
References: <20200706081106.25125-1-alexandre.torgue@st.com>
        <202007081232.bA2RH80f%lkp@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 EasyPG/1.0.0 Emacs/26.3
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: alexandre.torgue@st.com, lkp@intel.com, tglx@linutronix.de, jason@lakedaemon.net, kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, marex@denx.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Alexandre,

On Wed, 08 Jul 2020 05:57:24 +0100,
kernel test robot <lkp@intel.com> wrote:
> 
> [1  <text/plain; us-ascii (7bit)>]
> Hi Alexandre,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on stm32/stm32-next]
> [also build test WARNING on soc/for-next v5.8-rc4 next-20200707]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use  as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Alexandre-Torgue/irqchip-stm32-exti-map-direct-event-to-irq-parent/20200706-161327
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
> config: arm-randconfig-s031-20200707 (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.2-31-gabbfd661-dirty
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=arm 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from include/linux/build_bug.h:5,
>                     from include/linux/bits.h:23,
>                     from include/linux/bitops.h:5,
>                     from drivers/irqchip/irq-stm32-exti.c:8:
>    drivers/irqchip/irq-stm32-exti.c: In function 'stm32_exti_h_domain_alloc':
>    drivers/irqchip/irq-stm32-exti.c:683:23: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
>      683 |  if (desc->irq_parent >= 0) {
>          |                       ^~
>    include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
>       58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
>          |                                                    ^~~~
> >> drivers/irqchip/irq-stm32-exti.c:683:2: note: in expansion of macro 'if'
>      683 |  if (desc->irq_parent >= 0) {

Do you plan to address this? Looks like an actual bug to me.

	M.

-- 
Without deviation from the norm, progress is not possible.
