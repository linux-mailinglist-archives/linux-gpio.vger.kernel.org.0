Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16B03304321
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 16:55:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391859AbhAZPy3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 10:54:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404010AbhAZPyT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2021 10:54:19 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7263C061D73
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 07:53:38 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id u4so2448996pjn.4
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 07:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JGFves97Y4UqFqvwbRp19AjZ5Y1LUjyGnD0so591Tnc=;
        b=lzsgzsSv+BgNSerqS1Obm8k6XZ0W3ljQfc8VbGdmB23nigRwan+IhqR1bmorC8myuL
         XNWkc8OVyGMgJNwUu0ITE5iwfkiKshBHJqtjjfsjSMxtcCI/3cdufil0K0bcSTa2vOFx
         6I4DjaKHO3tai2F8lJX1sUl585QsNYFn++11UbjoBGrd9Kxwdg59uspX0xtJZVifsMyD
         bFrB8YkOqMGWpD/Ukp0ExVdvGAkBrneZg1wHtR1TX9TiiG47ufjf9sqY5VLhT27qqMCE
         GoVZHXxTZWuguDPn6VsAiMkvZ2w4SqYEaaDkDtL1Vq0XhgMz+1vIFPz7bCeTlMBEp1Qj
         SIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JGFves97Y4UqFqvwbRp19AjZ5Y1LUjyGnD0so591Tnc=;
        b=XV8Gk3N+4dj8sficcZU+iFaBjDkQWrDVZDn3vvIm31OOS2nGAxXFrsCPvOG4YQ0X8B
         hdqjVuHAXCZhTFawTN3+LDeYoHF8wLUYqT8j8a9SG5SxK1+lucTCwxpjzkD6cNR2gTC2
         cA9dqcMiD1HBu09/ZB8MGhtj2A/SRw4aDt+/gvVgvpD6Z/5aP+BfCdoK0HWwEbo/yUzn
         zTSXovpGwVDsysxdLVMsHFkZNqFYCvc0tj3ldW9OOw4akEJb6YSB6xfqo4NnWEwb+b2s
         WJcBKklPEeZIhuuYrlohwXJgKodHsiVzfOWPgBBra5kteg711GHRtI4jDLIH7UxG8Hb1
         MfyA==
X-Gm-Message-State: AOAM530AisBAKv4i0hSZ+naqTM2V2re6Ps7sgRR69lGAAsoZ209G1OEe
        woKUhp5JPkLT4AdRSHtp9hjD9lSRxnkuh1S87to=
X-Google-Smtp-Source: ABdhPJzhVVcjT8opMicIUJ2sLwz99x1YMySlDKP6vT/ItXQlcy8+keNKMONA9Nc0VnnPHKdD5i2a32RqJx5s3vq7XEc=
X-Received: by 2002:a17:90a:ca98:: with SMTP id y24mr408781pjt.181.1611676418418;
 Tue, 26 Jan 2021 07:53:38 -0800 (PST)
MIME-Version: 1.0
References: <YBAd2HT9LFIugxEo@black.fi.intel.com> <CACRpkdb149uAwygJHEvwnjMPp=zXNTGTuf0HziE47CHXAGrQew@mail.gmail.com>
In-Reply-To: <CACRpkdb149uAwygJHEvwnjMPp=zXNTGTuf0HziE47CHXAGrQew@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 26 Jan 2021 17:54:27 +0200
Message-ID: <CAHp75Vd-_FnA+-f7+BDS3zV2kEaAGCb32A3Si02FnLDXuG=AoQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.12-1
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 26, 2021 at 4:38 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Jan 26, 2021 at 2:49 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>
> > The following changes since commit e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62:
> >
> >   Linux 5.11-rc2 (2021-01-03 15:55:30 -0800)
> >
> > are available in the Git repository at:
> >
> >   git@gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.12-1
> >
> > for you to fetch changes up to 0e793a4e283487378e9a5b7db37bc1781bc72fd7:
> >
> >   pinctrl: tigerlake: Add Alder Lake-P ACPI ID (2021-01-08 16:04:50 +0200)
>
> Thanks Andy, I merged in v5.11-rc2 and then pulled this on top!

JFYI: when you merge a branch that has been based on newer rc you
don't need to merge that rc first.
But it's up to you, of course.

-- 
With Best Regards,
Andy Shevchenko
