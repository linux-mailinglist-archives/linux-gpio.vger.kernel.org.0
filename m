Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E583248F9FB
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jan 2022 01:24:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbiAPAYP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 15 Jan 2022 19:24:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbiAPAYP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 15 Jan 2022 19:24:15 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1A96C061574
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 16:24:14 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id t9so17956080oie.12
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 16:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MIpFQ0NWKHK372rOvfeCdj6iTC0QFLwCmnvuB/iqxlA=;
        b=vgfcxaLPoXv0oRKS2JpHt+YiKcG5RSnLUSxbYb67ya9QoOL9XOSL2AgOzt08tuLkFn
         Tjkf+WTIQh2nu2NslRnVDTRFcqWxISGeteUJDxzwxttOoGzORCMEhuT1p/m5qXxEldsK
         siWym5ay4v8tzJTniaRjiixnJxcqpyz4Zc3ylf3yByWuqo/z96ksVH9ta3j7grNWxFNA
         tOvOEsugcozymAUB+JQw4FLbfwxLzKpwAEwTMnzQO2zZdzzfCYDO4OHdBMBqGozyUgDk
         Q85Pzo4LazfA3Jhc+QwSsKbOkQ18LGmD8f4yu/qeLs36AIfPHcAGAcq9DUPVYYfeMlsN
         h7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MIpFQ0NWKHK372rOvfeCdj6iTC0QFLwCmnvuB/iqxlA=;
        b=MaxtMckW9fUpkfwQMwZoZ7jgtu4osPGQlD7Gmls2Sxr22/wHsPWIc5th4KPT3Ff1aW
         Sm6N3Uc7bPXQ6f0lYy8Zs2lrJ3HZw6XwXRoHVi2cGu9KA86l2tQvkL5xsnINAYG1WfSy
         e8ADGqIpXYVqVcdRHythNX3XEoR/spEJWINr8Bn5Tl0n0BehqjVenFhLsqQY8jL3fN1r
         viim9Jiie2SmyW2VArRizhuvvezI7QfrTVpvM2NEYGFaO5eWKWjOTXlR2V7xHciVls7R
         SYpF7vBhD+qHbL8IN+U+K07oJAHfzRcs0K4J8QX/O8zUcDbf0i/i/Nd0xYX2UokZMkId
         oVog==
X-Gm-Message-State: AOAM530gpLFBxqYHdq4duXshba/+8Ka0AmDJWAu9Jn6syAWbrEzMpIDx
        /484E3+yRYbhuD89n6sQa02LkE7gCq2ZvkF3oQUo+oLMinQ=
X-Google-Smtp-Source: ABdhPJzA+tC41gL2AlmSa6pO4PQg8+FtZDiKk9KX4GHsoWMAA6xxI2pS2gVpQQMpOeuX0q2p579lDHexpzi7fT3UEMY=
X-Received: by 2002:a05:6808:2097:: with SMTP id s23mr8288439oiw.132.1642292654159;
 Sat, 15 Jan 2022 16:24:14 -0800 (PST)
MIME-Version: 1.0
References: <20211223122733.86981-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211223122733.86981-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Jan 2022 01:24:02 +0100
Message-ID: <CACRpkdYRLDqgKjuW8W6NobaTP4dTjnkmepu=T-GhO7fMNcMEzA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: altera-a10sr: Switch to use fwnode instead
 of of_node
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Alexandru Ardelean <aardelean@deviqon.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thor Thayer <thor.thayer@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 23, 2021 at 1:27 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> GPIO library now accepts fwnode as a firmware node, so
> switch the driver to use it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

LGTM!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
