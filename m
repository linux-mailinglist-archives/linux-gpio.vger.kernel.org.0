Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C46F045B970
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Nov 2021 12:47:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241146AbhKXLuz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Nov 2021 06:50:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240996AbhKXLuy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Nov 2021 06:50:54 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5C94C06173E
        for <linux-gpio@vger.kernel.org>; Wed, 24 Nov 2021 03:47:44 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id l25so8936264eda.11
        for <linux-gpio@vger.kernel.org>; Wed, 24 Nov 2021 03:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lQHkGQMRbwlV2X6v9gZ8r5Fj5KrluPJpcxhCcMkVPsA=;
        b=f1to1KC72xBbiGARC+SE+4GPB1WnRPifDgHoaaUIIAa5QeW5qeGwQh0NT0aQAFqLez
         RqWZErHFUX+57FwCcfyWfl2+lRh2EPK2PzVQLXeQzV9YV6/U4KkHUdjx2Sh5E7Hwt8tt
         bhO2r8xPIXDH8JIhOm2cBuXE58p8FHaErhmQBpTZIQHsaeCh8x3jQxtRNzs1XJ+UHprL
         AMCyVyVXIa+x6YscCgdaOLaKMwfSam67xO/qYv2iLAwCa8VtFdzvZBImCQqY1k5xrVmj
         r0cjQrZNUmwssNd3rz2WLOBeAEd9re64NURK/NSRZkMztkrtP1Bmizbnz3gSdmvA+zuF
         iLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lQHkGQMRbwlV2X6v9gZ8r5Fj5KrluPJpcxhCcMkVPsA=;
        b=vyKvkUtA7WKJbY+Ix3B6DS+VuIjwHXVQwud0c3fCgu8nO3OWU1WSw10sO8LKGmS028
         X0DQGz2DGEv3ZQaC244fAmzyY995/MdBnsxs/xsXszDkR5pETAoTFbOcKDkL5HQY9ilS
         KdogEingyBaCCkJhyf9yChYJ3LHHTk7IMA2sKSx2heMfItXINgndkzrc3ziSWVBzCkLv
         VUgHI93ewxSCFxpTKlSGL0fNp5NX5+bzi0tRcTgYUrAQY1VJjNDCH8QJc/Gp/LRSw2GR
         mTE+ADxmjIzzF9frCWdDdA2Idl5IVLQ2OL9F2lkyx8c7MbhHNzj+7l7h1j0JyUA7g2Od
         w/BQ==
X-Gm-Message-State: AOAM532ska8p4uR6/BJeIvTBCb99JL8v0/emhKki+aLPS+swioeE1hc3
        8JGmrKUArGUPu+8r7/lAuOAqej7yLj2Y2zJbyrDxlHNvZsuiqQ==
X-Google-Smtp-Source: ABdhPJxjrkK9w0QGaOG7YGLxsSY/kyJR0/6HPIGbb9vpEroIK+ub1dtHysZ5pwXH45RvBIRnqsRxbGGLWAKTcr6JlEo=
X-Received: by 2002:a50:ef02:: with SMTP id m2mr23346820eds.172.1637754463129;
 Wed, 24 Nov 2021 03:47:43 -0800 (PST)
MIME-Version: 1.0
References: <20211123164902.35370-1-wsa+renesas@sang-engineering.com> <20211123164902.35370-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211123164902.35370-2-wsa+renesas@sang-engineering.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 24 Nov 2021 12:47:32 +0100
Message-ID: <CAMRc=McG6fn_VX7+OPXUWjX1tYozQPg1eyEz-3fJMx35DiXimg@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] gpio: add sloppy logic analyzer using polling
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-doc <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 23, 2021 at 5:49 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> This is a sloppy logic analyzer using GPIOs. It comes with a script to
> isolate a CPU for polling. While this is definitely not a production
> level analyzer, it can be a helpful first view when remote debugging.
> Read the documentation for details.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Hi Wolfram!

I'm seeing you're using debugfs for this module (both for
configuration as well as control). How about using configfs + sysfs?
I'd argue that debugfs isn't really the right interface for a useful
tool that is this LA.

Bart
