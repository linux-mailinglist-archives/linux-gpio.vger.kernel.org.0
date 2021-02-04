Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9582E30ED13
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Feb 2021 08:14:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232977AbhBDHOp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Feb 2021 02:14:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231359AbhBDHOo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Feb 2021 02:14:44 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D98C0613ED
        for <linux-gpio@vger.kernel.org>; Wed,  3 Feb 2021 23:14:03 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id l12so2868328edt.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Feb 2021 23:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=m4Svsks4F1WJxXzmQuHWNGVoFSZ6gcnQj15bvC/Ooz0=;
        b=gMJ2xTHUNIpcuu/J7Ya68NOeZt8o6s5Bm08ruKNPXOLhlWPlMOvYXz8LPxzMvU6L2S
         LvI9BCHyUYNmsUX6Rzw8OYCjGHNevqWkTFeuypfGy8utzB6L8Ojv0k3D/espzd4LnVaR
         /3I6K8ccbFwphf19PdJuVENBaf8TXRk5AWWehZqAkEQSC5yBtdigfVMm5wiB2C9+rd8t
         UCxKjEUjdi3AHCbtT3mNDhosYNFVHMTuJOaGqeui72nWtkJOk9Z2ryOkhL17y5uLypUQ
         AbzxoZ2u0YBHzUZqlWKIIfKL7OMlBJGCOlBa/XpyotPIdYdWe2q1uE6vSuYECNYuTMCg
         lVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=m4Svsks4F1WJxXzmQuHWNGVoFSZ6gcnQj15bvC/Ooz0=;
        b=MKckIRGcNOzrXRO0eJiSxP7Txv+MbKcigr3iTmKbVliKzkmNScPeat9avNkWs/l1b7
         Hiq2XWmniKuISlOSrKmpfAH63RZ1lNDGpccKRZssW0ksuqkAPScx3nxXxN611W+Wsg94
         j3G+2t32FFMkVXrimmr/rSgK6j4n9mF57+nijCZZON2I2505QcX/YsjPQvjxK+WQru0z
         xTbwHBMbv1CntHVwjidK30Rqmu2Mo0I/7cDzrdBZMEZdSpUoN4j9f4iyiw1Uo8gNnGCv
         JYNvZhi6c8KvmB/yEGOAMc08AF9wpPzK2CNRR7um4ReMIkqMQEQEa2kbXV3JoTC4Tuyq
         xq9w==
X-Gm-Message-State: AOAM5310TAOYj5foTM/eS/fpSsQJFdg1Ewlln0PWEc1EEftZvspew74H
        jzjtJqmaMNXnEBaqACmVZptcfLF3ld3YFgmEdFqy9R0fnR/7sqT8
X-Google-Smtp-Source: ABdhPJyYwBxPZZFNMfZ6eK3qbEHv7r/5IBUDsRkUWrmY0fAIbVrg23GHDeCz0j6nrUS+TJpHNk46L0SMENrXvYa0CB0=
X-Received: by 2002:a05:6402:26c9:: with SMTP id x9mr6736383edd.365.1612422841623;
 Wed, 03 Feb 2021 23:14:01 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 4 Feb 2021 12:43:50 +0530
Message-ID: <CA+G9fYsDsB5WNs5hjQiOY-NH0B8HdzqCyju7Xg1UXi-BvPfj6g@mail.gmail.com>
Subject: [next] Unable to handle kernel NULL pointer dereference at - pc : gpiodevice_release
To:     linux-gpio@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

While running kselftest gpio mockup test case on qualcomm dragonboard 410c
the following kernel crash reported on Linux next tag 20210203.

