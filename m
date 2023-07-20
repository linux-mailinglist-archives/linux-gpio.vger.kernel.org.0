Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5722E75B7CC
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 21:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbjGTTTU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 15:19:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbjGTTTT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 15:19:19 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 265701731
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 12:19:18 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5838881e30bso5110687b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 12:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689880757; x=1690485557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=als7alM6wl4HPiHeVC1qkxagLYbhNVGTD2+M73cPKzc=;
        b=c/2EGs3153+d36iIDKMBGGpJdLhaWp0J0+avlVYwQbipjDwrNg1CM/2Eel2ExzaWhz
         gfKouqm1OWCjQMp9vFkSCmbBT0MtSL89ti6yWZrB+y0YX0FoC/p9Vovee3BmWb9NanvF
         S0rcwvy/rc4nJTfc3tD+sUhAwFEleh+s8nvdrW3tm6CxOT0S1pFOl8FjlwRoMd8biDNE
         kWUsooKupU9rS9tWAY4xuOMoIOYqtCKhlnlhjtapToc2UAjeZiF3du3bZ6yxKahsci8H
         ctNwKE8/lSmxqrPEPKwmDBiZCAiN5BozfVb1sjllJw3h2wgJI/hm4KE6CmrrARY5dKCn
         of8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689880757; x=1690485557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=als7alM6wl4HPiHeVC1qkxagLYbhNVGTD2+M73cPKzc=;
        b=Rr9m+OU1kSW8G0LWP1yCtRp0JdT/xrMNimapRv7q3QWRsuy4Wu1yrizL/9LOrQZcWX
         KmAbP1n8mCKviKGPPdpZoq7iVj039/XffSmalkjt91R0ab8kG1IAfgDJa6Rk9z8kEAMu
         16SxS73AgvZlzlZpq2uBZNVK93/ceyU2FLcB6xo3H8E2yfvN6VHCZRX2JmRMgue9OxLM
         8/5uAyj4chVLQDOtanTR9Qy3w1qP4zQCpT3yU/5MFOwYixjDzncJgcfh48trHWM6Hx74
         czradMLjXrNDlWSl6W7kwdNfU4M7w+T3k6LFHDVrrzYk3u47oY1Akp1Emlb7GH/BP3V2
         qYog==
X-Gm-Message-State: ABy/qLZ2XssKQgHOfrGprXZqzELI7d3ElCh8+kB+zUlJiAGzi7OvCMYL
        ePiffBF4uuQ03bE6AVHYYtkdtktiT0NU5nMBCiGWwg==
X-Google-Smtp-Source: APBJJlEKHsTY3J3aR/UfecQYYLRiOprm4ld8yB/fRlOfar6oxQEJ/1bIkz0iXkP5eRvlGd0WILMSfkBtBRsrnItYvCQ=
X-Received: by 2002:a25:68cf:0:b0:cef:bc0b:11b with SMTP id
 d198-20020a2568cf000000b00cefbc0b011bmr5731048ybc.51.1689880757343; Thu, 20
 Jul 2023 12:19:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230714081902.2621771-1-Naresh.Solanki@9elements.com>
In-Reply-To: <20230714081902.2621771-1-Naresh.Solanki@9elements.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 20 Jul 2023 21:19:05 +0200
Message-ID: <CACRpkdasmjUFZ6vnNe7HYoWgi2rSgX9uX9S9Szvb5r8ecr3vpA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: cypress,cy8c95x0: Add reset pin
To:     Naresh Solanki <naresh.solanki@9elements.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Naresh!

On Fri, Jul 14, 2023 at 10:19=E2=80=AFAM Naresh Solanki
<naresh.solanki@9elements.com> wrote:

> From: Patrick Rudolph <patrick.rudolph@9elements.com>
>
> This patch adds support for an optional reset pin.
>
> The reset pin is used to bring the chip into a known state and has an
> internal pull-down, allowing it to be left floating if not needed.
>
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>

Both patches applied!

Yours,
Linus Walleij
