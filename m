Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56C11745A90
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jul 2023 12:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbjGCKtI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jul 2023 06:49:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjGCKtH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jul 2023 06:49:07 -0400
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D2AEB2
        for <linux-gpio@vger.kernel.org>; Mon,  3 Jul 2023 03:49:05 -0700 (PDT)
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-786e637f06dso1423629241.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jul 2023 03:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688381344; x=1690973344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTcyPRBpPQseicvpmxm8Aw7qDHwfhaHrFIcuymT3moU=;
        b=KJNWaQflqucrLFhsjOhe4Silrt5pMZ7ePUfK/KdoZIV+32opXgeC4IFT/8pTSlYNEt
         I5HeP82+z+ASILSgfk4MJFS5HOHPqnjvNDKSVDGCp3vpcyEBCa4nKEvoY3IK1/+i2Tag
         4BIHxfSZ3+dhWz2+Ns9JSvD1N3pLSzOL2yGNuc0DwWfkiQux5zJhRFSPZin8KtY7DqGc
         4VNTwtZxFtFblXWcl4sdVeSuYMuYk7O2fG5EhH989OqQ82daeaBqrOZBkMq9rKIr0dx+
         xetPe3Ht/FvmLBblcnHOvWlPQXhgLg3CAPUboSkTf2GOMU3yy2d0W/sav9TX5iRf5XR2
         15xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688381344; x=1690973344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTcyPRBpPQseicvpmxm8Aw7qDHwfhaHrFIcuymT3moU=;
        b=Sf7pPG4X04QPAUH30+lqPYdxP3al2mWX3mqrXoYM969VlXqd/qy9RXUa671yXilFm4
         9L5z4XteX7kr803AXl6fya2qkhmnkEfnuzXjXMqABNQ12ZMj4RHyCMMGuVGjHYDkEeFu
         Ju6REFOggKdpQgc/f6IJ9ndWOpBMfG6L/XGhAZGLfVFjfJS35oH9dMhPVSmp9aT0pAUk
         AELPoySJ4WsT10BADqejd/BWZAqt6xMFq/N6XJc9f1Nw8NWbiRmnFyw1Hk0wn42Vz6dE
         z+7ONbOPYrqzG/O85fUNcudGZ/JGp3RJfM95KNqRWwrklEw0Y7FnsqqDmm1YbKuaYdxd
         C3jw==
X-Gm-Message-State: ABy/qLYIcUEXV5/qvDbjPoR9fG7fRzAmfA7t8aPFXNQRDyOXkgXd+jT+
        irL6wqKJK+1FvB0COmQMhVr+PyAT3bXgvK2KMGffNh2P26jxO3uh
X-Google-Smtp-Source: APBJJlGODQyTrgLjyng2XqwGQMsx9e2z9Oig3UA4D8br+vjHMHRaW3Bb/GXl+cuLyLywD/5w84oDn1LYnddlfXWq6ZM=
X-Received: by 2002:a05:6102:24b:b0:43b:5615:9ec0 with SMTP id
 a11-20020a056102024b00b0043b56159ec0mr4494898vsq.1.1688381344538; Mon, 03 Jul
 2023 03:49:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230703-rust-readme-v2-0-ba7d7f04bed6@linaro.org>
In-Reply-To: <20230703-rust-readme-v2-0-ba7d7f04bed6@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 3 Jul 2023 12:48:53 +0200
Message-ID: <CAMRc=Mf33QN6=4spLwJWvvnALesR8Yb77uwEt3yWdMkyrNaeeg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 0/2] bindings: rust: add README for crates.io
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 3, 2023 at 9:20=E2=80=AFAM Erik Schilling <erik.schilling@linar=
o.org> wrote:
>
> The READMEs are displayed on crates.io for published crates. This tries
> to provide a little more context there.
>
> To: Linux-GPIO <linux-gpio@vger.kernel.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
>
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
> Changes in v2:
> - Fixed typo (thanks Viresh!)
> - Added missing sign-off to 2/2
> - Link to v1: https://lore.kernel.org/r/20230630-rust-readme-v1-0-1ce9e6f=
7985c@linaro.org
>
> ---
> Erik Schilling (2):
>       bindings: rust: add README.md for libgpiod crate
>       bindings: rust: mention the libgpiod crate from libgpiod-sys
>
>  bindings/rust/libgpiod-sys/README.md |  3 +++
>  bindings/rust/libgpiod/README.md     | 25 +++++++++++++++++++++++++
>  2 files changed, 28 insertions(+)
> ---
> base-commit: 37b3ac4bb5a35c0e84a98d95124f064ca038c4d1
> change-id: 20230630-rust-readme-6560244a713d
>
> Best regards,
> --
> Erik Schilling <erik.schilling@linaro.org>
>

Applied, thanks!

Bart
