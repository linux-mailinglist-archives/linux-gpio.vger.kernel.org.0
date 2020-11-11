Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDE132AFB1D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 23:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725981AbgKKWJh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 17:09:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgKKWJf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 17:09:35 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE83DC0613D1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 14:09:33 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id w4so2349086pgg.13
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 14:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d03dQMWe0vSqP7hc3PlrkEsd8Ckz4T0m9O887PxVMxI=;
        b=DMAITTIVDaFnDSqV2VUzY58cn0cPNm4bmTfRhaFtvs6cg6wSDIojKmeCVa2vloFauw
         a5Amnnbngm9ttatm+xDB77LrGVpJhGscQKzzXGVimMfJ5LEsLlBtlng15dFnHRd7uxr4
         nTct95hISIXg627j0bs1qTwTMBlZWrl7A2RBKEqDpy7+1K6brgNkb4cWX9C4YNz30A5E
         PbwFSrs7HW7LiLpuODdwFLAPBekyLAB/QuSsdqanbdzL4HlAG6Y+kYqqVHXbC5uCnnW3
         pVtgUYUqq9nw0lcshViFSc1hn+hACjp6+vSLLKBZsq8qgr1U79DS+GX2CWUUA04hj2y5
         5oVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d03dQMWe0vSqP7hc3PlrkEsd8Ckz4T0m9O887PxVMxI=;
        b=hr82xLOkkkN98HmQPezcjMhh4WGVTV2IALHE+zCbDs5Sli+qxpuhq/7VAn7FHx7NEM
         3c+Dr9fXDtT0yXRQQ0/CuVqhSuB64z8uz1oUvUaat87OosRC0RQ1cyRms2CyUBOwjmYl
         3SSHJ0dJCoQHdd0+WI8CKJ2I5WP4RxFTzpkhY28e6a5YHOEmU/6q6NWPCLAV6YsA1ro9
         6tZzl+qvv6zgNqPKKTugCcJEv0AyqkvCw8JOBml5DhvHyUU+oA4uemeO56UnSwVcR9NH
         n44hXvk7H9FQf7u8NioDMpqJI4OfsGdn4cDvum9aa2lJ6iETSOE8A+QwMikbO84jV8wO
         8Dwg==
X-Gm-Message-State: AOAM530tXN9UUCaJ67sxbeAnpE2htAFa9XBX7cIpnOQPohNzmgZN3UAl
        0lsVHtJ7ifueNAbJArJEGJqoZ74s+Auec+o0l7+uqXtSt8k=
X-Google-Smtp-Source: ABdhPJw916+XE9KvBDSXRp9jFSFqdwGomnY/G6uVhohXaJUy05xs9JIhLppX4eWtQIiUOUi29DNz2R5XWSvh98E/BGw=
X-Received: by 2002:a63:4511:: with SMTP id s17mr23511331pga.4.1605132573330;
 Wed, 11 Nov 2020 14:09:33 -0800 (PST)
MIME-Version: 1.0
References: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com> <20201111220559.39680-19-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20201111220559.39680-19-andriy.shevchenko@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 12 Nov 2020 00:10:22 +0200
Message-ID: <CAHp75VfNaiL8DJx-yqo948yHMqJZ6kKPeR0crr7rhSp9=6EMNw@mail.gmail.com>
Subject: Re: [PATCH v6 18/18] ARM: Drop ARCH_NR_GPIOS definition
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 12, 2020 at 12:07 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The conditional by the generic header is the same,
> hence drop unnecessary duplication.

This has been sent by mistake, sorry. Please use v1 of this standalone change.

-- 
With Best Regards,
Andy Shevchenko
