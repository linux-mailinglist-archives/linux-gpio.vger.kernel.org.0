Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0431ABE0A
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 12:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505076AbgDPKgW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 06:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505173AbgDPKgM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Apr 2020 06:36:12 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC219C061A0C
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 03:36:11 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id q19so7214047ljp.9
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 03:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HQu300lUTOiTvpUJiIxEhKHUf2GTuAXWynFlZc+n7uw=;
        b=oC99QlH5V7Mq+tevXx7T4yLRDAjfp1yUAH3klLye3RF3rK2BLGY0OxNQc6Dsdz8UUQ
         MQAIiJ31+OhVsAtPqTz56wL48YxnC71rwCuUJ6Ga74dypo4dQXhGd4d5z/5jBbaRrvap
         35oIuo6yWt3wGEofo4YyHdNXsB2jV/uQIeY6ke2QjCSNrUb6TwZz3Qi9ai9Zam4tqzS8
         ZPebjPFnTBZM/+Z4ZCoevBjqgXStnDTbEoGxaP/Rm7wX3JwhbXc2pidfSTG+i67W/CS1
         +E39bRDid0UMPia8tcLrUrhxT7g5SfOKsYFXraxFaK6UoDaiXEFOo3IJjLcGmfJVs19n
         8KmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HQu300lUTOiTvpUJiIxEhKHUf2GTuAXWynFlZc+n7uw=;
        b=Z+Qq8Pq/rHqK+KMfoeSlMBQIfT50Mc448BYjYS5FWQJdxmw32uQflJ/x9+tZrMGkAm
         SFAZht4QfC4bD0WaxU2s+ydtpOnjfjqH6Dq2W78wdRu7tf3KkPIqr+0cZ+X/p39yTV/I
         Q0OYPTUIOFWWOf1pbhumJi+YIvsmizdmoDBO4jGqLRGa1Ti4AHSzirOh163V/4YGK6zM
         jSnJH3/B27j2/NfLgm9aaCGSmJwX5qh7HMv+aB6gtOyLKu7hoBwYSv5NI/FNfbrsCyPX
         +UpIILS9OP4MfUHpvCNpQ413R6qusjW+3eDPRB0Ry/FWjV/62SMMOyBoJA3NAdoLU9R5
         otew==
X-Gm-Message-State: AGi0PuZn7z24CtAmwusXiotmPY25EzBWSJ71UL77LXW/08MMCuXGOUFh
        XR1gmh4XW8t9coJkTE58HT/B+LuqJDpQ+W+Vd+SzjH32
X-Google-Smtp-Source: APiQypJ5zT5ApQmsgDMKRg4tfu0hHp6hblmlqwXZk9HJkob2nxscoxvuWaclwOU8WINGiLDL7umdGVs+BlcIuQjQ//M=
X-Received: by 2002:a05:651c:32e:: with SMTP id b14mr1150046ljp.277.1587033370127;
 Thu, 16 Apr 2020 03:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 12:35:59 +0200
Message-ID: <CACRpkdY6_EChELrKGtcvsBvDqEQ9QD1=+PWWZuyBZV_CpLvUyA@mail.gmail.com>
Subject: Re: [PATCH v1 1/9] pinctrl: mcp23s08: Get rid of legacy platform data
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 7, 2020 at 7:38 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Platform data is a legacy interface to supply device properties
> to the driver. In this case we even don't have in-kernel users
> for it. Just remove it for good.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

All 9 patches applied.

Thanks!
Linus Walleij
