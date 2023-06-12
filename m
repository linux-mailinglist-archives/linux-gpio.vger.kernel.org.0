Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B75172C909
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 16:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238309AbjFLO5B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 10:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237856AbjFLO47 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 10:56:59 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA29F98
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 07:56:57 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-30c2bd52f82so4395807f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 07:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686581816; x=1689173816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=va56BiE0F3ivqZV0vOZRpE7QfX+bMwOwCjTSMCjnxMw=;
        b=vsFsvU5N+4ablzTWIJok4r+WhOfH4iuFOOsxSxSDksaY9jylQsSwFagZnqE3NV6Ltz
         ND+ojvQMX3h3eE/fXEP5O8qvuSPzc/qh28qFzvUswz0+5+s9SxlqcOxdTE0S5W3fWnKB
         WcQxU9+4QGScA8kC+caG5mEGvVWUGWVvePbzamdH+EafI+KTmLru793e9d6cGQPe/YvQ
         DutFepxM7pjg6Br9uuTv+BKzrsMoHo5j1L1dG6rcieOHLpRi75YXmc+w7mzMpJcYDs+T
         HI3oHc/U4413JUDb/qNdypwOwvt3R1Jc9TtOUTF/LbNKK9xag0TldCqUB41tE9Z26CId
         dz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686581816; x=1689173816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=va56BiE0F3ivqZV0vOZRpE7QfX+bMwOwCjTSMCjnxMw=;
        b=l4Tc1u3dtYkBkNZdaSIg0EhJbCR61TLSJqy3w7xp84fTWoCbr2iK9cmkrdxfKLksxT
         pGMFi7eGkYr1DHiC6Se4NZIvoizFO8yeZL7TsnD9YNhG4x/6TGOeCnXCvGGfKD5nwi0Y
         OVI/BbQaH7CDgICWN864fKrbsIILv5diBp/oAKiIOKFaFmT1OyNJLxsPX9LWqrrVmfLq
         eoNJOX3znXlHlmcSwokTzPhutB4FnFJgVNYzgX7ULZS18BJEOFJRoiXOC8XVqJGAVn82
         raRh4tf+Shz+eQFzJBycfW0NkJC7sxogB+WCa9d7KUg4KSZRDxiyyoty/elKduVXNqMg
         yaaw==
X-Gm-Message-State: AC+VfDyoxaIEKg1aHmOlUWXeN+PWsywVkb1Rp5C/8B/TZIUPiY3h9nge
        aSzTpz0caTK/fpjSJPgt5OhRvg==
X-Google-Smtp-Source: ACHHUZ6tIzjcFg9lPLOEqni2U4HZw1sTkIijuOy+h3B0FOPZzp6xyI7VffJXiQU6t1qghJY7k+Vr0Q==
X-Received: by 2002:adf:e8d2:0:b0:306:26d1:230a with SMTP id k18-20020adfe8d2000000b0030626d1230amr5405151wrn.65.1686581816112;
        Mon, 12 Jun 2023 07:56:56 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a222:bbe9:c688:33ae])
        by smtp.gmail.com with ESMTPSA id p4-20020a5d48c4000000b0030903d44dbcsm12653262wrs.33.2023.06.12.07.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 07:56:55 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 0/2] bindings: cxx: fix potential glitch in gpiosetcxx
Date:   Mon, 12 Jun 2023 16:56:51 +0200
Message-Id: <20230612145653.138615-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Kent,

This is an alternative approach to the problem you raised with your gpioset
patches. It adds a new helper method that allows to set all output values at
request-time using the line_config's set_output_values() method.

Please take a look and let me know what you think.

Bart

Bartosz Golaszewski (2):
  bindings: cxx: provide request_builder::set_output_values()
  bindings: cxx: examples: fix potential glitch in gpiosetcxx

 bindings/cxx/examples/gpiosetcxx.cpp      | 3 +--
 bindings/cxx/gpiodcxx/request-builder.hpp | 8 ++++++++
 bindings/cxx/request-builder.cpp          | 8 ++++++++
 3 files changed, 17 insertions(+), 2 deletions(-)

-- 
2.39.2

