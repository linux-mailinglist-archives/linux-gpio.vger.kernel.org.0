Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4901E4B3D80
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Feb 2022 21:42:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238245AbiBMUmx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Feb 2022 15:42:53 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230399AbiBMUmw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Feb 2022 15:42:52 -0500
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C125370E;
        Sun, 13 Feb 2022 12:42:45 -0800 (PST)
Received: by mail-oo1-xc29.google.com with SMTP id u25-20020a4ad0d9000000b002e8d4370689so17140544oor.12;
        Sun, 13 Feb 2022 12:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XlZa8N85NaHQIc3D0Q9JnGMSA7U69h+ab4jlKaTao84=;
        b=HrnhE55cXZXfJVFb75jzws6Kkskde6YY6ihc3Mp7OLuoTj/5oCvBOw3VZpOlqEkrGT
         P66wIEYLUiKBhblPpO3bSMpKPEACyxsAmLhNX1J1RKwAf9s0XdHqebErwqZTiND05iE1
         NvY4ID5YVdOe+M3Z7J9vaxGnhsx98JZFIVqGIl+5nTucZCW6ZT1Vy50Vi5FAQHhnybDf
         rhejo2V9KhZuPD8afoAvzDrXn2H9cdAcA4cSOjYftgjKaclygwkOHFvTPykzFi98vW1j
         1HqlM6HCNVsTHEs5OdgMJAtty1mSkGPK4n/X5XYfFs/SIERqxjtq48vLkLDOxXrv/r3M
         0UAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=XlZa8N85NaHQIc3D0Q9JnGMSA7U69h+ab4jlKaTao84=;
        b=Z4QzU37c0sM75+vbxm7gXToyGVogwZy+KMGLWeKMJVOzdU36e5hKdrtm/ACSJ5RCKl
         dlv8cIbAe7jzyyjS7u6zCdvaS8RFq6gc1tVJleSg+2HRbaXoJtOxbTxJ8ND1O5xymQHI
         Bt/4jVKe0VxGdEV23CL2viQx084gplewQ+VdCBV3heAPGBQAE+1SZWB00qLPAk80shqK
         YACIW2MzH6u411T/FwPmps17uBIPAGIrUzSHUBeLzxFXqyiHYSIrmd7ZNyfV9uTt4SLU
         /fuPSB7HU6h7E6jSxQZq7RlXKOfGnFMCp/PbUUpHtfYf015rIep2le7sXcTtZ67jJlWS
         J7yA==
X-Gm-Message-State: AOAM531AqrkHYSPxvHHJ4t3qBV5Gu6t0vrFm/cqTj/x842Pgu7E09MHM
        +8uhRM8mqy2TliXUnbsG9SzyS9iHtrT1Pg==
X-Google-Smtp-Source: ABdhPJzbM/DVb9fIuxhUVklabfb8RGnOp1UpskEVJ0szMd7M/PwSDC2HhacdXfJhYV+InPMJXkL04Q==
X-Received: by 2002:a4a:8969:: with SMTP id g38mr3704511ooi.81.1644784965257;
        Sun, 13 Feb 2022 12:42:45 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z20sm4673970oap.17.2022.02.13.12.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Feb 2022 12:42:44 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 13 Feb 2022 12:42:42 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Florian Fainelli <f.fainelli@gmail.com>, 5kft <5kft@5kft.org>,
        Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: Re: [PATCH for 5.17] pinctrl-sunxi:
 sunxi_pinctrl_gpio_direction_in/output: use correct offset
Message-ID: <20220213204242.GA991833@roeck-us.net>
References: <20211206131648.1521868-1-hverkuil-cisco@xs4all.nl>
 <0f536cd8-01db-5d16-2cec-ec6d19409a49@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f536cd8-01db-5d16-2cec-ec6d19409a49@xs4all.nl>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Wed, Jan 26, 2022 at 12:02:04PM +0100, Hans Verkuil wrote:
> The commit that sets the direction directly without calling
> pinctrl_gpio_direction(), forgot to add chip->base to the offset when
> calling sunxi_pmx_gpio_set_direction().
> 
> This caused failures for various Allwinner boards which have two
> GPIO blocks.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Reported-by: 5kft <5kft@5kft.org>
> Suggested-by: 5kft <5kft@5kft.org>
> Reported-by: Corentin Labbe <clabbe.montjoie@gmail.com>
> Fixes: 8df89a7cbc63 (pinctrl-sunxi: don't call pinctrl_gpio_direction())
> Tested-by: Corentin Labbe <clabbe.montjoie@gmail.com>
> Tested-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Tested-by: Guenter Roeck <linux@roeck-us.net>

Unfortunately, this patch causes (or exposes) a secondary problem.
When applied, the following traceback is seen during reboot.

Requesting system reboot
[   30.899594]
[   30.899685] ============================================
[   30.899757] WARNING: possible recursive locking detected
[   30.899938] 5.17.0-rc3-00394-gc849047c2473 #1 Not tainted
[   30.900055] --------------------------------------------
[   30.900124] init/307 is trying to acquire lock:
[   30.900246] c2dfe27c (&irq_desc_lock_class){-.-.}-{2:2}, at: __irq_get_desc_lock+0x58/0xa0
[   30.900900]
[   30.900900] but task is already holding lock:
[   30.900974] c3c0ac7c (&irq_desc_lock_class){-.-.}-{2:2}, at: __irq_get_desc_lock+0x58/0xa0
[   30.901101]
[   30.901101] other info that might help us debug this:
[   30.901188]  Possible unsafe locking scenario:
[   30.901188]
[   30.901262]        CPU0
[   30.901301]        ----
[   30.901339]   lock(&irq_desc_lock_class);
[   30.901411]   lock(&irq_desc_lock_class);
[   30.901480]
[   30.901480]  *** DEADLOCK ***
[   30.901480]
[   30.901554]  May be due to missing lock nesting notation
[   30.901554]
[   30.901657] 4 locks held by init/307:
[   30.901724]  #0: c1f29f18 (system_transition_mutex){+.+.}-{3:3}, at: __do_sys_reboot+0x90/0x23c
[   30.901889]  #1: c20f7760 (&dev->mutex){....}-{3:3}, at: device_shutdown+0xf4/0x224
[   30.902016]  #2: c2e804d8 (&dev->mutex){....}-{3:3}, at: device_shutdown+0x104/0x224
[   30.902138]  #3: c3c0ac7c (&irq_desc_lock_class){-.-.}-{2:2}, at: __irq_get_desc_lock+0x58/0xa0
[   30.902281]
[   30.902281] stack backtrace:
[   30.902462] CPU: 0 PID: 307 Comm: init Not tainted 5.17.0-rc3-00394-gc849047c2473 #1
[   30.902572] Hardware name: Allwinner sun8i Family
[   30.902781]  unwind_backtrace from show_stack+0x10/0x14
[   30.902895]  show_stack from dump_stack_lvl+0x68/0x90
[   30.902970]  dump_stack_lvl from __lock_acquire+0x1680/0x31a0
[   30.903047]  __lock_acquire from lock_acquire+0x148/0x3dc
[   30.903118]  lock_acquire from _raw_spin_lock_irqsave+0x50/0x6c
[   30.903197]  _raw_spin_lock_irqsave from __irq_get_desc_lock+0x58/0xa0
[   30.903282]  __irq_get_desc_lock from irq_set_irq_wake+0x2c/0x19c
[   30.903366]  irq_set_irq_wake from irq_set_irq_wake+0x13c/0x19c
[   30.903442]  irq_set_irq_wake from gpio_keys_suspend+0x80/0x1a4
[   30.903523]  gpio_keys_suspend from gpio_keys_shutdown+0x10/0x2c
[   30.903603]  gpio_keys_shutdown from device_shutdown+0x180/0x224
[   30.903685]  device_shutdown from __do_sys_reboot+0x134/0x23c
[   30.903764]  __do_sys_reboot from ret_fast_syscall+0x0/0x1c
[   30.903894] Exception stack(0xc584ffa8 to 0xc584fff0)
[   30.904013] ffa0:                   01234567 000c623f fee1dead 28121969 01234567 00000000
[   30.904117] ffc0: 01234567 000c623f 00000001 00000058 000d85c0 00000000 00000000 00000000
[   30.904213] ffe0: 000d8298 be84ddf4 000918bc b6eb0edc
[   30.905189] reboot: Restarting system
------------

Bisect log is attached.

Guenter

---
# bad: [c849047c2473f78306791b27ec7c3e0ed552727d] Merge branch 'for-linux-next-fixes' of git://anongit.freedesktop.org/drm/drm-misc
# good: [dfd42facf1e4ada021b939b4e19c935dcdd55566] Linux 5.17-rc3
git bisect start 'HEAD' 'v5.17-rc3'
# good: [a0eafda3873b900f2bfa2bac738583493b458338] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec.git
git bisect good a0eafda3873b900f2bfa2bac738583493b458338
# good: [b7bbfc1f46f45e896928c301cd02fb530ed426f3] Merge branch 'fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git
git bisect good b7bbfc1f46f45e896928c301cd02fb530ed426f3
# bad: [2af1645572f8fef201a7d2a891f328ed94509135] Merge branch 'rtc-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git
git bisect bad 2af1645572f8fef201a7d2a891f328ed94509135
# bad: [e3d76bb86c683b05afe4a3b73fd1d50ea7a294be] Merge branch 'hwmon' of git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
git bisect bad e3d76bb86c683b05afe4a3b73fd1d50ea7a294be
# good: [b55a65e66f178b3507554260b4f3d56bc7b445b6] Merge branch 'fixes' of git://linuxtv.org/mchehab/media-next.git
git bisect good b55a65e66f178b3507554260b4f3d56bc7b445b6
# good: [2b0ecccb55310a4b8ad5d59c703cf8c821be6260] KVM: x86: nSVM: deal with L1 hypervisor that intercepts interrupts but lets L2 control them
git bisect good 2b0ecccb55310a4b8ad5d59c703cf8c821be6260
# good: [fcb732d8f8cf6084f8480015ad41d25fb023a4dd] KVM: x86/xen: Fix runstate updates to be atomic when preempting vCPU
git bisect good fcb732d8f8cf6084f8480015ad41d25fb023a4dd
# bad: [bb9bb9c75482aa008cfc62b5cb88681de8408fa3] hwmon: (ntc_thermistor) Underscore Samsung thermistor
git bisect bad bb9bb9c75482aa008cfc62b5cb88681de8408fa3
# bad: [3c5412cdec9f6e417e7757974040e461df4a7238] pinctrl-sunxi: sunxi_pinctrl_gpio_direction_in/output: use correct offset
git bisect bad 3c5412cdec9f6e417e7757974040e461df4a7238
# first bad commit: [3c5412cdec9f6e417e7757974040e461df4a7238] pinctrl-sunxi: sunxi_pinctrl_gpio_direction_in/output: use correct offset
