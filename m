Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C02F73A3DE2
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jun 2021 10:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbhFKISk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Jun 2021 04:18:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbhFKISk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Jun 2021 04:18:40 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF07C061574;
        Fri, 11 Jun 2021 01:16:42 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id u126so3822996pfu.13;
        Fri, 11 Jun 2021 01:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PFR8AuQHQsbnzrn33G4nv3dLkIOq0sllA+ykdCrQd+s=;
        b=I/Q0N8BBx9S2F37ivxZNt43LtMjsiTOmrrUEuZfUZUkEkFS8fNCMXiOmus2F4EJPAf
         NNe/6aexX3gAp+kqBbUQxLNlSPqH0QVEvqZJmWSVKm9Z1H3CcD4lErFHNv4qq9krGKRw
         2nB1Mzgccsby3TUqLXQGfUzIekCfFZc9TDaYyP/3GehufNfnucSuJg7VM18n6PCNUvqM
         93ZtMYSnRQTxQ/xxiU9pS/+WZHRQqyRmnyYpoHDhl5lFx4gV1zXbFoo679otzV8e7B2W
         gH44HdJYSCE0jybvsgDFS5BWq1t6/q9mbiyRPhgiYqSM4I9qYn+pk83nYBvElLW2Zmxq
         7OAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PFR8AuQHQsbnzrn33G4nv3dLkIOq0sllA+ykdCrQd+s=;
        b=UBI+qvMxWLGl32z7AmAUTzUglVJmcCKrbMv2Vm2sTj/4X1dOQTNZu5O2++B4oCtHzw
         j/F5sYNGnQsI0oiko9fmcnxWtcfcvNTmpt8lwrPFMcrjQN+DDJk0VtV9NEXIBRfk7CWg
         C588vtETcypeuMHF5DUDdazqeAuNoNm4aSsT86zeSCTIR/vmvCPFHMEkopwWGpB88RTi
         NohjXAv68SCF6e3+ydnccDlV6w95PBve2/GgWhCTkPR0D2kKKZhpjVJrMskR1wRYWj/O
         ah44MU8Um5xkY98eQDuApUz/P2WzWM4ZjXnQhe4cZ6e6ypG+4HJ5kr+/F7xrRZ5LkTUN
         u59Q==
X-Gm-Message-State: AOAM530OlcjV+AQh5K3YLSPSy8ql4RkxjX1CDkkVJJ1I+gmwrL0WxjTQ
        b0NjSJwONp37r9u+P240YbMLrGCGnLWC1TO+S8U=
X-Google-Smtp-Source: ABdhPJyJVGdx/B7Ctu36XK1fijXzp08Dzxqx8qxyA5XG7NBmL6V/cqnzsdWdwxXYWkJPdpKIy+FxL4/cKwBOuGvuceU=
X-Received: by 2002:a63:4145:: with SMTP id o66mr2480681pga.4.1623399400315;
 Fri, 11 Jun 2021 01:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210610152823.1653-1-andriy.shevchenko@linux.intel.com> <YMMWU1ZMqGoCKOoj@lahna>
In-Reply-To: <YMMWU1ZMqGoCKOoj@lahna>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 11 Jun 2021 11:16:23 +0300
Message-ID: <CAHp75Vf6J8kD9-_ComWeyGks9t507ETPtfQYYLPZikciAir-0w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: Check against matching data
 instead of ACPI companion
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Henning Schild <henning.schild@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 11, 2021 at 10:53 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Thu, Jun 10, 2021 at 06:28:23PM +0300, Andy Shevchenko wrote:
> > In some cases we may get a platform device that has ACPI companion
> > which is different to the pin control described in the ACPI tables.
> > This is primarily happens when device is instantiated by board file.
>
> Can you point which board file in the mainline kernel has this issue? If
> not then I don't think it makes sense to add code like this.

To my knowledge we don't have such enumeration in the upstream (but it
may be done by third parties against any of our controllers enumerated
by UID, like Broxton or Gemini Lake).

That said, I still think that this is the right thing to do
independently, because logic currently is broken (we have tons of the
examples in the kernel where matching data is in use along with
platform supplied variants and there we check for matching data
first). Anyway, the proper use of this patch can be in the part of the
series which actually enables that kind of enumeration in the
upstream.

In any case I suppose Henning can test this for his purposes.

-- 
With Best Regards,
Andy Shevchenko
