Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 830695BFFE6
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Sep 2022 16:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbiIUObE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Sep 2022 10:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230176AbiIUOal (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Sep 2022 10:30:41 -0400
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D6179350B
        for <linux-gpio@vger.kernel.org>; Wed, 21 Sep 2022 07:30:19 -0700 (PDT)
Received: by mail-vk1-xa36.google.com with SMTP id v192so3271412vkv.7
        for <linux-gpio@vger.kernel.org>; Wed, 21 Sep 2022 07:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=FGay5apzpsZuEN7mWfQ9zRvPnKy+5B+qwS7/nVdsxQY=;
        b=eaVLc5HYs0FAVTU+wuW/yIDF5ke4M4l+K9f+8LDgp53m2CAtEZevMP4PZX4pvSiY6h
         zmHUoPzzE9SDgB3SrDhg5K3tAj+SfZiUGg0At5iABombHEtJwFw2xLh8RQyuVhBcy1jE
         8SXOjxC59ekHkU/fwJr+J2W6dYuJrxtFgmlQPj9AZA4OEqSEzaG6/rOBi+43Cij/MiG0
         uVybJSjfX14YRGe9RhuBcuuLIR2uCRVaKmTSvmAo4oB3uxCrBu4OjoU/iSxP5/+54B5y
         KXFWTM9Q2/OG7mBs3C1IK0ZMuIxcE7FwiJX7LXWfRz75aMibIxVM8ua8WNmDCvx3CoN5
         o5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=FGay5apzpsZuEN7mWfQ9zRvPnKy+5B+qwS7/nVdsxQY=;
        b=qhqzI20QC4glMbScV7xAy47bKOYdFa6gjxSfqAyEeyi1E7ei8lMUoS1gdKLzlHQIex
         eLwxUE/Lli/lZMfPn+v46jqTAkjyATZynrx29UNO39gmWW8NV4PH9Q2hXAEXycF0Ha9+
         lgc0HqRGdaaxeWAxHAUNbrG6qdAf8H1FOrtrqMhSRrZ9/mGt5FtFRIJ0k4D0DNVGRxTx
         juDe4D17SSLOxSkyJOYEBkARbicwmo6vpASuflLclFKAkb7J0t3oCo5BtygQ/nNbFbHr
         8MiT6OHg/w7EZn3vm39QVYCkpDZE0xSRJgNJlYJErhdZpLJ0pyoqYZA8+rkombdBo//l
         s41A==
X-Gm-Message-State: ACrzQf3Yh+nsdOSYMEe+T5RQsxSyr4xk2KEtKbUCX4AcQa6Y7rtzfnFg
        RGyt2N5Z9j5CW1AjxZcygsLYXtlDylok9xHkT+I9lg==
X-Google-Smtp-Source: AMsMyM6fdFBmXYaKgwGq5LUD9qbO4RaOujpw0CAEX4g8DPIPbwgDZ/HP2kogWDGt9XFw1zM7LBSect07N0L/nrax/qs=
X-Received: by 2002:a1f:aad2:0:b0:3a3:4530:b88 with SMTP id
 t201-20020a1faad2000000b003a345300b88mr6839949vke.15.1663770618571; Wed, 21
 Sep 2022 07:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <632a0af0.170a0220.966bf.0c66@mx.google.com> <CAOMZO5BCGpKVr75qDncDW4-eVLWeDJoPZft5Lh4_ikVHGLb1wQ@mail.gmail.com>
 <6354cef8-7740-cd13-1683-eca68f9ec332@collabora.com>
In-Reply-To: <6354cef8-7740-cd13-1683-eca68f9ec332@collabora.com>
From:   Guenter Roeck <groeck@google.com>
Date:   Wed, 21 Sep 2022 07:30:07 -0700
Message-ID: <CABXOdTcc4cRSoTRZL04S_6esEp5GTwyT8TGOrrRO1gaTQjir7g@mail.gmail.com>
Subject: Re: next/master baseline: 539 runs, 389 regressions (next-20220920)
To:     kernelci@groups.io,
        Guillaume Tucker <guillaume.tucker@collabora.com>
Cc:     festevam@gmail.com, linux-next@vger.kernel.org,
        kernel-build-reports@lists.linaro.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        "kernelci-results@groups.io" <kernelci-results@groups.io>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

 On Wed, Sep 21, 2022 at 2:19 AM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> On 21/09/2022 04:48, Fabio Estevam wrote:
> > Hi,
> >
> > On Tue, Sep 20, 2022 at 3:48 PM kernelci.org bot <bot@kernelci.org> wrote:
> >>
> >> next/master baseline: 539 runs, 389 regressions (next-20220920)
> >
> > Does anyone know which commit caused such a massive regression?
> >
> > Looks like it is gpiod_get_index related.
>
> There's a bisection report, does it look like it?
>

Yes. The problem has been fixed in next-20220921.

Guenter
