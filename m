Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA54354CB09
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jun 2022 16:17:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235127AbiFOORu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jun 2022 10:17:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232345AbiFOORt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jun 2022 10:17:49 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4790D21BF
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 07:17:48 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id l204so20709401ybf.10
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 07:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n27guTSdTHTq2oc6rMlJFQBNHNDb1H+mQO4ONQwQaFY=;
        b=R+CQbYQza+xKZu1MJM5EHdsEUhNqdEepACQIQnBQHUSwNkKuq765d0+jpAS/cT85sC
         hbrrkTX41krBa/nFMPxX1IMjZugnYmakgAhRSibOGxrAAM+cPWlqLNnWbcZ7IZrMrmBM
         wwwq63S9pgFWXHp45aHYj7gyZ+5Ft+VKxmla5L6tGAE47Ip8C1NBeRa8fwTL5YqsWzh8
         Lx5LFnKDa94x5zHN4eU+aPQkc7ntySPzcTKdSlg9zHeKlF8jE4gfCetgJNmq3+skA5cJ
         24jmcjqrWWLCHw9UIA5fbpr1nCPYS7wegHDd5jFxb7/IGjvvfaQUQwKzLSxaS89mmdtC
         jTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n27guTSdTHTq2oc6rMlJFQBNHNDb1H+mQO4ONQwQaFY=;
        b=BimxqQHC9nxPsn3A1qA0P52HHqcrcwCkwg0yTnk/nQYbgMx7FEH6s0HQF8w7Fjy7a4
         n3rjfrXcZfqGht9ev5RTb6V2HJghxhmkCwhhMSSXK4eU+o68SSrhacuYqFRlwaunw53A
         qPxqVJK7PABKXctFWD5TitDnmBPqv0Nb+ftcYkNbYN/J4x5Bq7OurfkVVbb+tJ1zsc00
         +UhKbzEF2XJpCyP8rgrr3eizuTMw4bth0MyAIVYLbVDKJgTKFSE//3ktlrtxZV56OQTW
         eptDUf0/C25TXvC6eq5INqo7FW/mtOu5J25i8hBkYljGcGsWTJPfeSpcpSytcHbLBDuH
         9F6A==
X-Gm-Message-State: AJIora/KOwIBVYUArXPirSFkd9wK9jjk0OshMq70Q6huKsA+wimqUp6t
        1Slrw/f+k9Y1cso7NthWlCud30P2ysMinfDjDb/eYQ==
X-Google-Smtp-Source: AGRyM1ts54qpPRlm3FGvsP+t8KM3iF9VlFkWjcatZrbSL4ty+4gN/lMwbgsGdRoWPANnTqRT83/J/AFS6Locd23cmOk=
X-Received: by 2002:a25:dc0b:0:b0:65d:e5d:a87a with SMTP id
 y11-20020a25dc0b000000b0065d0e5da87amr35151ybe.295.1655302667507; Wed, 15 Jun
 2022 07:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <YqCUSuvCamkqPpMn@smile.fi.intel.com>
In-Reply-To: <YqCUSuvCamkqPpMn@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Jun 2022 16:17:36 +0200
Message-ID: <CACRpkdbPjE+K469EZtxGW5+HAyS-9mJV50H1qR2tm0JtBpcjXQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.19-3
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 8, 2022 at 2:21 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> MAINTAINERS database fix, please pull for v5.19-rcX, i.e. current cycle.

Pulled in for fixes!

Thanks!
Linus Walleij
