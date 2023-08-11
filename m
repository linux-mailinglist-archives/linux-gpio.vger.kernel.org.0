Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 206C8778F2F
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Aug 2023 14:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbjHKMUS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Aug 2023 08:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbjHKMUP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Aug 2023 08:20:15 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C31E35B5
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 05:20:03 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-4476f090985so568942137.2
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 05:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691756402; x=1692361202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DS0IMuqpHWTKkcRKIEVoaSxfAZNKR7fHM2BLQ87oCc=;
        b=0yPN6o4aoPAKj7YthatB1IN2SdkPrGpaEDpR1o1EC2sdvEU7l6DKksPYHMDWKk5vck
         eoGwiPgaWybglTTpWFxJsh0v0hd7IdAAQ7SOlwFHnAPMrLP/qA4o+Hq8BgXGqxbZhXDh
         M6HMYR/rnVRy44Gl7C+G7c61jKqKvVlkondBUNgwVgCFdbYWA3ZOdBRWn4ceeBMWyfiX
         Zg72tC1Tk1NdR7QGaQpmpcRvpP7p0CPYISedjHemIftbpbhZJWezlekfs/pa5B6iYKae
         YIMFBBMRg+75vpL1dLzohtvsp4t9vArSiNOiwjY3YzwlODvYQNEWzGbsoxlM1VAMSb2B
         Ed8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691756402; x=1692361202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5DS0IMuqpHWTKkcRKIEVoaSxfAZNKR7fHM2BLQ87oCc=;
        b=L6M+ZdLGuP8jw/8LOf+VRajzOFAoFZgLbtNZRQ+ltJrLND4kVoh6gHMgOrdpXYMAjZ
         mFU37VcihbFGV2EFtgekClBePRx2GPl7EbCnhLIyop9vyDjUl5Ck07Y8oe1dKEWopfH8
         HEh8+znHp8AnpP/OVCeI9bFqqZSvSim0Jt7IAh/ZyDjJQIURDdcX5Vo3FUTHdbxyQl+z
         ObgSPnZelulwixWItANXdRdbMzT4EUlF7gyppAf/QYs9jxN8hiSVXWWzglAKkPQdWFQH
         tJVodOiS3d9ueFf5dUlXaOOwyP3fT8xEKMFKOWC54N67d8Nf7LEcvq0+YeNuBKwhcAvG
         /p/A==
X-Gm-Message-State: AOJu0Yzl137ut7C3iGdSrpj0K6Q9lRYORv2Vj4ygMiOX2YYhUKR6sOw6
        THB0GzNw1kHewZY6pU/WyFKU2dyWAAq1YK5+n1w9BA==
X-Google-Smtp-Source: AGHT+IEL9td+UxyDss0RQyjzU/orTDRvQolcSzU5pdX+C3JRoEWElOAt8xZ6TmU0KJsfBkr2VZ0r5LOmt0OnpmJIwk0=
X-Received: by 2002:a67:f7d0:0:b0:446:9cc3:ccf with SMTP id
 a16-20020a67f7d0000000b004469cc30ccfmr611437vsp.28.1691756402320; Fri, 11 Aug
 2023 05:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAN1+YZU95GyPdE0fDcQNweMCHq0FXQ5RxR5dqmKdmMUaoiMsfw@mail.gmail.com>
 <ZMLZSqRwrPfKEbX3@sol> <CAN1+YZX1m8iZPg1EM8ivqCft83hT1ERcmb2kxx53rNFA7NTJ3w@mail.gmail.com>
 <ZMLnz25brQvcwBVW@sol> <CAN1+YZXqsgCXVhiVHasBMBzCVs-r=wi93m6m5ojUhOi_NOsOxg@mail.gmail.com>
 <ZMNYsOXrOOZgxLeC@sol> <CAN1+YZWjEZQY6yffCFrt0vLVA6P0j5dDbRz=b5c0MXJoSszhig@mail.gmail.com>
 <ZMRzYD6wGYywiPbd@sol>
In-Reply-To: <ZMRzYD6wGYywiPbd@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 11 Aug 2023 14:19:51 +0200
Message-ID: <CAMRc=McRq-_YEgn0KVFjtUArJRUKP4Rbinm2yydsSVGM2ND5Uw@mail.gmail.com>
Subject: Re: [libgpiod] gpiod_line_get_value_bulk may be broken?
To:     Kent Gibson <warthog618@gmail.com>
Cc:     andy pugh <bodgesoc@gmail.com>, linux-gpio@vger.kernel.org
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

On Sat, Jul 29, 2023 at 4:03=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>

[snip]

> >
> > libgpiod2 (and any further bugfix to 1.6 for that matter) have the
> > problem of not being currently available as packages in the
> > distributions we use.
> >
>
> Be aware that the libgpiod2 library package in Debian is actually libgpio=
d v1
> - currently 1.6.3 in stable[1].
> Not sure about the story behind that - before my time.
> And no idea what they will package libgpiod v2 as, libgpiod-2??, but
> there will be confusion whatever they do.

It's because of the difference in ABI and API versions. Early on in
libgpiod v1.x development there was an ABI change that didn't affect
the API. Debian packages the shared library files with the .so version
suffix for some reason.

Bart

[snip]
