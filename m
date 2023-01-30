Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99178681E5E
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jan 2023 23:47:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbjA3WrY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Jan 2023 17:47:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjA3WrX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2023 17:47:23 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2D5A55B5
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 14:47:22 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id e15so15985399ybn.10
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 14:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+1KuRQoiJNQkwb3b3s3wOLI8t8X6LSZYzujyEQkNFK0=;
        b=YRB6w6WG7oSUma0b71O4n4cAHhHN0/EdkltOYviYbJ7PvtXUR24bYAbX06UiNkri8k
         RtjkLmUpm1VbsfGTLaybRirjdqZ3s0S8rmd0VT7tfc1lrnHkUtRfLBBpPI/pQJKY8j5z
         0rFTYJi+ErgbriWvqxnXN/3w+hqZlsG6mZk8RoZepQY6GD3hA8LjD+t9PazJHEM0B87o
         iDUc8JFpN+MoVIVeGPO9ImGHGp2RRUeRlKKuTNp4oVRrwkrE3PSUl4aOdHiyYUxOMk5E
         4tYiGZGzicnVxiVViGGOiD4er5HVuaXLYkNFGq0IKkRJCQ4gYEN4v9DX23qTrD0vF4d3
         D/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1KuRQoiJNQkwb3b3s3wOLI8t8X6LSZYzujyEQkNFK0=;
        b=ZEbuO88BgfyrzNpDUm51T4TkyLiZci98sNC0E+KyOUGGM5AG22tLZAMAqpDGoo71zF
         h+iS9iq65yfo6ZtjVi+vVrgXUcogIvF5IUWauGRSFXXnbtWWOcb01K99v4x3S9rGTpVK
         XuFGxW9ue3Ox466Cxv2q3Rfu8YvCFsID18tXPcctCKQx39mV/a6C5J8MEx/nKJPXxc6W
         1S/MDUy9kpQPHUXTYNZrfUeK40TkWpo4kkopoZPbw4RwbodPe65fiYV6UXrmtMCRujFx
         uCj4JyKY4hyYtR44QZYt+KTpTVjK9vFsl/afmsUl4n1mpNTrjxMb4En+MRORfX3POHnN
         7V2Q==
X-Gm-Message-State: AO0yUKVFf4APsm/QNJM1+wMHeS+kf2BVoEuf4jJmtWJMy3oL8+rCgHT8
        HVrnSdRZMg+kr6ZM6jItUX7VMTKUe8oQFY8mJb8711pIpS9tYQ==
X-Google-Smtp-Source: AK7set/QHwISgwBr8c2ZGJ46mkuUbWmmKr8KtVbHZTPekB8wJkQeMt5JazphbLutDYRxxoE9eLlHpuD2941PNty2TF0=
X-Received: by 2002:a5b:c1:0:b0:80b:c9d0:c676 with SMTP id d1-20020a5b00c1000000b0080bc9d0c676mr2186297ybp.341.1675118842119;
 Mon, 30 Jan 2023 14:47:22 -0800 (PST)
MIME-Version: 1.0
References: <Y9gJw0zLe3g10WYl@black.fi.intel.com>
In-Reply-To: <Y9gJw0zLe3g10WYl@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 30 Jan 2023 23:47:10 +0100
Message-ID: <CACRpkdZBovzAoZJrJb2sSfa_FZ9x3GTWCcW_woeSbXF16V2rng@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.3-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 30, 2023 at 7:17 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Hi Linux pin control  maintainers,
>
> Here is the bunch of refactoring and cleanups for Intel pin control drivers for
> v6.3 cycle. Has been for a few weeks in Linux Next without any issue reported.
> Please pull for next.

Duly pulled into the pinctrl tree for v6.3, thanks!

Yours,
Linus Walleij
