Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC7A6F3AB9
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2019 22:48:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbfKGVsP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Nov 2019 16:48:15 -0500
Received: from mx.0dd.nl ([5.2.79.48]:44690 "EHLO mx.0dd.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbfKGVsO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 7 Nov 2019 16:48:14 -0500
Received: from mail.vdorst.com (mail.vdorst.com [IPv6:fd01::250])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.0dd.nl (Postfix) with ESMTPS id AD9B65FC8D;
        Thu,  7 Nov 2019 22:48:12 +0100 (CET)
Authentication-Results: mx.0dd.nl;
        dkim=pass (2048-bit key; secure) header.d=vdorst.com header.i=@vdorst.com header.b="Y8Zi0+8h";
        dkim-atps=neutral
Received: from www (www.vdorst.com [192.168.2.222])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.vdorst.com (Postfix) with ESMTPSA id 6603F63CF2;
        Thu,  7 Nov 2019 22:48:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.vdorst.com 6603F63CF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdorst.com;
        s=default; t=1573163292;
        bh=kIpK2Z3ru72Hu3qOH7RL0ZLxZ2Zq/ZV3CsyMFpatynM=;
        h=Date:From:To:Cc:Subject:From;
        b=Y8Zi0+8hfj4XfbPa5++GKKOeWDekO3YITlV+halKYG4ojdqofMCeOMQx3wl4ZcxRY
         NKXO5TE+N1TyhrnjeTrmY5uZlfOMO2W2w3XwnXexOjhMmtAtdm3Cuc4yEjanYfirRs
         cQ329MPibC2VkUCkRA43c9b5/9Tg7W97R4FVU/Ph3Ejr7VqV+LtnHjgF5z5dQENB3D
         GAtTaUA7UnLTSy7Qsqvv8hQ17FKxV88L9EtBlyL01lQ6i/PLSe5//wNMBPawjfdRH5
         KshUgyzIAEAk1iaR622++xrGK2zLNgfBE30KXNGtCEvwVWca/K0zKV6pUmHF0xh0O8
         762ElacBRXnvQ==
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1]) by
 www.vdorst.com (Horde Framework) with HTTPS; Thu, 07 Nov 2019 21:48:12 +0000
Date:   Thu, 07 Nov 2019 21:48:12 +0000
Message-ID: <20191107214812.Horde.z_ETelVXryT7bme5Ed6oB16@www.vdorst.com>
From:   =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org
Subject: mt7621: gpio-hog not working properly
User-Agent: Horde Application Framework 5
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

I am trying to enable an output and set value low with a gpio-hog on  
mt7621 soc.
But it doesn't matter what I try, output-low/output-high and/or  
GPIO_ACTIVE_LOW
The gpio is always set as output and set HIGH so gpio output = VCC.
When set the gpio as input, the gpio is configured as an input.

Goal is to set GPIO7 output to GND/low.
In this case the GPIO7 is ACTIVE_LOW.

Used device Ubiquity EdgeRouter X SFP with MediaTek mt7621 MIPS SOC.
Kernel: Linux-5.4.0-rc6-next-20191107


To print this line "gpiochip_add_data_with_key: gpiochip0 gpio7: 0x843"
I used this patch, it prints the desc->flags only for the 7th gpio of that
gpiochip.

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9afbc0612126..f5d5f34701fe 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1405,6 +1405,8 @@ int gpiochip_add_data_with_key(struct gpio_chip  
*chip, void *data,
                         else
                                 clear_bit(FLAG_IS_OUT, &desc->flags);
                 }
+               if (i == 7)
+                       pr_info("%s: gpiochip%d gpio7: 0x%lx\n",  
__func__, gdev->id, desc->flags);
         }

         acpi_gpiochip_add(chip);



Here are the results what I tested.

Case 1:

DTS:

&gpio {
	sfp_i2c_clk_gate {
		gpio-hog;
		gpios = <7 GPIO_ACTIVE_LOW>;
		output-high;
	};
};

root@OpenWrt:/# dmesg | grep hog
[    3.095360] GPIO line 487 (sfp_i2c_clk_gate) hogged as output/high

root@OpenWrt:/# cat /sys/kernel/debug/gpio
gpiochip3: GPIOs 400-415, parent: i2c/0-0025, 0-0025, can sleep:
  gpio-405 (                    |mod-def0            ) in  lo ACTIVE LOW

gpiochip2: GPIOs 416-447, parent: platform/1e000600.gpio, 1e000600.gpio-bank2:

gpiochip1: GPIOs 448-479, parent: platform/1e000600.gpio, 1e000600.gpio-bank1:

gpiochip0: GPIOs 480-511, parent: platform/1e000600.gpio, 1e000600.gpio-bank0:
  gpio-487 (                    |sfp_i2c_clk_gate    ) out hi ACTIVE LOW
  gpio-492 (                    |reset               ) in  hi IRQ ACTIVE LOW
  gpio-496 (                    |sysfs               ) out hi
  gpio-497 (                    |sysfs               ) out lo
  gpio-498 (                    |sysfs               ) out hi
  gpio-499 (                    |sysfs               ) out lo
  gpio-500 (                    |sysfs               ) out hi

root@OpenWrt:/# io -4 0x1e000600 && io -4 0x1e000610 && io -4 0x1e000620
1e000600:  001f0080 = direction register
1e000610:  00000000 = polarity register
1e000620:  0b75f7da = data register

root@OpenWrt:/# dmesg | grep gpio7
[    3.107581] gpiochip_add_data_with_key: gpiochip0 gpio7: 0x843




Case 2:

DTS:

&gpio {
	sfp_i2c_clk_gate {
		gpio-hog;
		gpios = <7 GPIO_ACTIVE_HIGH>;
		output-high;
	};
};

