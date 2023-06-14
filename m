Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3172372F811
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jun 2023 10:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235216AbjFNIlF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Jun 2023 04:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbjFNIlC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jun 2023 04:41:02 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9EDC1BC6
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 01:40:58 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f739ec88b2so2873025e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 01:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686732057; x=1689324057;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bbld/wjxQRMAWIwDuadOHC0o9sE/B70I+LhOHCURQIg=;
        b=VOl+J5cHJ6EZALtQ/nsQf7ovwYCevrJBusiIvP0jSkI0Q/ei0n8cH7s8WcKuGMBpVW
         u7mEWEdZok1c2C4cudHH2AXd9cMPi9lr0b3tOnJyKUgYPukN97MteYUdJl1vRa23E6Fw
         PfQDV+PtsXpxaFm5F35QvN23rPtB3/U8+97wxg1l7/Fif/RQH0CEkG3pQvJpht/PZkgZ
         QYoHNF/zy6VcZ6m7+mHEc9hfOI0BTPyKNXL9niXjtae8U3PC5sn08s5eeyvfz3t0sxav
         wrTVIFtjzoowGaYSNPLrMs8U4fnDtIaK8anD6iG22PEV6dUdxAZMgHmItCawIoKa8won
         qvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686732057; x=1689324057;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bbld/wjxQRMAWIwDuadOHC0o9sE/B70I+LhOHCURQIg=;
        b=YZyyVPRdIWoQwWMc1tkLfRaHq7NISspnLe0OKi5dLc0F6JHpbx7bmtT/fWVfeadPxt
         d0B5gzELt5ZGAhSFrknnpxvKreh6BaXeJgLG9x2fKLPlkt6BmYhxxkKzPeX6iHdCmejs
         jvQwjPgnEC3G25msNHpTcCOKgvGSUVpIIwpt547DJahrPNb4qALO/fsdQ1NJZTGS/8z8
         D0DwIBKyEj7T3vYEDgBcqQNI9GEjq9nvHMCv8VUoFaCue27Iq5byVGXfy/rnHZXi2cBN
         hxND4CxeYPzUmUDlGK4fYV52jcSyxbD5Mnz3+OkK4Oefje17Hzcqy7snM/DVocNc2K6X
         YzQg==
X-Gm-Message-State: AC+VfDzAQO/q8T/891dRIyzjrC/5gtaSn2MFbaRwBQS3IfiUsXCLD7NL
        hAhp7FkDAMwKb1o8IriAD1Hh9Q==
X-Google-Smtp-Source: ACHHUZ5pBzA3EzCNdN8Scl79APK+MigJLwNtLx3dgPxcbyqCXPpAftlxxRwMPLLahQtJrGpgjmoaxQ==
X-Received: by 2002:a1c:7203:0:b0:3f7:f584:579b with SMTP id n3-20020a1c7203000000b003f7f584579bmr9210069wmc.9.1686732057138;
        Wed, 14 Jun 2023 01:40:57 -0700 (PDT)
Received: from localhost (i5C740811.versanet.de. [92.116.8.17])
        by smtp.gmail.com with ESMTPSA id y23-20020a1c4b17000000b003f736735424sm16623613wma.43.2023.06.14.01.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 01:40:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 14 Jun 2023 10:40:56 +0200
Message-Id: <CTC8M1AAQDLI.DNPMW5PQHFNK@fedora>
Subject: Re: [libgpiod][PATCH] bindings: rust: fix clippy lint warnings
Cc:     <linux-gpio@vger.kernel.org>, <brgl@bgdev.pl>
To:     "Kent Gibson" <warthog618@gmail.com>
From:   "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.14.0
References: <20230612154055.56556-1-warthog618@gmail.com>
 <CTC81IMWHW2L.28NQLXAIFP60L@fedora> <ZIl6X8YAUHS/n5s8@sol>
In-Reply-To: <ZIl6X8YAUHS/n5s8@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed Jun 14, 2023 at 10:29 AM CEST, Kent Gibson wrote:
> On Wed, Jun 14, 2023 at 10:14:08AM +0200, Erik Schilling wrote:
> > On Mon Jun 12, 2023 at 5:40 PM CEST, Kent Gibson wrote:
> > > clippy from Rust 1.70 reports a host of warnings due to casting and t=
ype
> > > conversions across the FFI interface to libgpiod.
> > > These casts and conversions are required to support old versions of R=
ust
> > > that do not support recent Rust FFI extensions.
> >=20
> > Could you elaborate which extensions are relevant here? Would it be
> > realistic to just update the minimum Rust version instead of needing
> > to include these suppression directives?
> >=20
>
> Types were added in core::ffi[1] in 1.64 for just this purpose.
> e.g. c_uint[2]
> Though c_size_t[3] still remains in Experimental.
>
> And I guess the clippy lints followed soon after.
>
> Wrt setting the MSRV, but I assumed not, hence the allows.

For me bindgen seems to generate usize of size_t, thats why I asked.
Does that depend on the Rust version somehow? Or more concretely:
When will things like `gpiod_line_config_get_num_configured_offsets`
not get translated to `usize` so that we need a cast?

On my end (with latest toolchain and nightly), I do not see any
clippy warnings with `cargo clippy`. How exactly did you produce those
warnings?

