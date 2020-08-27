Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89D6F254091
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 10:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbgH0IUO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 04:20:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726266AbgH0IUN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 04:20:13 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 236CDC061264;
        Thu, 27 Aug 2020 01:20:13 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id q93so2293065pjq.0;
        Thu, 27 Aug 2020 01:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/sTErQrDwZaXdhh1j7XC4sdEgJopbsfYEqsIsuj6o2A=;
        b=TfwXAmEIlZTomER3mGbfvK2UwajwBotHhjlvPqzPjq8x5J1pjUi0rljNoeDy1IjQyF
         oxHlRlMQRiXIbw+XXQ+lDKRyI4oUqp+NRs5SlrpN7gxKxiTNEbqy92LlwpA3e62VlTSc
         HMjxqE/jq4cTQm6EsBd1N7AqVpRN1qa1guQ1wWX8g3RZZP3bmpXFyB/Nq+pTbdXmvWgF
         Np44o42UXBM8/dq/0e/PdzHqCaFsXuq51ZYkE8tk+AYqNK9ZdrlnqOkWUw6nZLAs4jGz
         V7byVetEblZwUQu8JWztV2dvbgJq05MzBb0byZRFAyANN6LvBc6KK/DeJ6V2Gd6Htcke
         DLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/sTErQrDwZaXdhh1j7XC4sdEgJopbsfYEqsIsuj6o2A=;
        b=rSll5i/miPNIZRPlJEqZ9RqoD22b+lUZiIN/UkPoP0Sn5hu8yPebYzodKguufwMFjH
         rEwyvcotuDimrzHyqWfZp9N+NTZXUXJkEXsTqTEEfWssvKvwc8cZduGf014DGGMEkF5P
         3nlwAAbxcXf/HYHz0QKOuVnWSTOHcRX2yXop2ZaIOmLnqYN/hLedI9iti6TRF37yYbCH
         5q8ft++TiPROSs5A6I9Abz2IC42ZV83SJpQJuPAAVH3NWs4oZAYuGx1pdvzDg8dUWJMK
         ubiLoJrgSXa2LFWJrK0KUNv+6lWsJYMdBmgfwLkzav2PVSo2y9wrnUKqOHzH5FmFXqkQ
         EIzA==
X-Gm-Message-State: AOAM531q6YavHewumAGw2uLoUHH4TakxMG+d9ZCURtbwHQtl66RRs3oW
        l1vvb+VeO0E4czD/VlaYyVRUwgNJiLUaTD/kKdw=
X-Google-Smtp-Source: ABdhPJz5aVcFm9Slyo26XUDAT6kJPxVp+aev1iyW0ieAuXiPSGDcr9Wvkj53TTNr0xNFquk8zaG+Bxh5UWXTBkvBSww=
X-Received: by 2002:a17:90a:e7cb:: with SMTP id kb11mr9306052pjb.181.1598516412614;
 Thu, 27 Aug 2020 01:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <1598070473-46624-1-git-send-email-dingtianhong@huawei.com> <20200825095726.yvg34q74xy57qhrx@mobilestation>
In-Reply-To: <20200825095726.yvg34q74xy57qhrx@mobilestation>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 11:19:56 +0300
Message-ID: <CAHp75VfnCRFPQ19tdQb46PvnBV3RActKn4+hSivPN8e122Q1Aw@mail.gmail.com>
Subject: Re: [PATCH] gpio: dwapb: add support for new hisilicon ascend soc
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Ding Tianhong <dingtianhong@huawei.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel.openeuler@huawei.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 25, 2020 at 12:58 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> On Sat, Aug 22, 2020 at 12:27:53PM +0800, Ding Tianhong wrote:

> BTW Linus, could you take a look at my series? Andy and Rob have finished reviewing
> it almost a month ago.

I was wondering the same, but in normal cases (not closer to the merge
window) Bart is taking care of drivers/gpio (AFAIU).


-- 
With Best Regards,
Andy Shevchenko