root@OpenWrt:/# dmesg | grep hog
[    3.086745] GPIO line 487 (sfp_i2c_clk_gate) hogged as output/high
root@OpenWrt:/# cat /sys/kernel/debug/gpio
gpiochip3: GPIOs 400-415, parent: i2c/0-0025, 0-0025, can sleep:
  gpio-405 (                    |mod-def0            ) in  lo ACTIVE LOW

gpiochip2: GPIOs 416-447, parent: platform/1e000600.gpio, 1e000600.gpio-bank2:

gpiochip1: GPIOs 448-479, parent: platform/1e000600.gpio, 1e000600.gpio-bank1:

gpiochip0: GPIOs 480-511, parent: platform/1e000600.gpio, 1e000600.gpio-bank0:
  gpio-487 (                    |sfp_i2c_clk_gate    ) out hi
  gpio-492 (                    |reset               ) in  hi IRQ ACTIVE LOW
  gpio-496 (                    |sysfs               ) out hi
  gpio-497 (                    |sysfs               ) out lo
  gpio-498 (                    |sysfs               ) out hi
  gpio-499 (                    |sysfs               ) out lo
  gpio-500 (                    |sysfs               ) out hi
root@OpenWrt:/# io -4 0x1e000600 && io -4 0x1e000610 && io -4 0x1e000620
1e000600:  001f0080
1e000610:  00000000
1e000620:  0355f7da
root@OpenWrt:/# dmesg | grep gpio7
[    3.098961] gpiochip_add_data_with_key: gpiochip0 gpio7: 0x803




Case 3:

DTS:

&gpio {
	sfp_i2c_clk_gate {
		gpio-hog;
		gpios = <7 GPIO_ACTIVE_HIGH>;
		output-low;
	};
};

root@OpenWrt:/# dmesg | grep hog
[    3.096653] GPIO line 487 (sfp_i2c_clk_gate) hogged as output/low
root@OpenWrt:/# cat /sys/kernel/debug/gpio
gpiochip3: GPIOs 400-415, parent: i2c/0-0025, 0-0025, can sleep:
  gpio-405 (                    |mod-def0            ) in  lo ACTIVE LOW

gpiochip2: GPIOs 416-447, parent: platform/1e000600.gpio, 1e000600.gpio-bank2:

gpiochip1: GPIOs 448-479, parent: platform/1e000600.gpio, 1e000600.gpio-bank1:

gpiochip0: GPIOs 480-511, parent: platform/1e000600.gpio, 1e000600.gpio-bank0:
  gpio-487 (                    |sfp_i2c_clk_gate    ) out hi
  gpio-492 (                    |reset               ) in  hi IRQ ACTIVE LOW
  gpio-496 (                    |sysfs               ) out hi
  gpio-497 (                    |sysfs               ) out lo
  gpio-498 (                    |sysfs               ) out hi
  gpio-499 (                    |sysfs               ) out lo
  gpio-500 (                    |sysfs               ) out hi
root@OpenWrt:/# io -4 0x1e000600 && io -4 0x1e000610 && io -4 0x1e000620
1e000600:  001f0080
1e000610:  00000000
1e000620:  0355f7da
root@OpenWrt:/# dmesg | grep gpio7
[    3.108701] gpiochip_add_data_with_key: gpiochip0 gpio7: 0x803


So as you can see gpio-hog is parsed well by the kernel.
But it setting up the data value is not.


I think is a long time faulty because I tried many months ago and also  
hit this
issue but I did not investigated the issue.

If I try this on the openwrt 4.19 kernel is works fine but openwrt has  
an other
gpio driver.


I currently using this gpio-leds hack to enable gpio7.

        leds {
                compatible = "gpio-leds";

                /* Fixme: Currently a hack to enable SFP clk gate. */
                sfp {
                        label = "sfp:i2c";
                        gpios = <&gpio 7 GPIO_ACTIVE_LOW>;
                        default-state = "off";
                        linux,default-trigger = "default-on";
                };
        };


So any ideas what is wrong?



Here the full boot log of case 3 with gpio and pinctrl debug enabled.

Starting kernel ...

