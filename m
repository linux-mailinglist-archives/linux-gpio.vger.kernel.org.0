Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF40629DA0A
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 00:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729428AbgJ1XM0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 19:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgJ1XLt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 19:11:49 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91AFCC0613CF
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 16:11:48 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id o18so1248116edq.4
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 16:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Dg6TspjrICJkOugoHrRVElTVqmURk390ews+cACTSJ8=;
        b=Uwxwj3iY3xmbx32gOYncPduLx0jmzJw60EJAWxSSTMMdJfc7U6orys9IQA9FigU6xX
         rPl+/FBdqiiF0wPtih7ilQou2Z7HM1Lwjspl8clUa+qQe3ZyVOhjrFIN824V9ylxUweh
         CjQ5rc/5B4k1bycKwy1Q0u0Fu2fiS33/JUfCH/nYb2MUeuvWS4P/qPVH66tuHAxIjBvt
         tLesrOrMY0O1NcQ/l96Z+FuRkzNKwk//pWlulW/TqUQz/P7AoBbB6GGXoAfGukuXXRa4
         tXqeDYmNygKz8poMFweCSU/Kt7E8+KLQaDMCOPs4O3/vMRpgJskuILJ85QK8smczcQ6B
         uQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Dg6TspjrICJkOugoHrRVElTVqmURk390ews+cACTSJ8=;
        b=q6q70YeUTLt5PEkMkPWsu/M4JtWS3aZSKwLFyXDw4aKAF8TiLY6ZCBT3dJScxx9Pw+
         IuGdr2bkhsNVMDb41LGTqPyrr0kxfVo54UrJqi0O9fHxpirwNRbzJiCh+1+dJxRdncsM
         1Uut86eaP/tdHydj9dtChwZb2YFHL3xO3UZGcACDS4QEmrGC53AVATSwQRu7+OPIcWkZ
         1nMLzekHwaSeea8Iu9jozTh3Ux8WcDkmqudFDxKSobyVDr4s3TTNcg+SiE5ez4Rzxjie
         VmRiuD3F7T135ptM9yyJOnho5mz93CqN0npOhsA1GJUG5qqW13qgGgPid56fqdoyZm0J
         cI7A==
X-Gm-Message-State: AOAM532eY2nUYQVQL4KDZHVt4jSDXIXbMXFEfJY5ayMpkGa8G/UsF5Rs
        X84w1B38Q+IBXqyqdEjKvYfPeq2OEHR/7FiLnRLpMAv2wBhuNQ==
X-Google-Smtp-Source: ABdhPJyFslxoXrfB3fvZNaGw4SpC6v9HMRGJ4GFgkLDfF8kIH0ow84Apw5ZtF459JqJ4n+DNGDF4ynB5LMpbNaL2hDY=
X-Received: by 2002:a05:6402:17b7:: with SMTP id j23mr7853694edy.288.1603891354623;
 Wed, 28 Oct 2020 06:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75Ve8ncybbLB7hCb0Qxh=JjJr8e1tVrXXiJhwFt9=2b3AYg@mail.gmail.com>
In-Reply-To: <CAHp75Ve8ncybbLB7hCb0Qxh=JjJr8e1tVrXXiJhwFt9=2b3AYg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 28 Oct 2020 14:22:22 +0100
Message-ID: <CACRpkdZoimQwdE6h4RWHGOtdm_0Gc-XDbSRyq=fu6AF9QMO+BA@mail.gmail.com>
Subject: Re: Request for pre-review of pending MID removal patch series
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 23, 2020 at 7:07 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> There is a pending patch series [1] to remove a lot of legacy code
> related to old Intel MID platforms. (Note, not all of them, since we
> have an ACPI based Intel Edison edition which continue working nicely
> after this)
>
> Most of the code is shuffling arch/x86 and the series is quite
> dependent on the contents of that folder (for the sake of
> bisectability). Since that the only way it would be integrated is
> through the tip tree I would like to have your preliminary review on
> other contents =E2=80=94 #3 and #4 are PDx86 and GPIO subsystems. In this=
 case
> I won't resend this many times.
>
> I have a preliminary offline agreement with Len Brown on SFI removal
> (#2 in the list).
>
> [1]: https://gitlab.com/andy-shev/next/-/commits/topic/mid-removal/

The series:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
