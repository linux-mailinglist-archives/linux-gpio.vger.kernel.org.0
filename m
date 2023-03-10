Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB2E76B54AB
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Mar 2023 23:41:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231809AbjCJWlx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Mar 2023 17:41:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231910AbjCJWle (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Mar 2023 17:41:34 -0500
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A487712D499
        for <linux-gpio@vger.kernel.org>; Fri, 10 Mar 2023 14:41:13 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-536bf92b55cso125362197b3.12
        for <linux-gpio@vger.kernel.org>; Fri, 10 Mar 2023 14:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678488067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1aftclsUhWmphLkfemzrh1K/OBXmzihg5eefzEYPw+k=;
        b=nbEnUvGAptC6Dvb8Z8VClAt0zGS48Qvn9jEBtm/48U8E11t9E6aJpwUIZvuLrT+VwW
         gM+JzEwhyYU8X6KwlHEhTzR01cHLo/hfprbrafbZqkFR3RwmfBk13Wbn+HsTdqd8kwr3
         xifIkd+7YrKW+LV6tnpkJI8juZhDd5SkdVdJQASDST7VCsr0mx9ABNjo+gZYPhITHc10
         33LlHJwwhFhSI33tL1T1HKDDlohbJMj9yQebT0QJKGDWKEZzg59kNUk23lq2qtIHmNH9
         C/lbeS+L+U8jR/2aN8mGJyj6DA1S6QGNJVRuvbI6UM2nyNoPOg7WCAZdfo7faOnUvQZ+
         zctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678488067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1aftclsUhWmphLkfemzrh1K/OBXmzihg5eefzEYPw+k=;
        b=p+aG20pRM+kAFkTvzsB00h43U1sXAdKD0Bwt/it2vM+AYbVkAPdt3ujE17JFoQilnQ
         kPWMoHzGqfoAQjEHMP+gq9Bk3ZjEQ8R0YDs2lhZmQgxKRPqe2DAFw/Wwba9bcJ+bczuy
         BTM+susWsF+Wp92oEC/6VkEX8/aNrqlyuCPosN/FbF+vc31FdsbIa4ePwlA5n5lS3m5x
         Cz3CfJsgFKjMdi3wMzUFmJ1UkTipUSE2PoU3D/iDFaDXMkIGKOkuMGDn9HW3z+ek07i9
         G/qt39bzkhClQIZcIyHYbkOAWnNEOXuSrFzEWMDQSyr3YqTVZ6SxPr6+pcxK7/66UPbt
         LzCA==
X-Gm-Message-State: AO0yUKXVyWqdT40TANYMB3z+x4Gm28ucbaaN7dVjkYq9+YqgGwpQ3YVy
        zLWO1Ll3fSr/1MKVhEYf1RXyACVidwZbmg8YaPfCOg==
X-Google-Smtp-Source: AK7set940+9rhyqyXAiFfMWF6c7q0XNwbN2iIqYffWuuus/jSXrk0DiORFRDnJH7oZLCeCmXStNJELQRSLJsmev5iBk=
X-Received: by 2002:a81:a9c6:0:b0:52e:f77c:315d with SMTP id
 g189-20020a81a9c6000000b0052ef77c315dmr2745611ywh.3.1678488067270; Fri, 10
 Mar 2023 14:41:07 -0800 (PST)
MIME-Version: 1.0
References: <20230310144704.1542114-1-robh@kernel.org>
In-Reply-To: <20230310144704.1542114-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 10 Mar 2023 23:40:56 +0100
Message-ID: <CACRpkda+aEUD7A2e-TfY3=yJG4L+P+Zh8G9U1K0xHHA-DxnJiA@mail.gmail.com>
Subject: Re: [PATCH] gpio: Use of_property_read_bool() for boolean properties
To:     Rob Herring <robh@kernel.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 10, 2023 at 3:47=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties.
> Convert reading boolean properties to to of_property_read_bool().
>
> Signed-off-by: Rob Herring <robh@kernel.org>

You are using of_property_present() rather than of_property_read_bool()
but I'm not picky about commit message details.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
