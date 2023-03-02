Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D4BA6A852C
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Mar 2023 16:33:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjCBPdW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Mar 2023 10:33:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbjCBPcy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Mar 2023 10:32:54 -0500
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A62BC2701
        for <linux-gpio@vger.kernel.org>; Thu,  2 Mar 2023 07:32:52 -0800 (PST)
Received: by mail-ua1-x935.google.com with SMTP id d12so6422309uak.10
        for <linux-gpio@vger.kernel.org>; Thu, 02 Mar 2023 07:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1677771171;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TN2ENs5qanbjBFnTqBA3amGBetlsq+0A+KnRFXFA858=;
        b=yVHykyyxtIvIGOHxW8ffZ+bVoePg5LLpOvkaxsSPfVnYzRaSWsUCjIwiqxlxy9axjo
         QxJYTF53BQ7n5R1YSX4xvZNSiWMDWzJhGB6nUPf53U2+NNvI0IBg+QPvmZQjn4doj0fN
         73/LgSh0llj7+XBYKQBr5Z64f9khFtbNDJ0BYz7yV7e1PiZmNO1bdc3xAK6fk6n7gAqy
         3c+S3V44VpHhpdQqTBobgWDK9DhBIdCY0TA1QELlMXu49Qt0n3zZB7o1RLLeKi2dzYnJ
         1FCShZVH8G9cURsDuhwBQw8czc54kPFqUgW5+rspD4RIE37OkzEXh3SJ671wbahH1XfX
         8+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677771171;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TN2ENs5qanbjBFnTqBA3amGBetlsq+0A+KnRFXFA858=;
        b=f4czpYQ+syynhiwD1QTtgwAgn7FWmPuVyJIUU5rS0S2kn/PcHECQbcICgKg4OLnBR9
         NU1qDKWE1JnHs9EfsROiRgIs2lG7mg6Fci8lGdQm9Y0x3h5Zq+F9rYXSLi8431xetnFS
         eK5JONeWc/j4a9xxLBGJfKwhkX5Zhpc/zv6mSTJvhaFDCRn6/LRAMZ2mt83Myxr+vlH6
         24xU1lvU1wrCPMnZt9oRmm54EKDYftzx7nkFmRzwkIW6DjbpMwvVQa7ZxZCVhxetfBD4
         uH4uS7zp32AphfmQ81tuwaadOLvfb56dfj9nnR5XlYB3ZYT7hXRNrjazEQp1afUvozjT
         eRkw==
X-Gm-Message-State: AO0yUKXgEH2lUutm8cgEwCMgzxAj554b2rFmLQTaHpdk1pFWF0LVVlNa
        UfUzg0M/7MChQ0lAIhRIRzlcuDk5yIyg0GQyWQl3Gvl04+HYjltV
X-Google-Smtp-Source: AK7set9LvYuPZvzhpzwqz7Yn5UTytGtB/AZQPP+Duyi35N9MX5FM/4RmlStpiyjVaDrp/5f1l3UR8DhdZWzWTeOD/HA=
X-Received: by 2002:a1f:e701:0:b0:406:55ae:5d93 with SMTP id
 e1-20020a1fe701000000b0040655ae5d93mr5982793vkh.1.1677771171455; Thu, 02 Mar
 2023 07:32:51 -0800 (PST)
MIME-Version: 1.0
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 2 Mar 2023 16:32:39 +0100
Message-ID: <CAMRc=Mc_QzqGPcrqCT-aDSYV3ggeDosxu=0bcutVkqC7P8wU2Q@mail.gmail.com>
Subject: [ANNOUNCE] libgpiod v2.0 released
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ferry Toth <fntoth@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Drew Fustini <dfustini@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This has taken a long time but libgpiod v2.0 is finally out!

Just a couple small bug fixes since rc3 so I decided it's time to
officially get the new major version released. Once this version gets
more exposure I expect more bugs to be uncovered but that's just a
fact of life.

As I've said before many times: a big thank you goes out to everyone
who contributed code, testing and reviews, especially Kent, Viresh,
Andy and Linus.

The tarball and git tree are in their usual places[1][2].

Bart

[1] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
[2] git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git
