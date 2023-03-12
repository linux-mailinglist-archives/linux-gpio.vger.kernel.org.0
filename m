Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C21636B66CA
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Mar 2023 14:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230427AbjCLNjn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 12 Mar 2023 09:39:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjCLNjk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 12 Mar 2023 09:39:40 -0400
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93CA124BED
        for <linux-gpio@vger.kernel.org>; Sun, 12 Mar 2023 06:39:38 -0700 (PDT)
Received: by mail-ua1-x92b.google.com with SMTP id s23so6564867uae.5
        for <linux-gpio@vger.kernel.org>; Sun, 12 Mar 2023 06:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678628377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvVPklU9rRl2ZlHI/8cnX9qOpqHOtCUR2bgPLKZP1uY=;
        b=3GTwtGZTe2Jp4wfjUwvSNonO9HWFZuUPuLOb8SwHJoFcX1cI8CBF/lPyNKKURz3FZH
         iKYUSkXiecDUYd8DhZumqhrd4LLJAOKHhtnNBNFGESp/fLju8y5S6hnxAjPTzV8Dy9xT
         ufZ0OWo9UdQvCWPsUdx2dUYHmCsygcrnbeJXfjQ47EX4ZeXs2d6Vr3VwABYEx0l3fTvx
         jp3Q8jMBRgUl1YW54135/7BgyJiyLTC3D2EcdLUvuSvRJxcUjGnfWLhTIja0uIeFLOba
         /1FO5o0jX4b4dIeccZAE9ClJ/RoCORqeUx8yW5AP5F3adRuCtdU7OaJEozHL7jA1BAAQ
         MtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678628377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uvVPklU9rRl2ZlHI/8cnX9qOpqHOtCUR2bgPLKZP1uY=;
        b=vNWTPMsucJ20NDch+FBMFcpyylCu42BLaf44K7D0pSgkONpCPM/3+bekskxZN2VmbN
         EY+W2IGjnUQOJO1DdkwiXF7k/eoA/xhMRwEbHqfaiMaZBKjdHs6bFftbQE9ybXcpllT+
         YdbvGtAuMb0HJRvfB4BeUbYf93Kq5+rqrVKyX9lvSWSz4h3XmH7uWaEzAY2YgnhnOAw8
         rRew1gXHZ1ZUJGOslLb04D7284rxOcc48aAgpHSJFGk8r0gNnN2+Tp/PZVfVnbXX6ve+
         sQB7x28QTmEQnImKvIeFIAxB0GbOH1KW5srBez0DWTLPzykcFwEFwI/QUOh1t9wwwZLq
         cg2w==
X-Gm-Message-State: AO0yUKXcZEKN0dKMBy9slA4zlhOlvurk4XBzEuAOJtOM+57ezxolBWr3
        1I80HkIP6k1DPCdvaDj740MFF10ue2aZ8iEyeO63cn/nVEyXfg4D
X-Google-Smtp-Source: AK7set9hg+SwDxOWYiy5Umo47C5bIRcChDMWXf90Dl/q2tZ5J+P3+NFXjg137it7Ct+1eT9YUWVDV0tDEqzZJ3LFGX4=
X-Received: by 2002:ab0:5402:0:b0:68a:6c1e:1aab with SMTP id
 n2-20020ab05402000000b0068a6c1e1aabmr19577050uaa.2.1678628377463; Sun, 12 Mar
 2023 06:39:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230306184545.1316993-1-benl@squareup.com>
In-Reply-To: <20230306184545.1316993-1-benl@squareup.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 12 Mar 2023 14:39:26 +0100
Message-ID: <CAMRc=Mfa_iPc9d2o2wJoFSwDXEG1sHS2Ma9F_oW+wtnahUoXuw@mail.gmail.com>
Subject: Re: [libgpiod,v4 0/2] tools: fix compile issues when GNU extensions
 are not present
To:     Benjamin Li <benl@squareup.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 6, 2023 at 7:46=E2=80=AFPM Benjamin Li <benl@squareup.com> wrot=
e:
>
> v4:
> - Keep semantics consistent with before: help messages should return the =
full
>   name, not the short name. (Bart)
>
> v3:
> - Collapse --version print into a single line. (Andy)
> - Handle program name fully independently rather than rely on any extensi=
ons
>   at all. (Bart)
> - Move Android.bp into contrib/ folder. (Bart)
> - Add SPDX license tag and clean up Android.bp patch comments in the cont=
ext
>   of it possibly being accepted into the upstream tree.
>
> v2:
> - Add missing Signed-off-by: tags.
>
> v1:
> Fix issue when building against a C library without GNU extensions, such
> as Android's Bionic libc.
>
> A commit with a sample Android.bp file that's working against Android 11 =
is
> included for informational purposes, which I don't expect Bartosz to pull=
.
>
> Benjamin Li (2):
>   tools: remove dependency on glibc program_invocation_[short_]name
>   contrib: add sample Android.bp to build within an Android tree
>
>  contrib/Android.bp   | 136 +++++++++++++++++++++++++++++++++++++++++++
>  tools/gpiodetect.c   |   5 +-
>  tools/gpioget.c      |   5 +-
>  tools/gpioinfo.c     |   5 +-
>  tools/gpiomon.c      |   5 +-
>  tools/gpionotify.c   |   5 +-
>  tools/gpioset.c      |   5 +-
>  tools/tools-common.c |  34 ++++++++---
>  tools/tools-common.h |   4 +-
>  9 files changed, 183 insertions(+), 21 deletions(-)
>  create mode 100644 contrib/Android.bp
>
> --
> 2.25.1
>

Thanks, I applied both patches. For the second one: I extended it so
that the android build file ends up in release tarballs generated by
'make dist'.

Bartosz
