Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D902646E0E7
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Dec 2021 03:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbhLICio (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Dec 2021 21:38:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbhLICio (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Dec 2021 21:38:44 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C8F5C0617A1
        for <linux-gpio@vger.kernel.org>; Wed,  8 Dec 2021 18:35:11 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id m6so6826673oim.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Dec 2021 18:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QkYYBxG7+xkJfoeCkvBx0tM2ZRRAe/vl6ALDFgfyHAg=;
        b=FIQ65O1yjezrQmg7r9mJ/s8Kxh8W71rtG3CkJcCiqvQUC/lnYquUjO3rqGmmhLMoK4
         Xdozh0OShZPkaLTBTR4twiGTKFUWVaNhbDZJ/+2lEWrGEQmQbL+9+0+cavqr5BU/WjGJ
         zxmK1yqMPDC57eM89TfLh1l5euq1GkWyDnEIhGMwcszzUSaIk0tnaz8asW6Yi9ApSK/m
         dFj2OxApmTguKrL8Grp4TwU0BtCklaziaxqCqpUky4wHMaGnlM9IBrUNrE+8bJ4i+kH0
         qg7iRt12iReld3M7cRUON0C2g3UUXSeLlzcPzpLhVLPWkv7s+xVSioPYDN5GtnXc4/7b
         LDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QkYYBxG7+xkJfoeCkvBx0tM2ZRRAe/vl6ALDFgfyHAg=;
        b=Zk8BmQBO9v4GyrmlmXVUOelKwDOP/Hg+/z8uBeUDcPCX3A+ll2nVW3TsJ4GfurE73p
         ZWM58li+1AK6EAXJ+8989frXp3iGP81FQkiIM3IBpBTrWsvTKkHX3tqOhUNvMndyipxQ
         e+rU8aOOp2z2tG9ZV+euQ4zBK3sYCUSfHq4bHtJbC6QA8iWOcbk7VDOCXLFSlI1aVAyA
         mg8xnx3eTCs+3wrA0RtNoJprm5cYrPbT8opLE4rjhqrrk1sX/F9rwIyojSlNjafXnWqr
         a35dW3K3nr3oteTIkDMQQNYsaKYSRe4esP+WDqsfMvOBmKgQIAPnHXfg+9L8V+ZdaTLK
         9WAw==
X-Gm-Message-State: AOAM530Wnd0jwdfRSGDXrzoQGaE4FKEHTYHZRSfkoEQ9AHYggO/ge4Q0
        dMfeVfQ2JB2cG15t9+dYCWcDTMeqgJCksTh94WI2rw==
X-Google-Smtp-Source: ABdhPJzFSQeklOMErFeLeaff/3FgFFHy71R372ruyJJz77X4iahE6mksIOiCRzCSA9lDUer7hWhqZ2tSP9rHAnYpR/Q=
X-Received: by 2002:a05:6808:60e:: with SMTP id y14mr3214046oih.162.1639017310823;
 Wed, 08 Dec 2021 18:35:10 -0800 (PST)
MIME-Version: 1.0
References: <20211208092049.20792-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211208092049.20792-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Dec 2021 03:34:59 +0100
Message-ID: <CACRpkdb2ZnH7gi8TAQ_8hvbaAw=hqBZBjQftPOtyNMLR+c541g@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: Sort Kconfig and Makefile entries alphabetically
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 8, 2021 at 10:20 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Sort Kconfig and Makefile entries alphabetically for better maintenance
> in the future.
>
> While at it fix some style issues, such as wrong indentation.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Nice! I tried to apply it but I was queueing patches from other
unreviewed threads and creating misc problems.
Ideally I'd like a patch close to the merge window,  but if
you rebase this on linux-next (or the "devel" branch in my
tree that I insist on using) I can try to apply it again anyways,
we need to take the hit at some point.

Yours,
Linus Walleij