# selftests: gpio: gpio-mockup.sh
# 1.  Module load tests
# 1.1.  dynamic allocation of gpio
# ./gpio-mockup.sh: line 106: ./gpio-mockup-cdev: No such file or directory
# test failed: line value is 127 when 1 was expected
# GPIO gpio-mockup test FAIL
[  124.539778] Unable to handle kernel NULL pointer dereference at
virtual address 00000000000005a8
[  124.539864] Mem abort info:
[  124.547998]   ESR = 0x96000006
[  124.550188]   EC = 0x25: DABT (current EL), IL = 32 bits
[  124.553473]   SET = 0, FnV = 0
[  124.558926]   EA = 0, S1PTW = 0
[  124.561646] Data abort info:
[  124.564863]   ISV = 0, ISS = 0x00000006
[  124.567933]   CM = 0, WnR = 0
[  124.571507] user pgtable: 4k pages, 48-bit VAs, pgdp=000000008b721000
[  124.574694] [00000000000005a8] pgd=0000000091cd2003,
p4d=0000000091cd2003, pud=00000000917ac003, pmd=0000000000000000
[  124.581396] Internal error: Oops: 96000006 [#1] PREEMPT SMP
[  124.591499] Modules linked in: gpio_mockup(-) snd_soc_hdmi_codec
adv7511 cec rfkill snd_soc_msm8916_analog qcom_spmi_temp_alarm
qcom_pon rtc_pm8xxx msm snd_soc_lpass_apq8016 snd_soc_lpass_cpu
snd_soc_lpass_platform snd_soc_msm8916_digital qcom_camss
videobuf2_dma_sg snd_soc_apq8016_sbc v4l2_fwnode snd_soc_qcom_common
videobuf2_memops videobuf2_v4l2 mdt_loader videobuf2_common
drm_kms_helper qnoc_msm8916 qcom_rng i2c_qcom_cci icc_smd_rpm
crct10dif_ce socinfo rmtfs_mem display_connector drm qrtr ns fuse
[  124.619092] CPU: 0 PID: 5055 Comm: modprobe Not tainted
5.11.0-rc6-next-20210203 #1
[  124.641324] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[  124.648877] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
[  124.655819] pc : gpiodevice_release+0x38/0x80
[  124.661806] lr : device_release+0x3c/0x98
[  124.666058] sp : ffff800013f23b30
[  124.670051] x29: ffff800013f23b30 x28: ffff0000157baf80
[  124.673351] x27: 0000000000000000 x26: 0000000000000000
[  124.678734] x25: 0000000000000045 x24: ffff00000b5d6cd0
[  124.684029] x23: ffff800013f23c88 x22: 0000000000000000
[  124.689324] x21: ffff00000fb5f080 x20: ffff000002334e00
[  124.694619] x19: 0000000000000000 x18: ffff800012dd6a50
[  124.699914] x17: 0000000000000000 x16: 0000000000000000
[  124.705210] x15: 00000000000694e0 x14: 00000000ffffffff
[  124.710512] x13: 0000000000000001 x12: 000000000000e107
[  124.715799] x11: 000000000000e10a x10: ffff800012d34a50
[  124.721096] x9 : ffff80001344a000 x8 : 00000000512c1926
[  124.726391] x7 : 000000000cb44760 x6 : ffff800013f23a40
[  124.731685] x5 : dead000000000100 x4 : dead000000000122
[  124.736981] x3 : ffff800012891000 x2 : 2be62a0e7519e400
[  124.742275] x1 : ffff800010829ad0 x0 : ffff800012a694e0
[  124.747571] Call trace:
[  124.752862]  gpiodevice_release+0x38/0x80
[  124.755035]  device_release+0x3c/0x98
[  124.759201]  kobject_put+0x90/0x220
[  124.762846]  put_device+0x24/0x30
[  124.766145]  gpiochip_remove+0xf4/0x120
[  124.769618]  devm_gpio_chip_release+0x20/0x30
[  124.773263]  devm_action_release+0x20/0x30
[  124.777777]  release_nodes+0x150/0x248
[  124.781771]  devres_release_all+0x3c/0x60
[  124.785503]  device_release_driver_internal+0x128/0x1f0
[  124.789584]  driver_detach+0x5c/0xe8
[  124.794618]  bus_remove_driver+0x64/0x118
[  124.798439]  driver_unregister+0x34/0x60
[  124.802344]  platform_driver_unregister+0x20/0x30
[  124.806339]  gpio_mockup_exit+0x30/0x3d0 [gpio_mockup]
[  124.810939]  __arm64_sys_delete_module+0x1c8/0x2b8
[  124.815973]  el0_svc_common+0x88/0x1b8
[  124.820745]  do_el0_svc+0x38/0x90
[  124.824478]  el0_svc+0x1c/0x28
[  124.827864]  el0_sync_handler+0x8c/0xb0
[  124.830815]  el0_sync+0x13c/0x140
[  124.834555] Code: f2fbd5a4 90011200 91124000 91014000 (f942d663)
[  124.838029] ---[ end trace 15e9a0840604e538 ]---

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

full test log link,
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20210203/testrun/3878290/suite/linux-log-parser/test/check-kernel-oops-2224485/log

metadata:
  git branch: master
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git describe: next-20210203
  kernel-config:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/dragonboard-410c/lkft/linux-next/952/config
  build: http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/dragonboard-410c/lkft/linux-next/952/
vmlinux: http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/dragonboard-410c/lkft/linux-next/952/vmlinux


-- 
Linaro LKFT
https://lkft.linaro.org
