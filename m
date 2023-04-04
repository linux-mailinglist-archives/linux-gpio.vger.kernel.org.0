Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB4B06D5972
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Apr 2023 09:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233911AbjDDHYY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Apr 2023 03:24:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233909AbjDDHYK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Apr 2023 03:24:10 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D01243A9D
        for <linux-gpio@vger.kernel.org>; Tue,  4 Apr 2023 00:23:44 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5419d4c340aso597142727b3.11
        for <linux-gpio@vger.kernel.org>; Tue, 04 Apr 2023 00:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680593023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6IBB1OxNA9LO5K8H4UVUvMA+zR+YwHChYOM+ctX5bo=;
        b=T0HnpkodG2qxPzyBxIwmK9kDvsemOTAz0fecmiF0YPHvn0oekpalbXzCG4NLD4jy72
         uNletvDQ1iiNi/Z1rkADNFGBqk03/3Jkayp7D4FJl7AgpvdeU1g0F3D4MyrrNxOfgYj0
         C4z9VypSUc1qFcs6Cpgg4rhzXySNyCSMWkdf9DG/E3ggG015YKCWBydjSo84PppHaWBU
         8aduAHpXgZbUhVdIKegU8MdHz60iuT50DL4gYfo4F3ugaAhFuaILAVoYFydNg3LnsTXB
         VXczNJgawe1RX172CBCvbmEMuB80Do1Hjz6zCWjqcaP9z1k0PJtHaX7jJL9tOOKEUH0Y
         4IVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680593023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6IBB1OxNA9LO5K8H4UVUvMA+zR+YwHChYOM+ctX5bo=;
        b=FjBfP+uXCU+5Ef53AHOHMqr0dAYMhAYozzRldJ32AbyvmSzDb/b9uNM6R3dNez7V/t
         HNhkees6I0pb0xYMxTOY47B/CER/wpdUyTZwfSIQFnIWx2JXnTzkH7O31q1eWBCkyceP
         ujQmWN1Tz/PcTcTcsHY3fV0uJUjE7RmIdmEJaJEn7gA0rJc/cWCmlvSjWoHgnwESK/KT
         ndAuBLwRii5+ZqKo66ArkLUr0FU6py8LknpXq+BU4xtwvHtoJ0BUApDXSR7tpZBdmZzu
         QzJ2zcsT/QXFi1P+LLsGkNzNXRz15hLNZeExnAgiaAA9W4Lo239US5N4YuaDC8T/59Dp
         Dofw==
X-Gm-Message-State: AAQBX9d5iwQXRmRpBehbhh04fv6YMOM0evWVf+dPYHJqqSfgM69SSd8B
        AdAv2n2UPImlhIVx0WAf2Xl1pzc3cBGTlFv2s9n0pv/hNRXJDqBS
X-Google-Smtp-Source: AKy350ZToAAtSdRBEz/XWobtuEYk77xbVGfYjqadl4UdkySYiaYGB2b++QGNJioiunCL0571Whc/E1r2elo6h0jb0H0=
X-Received: by 2002:a81:9993:0:b0:544:bbd2:74be with SMTP id
 q141-20020a819993000000b00544bbd274bemr11629677ywg.4.1680593023620; Tue, 04
 Apr 2023 00:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230403142815.183891-1-brgl@bgdev.pl>
In-Reply-To: <20230403142815.183891-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Apr 2023 09:23:32 +0200
Message-ID: <CACRpkdY=KOW-6SvAogw-xCEg_1Gaqx3160wYxoYOxt0CuEYtkg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] tools: replace alphasort() with versionsort()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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

On Mon, Apr 3, 2023 at 4:28=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> With a high enough number of chips, gpiodetect currently sorts them
> like this:
(...)
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
