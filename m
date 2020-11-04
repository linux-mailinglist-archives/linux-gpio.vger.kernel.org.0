Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 863162A65BC
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 15:01:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729947AbgKDOBB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 09:01:01 -0500
Received: from gecko.sbs.de ([194.138.37.40]:50023 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729481AbgKDN6C (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Nov 2020 08:58:02 -0500
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0A4DvuIv013592
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 4 Nov 2020 14:57:56 +0100
Received: from [167.87.41.231] ([167.87.41.231])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0A4Dvuhl011779;
        Wed, 4 Nov 2020 14:57:56 +0100
Subject: Re: [PATCH 0/7] gpio: exar: refactor the driver
From:   Jan Kiszka <jan.kiszka@siemens.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20201026141839.28536-1-brgl@bgdev.pl>
 <CAHp75Vf07dsUXZ8Dr-KY-NFQv+C2QQVEOH_se7vYMT6hdm-U3Q@mail.gmail.com>
 <1fd4d69b-4d64-05e5-45a3-b2182fb2d207@siemens.com>
Message-ID: <0ab04241-4756-873b-980a-572b225c16e9@siemens.com>
Date:   Wed, 4 Nov 2020 14:57:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1fd4d69b-4d64-05e5-45a3-b2182fb2d207@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27.10.20 16:12, Jan Kiszka wrote:
> On 26.10.20 15:46, Andy Shevchenko wrote:
>> On Mon, Oct 26, 2020 at 4:22 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>>
>>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>
>>> I just wanted to convert the driver to using simpler IDA API but ended up
>>> quickly converting it to using regmap. Unfortunately I don't have the HW
>>> to test it so marking the patches that introduce functional change as RFT
>>> and Cc'ing the original author.
>>
>> +Cc: Jan, AFAIR their devices are using Exar UART.
>>
> 
> Thanks for CC'ing. I cannot promise testing this soon, but I will try my
> best.
> 

Finally tested, unfortunately with bad news:

...
at24 i2c-INT3499:00: 1024 byte INT3499:00 EEPROM, writable, 1 bytes/write
pxa2xx_spi_pci 0000:00:15.0: enabling device (0000 -> 0002)
pxa2xx_spi_pci 0000:00:15.1: enabling device (0000 -> 0002)
exar_serial 0000:02:00.0: enabling device (0000 -> 0002)
0000:02:00.0: ttyS2 at MMIO 0x90000000 (irq = 44, base_baud = 7812500) is a XR17V35X
0000:02:00.0: ttyS3 at MMIO 0x90000400 (irq = 44, base_baud = 7812500) is a XR17V35X
BUG: kernel NULL pointer dereference, address: 00000000
#PF: supervisor instruction fetch in kernel mode
#PF: error_code(0xc1150010) - not-present page
*pde = 00000000 
Oops: 0010 [#1] PREEMPT
CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.10.0-rc2+ #438
Hardware name: Intel Corp. QUARK/SIMATIC IOT2000, BIOS V24.02.01 10/30/2018
Workqueue: events deferred_probe_work_func
EIP: 0x0
Code: Unable to access opcode bytes at RIP 0xffffffd6.
EAX: 00000000 EBX: f7c74000 ECX: 00000004 EDX: 00000099
ESI: 00000000 EDI: 00000000 EBP: c1157da8 ESP: c1157d90
DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068 EFLAGS: 00010282
CR0: 80050033 CR2: ffffffd6 CR3: 03771000 CR4: 00100010
Call Trace:
 regmap_update_bits_base+0x22/0x60
 ? exar_set_value+0x70/0x70 [gpio_exar]
 ? exar_set_value+0x70/0x70 [gpio_exar]
 exar_direction_output+0x47/0x50 [gpio_exar]
 gpiod_direction_output_raw_commit+0x74/0x270
 ? exar_direction_input+0x50/0x50 [gpio_exar]
 ? exar_set_value+0x70/0x70 [gpio_exar]
 gpiod_direction_output+0xf0/0x160
 create_gpio_led+0xea/0x180
 gpio_led_probe+0x22c/0x460
 ? device_pm_check_callbacks+0x4c/0x100
 platform_drv_probe+0x2d/0x80
 really_probe+0xcb/0x330
 driver_probe_device+0x49/0xa0
 __device_attach_driver+0x61/0x80
 ? driver_allows_async_probing+0x60/0x60
 bus_for_each_drv+0x4f/0x90
 __device_attach+0xbb/0x120
 ? driver_allows_async_probing+0x60/0x60
 device_initial_probe+0x12/0x20
 bus_probe_device+0x6f/0x80
 deferred_probe_work_func+0x56/0x80
 process_one_work+0x1ce/0x390
 worker_thread+0x37/0x420
 kthread+0x115/0x130
 ? process_one_work+0x390/0x390
 ? kthread_create_on_node+0x20/0x20
 ret_from_fork+0x19/0x30
Modules linked in: gpio_exar(+) spi_pxa2xx_platform 8250_exar spi_pxa2xx_pci ti_adc108s102 industrialio_triggered_buffer kfifo_buf industrialio at24
CR2: 0000000000000000
---[ end trace d982fb210f759304 ]---
EIP: 0x0
Code: Unable to access opcode bytes at RIP 0xffffffd6.
EAX: 00000000 EBX: f7c74000 ECX: 00000004 EDX: 00000099
ESI: 00000000 EDI: 00000000 EBP: c1157da8 ESP: c1157d90
DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068 EFLAGS: 00010282
CR0: 80050033 CR2: ffffffd6 CR3: 03771000 CR4: 00100010

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux
