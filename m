Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53B396B40A3
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Mar 2023 14:41:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbjCJNk7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Mar 2023 08:40:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbjCJNk6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Mar 2023 08:40:58 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D18EB10DE55
        for <linux-gpio@vger.kernel.org>; Fri, 10 Mar 2023 05:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678455605;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ec5XfNjxgy0+peAVSlU3DabxggNLNiWQ6hIV8ILc0ww=;
        b=ayIgjpU4zVeob0ThvBVGa4eJPRgrCOoZoljmquXVTPA9BpiDt5j1tC/bKbQdJK1zxp8Af3
        vuLz4kzJpEgx5CFvRI9BHz+Rp/LLyiN17cTBVQepH0K/TtS+RGT/d0cnt6lAxRDsbIDmmf
        ITljKgZ7rDeTFMD3kjFgLMY7JN5RU1E=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-iEMgJjHTN9-dWLHhVz6Jlg-1; Fri, 10 Mar 2023 08:40:04 -0500
X-MC-Unique: iEMgJjHTN9-dWLHhVz6Jlg-1
Received: by mail-yb1-f199.google.com with SMTP id d185-20020a25e6c2000000b008fa1d22bd55so5837419ybh.21
        for <linux-gpio@vger.kernel.org>; Fri, 10 Mar 2023 05:40:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678455602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ec5XfNjxgy0+peAVSlU3DabxggNLNiWQ6hIV8ILc0ww=;
        b=t3LCJGgfvmpqtLHKqkdx2syZxLxxR71gf4hw2doH00LWi5acCfv3d1R4rRxaZ52zw2
         XNY/PVmK0uxEW0OT+UYxqCdiwQ6imik/ohuW2gCcrXXzqxsckR+xAbJVnEureN4ulQFY
         MdO/s9rauxeKKqdpGFeUTSYR/YIRpZFqnBpIvVV7U7m9ZNzFhrAUHuP9wp1XQyFuuOvZ
         C2Cga45LNIln9lFM6HE0CXwDSKDaIFnPSJ4eJF1f1uvCdfMUK3BhH5S+Gx2p0nejgGIf
         OB+Uj1mjagQOII2twErQewIc5Ds0cBWVGFaQmRPtrIrSFxZx2ruwXTQuAQHn7FoPb7p7
         WSXg==
X-Gm-Message-State: AO0yUKVpmT9/cCFERWR5RiEwvzj7AG37psGJ0nYam6dUJVhYRCj4VJMA
        WCHYdVZVXxYbOlMkFWWnXurrLuNZdxNDjMRNkHjHnDIwZ9zJkbf+y3l6OSFMpxgJX4H1V1zKDZ4
        pRqa6GVMMoUbGWmarWkEkHuEPzNl6UdfCkRvCDg==
X-Received: by 2002:a81:ac09:0:b0:535:8cb8:6ae9 with SMTP id k9-20020a81ac09000000b005358cb86ae9mr16625682ywh.4.1678455602593;
        Fri, 10 Mar 2023 05:40:02 -0800 (PST)
X-Google-Smtp-Source: AK7set/5VI1jqwwIL95f7E9ael6l5fc39fVSnt5yYua59iTmCvE+HObP8/dA4tH6a8PyRPfheRlOalbqTQhZQilnc9k=
X-Received: by 2002:a81:ac09:0:b0:535:8cb8:6ae9 with SMTP id
 k9-20020a81ac09000000b005358cb86ae9mr16625674ywh.4.1678455602386; Fri, 10 Mar
 2023 05:40:02 -0800 (PST)
MIME-Version: 1.0
References: <20230309-fix-acpi-gpio-v1-1-b392d225efe8@redhat.com>
 <20230310114150.GA62143@black.fi.intel.com> <CAO-hwJK+yF+0u6cbw4CoV8vS80Vx5xkC2vwPjOQvnUox2SMdTA@mail.gmail.com>
 <ZAsyaNzhbcWuJS2q@smile.fi.intel.com>
In-Reply-To: <ZAsyaNzhbcWuJS2q@smile.fi.intel.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 10 Mar 2023 14:39:51 +0100
Message-ID: <CAO-hwJL1YA0MnYkQ5pOgCoOd0Kga3+F2nnzkLu=9PdggrB=y6w@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: acpi: use the fwnode in acpi_gpiochip_find()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Daniel Kaehn <kaehndan@gmail.com>, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 10, 2023 at 2:36=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Mar 10, 2023 at 01:51:38PM +0100, Benjamin Tissoires wrote:
> > On Fri, Mar 10, 2023 at 12:42=E2=80=AFPM Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
>
> ...
>
>
> > > Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> >
> > Thanks to both of you for the reviews.
> >
> > Andy, should I resend a v2 with the rev-by from Mika and the Ice Lake c=
hanges?
>
> Yes, please.
>

Alright, v2 sent just now :)

Cheers,
Benjamin

