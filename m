Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B8CD64E090
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Dec 2022 19:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbiLOSVs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Dec 2022 13:21:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbiLOSVr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Dec 2022 13:21:47 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9312245EEF;
        Thu, 15 Dec 2022 10:21:46 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 22C7E61EAD;
        Thu, 15 Dec 2022 18:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A9EDC433F1;
        Thu, 15 Dec 2022 18:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671128505;
        bh=XNp2eew5F2osbBG2xYRCOh4UDwA6Ten/EhA6IgqIuao=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JG/NhBoCIYGRQpjeIP8hk6jwLjxSFUVH0Wf+8Phj/Fvkur9OOmkUBHgHEX2DAORMB
         bO3rrGRdeWLGMBAW+qMAYD0+iZsuR9iL+cy46r61tWp4PqDxwD2vuNfZ9g31R4W/rE
         xx83Vo6FeaHcqPJN6f3fpV5UqAMOTNT/AfIRn9rPZJalzvgzr/UYIdChq4ImGK3L9l
         ILKZcSvB/W/RmgATRKei5Gbe/xgbmMsOScC5mbl2USi0BjY5eAN9xopRoyTChkCaP6
         QnYPPnkzHS3D2hrtGqpGCm/Yl6XDbD5mHdPUBCHZIwJY+SWWcPwD9M9bvIK94dWJAw
         eCSbXDRLDJ08w==
Received: by mail-vk1-f173.google.com with SMTP id r3so5058666vkq.13;
        Thu, 15 Dec 2022 10:21:45 -0800 (PST)
X-Gm-Message-State: ANoB5pmbeQ12yBOP6bx5wAWSjaW/djliNBOjYFeVLRGc2nRxHD47Di1c
        KV6XnJybD25KLEb3dDda7ZdAbNbHvhbnKcdzig==
X-Google-Smtp-Source: AA0mqf7PfbXHfEttrFa9GFT4vHSUPgW6XNbo/+meHwDjz77IKJlN5e+Sxu0qpBuHYHEZBATiU0hRskdvaPbzlxDWoTE=
X-Received: by 2002:a1f:2c01:0:b0:3c1:1c3b:c4d9 with SMTP id
 s1-20020a1f2c01000000b003c11c3bc4d9mr1293947vks.19.1671128504420; Thu, 15 Dec
 2022 10:21:44 -0800 (PST)
MIME-Version: 1.0
References: <20221214095342.937303-1-alexander.stein@ew.tq-group.com> <CACRpkdbPy0krGYDdR4-Ga7tE=Wd6d2_KQ50b94VUvV=Zv=iBvA@mail.gmail.com>
In-Reply-To: <CACRpkdbPy0krGYDdR4-Ga7tE=Wd6d2_KQ50b94VUvV=Zv=iBvA@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 15 Dec 2022 12:21:33 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ0xY5e6mZB_smTCNm0HfsPTF64d0YgikmRx8FPzjxKCw@mail.gmail.com>
Message-ID: <CAL_JsqJ0xY5e6mZB_smTCNm0HfsPTF64d0YgikmRx8FPzjxKCw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] gpio: Add gpio-delay support
To:     Linus Walleij <linus.walleij@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 15, 2022 at 7:16 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Dec 14, 2022 at 10:53 AM Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
>
> > thanks for the feedback I've received. This is the reworked RFC for
> > adressing a platform specific ramp-up/ramp-down delay on GPIO outputs.
> > Now the delays are neither specified as gpio-controller nor
> > consumer-specific properties.
> >
> > v2 is a different approach than v1 in that it adds a new driver which will
> > simply forward setting the GPIO output of specified GPIOs in OF node.
> > The ramp-up/ramp-down delay can now be actually defined on consumer side,
> > see Patch 1 or 3 for examples.
>
> I really like this approach, it looks better than I imagined.

It seems over-engineered to me. So far no comments on my 3 suggestions either...

One is to just use some GPIO flag bits. Say 4-bits of GPIO flags
encoded as power of 2 ramp delay. We have to pick the units. For
example, 100us*2^N, which gives you 200us-3.2s of delay. Anything less
is short enough to just hard code in a driver.

Rob
