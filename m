Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D552C5ADAB2
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 23:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231739AbiIEVJ3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 17:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237816AbiIEVIk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 17:08:40 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 683806744B
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 14:08:25 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id fc24so10190743ejc.3
        for <linux-gpio@vger.kernel.org>; Mon, 05 Sep 2022 14:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=j2DqM/8hgkfiAr31ueIS9a3oRbjRe0mVpYtwXdqsEp8=;
        b=V2Z5XISr45XJcb9dcJaRR2oK4C88Hef0QSmVHknlGECt38JSjr/TZkcQySYUIrPO9J
         //M3VD3dJElEfTVRabQ+d9Ecu1tRnblT/fiShvbu/oiLoTKn4s+JqTfl96TM+hAVL8HU
         u2Vd8G+BUORKp7KsP+ICPmrfKxco6HQhw5COV1FmafRX/ajzh7p1SoyWNXPJO4irgIS1
         xlbeGydsG+xRJUZ3sngYkdeed+1+7UUU7LxshpYbkv7c03QlMkyfAFrdsdekA4pTs8uP
         bUCtVX0aRVIkVw59cYH6adaXhIbJC5ZgGnQAWttvEncfqZqz5b3pmlnmlZ4dm+zKHOOQ
         tOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=j2DqM/8hgkfiAr31ueIS9a3oRbjRe0mVpYtwXdqsEp8=;
        b=Ap39hXFoD7EyvcsHILHeiJFYFYKr9/XZFGi2xNYQO9uwl3WgnUhVk5aHqb6HyY/3aa
         52iVckJYaPhlmLaM0hRwcoHndOsGhZaEDSUF84g5EfrAS1V3wRRFWodX9Q0qtJnaFNnU
         e4J6YrseaRI33OdDBo3eZGCDllOoasxrHodvcLSYvLQATEYF4GraLWbJMOYYVbkGpJuI
         xPy/UjDYU8/mwd0HQK7yTGjqQwHw5T9JG81GMY0fcz2lYg3/JuJMBDzHz9iCjUyo4h9m
         PzssMnjek4p131EjfkV7b6/Q4XJeeIjq5b7ci/aQQ5yQLxMe4zEmHUqRnUqtIRJ/pz9v
         /7Mw==
X-Gm-Message-State: ACgBeo2QT7mZs3yZwF9yzk7toYgxpl+xqt4dNV9KNC5nrU0oCpmSh9cx
        GK1cWe94k+ZIfs8q7JIQeWzsL4AbiK1SC9BRdEpH2A==
X-Google-Smtp-Source: AA6agR41fS5FZpFLpIIl7PuQKQ+C/EaKhtCFHZJrMPq6shnH5BpEhlt+An7+V7zB21RHoWvvXM2pomBmboX8OH+dj3M=
X-Received: by 2002:a17:907:2707:b0:741:7c18:4e76 with SMTP id
 w7-20020a170907270700b007417c184e76mr25618867ejk.690.1662412103213; Mon, 05
 Sep 2022 14:08:23 -0700 (PDT)
MIME-Version: 1.0
References: <202209050952.vfkohsRg-lkp@intel.com>
In-Reply-To: <202209050952.vfkohsRg-lkp@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Sep 2022 23:08:11 +0200
Message-ID: <CACRpkdaLQ68VfYCfv40hGuGnpaMKchiTOSTJy9rnDKnBOQnFDw@mail.gmail.com>
Subject: Re: [linusw-pinctrl:devel 26/32] kismet: WARNING: unmet direct
 dependencies detected for PINCTRL_IMX when selected by PINCTRL_IMX8MM
To:     kernel test robot <lkp@intel.com>
Cc:     Francesco Dolcini <francesco.dolcini@toradex.com>,
        Paul Gazzillo <paul@pgazz.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        kbuild-all@lists.01.org, linux-gpio@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 5, 2022 at 3:55 AM kernel test robot <lkp@intel.com> wrote:

> kismet warnings: (new ones prefixed by >>)
> >> kismet: WARNING: unmet direct dependencies detected for PINCTRL_IMX when selected by PINCTRL_IMX8MM
>
>    WARNING: unmet direct dependencies detected for PINCTRL_IMX
>      Depends on [n]: PINCTRL [=y] && OF [=n]
>      Selected by [y]:
>      - PINCTRL_IMX8MM [=y] && PINCTRL [=y] && SOC_IMX8M [=y]

I have a hard time to understand these warnings at times, but I suspect
you need a
depends on OF

Yours,
Linus Walleij
