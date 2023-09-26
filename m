Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77A4A7AF50B
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Sep 2023 22:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235790AbjIZU1Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Sep 2023 16:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231564AbjIZU1P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Sep 2023 16:27:15 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEF71126
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 13:27:07 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-59e77e4f707so118298077b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 13:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695760027; x=1696364827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgr0elKj9lSA9DaoOQmGSleBXdUJYBk6OqVSBI3fCoo=;
        b=aawmHcirD8DsgSzYr46dSgc4RX94o0O2lew5iksT9aga1rcSVvJ/hnXDM8V6FitWsq
         Zcuv2+/iFeZwd7H4RNkuMTTpIR7BroGfS/2DmW90GH6GPs8eNY4csyymim1Z/hfPwRYh
         FBN9QAUERNuKBknhnJK4B/6aOMTy8eiCqnEiskfVtEG/mouwUm0iTHhHxDXF6JfMpAan
         zZDGphm7arpqIv4aBe8pwh1VQMAy/v9ootmIrttgW/l/3e09PoEHA+oB5vxEvacZ9F/9
         wxwwF4mWGcVCcNgVyNlNC11xRoei6//gAW5jqnQNvIPKxlGJTTqGOGAbGcY3Zt/50qT0
         +wNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695760027; x=1696364827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wgr0elKj9lSA9DaoOQmGSleBXdUJYBk6OqVSBI3fCoo=;
        b=JYz381RMOoaGT7mgGQD+pS+5Lzu1b/mYqrGqfio4TSELA5zd8jtqiohotMc7Zqf6tI
         SHli92Yal4h8rrQJ9X/UpJpbIeWAIOYZ6MIyprY2jm9WR3hL/FbVoQX6n8DQQpZXGwBd
         cdpnROl15N/DA0iCI9bltgRJtW3u/JIC3J5T3wRabVZP830xvnoQHfPyS6rGB+1NJEnm
         MTaU8jGKxL0I+j85du19VTQicSivyqx4Lj8iwEWiIX066j7Pw0NCsrpKW0A0//IwC9Gi
         Id9O6LRKwdRDtY/1WuAugI2w4XFzGA2qYf1gKsY7PBZMkBZ+wScWq4UM0ca87FRkNQmF
         dM/A==
X-Gm-Message-State: AOJu0YxN29lQzc9GMJIeHQucP2mNCmxPUgqRlTWtmlOBH2wC3dCYXxCM
        Tymq2BgGSL+wzqrngvom613tMWme7lj1ykgAURB9Mw==
X-Google-Smtp-Source: AGHT+IE9ToDynTpmGcT5P/uZKHvPeXXQc+bPT+qu/G4gEmvRth4jAWXdjvJ1oG4ktxEO98GYZKAnKHIrOYHNrw3dF/A=
X-Received: by 2002:a0d:e442:0:b0:59f:4f56:59bc with SMTP id
 n63-20020a0de442000000b0059f4f5659bcmr59412ywe.42.1695760026911; Tue, 26 Sep
 2023 13:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230926-pxa-gpio-v2-0-984464d165dd@skole.hr> <20230926-pxa-gpio-v2-3-984464d165dd@skole.hr>
In-Reply-To: <20230926-pxa-gpio-v2-3-984464d165dd@skole.hr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Sep 2023 22:26:56 +0200
Message-ID: <CACRpkdb8SwC=W6=Tiz0Uxk1MeQq2gBmDYQYyeKbWFzvaGA2mGQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/6] ARM: pxa: Convert Spitz CF power control to
 GPIO descriptors
To:     =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 26, 2023 at 5:46=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic=
@skole.hr> wrote:

> Sharp's Spitz board still uses the legacy GPIO interface for controlling
> the power supply to its CF and SD card slots.
>
> Convert it to use the GPIO descriptor interface.
>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
