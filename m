Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E276255D86
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 03:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbfFZBed (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 21:34:33 -0400
Received: from mga07.intel.com ([134.134.136.100]:25583 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726037AbfFZBec (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 Jun 2019 21:34:32 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Jun 2019 18:34:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,418,1557212400"; 
   d="gz'50?scan'50,208,50";a="163784382"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 25 Jun 2019 18:34:12 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hfwpA-0008OJ-6E; Wed, 26 Jun 2019 09:34:12 +0800
Date:   Wed, 26 Jun 2019 09:33:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     LKP <lkp@01.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>, philip.li@intel.com
Subject: 8e2fc846a9 ("Merge remote-tracking branch 'gpio/for-next'"): BUG: kernel reboot-without-warning in boot stage
Message-ID: <5d12cb6f.pFXLRALiMqCV7zSA%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="=_5d12cb6f.aVQw8tnFbKitLG0SgD4sZZwt6cS5gfp/AjlkSuL9pM/4A1z7"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is a multi-part message in MIME format.

--=_5d12cb6f.aVQw8tnFbKitLG0SgD4sZZwt6cS5gfp/AjlkSuL9pM/4A1z7
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Greetings,

0day kernel testing robot got the below dmesg and the first bad commit is

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master

commit 8e2fc846a9df4cc81385830994f99d822af78111
Merge: a0afa2698fd48 c8ecfd6caa1e2
Author:     Stephen Rothwell <sfr@canb.auug.org.au>
AuthorDate: Tue Jun 25 17:58:45 2019 +1000
Commit:     Stephen Rothwell <sfr@canb.auug.org.au>
CommitDate: Tue Jun 25 17:58:45 2019 +1000

    Merge remote-tracking branch 'gpio/for-next'

a0afa2698f  Merge remote-tracking branch 'rpmsg/for-next'
c8ecfd6caa  Merge branch 'devel' into for-next
8e2fc846a9  Merge remote-tracking branch 'gpio/for-next'
902031767a  Add linux-next specific files for 20190625
+-------------------------------------------------+------------+------------+------------+---------------+
|                                                 | a0afa2698f | c8ecfd6caa | 8e2fc846a9 | next-20190625 |
+-------------------------------------------------+------------+------------+------------+---------------+
| boot_successes                                  | 34         | 35         | 0          | 0             |
| boot_failures                                   | 1          | 1          | 15         | 21            |
| invoked_oom-killer:gfp_mask=0x                  | 1          | 1          |            |               |
| RIP:__clear_user                                | 1          |            |            |               |
| Mem-Info                                        | 1          | 1          |            |               |
| RIP:copy_user_generic_unrolled                  | 0          | 1          |            |               |
| BUG:kernel_reboot-without-warning_in_boot_stage | 0          | 0          | 15         | 21            |
+-------------------------------------------------+------------+------------+------------+---------------+

If you fix the issue, kindly add following tag
Reported-by: kernel test robot <lkp@intel.com>

[    0.038842] BRK [0x04e04000, 0x04e04fff] PGTABLE
[    0.040457] RAMDISK: [mem 0x1e2b1000-0x1ffdffff]
[    0.041549] ACPI: Early table checksum verification disabled
[    0.042336] ACPI: RSDP 0x00000000000F6870 000014 (v00 BOCHS )
[    0.043136] ACPI: RSDT 0x000000001FFE1936 000030 (v01 BOCHS  BXPCRSDT 00000001 BXPC 00000001)
BUG: kernel reboot-without-warning in boot stage


                                                          # HH:MM RESULT GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
git bisect start 902031767aec2eaa529fdbf3daf77615e3bc3a62 4b972a01a7da614b4796475f933094751a295a2f --
git bisect good 5fe65030c927d0f4413eb1c88e3d00fd5f5f81c0  # 00:15  G     10     0    2   2  Merge remote-tracking branch 'pm/linux-next'
git bisect good 6008a7dd899441d7a45dd0cdc0cd77b1c647b25b  # 01:07  G     10     0   10  10  Merge remote-tracking branch 'clockevents/clockevents/next'
git bisect good 28c68128a0314402c1b3574fd9a86a4d6ecaf636  # 01:45  G     10     0    0   0  Merge remote-tracking branch 'slave-dma/next'
git bisect  bad 4117b31faca024e6c9ee9226722cb075ecb79ea8  # 02:07  B      0    11   26   0  Merge remote-tracking branch 'rtc/rtc-next'
git bisect  bad 8e2fc846a9df4cc81385830994f99d822af78111  # 02:23  B      0    11   26   0  Merge remote-tracking branch 'gpio/for-next'
git bisect good bfb8a0785208c966d6cda1a16b0dc774a7db4aa3  # 02:53  G     10     0    2   2  Merge remote-tracking branch 'scsi-mkp/for-next'
git bisect good 199b902a02e8a7720ad23a0a0cabcbc51d5e0573  # 03:17  G     11     0    0   0  Merge remote-tracking branch 'vhost/linux-next'
git bisect good a0afa2698fd487c0b7c94573df98e64014008081  # 04:09  G     11     0    0   0  Merge remote-tracking branch 'rpmsg/for-next'
git bisect good 395373c721a2dc22daf09c902effab5fc0bb5ae5  # 04:52  G     11     0    1   1  gpio: omap: clean up edge interrupt handling
git bisect good 9a3027812257de71cd4122f69d7f4b16551bc076  # 06:03  G     11     0    2   2  gpio: omap: remove dataout variation in context handling
git bisect good 6a80b30086b861b2591ba2a953042abd08c498e3  # 06:49  G     10     0    0   0  fmc: Delete the FMC subsystem
git bisect good 42d9fc7176eb6b0ed4cd73bb66d28c8ea758a944  # 07:54  G     10     0    1   1  gpio: ftgpio: Pass irqchip when adding gpiochip
git bisect good c8ecfd6caa1e2f7c1fecc1ba61cf40bc39471176  # 08:39  G     11     0    1   1  Merge branch 'devel' into for-next
# first bad commit: [8e2fc846a9df4cc81385830994f99d822af78111] Merge remote-tracking branch 'gpio/for-next'
git bisect good a0afa2698fd487c0b7c94573df98e64014008081  # 08:51  G     31     0    1   1  Merge remote-tracking branch 'rpmsg/for-next'
git bisect good c8ecfd6caa1e2f7c1fecc1ba61cf40bc39471176  # 09:30  G     32     0    1   2  Merge branch 'devel' into for-next
# extra tests on HEAD of linux-next/master
git bisect  bad 902031767aec2eaa529fdbf3daf77615e3bc3a62  # 09:30  B      0    21   39   0  Add linux-next specific files for 20190625
# extra tests on tree/branch linux-next/master
git bisect  bad 902031767aec2eaa529fdbf3daf77615e3bc3a62  # 09:32  B      0    21   39   0  Add linux-next specific files for 20190625

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/lkp                          Intel Corporation

--=_5d12cb6f.aVQw8tnFbKitLG0SgD4sZZwt6cS5gfp/AjlkSuL9pM/4A1z7
Content-Type: application/gzip
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="dmesg-quantal-vm-quantal-65c56326c384:20190626022309:x86_64-randconfig-u0-06252111:5.2.0-rc6-08445-g8e2fc84:1.gz"

H4sICDfLEl0AA2RtZXNnLXF1YW50YWwtdm0tcXVhbnRhbC02NWM1NjMyNmMzODQ6MjAxOTA2
MjYwMjIzMDk6eDg2XzY0LXJhbmRjb25maWctdTAtMDYyNTIxMTE6NS4yLjAtcmM2LTA4NDQ1
LWc4ZTJmYzg0OjEAzVdZb+M4En62fkVhdh6S3UgmdVkSoMXkcne2O9veOJkOEAQGTVG2YF2t
w0l6MP99i5J8u7en+2kFGCbr+FgsFqtYghXxG/AsLbNYQJRCKao6R0IgFLHPE69VwXg1WYgi
FbESpXldTQJWMQ/IK1l9JjWJzp2OHYt0h0s41wnlSlZXyN5h0favYx1oGgY1mEuUdvVJlVUs
npTRV7ErJXRbgqClSZ7FUSomhj6NdlcixA2kkHIleJbkhSjLKJ3BxyitXzVNgxErGsL1x6Gc
BlkqNOUiyypJrOYCWhs05QnwI1qL+dwCwFKgdpaCpekaUQtuq8QxTUudOUIPuWPCyWJaR3Hw
W7zI1XZI6SmczDjf0jU1CuipAUW/wMmVmEZMki2ENE5P4W8UxrcjGN1dX9+O7uGzCOBfdQq6
DUT3qOMRCy7H9xLB3bfyMksSlgYgneNBgdvy+4FY9tFjBOZ1OptUrFxMcpZG3KcQiGk9A5bj
pB2Wb2XxZcLiF/ZWTkTKpjEuXvA6x1AQGg4mPK8nJR4PnlKUCDxPH88WUlFpUZiyRJQ+gbyI
0mqh4cKLpJz5uOd2QZVCmYVVnPFFna+NSJNo8sIqPg+ymd8QIcvyshvGGQsmaH4QlQtfR2g8
1GpNIBAU00BLojQrJjyr08p35CYqkQRanM0w0pYi9kVRQDRDGTFBYkNbBb9fVW8EmvvQmi0J
Y3JGqaXjxrakNsTljPkIlrAYihfp64Xf5yKfh2W/PfN+Uafql1rUov+lZim6S10majfsvzr2
xDbVAg8K4cNoptZEJbZu6ZTSfiwDTU3xQnoJw40UXhdbNnOD0OTcoYZjOQZxXTN03cDRdRYO
HFT1plEpeKW2CIbd15aJHH9V/yqCKmMKLbGJruuGo1reofmqbXHLNnSbGxjvU9wFn/sbo/ut
0XDx6dP95Ob2/N21388Xs3Zb39k63hLV6v9VY/ur3X3zMh6JDRnLogi1cl5XQfaS+mT/CqGJ
/TCvPRwMYDh6gJcojqEuBQwfx+e/X+/LX9x8GqsYlssowLuSz9/KiGNg3J3fQsJy76i4cHTi
wVMikt3U1XzqbjYLp2H4jOvLu/hDYG7ID8FCCYZJURRLEfwQXHhoW/jzcHR/qzQMgxbuR7eK
muIQ7KdtC0UoHbcNJ0k/Ddei7cB917o2E3ltfvba1CXr0zp5YSmXBeugSq0Up5j5V9X9qUlu
uBDyu5S+r/bvRzi5fhW8rgRcRY3/T2WqrTCdYMnyAJ8G0fLgTMa3ct+gaw7IQivS6sCgq9sb
D/5zffsA4wovPSsCGF3CSWSaZPgI/4DRzc3jGVDXtU/PGi8C1SjRdCwVxOwT2seMZO6Dvn/D
O7yMyqxAD0kbReDBh99v9+UWmLW4rDYePDRFPymLEsypZZsBoSALZTfZzQLWjipWPCBnUheM
0DAwus6knxNWvDW8Rux/6NfN0iWfY3rIwhCPDv/AMm3XGrjEBP7GY1FuAKhpOc8tapnVBcdC
voWG6XUhHzzh3oeM10kLJdmUB6YuTLxS07OGFQWxmKTIcxxqucRyqekYkG6ta5kDNLwquQdX
nVfxzeEamkUcuH3/VQYEx+dUVqx1qG4StLUN/PaRsB//q7jfutrg+/88DH1qUsteYRUiyZbb
WGyDFR5NE9SyDDQ/xuozycMUfOkEmRma3bOCz9dkc2XbRhm3ifFye393hxEVsjquoMIg8+Cl
iCqhTtnWCdOBa7idcBi9ygcSS2eiXF2uTcqnjuPSZzlurHeH+B1FdB1qSrnzRu6ikatTzvh8
Z486GdiulLts5IZbeN1l3YjSgWF2Ri5ZETV+/5adum6bDS6BKcNCR4jTeagJNxgO1/NjVhmu
6UhtfE+2uWNzqLpp6c3O9CM8iwx0yTOO8Wx3IHnmEZ5tmI1XrWM812nWs4/wBrbR8AZHeI6h
D9raPzq/9/AdLR8ndcFk+oMnog6ePfh8AfD5EuDhUsUfHMzXaAa1HIxFvPHyxo45S1OZAjDj
FIKVEGLeirMXwODOZA7JiqLO5UIbAHzuoKkXdx9w7VdiiqZenkE3buJ/9O7+/OLj5jlimPhs
29HRt3T04zqWadAdHWNLxziu4zimvqNjbumYR3VMYlroXnwTXd2MP6xrJBX6lLb3el3+NzrU
kkF5fjnCCnLd9KtVE8WNW8s6kQ1VFOJjqzmjgyM1dcOwV/p346vR7nNmaDsD0lxMil3bEkP7
4tPl+zGcbgCwKd0GuN9+cwyH19Q17AbAIBKAdgBw8Ti6bMU72Yaynp0qFw/vvK7NxEQnS7X6
ElVz7KXUF1Y0oYIduaQDdlozoSjXMctLTDSy5fKAYneLFcE/UXpfRFKrbb+jtm9rpae291tF
EZzICoWjhtGt+WvX5PfUKI0qrMj9rMRyNls3K+umpSqkxFsHrfHZV1RKwKI6/pdJDvIf27yI
CxBNiGIjiHMf/wiy2pl8PBdnUbCiNjvLikAUfsqlVKa2bsDxqhGEyMZQFOV0i6Yy3h61fBUh
vah4k698rIwslr6RVmFQ4PO7rIIok8ZFZR6zN0ixz5e2Z7gfvH5pHcfKqaKwPBdpID252ysr
vYNmWel1627aZaV3rF9GrO82zEpvp2NWegctM5K6nhlXOWiaUf+ga1Z6m7ZZ6e32zXKB3cYZ
t3PQHTX7OWydld5e76z0tptnpfet7nlHbou66Z/RVy9K71tNpNL7P+gijzvqSB+J4fTLr3/g
XXv67fnPX0BtYwuQ1o6e/o5k5b88UIHJlhMAAA==

--=_5d12cb6f.aVQw8tnFbKitLG0SgD4sZZwt6cS5gfp/AjlkSuL9pM/4A1z7
Content-Type: application/gzip
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="dmesg-quantal-vm-quantal-650:20190626084826:x86_64-randconfig-u0-06252111:5.2.0-rc6-08399-ga0afa26:1.gz"

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

--=_5d12cb6f.aVQw8tnFbKitLG0SgD4sZZwt6cS5gfp/AjlkSuL9pM/4A1z7
Content-Type: application/gzip
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="dmesg-quantal-vm-quantal-09ce24fb9434:20190626085827:x86_64-randconfig-u0-06252111:5.2.0-rc3-00046-gc8ecfd6:1.gz"

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
5rRsE9x8A/H12KJIZAIA

--=_5d12cb6f.aVQw8tnFbKitLG0SgD4sZZwt6cS5gfp/AjlkSuL9pM/4A1z7
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reproduce-quantal-vm-quantal-65c56326c384:20190626022309:x86_64-randconfig-u0-06252111:5.2.0-rc6-08445-g8e2fc84:1"

#!/bin/bash

kernel=$1

kvm=(
	qemu-system-x86_64
	-enable-kvm
	-cpu kvm64
	-kernel $kernel
	-m 512
	-smp 2
	-device e1000,netdev=net0
	-netdev user,id=net0
	-boot order=nc
	-no-reboot
	-watchdog i6300esb
	-watchdog-action debug
	-rtc base=localtime
	-serial stdio
	-display none
	-monitor null
)

append=(
	root=/dev/ram0
	hung_task_panic=1
	debug
	apic=debug
	sysrq_always_enabled
	rcupdate.rcu_cpu_stall_timeout=100
	net.ifnames=0
	printk.devkmsg=on
	panic=-1
	softlockup_panic=1
	nmi_watchdog=panic
	oops=panic
	load_ramdisk=2
	prompt_ramdisk=0
	drbd.minor_count=8
	systemd.log_level=err
	ignore_loglevel
	console=tty0
	earlyprintk=ttyS0,115200
	console=ttyS0,115200
	vga=normal
	rw
	drbd.minor_count=8
	rcuperf.shutdown=0
)

"${kvm[@]}" -append "${append[*]}"

--=_5d12cb6f.aVQw8tnFbKitLG0SgD4sZZwt6cS5gfp/AjlkSuL9pM/4A1z7
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="config-5.2.0-rc6-08445-g8e2fc84"

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 5.2.0-rc6 Kernel Configuration
#

#
# Compiler: gcc-5 (Debian 5.5.0-3) 5.4.1 20171010
#
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=50401
CONFIG_CLANG_VERSION=0
CONFIG_CC_HAS_ASM_GOTO=y
CONFIG_CC_HAS_WARN_MAYBE_UNINITIALIZED=y
CONFIG_CC_DISABLE_WARN_MAYBE_UNINITIALIZED=y
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_EXTABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
# CONFIG_HEADER_TEST is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SWAP=y
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
# CONFIG_POSIX_MQUEUE is not set
CONFIG_CROSS_MEMORY_ATTACH=y
# CONFIG_USELIB is not set
# CONFIG_AUDIT is not set
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_PENDING_IRQ=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
CONFIG_GENERIC_IRQ_DEBUGFS=y
# end of IRQ subsystem

CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_DATA=y
CONFIG_ARCH_CLOCKSOURCE_INIT=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=y
# CONFIG_NO_HZ_FULL is not set
CONFIG_NO_HZ=y
CONFIG_HIGH_RES_TIMERS=y
# end of Timers subsystem

# CONFIG_PREEMPT_NONE is not set
# CONFIG_PREEMPT_VOLUNTARY is not set
CONFIG_PREEMPT=y
CONFIG_PREEMPT_COUNT=y

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
# CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_SCHED_AVG_IRQ=y
# CONFIG_BSD_PROCESS_ACCT is not set
# CONFIG_TASKSTATS is not set
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

# CONFIG_CPU_ISOLATION is not set

#
# RCU Subsystem
#
CONFIG_PREEMPT_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_FANOUT=64
CONFIG_RCU_FANOUT_LEAF=16
# CONFIG_RCU_FAST_NO_HZ is not set
CONFIG_RCU_BOOST=y
CONFIG_RCU_BOOST_DELAY=500
CONFIG_RCU_NOCB_CPU=y
# end of RCU Subsystem

CONFIG_BUILD_BIN2C=y
CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y
CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_ARCH_SUPPORTS_INT128=y
# CONFIG_NUMA_BALANCING is not set
CONFIG_CGROUPS=y
# CONFIG_MEMCG is not set
# CONFIG_BLK_CGROUP is not set
# CONFIG_CGROUP_SCHED is not set
# CONFIG_CGROUP_PIDS is not set
# CONFIG_CGROUP_RDMA is not set
# CONFIG_CGROUP_FREEZER is not set
# CONFIG_CPUSETS is not set
# CONFIG_CGROUP_DEVICE is not set
# CONFIG_CGROUP_CPUACCT is not set
# CONFIG_CGROUP_PERF is not set
# CONFIG_CGROUP_BPF is not set
# CONFIG_CGROUP_DEBUG is not set
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
# CONFIG_IPC_NS is not set
CONFIG_USER_NS=y
# CONFIG_PID_NS is not set
CONFIG_NET_NS=y
CONFIG_CHECKPOINT_RESTORE=y
# CONFIG_SCHED_AUTOGROUP is not set
# CONFIG_SYSFS_DEPRECATED is not set
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
# CONFIG_RD_XZ is not set
CONFIG_RD_LZO=y
# CONFIG_RD_LZ4 is not set
# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_SYSCTL=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_BPF=y
# CONFIG_EXPERT is not set
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_PRINTK_NMI=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_PCSPKR_PLATFORM=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_BPF_SYSCALL=y
CONFIG_USERFAULTFD=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_RSEQ=y
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_PERF_USE_VMALLOC=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
CONFIG_DEBUG_PERF_USE_VMALLOC=y
# end of Kernel Performance Events And Counters

CONFIG_VM_EVENT_COUNTERS=y
CONFIG_SLUB_DEBUG=y
CONFIG_COMPAT_BRK=y
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLAB_MERGE_DEFAULT is not set
CONFIG_SLAB_FREELIST_RANDOM=y
CONFIG_SLAB_FREELIST_HARDENED=y
# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
# CONFIG_SLUB_CPU_PARTIAL is not set
# CONFIG_PROFILING is not set
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_64BIT=y
CONFIG_X86_64=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf64-x86-64"
CONFIG_ARCH_DEFCONFIG="arch/x86/configs/x86_64_defconfig"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=28
CONFIG_ARCH_MMAP_RND_BITS_MAX=32
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_FILTER_PGPROT=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ZONE_DMA32=y
CONFIG_AUDIT_ARCH=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_KASAN_SHADOW_OFFSET=0xdffffc0000000000
CONFIG_X86_64_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_ZONE_DMA=y
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
CONFIG_X86_X2APIC=y
# CONFIG_X86_MPPARSE is not set
# CONFIG_GOLDFISH is not set
# CONFIG_RETPOLINE is not set
# CONFIG_X86_CPU_RESCTRL is not set
CONFIG_X86_EXTENDED_PLATFORM=y
# CONFIG_X86_NUMACHIP is not set
# CONFIG_X86_VSMP is not set
# CONFIG_X86_GOLDFISH is not set
# CONFIG_X86_INTEL_MID is not set
# CONFIG_X86_INTEL_LPSS is not set
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
# CONFIG_IOSF_MBI is not set
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
CONFIG_PARAVIRT_DEBUG=y
CONFIG_PARAVIRT_SPINLOCKS=y
# CONFIG_XEN is not set
CONFIG_KVM_GUEST=y
# CONFIG_PVH is not set
# CONFIG_KVM_DEBUG_FS is not set
# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_JAILHOUSE_GUEST is not set
# CONFIG_ACRN_GUEST is not set
# CONFIG_MK8 is not set
# CONFIG_MPSC is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
CONFIG_GENERIC_CPU=y
CONFIG_X86_INTERNODE_CACHE_SHIFT=6
CONFIG_X86_L1_CACHE_SHIFT=6
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=64
CONFIG_X86_DEBUGCTLMSR=y
CONFIG_CPU_SUP_INTEL=y
CONFIG_CPU_SUP_AMD=y
CONFIG_CPU_SUP_HYGON=y
CONFIG_CPU_SUP_CENTAUR=y
CONFIG_CPU_SUP_ZHAOXIN=y
CONFIG_HPET_TIMER=y
CONFIG_DMI=y
# CONFIG_GART_IOMMU is not set
# CONFIG_CALGARY_IOMMU is not set
# CONFIG_MAXSMP is not set
CONFIG_NR_CPUS_RANGE_BEGIN=2
CONFIG_NR_CPUS_RANGE_END=512
CONFIG_NR_CPUS_DEFAULT=64
CONFIG_NR_CPUS=64
CONFIG_SCHED_SMT=y
# CONFIG_SCHED_MC is not set
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
# CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
# CONFIG_X86_MCE is not set

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=y
CONFIG_PERF_EVENTS_INTEL_RAPL=y
CONFIG_PERF_EVENTS_INTEL_CSTATE=y
# CONFIG_PERF_EVENTS_AMD_POWER is not set
# end of Performance monitoring

CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
CONFIG_I8K=m
CONFIG_MICROCODE=y
CONFIG_MICROCODE_INTEL=y
CONFIG_MICROCODE_AMD=y
# CONFIG_MICROCODE_OLD_INTERFACE is not set
CONFIG_X86_MSR=y
# CONFIG_X86_CPUID is not set
CONFIG_X86_5LEVEL=y
CONFIG_X86_CPA_STATISTICS=y
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
# CONFIG_AMD_MEM_ENCRYPT is not set
CONFIG_NUMA=y
CONFIG_AMD_NUMA=y
CONFIG_X86_64_ACPI_NUMA=y
CONFIG_NODES_SPAN_OTHER_NODES=y
# CONFIG_NUMA_EMU is not set
CONFIG_NODES_SHIFT=6
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
# CONFIG_ARCH_MEMORY_PROBE is not set
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
# CONFIG_X86_PMEM_LEGACY is not set
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=y
CONFIG_X86_RESERVE_LOW=64
CONFIG_MTRR=y
# CONFIG_MTRR_SANITIZER is not set
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_ARCH_RANDOM=y
CONFIG_X86_SMAP=y
CONFIG_X86_INTEL_UMIP=y
# CONFIG_X86_INTEL_MPX is not set
# CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS is not set
# CONFIG_EFI is not set
# CONFIG_SECCOMP is not set
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000
CONFIG_SCHED_HRTICK=y
CONFIG_KEXEC=y
CONFIG_KEXEC_FILE=y
CONFIG_ARCH_HAS_KEXEC_PURGATORY=y
# CONFIG_KEXEC_VERIFY_SIG is not set
# CONFIG_CRASH_DUMP is not set
# CONFIG_KEXEC_JUMP is not set
CONFIG_PHYSICAL_START=0x1000000
# CONFIG_RELOCATABLE is not set
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_DYNAMIC_MEMORY_LAYOUT=y
CONFIG_HOTPLUG_CPU=y
CONFIG_BOOTPARAM_HOTPLUG_CPU0=y
# CONFIG_DEBUG_HOTPLUG_CPU0 is not set
CONFIG_LEGACY_VSYSCALL_EMULATE=y
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
CONFIG_HAVE_LIVEPATCH=y
# end of Processor type and features

CONFIG_ARCH_HAS_ADD_PAGES=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_USE_PERCPU_NUMA_NODE_ID=y
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y

#
# Power management and ACPI options
#
CONFIG_ARCH_HIBERNATION_HEADER=y
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
CONFIG_HIBERNATE_CALLBACKS=y
CONFIG_HIBERNATION=y
CONFIG_PM_STD_PARTITION=""
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
CONFIG_PM_AUTOSLEEP=y
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
# CONFIG_PM_DEBUG is not set
CONFIG_PM_CLK=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
CONFIG_ENERGY_MODEL=y
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
CONFIG_ACPI_DEBUGGER=y
CONFIG_ACPI_DEBUGGER_USER=m
CONFIG_ACPI_SPCR_TABLE=y
CONFIG_ACPI_LPIT=y
CONFIG_ACPI_SLEEP=y
CONFIG_ACPI_PROCFS_POWER=y
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
CONFIG_ACPI_EC_DEBUGFS=y
CONFIG_ACPI_AC=m
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_VIDEO=m
CONFIG_ACPI_FAN=m
CONFIG_ACPI_TAD=y
CONFIG_ACPI_DOCK=y
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_PROCESSOR=m
CONFIG_ACPI_IPMI=m
CONFIG_ACPI_HOTPLUG_CPU=y
# CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
# CONFIG_ACPI_THERMAL is not set
CONFIG_ACPI_NUMA=y
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_DEBUG=y
# CONFIG_ACPI_PCI_SLOT is not set
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_MEMORY=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
CONFIG_ACPI_SBS=y
# CONFIG_ACPI_HED is not set
# CONFIG_ACPI_CUSTOM_METHOD is not set
# CONFIG_ACPI_NFIT is not set
# CONFIG_ACPI_HMAT is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
# CONFIG_ACPI_APEI is not set
# CONFIG_DPTF_POWER is not set
CONFIG_ACPI_WATCHDOG=y
# CONFIG_PMIC_OPREGION is not set
CONFIG_ACPI_CONFIGFS=y
CONFIG_X86_PM_TIMER=y
CONFIG_SFI=y

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
# CONFIG_CPU_FREQ_STAT is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=m
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m
# CONFIG_CPU_FREQ_GOV_SCHEDUTIL is not set

#
# CPU frequency scaling drivers
#
# CONFIG_X86_INTEL_PSTATE is not set
CONFIG_X86_PCC_CPUFREQ=m
CONFIG_X86_ACPI_CPUFREQ=m
CONFIG_X86_ACPI_CPUFREQ_CPB=y
CONFIG_X86_POWERNOW_K8=m
CONFIG_X86_AMD_FREQ_SENSITIVITY=m
CONFIG_X86_SPEEDSTEP_CENTRINO=m
CONFIG_X86_P4_CLOCKMOD=y

#
# shared options
#
CONFIG_X86_SPEEDSTEP_LIB=y
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
CONFIG_CPU_IDLE_GOV_LADDER=y
CONFIG_CPU_IDLE_GOV_MENU=y
# CONFIG_CPU_IDLE_GOV_TEO is not set
# end of CPU Idle

# CONFIG_INTEL_IDLE is not set
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_MMCONF_FAM10H=y
CONFIG_ISA_DMA_API=y
CONFIG_AMD_NB=y
# CONFIG_X86_SYSFB is not set
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
# CONFIG_IA32_EMULATION is not set
# CONFIG_X86_X32 is not set
# end of Binary Emulations

CONFIG_HAVE_GENERIC_GUP=y

#
# Firmware Drivers
#
# CONFIG_EDD is not set
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_DMIID=y
CONFIG_DMI_SYSFS=y
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
CONFIG_ISCSI_IBFT_FIND=y
CONFIG_ISCSI_IBFT=y
CONFIG_FW_CFG_SYSFS=m
# CONFIG_FW_CFG_SYSFS_CMDLINE is not set
# CONFIG_GOOGLE_FIRMWARE is not set
CONFIG_EFI_EARLYCON=y

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_HAVE_KVM=y
# CONFIG_VIRTUALIZATION is not set

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_HOTPLUG_SMT=y
CONFIG_HAVE_OPROFILE=y
CONFIG_OPROFILE_NMI_TIMER=y
CONFIG_KPROBES=y
# CONFIG_JUMP_LABEL is not set
CONFIG_OPTPROBES=y
CONFIG_UPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_HAVE_RCU_TABLE_FREE=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_CC_HAS_STACKPROTECTOR_NONE=y
CONFIG_STACKPROTECTOR=y
# CONFIG_STACKPROTECTOR_STRONG is not set
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_CONTEXT_TRACKING=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=28
CONFIG_HAVE_COPY_THREAD_TLS=y
CONFIG_HAVE_STACK_VALIDATION=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_ISA_BUS_API=y
CONFIG_64BIT_TIME=y
CONFIG_HAVE_ARCH_VMAP_STACK=y
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_ARCH_HAS_REFCOUNT=y
CONFIG_REFCOUNT_FULL=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
CONFIG_ARCH_USE_MEMREMAP_PROT=y
# CONFIG_LOCK_EVENT_COUNTS is not set

#
# GCOV-based kernel profiling
#
CONFIG_GCOV_KERNEL=y
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# CONFIG_GCOV_PROFILE_ALL is not set
CONFIG_GCOV_FORMAT_4_7=y
# end of GCOV-based kernel profiling

CONFIG_PLUGIN_HOSTCC="g++"
CONFIG_HAVE_GCC_PLUGINS=y
CONFIG_GCC_PLUGINS=y

#
# GCC plugins
#
# CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
CONFIG_GCC_PLUGIN_RANDSTRUCT=y
# CONFIG_GCC_PLUGIN_RANDSTRUCT_PERFORMANCE is not set
# end of GCC plugins
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULES=y
CONFIG_MODULE_FORCE_LOAD=y
# CONFIG_MODULE_UNLOAD is not set
CONFIG_MODVERSIONS=y
# CONFIG_MODULE_SRCVERSION_ALL is not set
# CONFIG_MODULE_SIG is not set
# CONFIG_MODULE_COMPRESS is not set
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLK_SCSI_REQUEST=y
CONFIG_BLK_DEV_BSG=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_ZONED=y
# CONFIG_BLK_CMDLINE_PARSER is not set
CONFIG_BLK_WBT=y
CONFIG_BLK_WBT_MQ=y
# CONFIG_BLK_DEBUG_FS is not set
CONFIG_BLK_SED_OPAL=y

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_EFI_PARTITION=y
# end of Partition Types

CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_PM=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
CONFIG_IOSCHED_BFQ=y
# end of IO Schedulers

CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=y
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_SELECT_MEMORY_MODEL=y
CONFIG_SPARSEMEM_MANUAL=y
CONFIG_SPARSEMEM=y
CONFIG_NEED_MULTIPLE_NODES=y
CONFIG_HAVE_MEMORY_PRESENT=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_MEMBLOCK_NODE_MAP=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_HAVE_BOOTMEM_INFO_NODE=y
CONFIG_MEMORY_HOTPLUG=y
CONFIG_MEMORY_HOTPLUG_SPARSE=y
CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE=y
CONFIG_MEMORY_HOTREMOVE=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_COMPACTION=y
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
# CONFIG_BOUNCE is not set
CONFIG_VIRT_TO_BUS=y
CONFIG_MMU_NOTIFIER=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
# CONFIG_TRANSPARENT_HUGEPAGE is not set
CONFIG_ARCH_WANTS_THP_SWAP=y
CONFIG_CLEANCACHE=y
CONFIG_FRONTSWAP=y
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
CONFIG_CMA_DEBUGFS=y
CONFIG_CMA_AREAS=7
# CONFIG_MEM_SOFT_DIRTY is not set
# CONFIG_ZSWAP is not set
# CONFIG_ZPOOL is not set
# CONFIG_ZBUD is not set
CONFIG_ZSMALLOC=m
CONFIG_PGTABLE_MAPPING=y
CONFIG_ZSMALLOC_STAT=y
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_ZONE_DEVICE=y
CONFIG_ZONE_DEVICE=y
CONFIG_ARCH_HAS_HMM_MIRROR=y
CONFIG_ARCH_HAS_HMM_DEVICE=y
CONFIG_ARCH_HAS_HMM=y
CONFIG_MIGRATE_VMA_HELPER=y
CONFIG_DEV_PAGEMAP_OPS=y
CONFIG_HMM=y
# CONFIG_HMM_MIRROR is not set
CONFIG_DEVICE_PRIVATE=y
# CONFIG_DEVICE_PUBLIC is not set
CONFIG_FRAME_VECTOR=y
CONFIG_PERCPU_STATS=y
CONFIG_GUP_BENCHMARK=y
CONFIG_ARCH_HAS_PTE_SPECIAL=y
# end of Memory Management options

CONFIG_NET=y

#
# Networking options
#
# CONFIG_PACKET is not set
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
# CONFIG_UNIX_DIAG is not set
# CONFIG_TLS is not set
# CONFIG_XFRM_USER is not set
# CONFIG_NET_KEY is not set
# CONFIG_XDP_SOCKETS is not set
CONFIG_INET=y
# CONFIG_IP_MULTICAST is not set
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE_DEMUX is not set
CONFIG_NET_IP_TUNNEL=y
# CONFIG_SYN_COOKIES is not set
# CONFIG_NET_IPVTI is not set
# CONFIG_NET_FOU is not set
# CONFIG_NET_FOU_IP_TUNNELS is not set
# CONFIG_INET_AH is not set
# CONFIG_INET_ESP is not set
# CONFIG_INET_IPCOMP is not set
CONFIG_INET_TUNNEL=y
CONFIG_INET_DIAG=y
CONFIG_INET_TCP_DIAG=y
# CONFIG_INET_UDP_DIAG is not set
# CONFIG_INET_RAW_DIAG is not set
# CONFIG_INET_DIAG_DESTROY is not set
# CONFIG_TCP_CONG_ADVANCED is not set
CONFIG_TCP_CONG_CUBIC=y
CONFIG_DEFAULT_TCP_CONG="cubic"
# CONFIG_TCP_MD5SIG is not set
CONFIG_IPV6=y
# CONFIG_IPV6_ROUTER_PREF is not set
# CONFIG_IPV6_OPTIMISTIC_DAD is not set
# CONFIG_INET6_AH is not set
# CONFIG_INET6_ESP is not set
# CONFIG_INET6_IPCOMP is not set
# CONFIG_IPV6_MIP6 is not set
# CONFIG_IPV6_VTI is not set
CONFIG_IPV6_SIT=y
# CONFIG_IPV6_SIT_6RD is not set
CONFIG_IPV6_NDISC_NODETYPE=y
# CONFIG_IPV6_TUNNEL is not set
# CONFIG_IPV6_MULTIPLE_TABLES is not set
# CONFIG_IPV6_MROUTE is not set
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
# CONFIG_IPV6_SEG6_HMAC is not set
# CONFIG_NETLABEL is not set
# CONFIG_NETWORK_SECMARK is not set
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
# CONFIG_NETFILTER is not set
# CONFIG_BPFILTER is not set
# CONFIG_IP_DCCP is not set
# CONFIG_IP_SCTP is not set
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
# CONFIG_ATM is not set
# CONFIG_L2TP is not set
# CONFIG_BRIDGE is not set
CONFIG_HAVE_NET_DSA=y
# CONFIG_NET_DSA is not set
# CONFIG_VLAN_8021Q is not set
# CONFIG_DECNET is not set
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
# CONFIG_6LOWPAN is not set
# CONFIG_IEEE802154 is not set
# CONFIG_NET_SCHED is not set
# CONFIG_DCB is not set
CONFIG_DNS_RESOLVER=m
# CONFIG_BATMAN_ADV is not set
# CONFIG_OPENVSWITCH is not set
# CONFIG_VSOCKETS is not set
# CONFIG_NETLINK_DIAG is not set
# CONFIG_MPLS is not set
# CONFIG_NET_NSH is not set
# CONFIG_HSR is not set
# CONFIG_NET_SWITCHDEV is not set
# CONFIG_NET_L3_MASTER_DEV is not set
# CONFIG_NET_NCSI is not set
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_XPS=y
# CONFIG_CGROUP_NET_PRIO is not set
# CONFIG_CGROUP_NET_CLASSID is not set
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
# CONFIG_BPF_JIT is not set
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
# CONFIG_NET_DROP_MONITOR is not set
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
# CONFIG_CAN is not set
# CONFIG_BT is not set
# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
CONFIG_WIRELESS=y
# CONFIG_CFG80211 is not set

#
# CFG80211 needs to be enabled for MAC80211
#
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
# CONFIG_WIMAX is not set
# CONFIG_RFKILL is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_VIRTIO=m
# CONFIG_NET_9P_DEBUG is not set
# CONFIG_CAIF is not set
# CONFIG_CEPH_LIB is not set
# CONFIG_NFC is not set
# CONFIG_PSAMPLE is not set
# CONFIG_NET_IFE is not set
# CONFIG_LWTUNNEL is not set
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
# CONFIG_FAILOVER is not set
CONFIG_HAVE_EBPF_JIT=y

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
CONFIG_EISA=y
# CONFIG_EISA_VLB_PRIMING is not set
CONFIG_EISA_PCI_EISA=y
CONFIG_EISA_VIRTUAL_ROOT=y
CONFIG_EISA_NAMES=y
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
# CONFIG_PCIEPORTBUS is not set
# CONFIG_PCI_MSI is not set
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_STUB is not set
CONFIG_PCI_LOCKLESS_CONFIG=y
# CONFIG_PCI_IOV is not set
# CONFIG_PCI_PRI is not set
# CONFIG_PCI_PASID is not set
# CONFIG_PCI_P2PDMA is not set
CONFIG_PCI_LABEL=y
# CONFIG_HOTPLUG_PCI is not set

#
# PCI controller drivers
#

#
# Cadence PCIe controllers support
#
# end of Cadence PCIe controllers support

#
# DesignWare PCI Core Support
#
# end of DesignWare PCI Core Support
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
# CONFIG_PCI_SW_SWITCHTEC is not set
# end of PCI switch controller drivers

CONFIG_PCCARD=y
# CONFIG_PCMCIA is not set
CONFIG_CARDBUS=y

#
# PC-card bridges
#
# CONFIG_YENTA is not set
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_STANDALONE=y
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
# CONFIG_FW_LOADER_COMPRESS is not set
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
CONFIG_DEBUG_TEST_DRIVER_REMOVE=y
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SPI=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_SCCB=m
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# end of Generic Driver Options

#
# Bus devices
#
# end of Bus devices

# CONFIG_CONNECTOR is not set
CONFIG_GNSS=m
# CONFIG_MTD is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=m
CONFIG_PARPORT_PC=m
# CONFIG_PARPORT_SERIAL is not set
CONFIG_PARPORT_PC_FIFO=y
# CONFIG_PARPORT_PC_SUPERIO is not set
CONFIG_PARPORT_AX88796=m
# CONFIG_PARPORT_1284 is not set
CONFIG_PARPORT_NOT_PC=y
CONFIG_PNP=y
# CONFIG_PNP_DEBUG_MESSAGES is not set

#
# Protocols
#
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
# CONFIG_BLK_DEV_NULL_BLK is not set
# CONFIG_BLK_DEV_FD is not set
# CONFIG_PARIDE is not set
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
# CONFIG_ZRAM is not set
# CONFIG_BLK_DEV_UMEM is not set
# CONFIG_BLK_DEV_LOOP is not set
# CONFIG_BLK_DEV_DRBD is not set
# CONFIG_BLK_DEV_NBD is not set
# CONFIG_BLK_DEV_SKD is not set
# CONFIG_BLK_DEV_SX8 is not set
# CONFIG_BLK_DEV_RAM is not set
# CONFIG_CDROM_PKTCDVD is not set
# CONFIG_ATA_OVER_ETH is not set
# CONFIG_VIRTIO_BLK is not set
# CONFIG_BLK_DEV_RBD is not set
# CONFIG_BLK_DEV_RSXX is not set

#
# NVME Support
#
CONFIG_NVME_CORE=y
# CONFIG_BLK_DEV_NVME is not set
CONFIG_NVME_MULTIPATH=y
CONFIG_NVME_FABRICS=y
CONFIG_NVME_FC=y
CONFIG_NVME_TARGET=y
# CONFIG_NVME_TARGET_LOOP is not set
CONFIG_NVME_TARGET_FC=y
# CONFIG_NVME_TARGET_FCLOOP is not set
# CONFIG_NVME_TARGET_TCP is not set
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=m
CONFIG_AD525X_DPOT=y
CONFIG_AD525X_DPOT_I2C=m
CONFIG_AD525X_DPOT_SPI=m
CONFIG_DUMMY_IRQ=y
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
# CONFIG_SGI_IOC4 is not set
# CONFIG_TIFM_CORE is not set
# CONFIG_ICS932S401 is not set
# CONFIG_ENCLOSURE_SERVICES is not set
# CONFIG_HP_ILO is not set
# CONFIG_APDS9802ALS is not set
CONFIG_ISL29003=m
CONFIG_ISL29020=y
# CONFIG_SENSORS_TSL2550 is not set
# CONFIG_SENSORS_BH1770 is not set
# CONFIG_SENSORS_APDS990X is not set
# CONFIG_HMC6352 is not set
# CONFIG_DS1682 is not set
CONFIG_USB_SWITCH_FSA9480=m
CONFIG_LATTICE_ECP3_CONFIG=y
# CONFIG_SRAM is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
CONFIG_MISC_RTSX=y
CONFIG_PVPANIC=y
CONFIG_C2PORT=y
CONFIG_C2PORT_DURAMAR_2150=y

#
# EEPROM support
#
CONFIG_EEPROM_AT24=m
# CONFIG_EEPROM_AT25 is not set
# CONFIG_EEPROM_LEGACY is not set
# CONFIG_EEPROM_MAX6875 is not set
CONFIG_EEPROM_93CX6=y
# CONFIG_EEPROM_93XX46 is not set
# CONFIG_EEPROM_IDT_89HPESX is not set
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

# CONFIG_CB710_CORE is not set

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=m
# CONFIG_ALTERA_STAPL is not set
# CONFIG_INTEL_MEI is not set
# CONFIG_INTEL_MEI_ME is not set
# CONFIG_INTEL_MEI_TXE is not set
# CONFIG_VMWARE_VMCI is not set

#
# Intel MIC & related support
#

#
# Intel MIC Bus Driver
#
# CONFIG_INTEL_MIC_BUS is not set

#
# SCIF Bus Driver
#
# CONFIG_SCIF_BUS is not set

#
# VOP Bus Driver
#
CONFIG_VOP_BUS=m

#
# Intel MIC Host Driver
#

#
# Intel MIC Card Driver
#

#
# SCIF Driver
#

#
# Intel MIC Coprocessor State Management (COSM) Drivers
#

#
# VOP Driver
#
# CONFIG_VOP is not set
# end of Intel MIC & related support

# CONFIG_GENWQE is not set
CONFIG_ECHO=m
# CONFIG_MISC_ALCOR_PCI is not set
# CONFIG_MISC_RTSX_PCI is not set
CONFIG_MISC_RTSX_USB=y
# CONFIG_HABANA_AI is not set
# end of Misc devices

CONFIG_HAVE_IDE=y
CONFIG_IDE=y

#
# Please see Documentation/ide/ide.rst for help/info on IDE drives
#
CONFIG_IDE_XFER_MODE=y
CONFIG_IDE_TIMINGS=y
CONFIG_IDE_ATAPI=y
# CONFIG_BLK_DEV_IDE_SATA is not set
CONFIG_IDE_GD=m
# CONFIG_IDE_GD_ATA is not set
CONFIG_IDE_GD_ATAPI=y
# CONFIG_BLK_DEV_DELKIN is not set
# CONFIG_BLK_DEV_IDECD is not set
CONFIG_BLK_DEV_IDETAPE=m
# CONFIG_BLK_DEV_IDEACPI is not set
# CONFIG_IDE_TASK_IOCTL is not set
CONFIG_IDE_PROC_FS=y

#
# IDE chipset support/bugfixes
#
# CONFIG_IDE_GENERIC is not set
CONFIG_BLK_DEV_PLATFORM=m
CONFIG_BLK_DEV_CMD640=y
# CONFIG_BLK_DEV_CMD640_ENHANCED is not set
# CONFIG_BLK_DEV_IDEPNP is not set

#
# PCI IDE chipsets support
#
# CONFIG_BLK_DEV_GENERIC is not set
# CONFIG_BLK_DEV_OPTI621 is not set
# CONFIG_BLK_DEV_RZ1000 is not set
# CONFIG_BLK_DEV_AEC62XX is not set
# CONFIG_BLK_DEV_ALI15X3 is not set
# CONFIG_BLK_DEV_AMD74XX is not set
# CONFIG_BLK_DEV_ATIIXP is not set
# CONFIG_BLK_DEV_CMD64X is not set
# CONFIG_BLK_DEV_TRIFLEX is not set
# CONFIG_BLK_DEV_HPT366 is not set
# CONFIG_BLK_DEV_JMICRON is not set
# CONFIG_BLK_DEV_PIIX is not set
# CONFIG_BLK_DEV_IT8172 is not set
# CONFIG_BLK_DEV_IT8213 is not set
# CONFIG_BLK_DEV_IT821X is not set
# CONFIG_BLK_DEV_NS87415 is not set
# CONFIG_BLK_DEV_PDC202XX_OLD is not set
# CONFIG_BLK_DEV_PDC202XX_NEW is not set
# CONFIG_BLK_DEV_SVWKS is not set
# CONFIG_BLK_DEV_SIIMAGE is not set
# CONFIG_BLK_DEV_SIS5513 is not set
# CONFIG_BLK_DEV_SLC90E66 is not set
# CONFIG_BLK_DEV_TRM290 is not set
# CONFIG_BLK_DEV_VIA82CXXX is not set
# CONFIG_BLK_DEV_TC86C001 is not set

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
# CONFIG_RAID_ATTRS is not set
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
# CONFIG_SCSI_PROC_FS is not set

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=y
# CONFIG_CHR_DEV_ST is not set
# CONFIG_BLK_DEV_SR is not set
CONFIG_CHR_DEV_SG=y
CONFIG_CHR_DEV_SCH=m
CONFIG_SCSI_CONSTANTS=y
CONFIG_SCSI_LOGGING=y
CONFIG_SCSI_SCAN_ASYNC=y

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=m
# CONFIG_SCSI_FC_ATTRS is not set
# CONFIG_SCSI_ISCSI_ATTRS is not set
CONFIG_SCSI_SAS_ATTRS=y
CONFIG_SCSI_SAS_LIBSAS=y
# CONFIG_SCSI_SAS_ATA is not set
# CONFIG_SCSI_SAS_HOST_SMP is not set
# CONFIG_SCSI_SRP_ATTRS is not set
# end of SCSI Transports

CONFIG_SCSI_LOWLEVEL=y
# CONFIG_ISCSI_TCP is not set
CONFIG_ISCSI_BOOT_SYSFS=y
# CONFIG_SCSI_CXGB3_ISCSI is not set
# CONFIG_SCSI_CXGB4_ISCSI is not set
# CONFIG_SCSI_BNX2_ISCSI is not set
# CONFIG_BE2ISCSI is not set
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
# CONFIG_SCSI_HPSA is not set
# CONFIG_SCSI_3W_9XXX is not set
# CONFIG_SCSI_3W_SAS is not set
# CONFIG_SCSI_ACARD is not set
CONFIG_SCSI_AHA1740=m
# CONFIG_SCSI_AACRAID is not set
# CONFIG_SCSI_AIC7XXX is not set
# CONFIG_SCSI_AIC79XX is not set
# CONFIG_SCSI_AIC94XX is not set
# CONFIG_SCSI_MVSAS is not set
# CONFIG_SCSI_MVUMI is not set
# CONFIG_SCSI_DPT_I2O is not set
CONFIG_SCSI_ADVANSYS=m
# CONFIG_SCSI_ARCMSR is not set
# CONFIG_SCSI_ESAS2R is not set
# CONFIG_MEGARAID_NEWGEN is not set
# CONFIG_MEGARAID_LEGACY is not set
# CONFIG_MEGARAID_SAS is not set
# CONFIG_SCSI_MPT3SAS is not set
# CONFIG_SCSI_MPT2SAS is not set
# CONFIG_SCSI_SMARTPQI is not set
CONFIG_SCSI_UFSHCD=y
# CONFIG_SCSI_UFSHCD_PCI is not set
CONFIG_SCSI_UFSHCD_PLATFORM=y
# CONFIG_SCSI_UFS_CDNS_PLATFORM is not set
CONFIG_SCSI_UFS_DWC_TC_PLATFORM=y
# CONFIG_SCSI_UFS_BSG is not set
# CONFIG_SCSI_HPTIOP is not set
# CONFIG_SCSI_BUSLOGIC is not set
# CONFIG_SCSI_MYRB is not set
# CONFIG_SCSI_MYRS is not set
# CONFIG_VMWARE_PVSCSI is not set
# CONFIG_SCSI_SNIC is not set
# CONFIG_SCSI_DMX3191D is not set
# CONFIG_SCSI_FDOMAIN_PCI is not set
# CONFIG_SCSI_GDTH is not set
# CONFIG_SCSI_ISCI is not set
# CONFIG_SCSI_IPS is not set
# CONFIG_SCSI_INITIO is not set
# CONFIG_SCSI_INIA100 is not set
CONFIG_SCSI_PPA=m
CONFIG_SCSI_IMM=m
CONFIG_SCSI_IZIP_EPP16=y
CONFIG_SCSI_IZIP_SLOW_CTR=y
# CONFIG_SCSI_STEX is not set
# CONFIG_SCSI_SYM53C8XX_2 is not set
# CONFIG_SCSI_IPR is not set
# CONFIG_SCSI_QLOGIC_1280 is not set
# CONFIG_SCSI_QLA_ISCSI is not set
CONFIG_SCSI_SIM710=m
# CONFIG_SCSI_DC395x is not set
# CONFIG_SCSI_AM53C974 is not set
# CONFIG_SCSI_WD719X is not set
# CONFIG_SCSI_DEBUG is not set
# CONFIG_SCSI_PMCRAID is not set
# CONFIG_SCSI_PM8001 is not set
CONFIG_SCSI_VIRTIO=m
CONFIG_SCSI_DH=y
CONFIG_SCSI_DH_RDAC=y
# CONFIG_SCSI_DH_HP_SW is not set
CONFIG_SCSI_DH_EMC=m
# CONFIG_SCSI_DH_ALUA is not set
# end of SCSI device support

CONFIG_ATA=y
# CONFIG_ATA_VERBOSE_ERROR is not set
CONFIG_ATA_ACPI=y
CONFIG_SATA_ZPODD=y
# CONFIG_SATA_PMP is not set

#
# Controllers with non-SFF native interface
#
# CONFIG_SATA_AHCI is not set
CONFIG_SATA_AHCI_PLATFORM=y
# CONFIG_SATA_INIC162X is not set
# CONFIG_SATA_ACARD_AHCI is not set
# CONFIG_SATA_SIL24 is not set
CONFIG_ATA_SFF=y

#
# SFF controllers with custom DMA interface
#
# CONFIG_PDC_ADMA is not set
# CONFIG_SATA_QSTOR is not set
# CONFIG_SATA_SX4 is not set
CONFIG_ATA_BMDMA=y

#
# SATA SFF controllers with BMDMA
#
# CONFIG_ATA_PIIX is not set
CONFIG_SATA_DWC=y
CONFIG_SATA_DWC_OLD_DMA=y
# CONFIG_SATA_DWC_DEBUG is not set
CONFIG_SATA_MV=y
# CONFIG_SATA_NV is not set
# CONFIG_SATA_PROMISE is not set
# CONFIG_SATA_SIL is not set
# CONFIG_SATA_SIS is not set
# CONFIG_SATA_SVW is not set
# CONFIG_SATA_ULI is not set
# CONFIG_SATA_VIA is not set
# CONFIG_SATA_VITESSE is not set

#
# PATA SFF controllers with BMDMA
#
# CONFIG_PATA_ALI is not set
# CONFIG_PATA_AMD is not set
# CONFIG_PATA_ARTOP is not set
# CONFIG_PATA_ATIIXP is not set
# CONFIG_PATA_ATP867X is not set
# CONFIG_PATA_CMD64X is not set
# CONFIG_PATA_CYPRESS is not set
# CONFIG_PATA_EFAR is not set
# CONFIG_PATA_HPT366 is not set
# CONFIG_PATA_HPT37X is not set
# CONFIG_PATA_HPT3X2N is not set
# CONFIG_PATA_HPT3X3 is not set
# CONFIG_PATA_IT8213 is not set
# CONFIG_PATA_IT821X is not set
# CONFIG_PATA_JMICRON is not set
# CONFIG_PATA_MARVELL is not set
# CONFIG_PATA_NETCELL is not set
# CONFIG_PATA_NINJA32 is not set
# CONFIG_PATA_NS87415 is not set
# CONFIG_PATA_OLDPIIX is not set
# CONFIG_PATA_OPTIDMA is not set
# CONFIG_PATA_PDC2027X is not set
# CONFIG_PATA_PDC_OLD is not set
# CONFIG_PATA_RADISYS is not set
# CONFIG_PATA_RDC is not set
# CONFIG_PATA_SCH is not set
# CONFIG_PATA_SERVERWORKS is not set
# CONFIG_PATA_SIL680 is not set
# CONFIG_PATA_SIS is not set
# CONFIG_PATA_TOSHIBA is not set
# CONFIG_PATA_TRIFLEX is not set
# CONFIG_PATA_VIA is not set
# CONFIG_PATA_WINBOND is not set

#
# PIO-only SFF controllers
#
# CONFIG_PATA_CMD640_PCI is not set
# CONFIG_PATA_MPIIX is not set
# CONFIG_PATA_NS87410 is not set
# CONFIG_PATA_OPTI is not set
# CONFIG_PATA_RZ1000 is not set

#
# Generic fallback / legacy drivers
#
# CONFIG_PATA_ACPI is not set
# CONFIG_ATA_GENERIC is not set
# CONFIG_PATA_LEGACY is not set
CONFIG_MD=y
CONFIG_BLK_DEV_MD=m
# CONFIG_MD_LINEAR is not set
CONFIG_MD_RAID0=m
CONFIG_MD_RAID1=m
CONFIG_MD_RAID10=m
CONFIG_MD_RAID456=m
CONFIG_MD_MULTIPATH=m
# CONFIG_MD_FAULTY is not set
CONFIG_BCACHE=y
# CONFIG_BCACHE_DEBUG is not set
CONFIG_BCACHE_CLOSURES_DEBUG=y
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=m
# CONFIG_DM_DEBUG is not set
CONFIG_DM_BUFIO=m
CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING=y
# CONFIG_DM_DEBUG_BLOCK_STACK_TRACING is not set
CONFIG_DM_BIO_PRISON=m
CONFIG_DM_PERSISTENT_DATA=m
CONFIG_DM_UNSTRIPED=m
CONFIG_DM_CRYPT=m
CONFIG_DM_SNAPSHOT=m
CONFIG_DM_THIN_PROVISIONING=m
# CONFIG_DM_CACHE is not set
CONFIG_DM_WRITECACHE=m
# CONFIG_DM_ERA is not set
CONFIG_DM_MIRROR=m
# CONFIG_DM_LOG_USERSPACE is not set
CONFIG_DM_RAID=m
CONFIG_DM_ZERO=m
CONFIG_DM_MULTIPATH=m
# CONFIG_DM_MULTIPATH_QL is not set
CONFIG_DM_MULTIPATH_ST=m
# CONFIG_DM_DELAY is not set
# CONFIG_DM_DUST is not set
CONFIG_DM_UEVENT=y
CONFIG_DM_FLAKEY=m
CONFIG_DM_VERITY=m
CONFIG_DM_VERITY_FEC=y
# CONFIG_DM_SWITCH is not set
# CONFIG_DM_LOG_WRITES is not set
# CONFIG_DM_INTEGRITY is not set
# CONFIG_DM_ZONED is not set
CONFIG_TARGET_CORE=m
CONFIG_TCM_IBLOCK=m
# CONFIG_TCM_FILEIO is not set
CONFIG_TCM_PSCSI=m
# CONFIG_TCM_USER2 is not set
CONFIG_LOOPBACK_TARGET=m
# CONFIG_ISCSI_TARGET is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

# CONFIG_MACINTOSH_DRIVERS is not set
CONFIG_NETDEVICES=y
CONFIG_NET_CORE=y
# CONFIG_BONDING is not set
# CONFIG_DUMMY is not set
# CONFIG_EQUALIZER is not set
# CONFIG_NET_FC is not set
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_IPVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_GENEVE is not set
# CONFIG_GTP is not set
# CONFIG_MACSEC is not set
# CONFIG_NETCONSOLE is not set
# CONFIG_TUN is not set
# CONFIG_TUN_VNET_CROSS_LE is not set
# CONFIG_VETH is not set
# CONFIG_VIRTIO_NET is not set
# CONFIG_NLMON is not set
# CONFIG_ARCNET is not set

#
# CAIF transport drivers
#

#
# Distributed Switch Architecture drivers
#
# end of Distributed Switch Architecture drivers

CONFIG_ETHERNET=y
CONFIG_NET_VENDOR_3COM=y
# CONFIG_EL3 is not set
# CONFIG_VORTEX is not set
# CONFIG_TYPHOON is not set
CONFIG_NET_VENDOR_ADAPTEC=y
# CONFIG_ADAPTEC_STARFIRE is not set
CONFIG_NET_VENDOR_AGERE=y
# CONFIG_ET131X is not set
CONFIG_NET_VENDOR_ALACRITECH=y
# CONFIG_SLICOSS is not set
CONFIG_NET_VENDOR_ALTEON=y
# CONFIG_ACENIC is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=y
CONFIG_NET_VENDOR_AMD=y
# CONFIG_AMD8111_ETH is not set
# CONFIG_PCNET32 is not set
# CONFIG_AMD_XGBE is not set
CONFIG_NET_VENDOR_AQUANTIA=y
# CONFIG_AQTION is not set
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ATHEROS=y
# CONFIG_ATL2 is not set
# CONFIG_ATL1 is not set
# CONFIG_ATL1E is not set
# CONFIG_ATL1C is not set
# CONFIG_ALX is not set
CONFIG_NET_VENDOR_AURORA=y
# CONFIG_AURORA_NB8800 is not set
CONFIG_NET_VENDOR_BROADCOM=y
# CONFIG_B44 is not set
# CONFIG_BCMGENET is not set
# CONFIG_BNX2 is not set
# CONFIG_CNIC is not set
# CONFIG_TIGON3 is not set
# CONFIG_BNX2X is not set
# CONFIG_SYSTEMPORT is not set
# CONFIG_BNXT is not set
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
CONFIG_NET_VENDOR_CADENCE=y
# CONFIG_MACB is not set
CONFIG_NET_VENDOR_CAVIUM=y
# CONFIG_THUNDER_NIC_PF is not set
# CONFIG_THUNDER_NIC_VF is not set
# CONFIG_THUNDER_NIC_BGX is not set
# CONFIG_THUNDER_NIC_RGX is not set
# CONFIG_CAVIUM_PTP is not set
# CONFIG_LIQUIDIO is not set
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
CONFIG_NET_VENDOR_CIRRUS=y
# CONFIG_CS89x0 is not set
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
CONFIG_NET_VENDOR_CORTINA=y
# CONFIG_CX_ECAT is not set
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_DEC=y
# CONFIG_NET_TULIP is not set
CONFIG_NET_VENDOR_DLINK=y
# CONFIG_DL2K is not set
# CONFIG_SUNDANCE is not set
CONFIG_NET_VENDOR_EMULEX=y
# CONFIG_BE2NET is not set
CONFIG_NET_VENDOR_EZCHIP=y
CONFIG_NET_VENDOR_HP=y
# CONFIG_HP100 is not set
CONFIG_NET_VENDOR_HUAWEI=y
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
# CONFIG_E1000E is not set
# CONFIG_IGB is not set
# CONFIG_IGBVF is not set
# CONFIG_IXGB is not set
# CONFIG_IXGBE is not set
# CONFIG_I40E is not set
# CONFIG_IGC is not set
# CONFIG_JME is not set
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MVMDIO is not set
# CONFIG_SKGE is not set
# CONFIG_SKY2 is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
CONFIG_NET_VENDOR_MICREL=y
# CONFIG_KS8842 is not set
# CONFIG_KS8851 is not set
# CONFIG_KS8851_MLL is not set
# CONFIG_KSZ884X_PCI is not set
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_ENC28J60 is not set
# CONFIG_ENCX24J600 is not set
# CONFIG_LAN743X is not set
CONFIG_NET_VENDOR_MICROSEMI=y
CONFIG_NET_VENDOR_MYRI=y
# CONFIG_MYRI10GE is not set
# CONFIG_FEALNX is not set
CONFIG_NET_VENDOR_NATSEMI=y
# CONFIG_NATSEMI is not set
# CONFIG_NS83820 is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
# CONFIG_VXGE is not set
CONFIG_NET_VENDOR_NETRONOME=y
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_8390=y
# CONFIG_NE2K_PCI is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
CONFIG_NET_VENDOR_OKI=y
# CONFIG_ETHOC is not set
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
CONFIG_NET_VENDOR_QLOGIC=y
# CONFIG_QLA3XXX is not set
# CONFIG_QLCNIC is not set
# CONFIG_QLGE is not set
# CONFIG_NETXEN_NIC is not set
# CONFIG_QED is not set
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCOM_EMAC is not set
# CONFIG_RMNET is not set
CONFIG_NET_VENDOR_RDC=y
# CONFIG_R6040 is not set
CONFIG_NET_VENDOR_REALTEK=y
# CONFIG_ATP is not set
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
# CONFIG_R8169 is not set
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
CONFIG_NET_VENDOR_SEEQ=y
CONFIG_NET_VENDOR_SOLARFLARE=y
# CONFIG_SFC is not set
# CONFIG_SFC_FALCON is not set
CONFIG_NET_VENDOR_SILAN=y
# CONFIG_SC92031 is not set
CONFIG_NET_VENDOR_SIS=y
# CONFIG_SIS900 is not set
# CONFIG_SIS190 is not set
CONFIG_NET_VENDOR_SMSC=y
# CONFIG_EPIC100 is not set
# CONFIG_SMSC911X is not set
# CONFIG_SMSC9420 is not set
CONFIG_NET_VENDOR_SOCIONEXT=y
CONFIG_NET_VENDOR_STMICRO=y
# CONFIG_STMMAC_ETH is not set
CONFIG_NET_VENDOR_SUN=y
# CONFIG_HAPPYMEAL is not set
# CONFIG_SUNGEM is not set
# CONFIG_CASSINI is not set
# CONFIG_NIU is not set
CONFIG_NET_VENDOR_SYNOPSYS=y
# CONFIG_DWC_XLGMAC is not set
CONFIG_NET_VENDOR_TEHUTI=y
# CONFIG_TEHUTI is not set
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
# CONFIG_TLAN is not set
CONFIG_NET_VENDOR_VIA=y
# CONFIG_VIA_RHINE is not set
# CONFIG_VIA_VELOCITY is not set
CONFIG_NET_VENDOR_WIZNET=y
# CONFIG_WIZNET_W5100 is not set
# CONFIG_WIZNET_W5300 is not set
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_AXI_EMAC is not set
# CONFIG_XILINX_LL_TEMAC is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_NET_SB1000 is not set
# CONFIG_MDIO_DEVICE is not set
# CONFIG_PHYLIB is not set
# CONFIG_MICREL_KS8995MA is not set
# CONFIG_PLIP is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set
CONFIG_USB_NET_DRIVERS=y
# CONFIG_USB_CATC is not set
# CONFIG_USB_KAWETH is not set
# CONFIG_USB_PEGASUS is not set
# CONFIG_USB_RTL8150 is not set
# CONFIG_USB_RTL8152 is not set
# CONFIG_USB_LAN78XX is not set
# CONFIG_USB_USBNET is not set
# CONFIG_USB_IPHETH is not set
CONFIG_WLAN=y
CONFIG_WLAN_VENDOR_ADMTEK=y
CONFIG_WLAN_VENDOR_ATH=y
# CONFIG_ATH_DEBUG is not set
# CONFIG_ATH5K_PCI is not set
CONFIG_WLAN_VENDOR_ATMEL=y
CONFIG_WLAN_VENDOR_BROADCOM=y
CONFIG_WLAN_VENDOR_CISCO=y
CONFIG_WLAN_VENDOR_INTEL=y
CONFIG_WLAN_VENDOR_INTERSIL=y
# CONFIG_HOSTAP is not set
# CONFIG_PRISM54 is not set
CONFIG_WLAN_VENDOR_MARVELL=y
CONFIG_WLAN_VENDOR_MEDIATEK=y
CONFIG_WLAN_VENDOR_RALINK=y
CONFIG_WLAN_VENDOR_REALTEK=y
CONFIG_WLAN_VENDOR_RSI=y
CONFIG_WLAN_VENDOR_ST=y
CONFIG_WLAN_VENDOR_TI=y
CONFIG_WLAN_VENDOR_ZYDAS=y
CONFIG_WLAN_VENDOR_QUANTENNA=y

#
# Enable WiMAX (Networking options) to see the WiMAX drivers
#
# CONFIG_WAN is not set
# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
# CONFIG_NETDEVSIM is not set
# CONFIG_NET_FAILOVER is not set
# CONFIG_ISDN is not set
CONFIG_NVM=y
CONFIG_NVM_PBLK=m
# CONFIG_NVM_PBLK_DEBUG is not set

#
# Input device support
#
CONFIG_INPUT=y
# CONFIG_INPUT_LEDS is not set
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_POLLDEV=y
CONFIG_INPUT_SPARSEKMAP=m
CONFIG_INPUT_MATRIXKMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=y
CONFIG_INPUT_EVDEV=y
CONFIG_INPUT_EVBUG=y

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
CONFIG_KEYBOARD_ADC=m
CONFIG_KEYBOARD_ADP5588=y
CONFIG_KEYBOARD_ADP5589=y
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_QT1050 is not set
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
CONFIG_KEYBOARD_LKKBD=y
# CONFIG_KEYBOARD_GPIO is not set
CONFIG_KEYBOARD_GPIO_POLLED=y
CONFIG_KEYBOARD_TCA6416=y
# CONFIG_KEYBOARD_TCA8418 is not set
CONFIG_KEYBOARD_MATRIX=m
CONFIG_KEYBOARD_LM8323=m
CONFIG_KEYBOARD_LM8333=y
CONFIG_KEYBOARD_MAX7359=m
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
CONFIG_KEYBOARD_NEWTON=y
# CONFIG_KEYBOARD_OPENCORES is not set
CONFIG_KEYBOARD_SAMSUNG=m
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_XTKBD is not set
CONFIG_KEYBOARD_CROS_EC=m
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
CONFIG_MOUSE_PS2_ALPS=y
CONFIG_MOUSE_PS2_BYD=y
CONFIG_MOUSE_PS2_LOGIPS2PP=y
CONFIG_MOUSE_PS2_SYNAPTICS=y
CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y
CONFIG_MOUSE_PS2_CYPRESS=y
CONFIG_MOUSE_PS2_LIFEBOOK=y
CONFIG_MOUSE_PS2_TRACKPOINT=y
# CONFIG_MOUSE_PS2_ELANTECH is not set
CONFIG_MOUSE_PS2_SENTELIC=y
CONFIG_MOUSE_PS2_TOUCHKIT=y
CONFIG_MOUSE_PS2_FOCALTECH=y
# CONFIG_MOUSE_PS2_VMMOUSE is not set
CONFIG_MOUSE_PS2_SMBUS=y
# CONFIG_MOUSE_SERIAL is not set
CONFIG_MOUSE_APPLETOUCH=y
# CONFIG_MOUSE_BCM5974 is not set
CONFIG_MOUSE_CYAPA=m
CONFIG_MOUSE_ELAN_I2C=y
# CONFIG_MOUSE_ELAN_I2C_I2C is not set
CONFIG_MOUSE_ELAN_I2C_SMBUS=y
# CONFIG_MOUSE_VSXXXAA is not set
CONFIG_MOUSE_GPIO=m
CONFIG_MOUSE_SYNAPTICS_I2C=y
CONFIG_MOUSE_SYNAPTICS_USB=y
# CONFIG_INPUT_JOYSTICK is not set
CONFIG_INPUT_TABLET=y
# CONFIG_TABLET_USB_ACECAD is not set
CONFIG_TABLET_USB_AIPTEK=y
CONFIG_TABLET_USB_GTCO=y
CONFIG_TABLET_USB_HANWANG=m
# CONFIG_TABLET_USB_KBTAB is not set
CONFIG_TABLET_USB_PEGASUS=y
CONFIG_TABLET_SERIAL_WACOM4=m
# CONFIG_INPUT_TOUCHSCREEN is not set
CONFIG_INPUT_MISC=y
# CONFIG_INPUT_88PM80X_ONKEY is not set
CONFIG_INPUT_AD714X=y
# CONFIG_INPUT_AD714X_I2C is not set
CONFIG_INPUT_AD714X_SPI=m
# CONFIG_INPUT_BMA150 is not set
CONFIG_INPUT_E3X0_BUTTON=y
# CONFIG_INPUT_MSM_VIBRATOR is not set
# CONFIG_INPUT_PCSPKR is not set
# CONFIG_INPUT_MC13783_PWRBUTTON is not set
# CONFIG_INPUT_MMA8450 is not set
CONFIG_INPUT_APANEL=y
# CONFIG_INPUT_GP2A is not set
CONFIG_INPUT_GPIO_BEEPER=m
CONFIG_INPUT_GPIO_DECODER=m
CONFIG_INPUT_GPIO_VIBRA=m
CONFIG_INPUT_ATLAS_BTNS=y
CONFIG_INPUT_ATI_REMOTE2=y
CONFIG_INPUT_KEYSPAN_REMOTE=y
# CONFIG_INPUT_KXTJ9 is not set
CONFIG_INPUT_POWERMATE=m
# CONFIG_INPUT_YEALINK is not set
CONFIG_INPUT_CM109=y
# CONFIG_INPUT_REGULATOR_HAPTIC is not set
CONFIG_INPUT_AXP20X_PEK=m
CONFIG_INPUT_TWL6040_VIBRA=m
# CONFIG_INPUT_UINPUT is not set
CONFIG_INPUT_PALMAS_PWRBUTTON=m
CONFIG_INPUT_PCF50633_PMU=y
# CONFIG_INPUT_PCF8574 is not set
CONFIG_INPUT_PWM_BEEPER=m
# CONFIG_INPUT_PWM_VIBRA is not set
# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
CONFIG_INPUT_DA9052_ONKEY=y
# CONFIG_INPUT_DA9055_ONKEY is not set
# CONFIG_INPUT_DA9063_ONKEY is not set
CONFIG_INPUT_WM831X_ON=m
CONFIG_INPUT_PCAP=y
# CONFIG_INPUT_ADXL34X is not set
CONFIG_INPUT_IMS_PCU=y
CONFIG_INPUT_CMA3000=m
# CONFIG_INPUT_CMA3000_I2C is not set
# CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
# CONFIG_INPUT_DRV260X_HAPTICS is not set
CONFIG_INPUT_DRV2665_HAPTICS=y
CONFIG_INPUT_DRV2667_HAPTICS=m
CONFIG_RMI4_CORE=y
CONFIG_RMI4_I2C=y
# CONFIG_RMI4_SPI is not set
CONFIG_RMI4_SMB=y
# CONFIG_RMI4_F03 is not set
# CONFIG_RMI4_F11 is not set
# CONFIG_RMI4_F12 is not set
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
# CONFIG_RMI4_F55 is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
CONFIG_SERIO_CT82C710=y
CONFIG_SERIO_PARKBD=m
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
# CONFIG_SERIO_RAW is not set
CONFIG_SERIO_ALTERA_PS2=m
CONFIG_SERIO_PS2MULT=y
CONFIG_SERIO_ARC_PS2=m
# CONFIG_SERIO_GPIO_PS2 is not set
CONFIG_USERIO=m
CONFIG_GAMEPORT=m
CONFIG_GAMEPORT_NS558=m
# CONFIG_GAMEPORT_L4 is not set
# CONFIG_GAMEPORT_EMU10K1 is not set
# CONFIG_GAMEPORT_FM801 is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256
# CONFIG_SERIAL_NONSTANDARD is not set
# CONFIG_NOZOMI is not set
# CONFIG_N_GSM is not set
CONFIG_TRACE_ROUTER=m
CONFIG_TRACE_SINK=y
CONFIG_NULL_TTY=y
# CONFIG_LDISC_AUTOLOAD is not set
# CONFIG_DEVMEM is not set
CONFIG_DEVKMEM=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
CONFIG_SERIAL_8250_PNP=y
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_DMA=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
# CONFIG_SERIAL_8250_EXTENDED is not set
CONFIG_SERIAL_8250_DW=y
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y
# CONFIG_SERIAL_8250_MOXA is not set

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_MAX3100 is not set
# CONFIG_SERIAL_MAX310X is not set
CONFIG_SERIAL_UARTLITE=m
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_JSM is not set
CONFIG_SERIAL_SCCNXP=m
# CONFIG_SERIAL_SC16IS7XX is not set
CONFIG_SERIAL_ALTERA_JTAGUART=m
CONFIG_SERIAL_ALTERA_UART=y
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
CONFIG_SERIAL_ALTERA_UART_CONSOLE=y
CONFIG_SERIAL_IFX6X60=y
CONFIG_SERIAL_ARC=y
# CONFIG_SERIAL_ARC_CONSOLE is not set
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_RP2 is not set
CONFIG_SERIAL_FSL_LPUART=y
# CONFIG_SERIAL_FSL_LPUART_CONSOLE is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
# CONFIG_SERIAL_DEV_BUS is not set
# CONFIG_PRINTER is not set
# CONFIG_PPDEV is not set
CONFIG_HVC_DRIVER=y
CONFIG_VIRTIO_CONSOLE=m
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_DMI_DECODE=y
CONFIG_IPMI_PLAT_DATA=y
# CONFIG_IPMI_PANIC_EVENT is not set
CONFIG_IPMI_DEVICE_INTERFACE=m
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=m
# CONFIG_IPMI_WATCHDOG is not set
# CONFIG_IPMI_POWEROFF is not set
# CONFIG_IPMB_DEVICE_INTERFACE is not set
# CONFIG_HW_RANDOM is not set
CONFIG_NVRAM=y
# CONFIG_APPLICOM is not set
CONFIG_MWAVE=y
CONFIG_RAW_DRIVER=y
CONFIG_MAX_RAW_DEVS=256
# CONFIG_HPET is not set
# CONFIG_HANGCHECK_TIMER is not set
CONFIG_TCG_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
CONFIG_TCG_TIS_SPI=y
CONFIG_TCG_TIS_I2C_ATMEL=y
# CONFIG_TCG_TIS_I2C_INFINEON is not set
CONFIG_TCG_TIS_I2C_NUVOTON=y
CONFIG_TCG_NSC=y
CONFIG_TCG_ATMEL=y
# CONFIG_TCG_INFINEON is not set
# CONFIG_TCG_CRB is not set
# CONFIG_TCG_VTPM_PROXY is not set
CONFIG_TCG_TIS_ST33ZP24=y
CONFIG_TCG_TIS_ST33ZP24_I2C=m
CONFIG_TCG_TIS_ST33ZP24_SPI=y
CONFIG_TELCLOCK=m
CONFIG_DEVPORT=y
# CONFIG_XILLYBUS is not set
# end of Character devices

# CONFIG_RANDOM_TRUST_CPU is not set

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_COMPAT is not set
# CONFIG_I2C_CHARDEV is not set
# CONFIG_I2C_MUX is not set
CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=y
CONFIG_I2C_ALGOBIT=y

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_AMD_MP2 is not set
# CONFIG_I2C_I801 is not set
# CONFIG_I2C_ISCH is not set
# CONFIG_I2C_ISMT is not set
# CONFIG_I2C_PIIX4 is not set
CONFIG_I2C_CHT_WC=m
# CONFIG_I2C_NFORCE2 is not set
# CONFIG_I2C_NVIDIA_GPU is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
# CONFIG_I2C_SIS96X is not set
# CONFIG_I2C_VIA is not set
# CONFIG_I2C_VIAPRO is not set

#
# ACPI drivers
#
CONFIG_I2C_SCMI=y

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
CONFIG_I2C_CBUS_GPIO=m
CONFIG_I2C_DESIGNWARE_CORE=y
CONFIG_I2C_DESIGNWARE_PLATFORM=y
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_EMEV2 is not set
CONFIG_I2C_GPIO=m
CONFIG_I2C_GPIO_FAULT_INJECTOR=y
CONFIG_I2C_KEMPLD=y
CONFIG_I2C_OCORES=y
# CONFIG_I2C_PCA_PLATFORM is not set
CONFIG_I2C_SIMTEC=y
CONFIG_I2C_XILINX=m

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=y
CONFIG_I2C_PARPORT=m
CONFIG_I2C_PARPORT_LIGHT=y
CONFIG_I2C_ROBOTFUZZ_OSIF=m
CONFIG_I2C_TAOS_EVM=m
# CONFIG_I2C_TINY_USB is not set
CONFIG_I2C_VIPERBOARD=y

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=y
# CONFIG_I2C_CROS_EC_TUNNEL is not set
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=y
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

CONFIG_I3C=y
CONFIG_CDNS_I3C_MASTER=m
# CONFIG_DW_I3C_MASTER is not set
CONFIG_SPI=y
CONFIG_SPI_DEBUG=y
CONFIG_SPI_MASTER=y
# CONFIG_SPI_MEM is not set

#
# SPI Master Controller Drivers
#
CONFIG_SPI_ALTERA=m
# CONFIG_SPI_AXI_SPI_ENGINE is not set
CONFIG_SPI_BITBANG=y
CONFIG_SPI_BUTTERFLY=m
CONFIG_SPI_CADENCE=m
CONFIG_SPI_DESIGNWARE=y
# CONFIG_SPI_DW_PCI is not set
CONFIG_SPI_DW_MMIO=m
CONFIG_SPI_NXP_FLEXSPI=y
CONFIG_SPI_GPIO=y
# CONFIG_SPI_LM70_LLP is not set
CONFIG_SPI_OC_TINY=m
# CONFIG_SPI_PXA2XX is not set
CONFIG_SPI_ROCKCHIP=m
CONFIG_SPI_SC18IS602=m
CONFIG_SPI_SIFIVE=y
CONFIG_SPI_MXIC=m
# CONFIG_SPI_XCOMM is not set
CONFIG_SPI_XILINX=y
CONFIG_SPI_ZYNQMP_GQSPI=y

#
# SPI Protocol Masters
#
CONFIG_SPI_SPIDEV=y
CONFIG_SPI_LOOPBACK_TEST=m
# CONFIG_SPI_TLE62X0 is not set
CONFIG_SPI_SLAVE=y
CONFIG_SPI_SLAVE_TIME=y
CONFIG_SPI_SLAVE_SYSTEM_CONTROL=y
# CONFIG_SPMI is not set
CONFIG_HSI=m
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
CONFIG_HSI_CHAR=m
CONFIG_PPS=m
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
CONFIG_PPS_CLIENT_KTIMER=m
CONFIG_PPS_CLIENT_LDISC=m
# CONFIG_PPS_CLIENT_PARPORT is not set
CONFIG_PPS_CLIENT_GPIO=m

#
# PPS generators support
#

#
# PTP clock support
#
# CONFIG_PTP_1588_CLOCK is not set

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# end of PTP clock support

# CONFIG_PINCTRL is not set
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIO_ACPI=y
CONFIG_GPIOLIB_IRQCHIP=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_MAX730X=m

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_AMDPT is not set
CONFIG_GPIO_DWAPB=y
# CONFIG_GPIO_EXAR is not set
CONFIG_GPIO_GENERIC_PLATFORM=y
# CONFIG_GPIO_ICH is not set
# CONFIG_GPIO_LYNXPOINT is not set
CONFIG_GPIO_MB86S7X=m
# CONFIG_GPIO_SIOX is not set
# CONFIG_GPIO_VX855 is not set
# CONFIG_GPIO_XILINX is not set
CONFIG_GPIO_AMD_FCH=y
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
CONFIG_GPIO_F7188X=m
CONFIG_GPIO_IT87=y
# CONFIG_GPIO_SCH is not set
CONFIG_GPIO_SCH311X=y
CONFIG_GPIO_WINBOND=m
CONFIG_GPIO_WS16C48=m
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_ADP5588 is not set
CONFIG_GPIO_MAX7300=m
CONFIG_GPIO_MAX732X=y
CONFIG_GPIO_MAX732X_IRQ=y
# CONFIG_GPIO_PCA953X is not set
CONFIG_GPIO_PCF857X=y
CONFIG_GPIO_TPIC2810=y
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# CONFIG_GPIO_ARIZONA is not set
CONFIG_GPIO_BD9571MWV=m
CONFIG_GPIO_DA9052=m
CONFIG_GPIO_DA9055=y
CONFIG_GPIO_KEMPLD=y
CONFIG_GPIO_LP3943=m
CONFIG_GPIO_LP873X=m
CONFIG_GPIO_PALMAS=y
CONFIG_GPIO_TPS65086=m
CONFIG_GPIO_TPS6586X=y
# CONFIG_GPIO_TPS65910 is not set
CONFIG_GPIO_TPS65912=m
CONFIG_GPIO_TQMX86=y
CONFIG_GPIO_TWL6040=y
# CONFIG_GPIO_WM831X is not set
CONFIG_GPIO_WM8994=m
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_BT8XX is not set
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCI_IDIO_16 is not set
# CONFIG_GPIO_PCIE_IDIO_24 is not set
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# SPI GPIO expanders
#
# CONFIG_GPIO_MAX3191X is not set
# CONFIG_GPIO_MAX7301 is not set
CONFIG_GPIO_MC33880=y
# CONFIG_GPIO_PISOSR is not set
# CONFIG_GPIO_XRA1403 is not set
# end of SPI GPIO expanders

#
# USB GPIO expanders
#
CONFIG_GPIO_VIPERBOARD=m
# end of USB GPIO expanders

CONFIG_GPIO_MOCKUP=y
CONFIG_W1=y

#
# 1-wire Bus Masters
#
# CONFIG_W1_MASTER_MATROX is not set
CONFIG_W1_MASTER_DS2490=y
CONFIG_W1_MASTER_DS2482=y
CONFIG_W1_MASTER_DS1WM=y
# CONFIG_W1_MASTER_GPIO is not set
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=m
CONFIG_W1_SLAVE_SMEM=y
CONFIG_W1_SLAVE_DS2405=m
# CONFIG_W1_SLAVE_DS2408 is not set
CONFIG_W1_SLAVE_DS2413=y
CONFIG_W1_SLAVE_DS2406=m
# CONFIG_W1_SLAVE_DS2423 is not set
# CONFIG_W1_SLAVE_DS2805 is not set
CONFIG_W1_SLAVE_DS2431=m
# CONFIG_W1_SLAVE_DS2433 is not set
CONFIG_W1_SLAVE_DS2438=y
CONFIG_W1_SLAVE_DS2780=y
CONFIG_W1_SLAVE_DS2781=y
CONFIG_W1_SLAVE_DS28E04=m
CONFIG_W1_SLAVE_DS28E17=m
# end of 1-wire Slaves

# CONFIG_POWER_AVS is not set
CONFIG_POWER_RESET=y
CONFIG_POWER_RESET_RESTART=y
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_PDA_POWER=y
CONFIG_GENERIC_ADC_BATTERY=m
CONFIG_WM831X_BACKUP=y
CONFIG_WM831X_POWER=y
# CONFIG_TEST_POWER is not set
# CONFIG_CHARGER_ADP5061 is not set
CONFIG_BATTERY_DS2760=y
CONFIG_BATTERY_DS2780=y
CONFIG_BATTERY_DS2781=m
CONFIG_BATTERY_DS2782=y
CONFIG_BATTERY_SBS=m
CONFIG_CHARGER_SBS=m
# CONFIG_BATTERY_BQ27XXX is not set
CONFIG_BATTERY_DA9030=y
CONFIG_BATTERY_DA9052=y
CONFIG_BATTERY_DA9150=m
CONFIG_CHARGER_AXP20X=m
# CONFIG_BATTERY_AXP20X is not set
CONFIG_AXP20X_POWER=m
# CONFIG_AXP288_CHARGER is not set
CONFIG_AXP288_FUEL_GAUGE=m
CONFIG_BATTERY_MAX17040=m
CONFIG_BATTERY_MAX17042=m
# CONFIG_BATTERY_MAX1721X is not set
CONFIG_CHARGER_PCF50633=y
CONFIG_CHARGER_ISP1704=m
# CONFIG_CHARGER_MAX8903 is not set
CONFIG_CHARGER_LP8727=m
# CONFIG_CHARGER_GPIO is not set
CONFIG_CHARGER_MANAGER=y
# CONFIG_CHARGER_LT3651 is not set
# CONFIG_CHARGER_BQ2415X is not set
CONFIG_CHARGER_BQ24190=y
CONFIG_CHARGER_BQ24257=m
# CONFIG_CHARGER_BQ24735 is not set
# CONFIG_CHARGER_BQ25890 is not set
CONFIG_CHARGER_SMB347=m
CONFIG_CHARGER_TPS65090=m
CONFIG_BATTERY_GAUGE_LTC2941=m
CONFIG_BATTERY_RT5033=y
CONFIG_CHARGER_RT9455=m
# CONFIG_CHARGER_CROS_USBPD is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
CONFIG_HWMON_DEBUG_CHIP=y

#
# Native drivers
#
# CONFIG_SENSORS_ABITUGURU is not set
CONFIG_SENSORS_ABITUGURU3=m
CONFIG_SENSORS_AD7314=m
CONFIG_SENSORS_AD7414=y
CONFIG_SENSORS_AD7418=m
CONFIG_SENSORS_ADM1021=y
CONFIG_SENSORS_ADM1025=m
# CONFIG_SENSORS_ADM1026 is not set
# CONFIG_SENSORS_ADM1029 is not set
# CONFIG_SENSORS_ADM1031 is not set
# CONFIG_SENSORS_ADM9240 is not set
CONFIG_SENSORS_ADT7X10=m
CONFIG_SENSORS_ADT7310=m
CONFIG_SENSORS_ADT7410=m
CONFIG_SENSORS_ADT7411=y
CONFIG_SENSORS_ADT7462=m
# CONFIG_SENSORS_ADT7470 is not set
CONFIG_SENSORS_ADT7475=m
# CONFIG_SENSORS_ASC7621 is not set
# CONFIG_SENSORS_K8TEMP is not set
# CONFIG_SENSORS_K10TEMP is not set
# CONFIG_SENSORS_FAM15H_POWER is not set
CONFIG_SENSORS_APPLESMC=y
# CONFIG_SENSORS_ASB100 is not set
# CONFIG_SENSORS_ASPEED is not set
CONFIG_SENSORS_ATXP1=y
# CONFIG_SENSORS_DS620 is not set
CONFIG_SENSORS_DS1621=y
CONFIG_SENSORS_DELL_SMM=y
# CONFIG_SENSORS_DA9052_ADC is not set
CONFIG_SENSORS_DA9055=y
# CONFIG_SENSORS_I5K_AMB is not set
CONFIG_SENSORS_F71805F=y
CONFIG_SENSORS_F71882FG=m
CONFIG_SENSORS_F75375S=y
CONFIG_SENSORS_MC13783_ADC=y
CONFIG_SENSORS_FSCHMD=y
CONFIG_SENSORS_FTSTEUTATES=m
# CONFIG_SENSORS_GL518SM is not set
# CONFIG_SENSORS_GL520SM is not set
CONFIG_SENSORS_G760A=m
CONFIG_SENSORS_G762=y
# CONFIG_SENSORS_HIH6130 is not set
CONFIG_SENSORS_IBMAEM=m
# CONFIG_SENSORS_IBMPEX is not set
# CONFIG_SENSORS_IIO_HWMON is not set
# CONFIG_SENSORS_I5500 is not set
CONFIG_SENSORS_CORETEMP=m
CONFIG_SENSORS_IT87=m
CONFIG_SENSORS_JC42=m
CONFIG_SENSORS_POWR1220=m
CONFIG_SENSORS_LINEAGE=y
# CONFIG_SENSORS_LTC2945 is not set
CONFIG_SENSORS_LTC2990=y
# CONFIG_SENSORS_LTC4151 is not set
CONFIG_SENSORS_LTC4215=m
CONFIG_SENSORS_LTC4222=m
CONFIG_SENSORS_LTC4245=y
# CONFIG_SENSORS_LTC4260 is not set
CONFIG_SENSORS_LTC4261=m
CONFIG_SENSORS_MAX1111=y
CONFIG_SENSORS_MAX16065=y
CONFIG_SENSORS_MAX1619=m
CONFIG_SENSORS_MAX1668=y
CONFIG_SENSORS_MAX197=m
CONFIG_SENSORS_MAX31722=m
CONFIG_SENSORS_MAX6621=y
CONFIG_SENSORS_MAX6639=m
CONFIG_SENSORS_MAX6642=y
CONFIG_SENSORS_MAX6650=y
CONFIG_SENSORS_MAX6697=m
CONFIG_SENSORS_MAX31790=m
# CONFIG_SENSORS_MCP3021 is not set
CONFIG_SENSORS_MLXREG_FAN=y
# CONFIG_SENSORS_TC654 is not set
# CONFIG_SENSORS_MENF21BMC_HWMON is not set
CONFIG_SENSORS_ADCXX=m
# CONFIG_SENSORS_LM63 is not set
# CONFIG_SENSORS_LM70 is not set
CONFIG_SENSORS_LM73=y
CONFIG_SENSORS_LM75=m
CONFIG_SENSORS_LM77=m
CONFIG_SENSORS_LM78=m
CONFIG_SENSORS_LM80=y
CONFIG_SENSORS_LM83=m
CONFIG_SENSORS_LM85=y
# CONFIG_SENSORS_LM87 is not set
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=m
CONFIG_SENSORS_LM93=m
# CONFIG_SENSORS_LM95234 is not set
# CONFIG_SENSORS_LM95241 is not set
CONFIG_SENSORS_LM95245=m
# CONFIG_SENSORS_PC87360 is not set
CONFIG_SENSORS_PC87427=y
CONFIG_SENSORS_NTC_THERMISTOR=m
CONFIG_SENSORS_NCT6683=m
# CONFIG_SENSORS_NCT6775 is not set
CONFIG_SENSORS_NCT7802=y
CONFIG_SENSORS_NCT7904=y
CONFIG_SENSORS_NPCM7XX=m
# CONFIG_SENSORS_PCF8591 is not set
CONFIG_PMBUS=m
# CONFIG_SENSORS_PMBUS is not set
# CONFIG_SENSORS_ADM1275 is not set
CONFIG_SENSORS_IBM_CFFPS=m
CONFIG_SENSORS_IR35221=m
CONFIG_SENSORS_IR38064=m
# CONFIG_SENSORS_IRPS5401 is not set
CONFIG_SENSORS_ISL68137=m
CONFIG_SENSORS_LM25066=m
CONFIG_SENSORS_LTC2978=m
# CONFIG_SENSORS_LTC2978_REGULATOR is not set
CONFIG_SENSORS_LTC3815=m
CONFIG_SENSORS_MAX16064=m
# CONFIG_SENSORS_MAX20751 is not set
CONFIG_SENSORS_MAX31785=m
# CONFIG_SENSORS_MAX34440 is not set
CONFIG_SENSORS_MAX8688=m
# CONFIG_SENSORS_PXE1610 is not set
CONFIG_SENSORS_TPS40422=m
# CONFIG_SENSORS_TPS53679 is not set
CONFIG_SENSORS_UCD9000=m
CONFIG_SENSORS_UCD9200=m
CONFIG_SENSORS_ZL6100=m
CONFIG_SENSORS_SHT15=m
CONFIG_SENSORS_SHT21=m
CONFIG_SENSORS_SHT3x=y
CONFIG_SENSORS_SHTC1=y
# CONFIG_SENSORS_SIS5595 is not set
# CONFIG_SENSORS_DME1737 is not set
CONFIG_SENSORS_EMC1403=m
# CONFIG_SENSORS_EMC2103 is not set
# CONFIG_SENSORS_EMC6W201 is not set
CONFIG_SENSORS_SMSC47M1=m
CONFIG_SENSORS_SMSC47M192=y
CONFIG_SENSORS_SMSC47B397=m
CONFIG_SENSORS_SCH56XX_COMMON=y
CONFIG_SENSORS_SCH5627=m
CONFIG_SENSORS_SCH5636=y
# CONFIG_SENSORS_STTS751 is not set
# CONFIG_SENSORS_SMM665 is not set
CONFIG_SENSORS_ADC128D818=y
CONFIG_SENSORS_ADS1015=y
# CONFIG_SENSORS_ADS7828 is not set
CONFIG_SENSORS_ADS7871=y
CONFIG_SENSORS_AMC6821=y
CONFIG_SENSORS_INA209=y
# CONFIG_SENSORS_INA2XX is not set
CONFIG_SENSORS_INA3221=m
CONFIG_SENSORS_TC74=m
CONFIG_SENSORS_THMC50=y
CONFIG_SENSORS_TMP102=y
# CONFIG_SENSORS_TMP103 is not set
# CONFIG_SENSORS_TMP108 is not set
# CONFIG_SENSORS_TMP401 is not set
CONFIG_SENSORS_TMP421=m
# CONFIG_SENSORS_VIA_CPUTEMP is not set
# CONFIG_SENSORS_VIA686A is not set
CONFIG_SENSORS_VT1211=m
# CONFIG_SENSORS_VT8231 is not set
# CONFIG_SENSORS_W83773G is not set
CONFIG_SENSORS_W83781D=y
CONFIG_SENSORS_W83791D=y
# CONFIG_SENSORS_W83792D is not set
CONFIG_SENSORS_W83793=m
# CONFIG_SENSORS_W83795 is not set
CONFIG_SENSORS_W83L785TS=y
# CONFIG_SENSORS_W83L786NG is not set
CONFIG_SENSORS_W83627HF=m
CONFIG_SENSORS_W83627EHF=m
# CONFIG_SENSORS_WM831X is not set
CONFIG_SENSORS_XGENE=m

#
# ACPI drivers
#
# CONFIG_SENSORS_ACPI_POWER is not set
CONFIG_SENSORS_ATK0110=y
CONFIG_THERMAL=y
CONFIG_THERMAL_STATISTICS=y
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
# CONFIG_THERMAL_HWMON is not set
# CONFIG_THERMAL_WRITABLE_TRIPS is not set
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
# CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
CONFIG_CLOCK_THERMAL=y
CONFIG_DEVFREQ_THERMAL=y
# CONFIG_THERMAL_EMULATION is not set

#
# Intel thermal drivers
#
# CONFIG_INTEL_POWERCLAMP is not set
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# CONFIG_INT340X_THERMAL is not set
# end of ACPI INT340X thermal drivers

# CONFIG_INTEL_PCH_THERMAL is not set
# end of Intel thermal drivers

CONFIG_GENERIC_ADC_THERMAL=m
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
# CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
# CONFIG_WATCHDOG_SYSFS is not set

#
# Watchdog Pretimeout Governors
#
CONFIG_WATCHDOG_PRETIMEOUT_GOV=y
CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL=m
CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP=y
CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC=y
# CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_NOOP is not set
CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC=y

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=y
# CONFIG_SOFT_WATCHDOG_PRETIMEOUT is not set
CONFIG_DA9052_WATCHDOG=y
CONFIG_DA9055_WATCHDOG=y
CONFIG_DA9063_WATCHDOG=y
# CONFIG_DA9062_WATCHDOG is not set
CONFIG_MENF21BMC_WATCHDOG=m
CONFIG_WDAT_WDT=y
# CONFIG_WM831X_WATCHDOG is not set
CONFIG_XILINX_WATCHDOG=m
CONFIG_ZIIRAVE_WATCHDOG=m
CONFIG_MLX_WDT=y
CONFIG_CADENCE_WATCHDOG=m
# CONFIG_DW_WATCHDOG is not set
CONFIG_MAX63XX_WATCHDOG=y
CONFIG_ACQUIRE_WDT=y
# CONFIG_ADVANTECH_WDT is not set
# CONFIG_ALIM1535_WDT is not set
# CONFIG_ALIM7101_WDT is not set
CONFIG_EBC_C384_WDT=m
CONFIG_F71808E_WDT=m
# CONFIG_SP5100_TCO is not set
# CONFIG_SBC_FITPC2_WATCHDOG is not set
# CONFIG_EUROTECH_WDT is not set
# CONFIG_IB700_WDT is not set
# CONFIG_IBMASR is not set
# CONFIG_WAFER_WDT is not set
# CONFIG_I6300ESB_WDT is not set
# CONFIG_IE6XX_WDT is not set
# CONFIG_ITCO_WDT is not set
CONFIG_IT8712F_WDT=y
# CONFIG_IT87_WDT is not set
# CONFIG_HP_WATCHDOG is not set
# CONFIG_KEMPLD_WDT is not set
CONFIG_SC1200_WDT=y
CONFIG_PC87413_WDT=m
# CONFIG_NV_TCO is not set
# CONFIG_60XX_WDT is not set
# CONFIG_CPU5_WDT is not set
# CONFIG_SMSC_SCH311X_WDT is not set
CONFIG_SMSC37B787_WDT=y
CONFIG_TQMX86_WDT=m
# CONFIG_VIA_WDT is not set
CONFIG_W83627HF_WDT=m
CONFIG_W83877F_WDT=y
CONFIG_W83977F_WDT=m
CONFIG_MACHZ_WDT=y
# CONFIG_SBC_EPX_C3_WATCHDOG is not set
CONFIG_NI903X_WDT=y
CONFIG_NIC7018_WDT=m
# CONFIG_MEN_A21_WDT is not set

#
# PCI-based Watchdog Cards
#
# CONFIG_PCIPCWATCHDOG is not set
# CONFIG_WDTPCI is not set

#
# USB-based Watchdog Cards
#
CONFIG_USBPCWATCHDOG=y
CONFIG_SSB_POSSIBLE=y
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=m
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
# CONFIG_BCMA_HOST_SOC is not set
CONFIG_BCMA_DRIVER_PCI=y
CONFIG_BCMA_DRIVER_GMAC_CMN=y
# CONFIG_BCMA_DRIVER_GPIO is not set
CONFIG_BCMA_DEBUG=y

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_AS3711=y
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
# CONFIG_MFD_BCM590XX is not set
CONFIG_MFD_BD9571MWV=m
CONFIG_MFD_AXP20X=m
CONFIG_MFD_AXP20X_I2C=m
CONFIG_MFD_CROS_EC=m
# CONFIG_MFD_CROS_EC_CHARDEV is not set
# CONFIG_MFD_MADERA is not set
CONFIG_PMIC_DA903X=y
CONFIG_PMIC_DA9052=y
CONFIG_MFD_DA9052_SPI=y
# CONFIG_MFD_DA9052_I2C is not set
CONFIG_MFD_DA9055=y
CONFIG_MFD_DA9062=y
CONFIG_MFD_DA9063=y
CONFIG_MFD_DA9150=m
# CONFIG_MFD_DLN2 is not set
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_SPI=y
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_HTC_PASIC3 is not set
CONFIG_HTC_I2CPLD=y
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
# CONFIG_LPC_ICH is not set
# CONFIG_LPC_SCH is not set
# CONFIG_INTEL_SOC_PMIC is not set
CONFIG_INTEL_SOC_PMIC_CHTWC=y
# CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
CONFIG_MFD_INTEL_LPSS=y
CONFIG_MFD_INTEL_LPSS_ACPI=y
# CONFIG_MFD_INTEL_LPSS_PCI is not set
# CONFIG_MFD_JANZ_CMODIO is not set
CONFIG_MFD_KEMPLD=y
CONFIG_MFD_88PM800=y
# CONFIG_MFD_88PM805 is not set
# CONFIG_MFD_88PM860X is not set
# CONFIG_MFD_MAX14577 is not set
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX77843 is not set
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_MT6397 is not set
CONFIG_MFD_MENF21BMC=m
CONFIG_EZX_PCAP=y
CONFIG_MFD_VIPERBOARD=y
# CONFIG_MFD_RETU is not set
CONFIG_MFD_PCF50633=y
CONFIG_PCF50633_ADC=y
# CONFIG_PCF50633_GPIO is not set
# CONFIG_MFD_RDC321X is not set
CONFIG_MFD_RT5033=y
# CONFIG_MFD_RC5T583 is not set
CONFIG_MFD_SEC_CORE=y
# CONFIG_MFD_SI476X_CORE is not set
# CONFIG_MFD_SM501 is not set
# CONFIG_MFD_SKY81452 is not set
# CONFIG_MFD_SMSC is not set
# CONFIG_ABX500_CORE is not set
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=m
CONFIG_MFD_LP3943=m
CONFIG_MFD_LP8788=y
CONFIG_MFD_TI_LMU=m
CONFIG_MFD_PALMAS=y
CONFIG_TPS6105X=y
# CONFIG_TPS65010 is not set
CONFIG_TPS6507X=m
CONFIG_MFD_TPS65086=y
CONFIG_MFD_TPS65090=y
# CONFIG_MFD_TPS68470 is not set
CONFIG_MFD_TI_LP873X=y
CONFIG_MFD_TPS6586X=y
CONFIG_MFD_TPS65910=y
CONFIG_MFD_TPS65912=m
# CONFIG_MFD_TPS65912_I2C is not set
CONFIG_MFD_TPS65912_SPI=m
CONFIG_MFD_TPS80031=y
# CONFIG_TWL4030_CORE is not set
CONFIG_TWL6040_CORE=y
CONFIG_MFD_WL1273_CORE=y
CONFIG_MFD_LM3533=m
CONFIG_MFD_TQMX86=y
# CONFIG_MFD_VX855 is not set
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=m
CONFIG_MFD_ARIZONA_SPI=m
CONFIG_MFD_CS47L24=y
# CONFIG_MFD_WM5102 is not set
CONFIG_MFD_WM5110=y
# CONFIG_MFD_WM8997 is not set
# CONFIG_MFD_WM8998 is not set
CONFIG_MFD_WM8400=y
CONFIG_MFD_WM831X=y
# CONFIG_MFD_WM831X_I2C is not set
CONFIG_MFD_WM831X_SPI=y
# CONFIG_MFD_WM8350_I2C is not set
CONFIG_MFD_WM8994=m
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=y
# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
CONFIG_REGULATOR_USERSPACE_CONSUMER=m
CONFIG_REGULATOR_88PG86X=y
CONFIG_REGULATOR_88PM800=y
# CONFIG_REGULATOR_ACT8865 is not set
# CONFIG_REGULATOR_AD5398 is not set
CONFIG_REGULATOR_ANATOP=m
CONFIG_REGULATOR_AS3711=m
CONFIG_REGULATOR_AXP20X=m
# CONFIG_REGULATOR_BD9571MWV is not set
CONFIG_REGULATOR_DA903X=m
# CONFIG_REGULATOR_DA9052 is not set
CONFIG_REGULATOR_DA9055=m
# CONFIG_REGULATOR_DA9062 is not set
CONFIG_REGULATOR_DA9210=y
CONFIG_REGULATOR_DA9211=y
CONFIG_REGULATOR_FAN53555=y
CONFIG_REGULATOR_GPIO=y
CONFIG_REGULATOR_ISL9305=y
# CONFIG_REGULATOR_ISL6271A is not set
CONFIG_REGULATOR_LM363X=m
CONFIG_REGULATOR_LP3971=y
CONFIG_REGULATOR_LP3972=y
# CONFIG_REGULATOR_LP872X is not set
CONFIG_REGULATOR_LP8755=m
CONFIG_REGULATOR_LP8788=m
CONFIG_REGULATOR_LTC3589=m
# CONFIG_REGULATOR_LTC3676 is not set
# CONFIG_REGULATOR_MAX1586 is not set
CONFIG_REGULATOR_MAX8649=y
CONFIG_REGULATOR_MAX8660=m
CONFIG_REGULATOR_MAX8952=y
CONFIG_REGULATOR_MC13XXX_CORE=m
CONFIG_REGULATOR_MC13783=m
CONFIG_REGULATOR_MC13892=m
CONFIG_REGULATOR_MT6311=m
CONFIG_REGULATOR_PALMAS=m
CONFIG_REGULATOR_PCAP=m
# CONFIG_REGULATOR_PCF50633 is not set
CONFIG_REGULATOR_PFUZE100=y
CONFIG_REGULATOR_PV88060=m
CONFIG_REGULATOR_PV88080=y
# CONFIG_REGULATOR_PV88090 is not set
CONFIG_REGULATOR_PWM=y
# CONFIG_REGULATOR_RT5033 is not set
CONFIG_REGULATOR_S2MPA01=y
CONFIG_REGULATOR_S2MPS11=y
CONFIG_REGULATOR_S5M8767=m
# CONFIG_REGULATOR_SLG51000 is not set
CONFIG_REGULATOR_TPS51632=y
CONFIG_REGULATOR_TPS6105X=m
CONFIG_REGULATOR_TPS62360=m
CONFIG_REGULATOR_TPS65023=y
# CONFIG_REGULATOR_TPS6507X is not set
CONFIG_REGULATOR_TPS65086=m
# CONFIG_REGULATOR_TPS65090 is not set
# CONFIG_REGULATOR_TPS65132 is not set
# CONFIG_REGULATOR_TPS6524X is not set
CONFIG_REGULATOR_TPS6586X=y
CONFIG_REGULATOR_TPS65910=m
CONFIG_REGULATOR_TPS65912=m
CONFIG_REGULATOR_TPS80031=m
# CONFIG_REGULATOR_WM831X is not set
# CONFIG_REGULATOR_WM8400 is not set
CONFIG_REGULATOR_WM8994=m
CONFIG_CEC_CORE=m
CONFIG_CEC_NOTIFIER=y
CONFIG_RC_CORE=y
# CONFIG_RC_MAP is not set
CONFIG_LIRC=y
CONFIG_BPF_LIRC_MODE2=y
CONFIG_RC_DECODERS=y
CONFIG_IR_NEC_DECODER=y
# CONFIG_IR_RC5_DECODER is not set
# CONFIG_IR_RC6_DECODER is not set
CONFIG_IR_JVC_DECODER=m
CONFIG_IR_SONY_DECODER=y
# CONFIG_IR_SANYO_DECODER is not set
CONFIG_IR_SHARP_DECODER=y
CONFIG_IR_MCE_KBD_DECODER=m
# CONFIG_IR_XMP_DECODER is not set
# CONFIG_IR_IMON_DECODER is not set
# CONFIG_IR_RCMM_DECODER is not set
# CONFIG_RC_DEVICES is not set
CONFIG_MEDIA_SUPPORT=m

#
# Multimedia core support
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
CONFIG_MEDIA_RADIO_SUPPORT=y
# CONFIG_MEDIA_SDR_SUPPORT is not set
# CONFIG_MEDIA_CEC_SUPPORT is not set
# CONFIG_MEDIA_CEC_RC is not set
CONFIG_MEDIA_CONTROLLER=y
# CONFIG_MEDIA_CONTROLLER_DVB is not set
CONFIG_VIDEO_DEV=m
# CONFIG_VIDEO_V4L2_SUBDEV_API is not set
CONFIG_VIDEO_V4L2=m
# CONFIG_VIDEO_ADV_DEBUG is not set
CONFIG_VIDEO_FIXED_MINOR_RANGES=y
CONFIG_V4L2_MEM2MEM_DEV=m
CONFIG_V4L2_FWNODE=m
CONFIG_DVB_CORE=m
CONFIG_DVB_MMAP=y
CONFIG_DVB_NET=y
CONFIG_DVB_MAX_ADAPTERS=16
# CONFIG_DVB_DYNAMIC_MINORS is not set
CONFIG_DVB_DEMUX_SECTION_LOSS_LOG=y
# CONFIG_DVB_ULE_DEBUG is not set

#
# Media drivers
#
# CONFIG_MEDIA_USB_SUPPORT is not set
# CONFIG_MEDIA_PCI_SUPPORT is not set
# CONFIG_V4L_PLATFORM_DRIVERS is not set
CONFIG_V4L_MEM2MEM_DRIVERS=y
# CONFIG_VIDEO_MEM2MEM_DEINTERLACE is not set
CONFIG_VIDEO_SH_VEU=m
CONFIG_V4L_TEST_DRIVERS=y
CONFIG_VIDEO_VIVID=m
CONFIG_VIDEO_VIVID_CEC=y
CONFIG_VIDEO_VIVID_MAX_DEVS=64
# CONFIG_VIDEO_VIM2M is not set
CONFIG_VIDEO_VICODEC=m
CONFIG_DVB_PLATFORM_DRIVERS=y

#
# Supported MMC/SDIO adapters
#
# CONFIG_SMS_SDIO_DRV is not set
CONFIG_RADIO_ADAPTERS=y
CONFIG_RADIO_TEA575X=m
# CONFIG_RADIO_SI470X is not set
# CONFIG_RADIO_SI4713 is not set
CONFIG_USB_MR800=m
# CONFIG_USB_DSBR is not set
# CONFIG_RADIO_MAXIRADIO is not set
CONFIG_RADIO_SHARK=m
# CONFIG_RADIO_SHARK2 is not set
# CONFIG_USB_KEENE is not set
CONFIG_USB_RAREMONO=m
# CONFIG_USB_MA901 is not set
CONFIG_RADIO_TEA5764=m
CONFIG_RADIO_SAA7706H=m
CONFIG_RADIO_TEF6862=m
CONFIG_RADIO_WL1273=m

#
# Texas Instruments WL128x FM driver (ST based)
#
# end of Texas Instruments WL128x FM driver (ST based)

CONFIG_CYPRESS_FIRMWARE=m
CONFIG_VIDEOBUF2_CORE=m
CONFIG_VIDEOBUF2_V4L2=m
CONFIG_VIDEOBUF2_MEMOPS=m
CONFIG_VIDEOBUF2_DMA_CONTIG=m
CONFIG_VIDEOBUF2_VMALLOC=m
CONFIG_VIDEO_V4L2_TPG=m

#
# Media ancillary drivers (tuners, sensors, i2c, spi, frontends)
#
# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
CONFIG_MEDIA_ATTACH=y
# CONFIG_VIDEO_IR_I2C is not set

#
# I2C Encoders, decoders, sensors and other helper chips
#

#
# Audio decoders, processors and mixers
#
CONFIG_VIDEO_TVAUDIO=m
# CONFIG_VIDEO_TDA7432 is not set
CONFIG_VIDEO_TDA9840=m
# CONFIG_VIDEO_TEA6415C is not set
CONFIG_VIDEO_TEA6420=m
CONFIG_VIDEO_MSP3400=m
CONFIG_VIDEO_CS3308=m
CONFIG_VIDEO_CS5345=m
CONFIG_VIDEO_CS53L32A=m
# CONFIG_VIDEO_TLV320AIC23B is not set
CONFIG_VIDEO_UDA1342=m
CONFIG_VIDEO_WM8775=m
CONFIG_VIDEO_WM8739=m
# CONFIG_VIDEO_VP27SMPX is not set
CONFIG_VIDEO_SONY_BTF_MPX=m

#
# RDS decoders
#
CONFIG_VIDEO_SAA6588=m

#
# Video decoders
#
# CONFIG_VIDEO_ADV7183 is not set
# CONFIG_VIDEO_BT819 is not set
CONFIG_VIDEO_BT856=m
# CONFIG_VIDEO_BT866 is not set
# CONFIG_VIDEO_KS0127 is not set
# CONFIG_VIDEO_ML86V7667 is not set
CONFIG_VIDEO_SAA7110=m
CONFIG_VIDEO_SAA711X=m
CONFIG_VIDEO_TVP514X=m
# CONFIG_VIDEO_TVP5150 is not set
# CONFIG_VIDEO_TVP7002 is not set
CONFIG_VIDEO_TW2804=m
CONFIG_VIDEO_TW9903=m
CONFIG_VIDEO_TW9906=m
CONFIG_VIDEO_TW9910=m
CONFIG_VIDEO_VPX3220=m

#
# Video and audio decoders
#
CONFIG_VIDEO_SAA717X=m
CONFIG_VIDEO_CX25840=m

#
# Video encoders
#
CONFIG_VIDEO_SAA7127=m
# CONFIG_VIDEO_SAA7185 is not set
# CONFIG_VIDEO_ADV7170 is not set
CONFIG_VIDEO_ADV7175=m
CONFIG_VIDEO_ADV7343=m
# CONFIG_VIDEO_ADV7393 is not set
CONFIG_VIDEO_AK881X=m
CONFIG_VIDEO_THS8200=m

#
# Camera sensor devices
#
# CONFIG_VIDEO_OV2640 is not set
CONFIG_VIDEO_OV2659=m
# CONFIG_VIDEO_OV2680 is not set
# CONFIG_VIDEO_OV2685 is not set
# CONFIG_VIDEO_OV6650 is not set
CONFIG_VIDEO_OV5695=m
CONFIG_VIDEO_OV772X=m
# CONFIG_VIDEO_OV7640 is not set
CONFIG_VIDEO_OV7670=m
# CONFIG_VIDEO_OV7740 is not set
# CONFIG_VIDEO_OV9640 is not set
CONFIG_VIDEO_VS6624=m
CONFIG_VIDEO_MT9M111=m
# CONFIG_VIDEO_MT9T112 is not set
# CONFIG_VIDEO_MT9V011 is not set
CONFIG_VIDEO_MT9V111=m
CONFIG_VIDEO_SR030PC30=m
CONFIG_VIDEO_RJ54N1=m

#
# Lens drivers
#
# CONFIG_VIDEO_AD5820 is not set

#
# Flash devices
#
CONFIG_VIDEO_ADP1653=m
CONFIG_VIDEO_LM3560=m
CONFIG_VIDEO_LM3646=m

#
# Video improvement chips
#
CONFIG_VIDEO_UPD64031A=m
# CONFIG_VIDEO_UPD64083 is not set

#
# Audio/Video compression chips
#
CONFIG_VIDEO_SAA6752HS=m

#
# SDR tuner chips
#

#
# Miscellaneous helper chips
#
# CONFIG_VIDEO_THS7303 is not set
# CONFIG_VIDEO_M52790 is not set
CONFIG_VIDEO_I2C=m
# end of I2C Encoders, decoders, sensors and other helper chips

#
# SPI helper chips
#
# end of SPI helper chips

#
# Media SPI Adapters
#
# CONFIG_CXD2880_SPI_DRV is not set
# end of Media SPI Adapters

CONFIG_MEDIA_TUNER=m

#
# Customize TV tuners
#
CONFIG_MEDIA_TUNER_SIMPLE=m
CONFIG_MEDIA_TUNER_TDA18250=m
# CONFIG_MEDIA_TUNER_TDA8290 is not set
CONFIG_MEDIA_TUNER_TDA827X=m
CONFIG_MEDIA_TUNER_TDA18271=m
CONFIG_MEDIA_TUNER_TDA9887=m
# CONFIG_MEDIA_TUNER_TEA5761 is not set
CONFIG_MEDIA_TUNER_TEA5767=m
CONFIG_MEDIA_TUNER_MSI001=m
# CONFIG_MEDIA_TUNER_MT20XX is not set
# CONFIG_MEDIA_TUNER_MT2060 is not set
CONFIG_MEDIA_TUNER_MT2063=m
CONFIG_MEDIA_TUNER_MT2266=m
CONFIG_MEDIA_TUNER_MT2131=m
CONFIG_MEDIA_TUNER_QT1010=m
CONFIG_MEDIA_TUNER_XC2028=m
# CONFIG_MEDIA_TUNER_XC5000 is not set
CONFIG_MEDIA_TUNER_XC4000=m
CONFIG_MEDIA_TUNER_MXL5005S=m
CONFIG_MEDIA_TUNER_MXL5007T=m
CONFIG_MEDIA_TUNER_MC44S803=m
# CONFIG_MEDIA_TUNER_MAX2165 is not set
CONFIG_MEDIA_TUNER_TDA18218=m
# CONFIG_MEDIA_TUNER_FC0011 is not set
CONFIG_MEDIA_TUNER_FC0012=m
# CONFIG_MEDIA_TUNER_FC0013 is not set
CONFIG_MEDIA_TUNER_TDA18212=m
CONFIG_MEDIA_TUNER_E4000=m
CONFIG_MEDIA_TUNER_FC2580=m
CONFIG_MEDIA_TUNER_M88RS6000T=m
# CONFIG_MEDIA_TUNER_TUA9001 is not set
# CONFIG_MEDIA_TUNER_SI2157 is not set
CONFIG_MEDIA_TUNER_IT913X=m
CONFIG_MEDIA_TUNER_R820T=m
CONFIG_MEDIA_TUNER_MXL301RF=m
# CONFIG_MEDIA_TUNER_QM1D1C0042 is not set
# CONFIG_MEDIA_TUNER_QM1D1B0004 is not set
# end of Customize TV tuners

#
# Customise DVB Frontends
#

#
# Multistandard (satellite) frontends
#
# CONFIG_DVB_STB0899 is not set
CONFIG_DVB_STB6100=m
# CONFIG_DVB_STV090x is not set
CONFIG_DVB_STV0910=m
CONFIG_DVB_STV6110x=m
CONFIG_DVB_STV6111=m
# CONFIG_DVB_MXL5XX is not set

#
# Multistandard (cable + terrestrial) frontends
#
# CONFIG_DVB_DRXK is not set
CONFIG_DVB_TDA18271C2DD=m
CONFIG_DVB_SI2165=m
CONFIG_DVB_MN88472=m
CONFIG_DVB_MN88473=m

#
# DVB-S (satellite) frontends
#
CONFIG_DVB_CX24110=m
# CONFIG_DVB_CX24123 is not set
CONFIG_DVB_MT312=m
CONFIG_DVB_ZL10036=m
CONFIG_DVB_ZL10039=m
# CONFIG_DVB_S5H1420 is not set
CONFIG_DVB_STV0288=m
CONFIG_DVB_STB6000=m
# CONFIG_DVB_STV0299 is not set
CONFIG_DVB_STV6110=m
CONFIG_DVB_STV0900=m
CONFIG_DVB_TDA8083=m
# CONFIG_DVB_TDA10086 is not set
CONFIG_DVB_TDA8261=m
CONFIG_DVB_VES1X93=m
CONFIG_DVB_TUNER_ITD1000=m
# CONFIG_DVB_TUNER_CX24113 is not set
CONFIG_DVB_TDA826X=m
# CONFIG_DVB_TUA6100 is not set
CONFIG_DVB_CX24116=m
CONFIG_DVB_CX24117=m
# CONFIG_DVB_CX24120 is not set
CONFIG_DVB_SI21XX=m
CONFIG_DVB_TS2020=m
CONFIG_DVB_DS3000=m
# CONFIG_DVB_MB86A16 is not set
CONFIG_DVB_TDA10071=m

#
# DVB-T (terrestrial) frontends
#
# CONFIG_DVB_SP8870 is not set
CONFIG_DVB_SP887X=m
# CONFIG_DVB_CX22700 is not set
CONFIG_DVB_CX22702=m
# CONFIG_DVB_S5H1432 is not set
CONFIG_DVB_DRXD=m
CONFIG_DVB_L64781=m
CONFIG_DVB_TDA1004X=m
CONFIG_DVB_NXT6000=m
CONFIG_DVB_MT352=m
CONFIG_DVB_ZL10353=m
CONFIG_DVB_DIB3000MB=m
CONFIG_DVB_DIB3000MC=m
# CONFIG_DVB_DIB7000M is not set
CONFIG_DVB_DIB7000P=m
CONFIG_DVB_DIB9000=m
CONFIG_DVB_TDA10048=m
CONFIG_DVB_EC100=m
CONFIG_DVB_STV0367=m
CONFIG_DVB_CXD2820R=m
CONFIG_DVB_CXD2841ER=m
CONFIG_DVB_ZD1301_DEMOD=m
CONFIG_DVB_CXD2880=m

#
# DVB-C (cable) frontends
#
CONFIG_DVB_VES1820=m
CONFIG_DVB_TDA10021=m
CONFIG_DVB_TDA10023=m
CONFIG_DVB_STV0297=m

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#
CONFIG_DVB_NXT200X=m
CONFIG_DVB_OR51211=m
CONFIG_DVB_OR51132=m
CONFIG_DVB_BCM3510=m
# CONFIG_DVB_LGDT330X is not set
CONFIG_DVB_LGDT3305=m
CONFIG_DVB_LG2160=m
CONFIG_DVB_S5H1409=m
CONFIG_DVB_AU8522=m
# CONFIG_DVB_AU8522_DTV is not set
CONFIG_DVB_AU8522_V4L=m
# CONFIG_DVB_S5H1411 is not set

#
# ISDB-T (terrestrial) frontends
#
CONFIG_DVB_S921=m
CONFIG_DVB_DIB8000=m
# CONFIG_DVB_MB86A20S is not set

#
# ISDB-S (satellite) & ISDB-T (terrestrial) frontends
#
CONFIG_DVB_TC90522=m
# CONFIG_DVB_MN88443X is not set

#
# Digital terrestrial only tuners/PLL
#
CONFIG_DVB_PLL=m
# CONFIG_DVB_TUNER_DIB0070 is not set
# CONFIG_DVB_TUNER_DIB0090 is not set

#
# SEC control devices for DVB-S
#
CONFIG_DVB_DRX39XYJ=m
CONFIG_DVB_LNBH25=m
CONFIG_DVB_LNBH29=m
CONFIG_DVB_LNBP21=m
CONFIG_DVB_LNBP22=m
CONFIG_DVB_ISL6405=m
# CONFIG_DVB_ISL6421 is not set
CONFIG_DVB_ISL6423=m
CONFIG_DVB_A8293=m
CONFIG_DVB_LGS8GL5=m
# CONFIG_DVB_LGS8GXX is not set
CONFIG_DVB_ATBM8830=m
CONFIG_DVB_TDA665x=m
# CONFIG_DVB_IX2505V is not set
CONFIG_DVB_M88RS2000=m
CONFIG_DVB_AF9033=m
CONFIG_DVB_HORUS3A=m
CONFIG_DVB_ASCOT2E=m
CONFIG_DVB_HELENE=m

#
# Common Interface (EN50221) controller drivers
#
# CONFIG_DVB_CXD2099 is not set
CONFIG_DVB_SP2=m

#
# Tools to develop new frontends
#
CONFIG_DVB_DUMMY_FE=m
# end of Customise DVB Frontends

#
# Graphics support
#
# CONFIG_AGP is not set
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
# CONFIG_VGA_SWITCHEROO is not set
CONFIG_DRM=y
# CONFIG_DRM_DP_AUX_CHARDEV is not set
CONFIG_DRM_DEBUG_MM=y
CONFIG_DRM_DEBUG_SELFTEST=y
CONFIG_DRM_KMS_HELPER=y
CONFIG_DRM_KMS_FB_HELPER=y
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_SCHED=m

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=y
CONFIG_DRM_I2C_SIL164=m
# CONFIG_DRM_I2C_NXP_TDA998X is not set
CONFIG_DRM_I2C_NXP_TDA9950=m
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set

#
# ACP (Audio CoProcessor) Configuration
#
# end of ACP (Audio CoProcessor) Configuration

# CONFIG_DRM_NOUVEAU is not set
# CONFIG_DRM_I915 is not set
CONFIG_DRM_VGEM=y
CONFIG_DRM_VKMS=m
# CONFIG_DRM_VMWGFX is not set
# CONFIG_DRM_GMA500 is not set
CONFIG_DRM_UDL=m
# CONFIG_DRM_AST is not set
# CONFIG_DRM_MGAG200 is not set
# CONFIG_DRM_CIRRUS_QEMU is not set
# CONFIG_DRM_QXL is not set
# CONFIG_DRM_BOCHS is not set
# CONFIG_DRM_VIRTIO_GPU is not set
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
# end of Display Interface Bridges

CONFIG_DRM_ETNAVIV=m
# CONFIG_DRM_ETNAVIV_THERMAL is not set
# CONFIG_DRM_HISI_HIBMC is not set
# CONFIG_DRM_TINYDRM is not set
# CONFIG_DRM_VBOXVIDEO is not set
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
CONFIG_DRM_LIB_RANDOM=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
CONFIG_FIRMWARE_EDID=y
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_HECUBA=m
CONFIG_FB_MODE_HELPERS=y
# CONFIG_FB_TILEBLITTING is not set

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
CONFIG_FB_ARC=y
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_VGA16 is not set
# CONFIG_FB_VESA is not set
CONFIG_FB_N411=m
CONFIG_FB_HGA=m
CONFIG_FB_OPENCORES=m
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_I740 is not set
# CONFIG_FB_LE80578 is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIA is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
# CONFIG_FB_SMSCUFX is not set
CONFIG_FB_UDL=y
CONFIG_FB_IBM_GXT4500=y
# CONFIG_FB_VIRTUAL is not set
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_MB862XX is not set
# CONFIG_FB_SIMPLE is not set
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=y
CONFIG_LCD_L4F00242T03=m
# CONFIG_LCD_LMS283GF05 is not set
CONFIG_LCD_LTV350QV=m
CONFIG_LCD_ILI922X=y
CONFIG_LCD_ILI9320=m
CONFIG_LCD_TDO24M=y
# CONFIG_LCD_VGG2432A4 is not set
CONFIG_LCD_PLATFORM=m
CONFIG_LCD_AMS369FG06=y
CONFIG_LCD_LMS501KF03=m
# CONFIG_LCD_HX8357 is not set
# CONFIG_LCD_OTM3225A is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
CONFIG_BACKLIGHT_GENERIC=y
CONFIG_BACKLIGHT_LM3533=m
CONFIG_BACKLIGHT_PWM=y
# CONFIG_BACKLIGHT_DA903X is not set
# CONFIG_BACKLIGHT_DA9052 is not set
CONFIG_BACKLIGHT_APPLE=y
CONFIG_BACKLIGHT_PM8941_WLED=y
CONFIG_BACKLIGHT_SAHARA=y
# CONFIG_BACKLIGHT_WM831X is not set
CONFIG_BACKLIGHT_ADP8860=y
CONFIG_BACKLIGHT_ADP8870=m
CONFIG_BACKLIGHT_PCF50633=m
CONFIG_BACKLIGHT_LM3630A=m
# CONFIG_BACKLIGHT_LM3639 is not set
# CONFIG_BACKLIGHT_LP855X is not set
CONFIG_BACKLIGHT_LP8788=y
CONFIG_BACKLIGHT_AS3711=y
# CONFIG_BACKLIGHT_GPIO is not set
CONFIG_BACKLIGHT_LV5207LP=y
CONFIG_BACKLIGHT_BD6107=m
CONFIG_BACKLIGHT_ARCXCNN=y
# end of Backlight & LCD device support

CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_VGACON_SOFT_SCROLLBACK=y
CONFIG_VGACON_SOFT_SCROLLBACK_SIZE=64
# CONFIG_VGACON_SOFT_SCROLLBACK_PERSISTENT_ENABLE_BY_DEFAULT is not set
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
# CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
# end of Console display driver support

# CONFIG_LOGO is not set
# end of Graphics support

# CONFIG_SOUND is not set

#
# HID support
#
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
# CONFIG_HIDRAW is not set
CONFIG_UHID=m
# CONFIG_HID_GENERIC is not set

#
# Special HID drivers
#
# CONFIG_HID_A4TECH is not set
CONFIG_HID_ACCUTOUCH=m
# CONFIG_HID_ACRUX is not set
# CONFIG_HID_APPLE is not set
CONFIG_HID_APPLEIR=y
CONFIG_HID_ASUS=y
CONFIG_HID_AUREAL=y
CONFIG_HID_BELKIN=m
# CONFIG_HID_BETOP_FF is not set
CONFIG_HID_BIGBEN_FF=m
# CONFIG_HID_CHERRY is not set
# CONFIG_HID_CHICONY is not set
# CONFIG_HID_CORSAIR is not set
CONFIG_HID_COUGAR=m
CONFIG_HID_MACALLY=y
CONFIG_HID_CMEDIA=y
# CONFIG_HID_CYPRESS is not set
CONFIG_HID_DRAGONRISE=y
# CONFIG_DRAGONRISE_FF is not set
CONFIG_HID_EMS_FF=m
# CONFIG_HID_ELAN is not set
CONFIG_HID_ELECOM=y
CONFIG_HID_ELO=m
# CONFIG_HID_EZKEY is not set
CONFIG_HID_GEMBIRD=y
# CONFIG_HID_GFRM is not set
CONFIG_HID_HOLTEK=y
# CONFIG_HOLTEK_FF is not set
# CONFIG_HID_GOOGLE_HAMMER is not set
CONFIG_HID_GT683R=y
CONFIG_HID_KEYTOUCH=y
# CONFIG_HID_KYE is not set
CONFIG_HID_UCLOGIC=y
CONFIG_HID_WALTOP=m
CONFIG_HID_VIEWSONIC=y
# CONFIG_HID_GYRATION is not set
CONFIG_HID_ICADE=y
CONFIG_HID_ITE=y
CONFIG_HID_JABRA=m
CONFIG_HID_TWINHAN=m
CONFIG_HID_KENSINGTON=m
CONFIG_HID_LCPOWER=m
CONFIG_HID_LED=y
CONFIG_HID_LENOVO=y
CONFIG_HID_LOGITECH=y
CONFIG_HID_LOGITECH_HIDPP=m
# CONFIG_LOGITECH_FF is not set
CONFIG_LOGIRUMBLEPAD2_FF=y
# CONFIG_LOGIG940_FF is not set
CONFIG_LOGIWHEELS_FF=y
CONFIG_HID_MAGICMOUSE=m
# CONFIG_HID_MALTRON is not set
CONFIG_HID_MAYFLASH=m
CONFIG_HID_REDRAGON=m
CONFIG_HID_MICROSOFT=y
# CONFIG_HID_MONTEREY is not set
CONFIG_HID_MULTITOUCH=y
CONFIG_HID_NTI=y
CONFIG_HID_NTRIG=m
# CONFIG_HID_ORTEK is not set
# CONFIG_HID_PANTHERLORD is not set
CONFIG_HID_PENMOUNT=y
CONFIG_HID_PETALYNX=m
CONFIG_HID_PICOLCD=y
CONFIG_HID_PICOLCD_FB=y
CONFIG_HID_PICOLCD_BACKLIGHT=y
CONFIG_HID_PICOLCD_LCD=y
CONFIG_HID_PICOLCD_LEDS=y
CONFIG_HID_PICOLCD_CIR=y
CONFIG_HID_PLANTRONICS=m
CONFIG_HID_PRIMAX=y
# CONFIG_HID_RETRODE is not set
# CONFIG_HID_ROCCAT is not set
CONFIG_HID_SAITEK=m
# CONFIG_HID_SAMSUNG is not set
# CONFIG_HID_SONY is not set
CONFIG_HID_SPEEDLINK=m
CONFIG_HID_STEAM=m
# CONFIG_HID_STEELSERIES is not set
CONFIG_HID_SUNPLUS=m
# CONFIG_HID_RMI is not set
CONFIG_HID_GREENASIA=m
# CONFIG_GREENASIA_FF is not set
CONFIG_HID_SMARTJOYPLUS=y
CONFIG_SMARTJOYPLUS_FF=y
CONFIG_HID_TIVO=y
# CONFIG_HID_TOPSEED is not set
CONFIG_HID_THINGM=y
CONFIG_HID_THRUSTMASTER=y
# CONFIG_THRUSTMASTER_FF is not set
CONFIG_HID_UDRAW_PS3=m
CONFIG_HID_WACOM=y
CONFIG_HID_WIIMOTE=y
CONFIG_HID_XINMO=y
# CONFIG_HID_ZEROPLUS is not set
# CONFIG_HID_ZYDACRON is not set
CONFIG_HID_SENSOR_HUB=y
# CONFIG_HID_SENSOR_CUSTOM_SENSOR is not set
# CONFIG_HID_ALPS is not set
# end of Special HID drivers

#
# USB HID support
#
CONFIG_USB_HID=y
# CONFIG_HID_PID is not set
CONFIG_USB_HIDDEV=y
# end of USB HID support

#
# I2C HID support
#
CONFIG_I2C_HID=m
# end of I2C HID support

#
# Intel ISH HID support
#
# CONFIG_INTEL_ISH_HID is not set
# end of Intel ISH HID support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_PCI=y
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
# CONFIG_USB_DEFAULT_PERSIST is not set
CONFIG_USB_DYNAMIC_MINORS=y
# CONFIG_USB_OTG is not set
CONFIG_USB_OTG_WHITELIST=y
# CONFIG_USB_LEDS_TRIGGER_USBPORT is not set
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_MON=m
CONFIG_USB_WUSB=m
# CONFIG_USB_WUSB_CBAF is not set

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
# CONFIG_USB_XHCI_HCD is not set
CONFIG_USB_EHCI_HCD=m
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_EHCI_PCI=m
CONFIG_USB_EHCI_FSL=m
CONFIG_USB_EHCI_HCD_PLATFORM=m
CONFIG_USB_OXU210HP_HCD=y
# CONFIG_USB_ISP116X_HCD is not set
# CONFIG_USB_FOTG210_HCD is not set
CONFIG_USB_MAX3421_HCD=m
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_PCI=y
# CONFIG_USB_OHCI_HCD_PLATFORM is not set
# CONFIG_USB_UHCI_HCD is not set
# CONFIG_USB_SL811_HCD is not set
# CONFIG_USB_R8A66597_HCD is not set
# CONFIG_USB_WHCI_HCD is not set
# CONFIG_USB_HWA_HCD is not set
# CONFIG_USB_HCD_BCMA is not set
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
# CONFIG_USB_ACM is not set
CONFIG_USB_PRINTER=y
# CONFIG_USB_WDM is not set
CONFIG_USB_TMC=y

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=y
# CONFIG_USB_STORAGE_DEBUG is not set
# CONFIG_USB_STORAGE_REALTEK is not set
# CONFIG_USB_STORAGE_DATAFAB is not set
CONFIG_USB_STORAGE_FREECOM=m
CONFIG_USB_STORAGE_ISD200=m
CONFIG_USB_STORAGE_USBAT=y
# CONFIG_USB_STORAGE_SDDR09 is not set
# CONFIG_USB_STORAGE_SDDR55 is not set
CONFIG_USB_STORAGE_JUMPSHOT=y
CONFIG_USB_STORAGE_ALAUDA=m
CONFIG_USB_STORAGE_ONETOUCH=m
CONFIG_USB_STORAGE_KARMA=m
CONFIG_USB_STORAGE_CYPRESS_ATACB=m
CONFIG_USB_STORAGE_ENE_UB6250=y
CONFIG_USB_UAS=m

#
# USB Imaging devices
#
CONFIG_USB_MDC800=y
CONFIG_USB_MICROTEK=y
# CONFIG_USBIP_CORE is not set
CONFIG_USB_MUSB_HDRC=y
CONFIG_USB_MUSB_HOST=y

#
# Platform Glue Layer
#

#
# MUSB DMA mode
#
# CONFIG_MUSB_PIO_ONLY is not set
CONFIG_USB_DWC3=y
CONFIG_USB_DWC3_HOST=y

#
# Platform Glue Driver Support
#
CONFIG_USB_DWC3_PCI=y
CONFIG_USB_DWC3_HAPS=y
CONFIG_USB_DWC2=y
CONFIG_USB_DWC2_HOST=y

#
# Gadget/Dual-role mode requires USB Gadget support to be enabled
#
# CONFIG_USB_DWC2_PCI is not set
# CONFIG_USB_DWC2_DEBUG is not set
CONFIG_USB_DWC2_TRACK_MISSED_SOFS=y
CONFIG_USB_CHIPIDEA=m
CONFIG_USB_CHIPIDEA_PCI=m
CONFIG_USB_CHIPIDEA_UDC=y
CONFIG_USB_CHIPIDEA_HOST=y
# CONFIG_USB_ISP1760 is not set

#
# USB port drivers
#
CONFIG_USB_USS720=m
CONFIG_USB_SERIAL=y
CONFIG_USB_SERIAL_CONSOLE=y
CONFIG_USB_SERIAL_GENERIC=y
CONFIG_USB_SERIAL_SIMPLE=m
CONFIG_USB_SERIAL_AIRCABLE=m
CONFIG_USB_SERIAL_ARK3116=m
CONFIG_USB_SERIAL_BELKIN=m
CONFIG_USB_SERIAL_CH341=y
CONFIG_USB_SERIAL_WHITEHEAT=m
# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
CONFIG_USB_SERIAL_CP210X=m
CONFIG_USB_SERIAL_CYPRESS_M8=y
CONFIG_USB_SERIAL_EMPEG=m
CONFIG_USB_SERIAL_FTDI_SIO=m
CONFIG_USB_SERIAL_VISOR=y
CONFIG_USB_SERIAL_IPAQ=y
CONFIG_USB_SERIAL_IR=m
CONFIG_USB_SERIAL_EDGEPORT=y
# CONFIG_USB_SERIAL_EDGEPORT_TI is not set
# CONFIG_USB_SERIAL_F81232 is not set
CONFIG_USB_SERIAL_F8153X=m
CONFIG_USB_SERIAL_GARMIN=m
# CONFIG_USB_SERIAL_IPW is not set
CONFIG_USB_SERIAL_IUU=y
CONFIG_USB_SERIAL_KEYSPAN_PDA=y
# CONFIG_USB_SERIAL_KEYSPAN is not set
CONFIG_USB_SERIAL_KLSI=y
CONFIG_USB_SERIAL_KOBIL_SCT=m
# CONFIG_USB_SERIAL_MCT_U232 is not set
CONFIG_USB_SERIAL_METRO=y
# CONFIG_USB_SERIAL_MOS7720 is not set
# CONFIG_USB_SERIAL_MOS7840 is not set
CONFIG_USB_SERIAL_MXUPORT=m
# CONFIG_USB_SERIAL_NAVMAN is not set
CONFIG_USB_SERIAL_PL2303=y
CONFIG_USB_SERIAL_OTI6858=m
# CONFIG_USB_SERIAL_QCAUX is not set
# CONFIG_USB_SERIAL_QUALCOMM is not set
CONFIG_USB_SERIAL_SPCP8X5=m
CONFIG_USB_SERIAL_SAFE=m
# CONFIG_USB_SERIAL_SAFE_PADDED is not set
# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
# CONFIG_USB_SERIAL_SYMBOL is not set
# CONFIG_USB_SERIAL_TI is not set
CONFIG_USB_SERIAL_CYBERJACK=y
CONFIG_USB_SERIAL_XIRCOM=y
CONFIG_USB_SERIAL_WWAN=m
CONFIG_USB_SERIAL_OPTION=m
CONFIG_USB_SERIAL_OMNINET=y
CONFIG_USB_SERIAL_OPTICON=y
CONFIG_USB_SERIAL_XSENS_MT=m
# CONFIG_USB_SERIAL_WISHBONE is not set
CONFIG_USB_SERIAL_SSU100=y
CONFIG_USB_SERIAL_QT2=y
CONFIG_USB_SERIAL_UPD78F0730=y
CONFIG_USB_SERIAL_DEBUG=m

#
# USB Miscellaneous drivers
#
CONFIG_USB_EMI62=y
# CONFIG_USB_EMI26 is not set
CONFIG_USB_ADUTUX=y
CONFIG_USB_SEVSEG=m
CONFIG_USB_RIO500=m
CONFIG_USB_LEGOTOWER=y
# CONFIG_USB_LCD is not set
# CONFIG_USB_CYPRESS_CY7C63 is not set
# CONFIG_USB_CYTHERM is not set
CONFIG_USB_IDMOUSE=m
# CONFIG_USB_FTDI_ELAN is not set
CONFIG_USB_APPLEDISPLAY=m
CONFIG_USB_SISUSBVGA=m
CONFIG_USB_SISUSBVGA_CON=y
CONFIG_USB_LD=m
CONFIG_USB_TRANCEVIBRATOR=y
CONFIG_USB_IOWARRIOR=y
# CONFIG_USB_TEST is not set
CONFIG_USB_EHSET_TEST_FIXTURE=y
# CONFIG_USB_ISIGHTFW is not set
# CONFIG_USB_YUREX is not set
CONFIG_USB_EZUSB_FX2=y
CONFIG_USB_HUB_USB251XB=y
CONFIG_USB_HSIC_USB3503=m
# CONFIG_USB_HSIC_USB4604 is not set
# CONFIG_USB_LINK_LAYER_TEST is not set

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
CONFIG_NOP_USB_XCEIV=m
CONFIG_USB_GPIO_VBUS=m
CONFIG_USB_ISP1301=y
# end of USB Physical Layer drivers

CONFIG_USB_GADGET=m
CONFIG_USB_GADGET_DEBUG=y
# CONFIG_USB_GADGET_VERBOSE is not set
# CONFIG_USB_GADGET_DEBUG_FILES is not set
# CONFIG_USB_GADGET_DEBUG_FS is not set
CONFIG_USB_GADGET_VBUS_DRAW=2
CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2

#
# USB Peripheral Controller
#
# CONFIG_USB_FOTG210_UDC is not set
# CONFIG_USB_GR_UDC is not set
# CONFIG_USB_R8A66597 is not set
CONFIG_USB_PXA27X=m
CONFIG_USB_MV_UDC=m
# CONFIG_USB_MV_U3D is not set
CONFIG_USB_M66592=m
# CONFIG_USB_BDC_UDC is not set
# CONFIG_USB_AMD5536UDC is not set
# CONFIG_USB_NET2272 is not set
# CONFIG_USB_NET2280 is not set
# CONFIG_USB_GOKU is not set
# CONFIG_USB_EG20T is not set
CONFIG_USB_DUMMY_HCD=m
# end of USB Peripheral Controller

# CONFIG_USB_CONFIGFS is not set
CONFIG_TYPEC=y
CONFIG_TYPEC_TCPM=y
CONFIG_TYPEC_TCPCI=m
CONFIG_TYPEC_RT1711H=m
CONFIG_TYPEC_FUSB302=y
CONFIG_TYPEC_UCSI=m
# CONFIG_UCSI_CCG is not set
# CONFIG_UCSI_ACPI is not set
CONFIG_TYPEC_TPS6598X=m

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
CONFIG_TYPEC_MUX_PI3USB30532=m
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
# CONFIG_TYPEC_DP_ALTMODE is not set
# end of USB Type-C Alternate Mode drivers

CONFIG_USB_ROLE_SWITCH=y
# CONFIG_USB_ROLES_INTEL_XHCI is not set
# CONFIG_USB_LED_TRIG is not set
CONFIG_USB_ULPI_BUS=m
CONFIG_UWB=m
CONFIG_UWB_HWA=m
# CONFIG_UWB_WHCI is not set
# CONFIG_UWB_I1480U is not set
CONFIG_MMC=m
CONFIG_MMC_BLOCK=m
CONFIG_MMC_BLOCK_MINORS=8
CONFIG_SDIO_UART=m
CONFIG_MMC_TEST=m

#
# MMC/SD/SDIO Host Controller Drivers
#
CONFIG_MMC_DEBUG=y
CONFIG_MMC_SDHCI=m
# CONFIG_MMC_SDHCI_PCI is not set
# CONFIG_MMC_SDHCI_ACPI is not set
CONFIG_MMC_SDHCI_PLTFM=m
CONFIG_MMC_SDHCI_F_SDH30=m
CONFIG_MMC_WBSD=m
# CONFIG_MMC_TIFM_SD is not set
CONFIG_MMC_SPI=m
# CONFIG_MMC_CB710 is not set
# CONFIG_MMC_VIA_SDMMC is not set
# CONFIG_MMC_VUB300 is not set
CONFIG_MMC_USHC=m
CONFIG_MMC_USDHI6ROL0=m
CONFIG_MMC_REALTEK_USB=m
CONFIG_MMC_CQHCI=m
# CONFIG_MMC_TOSHIBA_PCI is not set
CONFIG_MMC_MTK=m
# CONFIG_MMC_SDHCI_XENON is not set
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
CONFIG_LEDS_APU=m
CONFIG_LEDS_LM3530=m
# CONFIG_LEDS_LM3532 is not set
# CONFIG_LEDS_LM3533 is not set
CONFIG_LEDS_LM3642=y
# CONFIG_LEDS_PCA9532 is not set
CONFIG_LEDS_GPIO=y
# CONFIG_LEDS_LP3944 is not set
# CONFIG_LEDS_LP3952 is not set
CONFIG_LEDS_LP55XX_COMMON=m
# CONFIG_LEDS_LP5521 is not set
# CONFIG_LEDS_LP5523 is not set
CONFIG_LEDS_LP5562=m
# CONFIG_LEDS_LP8501 is not set
CONFIG_LEDS_LP8788=m
CONFIG_LEDS_CLEVO_MAIL=m
CONFIG_LEDS_PCA955X=m
# CONFIG_LEDS_PCA955X_GPIO is not set
CONFIG_LEDS_PCA963X=y
CONFIG_LEDS_WM831X_STATUS=y
CONFIG_LEDS_DA903X=m
CONFIG_LEDS_DA9052=y
# CONFIG_LEDS_DAC124S085 is not set
# CONFIG_LEDS_PWM is not set
CONFIG_LEDS_REGULATOR=m
CONFIG_LEDS_BD2802=m
# CONFIG_LEDS_INTEL_SS4200 is not set
# CONFIG_LEDS_MC13783 is not set
# CONFIG_LEDS_TCA6507 is not set
# CONFIG_LEDS_TLC591XX is not set
# CONFIG_LEDS_LM355x is not set
CONFIG_LEDS_MENF21BMC=m

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
# CONFIG_LEDS_BLINKM is not set
CONFIG_LEDS_MLXCPLD=y
# CONFIG_LEDS_MLXREG is not set
CONFIG_LEDS_USER=m
# CONFIG_LEDS_NIC78BX is not set
# CONFIG_LEDS_TI_LMU_COMMON is not set

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
# CONFIG_LEDS_TRIGGER_TIMER is not set
CONFIG_LEDS_TRIGGER_ONESHOT=m
# CONFIG_LEDS_TRIGGER_DISK is not set
CONFIG_LEDS_TRIGGER_HEARTBEAT=y
CONFIG_LEDS_TRIGGER_BACKLIGHT=y
CONFIG_LEDS_TRIGGER_CPU=y
CONFIG_LEDS_TRIGGER_ACTIVITY=m
# CONFIG_LEDS_TRIGGER_GPIO is not set
# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=m
CONFIG_LEDS_TRIGGER_CAMERA=y
CONFIG_LEDS_TRIGGER_PANIC=y
# CONFIG_LEDS_TRIGGER_NETDEV is not set
# CONFIG_LEDS_TRIGGER_PATTERN is not set
CONFIG_LEDS_TRIGGER_AUDIO=y
CONFIG_ACCESSIBILITY=y
# CONFIG_A11Y_BRAILLE_CONSOLE is not set
# CONFIG_INFINIBAND is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=y
CONFIG_EDAC_LEGACY_SYSFS=y
# CONFIG_EDAC_DEBUG is not set
# CONFIG_EDAC_E752X is not set
# CONFIG_EDAC_I82975X is not set
# CONFIG_EDAC_I3000 is not set
# CONFIG_EDAC_I3200 is not set
# CONFIG_EDAC_IE31200 is not set
# CONFIG_EDAC_X38 is not set
# CONFIG_EDAC_I5400 is not set
# CONFIG_EDAC_I5000 is not set
# CONFIG_EDAC_I5100 is not set
# CONFIG_EDAC_I7300 is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
# CONFIG_RTC_CLASS is not set
CONFIG_DMADEVICES=y
CONFIG_DMADEVICES_DEBUG=y
CONFIG_DMADEVICES_VDEBUG=y

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_ACPI=y
CONFIG_ALTERA_MSGDMA=y
# CONFIG_INTEL_IDMA64 is not set
# CONFIG_INTEL_IOATDMA is not set
# CONFIG_QCOM_HIDMA_MGMT is not set
# CONFIG_QCOM_HIDMA is not set
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=m
# CONFIG_DW_DMAC_PCI is not set
CONFIG_HSU_DMA=y

#
# DMA Clients
#
# CONFIG_ASYNC_TX_DMA is not set
CONFIG_DMATEST=y
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
CONFIG_UDMABUF=y
# end of DMABUF options

CONFIG_AUXDISPLAY=y
# CONFIG_HD44780 is not set
# CONFIG_KS0108 is not set
CONFIG_IMG_ASCII_LCD=y
CONFIG_PARPORT_PANEL=m
CONFIG_PANEL_PARPORT=0
CONFIG_PANEL_PROFILE=5
CONFIG_PANEL_CHANGE_MESSAGE=y
CONFIG_PANEL_BOOT_MESSAGE=""
# CONFIG_CHARLCD_BL_OFF is not set
CONFIG_CHARLCD_BL_ON=y
# CONFIG_CHARLCD_BL_FLASH is not set
# CONFIG_PANEL is not set
CONFIG_CHARLCD=m
CONFIG_UIO=m
# CONFIG_UIO_CIF is not set
CONFIG_UIO_PDRV_GENIRQ=m
CONFIG_UIO_DMEM_GENIRQ=m
# CONFIG_UIO_AEC is not set
# CONFIG_UIO_SERCOS3 is not set
# CONFIG_UIO_PCI_GENERIC is not set
# CONFIG_UIO_NETX is not set
CONFIG_UIO_PRUSS=m
# CONFIG_UIO_MF624 is not set
CONFIG_VIRT_DRIVERS=y
# CONFIG_VBOXGUEST is not set
CONFIG_VIRTIO=m
# CONFIG_VIRTIO_MENU is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV is not set
# end of Microsoft Hyper-V guest support

# CONFIG_STAGING is not set
CONFIG_X86_PLATFORM_DEVICES=y
CONFIG_ACER_WMI=m
CONFIG_ACER_WIRELESS=y
CONFIG_ACERHDF=m
# CONFIG_ALIENWARE_WMI is not set
CONFIG_ASUS_LAPTOP=m
CONFIG_DCDBAS=m
CONFIG_DELL_SMBIOS=m
CONFIG_DELL_SMBIOS_WMI=y
# CONFIG_DELL_SMBIOS_SMM is not set
# CONFIG_DELL_LAPTOP is not set
CONFIG_DELL_WMI=m
CONFIG_DELL_WMI_DESCRIPTOR=m
# CONFIG_DELL_WMI_AIO is not set
CONFIG_DELL_WMI_LED=m
CONFIG_DELL_SMO8800=m
# CONFIG_DELL_RBU is not set
# CONFIG_FUJITSU_LAPTOP is not set
CONFIG_FUJITSU_TABLET=m
CONFIG_GPD_POCKET_FAN=y
# CONFIG_HP_ACCEL is not set
CONFIG_HP_WIRELESS=y
CONFIG_HP_WMI=m
# CONFIG_LG_LAPTOP is not set
CONFIG_PANASONIC_LAPTOP=m
# CONFIG_SURFACE3_WMI is not set
CONFIG_THINKPAD_ACPI=m
# CONFIG_THINKPAD_ACPI_DEBUGFACILITIES is not set
# CONFIG_THINKPAD_ACPI_DEBUG is not set
# CONFIG_THINKPAD_ACPI_UNSAFE_LEDS is not set
CONFIG_THINKPAD_ACPI_VIDEO=y
# CONFIG_THINKPAD_ACPI_HOTKEY_POLL is not set
CONFIG_SENSORS_HDAPS=m
# CONFIG_ASUS_WIRELESS is not set
CONFIG_ACPI_WMI=m
CONFIG_WMI_BMOF=m
CONFIG_INTEL_WMI_THUNDERBOLT=m
CONFIG_MSI_WMI=m
# CONFIG_PEAQ_WMI is not set
# CONFIG_TOPSTAR_LAPTOP is not set
CONFIG_ACPI_TOSHIBA=m
CONFIG_TOSHIBA_BT_RFKILL=y
# CONFIG_TOSHIBA_HAPS is not set
# CONFIG_TOSHIBA_WMI is not set
# CONFIG_ACPI_CMPC is not set
CONFIG_INTEL_INT0002_VGPIO=m
# CONFIG_INTEL_HID_EVENT is not set
# CONFIG_INTEL_VBTN is not set
# CONFIG_INTEL_IPS is not set
# CONFIG_INTEL_PMC_CORE is not set
# CONFIG_IBM_RTL is not set
CONFIG_SAMSUNG_LAPTOP=m
CONFIG_MXM_WMI=m
# CONFIG_SAMSUNG_Q10 is not set
# CONFIG_APPLE_GMUX is not set
CONFIG_INTEL_RST=y
CONFIG_INTEL_SMARTCONNECT=m
# CONFIG_INTEL_PMC_IPC is not set
# CONFIG_SURFACE_PRO3_BUTTON is not set
CONFIG_INTEL_PUNIT_IPC=m
CONFIG_MLX_PLATFORM=m
CONFIG_I2C_MULTI_INSTANTIATE=m
CONFIG_HUAWEI_WMI=m
CONFIG_PCENGINES_APU2=m
CONFIG_PMC_ATOM=y
CONFIG_CHROME_PLATFORMS=y
# CONFIG_CHROMEOS_LAPTOP is not set
# CONFIG_CHROMEOS_PSTORE is not set
CONFIG_CHROMEOS_TBMC=m
CONFIG_CROS_EC_I2C=m
# CONFIG_CROS_EC_SPI is not set
CONFIG_CROS_EC_LPC=m
CONFIG_CROS_EC_PROTO=y
CONFIG_CROS_KBD_LED_BACKLIGHT=y
CONFIG_WILCO_EC=m
CONFIG_WILCO_EC_DEBUGFS=m
# CONFIG_WILCO_EC_EVENTS is not set
# CONFIG_WILCO_EC_TELEMETRY is not set
CONFIG_MELLANOX_PLATFORM=y
# CONFIG_MLXREG_HOTPLUG is not set
CONFIG_MLXREG_IO=m
CONFIG_CLKDEV_LOOKUP=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y

#
# Common Clock Framework
#
# CONFIG_COMMON_CLK_WM831X is not set
CONFIG_COMMON_CLK_MAX9485=y
CONFIG_COMMON_CLK_SI5351=m
CONFIG_COMMON_CLK_SI544=y
CONFIG_COMMON_CLK_CDCE706=y
# CONFIG_COMMON_CLK_CS2000_CP is not set
CONFIG_COMMON_CLK_S2MPS11=y
# CONFIG_CLK_TWL6040 is not set
CONFIG_COMMON_CLK_PALMAS=y
# CONFIG_COMMON_CLK_PWM is not set
# end of Common Clock Framework

# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_PCC=y
CONFIG_ALTERA_MBOX=m
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
# CONFIG_AMD_IOMMU is not set

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=m
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=m
# CONFIG_RPMSG_CHAR is not set
CONFIG_RPMSG_QCOM_GLINK_NATIVE=m
CONFIG_RPMSG_QCOM_GLINK_RPM=m
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Aspeed SoC drivers
#
# end of Aspeed SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# IXP4xx SoC drivers
#
# CONFIG_IXP4XX_QMGR is not set
CONFIG_IXP4XX_NPE=m
# end of IXP4xx SoC drivers

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

# CONFIG_SOC_TI is not set

#
# Xilinx SoC drivers
#
# CONFIG_XILINX_VCU is not set
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
CONFIG_DEVFREQ_GOV_PERFORMANCE=y
CONFIG_DEVFREQ_GOV_POWERSAVE=m
# CONFIG_DEVFREQ_GOV_USERSPACE is not set
CONFIG_DEVFREQ_GOV_PASSIVE=y

#
# DEVFREQ Drivers
#
CONFIG_PM_DEVFREQ_EVENT=y
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
# CONFIG_EXTCON_ADC_JACK is not set
CONFIG_EXTCON_AXP288=m
# CONFIG_EXTCON_FSA9480 is not set
CONFIG_EXTCON_GPIO=m
CONFIG_EXTCON_INTEL_INT3496=y
CONFIG_EXTCON_INTEL_CHT_WC=m
# CONFIG_EXTCON_MAX3355 is not set
CONFIG_EXTCON_PALMAS=m
CONFIG_EXTCON_PTN5150=m
# CONFIG_EXTCON_RT8973A is not set
CONFIG_EXTCON_SM5502=m
CONFIG_EXTCON_USB_GPIO=m
CONFIG_EXTCON_USBC_CROS_EC=m
# CONFIG_MEMORY is not set
CONFIG_IIO=m
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=m
CONFIG_IIO_BUFFER_HW_CONSUMER=m
CONFIG_IIO_KFIFO_BUF=m
CONFIG_IIO_TRIGGERED_BUFFER=m
CONFIG_IIO_CONFIGFS=m
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
CONFIG_IIO_SW_DEVICE=m
# CONFIG_IIO_SW_TRIGGER is not set
CONFIG_IIO_TRIGGERED_EVENT=m

#
# Accelerometers
#
CONFIG_ADIS16201=m
# CONFIG_ADIS16209 is not set
CONFIG_ADXL345=m
CONFIG_ADXL345_I2C=m
# CONFIG_ADXL345_SPI is not set
# CONFIG_ADXL372_SPI is not set
# CONFIG_ADXL372_I2C is not set
# CONFIG_BMA180 is not set
CONFIG_BMA220=m
CONFIG_BMC150_ACCEL=m
CONFIG_BMC150_ACCEL_I2C=m
CONFIG_BMC150_ACCEL_SPI=m
CONFIG_DA280=m
CONFIG_DA311=m
# CONFIG_DMARD09 is not set
# CONFIG_DMARD10 is not set
CONFIG_HID_SENSOR_ACCEL_3D=m
CONFIG_IIO_CROS_EC_ACCEL_LEGACY=m
CONFIG_IIO_ST_ACCEL_3AXIS=m
CONFIG_IIO_ST_ACCEL_I2C_3AXIS=m
CONFIG_IIO_ST_ACCEL_SPI_3AXIS=m
CONFIG_KXSD9=m
# CONFIG_KXSD9_SPI is not set
CONFIG_KXSD9_I2C=m
# CONFIG_KXCJK1013 is not set
# CONFIG_MC3230 is not set
CONFIG_MMA7455=m
CONFIG_MMA7455_I2C=m
CONFIG_MMA7455_SPI=m
CONFIG_MMA7660=m
CONFIG_MMA8452=m
CONFIG_MMA9551_CORE=m
# CONFIG_MMA9551 is not set
CONFIG_MMA9553=m
CONFIG_MXC4005=m
# CONFIG_MXC6255 is not set
# CONFIG_SCA3000 is not set
CONFIG_STK8312=m
# CONFIG_STK8BA50 is not set
# end of Accelerometers

#
# Analog to digital converters
#
# CONFIG_AD7124 is not set
CONFIG_AD7266=m
# CONFIG_AD7291 is not set
CONFIG_AD7298=m
CONFIG_AD7476=m
# CONFIG_AD7606_IFACE_PARALLEL is not set
# CONFIG_AD7606_IFACE_SPI is not set
# CONFIG_AD7766 is not set
CONFIG_AD7768_1=m
# CONFIG_AD7780 is not set
# CONFIG_AD7791 is not set
# CONFIG_AD7793 is not set
CONFIG_AD7887=m
# CONFIG_AD7923 is not set
# CONFIG_AD7949 is not set
CONFIG_AD799X=m
CONFIG_AXP20X_ADC=m
CONFIG_AXP288_ADC=m
CONFIG_CC10001_ADC=m
# CONFIG_DA9150_GPADC is not set
CONFIG_HI8435=m
# CONFIG_HX711 is not set
CONFIG_INA2XX_ADC=m
# CONFIG_LP8788_ADC is not set
CONFIG_LTC2471=m
# CONFIG_LTC2485 is not set
# CONFIG_LTC2497 is not set
CONFIG_MAX1027=m
CONFIG_MAX11100=m
CONFIG_MAX1118=m
CONFIG_MAX1363=m
CONFIG_MAX9611=m
CONFIG_MCP320X=m
CONFIG_MCP3422=m
CONFIG_MCP3911=m
# CONFIG_NAU7802 is not set
# CONFIG_PALMAS_GPADC is not set
# CONFIG_TI_ADC081C is not set
CONFIG_TI_ADC0832=m
# CONFIG_TI_ADC084S021 is not set
CONFIG_TI_ADC12138=m
# CONFIG_TI_ADC108S102 is not set
CONFIG_TI_ADC128S052=m
CONFIG_TI_ADC161S626=m
# CONFIG_TI_ADS7950 is not set
CONFIG_TI_AM335X_ADC=m
# CONFIG_TI_TLC4541 is not set
CONFIG_VIPERBOARD_ADC=m
# end of Analog to digital converters

#
# Analog Front Ends
#
# end of Analog Front Ends

#
# Amplifiers
#
CONFIG_AD8366=m
# end of Amplifiers

#
# Chemical Sensors
#
CONFIG_ATLAS_PH_SENSOR=m
CONFIG_BME680=m
CONFIG_BME680_I2C=m
CONFIG_BME680_SPI=m
CONFIG_CCS811=m
# CONFIG_IAQCORE is not set
# CONFIG_SENSIRION_SGP30 is not set
CONFIG_SPS30=m
CONFIG_VZ89X=m
# end of Chemical Sensors

# CONFIG_IIO_CROS_EC_SENSORS_CORE is not set

#
# Hid Sensor IIO Common
#
CONFIG_HID_SENSOR_IIO_COMMON=m
CONFIG_HID_SENSOR_IIO_TRIGGER=m
# end of Hid Sensor IIO Common

CONFIG_IIO_MS_SENSORS_I2C=m

#
# SSP Sensor Common
#
# CONFIG_IIO_SSP_SENSORS_COMMONS is not set
CONFIG_IIO_SSP_SENSORHUB=m
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_I2C=m
CONFIG_IIO_ST_SENSORS_SPI=m
CONFIG_IIO_ST_SENSORS_CORE=m

#
# Digital to analog converters
#
CONFIG_AD5064=m
CONFIG_AD5360=m
# CONFIG_AD5380 is not set
CONFIG_AD5421=m
CONFIG_AD5446=m
# CONFIG_AD5449 is not set
CONFIG_AD5592R_BASE=m
# CONFIG_AD5592R is not set
CONFIG_AD5593R=m
# CONFIG_AD5504 is not set
CONFIG_AD5624R_SPI=m
CONFIG_LTC1660=m
CONFIG_LTC2632=m
CONFIG_AD5686=m
CONFIG_AD5686_SPI=m
CONFIG_AD5696_I2C=m
CONFIG_AD5755=m
CONFIG_AD5758=m
CONFIG_AD5761=m
CONFIG_AD5764=m
# CONFIG_AD5791 is not set
CONFIG_AD7303=m
# CONFIG_AD8801 is not set
CONFIG_DS4424=m
CONFIG_M62332=m
CONFIG_MAX517=m
CONFIG_MCP4725=m
# CONFIG_MCP4922 is not set
CONFIG_TI_DAC082S085=m
CONFIG_TI_DAC5571=m
# CONFIG_TI_DAC7311 is not set
CONFIG_TI_DAC7612=m
# end of Digital to analog converters

#
# IIO dummy driver
#
CONFIG_IIO_SIMPLE_DUMMY=m
# CONFIG_IIO_SIMPLE_DUMMY_EVENTS is not set
CONFIG_IIO_SIMPLE_DUMMY_BUFFER=y
# end of IIO dummy driver

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
# CONFIG_AD9523 is not set
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
# CONFIG_ADF4350 is not set
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
# CONFIG_ADIS16080 is not set
CONFIG_ADIS16130=m
# CONFIG_ADIS16136 is not set
# CONFIG_ADIS16260 is not set
CONFIG_ADXRS450=m
CONFIG_BMG160=m
CONFIG_BMG160_I2C=m
CONFIG_BMG160_SPI=m
CONFIG_FXAS21002C=m
CONFIG_FXAS21002C_I2C=m
CONFIG_FXAS21002C_SPI=m
CONFIG_HID_SENSOR_GYRO_3D=m
# CONFIG_MPU3050_I2C is not set
CONFIG_IIO_ST_GYRO_3AXIS=m
CONFIG_IIO_ST_GYRO_I2C_3AXIS=m
CONFIG_IIO_ST_GYRO_SPI_3AXIS=m
CONFIG_ITG3200=m
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
CONFIG_AFE4403=m
# CONFIG_AFE4404 is not set
# CONFIG_MAX30100 is not set
CONFIG_MAX30102=m
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
# CONFIG_AM2315 is not set
# CONFIG_DHT11 is not set
CONFIG_HDC100X=m
CONFIG_HID_SENSOR_HUMIDITY=m
CONFIG_HTS221=m
CONFIG_HTS221_I2C=m
CONFIG_HTS221_SPI=m
CONFIG_HTU21=m
CONFIG_SI7005=m
CONFIG_SI7020=m
# end of Humidity sensors

#
# Inertial measurement units
#
# CONFIG_ADIS16400 is not set
CONFIG_ADIS16480=m
# CONFIG_BMI160_I2C is not set
# CONFIG_BMI160_SPI is not set
CONFIG_KMX61=m
CONFIG_INV_MPU6050_IIO=m
CONFIG_INV_MPU6050_SPI=m
# CONFIG_IIO_ST_LSM6DSX is not set
# end of Inertial measurement units

CONFIG_IIO_ADIS_LIB=m
CONFIG_IIO_ADIS_LIB_BUFFER=y

#
# Light sensors
#
# CONFIG_ACPI_ALS is not set
# CONFIG_ADJD_S311 is not set
CONFIG_AL3320A=m
CONFIG_APDS9300=m
# CONFIG_APDS9960 is not set
CONFIG_BH1750=m
CONFIG_BH1780=m
# CONFIG_CM32181 is not set
# CONFIG_CM3232 is not set
CONFIG_CM3323=m
CONFIG_CM36651=m
# CONFIG_GP2AP020A00F is not set
# CONFIG_SENSORS_ISL29018 is not set
CONFIG_SENSORS_ISL29028=m
# CONFIG_ISL29125 is not set
CONFIG_HID_SENSOR_ALS=m
# CONFIG_HID_SENSOR_PROX is not set
# CONFIG_JSA1212 is not set
CONFIG_RPR0521=m
CONFIG_SENSORS_LM3533=m
CONFIG_LTR501=m
CONFIG_LV0104CS=m
# CONFIG_MAX44000 is not set
CONFIG_MAX44009=m
# CONFIG_OPT3001 is not set
# CONFIG_PA12203001 is not set
CONFIG_SI1133=m
# CONFIG_SI1145 is not set
CONFIG_STK3310=m
# CONFIG_ST_UVIS25 is not set
# CONFIG_TCS3414 is not set
# CONFIG_TCS3472 is not set
CONFIG_SENSORS_TSL2563=m
# CONFIG_TSL2583 is not set
CONFIG_TSL2772=m
CONFIG_TSL4531=m
CONFIG_US5182D=m
CONFIG_VCNL4000=m
# CONFIG_VCNL4035 is not set
CONFIG_VEML6070=m
CONFIG_VL6180=m
CONFIG_ZOPT2201=m
# end of Light sensors

#
# Magnetometer sensors
#
CONFIG_AK8975=m
CONFIG_AK09911=m
CONFIG_BMC150_MAGN=m
# CONFIG_BMC150_MAGN_I2C is not set
CONFIG_BMC150_MAGN_SPI=m
# CONFIG_MAG3110 is not set
CONFIG_HID_SENSOR_MAGNETOMETER_3D=m
CONFIG_MMC35240=m
CONFIG_IIO_ST_MAGN_3AXIS=m
CONFIG_IIO_ST_MAGN_I2C_3AXIS=m
CONFIG_IIO_ST_MAGN_SPI_3AXIS=m
CONFIG_SENSORS_HMC5843=m
CONFIG_SENSORS_HMC5843_I2C=m
CONFIG_SENSORS_HMC5843_SPI=m
CONFIG_SENSORS_RM3100=m
CONFIG_SENSORS_RM3100_I2C=m
CONFIG_SENSORS_RM3100_SPI=m
# end of Magnetometer sensors

#
# Multiplexers
#
# end of Multiplexers

#
# Inclinometer sensors
#
CONFIG_HID_SENSOR_INCLINOMETER_3D=m
CONFIG_HID_SENSOR_DEVICE_ROTATION=m
# end of Inclinometer sensors

#
# Triggers - standalone
#
# CONFIG_IIO_INTERRUPT_TRIGGER is not set
CONFIG_IIO_SYSFS_TRIGGER=m
# end of Triggers - standalone

#
# Digital potentiometers
#
# CONFIG_AD5272 is not set
CONFIG_DS1803=m
# CONFIG_MAX5481 is not set
CONFIG_MAX5487=m
# CONFIG_MCP4018 is not set
CONFIG_MCP4131=m
# CONFIG_MCP4531 is not set
CONFIG_MCP41010=m
# CONFIG_TPL0102 is not set
# end of Digital potentiometers

#
# Digital potentiostats
#
CONFIG_LMP91000=m
# end of Digital potentiostats

#
# Pressure sensors
#
CONFIG_ABP060MG=m
CONFIG_BMP280=m
CONFIG_BMP280_I2C=m
CONFIG_BMP280_SPI=m
CONFIG_HID_SENSOR_PRESS=m
CONFIG_HP03=m
CONFIG_MPL115=m
CONFIG_MPL115_I2C=m
CONFIG_MPL115_SPI=m
CONFIG_MPL3115=m
CONFIG_MS5611=m
CONFIG_MS5611_I2C=m
# CONFIG_MS5611_SPI is not set
# CONFIG_MS5637 is not set
# CONFIG_IIO_ST_PRESS is not set
CONFIG_T5403=m
CONFIG_HP206C=m
# CONFIG_ZPA2326 is not set
# end of Pressure sensors

#
# Lightning sensors
#
# CONFIG_AS3935 is not set
# end of Lightning sensors

#
# Proximity and distance sensors
#
# CONFIG_ISL29501 is not set
CONFIG_LIDAR_LITE_V2=m
# CONFIG_MB1232 is not set
# CONFIG_RFD77402 is not set
# CONFIG_SRF04 is not set
CONFIG_SX9500=m
# CONFIG_SRF08 is not set
# CONFIG_VL53L0X_I2C is not set
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
CONFIG_AD2S90=m
CONFIG_AD2S1200=m
# end of Resolver to digital converters

#
# Temperature sensors
#
CONFIG_MAXIM_THERMOCOUPLE=m
# CONFIG_HID_SENSOR_TEMP is not set
# CONFIG_MLX90614 is not set
CONFIG_MLX90632=m
CONFIG_TMP006=m
# CONFIG_TMP007 is not set
# CONFIG_TSYS01 is not set
# CONFIG_TSYS02D is not set
CONFIG_MAX31856=m
# end of Temperature sensors

# CONFIG_NTB is not set
# CONFIG_VME_BUS is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
CONFIG_PWM_CROS_EC=m
CONFIG_PWM_LP3943=m
CONFIG_PWM_LPSS=m
# CONFIG_PWM_LPSS_PCI is not set
CONFIG_PWM_LPSS_PLATFORM=m
CONFIG_PWM_PCA9685=y

#
# IRQ chip support
#
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
CONFIG_RESET_CONTROLLER=y
# CONFIG_RESET_TI_SYSCON is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_BCM_KONA_USB2_PHY=m
CONFIG_PHY_PXA_28NM_HSIC=m
# CONFIG_PHY_PXA_28NM_USB2 is not set
CONFIG_PHY_CPCAP_USB=m
CONFIG_PHY_QCOM_USB_HS=m
CONFIG_PHY_QCOM_USB_HSIC=m
CONFIG_PHY_SAMSUNG_USB2=m
# CONFIG_PHY_TUSB1210 is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_IDLE_INJECT=y
# CONFIG_MCB is not set

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=y
# CONFIG_THUNDERBOLT is not set

#
# Android
#
CONFIG_ANDROID=y
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

# CONFIG_LIBNVDIMM is not set
# CONFIG_DAX is not set
CONFIG_NVMEM=y
# CONFIG_NVMEM_SYSFS is not set

#
# HW tracing support
#
# CONFIG_STM is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

CONFIG_FPGA=y
CONFIG_ALTERA_PR_IP_CORE=y
CONFIG_FPGA_MGR_ALTERA_PS_SPI=y
# CONFIG_FPGA_MGR_ALTERA_CVP is not set
CONFIG_FPGA_MGR_XILINX_SPI=m
# CONFIG_FPGA_MGR_MACHXO2_SPI is not set
CONFIG_FPGA_BRIDGE=m
CONFIG_ALTERA_FREEZE_BRIDGE=m
CONFIG_XILINX_PR_DECOUPLER=m
CONFIG_FPGA_REGION=m
# CONFIG_FPGA_DFL is not set
CONFIG_PM_OPP=y
CONFIG_UNISYS_VISORBUS=y
CONFIG_SIOX=m
# CONFIG_SIOX_BUS_GPIO is not set
CONFIG_SLIMBUS=y
CONFIG_SLIM_QCOM_CTRL=y
CONFIG_INTERCONNECT=m
CONFIG_COUNTER=y
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
CONFIG_EXT2_FS=y
# CONFIG_EXT2_FS_XATTR is not set
CONFIG_EXT3_FS=y
CONFIG_EXT3_FS_POSIX_ACL=y
# CONFIG_EXT3_FS_SECURITY is not set
CONFIG_EXT4_FS=y
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
# CONFIG_EXT4_DEBUG is not set
CONFIG_JBD2=y
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=y
CONFIG_REISERFS_FS=m
CONFIG_REISERFS_CHECK=y
CONFIG_REISERFS_PROC_INFO=y
CONFIG_REISERFS_FS_XATTR=y
CONFIG_REISERFS_FS_POSIX_ACL=y
# CONFIG_REISERFS_FS_SECURITY is not set
CONFIG_JFS_FS=m
CONFIG_JFS_POSIX_ACL=y
# CONFIG_JFS_SECURITY is not set
CONFIG_JFS_DEBUG=y
# CONFIG_JFS_STATISTICS is not set
CONFIG_XFS_FS=m
CONFIG_XFS_QUOTA=y
# CONFIG_XFS_POSIX_ACL is not set
CONFIG_XFS_RT=y
CONFIG_XFS_ONLINE_SCRUB=y
# CONFIG_XFS_ONLINE_REPAIR is not set
CONFIG_XFS_WARN=y
# CONFIG_XFS_DEBUG is not set
CONFIG_GFS2_FS=m
# CONFIG_OCFS2_FS is not set
CONFIG_BTRFS_FS=y
CONFIG_BTRFS_FS_POSIX_ACL=y
# CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
CONFIG_BTRFS_DEBUG=y
CONFIG_BTRFS_ASSERT=y
# CONFIG_BTRFS_FS_REF_VERIFY is not set
CONFIG_NILFS2_FS=y
CONFIG_F2FS_FS=m
CONFIG_F2FS_STAT_FS=y
# CONFIG_F2FS_FS_XATTR is not set
CONFIG_F2FS_CHECK_FS=y
# CONFIG_F2FS_IO_TRACE is not set
# CONFIG_F2FS_FAULT_INJECTION is not set
# CONFIG_FS_DAX is not set
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_MANDATORY_FILE_LOCKING=y
# CONFIG_FS_ENCRYPTION is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
# CONFIG_FANOTIFY is not set
# CONFIG_QUOTA is not set
# CONFIG_QUOTA_NETLINK_INTERFACE is not set
CONFIG_QUOTACTL=y
# CONFIG_AUTOFS4_FS is not set
CONFIG_AUTOFS_FS=y
# CONFIG_FUSE_FS is not set
# CONFIG_OVERLAY_FS is not set

#
# Caches
#
CONFIG_FSCACHE=m
# CONFIG_FSCACHE_STATS is not set
CONFIG_FSCACHE_HISTOGRAM=y
# CONFIG_FSCACHE_DEBUG is not set
CONFIG_FSCACHE_OBJECT_LIST=y
CONFIG_CACHEFILES=m
CONFIG_CACHEFILES_DEBUG=y
CONFIG_CACHEFILES_HISTOGRAM=y
# end of Caches

#
# CD-ROM/DVD Filesystems
#
# CONFIG_ISO9660_FS is not set
# CONFIG_UDF_FS is not set
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/NT Filesystems
#
CONFIG_FAT_FS=y
CONFIG_MSDOS_FS=m
CONFIG_VFAT_FS=y
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
CONFIG_FAT_DEFAULT_UTF8=y
# CONFIG_NTFS_FS is not set
# end of DOS/FAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
# CONFIG_PROC_KCORE is not set
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
# CONFIG_HUGETLBFS is not set
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

# CONFIG_MISC_FILESYSTEMS is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
CONFIG_NFS_V2=y
CONFIG_NFS_V3=y
# CONFIG_NFS_V3_ACL is not set
CONFIG_NFS_V4=m
# CONFIG_NFS_SWAP is not set
# CONFIG_NFS_V4_1 is not set
# CONFIG_ROOT_NFS is not set
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
# CONFIG_NFSD is not set
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_COMMON=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=m
# CONFIG_SUNRPC_DEBUG is not set
# CONFIG_CEPH_FS is not set
CONFIG_CIFS=m
# CONFIG_CIFS_STATS2 is not set
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
# CONFIG_CIFS_WEAK_PW_HASH is not set
# CONFIG_CIFS_UPCALL is not set
# CONFIG_CIFS_XATTR is not set
CONFIG_CIFS_DEBUG=y
# CONFIG_CIFS_DEBUG2 is not set
# CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
# CONFIG_CIFS_DFS_UPCALL is not set
# CONFIG_CIFS_FSCACHE is not set
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
# CONFIG_9P_FS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=y
# CONFIG_NLS_CODEPAGE_737 is not set
# CONFIG_NLS_CODEPAGE_775 is not set
CONFIG_NLS_CODEPAGE_850=y
CONFIG_NLS_CODEPAGE_852=y
CONFIG_NLS_CODEPAGE_855=y
CONFIG_NLS_CODEPAGE_857=y
# CONFIG_NLS_CODEPAGE_860 is not set
CONFIG_NLS_CODEPAGE_861=m
CONFIG_NLS_CODEPAGE_862=y
# CONFIG_NLS_CODEPAGE_863 is not set
CONFIG_NLS_CODEPAGE_864=m
# CONFIG_NLS_CODEPAGE_865 is not set
CONFIG_NLS_CODEPAGE_866=m
CONFIG_NLS_CODEPAGE_869=y
# CONFIG_NLS_CODEPAGE_936 is not set
CONFIG_NLS_CODEPAGE_950=y
CONFIG_NLS_CODEPAGE_932=y
CONFIG_NLS_CODEPAGE_949=y
# CONFIG_NLS_CODEPAGE_874 is not set
CONFIG_NLS_ISO8859_8=y
CONFIG_NLS_CODEPAGE_1250=y
# CONFIG_NLS_CODEPAGE_1251 is not set
# CONFIG_NLS_ASCII is not set
CONFIG_NLS_ISO8859_1=m
CONFIG_NLS_ISO8859_2=m
CONFIG_NLS_ISO8859_3=y
# CONFIG_NLS_ISO8859_4 is not set
# CONFIG_NLS_ISO8859_5 is not set
CONFIG_NLS_ISO8859_6=y
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=y
CONFIG_NLS_ISO8859_13=y
CONFIG_NLS_ISO8859_14=y
CONFIG_NLS_ISO8859_15=y
CONFIG_NLS_KOI8_R=y
# CONFIG_NLS_KOI8_U is not set
CONFIG_NLS_MAC_ROMAN=m
# CONFIG_NLS_MAC_CELTIC is not set
# CONFIG_NLS_MAC_CENTEURO is not set
CONFIG_NLS_MAC_CROATIAN=m
CONFIG_NLS_MAC_CYRILLIC=m
CONFIG_NLS_MAC_GAELIC=m
# CONFIG_NLS_MAC_GREEK is not set
# CONFIG_NLS_MAC_ICELAND is not set
CONFIG_NLS_MAC_INUIT=m
CONFIG_NLS_MAC_ROMANIAN=y
CONFIG_NLS_MAC_TURKISH=m
# CONFIG_NLS_UTF8 is not set
# CONFIG_DLM is not set
CONFIG_UNICODE=y
CONFIG_UNICODE_NORMALIZATION_SELFTEST=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_PERSISTENT_KEYRINGS is not set
# CONFIG_BIG_KEYS is not set
CONFIG_TRUSTED_KEYS=m
CONFIG_ENCRYPTED_KEYS=m
# CONFIG_KEY_DH_OPERATIONS is not set
CONFIG_SECURITY_DMESG_RESTRICT=y
CONFIG_SECURITY=y
# CONFIG_SECURITYFS is not set
CONFIG_SECURITY_NETWORK=y
CONFIG_PAGE_TABLE_ISOLATION=y
# CONFIG_SECURITY_PATH is not set
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
# CONFIG_HARDENED_USERCOPY is not set
CONFIG_FORTIFY_SOURCE=y
# CONFIG_STATIC_USERMODEHELPER is not set
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
# CONFIG_SECURITY_APPARMOR is not set
CONFIG_SECURITY_LOADPIN=y
# CONFIG_SECURITY_LOADPIN_ENFORCE is not set
CONFIG_SECURITY_YAMA=y
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_INTEGRITY is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="yama,loadpin,safesetid,integrity"

#
# Kernel hardening options
#
CONFIG_GCC_PLUGIN_STRUCTLEAK=y

#
# Memory initialization
#
# CONFIG_INIT_STACK_NONE is not set
# CONFIG_GCC_PLUGIN_STRUCTLEAK_USER is not set
CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF=y
# CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL is not set
# CONFIG_GCC_PLUGIN_STRUCTLEAK_VERBOSE is not set
# CONFIG_GCC_PLUGIN_STACKLEAK is not set
# end of Memory initialization
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=y
CONFIG_ASYNC_CORE=m
CONFIG_ASYNC_MEMCPY=m
CONFIG_ASYNC_XOR=m
CONFIG_ASYNC_PQ=m
CONFIG_ASYNC_RAID6_RECOV=m
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_BLKCIPHER=y
CONFIG_CRYPTO_BLKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
# CONFIG_CRYPTO_USER is not set
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=y
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
CONFIG_CRYPTO_TEST=m
CONFIG_CRYPTO_SIMD=y
CONFIG_CRYPTO_GLUE_HELPER_X86=y

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
# CONFIG_CRYPTO_DH is not set
# CONFIG_CRYPTO_ECDH is not set
# CONFIG_CRYPTO_ECRDSA is not set

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=y
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_AEGIS128=y
# CONFIG_CRYPTO_AEGIS128L is not set
CONFIG_CRYPTO_AEGIS256=m
# CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
# CONFIG_CRYPTO_AEGIS128L_AESNI_SSE2 is not set
# CONFIG_CRYPTO_AEGIS256_AESNI_SSE2 is not set
CONFIG_CRYPTO_MORUS640=m
CONFIG_CRYPTO_MORUS640_GLUE=y
CONFIG_CRYPTO_MORUS640_SSE2=y
CONFIG_CRYPTO_MORUS1280=y
CONFIG_CRYPTO_MORUS1280_GLUE=y
CONFIG_CRYPTO_MORUS1280_SSE2=y
# CONFIG_CRYPTO_MORUS1280_AVX2 is not set
CONFIG_CRYPTO_SEQIV=y
# CONFIG_CRYPTO_ECHAINIV is not set

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
# CONFIG_CRYPTO_CTS is not set
CONFIG_CRYPTO_ECB=y
# CONFIG_CRYPTO_LRW is not set
CONFIG_CRYPTO_OFB=y
CONFIG_CRYPTO_PCBC=y
CONFIG_CRYPTO_XTS=y
# CONFIG_CRYPTO_KEYWRAP is not set
CONFIG_CRYPTO_NHPOLY1305=y
# CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
CONFIG_CRYPTO_NHPOLY1305_AVX2=y
# CONFIG_CRYPTO_ADIANTUM is not set

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_HMAC=y
# CONFIG_CRYPTO_XCBC is not set
# CONFIG_CRYPTO_VMAC is not set

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32C_INTEL=y
CONFIG_CRYPTO_CRC32=m
# CONFIG_CRYPTO_CRC32_PCLMUL is not set
# CONFIG_CRYPTO_XXHASH is not set
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRCT10DIF_PCLMUL=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLY1305=y
CONFIG_CRYPTO_POLY1305_X86_64=m
CONFIG_CRYPTO_MD4=y
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=m
CONFIG_CRYPTO_RMD128=m
CONFIG_CRYPTO_RMD160=y
# CONFIG_CRYPTO_RMD256 is not set
CONFIG_CRYPTO_RMD320=y
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA1_SSSE3=y
CONFIG_CRYPTO_SHA256_SSSE3=y
# CONFIG_CRYPTO_SHA512_SSSE3 is not set
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
# CONFIG_CRYPTO_SHA3 is not set
CONFIG_CRYPTO_SM3=y
CONFIG_CRYPTO_STREEBOG=y
CONFIG_CRYPTO_TGR192=y
# CONFIG_CRYPTO_WP512 is not set
CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=y

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
CONFIG_CRYPTO_AES_X86_64=y
# CONFIG_CRYPTO_AES_NI_INTEL is not set
CONFIG_CRYPTO_ANUBIS=m
CONFIG_CRYPTO_LIB_ARC4=m
CONFIG_CRYPTO_ARC4=m
CONFIG_CRYPTO_BLOWFISH=m
CONFIG_CRYPTO_BLOWFISH_COMMON=m
# CONFIG_CRYPTO_BLOWFISH_X86_64 is not set
CONFIG_CRYPTO_CAMELLIA=y
CONFIG_CRYPTO_CAMELLIA_X86_64=y
# CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64 is not set
# CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64 is not set
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=m
CONFIG_CRYPTO_CAST5_AVX_X86_64=m
CONFIG_CRYPTO_CAST6=y
CONFIG_CRYPTO_CAST6_AVX_X86_64=y
CONFIG_CRYPTO_DES=y
CONFIG_CRYPTO_DES3_EDE_X86_64=y
CONFIG_CRYPTO_FCRYPT=m
# CONFIG_CRYPTO_KHAZAD is not set
CONFIG_CRYPTO_SALSA20=m
CONFIG_CRYPTO_CHACHA20=m
CONFIG_CRYPTO_CHACHA20_X86_64=m
CONFIG_CRYPTO_SEED=m
CONFIG_CRYPTO_SERPENT=m
# CONFIG_CRYPTO_SERPENT_SSE2_X86_64 is not set
CONFIG_CRYPTO_SERPENT_AVX_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX2_X86_64=m
CONFIG_CRYPTO_SM4=y
CONFIG_CRYPTO_TEA=y
# CONFIG_CRYPTO_TWOFISH is not set
CONFIG_CRYPTO_TWOFISH_COMMON=m
CONFIG_CRYPTO_TWOFISH_X86_64=m
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=m
# CONFIG_CRYPTO_TWOFISH_AVX_X86_64 is not set

#
# Compression
#
# CONFIG_CRYPTO_DEFLATE is not set
# CONFIG_CRYPTO_LZO is not set
CONFIG_CRYPTO_842=m
CONFIG_CRYPTO_LZ4=m
CONFIG_CRYPTO_LZ4HC=y
CONFIG_CRYPTO_ZSTD=y

#
# Random Number Generation
#
# CONFIG_CRYPTO_ANSI_CPRNG is not set
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
# CONFIG_CRYPTO_DRBG_CTR is not set
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
# CONFIG_CRYPTO_USER_API_HASH is not set
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
# CONFIG_CRYPTO_USER_API_RNG is not set
# CONFIG_CRYPTO_USER_API_AEAD is not set
CONFIG_CRYPTO_HASH_INFO=y
CONFIG_CRYPTO_HW=y
CONFIG_CRYPTO_DEV_PADLOCK=m
# CONFIG_CRYPTO_DEV_PADLOCK_AES is not set
# CONFIG_CRYPTO_DEV_PADLOCK_SHA is not set
# CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
# CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
# CONFIG_CRYPTO_DEV_CCP is not set
# CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
# CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
# CONFIG_CRYPTO_DEV_QAT_C62X is not set
# CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
# CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
# CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
# CONFIG_CRYPTO_DEV_VIRTIO is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_ASYMMETRIC_TPM_KEY_SUBTYPE=m
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS8_PRIVATE_KEY_PARSER=y
CONFIG_TPM_KEY_PARSER=m
CONFIG_PKCS7_MESSAGE_PARSER=y

#
# Certificates for signature checking
#
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
CONFIG_SECONDARY_TRUSTED_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=y
# CONFIG_RAID6_PQ_BENCHMARK is not set
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_GENERIC_FIND_FIRST_BIT=y
CONFIG_CORDIC=m
CONFIG_PRIME_NUMBERS=y
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_CRC_CCITT=m
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC_ITU_T=m
CONFIG_CRC32=y
CONFIG_CRC32_SELFTEST=m
# CONFIG_CRC32_SLICEBY8 is not set
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
CONFIG_CRC32_BIT=y
CONFIG_CRC64=y
# CONFIG_CRC4 is not set
CONFIG_CRC7=m
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=m
CONFIG_842_DECOMPRESS=m
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=m
CONFIG_LZ4HC_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=m
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_BCJ=y
CONFIG_XZ_DEC_TEST=m
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=m
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_SWIOTLB=y
CONFIG_DMA_CMA=y

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_MBYTES=0
CONFIG_CMA_SIZE_SEL_MBYTES=y
# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
# CONFIG_CMA_SIZE_SEL_MIN is not set
# CONFIG_CMA_SIZE_SEL_MAX is not set
CONFIG_CMA_ALIGNMENT=8
# CONFIG_DMA_API_DEBUG is not set
CONFIG_SGL_ALLOC=y
CONFIG_CHECK_SIGNATURE=y
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_OID_REGISTRY=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_FONT_SUPPORT=y
CONFIG_FONTS=y
# CONFIG_FONT_8x8 is not set
CONFIG_FONT_8x16=y
# CONFIG_FONT_6x11 is not set
CONFIG_FONT_7x14=y
CONFIG_FONT_PEARL_8x8=y
# CONFIG_FONT_ACORN_8x8 is not set
# CONFIG_FONT_MINI_4x6 is not set
# CONFIG_FONT_6x10 is not set
CONFIG_FONT_10x18=y
# CONFIG_FONT_SUN8x16 is not set
CONFIG_FONT_SUN12x22=y
CONFIG_FONT_TER16x32=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_SBITMAP=y
CONFIG_STRING_SELFTEST=y
# end of Library routines

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
# CONFIG_PRINTK_CALLER is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_BOOT_PRINTK_DELAY=y
# CONFIG_DYNAMIC_DEBUG is not set
# end of printk and dmesg options

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_DEBUG_INFO_REDUCED=y
# CONFIG_DEBUG_INFO_SPLIT is not set
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_DEBUG_INFO_BTF is not set
# CONFIG_GDB_SCRIPTS is not set
# CONFIG_ENABLE_MUST_CHECK is not set
CONFIG_FRAME_WARN=8192
# CONFIG_STRIP_ASM_SYMS is not set
# CONFIG_READABLE_ASM is not set
CONFIG_UNUSED_SYMBOLS=y
CONFIG_DEBUG_FS=y
# CONFIG_HEADERS_INSTALL is not set
CONFIG_OPTIMIZE_INLINING=y
# CONFIG_DEBUG_SECTION_MISMATCH is not set
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_STACK_VALIDATION=y
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
# CONFIG_MAGIC_SYSRQ_SERIAL is not set
CONFIG_DEBUG_KERNEL=y
# CONFIG_DEBUG_MISC is not set

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
CONFIG_DEBUG_PAGEALLOC=y
# CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT is not set
CONFIG_PAGE_OWNER=y
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
# CONFIG_DEBUG_OBJECTS is not set
CONFIG_SLUB_DEBUG_ON=y
CONFIG_SLUB_STATS=y
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_STACK_USAGE is not set
CONFIG_DEBUG_VM=y
# CONFIG_DEBUG_VM_VMACACHE is not set
CONFIG_DEBUG_VM_RB=y
# CONFIG_DEBUG_VM_PGFLAGS is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
CONFIG_DEBUG_VIRTUAL=y
CONFIG_DEBUG_MEMORY_INIT=y
# CONFIG_MEMORY_NOTIFIER_ERROR_INJECT is not set
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_KASAN=y
CONFIG_KASAN_GENERIC=y
CONFIG_KASAN_OUTLINE=y
# CONFIG_KASAN_INLINE is not set
CONFIG_KASAN_STACK=1
CONFIG_TEST_KASAN=m
# end of Memory Debugging

CONFIG_ARCH_HAS_KCOV=y
# CONFIG_KCOV is not set
# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Lockups and Hangs
#
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=1
CONFIG_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
CONFIG_HARDLOCKUP_DETECTOR=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=1
# CONFIG_DETECT_HUNG_TASK is not set
# CONFIG_WQ_WATCHDOG is not set
# end of Debug Lockups and Hangs

# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=0
CONFIG_PANIC_TIMEOUT=0
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
CONFIG_SCHED_STACK_END_CHECK=y
# CONFIG_DEBUG_TIMEKEEPING is not set
CONFIG_DEBUG_PREEMPT=y

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
# CONFIG_PROVE_LOCKING is not set
# CONFIG_LOCK_STAT is not set
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
# CONFIG_DEBUG_LOCKDEP is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
CONFIG_DEBUG_LOCKING_API_SELFTESTS=y
CONFIG_LOCK_TORTURE_TEST=m
CONFIG_WW_MUTEX_SELFTEST=y
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_TRACE_IRQFLAGS=y
CONFIG_STACKTRACE=y
CONFIG_WARN_ALL_UNSEEDED_RANDOM=y
# CONFIG_DEBUG_KOBJECT is not set
CONFIG_DEBUG_BUGVERBOSE=y
CONFIG_DEBUG_LIST=y
CONFIG_DEBUG_PLIST=y
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_TORTURE_TEST=y
CONFIG_RCU_PERF_TEST=y
CONFIG_RCU_TORTURE_TEST=m
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_TRACE=y
CONFIG_RCU_EQS_DEBUG=y
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
CONFIG_CPU_HOTPLUG_STATE_CONTROL=y
CONFIG_NOTIFIER_ERROR_INJECTION=m
# CONFIG_PM_NOTIFIER_ERROR_INJECT is not set
# CONFIG_NETDEV_NOTIFIER_ERROR_INJECT is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
CONFIG_FAULT_INJECTION=y
# CONFIG_FAILSLAB is not set
CONFIG_FAIL_PAGE_ALLOC=y
# CONFIG_FAIL_MAKE_REQUEST is not set
# CONFIG_FAIL_IO_TIMEOUT is not set
# CONFIG_FAIL_FUTEX is not set
CONFIG_FAULT_INJECTION_DEBUG_FS=y
# CONFIG_FAIL_FUNCTION is not set
CONFIG_FAIL_MMC_REQUEST=y
CONFIG_LATENCYTOP=y
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
CONFIG_FUNCTION_TRACER=y
CONFIG_FUNCTION_GRAPH_TRACER=y
CONFIG_TRACE_PREEMPT_TOGGLE=y
CONFIG_PREEMPTIRQ_EVENTS=y
# CONFIG_IRQSOFF_TRACER is not set
# CONFIG_PREEMPT_TRACER is not set
# CONFIG_SCHED_TRACER is not set
CONFIG_HWLAT_TRACER=y
# CONFIG_FTRACE_SYSCALLS is not set
# CONFIG_TRACER_SNAPSHOT is not set
CONFIG_TRACE_BRANCH_PROFILING=y
# CONFIG_BRANCH_PROFILE_NONE is not set
CONFIG_PROFILE_ANNOTATED_BRANCHES=y
CONFIG_TRACING_BRANCHES=y
CONFIG_BRANCH_TRACER=y
# CONFIG_STACK_TRACER is not set
# CONFIG_BLK_DEV_IO_TRACE is not set
CONFIG_KPROBE_EVENTS=y
CONFIG_UPROBE_EVENTS=y
CONFIG_BPF_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
# CONFIG_DYNAMIC_FTRACE is not set
# CONFIG_FUNCTION_PROFILER is not set
CONFIG_BPF_KPROBE_OVERRIDE=y
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_MMIOTRACE is not set
CONFIG_TRACING_MAP=y
CONFIG_HIST_TRIGGERS=y
# CONFIG_TRACEPOINT_BENCHMARK is not set
CONFIG_RING_BUFFER_BENCHMARK=m
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
CONFIG_PREEMPTIRQ_DELAY_TEST=m
# CONFIG_TRACE_EVAL_MAP_FILE is not set
CONFIG_GCOV_PROFILE_FTRACE=y
# CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
# CONFIG_RUNTIME_TESTING_MENU is not set
# CONFIG_MEMTEST is not set
CONFIG_BUG_ON_DATA_CORRUPTION=y
# CONFIG_SAMPLES is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
# CONFIG_UBSAN_SANITIZE_ALL is not set
CONFIG_UBSAN_NO_ALIGNMENT=y
CONFIG_TEST_UBSAN=m
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
# CONFIG_EARLY_PRINTK_DBGP is not set
# CONFIG_EARLY_PRINTK_USB_XDBC is not set
CONFIG_X86_PTDUMP_CORE=y
# CONFIG_X86_PTDUMP is not set
CONFIG_DEBUG_WX=y
CONFIG_DOUBLEFAULT=y
# CONFIG_DEBUG_TLBFLUSH is not set
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
# CONFIG_X86_DECODER_SELFTEST is not set
# CONFIG_IO_DELAY_0X80 is not set
# CONFIG_IO_DELAY_0XED is not set
# CONFIG_IO_DELAY_UDELAY is not set
CONFIG_IO_DELAY_NONE=y
CONFIG_DEBUG_BOOT_PARAMS=y
# CONFIG_CPA_DEBUG is not set
CONFIG_DEBUG_ENTRY=y
CONFIG_DEBUG_NMI_SELFTEST=y
# CONFIG_X86_DEBUG_FPU is not set
# CONFIG_PUNIT_ATOM_DEBUG is not set
CONFIG_UNWINDER_ORC=y
# CONFIG_UNWINDER_FRAME_POINTER is not set
# end of Kernel hacking

--=_5d12cb6f.aVQw8tnFbKitLG0SgD4sZZwt6cS5gfp/AjlkSuL9pM/4A1z7--
