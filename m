Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5433D78246B
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Aug 2023 09:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233620AbjHUH0J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Aug 2023 03:26:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbjHUH0I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Aug 2023 03:26:08 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F31A6B1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Aug 2023 00:26:05 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d749f57cb22so1066213276.3
        for <linux-gpio@vger.kernel.org>; Mon, 21 Aug 2023 00:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692602765; x=1693207565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+rE6meNwqWac3G4k6sNGIx2jUyibWVh8hjz7HQuPrY=;
        b=s1Zm8bn5NqYKIvs3Zi+mMQ41rJPBLFlZRkQQAHy7VXLKM//E158wT4xfkK5nMLx8p9
         7hYTehNFHUkr8ESExDlGN8npU3rkhCUxemaR1kSrGnQySNlP2sDGUK2uCHgO8d40uPWF
         FmqX7Phhys95uuN6yYb1nJk7EoL++vI0UL8glUoU5vfAiGI6YAFhsMKRQdSbllK/2hGj
         +k7ElsYdKt/U7h0l58g0LTC2/5ka1WzwsKz8YUiWghvwxVoDJ0bICt8N/vfA9OotAYEC
         8xzirWiCLl7qxDCajFdGUmdcSgNGggScSPOIyrT6bG9jcOeAfRrywRjBaWcXQcPvUHbY
         z2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692602765; x=1693207565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+rE6meNwqWac3G4k6sNGIx2jUyibWVh8hjz7HQuPrY=;
        b=LwLDJg3xKkHy1GOpB6iclpunG6ECuUouKDdawJG06FQUvEizi5x63JNSN3oW+fihqk
         10dmo4f3r7EfLrtGu3gufZIs2GWysyFGpGxYHjTV1QhjVGmyuVyBovUMXVKQ5BojwXrk
         agtLJX/bWI/0NTj9dA5LPfI0XW4Kcls7HRr+2UFJsVqf/wwd6TY8UPp72nsgt2EGKuYD
         wjGAACAQHLrBf6gtSXHwExsVRt699asPW/Tshw+o37z8hbiiDAtdR1+ol5TuFr9wt5WC
         XLuccHE/YeAixNt8/SSJ7GOvSHslnpMluzdJDBqy/JI2qOnS7fcrWxHO/JqCgHjA/8kn
         wCMw==
X-Gm-Message-State: AOJu0YzXAvey3sE7Fhz/j0XV+NYs1VeFh3ON8T+eAejOlf2fygND224L
        bWoMhNSh8hX6sxXi6ywFybW0pOjw1tA4nQVCdUkEZpohHRBWYoAy
X-Google-Smtp-Source: AGHT+IHsw1qMAqe28F2s7Wg6FQ9bbA42/D6ramMw5ZI5K+ot6Q1NYtJOqc8q+x6cSmNyJOQHtlAL+Kd/2JyG+pp5hJM=
X-Received: by 2002:a5b:991:0:b0:d07:60bd:89f4 with SMTP id
 c17-20020a5b0991000000b00d0760bd89f4mr6980082ybq.37.1692602765123; Mon, 21
 Aug 2023 00:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230506085928.933737-1-haibo.chen@nxp.com> <20230506085928.933737-2-haibo.chen@nxp.com>
 <CACRpkdYUGwEn-4T+Ay-KckO3ChFNqOrdVuP93u=gs5uc9fY0yw@mail.gmail.com> <DB7PR04MB40102AA686099ED666C93EF5901EA@DB7PR04MB4010.eurprd04.prod.outlook.com>
In-Reply-To: <DB7PR04MB40102AA686099ED666C93EF5901EA@DB7PR04MB4010.eurprd04.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 21 Aug 2023 09:25:54 +0200
Message-ID: <CACRpkdZ-2Lyk_c8EJfS=YHK81wt2RAWnZAg+vxvZZijYFwmDDA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: mxc: switch to dynamic allocat GPIO base
To:     Bough Chen <haibo.chen@nxp.com>
Cc:     "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 21, 2023 at 4:47=E2=80=AFAM Bough Chen <haibo.chen@nxp.com> wro=
te:

> Hi Linus and Bartosz,
>
> For this patch, still not in the main trunk (Linux 6.5-rc7) and linux-nex=
t(next-20230818).
> Can you help apply or any comment?

As pointed out by Bartosz you cannot just mechanically switch the base
to -1.

You also need to convince us that this doesn't break any systems, and if
it does, fix them so they don't break before submitting this patch.

Yours,
Linus Walleij
