Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2A1B4B5EF0
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Feb 2022 01:19:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232467AbiBOAT3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Feb 2022 19:19:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbiBOAT2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Feb 2022 19:19:28 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F30C112D0B2;
        Mon, 14 Feb 2022 16:19:15 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id m10so19242160oie.2;
        Mon, 14 Feb 2022 16:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vigjbAd4A51psNAPS184FB4plaCgqbr2pN1jkWgXy80=;
        b=BNs7vkHtt9VLM1N4LlIcHHg6tYxHCnXi+3PPp+VcYQv6EuWMA1yOuj9qkwCcatxj+n
         hNPEfn6HNkJP/ENMc4a1UMg/+ODyBqYNORpzKiaTi7DM0cmrEg9ZqmfuxtL0gY7rjimh
         SzWIFoW3SqmhOt8M15vHR4PDA2jMDPsSW1xLdWYesnVzyJUJSGQTfVoUPIO9q537JU/B
         s2ZmAIUXkByGKTUhRZt37xyF33bjwHmhohs4LeyDai0TO5slAGE3SEd8C8aFzmsjZG2y
         FZH82jA0fxcKpOt4/5BPMy9cTRIqw9rhu22J1O3T+WDLsn7sDCjhja7VkUEj8S9yWeor
         eU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vigjbAd4A51psNAPS184FB4plaCgqbr2pN1jkWgXy80=;
        b=0fynV+RsSZbZhkahlNpA0xmq6XR4Gr6+HD4f3Srqdh5wb5oEr5JiujUEnRx+TGgr3D
         XN/iNET9BkzYMYgwskrnznnCjOF/2BGZdmO6+eTXDvn4q91kaAFcAcrDmlZiLcHJar13
         tSAmDR9yH+dvvhDOY/gMCn2o1Oz/54UCTgrt70hNErRXkRszrLVJav+zmwTrApF0e/io
         roOABuyh7RlodkDJ/0XyyQwE7y6ttiU7ZBfgUC/zJzLygVgxUPnRJAVR905DiYCayO2q
         DwI9VrOwtCfgvWQjYXT6wSSmiYe2NNutLJGROPY0g48LHT47WelsPQhWOwbd7aEVlvlw
         ARtA==
X-Gm-Message-State: AOAM533AuxiSpsnh8HdyoipP83z/kPaCQHP9LilSWkzJx9/gdNAb65CY
        VuPjnHZC6VVOgNOy+bxCqI4=
X-Google-Smtp-Source: ABdhPJzzgxjIDcgxtpTh/E0JDtu7NmujEJ/62Th5MttZipaYO9YEtFfqmBgsoZqx4B80pfwKFpUogg==
X-Received: by 2002:a05:6808:1492:: with SMTP id e18mr668888oiw.110.1644884355222;
        Mon, 14 Feb 2022 16:19:15 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 128sm12752919oor.15.2022.02.14.16.19.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 16:19:14 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9516d8cf-864d-f7f0-bcc0-8cc329096824@roeck-us.net>
Date:   Mon, 14 Feb 2022 16:19:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH for 5.17] pinctrl-sunxi:
 sunxi_pinctrl_gpio_direction_in/output: use correct offset
Content-Language: en-US
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Florian Fainelli <f.fainelli@gmail.com>, 5kft <5kft@5kft.org>,
        Corentin Labbe <clabbe.montjoie@gmail.com>
References: <20211206131648.1521868-1-hverkuil-cisco@xs4all.nl>
 <0f536cd8-01db-5d16-2cec-ec6d19409a49@xs4all.nl>
 <20220213204242.GA991833@roeck-us.net>
 <80ba7281-3d51-3ba6-fcfe-df13171743cc@xs4all.nl>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <80ba7281-3d51-3ba6-fcfe-df13171743cc@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2/14/22 00:44, Hans Verkuil wrote:
> Hi Guenter,
> 
> On 2/13/22 21:42, Guenter Roeck wrote:
>> Hi,
>>
>> On Wed, Jan 26, 2022 at 12:02:04PM +0100, Hans Verkuil wrote:
>>> The commit that sets the direction directly without calling
>>> pinctrl_gpio_direction(), forgot to add chip->base to the offset when
>>> calling sunxi_pmx_gpio_set_direction().
>>>
>>> This caused failures for various Allwinner boards which have two
>>> GPIO blocks.
>>>
>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>> Reported-by: 5kft <5kft@5kft.org>
>>> Suggested-by: 5kft <5kft@5kft.org>
>>> Reported-by: Corentin Labbe <clabbe.montjoie@gmail.com>
>>> Fixes: 8df89a7cbc63 (pinctrl-sunxi: don't call pinctrl_gpio_direction())
>>> Tested-by: Corentin Labbe <clabbe.montjoie@gmail.com>
>>> Tested-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>>> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>>> Tested-by: Guenter Roeck <linux@roeck-us.net>
>>
>> Unfortunately, this patch causes (or exposes) a secondary problem.
>> When applied, the following traceback is seen during reboot.
> 
> I've been digging through the code, but I can't really see how this patch would
> give this result. The backtrace isn't very informative.
> 
> I suspect it ends up in sunxi_pinctrl_irq_set_wake(). Can you debug this a bit?
> Esp. logging the d->hwirq value would be useful (and comparing it with and without
> this patch). Of course, I may be wrong and the issue isn't in that function at all.
> 
> One possibility is that there is another offset missing somewhere in this code
> that hasn't been noticed before.
> 

Turns out the real 'culprit' is commit 145988cff2a1 ("ARM: dts: sun8i: Adjust power
key nodes") which introduces wakeup-source for orangepi-pc and with it the call to
sunxi_pinctrl_irq_set_wake and the warning traceback.

Guenter

> Regards,
> 
> 	Hans
> 
>>
>> Requesting system reboot
>> [   30.899594]
>> [   30.899685] ============================================
>> [   30.899757] WARNING: possible recursive locking detected
>> [   30.899938] 5.17.0-rc3-00394-gc849047c2473 #1 Not tainted
>> [   30.900055] --------------------------------------------
>> [   30.900124] init/307 is trying to acquire lock:
>> [   30.900246] c2dfe27c (&irq_desc_lock_class){-.-.}-{2:2}, at: __irq_get_desc_lock+0x58/0xa0
>> [   30.900900]
>> [   30.900900] but task is already holding lock:
>> [   30.900974] c3c0ac7c (&irq_desc_lock_class){-.-.}-{2:2}, at: __irq_get_desc_lock+0x58/0xa0
>> [   30.901101]
>> [   30.901101] other info that might help us debug this:
>> [   30.901188]  Possible unsafe locking scenario:
>> [   30.901188]
>> [   30.901262]        CPU0
>> [   30.901301]        ----
>> [   30.901339]   lock(&irq_desc_lock_class);
>> [   30.901411]   lock(&irq_desc_lock_class);
>> [   30.901480]
>> [   30.901480]  *** DEADLOCK ***
>> [   30.901480]
>> [   30.901554]  May be due to missing lock nesting notation
>> [   30.901554]
>> [   30.901657] 4 locks held by init/307:
>> [   30.901724]  #0: c1f29f18 (system_transition_mutex){+.+.}-{3:3}, at: __do_sys_reboot+0x90/0x23c
>> [   30.901889]  #1: c20f7760 (&dev->mutex){....}-{3:3}, at: device_shutdown+0xf4/0x224
>> [   30.902016]  #2: c2e804d8 (&dev->mutex){....}-{3:3}, at: device_shutdown+0x104/0x224
>> [   30.902138]  #3: c3c0ac7c (&irq_desc_lock_class){-.-.}-{2:2}, at: __irq_get_desc_lock+0x58/0xa0
>> [   30.902281]
>> [   30.902281] stack backtrace:
>> [   30.902462] CPU: 0 PID: 307 Comm: init Not tainted 5.17.0-rc3-00394-gc849047c2473 #1
>> [   30.902572] Hardware name: Allwinner sun8i Family
>> [   30.902781]  unwind_backtrace from show_stack+0x10/0x14
>> [   30.902895]  show_stack from dump_stack_lvl+0x68/0x90
>> [   30.902970]  dump_stack_lvl from __lock_acquire+0x1680/0x31a0
>> [   30.903047]  __lock_acquire from lock_acquire+0x148/0x3dc
>> [   30.903118]  lock_acquire from _raw_spin_lock_irqsave+0x50/0x6c
>> [   30.903197]  _raw_spin_lock_irqsave from __irq_get_desc_lock+0x58/0xa0
>> [   30.903282]  __irq_get_desc_lock from irq_set_irq_wake+0x2c/0x19c
>> [   30.903366]  irq_set_irq_wake from irq_set_irq_wake+0x13c/0x19c
>> [   30.903442]  irq_set_irq_wake from gpio_keys_suspend+0x80/0x1a4
>> [   30.903523]  gpio_keys_suspend from gpio_keys_shutdown+0x10/0x2c
>> [   30.903603]  gpio_keys_shutdown from device_shutdown+0x180/0x224
>> [   30.903685]  device_shutdown from __do_sys_reboot+0x134/0x23c
>> [   30.903764]  __do_sys_reboot from ret_fast_syscall+0x0/0x1c
>> [   30.903894] Exception stack(0xc584ffa8 to 0xc584fff0)
>> [   30.904013] ffa0:                   01234567 000c623f fee1dead 28121969 01234567 00000000
>> [   30.904117] ffc0: 01234567 000c623f 00000001 00000058 000d85c0 00000000 00000000 00000000
>> [   30.904213] ffe0: 000d8298 be84ddf4 000918bc b6eb0edc
>> [   30.905189] reboot: Restarting system
>> ------------
>>
>> Bisect log is attached.
>>
>> Guenter
>>
>> ---
>> # bad: [c849047c2473f78306791b27ec7c3e0ed552727d] Merge branch 'for-linux-next-fixes' of git://anongit.freedesktop.org/drm/drm-misc
>> # good: [dfd42facf1e4ada021b939b4e19c935dcdd55566] Linux 5.17-rc3
>> git bisect start 'HEAD' 'v5.17-rc3'
>> # good: [a0eafda3873b900f2bfa2bac738583493b458338] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec.git
>> git bisect good a0eafda3873b900f2bfa2bac738583493b458338
>> # good: [b7bbfc1f46f45e896928c301cd02fb530ed426f3] Merge branch 'fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git
>> git bisect good b7bbfc1f46f45e896928c301cd02fb530ed426f3
>> # bad: [2af1645572f8fef201a7d2a891f328ed94509135] Merge branch 'rtc-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git
>> git bisect bad 2af1645572f8fef201a7d2a891f328ed94509135
>> # bad: [e3d76bb86c683b05afe4a3b73fd1d50ea7a294be] Merge branch 'hwmon' of git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
>> git bisect bad e3d76bb86c683b05afe4a3b73fd1d50ea7a294be
>> # good: [b55a65e66f178b3507554260b4f3d56bc7b445b6] Merge branch 'fixes' of git://linuxtv.org/mchehab/media-next.git
>> git bisect good b55a65e66f178b3507554260b4f3d56bc7b445b6
>> # good: [2b0ecccb55310a4b8ad5d59c703cf8c821be6260] KVM: x86: nSVM: deal with L1 hypervisor that intercepts interrupts but lets L2 control them
>> git bisect good 2b0ecccb55310a4b8ad5d59c703cf8c821be6260
>> # good: [fcb732d8f8cf6084f8480015ad41d25fb023a4dd] KVM: x86/xen: Fix runstate updates to be atomic when preempting vCPU
>> git bisect good fcb732d8f8cf6084f8480015ad41d25fb023a4dd
>> # bad: [bb9bb9c75482aa008cfc62b5cb88681de8408fa3] hwmon: (ntc_thermistor) Underscore Samsung thermistor
>> git bisect bad bb9bb9c75482aa008cfc62b5cb88681de8408fa3
>> # bad: [3c5412cdec9f6e417e7757974040e461df4a7238] pinctrl-sunxi: sunxi_pinctrl_gpio_direction_in/output: use correct offset
>> git bisect bad 3c5412cdec9f6e417e7757974040e461df4a7238
>> # first bad commit: [3c5412cdec9f6e417e7757974040e461df4a7238] pinctrl-sunxi: sunxi_pinctrl_gpio_direction_in/output: use correct offset

