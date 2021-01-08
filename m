Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9DB42EF290
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 13:31:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbhAHMbQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 07:31:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbhAHMbP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jan 2021 07:31:15 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2671EC0612F4
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jan 2021 04:30:35 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id lj6so3572046pjb.0
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jan 2021 04:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ORqLgCPsQPc/91zd4yYTPPpoYYw9p7fUqyXshAGK1VE=;
        b=P+hWie2j05uesBh4AmY2MIiTV9Ul6mPRA1/xEHbAlpJsqIw1R55+xiEKurVqfN8/3T
         Wj0mQ7N7YVnrVa7QblnAbwMztNmENaz+PcJzqgQS/lyVocWXvs6Aame2p8MYY0Bb23tk
         4Rxne+UMrA3gV3Fy6cddUUVqtSlVMlnG7q3ynYNBL0YxxwajWFVwPda1WeRM8PC35s4M
         u2ouByAFcgknsOvb6s13klYug4T+GuUQIYFMvIWlMnzngtBf04riUX3uFWELOXRsgCJL
         5LNvIP8gI89mqhDFLejQ1Pl/bI4Z7mxK/Jcy4dsdl1WxTIUL/B5FV9PX0xe6XU3JrQsp
         hqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ORqLgCPsQPc/91zd4yYTPPpoYYw9p7fUqyXshAGK1VE=;
        b=tC/GpZXE6VJxTN0WMZXp7Zm0xtRYrNC9NLXDr7I76FzET+AyghY5K9CpGok9j851e0
         WLDQtohgSJbwVyY8OXh3gAiJT27CtzdkElaCpbZ8UqSQFKTZI7zAxUZlOLUK7xuT7XI8
         jOjlStwY0jZr5MvjbV6TcRMPGTsUuFxl61fkZw+DUpSPmCxZOOI56eYYPpWbDzSdYr/N
         jTA/4cxojz5M1MK6GVZcgK1cBtXIbI43t673qRr1SaBE6fraVA8FUAPVp9MyfLfQ4HT6
         X/r5TXs45mA7ZpF9ab2BJh0ZYUA4kM5gbQYk33Pl9GBDFNvkbdak600bUcX7fyZoLipt
         1Lkg==
X-Gm-Message-State: AOAM5331sRBDOWMInLQDqACanNLVCDkI0kJL1p5A7tZPNSNgxrHWFnIa
        pDEZUY8V8QfjsDoHIezJIzL9zxa2hIgWZPNTfTQ=
X-Google-Smtp-Source: ABdhPJxZebiuSqSxFon3xyJ+9PLNg9idAwyPw3Nj7m4JxDX3/IxLSNMFXcGyd+eLHKkY8Y2duC36ImBV769bmPQJx7E=
X-Received: by 2002:a17:902:e98c:b029:da:cb88:f11d with SMTP id
 f12-20020a170902e98cb02900dacb88f11dmr3602253plb.17.1610109034701; Fri, 08
 Jan 2021 04:30:34 -0800 (PST)
MIME-Version: 1.0
References: <20210107190200.41221-1-andriy.shevchenko@linux.intel.com>
 <20210107190200.41221-4-andriy.shevchenko@linux.intel.com>
 <20210108070722.GX968855@lahna.fi.intel.com> <CAHp75Vcckax+HYH1aYDG0tsgiL_1xXLqRW-8Xjq4+-OhLWXaLA@mail.gmail.com>
In-Reply-To: <CAHp75Vcckax+HYH1aYDG0tsgiL_1xXLqRW-8Xjq4+-OhLWXaLA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 8 Jan 2021 14:31:23 +0200
Message-ID: <CAHp75VcPM0UH6iaCdbakgdaxM7CaJax8-kVLMzYvAeFfRYgdng@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] pinctrl: intel: Convert capability list to features
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 8, 2021 at 2:22 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Jan 8, 2021 at 9:09 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Thu, Jan 07, 2021 at 09:02:00PM +0200, Andy Shevchenko wrote:

...

> I don't see how it could be achieved (offsets can be unordered). If
> there is such an issue it will mean a silicon bug.

Specification says clearly that one register is a must and its value
defines the behaviour.

"The first Capability List register is located at offset 0x004...  and
contains a pointer/address to the next Capability List register. The
first Capability List register is no different than others... except
for its =E2=80=9CCapability Identification=E2=80=9D field is always 0. The =
total
number of Capability List registers... is 1 at the minimum (to
determine if there is any capability)."

So I prefer to stick with my original variant.

--=20
With Best Regards,
Andy Shevchenko
