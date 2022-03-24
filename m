Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04F044E5C5B
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Mar 2022 01:33:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239591AbiCXAfK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Mar 2022 20:35:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237377AbiCXAfJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Mar 2022 20:35:09 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FC8A7CDD6
        for <linux-gpio@vger.kernel.org>; Wed, 23 Mar 2022 17:33:39 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id j2so5814170ybu.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Mar 2022 17:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1WgRrjoth2QulTs4CcrjwAanRUK/IBlHetoNQXeUhIY=;
        b=HxRZI4quHmrN+LD5Qx2z2EJtbLkL0U35WOCRO4kQnMp8yILhLK9z2iG0GvdKx0g6Ay
         rwhtWtjlZPOrGylLCMN7dBqBFRT0HrkNei1sm2phVRpvszkJ3CXjj7hSBXK50c0guyQ6
         I/OResEaKzGzep2+xFYSUbkY4xWRQQDbWgQV7lkYthG3MAnJv6eq7caOYypivDOW12Pa
         IYRfcBZg921Dkfw5jPhIQIm6k1sNRV4GVOgBXe59Queqqm3xk+z8IDhH5CZinnB0mSWF
         VkGamzXoP5iDveOwxyDeSLDqoj56nEZeXgqFLk6wDVCSZuuSmfV0BuFc2KF5Am/5Vqrb
         Vu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1WgRrjoth2QulTs4CcrjwAanRUK/IBlHetoNQXeUhIY=;
        b=jmbe0EmMeBzjdc6WfAqCl+bOQ8q6MJvPbT7yN/+hp+Ul78Ko4nX/jFoClnQQ01w+SR
         igony4ecroH0bK06+Xd7CgRoKACuolu83cTTZwP3PN0LsKLuGBl35jrnkMm/C6n1txWf
         UnGmttdEcMqV5ZHjg+sGfMF2swPP8PODKh1pOatnRnvLYjmvAp36GMmycDNKKZ01Iigv
         oElYz2zvhK9UdRD7sCXLFpXqbxfkBycr5A3PM90D+QZCY2hYz+5pANmCv+vrIePvaY17
         6Ts+x9Xb5fAkT6cEB0W6kplHniPo75WEtqwNKP5m/TRC583kzgfaVIAa3vMXgsnhzHpk
         Y2ZA==
X-Gm-Message-State: AOAM532sRjaRV1ZOJ5y8271maNBxbvuabeKV+jxRq7bM4K8iw+Q242kU
        kVwHbsACYy4qalAbC02D0PWvOaawL7EJ9/zkIvi56fD0E+E=
X-Google-Smtp-Source: ABdhPJzc4nemIgRNCX7M1qQrpSsQvI+pqLk1XP6GL/Bnuv4Bsfd2hmR0NSYH6RdL4k+CDqP4ZDq4ACWjFvWpZnU16os=
X-Received: by 2002:a05:6902:203:b0:628:7b6f:2845 with SMTP id
 j3-20020a056902020300b006287b6f2845mr2473530ybs.533.1648082018470; Wed, 23
 Mar 2022 17:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <623b33fa.pb2pVWdVg3WqlK6+%lkp@intel.com> <CACRpkdb2hifdLLtquEMqty2hBzr8ap_HxZVNRq5GY5ed3kR3YA@mail.gmail.com>
 <YjtO/0zlcYPdFR59@latitude>
In-Reply-To: <YjtO/0zlcYPdFR59@latitude>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 24 Mar 2022 01:33:26 +0100
Message-ID: <CACRpkdacBSoKsnPgRJR5CuK51JzMYQCMxxAVg96ao0c-Wd2wVg@mail.gmail.com>
Subject: Re: [linusw-pinctrl:for-next] BUILD REGRESSION 0c3c8458428ab471178a0d155222eaa62083d033
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     kernel test robot <lkp@intel.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 23, 2022 at 5:46 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
> Me
> > Do you think you could run sparse over the drivers in some way and chec=
k
> > what else needs to be fixed?
>
> I ran "make C=3D1" on drivers/pinctrl/nuvoton now, and only noticed the
> same array initializer syntax warning as in pinctrl-wpcm450, in pinctrl-n=
pcm7xx.

OK I'll just augment it to fix that in the same patch.

> > > drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:470:26: error: array type h=
as incomplete element type 'struct group_desc'
> > > drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:470:40: error: array has in=
complete element type 'struct group_desc'
> > > drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:824:56: warning: parameter =
'selector' set but not used [-Wunused-but-set-parameter]
> > > drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:888:48: warning: parameter =
'group' set but not used [-Wunused-but-set-parameter]
>
> This bunch was fixed with my patch "pinctrl: nuvoton: wpcm450: select
> GENERIC_PINCTRL_GROUPS". There are also two more fixes sent by Jialin
> Zhang and Dan Carpenter over the past week.

Excellent, applied the fix!

Let's see about the last one.

Yours,
Linus Walleij
