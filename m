Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 905EC7A7A16
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Sep 2023 13:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234336AbjITLJF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Sep 2023 07:09:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234344AbjITLJE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Sep 2023 07:09:04 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A52E3D3
        for <linux-gpio@vger.kernel.org>; Wed, 20 Sep 2023 04:08:58 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-59c0b9ad491so51758637b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 Sep 2023 04:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695208138; x=1695812938; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jo3K5hZEHtRUmMkWajypIc1dzDZhC7YyfBmpkmzcjA=;
        b=XBQDcZDC+bnCYYOFE+xyC+TAQTVTCAnzDGY+uaCoYvczS5vhtyLNnibVmDxq3XYu24
         M9o6omgaeEWb2BiF38R+1iBwhYGYslMzeOTL+UX+3jmcq4KSuQjOQeb0zs6LJXwrjwwN
         jcRwLij3v1wWG5yZCflRWWZWowbvWfRC9INmjSkaprxLTGIqsCZIMzC0fFdcMnsgV1u0
         vWXk2pq23Uzl+shrABZ88Lttc5x1UcY03WRqh9+ECMHmPLPwQITouS6QlQ+wlXHj5vsq
         A73SEthWsek/dI2CQZcsAlx+J5hvNrxwwfybI9cpVkB+79VBNQ94lUziAsjPTbnRgKv/
         S4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695208138; x=1695812938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9jo3K5hZEHtRUmMkWajypIc1dzDZhC7YyfBmpkmzcjA=;
        b=Uvf1KurOmdTO9vJzQsBrI5VEhwUenkLnqbchkV+QPHf4qFp/esEMwarBqaTGzz+CQI
         L93+MvjQgoWp/hHXcNRh3D6Osm0VATjA3suhqcvjydY0S2Oi924A1yAeyJwcOsAnnYhA
         Ypdi0A2OtuAEz4ti1IRAzoCA8SvvXwFUUis0fKdxfBWpj6rMmDh7+dvHTAGsHcthIob8
         8AkR7KTJEdYqmMdz6mUCZkcgoYtTmAJ4CfaXzzdwYQpNWfCi6iBpKk4t+7pbaLVd90fP
         0gdFBsKrrWJX+VbCThyzqvuSTAO+8cWezXpJe08ywh4t9AwnuaUEwPDKhTtesb7V+PPz
         vglw==
X-Gm-Message-State: AOJu0YyeGbuUFvmMDvZ0Wy06Wbg7yegtjNf4aH+J8g2JndG6kvtDr0TO
        Ndsuhz0CeHhi4yafCj7CMjlnjE9e5RIWr5afxKMaSA==
X-Google-Smtp-Source: AGHT+IEiI8ik+VkdOGL8Ne6V9Qo2SCzhnEr1PXNFQ7Bz4n/o9x1S/fTMugXn6kmF3YFQ+9wxYfMTDITWHbdgWvrlvY4=
X-Received: by 2002:a0d:c804:0:b0:59b:d3cd:ffb6 with SMTP id
 k4-20020a0dc804000000b0059bd3cdffb6mr2147130ywd.33.1695208137793; Wed, 20 Sep
 2023 04:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230919101117.4097-1-tychang@realtek.com>
In-Reply-To: <20230919101117.4097-1-tychang@realtek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 20 Sep 2023 13:08:46 +0200
Message-ID: <CACRpkdYtGhhNuBnP0MvMKiqP=wPsv=5K_ZBaWcgW3sssLrm2aQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Add pinctrl driver support for Realtek DHC SoCs
To:     Tzuyi Chang <tychang@realtek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

Hi Tzuyi,


On Tue, Sep 19, 2023 at 12:12=E2=80=AFPM Tzuyi Chang <tychang@realtek.com> =
wrote:

> These patches add the bindings and the pinctrl drivers for Realtek
> DHC(Digital Home Center) RTD SoCs(RTD1619B, RTD1319D and RTD1315E).

All patches look good, bindings are reviewed by Rob, my comments
addressed: patches applied for kernel v6.6!

Excellent work on this patch series! Thank you.

Yours,
Linus Walleij