[    0.000000] Linux version 5.4.0-rc6-next-20191107+ (rene@pc) (gcc  
version 8.3.0 (OpenWrt GCC 8.3.0 r11215+1-bba6646b5cba)) #31 SMP Thu  
Nov 7 22:21:49 CET 2019
[    0.000000] SoC Type: MediaTek MT7621 ver:1 eco:3
[    0.000000] printk: bootconsole [early0] enabled
[    0.000000] CPU0 revision is: 0001992f (MIPS 1004Kc)
[    0.000000] MIPS: machine is UBNT-ERX-SFP
[    0.000000] Initrd not found or empty - disabling initrd
[    0.000000] VPE topology {1,1} total 2
[    0.000000] Primary instruction cache 32kB, VIPT, 4-way, linesize 32 bytes.
[    0.000000] Primary data cache 32kB, 4-way, PIPT, no aliases,  
linesize 32 bytes
[    0.000000] MIPS secondary cache 256kB, 8-way, linesize 32 bytes.
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x000000000fffffff]
[    0.000000]   HighMem  empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x000000000fffffff]
[    0.000000] Initmem setup node 0 [mem  
0x0000000000000000-0x000000000fffffff]
[    0.000000] On node 0 totalpages: 65536
[    0.000000]   Normal zone: 512 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 65536 pages, LIFO batch:15
[    0.000000] percpu: Embedded 19 pages/cpu s49040 r8192 d20592 u77824
[    0.000000] pcpu-alloc: s49040 r8192 d20592 u77824 alloc=19*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 65024
[    0.000000] Kernel command line: console=ttyS0,57600  
rootfstype=squashfs,jffs2 debug rootfstype=squashfs,jffs2
[    0.000000] Dentry cache hash table entries: 32768 (order: 5,  
131072 bytes, linear)
[    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536  
bytes, linear)
[    0.000000] Writing ErrCtl register=0001d090
[    0.000000] Readback ErrCtl register=0001d090
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 239408K/262144K available (6875K kernel code,  
349K rwdata, 1312K rodata, 11484K init, 252K bss, 22736K reserved, 0K  
cma-reserved, 0K highmem)
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=4 to nr_cpu_ids=2.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay  
is 10 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
[    0.000000] NR_IRQS: 256
[    0.000000] random: get_random_bytes called from  
start_kernel+0x3a0/0x598 with crng_init=0
[    0.000000] CPU Clock: 880MHz
[    0.000000] clocksource: GIC: mask: 0xffffffffffffffff max_cycles:  
0xcaf478abb4, max_idle_ns: 440795247997 ns
[    0.000000] clocksource: MIPS: mask: 0xffffffff max_cycles:  
0xffffffff, max_idle_ns: 4343773742 ns
[    0.000010] sched_clock: 32 bits at 440MHz, resolution 2ns, wraps  
every 4880645118ns
[    0.015552] Calibrating delay loop... 577.53 BogoMIPS (lpj=2887680)
[    0.087903] pid_max: default: 32768 minimum: 301
[    0.097211] Mount-cache hash table entries: 1024 (order: 0, 4096  
bytes, linear)
[    0.111617] Mountpoint-cache hash table entries: 1024 (order: 0,  
4096 bytes, linear)
[    0.127069] *** VALIDATE tmpfs ***
[    0.134433] *** VALIDATE proc ***
[    0.142323] rcu: Hierarchical SRCU implementation.
[    0.152418] smp: Bringing up secondary CPUs ...
[    0.177307] Primary instruction cache 32kB, VIPT, 4-way, linesize 32 bytes.
[    0.177316] Primary data cache 32kB, 4-way, PIPT, no aliases,  
linesize 32 bytes
[    0.177327] MIPS secondary cache 256kB, 8-way, linesize 32 bytes.
[    0.177396] CPU1 revision is: 0001992f (MIPS 1004Kc)
[    0.222064] Synchronize counters for CPU 1: done.
[    0.281731] smp: Brought up 1 node, 2 CPUs
[    0.293904] clocksource: jiffies: mask: 0xffffffff max_cycles:  
0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.313379] futex hash table entries: 512 (order: 2, 16384 bytes, linear)
[    0.326989] pinctrl core: initialized pinctrl subsystem
[    0.337722] reg-dummy reg-dummy: no of_node; not parsing pinctrl DT
[    0.350843] NET: Registered protocol family 16
[    0.360629] cpuidle: using governor ladder
[    0.371411] rt2880-pinmux pinctrl: try to register 61 pins ...
[    0.382930] pinctrl core: registered pin 0 (io0) on rt2880-pinmux
[    0.394987] pinctrl core: registered pin 1 (io1) on rt2880-pinmux
[    0.407077] pinctrl core: registered pin 2 (io2) on rt2880-pinmux
[    0.419172] pinctrl core: registered pin 3 (io3) on rt2880-pinmux
[    0.431268] pinctrl core: registered pin 4 (io4) on rt2880-pinmux
[    0.443364] pinctrl core: registered pin 5 (io5) on rt2880-pinmux
[    0.455460] pinctrl core: registered pin 6 (io6) on rt2880-pinmux
[    0.467564] pinctrl core: registered pin 7 (io7) on rt2880-pinmux
[    0.479654] pinctrl core: registered pin 8 (io8) on rt2880-pinmux
[    0.491761] pinctrl core: registered pin 9 (io9) on rt2880-pinmux
[    0.503846] pinctrl core: registered pin 10 (io10) on rt2880-pinmux
[    0.516286] pinctrl core: registered pin 11 (io11) on rt2880-pinmux
[    0.528728] pinctrl core: registered pin 12 (io12) on rt2880-pinmux
[    0.541169] pinctrl core: registered pin 13 (io13) on rt2880-pinmux
[    0.553611] pinctrl core: registered pin 14 (io14) on rt2880-pinmux
[    0.566052] pinctrl core: registered pin 15 (io15) on rt2880-pinmux
[    0.578494] pinctrl core: registered pin 16 (io16) on rt2880-pinmux
[    0.590936] pinctrl core: registered pin 17 (io17) on rt2880-pinmux
[    0.603377] pinctrl core: registered pin 18 (io18) on rt2880-pinmux
[    0.615826] pinctrl core: registered pin 19 (io19) on rt2880-pinmux
[    0.628262] pinctrl core: registered pin 20 (io20) on rt2880-pinmux
[    0.640701] pinctrl core: registered pin 21 (io21) on rt2880-pinmux
[    0.653143] pinctrl core: registered pin 22 (io22) on rt2880-pinmux
[    0.665584] pinctrl core: registered pin 23 (io23) on rt2880-pinmux
[    0.678027] pinctrl core: registered pin 24 (io24) on rt2880-pinmux
[    0.690468] pinctrl core: registered pin 25 (io25) on rt2880-pinmux
[    0.702910] pinctrl core: registered pin 26 (io26) on rt2880-pinmux
[    0.715351] pinctrl core: registered pin 27 (io27) on rt2880-pinmux
[    0.727793] pinctrl core: registered pin 28 (io28) on rt2880-pinmux
[    0.740243] pinctrl core: registered pin 29 (io29) on rt2880-pinmux
[    0.752678] pinctrl core: registered pin 30 (io30) on rt2880-pinmux
[    0.765118] pinctrl core: registered pin 31 (io31) on rt2880-pinmux
[    0.777560] pinctrl core: registered pin 32 (io32) on rt2880-pinmux
[    0.790001] pinctrl core: registered pin 33 (io33) on rt2880-pinmux
[    0.802443] pinctrl core: registered pin 34 (io34) on rt2880-pinmux
[    0.814885] pinctrl core: registered pin 35 (io35) on rt2880-pinmux
[    0.827325] pinctrl core: registered pin 36 (io36) on rt2880-pinmux
[    0.839768] pinctrl core: registered pin 37 (io37) on rt2880-pinmux
[    0.852209] pinctrl core: registered pin 38 (io38) on rt2880-pinmux
[    0.864664] pinctrl core: registered pin 39 (io39) on rt2880-pinmux
[    0.877096] pinctrl core: registered pin 40 (io40) on rt2880-pinmux
[    0.889534] pinctrl core: registered pin 41 (io41) on rt2880-pinmux
[    0.901976] pinctrl core: registered pin 42 (io42) on rt2880-pinmux
[    0.914417] pinctrl core: registered pin 43 (io43) on rt2880-pinmux
[    0.926859] pinctrl core: registered pin 44 (io44) on rt2880-pinmux
[    0.939301] pinctrl core: registered pin 45 (io45) on rt2880-pinmux
[    0.951742] pinctrl core: registered pin 46 (io46) on rt2880-pinmux
[    0.964183] pinctrl core: registered pin 47 (io47) on rt2880-pinmux
[    0.976625] pinctrl core: registered pin 48 (io48) on rt2880-pinmux
[    0.989075] pinctrl core: registered pin 49 (io49) on rt2880-pinmux
[    1.001510] pinctrl core: registered pin 50 (io50) on rt2880-pinmux
[    1.013950] pinctrl core: registered pin 51 (io51) on rt2880-pinmux
[    1.026391] pinctrl core: registered pin 52 (io52) on rt2880-pinmux
[    1.038833] pinctrl core: registered pin 53 (io53) on rt2880-pinmux
[    1.051275] pinctrl core: registered pin 54 (io54) on rt2880-pinmux
[    1.063717] pinctrl core: registered pin 55 (io55) on rt2880-pinmux
[    1.076158] pinctrl core: registered pin 56 (io56) on rt2880-pinmux
[    1.088600] pinctrl core: registered pin 57 (io57) on rt2880-pinmux
[    1.101041] pinctrl core: registered pin 58 (io58) on rt2880-pinmux
[    1.113491] pinctrl core: registered pin 59 (io59) on rt2880-pinmux
[    1.125926] pinctrl core: registered pin 60 (io60) on rt2880-pinmux
[    1.138419] pinctrl core: add 3 pinctrl maps
[    1.146830] rt2880-pinmux pinctrl: found group selector 3 for uart2
[    1.159285] rt2880-pinmux pinctrl: found group selector 2 for uart3
[    1.171727] rt2880-pinmux pinctrl: found group selector 4 for jtag
[    1.183996] rt2880-pinmux pinctrl: request pin 9 (io9) for pinctrl
[    1.196258] rt2880-pinmux pinctrl: request pin 10 (io10) for pinctrl
[    1.208870] rt2880-pinmux pinctrl: request pin 11 (io11) for pinctrl
[    1.221484] rt2880-pinmux pinctrl: request pin 12 (io12) for pinctrl
[    1.234104] rt2880-pinmux pinctrl: request pin 5 (io5) for pinctrl
[    1.246382] rt2880-pinmux pinctrl: request pin 6 (io6) for pinctrl
[    1.258638] rt2880-pinmux pinctrl: request pin 7 (io7) for pinctrl
[    1.270905] rt2880-pinmux pinctrl: request pin 8 (io8) for pinctrl
[    1.283176] rt2880-pinmux pinctrl: request pin 13 (io13) for pinctrl
[    1.295789] rt2880-pinmux pinctrl: request pin 14 (io14) for pinctrl
[    1.308403] rt2880-pinmux pinctrl: request pin 15 (io15) for pinctrl
[    1.321017] rt2880-pinmux pinctrl: request pin 16 (io16) for pinctrl
[    1.333632] rt2880-pinmux pinctrl: request pin 17 (io17) for pinctrl
[    1.346246] rt2880-pinmux pinctrl: failed to lookup the sleep state
[    1.406572] reg-fixed-voltage fixedregulator@0: GPIO lookup for  
consumer (null)
[    1.421043] reg-fixed-voltage fixedregulator@0: using device tree  
for GPIO lookup
[    1.435912] of_get_named_gpiod_flags: can't parse 'gpios' property  
of node '/fixedregulator@0[0]'
[    1.453490] of_get_named_gpiod_flags: can't parse 'gpio' property  
of node '/fixedregulator@0[0]'
[    1.470930] reg-fixed-voltage fixedregulator@0: using lookup tables  
for GPIO lookup
[    1.486130] reg-fixed-voltage fixedregulator@0: No GPIO consumer  
(null) found
[    1.500744] reg-fixed-voltage fixedregulator@1: GPIO lookup for  
consumer (null)
[    1.515170] reg-fixed-voltage fixedregulator@1: using device tree  
for GPIO lookup
[    1.530030] of_get_named_gpiod_flags: can't parse 'gpios' property  
of node '/fixedregulator@1[0]'
[    1.547661] of_get_named_gpiod_flags: can't parse 'gpio' property  
of node '/fixedregulator@1[0]'
[    1.565097] reg-fixed-voltage fixedregulator@1: using lookup tables  
for GPIO lookup
[    1.580295] reg-fixed-voltage fixedregulator@1: No GPIO consumer  
(null) found
[    1.598141] clocksource: Switched to clocksource GIC
[    1.654890] *** VALIDATE bpf ***
[    1.661442] *** VALIDATE ramfs ***
[    1.669173] NET: Registered protocol family 2
[    1.678985] tcp_listen_portaddr_hash hash table entries: 512  
(order: 0, 6144 bytes, linear)
[    1.695592] TCP established hash table entries: 2048 (order: 1,  
8192 bytes, linear)
[    1.710754] TCP bind hash table entries: 2048 (order: 2, 16384  
bytes, linear)
[    1.724899] TCP: Hash tables configured (established 2048 bind 2048)
[    1.737628] UDP hash table entries: 256 (order: 1, 8192 bytes, linear)
[    1.750536] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes, linear)
[    1.764599] NET: Registered protocol family 1
[    2.878619] random: fast init done
[    2.930229] alarmtimer alarmtimer: no of_node; not parsing pinctrl DT
[    2.943704] Initialise system trusted keyrings
[    2.952803] workingset: timestamp_bits=30 max_order=16 bucket_order=0
[    2.972600] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    2.984122] jffs2: version 2.2. (NAND) (SUMMARY)  © 2001-2006 Red Hat, Inc.
[    2.998813] *** VALIDATE jffs2 ***
[    3.059683] NET: Registered protocol family 38
[    3.068446] Key type asymmetric registered
[    3.076486] Asymmetric key parser 'x509' registered
[    3.086678] gpiochip_find_base: found new base at 480
[    3.096653] GPIO line 487 (sfp_i2c_clk_gate) hogged as output/low
[    3.108701] gpiochip_add_data_with_key: gpiochip0 gpio7: 0x803
[    3.120454] gpio gpiochip0: (1e000600.gpio-bank0): added GPIO  
chardev (254:0)
[    3.134633] gpiochip_setup_dev: registered GPIOs 480 to 511 on  
device: gpiochip0 (1e000600.gpio-bank0)
[    3.153027] mt7621_gpio 1e000600.gpio: registering 32 gpios
[    3.164120] gpiochip_find_base: found new base at 448
[    3.174116] gpiochip_add_data_with_key: gpiochip1 gpio7: 0x0
[    3.185455] gpio gpiochip1: (1e000600.gpio-bank1): added GPIO  
chardev (254:1)
[    3.199599] gpiochip_setup_dev: registered GPIOs 448 to 479 on  
device: gpiochip1 (1e000600.gpio-bank1)
[    3.218008] mt7621_gpio 1e000600.gpio: registering 32 gpios
[    3.229105] gpiochip_find_base: found new base at 416
[    3.239100] gpiochip_add_data_with_key: gpiochip2 gpio7: 0x0
[    3.250432] gpio gpiochip2: (1e000600.gpio-bank2): added GPIO  
chardev (254:2)
[    3.264583] gpiochip_setup_dev: registered GPIOs 416 to 447 on  
device: gpiochip2 (1e000600.gpio-bank2)
[    3.282993] mt7621_gpio 1e000600.gpio: registering 32 gpios
[    3.294608] Serial: 8250/16550 driver, 3 ports, IRQ sharing disabled
[    3.307702] serial8250 serial8250: no of_node; not parsing pinctrl DT
[    3.320971] printk: console [ttyS0] disabled
[    3.329435] 1e000c00.uartlite: ttyS0 at MMIO 0x1e000c00 (irq = 15,  
base_baud = 3125000) is a 16550A
[    3.347341] printk: console [ttyS0] enabled
[    3.347341] printk: console [ttyS0] enabled
[    3.363900] printk: bootconsole [early0] disabled
[    3.363900] printk: bootconsole [early0] disabled
[    3.384676] mdio_bus fixed-0: GPIO lookup for consumer reset
[    3.396032] mdio_bus fixed-0: using lookup tables for GPIO lookup
[    3.408176] mdio_bus fixed-0: No GPIO consumer reset found
[    3.419118] libphy: Fixed MDIO Bus: probed
[    3.468325] mtk_validate: GMAC0: phy: trgmii adv  
000,00000000,00016fe0, 3ff,ffffffff,ffffffff, 3ff,ffffffff,ffffffff
[    3.468392] of_get_named_gpiod_flags: can't parse 'link-gpios'  
property of node '/ethernet@1e100000/mac@0/fixed-link[0]'
[    3.511011] mtk_validate: GMAC0: phy: trgmii adv  
000,00000000,00016fe0, 3ff,ffffffff,ffffffff, 3ff,ffffffff,ffffffff
[    3.511263] mdio_bus mdio-bus: GPIO lookup for consumer reset
[    3.543681] mdio_bus mdio-bus: using device tree for GPIO lookup
[    3.555673] of_get_named_gpiod_flags: can't parse 'reset-gpios'  
property of node '/ethernet@1e100000/mdio-bus[0]'
[    3.576126] of_get_named_gpiod_flags: can't parse 'reset-gpio'  
property of node '/ethernet@1e100000/mdio-bus[0]'
[    3.596394] mdio_bus mdio-bus: using lookup tables for GPIO lookup
[    3.608707] mdio_bus mdio-bus: No GPIO consumer reset found
[    3.619800] libphy: mdio: probed
[    3.640850] mdio_bus mdio-bus:04: GPIO lookup for consumer reset
[    3.652866] mdio_bus mdio-bus:04: using device tree for GPIO lookup
[    3.665384] of_get_named_gpiod_flags: can't parse 'reset-gpios'  
property of node '/ethernet@1e100000/mdio-bus/ethernet-phy@4[0]'
[    3.688434] of_get_named_gpiod_flags: can't parse 'reset-gpio'  
property of node '/ethernet@1e100000/mdio-bus/ethernet-phy@4[0]'
[    3.711294] mdio_bus mdio-bus:04: using lookup tables for GPIO lookup
[    3.724119] mdio_bus mdio-bus:04: No GPIO consumer reset found
[    3.736088] mt7530 mdio-bus:1f: MT7530 adapts as multi-chip module
[    3.748437] ___RegisterName[ADDR]: HEXvalue
[    3.778124]          HWTRAP[7804]:   117ccf
[    3.808121]           P6ECR[7830]:        0
[    3.838126]          TXCTRL[7a40]: 40020000
[    3.868118]        TCK_CTRL[7a78]:       55
[    3.898118]       TD_ODT(0)[7a54]:       44
[    3.928123]           RD(0)[7a10]:        0
[    3.968118]      PLL_GROUP2[ 401]:     4020
[    4.008118]      PLL_GROUP4[ 403]:     1000
[    4.048118]      PLL_GROUP5[ 404]:     1d00
[    4.088117]      PLL_GROUP6[ 405]:        0
[    4.128123]      PLL_GROUP7[ 406]:     2030
[    4.168117]     PLL_GROUP10[ 409]:       64
[    4.208118]     PLL_GROUP11[ 40a]:       64
[    4.248118]     GSWPLL_GRP1[ 40d]:     2820
[    4.288118]     GSWPLL_GRP2[ 40e]:      119
[    4.328123]      GSW_CLK_CG[ 410]:        1
[    4.350862] mdio_bus mdio-bus:07: GPIO lookup for consumer reset
[    4.362880] mdio_bus mdio-bus:07: using device tree for GPIO lookup
[    4.375396] of_get_named_gpiod_flags: can't parse 'reset-gpios'  
property of node '/ethernet@1e100000/mdio-bus/ethernet-phy@7[0]'
[    4.398447] of_get_named_gpiod_flags: can't parse 'reset-gpio'  
property of node '/ethernet@1e100000/mdio-bus/ethernet-phy@7[0]'
[    4.421308] mdio_bus mdio-bus:07: using lookup tables for GPIO lookup
[    4.434160] mdio_bus mdio-bus:07: No GPIO consumer reset found
[    4.508280] mtk_soc_eth 1e100000.ethernet: generated random MAC  
address 8a:5c:8f:23:16:c8
[    4.525217] mtk_soc_eth 1e100000.ethernet eth0: mediatek frame  
engine at 0xbe100000, irq 16
[    4.542031] PPP generic driver version 2.4.2
[    4.550686] NET: Registered protocol family 24
[    4.559570] i2c /dev entries driver
[    4.566646] pinctrl core: add 1 pinctrl maps
[    4.575178] rt2880-pinmux pinctrl: found group selector 1 for i2c
[    4.587334] rt2880-pinmux pinctrl: request pin 3 (io3) for 1e000900.i2c
[    4.600500] rt2880-pinmux pinctrl: request pin 4 (io4) for 1e000900.i2c
[    4.614178] pca953x 0-0025: GPIO lookup for consumer reset
[    4.625116] pca953x 0-0025: using device tree for GPIO lookup
[    4.636571] of_get_named_gpiod_flags: can't parse 'reset-gpios'  
property of node '/palmbus@1E000000/i2c@900/pca9555@25[0]'
[    4.658580] of_get_named_gpiod_flags: can't parse 'reset-gpio'  
property of node '/palmbus@1E000000/i2c@900/pca9555@25[0]'
[    4.680392] pca953x 0-0025: using lookup tables for GPIO lookup
[    4.692169] pca953x 0-0025: No GPIO consumer reset found
[    4.702755] pca953x 0-0025: 0-0025 supply vcc not found, using  
dummy regulator
[    4.748144] gpiochip_find_base: found new base at 400
[    4.828121] gpiochip_add_data_with_key: gpiochip3 gpio7: 0x0
[    4.908251] gpio gpiochip3: (0-0025): added GPIO chardev (254:3)
[    4.920304] gpiochip_setup_dev: registered GPIOs 400 to 415 on  
device: gpiochip3 (0-0025)
[    4.936589] pca953x 0-0025: interrupt support not compiled in
[    4.948104] i2c-mt7621 1e000900.i2c: clock 100 kHz
[    4.959139] oprofile: using mips/34K performance monitoring.
[    4.972539] NET: Registered protocol family 10
[    4.982713] Segment Routing with IPv6
[    4.990192] NET: Registered protocol family 17
[    4.999123] Bridge firewalling registered
[    5.007403] 8021q: 802.1Q VLAN Support v1.8
[    5.016043] Loading compiled-in X.509 certificates
[    5.028687] mdio_bus i2c:sfp_lan5: GPIO lookup for consumer reset
[    5.040845] mdio_bus i2c:sfp_lan5: using lookup tables for GPIO lookup
[    5.053833] mdio_bus i2c:sfp_lan5: No GPIO consumer reset found
[    5.065610] libphy: SFP I2C Bus: probed
[    5.073238] sfp sfp_lan5: GPIO lookup for consumer mod-def0
[    5.084321] sfp sfp_lan5: using device tree for GPIO lookup
[    5.095433] of_get_named_gpiod_flags: can't parse 'mod-def0-gpios'  
property of node '/sfp_lan5[0]'
[    5.113293] of_get_named_gpiod_flags: parsed 'mod-def0-gpio'  
property of node '/sfp_lan5[0]' - status (0)
[    5.132366] gpio gpiochip3: Persistence not supported for GPIO 5
[    5.178158] sfp sfp_lan5: GPIO lookup for consumer los
[    5.188390] sfp sfp_lan5: using device tree for GPIO lookup
[    5.199491] of_get_named_gpiod_flags: can't parse 'los-gpios'  
property of node '/sfp_lan5[0]'
[    5.216464] of_get_named_gpiod_flags: can't parse 'los-gpio'  
property of node '/sfp_lan5[0]'
[    5.233271] sfp sfp_lan5: using lookup tables for GPIO lookup
[    5.244703] sfp sfp_lan5: No GPIO consumer los found
[    5.254577] sfp sfp_lan5: GPIO lookup for consumer tx-fault
[    5.265660] sfp sfp_lan5: using device tree for GPIO lookup
[    5.276756] of_get_named_gpiod_flags: can't parse 'tx-fault-gpios'  
property of node '/sfp_lan5[0]'
[    5.294596] of_get_named_gpiod_flags: can't parse 'tx-fault-gpio'  
property of node '/sfp_lan5[0]'
[    5.312256] sfp sfp_lan5: using lookup tables for GPIO lookup
[    5.323685] sfp sfp_lan5: No GPIO consumer tx-fault found
[    5.334432] sfp sfp_lan5: GPIO lookup for consumer tx-disable
[    5.345863] sfp sfp_lan5: using device tree for GPIO lookup
[    5.356960] of_get_named_gpiod_flags: can't parse  
'tx-disable-gpios' property of node '/sfp_lan5[0]'
[    5.375146] of_get_named_gpiod_flags: can't parse 'tx-disable-gpio'  
property of node '/sfp_lan5[0]'
[    5.393154] sfp sfp_lan5: using lookup tables for GPIO lookup
[    5.404586] sfp sfp_lan5: No GPIO consumer tx-disable found
[    5.415669] sfp sfp_lan5: GPIO lookup for consumer rate-select0
[    5.427444] sfp sfp_lan5: using device tree for GPIO lookup
[    5.438553] of_get_named_gpiod_flags: can't parse  
'rate-select0-gpios' property of node '/sfp_lan5[0]'
[    5.457083] of_get_named_gpiod_flags: can't parse  
'rate-select0-gpio' property of node '/sfp_lan5[0]'
[    5.475433] sfp sfp_lan5: using lookup tables for GPIO lookup
[    5.486862] sfp sfp_lan5: No GPIO consumer rate-select0 found
[    5.498301] sfp sfp_lan5: Host maximum power 1.0W
[    5.568151] sfp sfp_lan5: No tx_disable pin: SFP modules will  
always be emitting.
[    5.583200] mt7530 mdio-bus:1f: MT7530 adapts as multi-chip module
[    5.595528] ___RegisterName[ADDR]: HEXvalue
[    5.628134]          HWTRAP[7804]:   117ccf
[    5.658126]           P6ECR[7830]:        0
[    5.688143]          TXCTRL[7a40]: 40020000
[    5.718138]        TCK_CTRL[7a78]:       55
[    5.748145]       TD_ODT(0)[7a54]:       44
[    5.778124]           RD(0)[7a10]:        0
[    5.818124]      PLL_GROUP2[ 401]:     4020
[    5.858146]      PLL_GROUP4[ 403]:     1000
[    5.898138]      PLL_GROUP5[ 404]:     1d00
[    5.938142]      PLL_GROUP6[ 405]:        0
[    5.978124]      PLL_GROUP7[ 406]:     2030
[    6.018124]     PLL_GROUP10[ 409]:       64
[    6.058124]     PLL_GROUP11[ 40a]:       64
[    6.098138]     GSWPLL_GRP1[ 40d]:     2820
[    6.138158]     GSWPLL_GRP2[ 40e]:      119
[    6.178124]      GSW_CLK_CG[ 410]:        1
[    7.848163] sfp sfp_lan5: please wait, module slow to respond
[    8.098267] mdio_bus dsa-0.0: GPIO lookup for consumer reset
[    8.109546] mdio_bus dsa-0.0: using lookup tables for GPIO lookup
[    8.121670] mdio_bus dsa-0.0: No GPIO consumer reset found
[    8.151600] mdio_bus dsa-0.0:00: GPIO lookup for consumer reset
[    8.163443] mdio_bus dsa-0.0:00: using lookup tables for GPIO lookup
[    8.176092] mdio_bus dsa-0.0:00: No GPIO consumer reset found
[    8.201544] mdio_bus dsa-0.0:01: GPIO lookup for consumer reset
[    8.213387] mdio_bus dsa-0.0:01: using lookup tables for GPIO lookup
[    8.226062] mdio_bus dsa-0.0:01: No GPIO consumer reset found
[    8.251575] mdio_bus dsa-0.0:02: GPIO lookup for consumer reset
[    8.263421] mdio_bus dsa-0.0:02: using lookup tables for GPIO lookup
[    8.276102] mdio_bus dsa-0.0:02: No GPIO consumer reset found
[    8.300923] mdio_bus dsa-0.0:03: GPIO lookup for consumer reset
[    8.312754] mdio_bus dsa-0.0:03: using lookup tables for GPIO lookup
[    8.325401] mdio_bus dsa-0.0:03: No GPIO consumer reset found
[    8.350895] mdio_bus dsa-0.0:04: GPIO lookup for consumer reset
[    8.362723] mdio_bus dsa-0.0:04: using lookup tables for GPIO lookup
[    8.375368] mdio_bus dsa-0.0:04: No GPIO consumer reset found
[    8.400873] mdio_bus dsa-0.0:05: GPIO lookup for consumer reset
[    8.412734] mdio_bus dsa-0.0:05: using lookup tables for GPIO lookup
[    8.425381] mdio_bus dsa-0.0:05: No GPIO consumer reset found
[    8.436958] libphy: dsa slave smi: probed
[    8.445068] mt7530 mdio-bus:1f: mt7530_phylink_validate: port: 0 mode:
[    8.488194] mt7530 mdio-bus:1f: mt7530_phylink_validate: port: 0 mode: gmii
[    8.502077] mt7530 mdio-bus:1f lan0 (uninitialized): PHY  
[dsa-0.0:00] driver [Generic PHY]
[    8.519517] mt7530 mdio-bus:1f: mt7530_phylink_validate: port: 1 mode:
[    8.568160] mt7530 mdio-bus:1f: mt7530_phylink_validate: port: 1 mode: gmii
[    8.582061] mt7530 mdio-bus:1f lan1 (uninitialized): PHY  
[dsa-0.0:01] driver [Generic PHY]
[    8.599458] mt7530 mdio-bus:1f: mt7530_phylink_validate: port: 2 mode:
[    8.648194] mt7530 mdio-bus:1f: mt7530_phylink_validate: port: 2 mode: gmii
[    8.662089] mt7530 mdio-bus:1f lan2 (uninitialized): PHY  
[dsa-0.0:02] driver [Generic PHY]
[    8.679533] mt7530 mdio-bus:1f: mt7530_phylink_validate: port: 3 mode:
[    8.728173] mt7530 mdio-bus:1f: mt7530_phylink_validate: port: 3 mode: gmii
[    8.742062] mt7530 mdio-bus:1f lan3 (uninitialized): PHY  
[dsa-0.0:03] driver [Generic PHY]
[    8.759487] mt7530 mdio-bus:1f: mt7530_phylink_validate: port: 4 mode:
[    8.808158] mt7530 mdio-bus:1f: mt7530_phylink_validate: port: 4 mode: gmii
[    8.822043] mt7530 mdio-bus:1f lan4 (uninitialized): PHY  
[dsa-0.0:04] driver [Generic PHY]
[    8.839482] mt7530 mdio-bus:1f: mt7530_phylink_validate: port: 5  
mode: rgmii-rxid
[    8.948152] mt7530 mdio-bus:1f: mt7530_phylink_validate: port: 5  
mode: rgmii-rxid
[    8.963062] mt7530 mdio-bus:1f lan5 (uninitialized): PHY  
[mdio-bus:07] driver [Qualcomm Atheros AR8031/AR8033]
[    8.983910] mt7530 mdio-bus:1f: mt7530_phylink_validate: port: 6  
mode: trgmii
[    8.998207] of_get_named_gpiod_flags: can't parse 'link-gpios'  
property of node  
'/ethernet@1e100000/mdio-bus/switch@1f/ports/port@6/fixed-link[0]'
[    9.024340] mt7530 mdio-bus:1f: mt7530_phylink_validate: port: 6  
mode: trgmii
[    9.038564] mt7530 mdio-bus:1f: configuring for fixed/trgmii link mode
[    9.051558] mt7530 mdio-bus:1f: mt7530_phylink_mac_config: P6 mode: trgmii
[    9.065237] mt7530 mdio-bus:1f: mt7530_phylink_mac_config: Setup P6  
mode: trgmii
[    9.079950] ___RegisterName[ADDR]: HEXvalue
[    9.118136]          HWTRAP[7804]:    17c8f
[    9.148127]           P6ECR[7830]:        0
[    9.178132]          TXCTRL[7a40]: 40020000
[    9.208125]        TCK_CTRL[7a78]:       55
[    9.238129]       TD_ODT(0)[7a54]:       ff
[    9.268124]           RD(0)[7a10]:        0
[    9.308125]      PLL_GROUP2[ 401]:     4020
[    9.348145]      PLL_GROUP4[ 403]:     1000
[    9.388124]      PLL_GROUP5[ 404]:     1d00
[    9.428124]      PLL_GROUP6[ 405]:        0
[    9.468125]      PLL_GROUP7[ 406]:     2030
[    9.508124]     PLL_GROUP10[ 409]:       64
[    9.548125]     PLL_GROUP11[ 40a]:       64
[    9.588124]     GSWPLL_GRP1[ 40d]:     2820
[    9.628124]     GSWPLL_GRP2[ 40e]:      119
[    9.668124]      GSW_CLK_CG[ 410]:        1
[   10.478120] ___RegisterName[ADDR]: HEXvalue
[   10.508125]          HWTRAP[7804]:    17c8f
[   10.538129]           P6ECR[7830]:        1
[   10.568125]          TXCTRL[7a40]: 40020000
[   10.598125]        TCK_CTRL[7a78]:       55
[   10.628125]       TD_ODT(0)[7a54]:       44
[   10.658124]           RD(0)[7a10]:        0
[   10.698125]      PLL_GROUP2[ 401]:     c020
[   10.738129]      PLL_GROUP4[ 403]:     1c00
[   10.778145]      PLL_GROUP5[ 404]:      780
[   10.818124]      PLL_GROUP6[ 405]:        0
[   10.858125]      PLL_GROUP7[ 406]:     a030
[   10.898125]     PLL_GROUP10[ 409]:       87
[   10.938129]     PLL_GROUP11[ 40a]:       87
[   10.978125]     GSWPLL_GRP1[ 40d]:     2820
[   11.018125]     GSWPLL_GRP2[ 40e]:      119
[   11.058125]      GSW_CLK_CG[ 410]:        3
[   11.118171] mt7530 mdio-bus:1f: mt7530_phylink_mac_config: P6 mode: trgmii
[   11.328135] mt7530 mdio-bus:1f: Link is Up - 1Gbps/Full - flow  
control rx/tx
[   11.578163] DSA: tree 0 setup
[   11.584631] of_get_named_gpiod_flags: parsed 'gpios' property of  
node '/gpio-keys/reset[0]' - status (0)
[   11.603541] gpio-492 (reset): gpiod_set_debounce: missing set() or  
set_config() operations
[   11.620280] input: gpio-keys as /devices/platform/gpio-keys/input/input0
[   11.634113] Warning: unable to open an initial console.
[   11.685408] Freeing unused kernel memory: 11484K
[   11.694644] This architecture does not have kernel memory protection.
[   11.707457] Run /init as init process
[   11.724901] init: Console is alive
[   11.748450] init: - preinit -
Failed to connect to the switch. Use the "list" command to see which  
switches are available.
Failed to connect to the switch. Use the "list" co[   11.857608]  
mtk_soc_eth 1e100000.ethernet eth0: configuring for fixed/trgmii link  
mode
mmand to see whi[   11.876176] mtk_soc_eth 1e100000.ethernet eth0:  
Link is Up - 1Gbps/Full - flow control rx/tx
ch switches are [   11.895474] IPv6: ADDRCONF(NETDEV_CHANGE): eth0:  
link becomes ready
available.
Failed to connect to the switch. Use the "list" command to see which  
switches are available.
Press the [f] key and hit [enter] to enter failsafe mode
Press the [1], [2], [3] or [4] key and hit [enter] to select the debug level

[   14.409937] mtk_soc_eth 1e100000.ethernet eth0: Link is Down
[   14.428268] procd: - early -
[   14.968806] procd: - ubus -
[   14.980377] random: ubusd: uninitialized urandom read (4 bytes read)
[   15.028752] random: ubusd: uninitialized urandom read (4 bytes read)
[   15.041848] random: ubusd: uninitialized urandom read (4 bytes read)
[   15.055449] procd: - init -
Please press Enter to activate this console.
[   15.500075] urngd: v1.0.1 started.
[   15.640951] random: crng init done
[   15.647708] random: 7 urandom warning(s) missed due to ratelimiting


Greats,

René




