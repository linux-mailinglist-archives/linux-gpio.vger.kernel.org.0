Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B13ED4B44A0
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Feb 2022 09:44:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241454AbiBNIos (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Feb 2022 03:44:48 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231406AbiBNIos (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Feb 2022 03:44:48 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D5AF4F9CA;
        Mon, 14 Feb 2022 00:44:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3AFB7B80DAD;
        Mon, 14 Feb 2022 08:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D6F3C340E9;
        Mon, 14 Feb 2022 08:44:35 +0000 (UTC)
Message-ID: <80ba7281-3d51-3ba6-fcfe-df13171743cc@xs4all.nl>
Date:   Mon, 14 Feb 2022 09:44:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH for 5.17] pinctrl-sunxi:
 sunxi_pinctrl_gpio_direction_in/output: use correct offset
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-media@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Florian Fainelli <f.fainelli@gmail.com>, 5kft <5kft@5kft.org>,
        Corentin Labbe <clabbe.montjoie@gmail.com>
References: <20211206131648.1521868-1-hverkuil-cisco@xs4all.nl>
 <0f536cd8-01db-5d16-2cec-ec6d19409a49@xs4all.nl>
 <20220213204242.GA991833@roeck-us.net>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220213204242.GA991833@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Guenter,

On 2/13/22 21:42, Guenter Roeck wrote:
> Hi,
> 
> On Wed, Jan 26, 2022 at 12:02:04PM +0100, Hans Verkuil wrote:
>> The commit that sets the direction directly without calling
>> pinctrl_gpio_direction(), forgot to add chip->base to the offset when
>> calling sunxi_pmx_gpio_set_direction().
>>
>> This caused failures for various Allwinner boards which have two
>> GPIO blocks.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Reported-by: 5kft <5kft@5kft.org>
>> Suggested-by: 5kft <5kft@5kft.org>
>> Reported-by: Corentin Labbe <clabbe.montjoie@gmail.com>
>> Fixes: 8df89a7cbc63 (pinctrl-sunxi: don't call pinctrl_gpio_direction())
>> Tested-by: Corentin Labbe <clabbe.montjoie@gmail.com>
>> Tested-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>> Tested-by: Guenter Roeck <linux@roeck-us.net>
> 
> Unfortunately, this patch causes (or exposes) a secondary problem.
> When applied, the following traceback is seen during reboot.

I've been digging through the code, but I can't really see how this patch would
give this result. The backtrace isn't very informative.

I suspect it ends up in sunxi_pinctrl_irq_set_wake(). Can you debug this a bit?
Esp. logging the d->hwirq value would be useful (and comparing it with and without
this patch). Of course, I may be wrong and the issue isn't in that function at all.

One possibility is that there is another offset missing somewhere in this code
that hasn't been noticed before.

Regards,

	Hans

> 
> Requesting system reboot
> [   30.899594]
> [   30.899685] ============================================
> [   30.899757] WARNING: possible recursive locking detected
> [   30.899938] 5.17.0-rc3-00394-gc849047c2473 #1 Not tainted
> [   30.900055] --------------------------------------------
> [   30.900124] init/307 is trying to acquire lock:
> [   30.900246] c2dfe27c (&irq_desc_lock_class){-.-.}-{2:2}, at: __irq_get_desc_lock+0x58/0xa0
> [   30.900900]
> [   30.900900] but task is already holding lock:
> [   30.900974] c3c0ac7c (&irq_desc_lock_class){-.-.}-{2:2}, at: __irq_get_desc_lock+0x58/0xa0
> [   30.901101]
> [   30.901101] other info that might help us debug this:
> [   30.901188]  Possible unsafe locking scenario:
> [   30.901188]
> [   30.901262]        CPU0
> [   30.901301]        ----
> [   30.901339]   lock(&irq_desc_lock_class);
> [   30.901411]   lock(&irq_desc_lock_class);
> [   30.901480]
> [   30.901480]  *** DEADLOCK ***
> [   30.901480]
> [   30.901554]  May be due to missing lock nesting notation
> [   30.901554]
> [   30.901657] 4 locks held by init/307:
> [   30.901724]  #0: c1f29f18 (system_transition_mutex){+.+.}-{3:3}, at: __do_sys_reboot+0x90/0x23c
> [   30.901889]  #1: c20f7760 (&dev->mutex){....}-{3:3}, at: device_shutdown+0xf4/0x224
> [   30.902016]  #2: c2e804d8 (&dev->mutex){....}-{3:3}, at: device_shutdown+0x104/0x224
> [   30.902138]  #3: c3c0ac7c (&irq_desc_lock_class){-.-.}-{2:2}, at: __irq_get_desc_lock+0x58/0xa0
> [   30.902281]
> [   30.902281] stack backtrace:
> [   30.902462] CPU: 0 PID: 307 Comm: init Not tainted 5.17.0-rc3-00394-gc849047c2473 #1
> [   30.902572] Hardware name: Allwinner sun8i Family
> [   30.902781]  unwind_backtrace from show_stack+0x10/0x14
> [   30.902895]  show_stack from dump_stack_lvl+0x68/0x90
> [   30.902970]  dump_stack_lvl from __lock_acquire+0x1680/0x31a0
> [   30.903047]  __lock_acquire from lock_acquire+0x148/0x3dc
> [   30.903118]  lock_acquire from _raw_spin_lock_irqsave+0x50/0x6c
> [   30.903197]  _raw_spin_lock_irqsave from __irq_get_desc_lock+0x58/0xa0
> [   30.903282]  __irq_get_desc_lock from irq_set_irq_wake+0x2c/0x19c
> [   30.903366]  irq_set_irq_wake from irq_set_irq_wake+0x13c/0x19c
> [   30.903442]  irq_set_irq_wake from gpio_keys_suspend+0x80/0x1a4
> [   30.903523]  gpio_keys_suspend from gpio_keys_shutdown+0x10/0x2c
> [   30.903603]  gpio_keys_shutdown from device_shutdown+0x180/0x224
> [   30.903685]  device_shutdown from __do_sys_reboot+0x134/0x23c
> [   30.903764]  __do_sys_reboot from ret_fast_syscall+0x0/0x1c
> [   30.903894] Exception stack(0xc584ffa8 to 0xc584fff0)
> [   30.904013] ffa0:                   01234567 000c623f fee1dead 28121969 01234567 00000000
> [   30.904117] ffc0: 01234567 000c623f 00000001 00000058 000d85c0 00000000 00000000 00000000
> [   30.904213] ffe0: 000d8298 be84ddf4 000918bc b6eb0edc
> [   30.905189] reboot: Restarting system
> ------------
> 
> Bisect log is attached.
> 
> Guenter
> 
> ---
> # bad: [c849047c2473f78306791b27ec7c3e0ed552727d] Merge branch 'for-linux-next-fixes' of git://anongit.freedesktop.org/drm/drm-misc
> # good: [dfd42facf1e4ada021b939b4e19c935dcdd55566] Linux 5.17-rc3
> git bisect start 'HEAD' 'v5.17-rc3'
> # good: [a0eafda3873b900f2bfa2bac738583493b458338] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec.git
> git bisect good a0eafda3873b900f2bfa2bac738583493b458338
> # good: [b7bbfc1f46f45e896928c301cd02fb530ed426f3] Merge branch 'fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git
> git bisect good b7bbfc1f46f45e896928c301cd02fb530ed426f3
> # bad: [2af1645572f8fef201a7d2a891f328ed94509135] Merge branch 'rtc-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git
> git bisect bad 2af1645572f8fef201a7d2a891f328ed94509135
> # bad: [e3d76bb86c683b05afe4a3b73fd1d50ea7a294be] Merge branch 'hwmon' of git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
> git bisect bad e3d76bb86c683b05afe4a3b73fd1d50ea7a294be
> # good: [b55a65e66f178b3507554260b4f3d56bc7b445b6] Merge branch 'fixes' of git://linuxtv.org/mchehab/media-next.git
> git bisect good b55a65e66f178b3507554260b4f3d56bc7b445b6
> # good: [2b0ecccb55310a4b8ad5d59c703cf8c821be6260] KVM: x86: nSVM: deal with L1 hypervisor that intercepts interrupts but lets L2 control them
> git bisect good 2b0ecccb55310a4b8ad5d59c703cf8c821be6260
> # good: [fcb732d8f8cf6084f8480015ad41d25fb023a4dd] KVM: x86/xen: Fix runstate updates to be atomic when preempting vCPU
> git bisect good fcb732d8f8cf6084f8480015ad41d25fb023a4dd
> # bad: [bb9bb9c75482aa008cfc62b5cb88681de8408fa3] hwmon: (ntc_thermistor) Underscore Samsung thermistor
> git bisect bad bb9bb9c75482aa008cfc62b5cb88681de8408fa3
> # bad: [3c5412cdec9f6e417e7757974040e461df4a7238] pinctrl-sunxi: sunxi_pinctrl_gpio_direction_in/output: use correct offset
> git bisect bad 3c5412cdec9f6e417e7757974040e461df4a7238
> # first bad commit: [3c5412cdec9f6e417e7757974040e461df4a7238] pinctrl-sunxi: sunxi_pinctrl_gpio_direction_in/output: use correct offset
