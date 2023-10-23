Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDD87D3AA2
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Oct 2023 17:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbjJWPYi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Oct 2023 11:24:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjJWPYh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Oct 2023 11:24:37 -0400
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E7C293
        for <linux-gpio@vger.kernel.org>; Mon, 23 Oct 2023 08:24:35 -0700 (PDT)
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-49d0ae5eb7bso1352330e0c.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Oct 2023 08:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1698074674; x=1698679474; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eS5yZMf6aOrpDv0XLPMtF7Dt0pjF67zJHQoexznrhaI=;
        b=sD+p4C+p1MdMmwaDsR3Gaxg+y8FFFCB7Bo7qHg1fCjQm8WHM+COSNUYkBpcrCKSha+
         NNGpxVFaBbw0Y/O9QqgJ6CFzgJeq3bcczCwiw5dBz4aBJfRSC8eCIPjZ2qlltUAQSRCh
         8Ybr0XAeMtdDBzlmbFV/u/Ibrk4pnXLDDrYGzML57AIFyvYyiLfGpCDzhlPQGtW8WMgz
         uOx0iadv+Td3KCfUxNXdhXXbFVwElOEPxdygQJMVRa7KuaFe4giNRlb5bLqmTpS8I4JN
         sHUTK4USFUn9p5smQue3MIEzx93SDshv5d+p9f+fz4JfDdwngroX+A52NFFoJk1XgAzr
         Qszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698074674; x=1698679474;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eS5yZMf6aOrpDv0XLPMtF7Dt0pjF67zJHQoexznrhaI=;
        b=tc1ZHot5BE7A4TtPdBXRREBfleCQDQnR/06MdeQs4/6apEMP2NTw/HIBi1wXr2oA4F
         3eXIR9A4cVB1DvVACQZNgbCJy/0oMr0s7e/Eo4PsU2Wa44tm/6ZTi+duxs8i+rtd1ErK
         p3CCxquPlSomFtqGWEA7aUQyJ9OP1P3aZN7KLVs+O3aX07lMUgG79ZYGgewEn00w/JAM
         n6KPaJiJUOvaEO/og1iuDdsKRerpHwAD20pSLj2or7blBdC/2txy6AXzKK4ehlaKM1w8
         vjZpeyksjS+A0IxblsACmhONvDjqk1LJPaQja6/J02glr2FuYUMzSlaPsYLtleTWXm14
         WTbA==
X-Gm-Message-State: AOJu0YyCN8PDHHnX7KlZ8WTp8hxqXshBX8JJLqYPJjoUPLziecXM2MH3
        QVvW35/RKTG0CAbaLOkfzx3COQSlUNaR4GLOwCvW7A==
X-Google-Smtp-Source: AGHT+IHiEDnjudXUFbHEKen1/40wh8thm3d31Sl3UjjyYgWSXc+rSMB493DpR9z4C+mcL5P7ZxjFi7ZHQhg88gdg+s8=
X-Received: by 2002:a1f:a2c4:0:b0:49d:d0af:771a with SMTP id
 l187-20020a1fa2c4000000b0049dd0af771amr7196384vke.6.1698074674524; Mon, 23
 Oct 2023 08:24:34 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Oct 2023 11:24:33 -0400
From:   Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20231020145704.413229-2-phil@gadgetoid.com>
MIME-Version: 1.0
References: <20231020145704.413229-1-phil@gadgetoid.com> <20231020145704.413229-2-phil@gadgetoid.com>
Date:   Mon, 23 Oct 2023 11:24:33 -0400
Message-ID: <CAMRc=MdbzAmBc7-PndZa0Nx2pT0-cco_B2mptUJmyOw27QsEog@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v6 1/1] bindings: python: optionally include
 module in sdist
To:     Phil Howard <phil@gadgetoid.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 20 Oct 2023 16:57:04 +0200, Phil Howard <phil@gadgetoid.com> said:
> Optionally vendor libgpiod source into sdist so that the Python module can
> be built from source, even with a missing or mismatched system libgpiod.
>
> Add two new environment variables "LINK_SYSTEM_LIBGPIOD" and
> "GPIOD_VERSION" to control what kind of package setup.py will build.
>
> In order to build an sdist or wheel package with a vendored libgpiod a
> version must be specified via the "GPIOD_VERSION" environment variable.
>
> This will instruct setup.py to fetch the tarball matching the requested
> version from mirrors.edge.kernel.org, verify the sha256 signature, unpack
> it, and copy the lib and include directories into the package root so they
> can be included in sdist or used to build a binary wheel.
>
> eg: GPIOD_VERSION=2.0.2 python3 setup.py sdist
>
> Will build a source distribution with gpiod version 2.0.2 source included.
>
> It will also save the gpiod version into "gpiod-version.txt" so that it
> can be passed to the build when the sdist is built by pip.
>
> Requiring an explicit version ensures that the Python bindings - which
> can be changed and versions independent of libgpiod - are built against a
> stable libgpiod release.
>
> In order to force a package with vendored gpiod source to link the system
> libgpiod, the "LINK_SYSTEM_LIBGPIOD" environment variable can be used:
>
> eg: LINK_SYSTEM_LIBGPIOD=1 pip install libgpiod
>
> Signed-off-by: Phil Howard <phil@gadgetoid.com>
> ---

Eh... we have one more thing to figure out here.

gpiod_line_request_get_chip_name() has been added to the library and supported
in python bindings in current master but hasn't been released yet. So when I go

    GPIOD_VERSION=2.0.2 python3 setup.py sdist

it builds fine but then I get the following when trying to import gpiod:

>>> import gpiod
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python3.11/site-packages/gpiod/__init__.py", line 10,
in <module>
    from . import _ext
ImportError: /usr/lib/python3.11/site-packages/gpiod/_ext.cpython-311-x86_64-linux-gnu.so:
undefined symbol: gpiod_line_request_get_chip_name

I can of course make a libgpiod v2.1.0 release - we already have quite a bit
of new material but we should probably add something like a "minimum libgpiod
version" switch somewhere.

Do you have any ideas?

Bart
