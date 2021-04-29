Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E198E36ECDB
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Apr 2021 16:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240689AbhD2O7U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Apr 2021 10:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240602AbhD2O7N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Apr 2021 10:59:13 -0400
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BB80C06138B;
        Thu, 29 Apr 2021 07:58:25 -0700 (PDT)
Received: from zn.tnic (p200300ec2f0a4f00261a50588b71a803.dip0.t-ipconnect.de [IPv6:2003:ec:2f0a:4f00:261a:5058:8b71:a803])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5864C1EC03E4;
        Thu, 29 Apr 2021 16:58:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1619708303;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=UOMzazNCqY0ZYhxDicYo52FwGKwZCLG/iQJdgVevypg=;
        b=LVq7RaEVIeIhg6rv8l+6bepN2dcJmR8xZFoFpWpBpZBN7eLogDxqowowHS0CR+rHVOLuME
        AC7FMCE+ug+vPISc1mG6CbHlzWvevGZWosIpq1aivq4DP4b1VFa/gVtLOAbBvnZWn8FvZi
        ohv4IY1sqThCV4hHclQNc9yqNCOkCys=
Date:   Thu, 29 Apr 2021 16:58:20 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Coiby Xu <coiby.xu@gmail.com>, Ken Xue <Ken.Xue@amd.com>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Daniel Drake <drake@endlessm.com>,
        vectorflaredesigns@gmail.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [Bug 212379] AMD GPIO chip IRQs stops working (ELN4690,
 WCOM51C7, BMA250E)
Message-ID: <YIrJjDggcPs5cRmA@zn.tnic>
References: <bug-212379-6385@https.bugzilla.kernel.org/>
 <bug-212379-6385-VMOjMpWM97@https.bugzilla.kernel.org/>
 <YIc40YXZh4plkhnc@zn.tnic>
 <CAHp75VfYKcYjiafFRmb8nBLeJ3VOs0wu6OxhysE31UStQNroiw@mail.gmail.com>
 <CAHp75VfMfghCWo_47FhtUGU_qt+Jzaz1kqY4+=oZgbzazyfPUA@mail.gmail.com>
 <CACRpkdbT-GD=45ViysGpNSXWN+i9QA9=J8zgtPDkxCRyLKxm3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACRpkdbT-GD=45ViysGpNSXWN+i9QA9=J8zgtPDkxCRyLKxm3g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 29, 2021 at 04:31:18PM +0200, Linus Walleij wrote:
> I have no clue, someone with deeper understanding of AMDs bridges
> and stuff need to look at this. Since it dies after a while I would
> suspect power management by the BIOS. (Off the top of my head.)
> SInce I guess these systems use BIOS ACPI for all PM.
> 
> If someone from AMD could pick up this bug, that would be great.

Thanks for looking. I have it on a good authority that something like
that is happening now.

:-)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
