Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CA416A1087
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Feb 2023 20:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbjBWTZ2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Feb 2023 14:25:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbjBWTZ1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Feb 2023 14:25:27 -0500
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7096F24CB7
        for <linux-gpio@vger.kernel.org>; Thu, 23 Feb 2023 11:25:14 -0800 (PST)
Received: by mail-vs1-xe36.google.com with SMTP id s1so948134vsk.5
        for <linux-gpio@vger.kernel.org>; Thu, 23 Feb 2023 11:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QFhRtFsskL2CDw0YztHOjWvdZsq6PCpwptiTfN4Lpy4=;
        b=4LTH3G99H80M/W9n7nTXtYqr3Upxb4C4PEwJ21+MwWyAX6OftYV5z8aEupmDPlSWwN
         Avof+n4NKPkYXXueOaW9XjuT3aesQareFem7zdig2cR5WGmiiOknaiE74rmnTIjWN9iZ
         +w5RMjAawke/hjWr8wjfmKLEbiNE7ns2LKJ4OglKxx6HoGlqWofqHnVVIyN01S/tsf1K
         Q9LSTiUsglTGywVtzEgFRSA+R8a/dOM+ccc9ZGG1oVZpQxPW1Nb9gkc+FdUiCzygCxTD
         28jUHa7+gqrYZvHFiwMWGZHtNrLNLG8VsFfx007elVAU7riE+j7yRlDkrVbha8bIiR83
         thpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QFhRtFsskL2CDw0YztHOjWvdZsq6PCpwptiTfN4Lpy4=;
        b=wr9APMwvSj/clhwCWLRDSYy7LlW65LJB34Lapoq2YqPeF/BjyVb3Rn6f9PZBfqI1oW
         ZEIlO0B09ZFiHIDpORDJtLQpe1GbK+PHzfklu2uzvaVA7egEjkHYVhfTZYCA7DBfrFT5
         fA7sTaG8hD59U8zR+23OIs2HIORb7rrtTrfHm9ocdaCUa7Hn0m3CqEpXxvaip+HmGINA
         QuIo2uw+VvMpHubYdjDE+OHtEcA9lkh1GP7DhQuE2sy68Dd3h2Qb6e9XrKgy21eB9h6R
         e0zpVZfiyKJwRbOYyIWFocBVS1wcWxqZmO0YcMHOeg+wNpenoOrZXEwBsDtIrR8HmfSB
         CDuw==
X-Gm-Message-State: AO0yUKVt1SJglcZqcFUdF/rEi8HcN/Q89+STUPHxiWsVgMwbrnZovQl1
        FDcJhfqp86mOCGma/Q2uGtY7Gy7i6O9KnvTAStuYOfsbqf87YLPF
X-Google-Smtp-Source: AK7set+tmD8y1Ie9lJ9oy9VCPnsnEW35MxLPlwROKyoFLW2P4dRLzXC6rbCrKUUIjeNhnmy7RWmtuALiHNC1C79jyLA=
X-Received: by 2002:a1f:45ce:0:b0:406:abf3:80bf with SMTP id
 s197-20020a1f45ce000000b00406abf380bfmr715085vka.1.1677180313217; Thu, 23 Feb
 2023 11:25:13 -0800 (PST)
MIME-Version: 1.0
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 23 Feb 2023 20:25:02 +0100
Message-ID: <CAMRc=Mc+cAPZnxFXPPp0RzhUqFRBYBkf1c9=wTozY15gTyi5aQ@mail.gmail.com>
Subject: [ANNOUNCE] libgpiod v2.0-rc3 released
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ferry Toth <fntoth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I decided to introduce a late change to the C++ bindings - mark all
public types as final since they already don't have virtual
destructors and inheriting from them makes little sense anyway. This
has little impact on the programming interface but I still think it's
worth another RC and I also have a gut feeling that makes me want to
sit down over the weekend and inspect the entire API once more before
carving it in stone for the foreseeable future.

The tarball and git tree are in their usual places[1][2].

Bart

[1] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
[2] git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git
