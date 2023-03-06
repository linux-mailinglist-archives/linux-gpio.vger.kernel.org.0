Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 227606ABA43
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 10:45:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbjCFJpn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 04:45:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjCFJpm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 04:45:42 -0500
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DE2E233E6
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 01:45:37 -0800 (PST)
Received: by mail-vs1-xe32.google.com with SMTP id f31so8548587vsv.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Mar 2023 01:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678095936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPVmKfCaANAjZJrIKOr0qCt2jk/eMM7c0eTy1k/k5gg=;
        b=Qvlq96a6Xt557k3cWIbyTrFocT5TD3kvPiOJEyKsEYXHki/ydXIWb2xmvhOADfHM/a
         ZoGLvKnYnlyQZpRrx0UYfqDE79QWne7tS+wGjH3fFoDuQ5ZJ5CmkHiATukwxLalT0Ayb
         PURl0e6yQ9jGHTN4T8gRw9CvaVGYzRx0RQ/z/KrlyH7+U7SDiDcWJgLBWxPbVl2hxLDf
         +0na7w4aiM1cTDxKYmfybSbOTBA8+6QtHzIroNSoVhdrM5uJIF46wO/tinCezU0lhjGV
         t0iZs0yjR6dlZXXsi2PKQlvyKqHCDXCXafXatn/PXG68WmipzPRjaDCX1o2yvfD8l3DS
         YuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678095936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPVmKfCaANAjZJrIKOr0qCt2jk/eMM7c0eTy1k/k5gg=;
        b=mNs9clwHg1GvvpFLRBjOTJGg7LgXM72Ig7m4Yh7aCd0zfZnLgzoMeFj+kSLT5tAE92
         iMpzNpSpCOFBUpQas1PLp/yf+hx8mwo6sy13IDYTmVcuQhG4iof66fJvShws5j+FecVw
         nznZf7/Nw6cYIG+bqFYpvcs+qzlbbkR2yV9iSHnAhuUg8/LNEgeuSDa6F3ZSe4vGIEKX
         CTkryJhw6VrLqlVTDrs3pCywdQXxdxHRHuWoAdVFtIiSaySFTCtsfQgfRQVbji1x4ktL
         Z9lJI8MAn7nrMKKd8h9tccyTG5rjk5JH21rynveT9WGQW89q2rqLHskTaog/nePo8BHM
         v1jA==
X-Gm-Message-State: AO0yUKWzZGC2UyLpct19Y6lPnFOvESW7o/3P6YFyx8+gqDQSvSKyC5+n
        a9jB5u2F9FNAC1ten+3Mic4zlQBCIUWhMt1b92eFUw==
X-Google-Smtp-Source: AK7set/RpdGGWkoX++R1aG1uCQFgLfDv9PvyD88Er+OW9sYyv/vmNBtHI4pf/cR9PFe+u5yoCix2+PbH7+znkii6CIA=
X-Received: by 2002:a67:fe14:0:b0:412:ba5:8002 with SMTP id
 l20-20020a67fe14000000b004120ba58002mr11209499vsr.1.1678095936307; Mon, 06
 Mar 2023 01:45:36 -0800 (PST)
MIME-Version: 1.0
References: <20230302081711.27334-1-zhuyinbo@loongson.cn> <20230302081711.27334-2-zhuyinbo@loongson.cn>
In-Reply-To: <20230302081711.27334-2-zhuyinbo@loongson.cn>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 6 Mar 2023 10:45:25 +0100
Message-ID: <CAMRc=MeF8mrmLN3Sr62xFFoauaohrABC5=s622S-vnV8mZduHw@mail.gmail.com>
Subject: Re: [PATCH v12 2/2] gpio: loongson: add gpio driver support
To:     Yinbo Zhu <zhuyinbo@loongson.cn>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Liu Peibao <liupeibao@loongson.cn>, wanghongliang@loongson.cn,
        loongson-kernel@lists.loongnix.cn,
        Hongchen Zhang <zhanghongchen@loongson.cn>,
        Juxin Gao <gaojuxin@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 2, 2023 at 9:17=E2=80=AFAM Yinbo Zhu <zhuyinbo@loongson.cn> wro=
te:
>
> The Loongson platforms GPIO controller contains 60 GPIO pins in total,
> 4 of which are dedicated GPIO pins, and the remaining 56 are reused
> with other functions. Each GPIO can set input/output and has the
> interrupt capability.
>
> This driver added support for Loongson GPIO controller and support to
> use DTS or ACPI to descibe GPIO device resources.
>
> Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
> Signed-off-by: Hongchen Zhang <zhanghongchen@loongson.cn>
> Signed-off-by: Liu Peibao <liupeibao@loongson.cn>
> Signed-off-by: Juxin Gao <gaojuxin@loongson.cn>
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied, thanks!

Bart
