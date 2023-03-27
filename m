Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A58506CB0D1
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Mar 2023 23:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbjC0Vjc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Mar 2023 17:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjC0Vjc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Mar 2023 17:39:32 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16DDA19B5
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 14:39:31 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id i6so12605248ybu.8
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 14:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679953170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+fKZu6kf3sjmOyFMoJ1hgSaDCKYwTntit769aZr7mM=;
        b=e4h1ul0UlEl0CISSju7eZKY4ryZXb9UT6lHuT+MYkekBOhMh0orgcQvs3nnnFwWVF8
         UzAzQYjW4z/sDeFhyBYQNqA/3Ix/Zu2E6GmKK1gghdVTQV5CIuLO7cLdo1of62bZ/8MP
         X9BbNacd/q+3J/na2uONi2r07SkVEYelHYWL9Br2tqjFqThn6Grj5a4aHWRzVCwOGEuv
         SdvxjwW+QgEm5q53Z9c/MgbjvA0vgxsRhWSt99xjsBlDzv3iLu/GlePmixSuwH76TOzH
         0AbsTEflXFHLGyvwZcSY7VtkhB7JGEYaH52GcONSOLQtg8wGSNeM1QeVLIgrHOtXOsc3
         rUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679953170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i+fKZu6kf3sjmOyFMoJ1hgSaDCKYwTntit769aZr7mM=;
        b=g4Nx5vQtn01kHkoYF82Xe5mvKHsbF4mjDIzGLPyhuX6sV/0WxnVv6We8mo7ZuFCO8I
         jIM9sjivMTnA4972wfqSBLzwU8egABrUFlgZLxQNm7GQJARC4QGXgLhVU9VeJhHT/Zmn
         izIPGVYUo05Aawl6uNRAO4WFgpZL8BkZbVIF5ToUTz22q3uIeqkx6fmArYfJQE0mW5TI
         6lIQfNsU4tqXQhgM4XNxTMlcBE3NmaNIUG5LUldOtOYzDsxJqe5N47niTltxngclOEcn
         EKJVVycFw3ctOcoRykfPlZLdjRVD3tMxhBM5ragJ5Z1sDTt6zqucnEv5j88+Y+RC6zyz
         5nhA==
X-Gm-Message-State: AAQBX9decF/+9dGsF9GyKygJCuNKzqI7kWKwYJtgKVbQgv+TRJnNzoYw
        rNdHv3YPaxB6Jb+CbDY8LLyZlXRKk2Zw5NC5Xy/04A==
X-Google-Smtp-Source: AKy350bvGXtcva5UAk0XVnHitqc6iErCm7e9knDZvtknfD6EcFNo9sHtmigO0tPJxO514+QbuRi9bAM9lE+AczIEl9M=
X-Received: by 2002:a05:6902:1083:b0:b75:8ac3:d5da with SMTP id
 v3-20020a056902108300b00b758ac3d5damr6196537ybu.4.1679953170336; Mon, 27 Mar
 2023 14:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230327062754.3326-1-clin@suse.com> <20230327062754.3326-6-clin@suse.com>
 <CAHp75Vf_k2ZDoyHUVbD_e4droAwxVqu7HCwNrPd=X_su-c8LjQ@mail.gmail.com>
In-Reply-To: <CAHp75Vf_k2ZDoyHUVbD_e4droAwxVqu7HCwNrPd=X_su-c8LjQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 27 Mar 2023 23:39:18 +0200
Message-ID: <CACRpkda097RwHCZu+_WAJRP=MGo7g4j++WJ57P=H7xKa9j439g@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] pinctrl: s32: separate const device data from
 struct s32_pinctrl_soc_info
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Chester Lin <clin@suse.com>, NXP S32 Linux Team <s32@nxp.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>,
        Andrei Stefanescu <andrei.stefanescu@nxp.com>,
        Radu Pirea <radu-nicolae.pirea@nxp.com>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Matthias Brugger <mbrugger@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 27, 2023 at 1:59=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Mar 27, 2023 at 9:28=E2=80=AFAM Chester Lin <clin@suse.com> wrote=
:
> >
> > The .data field in struct of_device_id is used as a const member so it'=
s
> > inappropriate to attach struct s32_pinctrl_soc_info with of_device_id
> > because some members in s32_pinctrl_soc_info need to be filled by
> > pinctrl-s32cc at runtime.
> >
> > For this reason, struct s32_pinctrl_soc_info must be allocated in
> > pinctrl-s32cc and then create a new struct s32_pinctrl_soc_data in orde=
r
> > to represent const .data in of_device_id. To combine these two structur=
es,
> > a s32_pinctrl_soc_data pointer is introduced in s32_pinctrl_soc_info.
> >
> > Besides, use of_device_get_match_data() instead of of_match_device() si=
nce
> > the driver only needs to retrieve the .data from of_device_id.
>
> ...
>
> > -static struct s32_pinctrl_soc_info s32_pinctrl_info =3D {
> > +static struct s32_pinctrl_soc_data s32_pinctrl_data =3D {
>
> I'm wondering why it's not const.
>
> But don't resend too quickly, let's wait for Linus to comment on this
> and other stuff. It might be that he can amend this when applying.

I don't dare to add const here given the compiler warnings it
can easily spawn.

Chester can you investigate if these can be static const?

You would only need to resend this patch 5/5 because I applied
all the others to lower your patch stack.

Thanks for fixing!
Yours,
Linus Walleij
