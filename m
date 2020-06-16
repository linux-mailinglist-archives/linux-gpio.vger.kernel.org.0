Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1FAD1FBDB2
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 20:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729811AbgFPSLU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 14:11:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727114AbgFPSLT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 14:11:19 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57061C061573
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 11:11:18 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id h185so9881507pfg.2
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 11:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rrK+zJFVdiQeevkJ/f/hH06LIyMZOQeuEjfav3mLMo8=;
        b=Xrz3CYzkFd7J9QZeMts0nHIRMPOcezEU543dEgo51fQa1oeUfUuSM4LbSfTSo2kFIK
         zrZ0xLdipp5dgL3rJ+KetoGpD85lKejunUSCMMM5uldLh3/w0jlqoTqyCuQmaQNnSaep
         bdB6sBpd8bVcIxbCq3DxNWO+dqElYB8Gsmx1FGFzqIjDtRGHH5f6QhEWVIT3JXagLVrB
         WYz/cKZ0vZ/2Dkm/M9/HYjGQULthLiSQ8RmRQ5end71v5Sbt/hdal7rZhcfIkvbALw6C
         UAxdsGSj7ck9VO3kBnEgxawFhRUwIq0HvIl6cKaopQ8ky4rv5iTclJYuscottkRRJoLN
         5ugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rrK+zJFVdiQeevkJ/f/hH06LIyMZOQeuEjfav3mLMo8=;
        b=qbKWnk97Lr50Fcs5iD9wOQztJaQE6LM9K8RFzGt8jeTc2Lmi/PQr804LKUI4X3hcyu
         yTspgTGXAG6Xw1Jm0+AakJluhgaZgTtQaOpQ0Ggrdjc77c5znBwhoanQOVjJ3IDtO/3P
         by7JULqJRUOvHWJoyycUMgQQ7pRsIm2EkwdXQuF1A3El6blYqqhO9jmEf2K6DW+kVFJs
         ySrg7m7YZRybTm3DNquXl2LJzjPDzDY37DwWSpE/ismdq2C4+ApZBpkxWO0dfWKyoy8q
         vJu1dbxDeTyXVwVzj+GYmaDIP5YFRr+6ikTKnT05ACvrurP1rDiOOmJ8jIUlqmHyXdLr
         auUQ==
X-Gm-Message-State: AOAM531FnIIND86lUhbJPOfhfCHx77M8zQS9edBDZcPq1Hbaa+RM3j1+
        XEoUVc+SGeYo6mFVTFZ/XWAUFLkydZAscUoRhAA=
X-Google-Smtp-Source: ABdhPJxXF8vvSlBxMdeiErWXwsTr9Uz4OokGhHg3MYeZhIb4g2yNerZ+Zk6iCVdPLFH/3gxk6r+9bs/SGhpofrYzRqs=
X-Received: by 2002:a63:f042:: with SMTP id s2mr2960456pgj.4.1592331077627;
 Tue, 16 Jun 2020 11:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <a21e051a-805b-4c26-6f47-99f1654f222b@ionscale.com>
In-Reply-To: <a21e051a-805b-4c26-6f47-99f1654f222b@ionscale.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 16 Jun 2020 21:11:01 +0300
Message-ID: <CAHp75Ve9z1XCRjLAXvPKkfNfSfV7m0W9ney44nGW-cF=yEFf5A@mail.gmail.com>
Subject: Re: [libgpiod] reading multiple lines after edge event
To:     Gerrit Wyen <ml@ionscale.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 15, 2020 at 10:45 PM Gerrit Wyen <ml@ionscale.com> wrote:
>
> Hi,
>
> can someone explain the following behavior and whether it is a bug?
>
> When reading two lines at once via get_values() in response to an edge
> event I only receive the correct value for the first line (second line
> is high during the test but always reported as low).
> See example code below:
>
> lines.request({
>   =E2=80=9Cgpiotest=E2=80=9D, ::gpiod::line_request::EVENT_BOTH_EDGES,
>   0,
> });
>
> auto events =3D lines.event_wait(::std::chrono::seconds(10));
> if (events) {
>   auto values =3D lines.get_values();
>   for (auto& it: values) {
>     ::std::cout << it;
>     }
>   }
>
> However reading the same lines via get_value() one by one after the
> event works correctly. Like so:
>
> for (auto& it: lines) { ::std::cout << it.get_value(); }
>
>
> Also, when reading them without waiting for the event with
> line_request::DIRECTION_INPUT  the correct values are returned by
> get_values() as well as by get_value().
>
> This behavior was tested on multiple different devices.

One side question: do you have kernel 64-bit and user space 64-bit, or?
Also, can you provide versions of the kernel and libgpiod, if you are
using latter?

--=20
With Best Regards,
Andy Shevchenko
