Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6121B7D6C5B
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Oct 2023 14:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234952AbjJYMvQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Oct 2023 08:51:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234913AbjJYMvL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Oct 2023 08:51:11 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31E5D90
        for <linux-gpio@vger.kernel.org>; Wed, 25 Oct 2023 05:51:09 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-7b6043d0b82so2042913241.1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Oct 2023 05:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1698238268; x=1698843068; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UD2bA+brsfksRic6vpNY/4B78uEzS0K5ZQ3PiurXQsk=;
        b=fF3ONyorTzObo/xyNpZ+/Ib2coT5EGoVChG5fieCqEdpsXX+PEILPh8qx0zju8OYMW
         wEvf0zTzcmSVWBjyk/rDf+FLSw1FXcgoy0r9qdhhvnuux5IT8//PufItK4fe+aTbIQj4
         8MDTcQWtZq/iNHUOvSIxrjxEJq6ALKWbKStcW2JSXoliq1lQndDJ9zAYa/3zqrrs8bvO
         V6Nk0/axBd2c8rgCkScPQQDr4pkbWS2Cp/H9N/AjWHTRDx5eEHDPXWcqEiflYlq8s22V
         054xRNuHT2Gg0mfbbHfNzHPXhQSXVaAF2tJF48rsekSLNtyT4AxndbR224UixL9pRsGc
         SP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698238268; x=1698843068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UD2bA+brsfksRic6vpNY/4B78uEzS0K5ZQ3PiurXQsk=;
        b=aX9eMd0nlTcrme0RvUGfJmhWSXtU7BYa2ny3n6b/9AcBPwDFuG2ceermk2J3aX94r0
         FcruCbZYeTtAH1hUUnZQAT89YjwDzHUd4ZVBecEg26Ngg7mXJDJhyU7N7AHrQ3rF2gTR
         1Zv2Px46coAsbnsfjjVOTnSXbZ+Lp4MqbGgsJI+jHWqbEX71fAFE4V7kfMD5/11dsj9F
         OA92iMiFUsP6p761QcL+SnIrErsVxWRXmw8RxchN9VUSiYy/+Q25et+uMFE9NA5tgaS8
         tK7Ec95YeDs2mpsoVTT+a14sZZ5DP+9SUMIplJHD+cdbU+f/yWpTHLUXoeY5hg54RjsO
         HA/Q==
X-Gm-Message-State: AOJu0Yw0m7R1oxgbQ2ZqE/ZE1MhPr4sJgA5n9bdRPqDOaFMhJcSl8v6Q
        niklWj/J2CBpSKDhWgWbXfovsVfAEK1zoaCY3vWiVQ==
X-Google-Smtp-Source: AGHT+IHfWVQm0LIY2CwRBBDMR4XBayh/Kr2HBSeXRYUQGCugyUlofXIKQ1A996SkQW9Fyk3wTjMu9ASPoBQ9LpHBHFc=
X-Received: by 2002:a67:c885:0:b0:457:bf90:54f6 with SMTP id
 v5-20020a67c885000000b00457bf9054f6mr15508941vsk.25.1698238268234; Wed, 25
 Oct 2023 05:51:08 -0700 (PDT)
MIME-Version: 1.0
References: <20231025082707.821368-1-phil@gadgetoid.com> <20231025082707.821368-2-phil@gadgetoid.com>
In-Reply-To: <20231025082707.821368-2-phil@gadgetoid.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 25 Oct 2023 14:50:57 +0200
Message-ID: <CAMRc=Mdy3o1xPG6QHjp_p9aojVdZw3NgUO_WGjAe7W59wBPVDA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v9 1/1] bindings: python: optionally include
 module in sdist
To:     Phil Howard <phil@gadgetoid.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org
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

On Wed, Oct 25, 2023 at 10:27=E2=80=AFAM Phil Howard <phil@gadgetoid.com> w=
rote:
>
> Optionally vendor libgpiod source into sdist so that the Python module ca=
n
> be built from source, even with a missing or mismatched system libgpiod.
>
> Add two new environment variables "LINK_SYSTEM_LIBGPIOD" and
> "LIBGPIOD_VERSION" to control what kind of package setup.py will build.
>
> In order to build an sdist or wheel package with a vendored libgpiod a
> version must be specified via the "LIBGPIOD_VERSION" environment variable=
.
>
> This will instruct setup.py to verify the given version against the list
> in sha256sums.asc and ensure it meets or exceeds a LIBGPIOD_MINIMUM_VERSI=
ON
> required for compatibility with the bindings.
>
> It will then fetch the tarball matching the requested version from
> mirrors.edge.kernel.org, verify the sha256 signature, unpack it, and copy
> the lib and include directories into the package root so they can be
> included in sdist or used to build a binary wheel.
>
> eg: LIBGPIOD_VERSION=3D2.1.0 python3 setup.py sdist
>
> Will build a source distribution with gpiod version 2.1.0 source included=
.
>
> It will also save the gpiod version into "libgpiod-version.txt" so that i=
t
> can be passed to the build when the sdist is built by pip.
>
> Requiring an explicit version ensures that the Python bindings - which
> can be changed and versions independent of libgpiod - are built against a
> stable libgpiod release.
>
> In order to force a package with vendored gpiod source to link the system
> libgpiod, the "LINK_SYSTEM_LIBGPIOD" environment variable can be used:
>
> eg: LINK_SYSTEM_LIBGPIOD=3D1 pip install libgpiod
>
> Signed-off-by: Phil Howard <phil@gadgetoid.com>
> ---

This now looks good to me. I'll leave it here until Friday and if
there are no objections (Kent, would you mind reviewing this one?),
I'll apply it to the master branch, do the v2.1 release of libgpiod,
then create the v2.1.0 release of python bindings (with sdist
packaging libgpiod v2.1) and upload it to gpiod @ pypi. Hopefully this
will work correctly.

Bart
