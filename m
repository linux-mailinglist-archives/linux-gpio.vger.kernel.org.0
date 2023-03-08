Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6FC36B1475
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Mar 2023 22:48:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbjCHVsg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Mar 2023 16:48:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjCHVsf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Mar 2023 16:48:35 -0500
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A5984D2AE
        for <linux-gpio@vger.kernel.org>; Wed,  8 Mar 2023 13:48:29 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-536cb25982eso329274167b3.13
        for <linux-gpio@vger.kernel.org>; Wed, 08 Mar 2023 13:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678312108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1Ycd9MmkZ2o31hnxqTTUh8Ie49xD0xPTPsqNUPpbcE=;
        b=Xv/o7k0Va9ra9mE73WP4AO/knHRACFl8S/3UJgsNtwkCJf4p/6EnG7TSDqfWb5S2ET
         QPTgv1Ack5u+Ior3itotdTnvjFht+PrMP/DvL3wcr087JMTqNVE+O9WDOFucCb4XyM7Q
         hptF+lMH7sS86/kenHZFjyYaXBphhsMtH7rrRI6v/F5opojCYr5tDerr+FJtlnZOqXri
         71LOH+W/uXXYopEz3FmDqnk2nZTqWkv79lesqYnr+vK0TNNYawdqW+pT8vp2Gx43Pyfi
         k3ueFZmbEacvw365C7gte1UCMA5m58UdlGLKHJ10PNw7Lg4k6eM21e3WQlSTv3fiSQSc
         e+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678312108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1Ycd9MmkZ2o31hnxqTTUh8Ie49xD0xPTPsqNUPpbcE=;
        b=n6/ZJ+aSufJlp2kqb4vMOF/x7dM3AQtzltaiOREt6sL0y+RbLBX2mGKLBqsXHFxzTI
         HwRZhZZi2MFGF9wMpVnrln8kpTd/6Kdn3kuLTHkWooKEWyqe50EzUx7PgYyQWaA9q3Vo
         8aFsHwcpGDpTm1xKEd8pbP0Af9ta53lq3gsqMvaPoQ9DGrmZHWrpoifNxdfx9JSyUe+J
         eWKP4ak+xAp27JOdHijatpqGxfZOyAb/nZaA6D23WsAHexwds3I7ta5HsWgOwFHAFOsV
         xXCFLwD0a4GhHZ47girXrCMDE/8O007foaudxsLul7T7X+DZHToC6zuzKgFS3/M+6tjE
         43zA==
X-Gm-Message-State: AO0yUKWiKaljEXRfCnNvHtri5vnkT14IdsBLNe58bKNsL0Y0hisYKhOX
        H4FaSfmPs+3EMxqqdT5zlfyJmmyAHrXGMs2+gUWMzQ==
X-Google-Smtp-Source: AK7set/wE7ucXTrmTPRWG6Tw0KsQfg4nawWkRLd5ehVt2euhHktMPD4UxK14To9kK895Sfm4gvFpqlYTabtJ0vdBjOM=
X-Received: by 2002:a81:af1f:0:b0:536:4ad1:f71 with SMTP id
 n31-20020a81af1f000000b005364ad10f71mr11945676ywh.9.1678312108521; Wed, 08
 Mar 2023 13:48:28 -0800 (PST)
MIME-Version: 1.0
References: <20230215-immutable-chips-v2-0-d6b0e3f2d991@linaro.org>
 <20230215-immutable-chips-v2-3-d6b0e3f2d991@linaro.org> <CACPK8Xc7ekzM9oeR7+fYuK8RfZ4jA8gpH=nUJ-OTp0XZoKwzHQ@mail.gmail.com>
 <861qlzz89j.wl-maz@kernel.org>
In-Reply-To: <861qlzz89j.wl-maz@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 8 Mar 2023 22:48:16 +0100
Message-ID: <CACRpkdZ_jEd5hZDGaTd+4Ns7o+oMiAh=pED==WemVCnC-csNqg@mail.gmail.com>
Subject: Re: [PATCH v2 03/16] gpio: aspeed: Convert to immutable irq_chip
To:     Marc Zyngier <maz@kernel.org>
Cc:     Joel Stanley <joel@jms.id.au>,
        Mun Yew Tham <mun.yew.tham@intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andrew Jeffery <andrew@aj.id.au>, Alban Bedel <albeu@free.fr>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Jay Fang <f.fangjian@huawei.com>,
        Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        William Breathitt Gray <william.gray@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 8, 2023 at 2:23=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote:

> > >                 girq->chip->name =3D dev_name(&pdev->dev);
>
> And this assignment will probably explode if, as expected, 'chip' is
> const and cannot be written to.
>
> I obviously didn't spot this when I first looked at these patches.

Dang, I'll fix, then I will go over the rest of the patches
and make sure I didn't miss any other of these name assignments.

Thanks,
Linus Walleij
