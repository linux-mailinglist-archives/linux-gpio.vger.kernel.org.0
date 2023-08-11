Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A24657784E9
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Aug 2023 03:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbjHKB1l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Aug 2023 21:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230034AbjHKB1l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Aug 2023 21:27:41 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1ADA2D64
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 18:27:33 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-99bfcf4c814so210161466b.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 18:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691717252; x=1692322052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1xLjbZT2T7cuQY6eHvqpE2fa2fNdp+M9tdYDL3xufs=;
        b=OWCpEZaq9EjuwppVxHXfWKl6Uhw347zF8awOkojlLvpYPerB+oXKJUIhzMqZRkJEfT
         j+LCBSCD3zeIx7l1LeG8ITgv0WIgwu6Uan47k5YsNL/sFJdRmOrFTXJW3DZeSUtO/Cs+
         xtdQ1+QdJRszGeIjXP0PhpTLLZIg+y7fbhtDTys/U8C/cWGqYevPEsf0xeu06GbB2KOZ
         Si6MZhkmYZ+D18riJXUOoeUMNMSp8DpZN0wbemm/j4N+jq4hsL9z1gy6IuDRBsRxyU1e
         O1jWkm57VxPWGuIgEMDkrx3y5NsvIh0OQhj3vQeOU3gmefoyWmittKGVJ6h4LGR0mvtS
         9ndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691717252; x=1692322052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1xLjbZT2T7cuQY6eHvqpE2fa2fNdp+M9tdYDL3xufs=;
        b=d/mEYDrVH8Snm5DLCbHN8Tt0u50M7DZLsH2j1vyOv/IHSmelem9aJ3JRqdnl2aNluG
         EEC3BKzPCCEauMQxUgk3LbIrmdP8becgF3R9uMK/rW27wrA6hr+E8YKggBfD1Sg9hvFJ
         mTcQQUQGvkKTH+fehwGEj7NhiBqqA97wnLj6NAH40hdFPuOCLEL1IeW3rn0oshKWqvMA
         InBywHthsYqk3c98YAJuNCweC4LBdmiCGypKMvxzkGz7txa1J6DAQsanA9YsMuC+cntJ
         zswX9rIa2BhxL4Puc+d7QI19ILKbhR1qerDZEm4KtmQ3NfopVqMJUUZNfRoh+pOziS53
         VbuA==
X-Gm-Message-State: AOJu0YwbGqZiFgEDIjYQKbd/DM+ebaIOQjCs7JvU3ba5crgDRSvpkfei
        NRhwdp3A6L4pYpE89fAykwIqNI//SAc2ocBykEw1TKDr
X-Google-Smtp-Source: AGHT+IEJiZUySmnMZV9axojEb+RGmfZWRwkUz242obnSk7J6DeyOTRSIRYHzlm0FZ0gKP/NF/VvuvLxlqcubsOyARN0=
X-Received: by 2002:a17:907:7781:b0:993:f2c2:7512 with SMTP id
 ky1-20020a170907778100b00993f2c27512mr450817ejc.33.1691717252013; Thu, 10 Aug
 2023 18:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <ZMNYsOXrOOZgxLeC@sol> <CAN1+YZWjEZQY6yffCFrt0vLVA6P0j5dDbRz=b5c0MXJoSszhig@mail.gmail.com>
 <ZMRzYD6wGYywiPbd@sol> <CAN1+YZW-EcQq=D=dLQoH-WsDD7RWjTUgqbQMynV+OXV0EjLOAw@mail.gmail.com>
 <ZM7xEbr0essN2qY3@sol> <CAN1+YZXd_dMJK9CYL+bmtTRCzT=W7Kt9VTeD38Wg8habFLirzg@mail.gmail.com>
 <ZM9oB0l4fvOinzLm@sol> <CAN1+YZVD7ui4HSRMaGv+y-xT9NgeGNWDM_vx2MhZfiGrwhLPVA@mail.gmail.com>
 <ZNQzT2MtskTTZTiI@sol> <CAN1+YZWz10vZ__3gThzTACbiPY=EVVJ_2qjrAzk6rgpjWwKv9g@mail.gmail.com>
 <ZNWH+L9o5gp6PWyq@sol>
In-Reply-To: <ZNWH+L9o5gp6PWyq@sol>
From:   andy pugh <bodgesoc@gmail.com>
Date:   Fri, 11 Aug 2023 02:26:55 +0100
Message-ID: <CAN1+YZWTJ-TqjR99MBGSPPmQY1ao-TCGu-DfNTYBQvbXcmV=5A@mail.gmail.com>
Subject: Re: [libgpiod] gpiod_line_get_value_bulk may be broken?
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 11 Aug 2023 at 01:59, Kent Gibson <warthog618@gmail.com> wrote:

> So you don't need to alloc for it at all - gpiod_line_find() already did
> that. As per that function's comment, you still need to close the chip
> eventually to prevent memory leaks.

Close then free?

> > I must be missing something? Or are you assuming that I am the only
> > one compiling LinuxCNC?

> I am assuming you are building an execuable to package as a binary.
> If you are building a dev package then you can't hide the libgpiod
> dependency from the end user, so you have the choice of either using
> what is readily available or forcing the end user to install libgpiod
> from source themselves

We do build binary packages, but not generally on my PC, instead the
builds happen on a number of buildbots, including the one at Debian.
Also, there are about 20 active developers who expect to pull the
repository from Git and have it build, and probably low-hundreds of
users who regularly build from source.

Basically, a git pull of the repository  + the listed build-time
dependencies has to build without anyone manually fetching an external
code repository.

--=20
atp
"A motorcycle is a bicycle with a pandemonium attachment and is
designed for the especial use of mechanical geniuses, daredevils and
lunatics."
=E2=80=94 George Fitch, Atlanta Constitution Newspaper, 1912
