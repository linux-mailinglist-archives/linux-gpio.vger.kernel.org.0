Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 662F9132381
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 11:25:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727154AbgAGKZZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 05:25:25 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43114 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbgAGKZZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 05:25:25 -0500
Received: by mail-lj1-f195.google.com with SMTP id a13so54126198ljm.10
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 02:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=izkQdpFTUaZ8mivzHGq4ICUrxmuFazGHcwlx1NAdeSc=;
        b=qnJZFP7xmmTFBd6vI+/32Kl5V8BNirWnSab5gFzZceh0IoY+v2Gns93cnzy4CPzYWg
         doaAdXZ1LTsoTH4XmVA0+6hZJPu4DiGtCoR5/oR+SxfT8Qwi6AthJEEfWDvI2xj17OAr
         oVluVMO1xHctozp33EYg1FTeYjsobbPMuLZlDKOHmjVxycPvRiT+/9NkCstUg0k59Ixg
         u6K8QWf4S6s1VdN7Ns3a3xt/HPVv0f95sKkZTk91U8+4UX7dVVB28FyIvzD3xrrn24Tv
         PfiMS5lmbQ03otYuDdM4yS7Rw37XtrfsHgynTQxS3zpLEtSbe79k+FX/FBa1K7SRI8sN
         JhvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=izkQdpFTUaZ8mivzHGq4ICUrxmuFazGHcwlx1NAdeSc=;
        b=Uy+i0e8SfQF4DtteTSnx07rVFfcsIWBlVPf3JYrA3WAv1qIdQCJEhiugY8xRoqPW4q
         1O3z9qpOsX/0Rs2nIli07Tg9O6SkaK5Y6o70PtW6s2ixfqlzbH9w0k6vyMzYDAyk/gr3
         Yu9zge/L/jUaLWGgLzBvN5UU8KBsaGr/UJpzk+r/jM29yEOWMScDhvx/WbVPxgUDNI/j
         EW1k7PUdeq21jBrg0Bmao24pO+VzLM4fKATEfD+riY/Ida242HhwCDYKo9CXDWkyMKRc
         kUB42yanJD6ef4iLnmz6IG0VMW1INpzAOZ3HW2/EvNhEawySVI4i4WIueqbg+bNx3Fo1
         Lk4A==
X-Gm-Message-State: APjAAAXJVQwrtF0JA2atClSN0wPNZPPg4tIEhbp41w0TLm2V62RJFcKy
        33kPNVIiqT9AlmeXRDrUqSixIm7zcVGQSFFlDkM2LQ==
X-Google-Smtp-Source: APXvYqxf447vgBZ6Ekf31Ne3QDBNnbDxra2GBTMOfyXxg/zNohD7uD4phbH7VRO5zCLqP2dAWg+gaYiElNCf9+fF5OI=
X-Received: by 2002:a2e:a0cd:: with SMTP id f13mr25923166ljm.251.1578392723253;
 Tue, 07 Jan 2020 02:25:23 -0800 (PST)
MIME-Version: 1.0
References: <1577362338-28744-1-git-send-email-srinivas.neeli@xilinx.com> <1577362338-28744-2-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1577362338-28744-2-git-send-email-srinivas.neeli@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 11:25:12 +0100
Message-ID: <CACRpkdYTz7hFiU-JfopNBVzfpaYBj86DF1w0=6egdBY2fY8Mzg@mail.gmail.com>
Subject: Re: [PATCH 1/8] gpio: zynq: Fix for bug in zynq_gpio_restore_context API
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 26, 2019 at 1:12 PM Srinivas Neeli
<srinivas.neeli@xilinx.com> wrote:

> From: Swapna Manupati <swapna.manupati@xilinx.com>
>
> This patch writes the inverse value of Interrupt Mask Status
> register into the Interrupt Enable register in
> zynq_gpio_restore_context API to fix the bug.
>
> Fixes: e11de4de28c0 ("gpio: zynq: Add support for suspend resume")
> Signed-off-by: Swapna Manupati <swapna.manupati@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>

Patch applied for fixes.

Yours,
Linus Walleij
