Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A24225612C5
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jun 2022 08:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232862AbiF3Gyh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 02:54:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231757AbiF3Gyg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 02:54:36 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 451DA2CDDD
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 23:54:36 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id x8so13003504pgj.13
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 23:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zBVwCq3j2p6U4a2i/jMeg+qggdkonfpPMtSG1jSAdwQ=;
        b=h4xFTNDttWFzMh2IOGT5IBaoOfS56qwbRGDL+8GMTWhCvIXXTiFZqpgrJsE0JT7Ocl
         dor2nW3XYYLOV6n1GdyvLjW49ipcSiTE3USJPirbFsKEhXzbnq7CJ5GljCr48Ov1YyWd
         Id8AprafSxPYiTs42uKUN+D7tDYWom7exKD3pfHD9aMS8sGWRK3l0UNNB4tWUqNhobIg
         +TJUri1If90UW8ApSysABjC500pyJ2JNqnLIirUih0ikaC7N9GfnoExzvIswVbdG4btr
         hiy1LLTQI8dHOS2C7+WnW6xPVd0Ol4DMcLYhROwpFWa+Tg+GHs+9hGsET/4AWr//ZjQB
         uE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zBVwCq3j2p6U4a2i/jMeg+qggdkonfpPMtSG1jSAdwQ=;
        b=DeF6662F69smog0JK1V9QsT6DOXsjY9xjpLlHD60J6FQ5ucxVl8FA8sGS29mRA0zwa
         z5UTm5C7xHWBF324TioBe2dtQOwr2ZyrflkyJ74oxF2GVLgtiJ7TD8NvqGTlg8iHyQml
         fR9xkDwyp/ZfbZ0ZKcuFl8wMGC/kAyns69m7FpmEb6p6qX3xm2SFjSTu3DZSO6dZHjTM
         QjjSLen9uGSpqHb7wKdTcv3kSserYyGqe4b9bs1zyp+QfuFQ5NujCfiSQfLqAIezi0fJ
         dfkJy8VirPiRWg+b+vr6r6VK1/cfxuXktS/FIALmbdM7kCPcD3T1LwDKh7c5mMTRn0en
         yV+w==
X-Gm-Message-State: AJIora+DGzwyoxua2wcOMQpNwduAIMdLihvZ4Nch0GYKS2tWrxUsj6zL
        ZAWQAVwO6Mw3CFij9xEtfx8ZB+nqPTsGUUPBIQfCSQ==
X-Google-Smtp-Source: AGRyM1uda1FGBNlLaAa1MTWUfYE5xQhdzHfHblx6a+Rtw2BknvvXh4HU9UtTFysvs34HDJbuldOOrATscnNCxNZCjTc=
X-Received: by 2002:a63:730b:0:b0:40c:3a65:537f with SMTP id
 o11-20020a63730b000000b0040c3a65537fmr6181173pgc.267.1656572075767; Wed, 29
 Jun 2022 23:54:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220628084226.472035-1-brgl@bgdev.pl> <20220628084226.472035-6-brgl@bgdev.pl>
 <20220630022522.GA17221@sol>
In-Reply-To: <20220630022522.GA17221@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 30 Jun 2022 08:54:24 +0200
Message-ID: <CAMRc=MfXqKuj4u9OiBe5Euo8BtRFb06CMZbLOoF6PD2OvJsRWg@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v2 5/5] bindings: python: add the
 implementation for v2 API
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
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

On Thu, Jun 30, 2022 at 4:25 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Tue, Jun 28, 2022 at 10:42:26AM +0200, Bartosz Golaszewski wrote:
> > This is the implementation of the new python API for libgpiod v2.
> >
>
> [snip]
>
> > +     }
> > +
> > +     res =3D PyObject_Call(method, args, line_cfg_kwargs);
> > +     Py_DECREF(args);
> > +     Py_DECREF(method);
> > +     if (!Py_IsNone(res)) {
> > +             Py_DECREF(res);
> > +             return NULL;
> > +     }
> > +
>
> Building against python 3.9 (the min required by configure.ac) gives:
>
> module.c:276:7: warning: implicit declaration of function =E2=80=98Py_IsN=
one=E2=80=99; did you mean =E2=80=98Py_None=E2=80=99? [-Wimplicit-function-=
declaration]
>   276 |  if (!Py_IsNone(res)) {
>       |       ^~~~~~~~~
>       |       Py_None
>
>
> Py_IsNone didn't get added to the Stable ABI until 3.10.
>
> Cheers,
> Kent.

It seems like most distros still ship python 3.9, I don't want to make
3.10 the requirement. This can be replaced by `if (res !=3D Py_None)`.
Are there any more build issues?

Bart
