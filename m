Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2A5783D0D
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Aug 2023 11:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233249AbjHVJjl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Aug 2023 05:39:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232280AbjHVJjk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Aug 2023 05:39:40 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F016CC8
        for <linux-gpio@vger.kernel.org>; Tue, 22 Aug 2023 02:39:38 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-44ac87147fdso2613357137.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Aug 2023 02:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692697177; x=1693301977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbReyeg+ZX9yYJxLZOuHPKL9n0rFDx2OMW9LIdDIrIU=;
        b=eDHu99p7Wa5XYAartbNh+kyJ5qv1towtr0dZa9O7FtmvqWAWw2vc3UvRsMCTXW+9v6
         nQXCy90TXbssB+oD3Gl62CjySoGa530jYVqlWy268Bmv/yLvfrTcsC/KpZdK1AxQh+QG
         fUI5K/hnHrgEyE1vLpDKcLMgEiO+8oqD7ctiXflZUZOOw5mO+xvQEpUf4bKpk4X8d+09
         Rmuh8wCa8o+uJQq8cincmrvVLlEJRMafgEILWrlq6UuTlfEgxPwCVz5taqKYgFkORCX6
         sGJSA9oFFNO1bg8TJGKo2flxVflgnFGZ01HOh1AmVtWbG3HxLRThN3nLm27PM+toTp3z
         9fSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692697177; x=1693301977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RbReyeg+ZX9yYJxLZOuHPKL9n0rFDx2OMW9LIdDIrIU=;
        b=GihBIXeG+VWI69kZFioskNOFGNpwbk//WqcoB7+y3sA64Vq1x5pLrSuSAA8GmmS9A+
         qPDAQxnAzctbr6hNipHrcdKedC7u8irrHUlWiWFwd0P7BrQNtOEoovByH/YYQ1Vfo0HG
         +bDx01QN89YnJ0AfZElO7yyks4K2zJZOPPPj7/AZ6DoxY+3cvP1x/SElHZyHUXkoI1L8
         3sTfbnwDBVX+Ax5DXVoGrlSQObv8K47pjqkKHYiVPnde3Do6lDAwQw4MRJHMffLO0Naj
         oQBYrXBYsHUReBJim0MPOpCeFqsz6a73G0t4fTkpt9iAHUbnFDBxR96/GEDw01ReOghS
         /UYw==
X-Gm-Message-State: AOJu0YyIoUbcoWYbu3KBKO4JRHuZ5nhZ6UlpsOVNIGlB47HxScOYozWk
        0tHeph5XqKJoWy83WVoFXtkG68ojaLWBMVWTOFr2uQ==
X-Google-Smtp-Source: AGHT+IE9xITkl3PGWa/uCLI3UJwTL59sU+T83Svd9B65LBc2WZeKczcaDWBZ+MMlwmZPX8YRTFJeqwyl7ZAVxjH6VH4=
X-Received: by 2002:a67:bb0a:0:b0:44d:3687:32e4 with SMTP id
 m10-20020a67bb0a000000b0044d368732e4mr5555746vsn.13.1692697177587; Tue, 22
 Aug 2023 02:39:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230506085928.933737-1-haibo.chen@nxp.com> <CACRpkdZDTxxNn2CDSBu5yKnw0qVuWH-a+dPYXdHndLZbxmyFAw@mail.gmail.com>
 <DB7PR04MB40104DABC8B1C5D9CC0CB0A4901EA@DB7PR04MB4010.eurprd04.prod.outlook.com>
In-Reply-To: <DB7PR04MB40104DABC8B1C5D9CC0CB0A4901EA@DB7PR04MB4010.eurprd04.prod.outlook.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 22 Aug 2023 11:39:26 +0200
Message-ID: <CAMRc=MfgDSyPr_Wtjzae_1sSHr4eC_Afb4xarfSyi4aEzRZjgg@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: vf610: switch to dynamic allocat GPIO base
To:     Bough Chen <haibo.chen@nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>
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

On Mon, Aug 21, 2023 at 4:47=E2=80=AFAM Bough Chen <haibo.chen@nxp.com> wro=
te:
>
> > -----Original Message-----
> > From: Linus Walleij <linus.walleij@linaro.org>
> > Sent: 2023=E5=B9=B45=E6=9C=886=E6=97=A5 21:05
> > To: Bough Chen <haibo.chen@nxp.com>
> > Cc: brgl@bgdev.pl; linux-gpio@vger.kernel.org; linux-kernel@vger.kernel=
.org;
> > dl-linux-imx <linux-imx@nxp.com>; christophe.leroy@csgroup.eu
> > Subject: Re: [PATCH 1/2] gpio: vf610: switch to dynamic allocat GPIO ba=
se
> >
> > On Sat, May 6, 2023 at 10:56=E2=80=AFAM <haibo.chen@nxp.com> wrote:
> >
> > > From: Haibo Chen <haibo.chen@nxp.com>
> > >
> > > gpiolib want to get completely rid of static gpiobase allocation, so
> > > switch to dynamic allocat GPIO base, also can avoid warning
> > > message:
> > >
> > > [    1.529974] gpio gpiochip0: Static allocation of GPIO base
> > > is deprecated, use dynamic allocation.
> > >
> > > Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Hi Linus and Bartosz,
>
> For this patch, still not in the main trunk (Linux 6.5-rc7) and linux-nex=
t(next-20230818).
> Can you help apply or any comment?
>

I think I didn't apply it because the first patch in this series was
controversial with known user-space breakages. Now applied.

Bart
