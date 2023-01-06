Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE74E6603C9
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jan 2023 16:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbjAFP5g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Jan 2023 10:57:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbjAFP5f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Jan 2023 10:57:35 -0500
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8318413DC3
        for <linux-gpio@vger.kernel.org>; Fri,  6 Jan 2023 07:57:34 -0800 (PST)
Received: by mail-vk1-xa33.google.com with SMTP id bk19so765269vkb.11
        for <linux-gpio@vger.kernel.org>; Fri, 06 Jan 2023 07:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l3wXR7pF/2oKIZ6s0BckXTKquokPlrrTjBJtxZSwVsc=;
        b=D0WrkhZ+B+YabOpP3wm9lohT66Fne48wIpUyPsnesysFXG1371KXT7Y8WMyKyT37qq
         eu062sg7j858/ZkI97svhLOtirPDUmGJPX4RraQlO82vP0JiuPeyOicFyQ3bVUgkuKFK
         w06hqoXrC27d68lyEByK1TP8u9Qxjb+EkiMcVoNMLLfz3s+vy7TsOkpVc/E8kmb1bRjj
         jpOPLaNkptFNRpmXQ3wDXv9MwD8mUwJv+AKevgi+ieWi9deZAZzK+UED0rkxwB6QSvLs
         b9C0m5n+EqFJIQpgVGDF+ks6v+MgH3lI5VJQPJgvWSCfOazidEImYejcYrPitew8TRJl
         E50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l3wXR7pF/2oKIZ6s0BckXTKquokPlrrTjBJtxZSwVsc=;
        b=s0knA85S6pdDPuavwg0wXrz3R5QANoadqXuU+Dj79HKCWGT3dCW9IZvTGg3qM5ZuTs
         qJYuycqv7odEsvxZz3C0hgCUU66N4zuGlzMYmy/h2GtF0m8xcCW6N6rRivGyh1dLgOJv
         aiKIHvjyeixeRc8r8AxUuuHsHZrZ68UJfexfvJFyxN8jY0FoQ4h6XGlyM6aaRuP1ZJDp
         yOzZlVxLthq9qJKcYKnLCWjECti688UeGXBNtiEXo0COP+szPF0i3v6qu4ktDJg3s857
         be2OvoS2gzi4vX5qS3jAEDUKktmKsmE4u3fPnvr/uZ7AhubjEdyLdad9FfoVRLokx5kV
         3okA==
X-Gm-Message-State: AFqh2kpHzfOAEKjGtTjntLCUAwQWEyQiY1YGB0/UGUgvqhku1LzqRLbs
        JqB7Nj2vs6wqWs9X7ex7z+a34b7sQYECzA==
X-Google-Smtp-Source: AMrXdXtQ3akwWR5M2UMJfjmfAZZZqx8dBamWli5VMZId+Rhh3YH1MXCNOQXiw2FwZO1kIbKDqWkBNA==
X-Received: by 2002:a1f:a68c:0:b0:3d5:a1b9:f52 with SMTP id p134-20020a1fa68c000000b003d5a1b90f52mr12274193vke.14.1673020653614;
        Fri, 06 Jan 2023 07:57:33 -0800 (PST)
Received: from bat.mindbit.ro (cpe00fc8d79db03-cm00fc8d79db00.cpe.net.fido.ca. [72.137.118.218])
        by smtp.gmail.com with ESMTPSA id r7-20020ae9d607000000b006fae7e6204bsm690670qkk.108.2023.01.06.07.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 07:57:33 -0800 (PST)
Message-ID: <af17db6478d4dd5f5c5a170a3eab228177bae739.camel@gmail.com>
Subject: Re: [PATCH] gpio: pcf857x: Implement get_multiple/set_multiple
 methods
From:   Radu Rendec <radu.rendec@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 06 Jan 2023 10:57:31 -0500
In-Reply-To: <CAMRc=Me4grbDW+_-+YWrwngrnUySw31+MUFVY+7pStoY0vA3Gw@mail.gmail.com>
References: <20230104012013.831820-1-radu.rendec@gmail.com>
         <CAMRc=Me4grbDW+_-+YWrwngrnUySw31+MUFVY+7pStoY0vA3Gw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 2023-01-06 at 15:17 +0100, Bartosz Golaszewski wrote:
> On Wed, Jan 4, 2023 at 2:20 AM Radu Rendec <radu.rendec@gmail.com> wrote:
> >=20
> > +static int pcf857x_get_multiple(struct gpio_chip *chip, unsigned long =
*mask,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long *bits)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct pcf857x=C2=A0 *gpio =3D gp=
iochip_get_data(chip);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D gpio->read(gpio->clien=
t);
>=20
> Ugh, this whitespacing is awful but I get it that you only tried to
> stay consistent with the rest of the code. Could you add a patch
> before this one that removes those tabs from local variables? IMO This
> makes the code less readable, not more. While at it: you can also
> change all instances of 'unsigned' to 'unsigned int' as per the
> checkpatch rule.
>=20
> Otherwise it looks good!

Thanks for reviewing the patch. Happy to remove those weird tabs. I'm
not a fan either, and as you guessed I just tried to stay consistent.
It's not just the local variables though, it's also the definition of
struct pcf857x and some initialization in pcf857x_probe().=20

I will send a v2 patch series shortly. If you think it's better to fix
the other tabs as well, please just let me know. Thanks!

Radu

