Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 422413952C3
	for <lists+linux-gpio@lfdr.de>; Sun, 30 May 2021 21:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbhE3Tk1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 May 2021 15:40:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbhE3Tk0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 May 2021 15:40:26 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63BAC061574;
        Sun, 30 May 2021 12:38:46 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id l70so6769577pga.1;
        Sun, 30 May 2021 12:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MOo3PCdGau+6BhSk6QO1iiKc4UzJc1ZGoKIkwPCZjo8=;
        b=h5+LTebQtPM50NAtq2y3Vl2gGVyr8sNMwFzTTOd7oApeEpMy5+r0W5y81ZhVkbuaIU
         UCM27IpwO041ucZVATVmJUc4rMr5f59dDPDxBtSLZzJr03UQ4xcBMlT78p5vuU0wigwr
         N5NBuH1Sst8TCNSXVu8S5Ll35GStd1Q7ZjP/kaQa6Kr43FUpuY8/qfLY7qpH8vwFP8pF
         BQhw5r6xuxBJKfPAyMMqwe/8dFsnEpuQmQ8xTD0IEDYEO5wygC7GD124bUPDm6bgQqo/
         iyKrrW9DX3w2XXO6rbvLIBMHpo/lQcUBkrspYVYf74XO8sOx6FvFDA/iSxY+WsV2lYDk
         CWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MOo3PCdGau+6BhSk6QO1iiKc4UzJc1ZGoKIkwPCZjo8=;
        b=Olw9ieEXnCATP9qz1IqCWOupy7nbah2gETJZsfPZUpocNOVCq6kovbVXUUgwKnXZNm
         C/sV26970EVMiMhtmYOPJIl/hDLBKW7Z4cQ3vDpnLzbUKRU3MitZOxVkAHmNd7PrRRJT
         5/+o57cz3jOYj3QBPKimFtnGXrnNk0vbrz7V43p4YMQaD/46Vdvura4+hPnYE9Qgyupm
         8f3lWQ2AZ8qMJUTMrAqaKocA2MATXsU1WkIyUjSXJOt55ikmDNM/PzL6Ivh2zzJuCnvh
         8/Csjp5TUc6qOlGb4mPxUs2qzc0Rpm6uqIZ9SJJTUFCKgLaA/2tWbFc6J+4uQXMkakq8
         6vWA==
X-Gm-Message-State: AOAM533RFk0N+JgQ0udsvGdY0J0tc8ugQoP0OZ9TCFZgNgxgCtg7lAVO
        UAQPvoGK060rvrXD8A3x1iFNgXdRtVuYANoKDKQ=
X-Google-Smtp-Source: ABdhPJytIf5lb+iszxa2pz2EFI31QC8ptMW9iKmWLBloHyTPoWhpTZywJAnJHuuHKhD0vOFLXvS7H9qv7RirfcyT1lc=
X-Received: by 2002:a05:6a00:a1e:b029:2e2:89d8:5c87 with SMTP id
 p30-20020a056a000a1eb02902e289d85c87mr13805796pfh.73.1622403526238; Sun, 30
 May 2021 12:38:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210530161333.3996-1-maukka@ext.kapsi.fi> <20210530161333.3996-3-maukka@ext.kapsi.fi>
 <CAHp75Vffj=8WKBO23iRxxFmva+SU5u58eBkZfMRyY6GG-6maXg@mail.gmail.com> <0307426d-83a3-8c45-e1a6-ffc422780cbb@ext.kapsi.fi>
In-Reply-To: <0307426d-83a3-8c45-e1a6-ffc422780cbb@ext.kapsi.fi>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 30 May 2021 22:38:29 +0300
Message-ID: <CAHp75VfkyV+2p50c=iK5n4uiv6ptypsqc-GkWi7ZJHTs7Qmr3g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] gpio: gpio-mux-input: add generic gpio input multiplexer
To:     Mauri Sandberg <maukka@ext.kapsi.fi>
Cc:     sandberg@mailfence.com, bgolaszewski@baylibre.com,
        geert+renesas@glider.be, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        drew@beagleboard.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, May 30, 2021 at 10:02 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:
> On 30.5.2021 21.09, Andy Shevchenko wrote:
> > On Sun, May 30, 2021 at 7:16 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:

> >> Reported-by: kernel test robot <lkp@intel.com>
> > Is it a fix? Shall we add the Fixes tag?
>
> In the v1 a build bot complained about .owner along these lines:
>
> --- snip ----
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
>
> cocci warnings: (new ones prefixed by >>)
>  >> drivers/gpio/gpio-mux-input.c:138:3-8: No need to set .owner here.
> The core will do it.
>
> Please review and possibly fold the followup patch.
> --- snip ---
>
> I removed the .owner attribute in v2 as requested but wasn't really sure
> whether it was "appropriate"
> to add the tag so I put it there anyhow. Technically, this does not fix
> any previous commit.

For this kind of thing you may attribute the reporter(s) by mentioning
them in the comment lines / cover letter.

-- 
With Best Regards,
Andy Shevchenko
