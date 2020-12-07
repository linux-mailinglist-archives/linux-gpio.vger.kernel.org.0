Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 011FB2D1831
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 19:09:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbgLGSHy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 13:07:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbgLGSHy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 13:07:54 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6847FC061749
        for <linux-gpio@vger.kernel.org>; Mon,  7 Dec 2020 10:07:14 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id hk16so50170pjb.4
        for <linux-gpio@vger.kernel.org>; Mon, 07 Dec 2020 10:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zCNNBS3csor3coTLP3Ao5O1+FY7G9OIB3P3+OVMQuks=;
        b=UGKT983pI4fOHbP77MPPFOr1hyKiMWUA5O/pIhCXGDCMKcs81PygjKdPtSFGie4Hro
         61geRe5Wkf6X3NUHm/lMPP55Bzq+0IvKXKNorBsMFhP0J10fXU8waKRot3w0lxbAe0LF
         lMvkn1LZUl9SOFh22ybHoWVG9FDF7h1Q/0zwGWtmwjOmD9p4YgyG7sIcl0g532EaR792
         nxmNspxujrf4pMsAjpgpLzoUhyY7KXwsu1d5kxxqwLvbm8gssksPnbikealtc/L8ejE/
         VTzBvZa1mG7qorC80zUUJG4tdMQ0jrqBFDY1YF1dKViL9mQbliaDCD2ORR57FNMvJaFN
         XahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zCNNBS3csor3coTLP3Ao5O1+FY7G9OIB3P3+OVMQuks=;
        b=hlCcPE5PMeEi46OJshIHa+zNKwokpR8DQc7wbl/XQyyj21iIRwMwUUvmJDBle+Gh3Y
         b0AA6rg2duv2bswcbW+GuPfxHjiGQmhJt0pJucl29U4GrCM7h7qLftPsi9PB1DCnJZsH
         s8iWYUg0d4Iv8sfnguHCfcz5IjTLkaUjdf8Z5jmWSe+6sGTLIZM1XCM4IqIO+tlXXUIU
         YgBCm7bcb3nWc4Tt+9ueROKbNtooWCOh0D5NQfAp7VypOVHzgUw/jel6YHtlTci82Sxi
         7mXOEaC/LzuV0Js3MCjYoPnpfMAN1tCbAtWynG3H5b/3RmlcIuK6AooptIfaUyDNP0Ul
         5YFg==
X-Gm-Message-State: AOAM531uff2AwPOI+o4Xu3w2QXhtazvek5BN7wz7NBkp5zTvB6uqeb4w
        cg0egYFITOXeyc6h56UWedrp4RayBCWLtPCDfGI=
X-Google-Smtp-Source: ABdhPJyhaxXZQgVxzeDyXCeMSAy3DhehoSLloSXLQuF+ryjJ8j+4iKnNWZJnsIIA2t/N/KOC0cj9B+IyhZEhtFtKENU=
X-Received: by 2002:a17:90a:c592:: with SMTP id l18mr34222pjt.228.1607364433887;
 Mon, 07 Dec 2020 10:07:13 -0800 (PST)
MIME-Version: 1.0
References: <20201207175940.10631-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20201207175940.10631-1-andriy.shevchenko@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 7 Dec 2020 20:08:02 +0200
Message-ID: <CAHp75VeHz3CAZMQgQsU+WdDyjS+woMTyeOWYDzARePq1aaa=Og@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: intel: Actually disable Tx and Rx buffers on
 GPIO request
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 7, 2020 at 8:02 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Mistakenly the buffers (input and output) become together enabled for a little
> period of time during GPIO request. This is problematic, because instead of
> initial motive to disable them in the commit af7e3eeb84e2
> ("pinctrl: intel: Disable input and output buffer when switching to GPIO"),
> the driven value on the pin, which might be used as an IRQ line, brings
> firmware of some touch pads in an awkward state that needs a full power off
> to recover. Fix this by, as stated in a culprit commit, disabling the buffers.

Linus, since we are at rc7 I'm not going to send a PR for this single
fix (I truly do not expect anything to come). Please, proceed as usual
(either to v5.10 or to v5.11 cycle, there is not much difference b/c
culptin is sitting in v5.9).

-- 
With Best Regards,
Andy Shevchenko
