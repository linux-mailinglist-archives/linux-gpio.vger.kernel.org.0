Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54F7F72A438
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 22:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230315AbjFIUR0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 16:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbjFIURZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 16:17:25 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0371A1B9
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 13:17:25 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-43b1cee7e65so523115137.2
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2023 13:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686341844; x=1688933844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DTW1clb7gu6a8a8eLGZGVxJxaYhrRROCXHF8qPBkbA=;
        b=c0QzlnORk2I7oghOZo4d10fCNtNOnfjb5w63NixXVbyVl46Lzt8kdhjRNCRNy2Fggm
         3NfAx+98NQ4naV/7feDTd0bZY+pySXUUrZxQ0rTkhECWooRc+xyzi2En1hvXvwGvGUTR
         mS6BaznMl/drhRrZYQ3Vv/lFzN75hYq3/WEf+FwxFhyS5o0B0m71Nzak3yQN/PG5tZ2N
         vZV7YbxNOnwQAOfsualV+yy4fTJIeyYUf1IbapNHbCyC1qNISQeGzV5dqaulRYBEybH9
         tQSVLxrnOj0AC2FiRx7gxKfXpANsBD8jP+37vXx2aDfLpRqBfZEHhYgW/vC+jiJ2VXPY
         Nv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686341844; x=1688933844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8DTW1clb7gu6a8a8eLGZGVxJxaYhrRROCXHF8qPBkbA=;
        b=ghdwp84l7q1OR205c5oRFhjl8s8fYz13QBzMUIlrkubY7ErXc3r6nOEnuzeRnGbXOD
         m9b2z+gfVr/1EhtT2D/EsYowi8aQmn30Y0pSmrsXm6JWdvRyUS1BBOy29xDEVnG2Pitd
         fkXn+GGy8xMHpZvJ4hIN8CpvWlW9K1t26h/C5Rkks0RlxUnEJxmKeDXLV9hzfU1VKCDJ
         ktESk5XClb69zsdh7gDN5Re1cP+qScocgzADAeTOibDTNEZ3FxXKoSwGVoH+26yjQjc/
         qPony7CMeRPeIugMDPHCa9nPpeVFoX3+YLI48Lw+7PGixWU/JHlRkcCUvUuzTvyUbt/t
         r09w==
X-Gm-Message-State: AC+VfDzHaKPctbK/P5j81xkOvgeEul3TcJcT22qBTMfPWW53/iGoQNc8
        tDl9yz3D81vGonj00bDNqugeWz/GeJ7P3Het1MilIA==
X-Google-Smtp-Source: ACHHUZ4cNSLAOV8y8PYbraLhD7DhwX2dvlCKG90bg1ofc5/DG5EP0T/88+O/iE4uwImrFn/HYATCJJb3npKvWQCqjYE=
X-Received: by 2002:a05:6102:3a71:b0:43b:3e78:9886 with SMTP id
 bf17-20020a0561023a7100b0043b3e789886mr1108164vsb.26.1686341844097; Fri, 09
 Jun 2023 13:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230609073957.72418-1-warthog618@gmail.com>
In-Reply-To: <20230609073957.72418-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 9 Jun 2023 22:17:13 +0200
Message-ID: <CAMRc=MeX2Pc1vNc_p0WLfQoBx-UfHFA5W0Z=3r8-Ocy9bDNXfw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] core: doc: add doc for opaque structs to link
 to the relevant page
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

On Fri, Jun 9, 2023 at 9:40=E2=80=AFAM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> The C doxygen documentation is difficult to navigate as the opaque types
> do not get linked to anything.
>
> Add doc for each opaque struct that references the relevant page.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>
> There might be a better way to do this, but this the best I've run
> across so far.  At least the generated doc is navigable without having to
> return to the modules page and perform mental gymnastics.
>
> Along the way, also renamed the request_request group to line_request as
> that makes more sense.
>
> Haven't pushed this one to rtd yet, as this is a more significant
> change - not just fixing a typo.
>
> Cheers,
> Kent.
>

Thanks for doing this. I tweaked the patch a little bit and applied to mast=
er.

Bart
