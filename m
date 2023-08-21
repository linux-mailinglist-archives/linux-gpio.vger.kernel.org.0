Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9B85782CE0
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Aug 2023 17:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236034AbjHUPEO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Aug 2023 11:04:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234503AbjHUPEN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Aug 2023 11:04:13 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B611E8
        for <linux-gpio@vger.kernel.org>; Mon, 21 Aug 2023 08:04:12 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-d746ea563f9so2306159276.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Aug 2023 08:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692630251; x=1693235051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPT7vlsay38RGsLaWzuQCbvS7i7JDhRWagtPvVNEU2k=;
        b=UKYLr1Sl9i0jU9sz+WTnmwg0FDu2FWwGNz5d9VxjqTx3wpXHOdabyMxnWJBjU6hxsi
         +2x9MRE6ssP5u4gcO6xL27W7Iumn0PqYF2FAkyLCgDzkhVMVuAaVVW7RD+eQw4/6U9cC
         BcMsGO8IJr15bp2XGNWDd18peQcjUHZ8b/WPIU4MomO8NoVoEiasskqsXAfOy0JgdeQV
         jSYR79MDOQlENMDSPfGQz3TiaJuKnV+FRcU03HqX/mRggkupYO8jH+gc5fzvWjW03dMB
         hj7RjOTXUmSQDqxcih78w+0Vp4fVfbtHqwVeT7RsvY4cri1omPBYYaLSPikMQF5Qqmiv
         UfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692630251; x=1693235051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPT7vlsay38RGsLaWzuQCbvS7i7JDhRWagtPvVNEU2k=;
        b=FDzmCPn83WklbbP4b0WhgWi6yqJeyE6FYC3cTa76nluwsqBQSciZkeJZpFCtBI2Pov
         Dh1mdhXWqwaXDKdrU8tDgkpSZ82w1D3/1QP53sANZVZR7hZimJevJ7XvJ7cqbLARR2Fb
         1lLbyWrJJMpKnRxlj1KuP+BiRILUGqg3wFEnqeWX8bDWmhCvgQ6wEm5Nq6jhDmCQksPD
         0pPCiQf1bqDuCMmGdSohsScyY/04TNiAiipAq2YJ5TW7L4TCdvn2G0eD7LUouspEmlmz
         2nJLr9JZT2saNzJubLvplAH1ZTSEjeeI2kSLDlYl30QAJKZEcNpzLAVCS09jelgGczRL
         J3kg==
X-Gm-Message-State: AOJu0YxJAGTKJktQeJAyZPggm/OQY2YEInvDI953sI/kHLjBihG92vpr
        UMV1h1kAUtqFyYmxArHvdOwFOLjUYCzve4RDNgaONw==
X-Google-Smtp-Source: AGHT+IGF9r2WO+GcLD9n2tqoJoPLXbeAWeEt8cSGR+xGKtXm8xrGa2nXVi4fGPKYUHXAylIaFF3uLchmn/6Xdmhw1Eg=
X-Received: by 2002:a25:aa26:0:b0:d56:7556:93f1 with SMTP id
 s35-20020a25aa26000000b00d56755693f1mr7703142ybi.29.1692630251449; Mon, 21
 Aug 2023 08:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230818164314.8505-1-asmaa@nvidia.com> <20230818164314.8505-3-asmaa@nvidia.com>
 <CAMRc=Mccsc=RY5Evw4-k8LYDrfuxFoWsn6wajybY4SY_89fjNw@mail.gmail.com> <CH2PR12MB38950DCD03CFB45E4DB34E32D71EA@CH2PR12MB3895.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB38950DCD03CFB45E4DB34E32D71EA@CH2PR12MB3895.namprd12.prod.outlook.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 21 Aug 2023 17:04:00 +0200
Message-ID: <CAMRc=MeLfvM28czSrKpmMxmvbDeHi2rxtm+_FCKV24H9C-RBnA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] gpio: mlxbf3: Support add_pin_ranges()
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 21, 2023 at 2:55=E2=80=AFPM Asmaa Mnebhi <asmaa@nvidia.com> wro=
te:
>
> > > +MODULE_SOFTDEP("pre: pinctrl-mlxbf3");
> > >  MODULE_DESCRIPTION("NVIDIA BlueField-3 GPIO Driver");
> > > MODULE_AUTHOR("Asmaa Mnebhi <asmaa@nvidia.com>");
> > > MODULE_LICENSE("Dual BSD/GPL");
> > > --
> > > 2.30.1
> > >
> >
> > It's not clear to me whether this depends on patch 1? If only at run-ti=
me then I
> > guess Linus and I can take the two patches through ours respective tree=
s?
>
> Indeed from a build point of view, there is no dependency so you could ta=
ke the 2 patches through your respective tree. However, at run-time, the gp=
io-mlxbf3.c driver fails to load without the pinctrl-mlxbf3.c driver. Shoul=
d I add a "depends on" in the Kconfig? Then you will have to include both p=
atches in your tree.
>

Linus, are you fine with me taking this patch? It will not break the
build and with you taking the other one, next will be fine too.

Bart
