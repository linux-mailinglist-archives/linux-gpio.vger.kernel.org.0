Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F94E730311
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jun 2023 17:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343540AbjFNPLp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Jun 2023 11:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343515AbjFNPLp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jun 2023 11:11:45 -0400
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3672B1FE4
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 08:11:44 -0700 (PDT)
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-46e87ddd0f1so351165e0c.3
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 08:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686755503; x=1689347503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6dsL41FlORe4lSJ1+AmFTRFUy0hNd4AjHWokwRSVZ8=;
        b=vXPonJmDd//RYUOOaX90eDlzWk9yJToqCSGuuWQBqiZ4Y+MWYVcvieuySaNJJAjmYy
         9bLqby1LLF2JBhur1BUg8c73xLY01L32ey4G1DiRdT3TM4jIx8p7qRRe6bJPbiSYRNIc
         +VeHbaD55LCmN0i1wgpLfmTFnYFb2xG8hNGnNCx0fg5dPM+5Sb3Oug3z+9UuF0dcnsT4
         CzOW+76FwHuyhVo+tvijHcEv9dPj1URPEZb/snelzvYzQt80FpPG+2gYiIf9FlnCubBP
         DWhMT4nL5eNwsdSaTlSaJTLLtzXr5yclmD3svZlbfGVEbLP1vwG0CnOyGQMCulXt8VBs
         FR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686755503; x=1689347503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6dsL41FlORe4lSJ1+AmFTRFUy0hNd4AjHWokwRSVZ8=;
        b=iCJJeUGQ8lCzlkXiHkFZvCyqP21vs5zIp8X1ZNMTNCv+rU4w53PkZg5k9XmTzFIwwe
         g6sZTNACmRqH0OlFLlmGI/3VUWjScclpgSmLYt5OsAz6CiSM/lHX4xVnaUOQpG+oRymW
         xyDKagl19s5wQuRaIoTeOUqxXsVMb/QxQ2h7fVtMP2+AeOaDEubrSRBg7A/h1kMCZHg7
         VRG6Z3tgXZOTikhJ+eqUO1JsVKzxf7ETJOPMBcFzOStlO4ZrV6vHpHir9vu5iGi2czjq
         Xg+1F9pZS5hdFP0iLivO/ZTraAwEr+BBOKxPRWYWeRK0msssORlGOU0D37gOCIP/NxBu
         rE4A==
X-Gm-Message-State: AC+VfDzqBUFczETjAGDmUCp6lTKeZyGBOY+hvC50WqyJa+AnCL8ldY1h
        KLELOMPB6ocxVIkPW25Xael0JImQbcIw8/OD6g8HE73lfFCZFgue
X-Google-Smtp-Source: ACHHUZ7tSIqMgL0i3CGe5/e1S2Oto25Ao2zjxSKtx18sWJf4D1ZpxAWi2ouct+LknbyYldce2sgSVsudmgEOXWl7vec=
X-Received: by 2002:a1f:5e8f:0:b0:46e:97e8:f68c with SMTP id
 s137-20020a1f5e8f000000b0046e97e8f68cmr974535vkb.2.1686755503325; Wed, 14 Jun
 2023 08:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230614035426.15097-1-warthog618@gmail.com> <CAMRc=Mf3vtfUyprLcJ7g8Y_Jt0k4=FoKMjjxqRA__YNmqeCDLQ@mail.gmail.com>
 <ZIm+4qmSUgFrVzLc@sol> <CAMRc=Mc3-SfvYYYvocMyjLtbPk=f=EyAOHXcKj+eFWvVWrGurQ@mail.gmail.com>
 <ZInHSgsfALvbTmAX@sol>
In-Reply-To: <ZInHSgsfALvbTmAX@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 14 Jun 2023 17:11:32 +0200
Message-ID: <CAMRc=McCKjU9NbarB-0awfUXwECMFna5aKi9yB68pwxHEebUhA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/4] dedicated examples
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
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

On Wed, Jun 14, 2023 at 3:57=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Wed, Jun 14, 2023 at 03:26:54PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Jun 14, 2023 at 3:21=E2=80=AFPM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > On Wed, Jun 14, 2023 at 03:03:51PM +0200, Bartosz Golaszewski wrote:
> > > > >
> > > >
> > > > Great idea! I applied patches 1-3 with some tweaks (coding style, C=
++
> > > > comments, statify functions, put local functions into anonymous
> > > > namespaces for C++, apply black to python code etc. etc.).
> > > >
>
>
> Any opinions on where to go next?
> Other use cases to add - e.g. multi-line versions?

Sure, I don't see why not.

> Convert the tool examples to use case examples?  Or do you still want
> to distribute the binaries for those?

No, the examples are built but not installed. And yes, if you have the
time and will to convert them to something more useful, please do!

> Any functionality to add to libgpiod?
>

I don't think so at the moment. Do you see anything obvious? I know,
we spoke about putting the line resolver into libgpiod but I'm not
sure we really want it. At least in the core library anyway. The GLib
layer on top of libgpiod is a place that would be a good target for
such a functionality IMO.

Other than that, I think libgpiod now has everything it needs to cover
all use-cases for the uAPI.

Bart

>  Cheers,
>  Kent.
