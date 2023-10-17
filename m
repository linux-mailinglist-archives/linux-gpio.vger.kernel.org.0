Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3277CC79E
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 17:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344154AbjJQPkg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 11:40:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343939AbjJQPkf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 11:40:35 -0400
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE2B9B6
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 08:40:33 -0700 (PDT)
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-7b5fe8ab5f9so2100866241.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 08:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697557233; x=1698162033; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONXpu3mRyuRAO2PDOOu8LjsezLd/XCTvRWX+1RDIEN8=;
        b=O7+kWg8p1bfxebjuYRawDAqDCHAu6jud/W8vx+4y9BGBkQAigIhcYk8P1S9IQh3n38
         GzNJV2vMmXQyCNnPIs7ZxioYz4oPyOGHAVFVLCXFaQzyvt6gAwNrVy1uV0wwXwnlGaMw
         tDRkyKs8LHCYkjPpwXRt5Lrbhbt7j4essdHkJQXCyO/dDYeII8wgLL88rxChUa2fMfZn
         34ZKH+BJAmcOjxQNr/IEomtRSojMkT2BWw0aq4UPpCXdoPM+LzxNSbzh+gVBOs7COj1q
         kabtZp1GoQAHXXPPHR2lDB+1OFyk46bZCz9mXexIP/TYDVqN0rPykmvnxpqBR2b9512v
         q/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697557233; x=1698162033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONXpu3mRyuRAO2PDOOu8LjsezLd/XCTvRWX+1RDIEN8=;
        b=uIboYy7waUD0DkPsr8R/ID0Nxgvcwx7aciFn7KWECZSV4+4IejxYJC+fjohVZ8Gsah
         jj8nlOLYJ9X2IDoltszEQVy/kwNJpudAfnUMVmwF4rh2Loec89eRAjeHJK6RE4P/FVw7
         W2WpxYncS4ICVqm5JuXkv/6ISp1GbLP+2FeSIYn6OAEbWAkJ63AclwBDb+I1vfxkbyHL
         JfcfE4Ti6Us537UEwPh/DXiM8IX02zrPCrLpRwOvclG+Ljvmti2aEAySwMQrIZMcn5o/
         iB1dlh8iDWTD1caZZ0RB9BONo2WNYL4IzFdjbD/2jCdJi2+u5LQTdH2MR4mqMHRboeJp
         kGQQ==
X-Gm-Message-State: AOJu0YylOL034Qi7DIG37ds03IVan4svvsDrl7QcNc17boFykjRQmfYu
        omj0P6gg0OEoc9bjUJh/9SRhpm5PnV6qIWfaeiR4oQ==
X-Google-Smtp-Source: AGHT+IHU/WbmlLmL1QQdaRSv6sDO/jEKiPetQv2efac7ubXQNjQafVdCayAu7CHbdauSij/xKzh7qG9vLxhLLsm+pts=
X-Received: by 2002:a67:c208:0:b0:452:856c:471f with SMTP id
 i8-20020a67c208000000b00452856c471fmr2525884vsj.35.1697557232368; Tue, 17 Oct
 2023 08:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <20231016151848.168209-1-phil@gadgetoid.com> <20231016151848.168209-2-phil@gadgetoid.com>
In-Reply-To: <20231016151848.168209-2-phil@gadgetoid.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 17 Oct 2023 17:40:21 +0200
Message-ID: <CAMRc=Mec6=wFAMeQwUaxuj15fMYC4U+Mc_byT1RQUfXRgRFHLQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v4 1/1] bindings: python: optionally include
 module in sdist
To:     Phil Howard <phil@gadgetoid.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 16, 2023 at 5:18=E2=80=AFPM Phil Howard <phil@gadgetoid.com> wr=
ote:
>
> Optionally vendor libgpiod source into sdist so that the
> Python module can be built from source, even with a missing
> or mismatched system libgpiod.
>
> Add optional environment variable "LINK_SYSTEM_LIBGPIOD=3D1"
> so that the sdist package can optionally be built and
> linked against a compatible system libgpiod.
>
> eg: LINK_SYSTEM_LIBGPIOD=3D1 pip install libgpiod
>
> Update build to add an additional sdist target for upload
> to pypi. Call setup.py with "GPIOD_VERSION_STR" set, which
> triggers a vendored package build. "GPIOD_VERSION_STR" is
> saved to "gpiod-version-str.txt" and included in the sdist
> for standalone builds.
>
> "GPIOD_VERSION_STR" must be specified in order to produce
> a standalone buildable sdist package, this requirement
> implicitly preserves the old build behaviour.
>
> Signed-off-by: Phil Howard <phil@gadgetoid.com>
> ---

I just realized one issue with this. Even if we indicate the version
of libgpiod as v2.0.2 using the environment variable but actually
create it from the master branch then the build-in code will really be
the development branch not v2.0.2 stable release.

This is precisely the kind of issue that linking to system lib allows
to avoid. :)

Anyway, maybe we would need an additional environment variable that
could be used to point setup.py to the actual source tree we want to
use, which may be different from the tree we're using to generate the
sdist package? Typically we'd want to release the pypi package with
the most recent stable release of libgpiod.

Bart
