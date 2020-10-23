Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A889A296E35
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Oct 2020 14:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463445AbgJWMI6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Oct 2020 08:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S463444AbgJWMI5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Oct 2020 08:08:57 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF61CC0613CE
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2020 05:08:57 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id y1so744520plp.6
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2020 05:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SC9Et9ZPNVpDVHD3sFVHeEF82VPXE//QTxALKOovwto=;
        b=gqtHnhowo+VHHusIXMAtsducc7M5vw6/OqWkK7gJrWQa9omVfTJzP3K9tW1F16MiNP
         hpTKHHeoWaXEXzGRQFSw3leA9vBUzAC5ge9kIXlPEsmM9JnDovYnMlaqEZtbNlHK4C7f
         nqsS8XOJkVNHvnoqFGsnaZIeVfmqo/mDo1wqB1/tzNFtHjG1lAIv21hLH+silPBU1WO8
         zoP+Ndby2MZm6C3MPsoCYEuQOl7u7jQhPQhbjIM5mJTXHyLZ4Ahw6Pg+j5UMZWSuXry3
         +JvNYovZDUUxL5QGFZdt5ODOBFnRM3EtZK4lvN0C6K7S3+0K8jwZ6TEca5EWSVmR7I9w
         4mOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SC9Et9ZPNVpDVHD3sFVHeEF82VPXE//QTxALKOovwto=;
        b=ma4AcWka4LMoo51VDRAqCfqxLn4OBrUvMhhXFyMJjFrYDDMPr1u79sr7/sbhi5SvBS
         QqeZyytwmrkPG6DNdufTJqKFTUz3e8u3hjtjwLYS+0vNjtFHhV2F55Iv46h+vtidZNOL
         pvChoIJGNCmhUB+H2mM+kbdth6YSQpHw+6PiZGbmXbN9Xh+oTc4/kqAr9zncuvlGlD6Z
         URWdyRh06/JYjUdRGMewJnXn0xZjBmWsPxnQs+mCTTUhsty0yWwkNRTNUUvEO7dpiMA4
         N76k5gtiTcQidexNeFVYPIpizSLLDGJ1KXQGt9OKeH6G4LjUoFh0ueh5zV4OlPHBxfSJ
         mG6g==
X-Gm-Message-State: AOAM533YAQWA5Ifeas9FbHyUDERKI2lIQMODrUI1ESQ/ABeW8RbbFgyK
        cSU0A2wd760J0nOc4Hf8evBZlQtuYUXcmxKuvcU=
X-Google-Smtp-Source: ABdhPJwGB1TuMpWpYuqdg1DVxVw0wssd2qkuBpCV6klHkruH27i2N2VNDQChf8aBLX8mcJxdYuQBh/q9rpnWQ66Uy6o=
X-Received: by 2002:a17:902:6bc8:b029:d6:d9d:f28c with SMTP id
 m8-20020a1709026bc8b02900d60d9df28cmr1914429plt.17.1603454937314; Fri, 23 Oct
 2020 05:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <20201023092831.5842-1-brgl@bgdev.pl> <CAHp75VeiGSJO5XnpQLMs=0nT=otVjC1tOsR7xp1gJ3tLHwUTaA@mail.gmail.com>
 <CAMRc=McD7jtBQ_CPV26Pzr63T6-o_aPpYt_CT-48H_mGuhxrGw@mail.gmail.com> <CAHp75VcxaqmJocQ8jYouJ80P0anN5ENheH2yK2Sm-sHXjA5NoA@mail.gmail.com>
In-Reply-To: <CAHp75VcxaqmJocQ8jYouJ80P0anN5ENheH2yK2Sm-sHXjA5NoA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 23 Oct 2020 15:09:46 +0300
Message-ID: <CAHp75VeGFuF7NrGJ9sc+kXz3e-wzGi3kTDmW56oaNKJf65NZLg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] treewide: rework struct gpiod_line_bulk
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 23, 2020 at 3:06 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Oct 23, 2020 at 2:39 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > On Fri, Oct 23, 2020 at 12:24 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:

...

> > Nope because gcc will scream:
> >
> > error: flexible array member in union
>
> Ah, of course. Should be
>   struct ... **lines;

But it is not gonna work... we need an array here. or just one member

struct *lines;

bulk:
  lines = malloc(num_lines * sizeof(lines));
  xxx->lines = lines;

single:
  xxx->lines = line;

-- 
With Best Regards,
Andy Shevchenko
