Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0D21604848
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Oct 2022 15:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233721AbiJSNx1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Oct 2022 09:53:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbiJSNw5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Oct 2022 09:52:57 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AE08189C31
        for <linux-gpio@vger.kernel.org>; Wed, 19 Oct 2022 06:36:20 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id b4so29127542wrs.1
        for <linux-gpio@vger.kernel.org>; Wed, 19 Oct 2022 06:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1xeT1iLxWmll2HFnvRdJc4BDec5ldnrZaxMiO5DTNCE=;
        b=q42c5u4WQI+XrEymaze9l3yVnZ7SRGt/txMEWq7CXqqBy/e7uxk9ROO3cINa9D636s
         VuoVp6h+ZGDQMQCnLIIXToVmSE9Dk2sHfc3N7BMixH94Pc+EF/MfhUcUiWt75Un+LSs/
         lz76Y8Ek3y5jv6RZuZxc9cFFWYxa7LsBAPvCyxXUurJetuGjp8meR/QoV01cMzxVkbEb
         a7u+BNeWy+y7Tyy3Zma1vbnc0g6SptpFCTzHIrHZeHd87pb31ZHGPPLZZhexjsYP6X10
         g1t3fJvtFsA0psuv3e4cfdl+l0m/LphO/Uw0uWUjEZ4mQSFrGSS9scrHUcn73vujHT6p
         qyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1xeT1iLxWmll2HFnvRdJc4BDec5ldnrZaxMiO5DTNCE=;
        b=qKW5lurrVaZWNEdEKOUmgtUhrWJrClRX7XQCqwY6e+qKmE0F140q0lRJKgTNy5EnHg
         qyBcuYYXfNcypFr3m4sqtWmLuBalhXjyyghFImQogA7OtvqwIiSlGKUA6SJiBUR3C31Q
         Hw5hdfwYSlHC1/kQaQxhSSwGfjB7kT3h14VD+/Yyi3p3yJxEWLUkm5VAFjBvLhE661+3
         5WWi8Ps5jpvcCt4osuDWjAdTfzDYK01SVLOZ6Obk6qYDH+UUxfUdBRAIMYtcI/V2tOXH
         5Ao+jW74OTBlNJUmID3FIgKj0KzYj6Ckk0VweVphjkja487/fCJ8+btHJona7Ceuh4iR
         Cfjw==
X-Gm-Message-State: ACrzQf1+OePT9dtS5tUkIna0ssFbWDm3ay1yKNvb7cnshBoFHYRNqOHt
        Uiu5OQznofFYwcotog2jFdyZJe6X6dBcE7bci7eimYK756gezw==
X-Google-Smtp-Source: AMsMyM4ZLCSXvj95s+I5Xd7tlFDjVR9orZQQgRo/cYNAheFAynKo+utl0lVXigSgQljtaTdnBDPcM9oTE1PnadYF8AM=
X-Received: by 2002:a17:907:7b93:b0:770:1d4f:4de9 with SMTP id
 ne19-20020a1709077b9300b007701d4f4de9mr6791599ejc.201.1666185743528; Wed, 19
 Oct 2022 06:22:23 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 19 Oct 2022 18:52:12 +0530
Message-ID: <CA+G9fYtSwz0ADnHdAt1mFy9DA_JB1+MV3HoOcH_FbSuJObTqsw@mail.gmail.com>
Subject: selftests: gpio: gpio-sim test FAIL - gpio gpiochip2:
 (gpio-sim.0-node0): line cnt 34463 is greater than fast path cnt 512
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        regressions@lists.linux.dev, lkft-triage@lists.linaro.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The selftest gpio gpio-sim.sh started failing from Linux next-20221018 and
also noticed on next-20221019 here is the test log [1] and [2].

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

# selftests: gpio: gpio-sim.sh
# 1. chip_name and dev_name attributes
# 1.1. Chip name is communicated to user
# 1.2. chip_name returns 'none' if the chip is still pending
# 1.3. Device name is communicated to user
# 2. Creating and configuring simulated chips
# 2.1. Default number of lines is 1
# 2.2. Number of lines can be specified
# 2.3. Label can be set
# 2.4. Label can be left empty
# 2.5. Line names can be configured
# 2.6. Line config can remain unused if offset is greater than number of lines
# 2.7. Line configfs directory names are sanitized
# 2.8. Multiple chips can be created
# 2.9. Can't modify settings when chip is live
# 2.10. Can't create line items when chip is live
# 2.11. Probe errors are propagated to user-space
[   74.861454] gpio gpiochip2: (gpio-sim.0-node0): line cnt 34463 is
greater than fast path cnt 512
[   78.907553] audit: type=1334 audit(1651167801.183:10): prog-id=0 op=UNLOAD
[   78.914706] audit: type=1334 audit(1651167801.183:11): prog-id=0 op=UNLOAD
# Probe error was not propagated
# GPIO gpio-sim test FAIL
not ok 2 selftests: gpio: gpio-sim.sh # exit=1


## Build
* kernel: 6.1.0-rc1
* git: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
* git branch: master
* git commit: a72b55bc981b62f7186600d06d1824f1d0612b27
* git describe: next-20221019
* test details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20221019

## Test Regressions (compared to next-20221017)
* bcm2711-rpi-4-b, kselftest-gpio
  - gpio.gpio-sim.sh


[1] https://lkft.validation.linaro.org/scheduler/job/5702400#L1325

Test results comparison link,
[2] https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20221019/testrun/12529653/suite/kselftest-gpio/test/gpio.gpio-sim.sh/history/


--
Linaro LKFT
https://lkft.linaro.org
