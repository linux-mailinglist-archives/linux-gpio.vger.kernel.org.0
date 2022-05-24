Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3D5532681
	for <lists+linux-gpio@lfdr.de>; Tue, 24 May 2022 11:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbiEXJgZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 May 2022 05:36:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233335AbiEXJgY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2022 05:36:24 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 637072CE0D
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2022 02:36:23 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-2ff53d86abbso156377117b3.8
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2022 02:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xRpPwI3wmsjp+C2gGlxp8U5sO4kmGZVtbwKPkVTVyT0=;
        b=ka9wQZ1fvb7CrFJ2TTUbJUbRf1dXYg2KJ4x0JJNhoyM8+5bGBRPdlw9Lc3+0U5NYp/
         uvI+pw0hpSVoYFKN+B0KHPxkFX+QRK6ObvS64W1DRrML8yuL4sxmuZUfu0iHCQpGIZBG
         8izuNM0JpTQPdwWfSzUr9bDDmfybMX9EDbF7emtBxzW8GftM6qsGyqcom6/+nibhEbLH
         MJGRbykJ7h2bmM94A9DXj/woRmcKrvCZKpBNqyJv8obcV4cl/xH1Z/rsx2AQew69TiGL
         DMeFxplmkpsuDmK7L01mo8UvmLFxR53s554au+mtFsHtLrI4UTxnlSGKl2p6zGtgXFQI
         yn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xRpPwI3wmsjp+C2gGlxp8U5sO4kmGZVtbwKPkVTVyT0=;
        b=q37jsmCZblDUK/n235MUXdE/ngyT+suT3PQt4sBhLpJds2QSfD1LSVxvezOsb5VHbW
         9j4zI9hjlJbhXqM/zNSLblEzKfypqgW4tZmbfz44BPYyrpZlhpIlMOLStAZB8uijnYfD
         AzvXoK2P++wcxyLc0A9F9Gzh9G0aBbQGy5p28aG3RxGUuuDd40liUZBkBysSGnqd8H0/
         v4aqe1StQERMZFEg+k9sqn3wHuOFXeQGCHd2F1oXs+/CWxNnNRbhwJ6ajHq94TnFeGmC
         OSF+n9XQABIIplX6rimGQEo2Hs1OA8lJWq9yH/NwgIRINYL52RIdmzugS4wFSSazsM26
         FQ7A==
X-Gm-Message-State: AOAM5305ld3snfqArLqBqqNHJHP33K80cFOAoJhxl81uvNI8F4s0uxi6
        M5qHM12citrGjn2QdjXf3wVc+o7PvGk8aUVvgoay1GHPf7A=
X-Google-Smtp-Source: ABdhPJxkB28rNrkPBCkBeXVZoA9gAhEuw2C72DUIukt0XB96tdjAGrCDc00SPyrI+IdeeJBu5Scdzbr2tvjvScy8t1A=
X-Received: by 2002:a81:99d8:0:b0:2ff:f419:59aa with SMTP id
 q207-20020a8199d8000000b002fff41959aamr9127748ywg.437.1653384982652; Tue, 24
 May 2022 02:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220524074007.2792445-1-Basavaraj.Natikar@amd.com> <20220524074007.2792445-2-Basavaraj.Natikar@amd.com>
In-Reply-To: <20220524074007.2792445-2-Basavaraj.Natikar@amd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 24 May 2022 11:36:11 +0200
Message-ID: <CACRpkdZ_0+Rp-4EfFjHNqnk6A29RQ1v7RZkg_9dP-To-Qt_oTg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] pinctrl: amd: Define and use PINCTRL_GRP
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     Shyam-sundar.S-k@amd.com, linux-gpio@vger.kernel.org
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

Hi Basavaraj,

thanks for your patch!

On Tue, May 24, 2022 at 9:40 AM Basavaraj Natikar
<Basavaraj.Natikar@amd.com> wrote:

> +#define PINCTRL_GRP(_name, _pins, _npins) \
> +       { .name = _name, .pins = _pins, .npins = _npins}

Please prefix this macro with AMD_ so it doesn't run the risk of namespace
collisions with generic macros, AMD_PINCTRL_GRP(...).

Yours,
Linus Walleij
