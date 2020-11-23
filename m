Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 436E92C12A9
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Nov 2020 19:02:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390442AbgKWR6m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 12:58:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388608AbgKWR6m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2020 12:58:42 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2E45C061A4D;
        Mon, 23 Nov 2020 09:58:41 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id p6so6842260plr.7;
        Mon, 23 Nov 2020 09:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EXfywewSoFveR+0OC9ZxMay758XK3N5yEGcBXziyF2o=;
        b=uiN4n7s5o7zhZyGInB+xYTrYhacuDEQZ1At27ZdqXzJEk4Gk0UlG7qUdYZMYaPAR4L
         WjSlGDALjiUcDYOiZXfRpWuWmcnvcZInq6uzIElguRiW2svZZX0f1OcQKeqBIJMk8Hi7
         6xtkIegJNR7lWKqsC0O1KIb7Kt/2cCOP9wGuBJYivheJcuEjPYTAQftTCwJO+Wej8hnT
         WGR81uu7vfhqPXgkiF/lfVMX2BCxyLvPokIOQDSqPcqT+uTmWl+Oivkh6rZZwNBX59ue
         iuKCpV3SJu2+nL2LODIY+z7OeZEV+DoOCCmc8uTRWU52OcS/faI1JsObMm31O9lrxeli
         S9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EXfywewSoFveR+0OC9ZxMay758XK3N5yEGcBXziyF2o=;
        b=Xz2F3XphkrMDuH7TfODqFWQVpmz8d/Vm/fM/Py+mXBjyRHZlVf+JJyrVNsvCSC9DoF
         DzVQT9ZhuUCKWNklceRbzk+NKgIYKBDwpIMcxq9gFKavKl5kEEK8Vln1zVthT1oulAg9
         rA+Mj5L//orsgYFhLJfa6MTUBdVo0BVBacb4krykOxcRWiyjk7iwVrOxIqLHnjtF7RSJ
         Uiam94hUAXAnmal7Vn+V8DjuU2Z9kSrvgPoiQjW7XJfrVn6M4OvYbyCiQ8rgZjTLF+0i
         AA1xJLstROvZmyZYtWzR7K+ez/i0ik7ePyn6owtIjmac85Xus0EPpioSlbFHAQzq03FZ
         LKHg==
X-Gm-Message-State: AOAM5326L2RD+TqdNP7dM3RdCCCIJHLur6mDFTPJzxXBmN6IBYbHfmrM
        WhDEM8pmTDocgG4ai4WMR4pGiVJJywxYjsaXRXUhcG+V31Y=
X-Google-Smtp-Source: ABdhPJyiGUmkqCL02LsCJ3o69dBYzv5aN8rhsnesF1+qxIzvcRwfECVuanURYY63pp5NVsCLwaI7r/UmIA95LpPDtjo=
X-Received: by 2002:a17:902:ec01:b029:da:13f5:1aaa with SMTP id
 l1-20020a170902ec01b02900da13f51aaamr650312pld.0.1606154321407; Mon, 23 Nov
 2020 09:58:41 -0800 (PST)
MIME-Version: 1.0
References: <CAHp75Ve8ncybbLB7hCb0Qxh=JjJr8e1tVrXXiJhwFt9=2b3AYg@mail.gmail.com>
In-Reply-To: <CAHp75Ve8ncybbLB7hCb0Qxh=JjJr8e1tVrXXiJhwFt9=2b3AYg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 23 Nov 2020 19:59:29 +0200
Message-ID: <CAHp75VfpxvGgTyHFA6p1fmqpAu9ok3=ztGp3USviAHY6m8y=7g@mail.gmail.com>
Subject: Re: Request for pre-review of pending MID removal patch series
To:     Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

+Cc: Mika

On Fri, Oct 23, 2020 at 8:07 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> Hi!
>
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

--=20
With Best Regards,
Andy Shevchenko
