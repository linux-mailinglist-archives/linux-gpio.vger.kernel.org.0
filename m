Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E19D24FD7ED
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Apr 2022 12:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241976AbiDLJ4x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Apr 2022 05:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388442AbiDLJWM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Apr 2022 05:22:12 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DBC046B0A
        for <linux-gpio@vger.kernel.org>; Tue, 12 Apr 2022 01:28:40 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id k23so35787552ejd.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Apr 2022 01:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9pLWiODOOZL178tpEqwofl1D5ualPXQ/vBRW34AkTuA=;
        b=NLdpRY6W7VSJdqN39swR+EnBSwHzc9yMPP1ohdf7r0qw+XUE7KvlliFNmr3MeKW3kt
         dvSzsH6RjuFfwZdsXywZafFmY615056s45UlxPo/DLsKb5GaLPPZQEVhKS67laqmN5dc
         zRoMg6letP7zOsScx2XLGC7wQDLnxbTQ79cm2PXG0qGPW0cPqHMUqnWBkrRzm6xHdNPQ
         IiPiUPT8luzGcJtxkW3d7Qr0D7Z/VPvvg+zkMl5hO/TDGjU7eeAHYipDJz3TxtiGRU9o
         MqQO5b9mHqr9UPU7do3V8AI5C/eHpwhSBraqDS7m3soKgWke88QHaSrEZHEpKn3WsWfi
         sfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9pLWiODOOZL178tpEqwofl1D5ualPXQ/vBRW34AkTuA=;
        b=nOrFQ+67xg2X1Qs0fmNR9bROp9QK5DtiZ2L72ERILskE9+DCcg2mOqexAXgOOT20+Y
         a8b++0JrUq/MjY4IzjWt1kBGXTTLGiIAMnw1I2IqtO9B/d0PY2LMpSt7PlmJIqlmv3mS
         wD0sUJR0unTh5rW2eOUjfo17Fr/wowECJo6UQxKDVEESHRgQ+0qURGwblEsxPzW7t5X5
         xxp7Sf4tk/82og4tYbzvDtbNVc5SYi04Fj0RjGAQurmEgAa8a1VUytpuscPWIBAXeFaY
         n1dFBzRUkYySbMrPRIH3TeNi0bHGmpAxwkcNbev67da25w2L4DnPiJDZkYvr1Kj7Tq8e
         s0qg==
X-Gm-Message-State: AOAM533NVr6s+2yRnQdAOH+RziLY6GZOKoBM8wX1SWcW/sez9Q4lSwiA
        4NB+hr4r2JkL5idhZVaTPbPykbxExmTJQP+dbmOnfQ==
X-Google-Smtp-Source: ABdhPJxg+bgJzY8ifzgACdhMELmjNhIE8OEjtXI7cTUfeZE1bYvbbpw+kl1uin2SHTd4z5vkUunyd3PCDRmh10FCRgk=
X-Received: by 2002:a17:907:97cf:b0:6df:846f:ad0a with SMTP id
 js15-20020a17090797cf00b006df846fad0amr34382832ejc.286.1649752118772; Tue, 12
 Apr 2022 01:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220411063324.98542-1-andrei.lalaev@emlid.com> <CAHp75VfyxspOScEt1qffshdrDYuQp50O5HFbr2cUV7MYsg=JdQ@mail.gmail.com>
In-Reply-To: <CAHp75VfyxspOScEt1qffshdrDYuQp50O5HFbr2cUV7MYsg=JdQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 12 Apr 2022 10:28:27 +0200
Message-ID: <CAMRc=MfakYvQUW4NLWCrm5yVA185X4t__aB3r4-9xTh8YJaq8g@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: of: fix bounds check for valid mask
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andrei Lalaev <andrei.lalaev@emlid.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 11, 2022 at 2:17 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Apr 11, 2022 at 12:57 PM Andrei Lalaev <andrei.lalaev@emlid.com> wrote:
> >
> > Use "greater" instead of "greater or equal" when performs bounds check
> > to make sure that GPIOS are in available range. Previous implementation
>
> the available
>
> > skipped ranges which include last GPIO in range.
>
> the last
>
> Should it have a Fixes tag?
>
> OTOH, the current implementation suggests that we have start,end
> rather than start,count. What does documentation tell about it? Does
> it need to be fixed?
>
> --
> With Best Regards,
> Andy Shevchenko

Thanks Andy, I rushed this one. Backing it out.

Bart
