Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B30D01ADAED
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2020 12:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729213AbgDQKXK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Apr 2020 06:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728905AbgDQKXD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Apr 2020 06:23:03 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CEC9C061A0F
        for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2020 03:23:03 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id j3so1457845ljg.8
        for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2020 03:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9SoAxqx0wV4yZ0UGikmTbn4vHQRbkKq+2OlRZBKv8C4=;
        b=t4YmkWFDZCXwb+ryIVWzCSgXmXd0Db+Pf8Medr2SOrZRnotI0lJS0x5toISt4jF+K+
         CzIg5jjxb6OcGzL7GWkWftNxHTRuDq1sMNst9JK6lPY6Mw25f4axEyrj2VL3HC/xEDk/
         JT2uOtoj+5S0e7bNFWw0go2659MiHihG0jTGKjzsDVJ161oiv4XJ6SNzyOvz03as/MY9
         RW/VJ9EG0iuJ0Rx/9CQaDq8bBbs3a4XzLoZn5IhjekaRupuy0DFRDUbbPCstDi9ZTZus
         FC8wZHj50q361k8NKo5n/1d/Mmv+aPwKOQ0YjUHQKK0xq3CaJyMgZ0Er56YWVXDpeee3
         d+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9SoAxqx0wV4yZ0UGikmTbn4vHQRbkKq+2OlRZBKv8C4=;
        b=GT6FCNUeQhPEuKilQHJRufenmz30GMjtU6hJNIUpIwu8V0KLPcH11MnzPRGTcxHZ0T
         vHQaPzcyzIOZIg7YZXac2YI+vOwkpIsAdstskE8P3X8QrSbWRHIsjV0fpChCssL4uKO3
         MnYYd/ecqmkQ4IrjsKDYFCWdEQIbRBap8imKLGC3PjHBvz09KD6Ox5Al89iVxuXw7GgA
         YW0sR98869LEys5UWMEk/20YQIR2K+ImOXczywRFZBGm9uaovRoYS3fns6p3KN1a3u3S
         jxHUGhj88d1IMSnr1aBQ5sQu0UIO8Bdn/g0GR2EHKLZjjad0QLpu+hW/ySM0sv8GkXSw
         S/7A==
X-Gm-Message-State: AGi0Pubck8aSlvEwFkeLuOdPHoQU/XhK159vdOrIR9mvR30f4EWj0/ug
        cwFHoY1bSLQ+PU7cVWJ3iK4mwB5lTxCHpRojo2AzdVEM
X-Google-Smtp-Source: APiQypJC5+LuoR9lfzOLklye/sLtm5NMNAyhjdFOoiPtogmKVDgo0tnZLxO32XaPTCqCLNoXTvBBHjJBlIYRxhrDugw=
X-Received: by 2002:a05:651c:23b:: with SMTP id z27mr1605999ljn.125.1587118982016;
 Fri, 17 Apr 2020 03:23:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200417145017.3932443d@canb.auug.org.au> <0f828695-71cc-ab94-e0f0-ae63a192b283@infradead.org>
In-Reply-To: <0f828695-71cc-ab94-e0f0-ae63a192b283@infradead.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Apr 2020 12:22:51 +0200
Message-ID: <CACRpkdZ9rKHiszLYAbbhaTCzgMdH1gzRmbsB9G2g4+B=KpdfgA@mail.gmail.com>
Subject: Re: linux-next: Tree for Apr 17 (pinctrl-mcp23s08)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 17, 2020 at 8:16 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> On 4/16/20 9:50 PM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20200416:
> >
>
> on i386:
>
> WARNING: modpost: missing MODULE_LICENSE() in drivers/pinctrl/pinctrl-mcp23s08.o

Thanks, got a patch to fix it too, folded in your reported-by.

Yours,
Linus Walleij
