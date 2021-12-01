Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25387464ACF
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Dec 2021 10:41:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242223AbhLAJoa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Dec 2021 04:44:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231128AbhLAJoa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Dec 2021 04:44:30 -0500
X-Greylist: delayed 65 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 01 Dec 2021 01:41:09 PST
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::1b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FEFDC061574
        for <linux-gpio@vger.kernel.org>; Wed,  1 Dec 2021 01:41:09 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id sM5lmWddZyGz2sM5pmJ3HC; Wed, 01 Dec 2021 10:40:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1638351601; bh=MIRCejMF6ZscMkjdXs+qRGdWXYA4s7sGtv6GxyroWWg=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=tV+N8BSvvOoZFBCtFtm7UU91bnzEkpFlMpCFXZ0xflDgLoeWQdRRYGxChnPOj4bUd
         ZMpIe6wTbL78La+hFn+okaKGdPgC44uNy6ZXl+SG3M0/K1WTXZo//+WsZdMD1Cn+FL
         MRGgnOosEhF9LZjCBJl74Lq4pbp8SbGYCbALHwpOYHDdEKX/o1f5e1wpA8wa8kh7i9
         ddAELt9ies31pZG05p67F95BrXr1h5j+oA59mXkb1j4JEym7JdE0Etd8jIiNOeaR7B
         wQX1Ed730qMzdB8uOkJEk6+36fMnBAqzjQLJ1L4MvanKBPXrPsm1Ot91ypbfzqKzEn
         Tf7sHskVWkLWQ==
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: gpiod_set_value(): BUG: sleeping function called from invalid context
Message-ID: <a06e7c55-f25d-8339-faea-9be6d31d1c87@xs4all.nl>
Date:   Wed, 1 Dec 2021 10:39:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfP8J9oR23Ve08neFWTVJdWKdo6vOTLlDRWDXza6+2HKMKRoLgz50T3DkULNzosNABiX34yTvfbeqw4hYA/ILsajZJQxGW+LLuSSJTDIKOJRpF9QNYjSd
 zR2AfLbYawBFDl29QcJwBOv+J+78WvK6YahkYoupxQBTajuEuNwpHnPHRgdYis4qXMtFgCWKG17qSy6RSVmCM+mtfr8v+p76TpHpj2VuPzL2kVBlmB7cB4la
 PiTSJX/mvcCWR7k7XF4hMPUvH3ufYJefHmkznIS7+oM=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi all,

While testing the media cec-gpio driver on a Raspberry Pi 4B with CONFIG_DEBUG_ATOMIC_SLEEP
set I got this stack trace:

[ 1674.731319] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:281
[ 1674.739891] in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 0, name: swapper/3
[ 1674.748011] Preemption disabled at:
[ 1674.748015] [<ffff80001019887c>] find_vm_area+0x28/0x9c
[ 1674.756851] CPU: 3 PID: 0 Comm: swapper/3 Tainted: G         C        5.14.0-hdmi-dbg #58
[ 1674.765149] Hardware name: Raspberry Pi 4 Model B Rev 1.4 (DT)
[ 1674.771061] Call trace:
[ 1674.773534]  dump_backtrace+0x0/0x1b0
[ 1674.777251]  show_stack+0x18/0x24
[ 1674.780612]  dump_stack_lvl+0x68/0x84
[ 1674.784326]  dump_stack+0x18/0x34
[ 1674.787685]  ___might_sleep+0x148/0x180
[ 1674.791572]  __might_sleep+0x54/0x90
[ 1674.795195]  mutex_lock+0x28/0x80
[ 1674.798556]  pinctrl_get_device_gpio_range+0x3c/0x110
[ 1674.803677]  pinctrl_gpio_direction+0x3c/0xd0
[ 1674.808093]  pinctrl_gpio_direction_output+0x14/0x20
[ 1674.813124]  bcm2835_gpio_direction_output+0x64/0x80
[ 1674.818160]  gpio_set_open_drain_value_commit+0x6c/0xf0
[ 1674.823458]  gpiod_set_value_nocheck+0x8c/0xb0
[ 1674.827961]  gpiod_set_value+0x4c/0xd0
[ 1674.831760]  cec_gpio_low+0x34/0x40
[ 1674.835295]  cec_pin_timer+0x58c/0x11c4
[ 1674.839182]  __hrtimer_run_queues+0x140/0x1e0
[ 1674.843602]  hrtimer_interrupt+0xf4/0x2cc
[ 1674.847668]  arch_timer_handler_phys+0x38/0x50
[ 1674.852174]  handle_percpu_devid_irq+0x9c/0x160
[ 1674.856768]  handle_domain_irq+0x98/0xe4
[ 1674.860742]  gic_handle_irq+0x4c/0xd0
[ 1674.864452]  call_on_irq_stack+0x2c/0x5c
[ 1674.868428]  do_interrupt_handler+0x54/0x60
[ 1674.872669]  el1_interrupt+0x30/0x80
[ 1674.876291]  el1h_64_irq_handler+0x18/0x24
[ 1674.880443]  el1h_64_irq+0x78/0x7c
[ 1674.883889]  arch_cpu_idle+0x18/0x2c
[ 1674.887512]  default_idle_call+0x28/0x74
[ 1674.891486]  do_idle+0x23c/0x27c
[ 1674.894754]  cpu_startup_entry+0x24/0x70
[ 1674.898725]  secondary_start_kernel+0x140/0x164
[ 1674.903315]  __secondary_switched+0x94/0x98

The drivers/media/cec/platform/cec-gpio/cec-gpio.c driver uses an open drain
gpio connected to the HDMI CEC pin. From the dts:

        cec-gpio-sink {
                compatible = "cec-gpio";
                cec-gpios = <&gpio 6 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
                hpd-gpios = <&gpio 23 GPIO_ACTIVE_HIGH>;
        };

gpiod_set_value() is supposed to be usable from an atomic context, so this
appears to be a bug. It's probably been there for quite a long time. I suspect
OPEN_DRAIN isn't very common, and I think this might be the first time I tested
this driver with this kernel config option set.

Any suggestions?

Regards,

	Hans
