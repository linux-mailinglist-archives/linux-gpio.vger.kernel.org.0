Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC80348B73
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 09:24:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbhCYIXp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 04:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbhCYIXa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Mar 2021 04:23:30 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B499C06174A
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 01:23:30 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id u9so1982745ljd.11
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 01:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ce7LpCeUk4u/Lr/myV2Vh63PxnUfhw6GN4OhmfXRnzg=;
        b=zsV+lebHjyipfGaat1TqNPhmWClDlhZUwCs4Kyo2ie0Lh9GV1CEGE7Ug5oRYTnq4/i
         s+q5TcwmYim9J01dh4mweEl0ockmTBmP81EpvHYnTh7g3DIIQZvAih3NjUK8IVLQnlxi
         v0tEtjEmp/p56xo16QWRt+cImgx8P0SdI4nu4nub7ASPULQJFLkpFVmaIPsWgDjgpGWd
         uEHqb8NYlOGa6h+eItRRRBOj3b5pvlt/3Pj/PhNw4vd4K8Gud/9VpqfU7q/gr/cRCpGW
         jrvh/wX337NEaBiYZEduO+02jXhtmksSL49EVf7CdnvU3wOAwTvBv6fNU0YJjTKKfVE4
         N9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ce7LpCeUk4u/Lr/myV2Vh63PxnUfhw6GN4OhmfXRnzg=;
        b=jU2wjXq0yWV2hPtE52lifH9CTbgFYX45mIShtR2yrOWyWb4g+6MHiT+OeBYatEnWA3
         10VB1mj/lcKUx9rI13ZZj0+HRhXE9txicgdjF2h2woDd0/CFgFBC2GUmiDlsvmLEWiP4
         VP3XxKiGZ/lcUoowx9Szmbe98gLEiN+gKhk73wLNoSwL6JVj5tDDQlxh+x3gAZqYc+q/
         3XoW8IX+b7PSG4Mi19XrzqJbUdMMChM9RHD4ipPJBjf1cvSSBkyVW9MR4GuzpabgCLok
         EKu23E6XFvwyVMhLibMZOULw5MoY9xXBTPMLWg7+ge7PEIQFGDp5AyVDgMO+P6+4zEp1
         hdHA==
X-Gm-Message-State: AOAM531KtTJ3vBpQocGJZIVn+ara9ovR0x0s7tDIXbWammhzqiqd4YSQ
        umls8X5aQlWBQLFuf0JMdBsp+/DDQ8PKGH/iYr8sYw==
X-Google-Smtp-Source: ABdhPJzY1ZX+lRbLqPgIjbf2RUgpvgYiGJFSxmNxdtke3ygR3XHgb3Bl8QP0hPP88rGdtwlxyPrfVhPYJ5Ab+s8KD80=
X-Received: by 2002:a2e:7001:: with SMTP id l1mr4759522ljc.200.1616660608748;
 Thu, 25 Mar 2021 01:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <77f71974-541e-7e06-d37d-c52b9623ed25@pignat.org>
 <CACRpkdbfOFCWQsytnf0f2ZvBsvHqQ85nk-aKK-zXpr8F=uJ3UQ@mail.gmail.com>
 <20170222210420.GA15290@sophia> <b1834c0a-52bb-56a4-5c52-dbf7a5a02dec@pignat.org>
In-Reply-To: <b1834c0a-52bb-56a4-5c52-dbf7a5a02dec@pignat.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Mar 2021 09:23:17 +0100
Message-ID: <CACRpkdZpCAGTfmn51rfUO-uhmrZB-nK8Ni_R8=wHiLikEBNsxA@mail.gmail.com>
Subject: Re: [PATCH,v2 0/1] gpio: add NCT5104D gpio driver
To:     Marc Pignat <marc@pignat.org>
Cc:     William Breathitt Gray <vilhelm.gray@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alexandre Courbot <gnurou@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 28, 2017 at 9:14 AM Marc Pignat <marc@pignat.org> wrote:
> On 02/22/2017 10:04 PM, William Breathitt Gray wrote:
> > On Wed, Feb 22, 2017 at 03:52:05PM +0100, Linus Walleij wrote:
> >> On Thu, Feb 9, 2017 at 11:54 AM, Marc Pignat <marc@pignat.org> wrote:

> >> I'm not thrilled by this "plug-and-play" that seems very far from autodetection.
>
> Sure ISA driver seems a little more clean, but it seems recent kernel are
> not compiled with CONFIG_ISA_BUS_API.

Has this changed these days so we can get this driver in using
the proper ISA abstractions?

Yours,
Linus Walleij
