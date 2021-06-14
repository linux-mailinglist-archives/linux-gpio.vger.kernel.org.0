Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 838463A5E25
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jun 2021 10:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232601AbhFNIOl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Jun 2021 04:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232530AbhFNIOk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Jun 2021 04:14:40 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BF8CC061767;
        Mon, 14 Jun 2021 01:12:25 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id a127so4144337pfa.10;
        Mon, 14 Jun 2021 01:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+Vv3hBAQ8kpZIe+1+G82nUGelWzwqMrss8OA+ER4ISc=;
        b=c4fGtjeg/GfqEDJFxCfTs2qulnbzuKMp0HYaOci+oQWvyQM4dQ7rcIDbSs28NollGJ
         3TfnXLmrNnyCeUoYBrT6kPf1LySbpdqm9+fZ2yBD2Hw1Z4k4R7o3l6UidYHfhxQ151m/
         MD5wP9xxOkMmZWiml42sWS2OMHvvYyzQqZJyMvE87DohZjCJMRmcXWLybcsRYqwQ3gyK
         eCVWaiYa9epVi8oi50IEWlMypfrBpZ9vwUq1IZ2ShmB3bjAIM1O3NOwjfIh0U78zqhMr
         mK9GFJFicIgurMGWWACJqLodhke8XP+w8c/DqpaxgC9Zt/Mdm02QiaZdUXTBg6yZW/DE
         aJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Vv3hBAQ8kpZIe+1+G82nUGelWzwqMrss8OA+ER4ISc=;
        b=l/uscmRrM0Zbou93iQbtQW0ctWtsQx1SlRJjNTWq+HR94295GC/YphygsjP3nYEKx2
         0Q4Av9F8DjXi5mxyF/+uV8SEGTMj9i0h+YaNqDQkHNv13g2Q3egDfmD5ef/vSTaz06YH
         br8FC2P+wMU0ZNeqe/5/RSQxks2igblVwLpK4RMylK1uAXE0yjzkaS2EwL82jc1alvOY
         NtZBYCecJ7bOcEzBzQJTfRO9Hth2GW/F7cpRHiiDJqcR6mlCSG6AxAHXPsqaxAGe1xut
         vbp+NcFppu50S0R7YhYlCn+FYARbVc58jjitAKGUHeRWA5BwtW+c9KKbABIlZ9x3HOFj
         fm6A==
X-Gm-Message-State: AOAM5318oMs8AHlvvKxsTi/I0Rnd7iHBdMyczJSLmSpvoSn8n49lIVsn
        OL5404Q8ZbpaMKIJKeZLxjPaRnLspNdI+BRw38M=
X-Google-Smtp-Source: ABdhPJxhe15j5OGsgf6ubg65hqo067+sEZz2F1/eOHojX+9gZ7QSWo1iAgCyufmjG6vo/Icejnu1ejDf08TGvFILI5M=
X-Received: by 2002:a05:6a00:139c:b029:2f7:102c:5393 with SMTP id
 t28-20020a056a00139cb02902f7102c5393mr13962018pfg.40.1623658344790; Mon, 14
 Jun 2021 01:12:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623326176.git.viresh.kumar@linaro.org> <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
 <CACRpkdZV2v2S5z7CZf_8DV=At9-oPSj7RYFH78hWy3ZX37QnDQ@mail.gmail.com>
 <20210611035623.z4f2ynumzozigqnv@vireshk-i7> <CAMuHMdVrtSnFpPbB0P3Wxqm1D6vU1_cnh3ypsZJRNF6ueKdAsw@mail.gmail.com>
 <20210611080122.tlkidv6bowuka6fw@vireshk-i7> <0478822f-9d10-deb8-86ae-3b4ac3bb0c6c@metux.net>
In-Reply-To: <0478822f-9d10-deb8-86ae-3b4ac3bb0c6c@metux.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 14 Jun 2021 11:12:08 +0300
Message-ID: <CAHp75Vf0+bCnnD3wtkrPvFbr2k3A0r3eWNp87PyksiC7euaqdw@mail.gmail.com>
Subject: Re: [PATCH V3 1/3] gpio: Add virtio-gpio driver
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Stefano Garzarella --cc virtualization @ lists . linux-foundation . org" 
        <sgarzare@redhat.com>, virtualization@lists.linux-foundation.org,
        Alistair Strachan <astrachan@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 14, 2021 at 11:08 AM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
>
> On 11.06.21 10:01, Viresh Kumar wrote:
>
> > No, QEMU passes the raw messages to the backend daemon running in host
> > userspace (which shares a socket with qemu). The backend understands
> > the virtio/vhost protocols and so won't be required to change at all
> > if we move from Qemu to something else. And that's what we (Linaro)
> > are looking to do here with Project Stratos.
>
> Note that this is completely different from my approach that I've posted
> in autumn last year. Viresh's protocol hasn't much in common with mine.

That's why we have a thing called standard. And AFAIU virtio API/ABIs
should be officially registered and standardized.

-- 
With Best Regards,
Andy Shevchenko
