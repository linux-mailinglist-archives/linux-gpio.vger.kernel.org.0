Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEE287826F2
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Aug 2023 12:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234623AbjHUKV1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Aug 2023 06:21:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234620AbjHUKV0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Aug 2023 06:21:26 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88583D3
        for <linux-gpio@vger.kernel.org>; Mon, 21 Aug 2023 03:21:21 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-d66f105634eso2895309276.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Aug 2023 03:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692613281; x=1693218081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBLwSBjqiFLdrHAigPhpN2K47Xe+TFLd/SFb0j9E4aE=;
        b=RiNcu05Da1AC12sUJMwItnJlpNDMQ1tWTs/SqQ9oRAJKn0/2+xOx6iVKmqLQYaHhqx
         tREllJu6ksNNb4zKIJ3lULbeVsUuVxLia3Cbxze6jC5zD+QQMWeawRbVNTtH/0Ic1S+e
         rrsifO7Ky6cGDlOUM+FJwm88/Nyj6GcKjHxusY88tbExeHYdSTn1JpGN2bqXF72VsKrd
         oNREkOcIQdUsLm/X9FfeQJG/L0Ka5oqbwllhdXKBgx6ACDu1bStN5I7hOEFEhWGN/p8Q
         akdibsuGL1FWEdvxnwweDVjXYWV/30oNJGmLa69VQ1bACNk+f9plwedvejfz8bU/umuE
         iCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692613281; x=1693218081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sBLwSBjqiFLdrHAigPhpN2K47Xe+TFLd/SFb0j9E4aE=;
        b=dZWOqgogN7Y6FLfEBiIbpdMMO4VBXuX9wZUsrYLYsInvNUcsEzcWRUNEt1xBGzHwna
         dFe6BXR9ZledLfuJC0kkFSuRMrZvFvBFjRARU1u+qwM6Nugd5AkpesKzChQFv+SrkNmw
         lz+aRAVB6dKW9LGHUtCmgST19n05BrCtgtXofhCErwTeZW/67pD59+2yA5jIdWtVdgTB
         ILUNki5+PIxCv8wEov4Ho2MsVXTNkxWVU7Gwt8i+2QT+NUc+BfMwqXgo6HULOoOQLvlw
         AiYAof7Ptgloc5oanNbWJgP6MUmwkS0Z/h0b1hUVq2Nc9fH9tqNtoSe5FdfaICbf6NJL
         ToBA==
X-Gm-Message-State: AOJu0YyftuFA1R796wEUrayXX6+1EinVJOUFzuyeQjX4AFYqC9u8buXF
        mb7TOWYIiG2UqetoHuCtqhTV7Q+OyH4S2avSZdoVhlJrbepg/58b
X-Google-Smtp-Source: AGHT+IEr/mh7yWsgCrlfNCORXBYtygqsAwwvabX5XPSIUPvBM9BkwVir+JU9bxW33dE9InvqL21v0BnQfhIBEdc/swQ=
X-Received: by 2002:a05:6902:100a:b0:cba:dd41:612f with SMTP id
 w10-20020a056902100a00b00cbadd41612fmr7501012ybt.9.1692613280790; Mon, 21 Aug
 2023 03:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230506085928.933737-1-haibo.chen@nxp.com> <DB7PR04MB40102AA686099ED666C93EF5901EA@DB7PR04MB4010.eurprd04.prod.outlook.com>
 <CACRpkdZ-2Lyk_c8EJfS=YHK81wt2RAWnZAg+vxvZZijYFwmDDA@mail.gmail.com> <12270129.O9o76ZdvQC@steina-w>
In-Reply-To: <12270129.O9o76ZdvQC@steina-w>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 21 Aug 2023 12:21:08 +0200
Message-ID: <CACRpkdZc8H=bnTfLjUzMS3zEWGTZdHbSuBz0yf_wdfp9MkNnkQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: mxc: switch to dynamic allocat GPIO base
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Bough Chen <haibo.chen@nxp.com>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 21, 2023 at 9:44=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
> Am Montag, 21. August 2023, 09:25:54 CEST schrieb Linus Walleij:
> > On Mon, Aug 21, 2023 at 4:47=E2=80=AFAM Bough Chen <haibo.chen@nxp.com>=
 wrote:> > Hi
> Linus and Bartosz,
> > >
> > > For this patch, still not in the main trunk (Linux 6.5-rc7) and
> > > linux-next(next-20230818). Can you help apply or any comment?
> >
> > As pointed out by Bartosz you cannot just mechanically switch the base
> > to -1.
> >
> > You also need to convince us that this doesn't break any systems, and i=
f
> > it does, fix them so they don't break before submitting this patch.
>
> I think it's hard to tell if something breaks, this driver is used in a l=
ot of
> boards. AFAIR some people are relying on the assumption of fixed order. U=
sing
> dynamic allocation this not ensured. A possible fix is to use aliases [1]=
.

Hm I might have been to grumpy!

It looks like any boardfiles using gpio-mxc have been eliminated
so this driver is now only used in device tree-boots? Right?

Then I feel a lot better about it.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
