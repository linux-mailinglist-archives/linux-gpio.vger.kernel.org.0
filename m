Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9570C33C23C
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 17:38:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234233AbhCOQhZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 12:37:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233454AbhCOQhM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 12:37:12 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AB1CC06174A;
        Mon, 15 Mar 2021 09:37:11 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id kk2-20020a17090b4a02b02900c777aa746fso15079728pjb.3;
        Mon, 15 Mar 2021 09:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hxTr+jCjNOdK/SRs3Tz7jJtcDFSQzLPh/SdXv7CFTJg=;
        b=JHodpzXGHG28Jf7mWc3g/MgAtc320RuyEet1UCcaWQyK7ZZuuQwfPATnMaaDu3UZ6g
         rfSKVM9y1Cr2jQHWZ3puucVOcr3BEdF/82IRcLQpmMac6pXzmSwKeVsHJKj39o4z5iaj
         5RK4yk/8FJtIL8tKGtaxR87ThL2p6796IsY3aCSCYqweaI7SU5IYz30cJ7CF6Ep2zaXI
         6V+GeqBOtftcGES3z677GDgAVpkObIjjPV5fd1KbBpQoEqvLCR+Cbwns5YotzYe0qGV6
         yqKklX7LkN3/XQmjYwYxg63j2XS/mjqnZEiZBQGR+8+G2lPWn/74mfxMELRmmUnVuX4N
         +9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hxTr+jCjNOdK/SRs3Tz7jJtcDFSQzLPh/SdXv7CFTJg=;
        b=WNgvFgkPGipVhjlJO1Rs7Z9fnKev7EBdLUxKmCj4pF5hKUZ3R/6k5AKEwYdtNtpsyo
         0yBqCq/lJKE3RCqZDTQtbSb62N/Bfr3x3ldbUjPgwZzUSLwLinLMZnphx5OvOS1YxCOv
         vdMpclm7eST9bWC1WGSq+yUJAUNbnNgI76E2SUA2sTjWYe8lwZaeBHCY4X8T1RgGJpjB
         0ak7vGkZ7y7sgZ+cseB99Mj3nwRpKDl2nnLAIZyH2PdJ1gHd/4Q3vQNzpK3PP4sAUrbT
         JFjupJ/fO6N8w5vhjBevfuuVYEf/2UzAdmU88rTw3XBHvda2MFiMUduQkHRm1BwJFuJO
         LjsA==
X-Gm-Message-State: AOAM530tnw+VRyTikVv1YEEHHNPOsNc75h2ZaOnk8MtJfNso3YmtrIqK
        UyNaGjarW/10abnXL6U+bYWO0HdXArJMy2zI9h8=
X-Google-Smtp-Source: ABdhPJzmD16eNSoHlg+ME0sV5oDSP8McG43pWnGy+W7nRmQ+OXh1nwhgopO1tf+cpxtFevI+9RbX/bEtq6FbXbhrpH0=
X-Received: by 2002:a17:90a:db49:: with SMTP id u9mr14249289pjx.181.1615826230873;
 Mon, 15 Mar 2021 09:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210315091400.13772-1-brgl@bgdev.pl> <20210315091400.13772-3-brgl@bgdev.pl>
 <6bc83972093a4be4ad163069a437ec25@AcuMS.aculab.com>
In-Reply-To: <6bc83972093a4be4ad163069a437ec25@AcuMS.aculab.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 15 Mar 2021 18:36:54 +0200
Message-ID: <CAHp75Vc3Fr3Ysv0p7-W1Bf5y1Em17psZ=eCgVNewdVF=AjPm-g@mail.gmail.com>
Subject: Re: [PATCH v5 02/11] configfs: use (1UL << bit) for internal flags
To:     David Laight <David.Laight@aculab.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>, Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 15, 2021 at 5:33 PM David Laight <David.Laight@aculab.com> wrote:
> From: Bartosz Golaszewski
> > Sent: 15 March 2021 09:14
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > For better readability and maintenance: use the (1UL << bit) for flag
> > definitions.
>
> If the values ever get printed in hex the hex definitions are
> actually more useful.

Huh?!


-- 
With Best Regards,
Andy Shevchenko
