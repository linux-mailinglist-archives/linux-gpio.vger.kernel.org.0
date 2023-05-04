Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D13116F6794
	for <lists+linux-gpio@lfdr.de>; Thu,  4 May 2023 10:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbjEDIeO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 May 2023 04:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbjEDIdv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 May 2023 04:33:51 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C60E765BA
        for <linux-gpio@vger.kernel.org>; Thu,  4 May 2023 01:31:28 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-ba1911d60f5so354145276.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 May 2023 01:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683189086; x=1685781086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UD2uVE871/3Bwl8erOX6eiE3xiHdPRaeNpyTkyd9quY=;
        b=ObDLBY7YQ/VCEMzin4mcPlyeAYR/gE9FvDFpQtTIH3hDay/XOvO/iQ8+UVBPakdIpY
         PfcZTuBWCyAE61aYOr0bFeosAfotEx1B7O7e87PuYvDkEktj6ctNZdDkEjxzzzSLkyu1
         XK+SZ/f5v48qAaggRblrtabl0ZG6USpJr8VqguF4GQ13n4bBHir/ie5AskjajdVFMBez
         tH53t/MonRrR7L2QrCZxjYQur8RaztrSaYE5mnF/nTy2BPcVi8/aWMNzmGyR7gGFrfR6
         hV0lknWWXBF0LYq+Ry/zR49qJfiz+LmhZI46FUhW60rdw0iPDgGluLoofA1E8I995vmX
         0Gew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683189086; x=1685781086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UD2uVE871/3Bwl8erOX6eiE3xiHdPRaeNpyTkyd9quY=;
        b=YenHZQ94IQuxrvHnO9VZFLihHpPH9VK3Wz/oQoEsaeo4mjghxposFvbwD5CPYzSgRN
         s2nFb26G1NsmSVzfLH6vVvWmw4ogbD9fEHw/XdRAoAfNB8aqYpDptMLHzGnTkgrnI0xm
         Mns107uGPDl5VDJY4EReO5fFOpelOvBwe/TpB06gvh8fz55Irl7lQhyx19vdMrJ8oskf
         Uf1vjrj22wGA1J5OsXtPreWYIGBmKOTUUSPwCxK2vbKJuCOIYXI63p0jS8yQzJoihFUV
         XrAjsLaW2o3aSBb2gWME2LWkuEMGM+gOth1MrkdU11AR6D5P+R6QttwHdF+tJ+2A2JHj
         GNNA==
X-Gm-Message-State: AC+VfDyy258KTRLEIZTjBrDEwSmG64z91tvrTT+wWl54xaaeFJApYQ0X
        VzUVWuoxXJ8XZpJ+obd02JScmN2Sx7i1FaAa82MD3Q==
X-Google-Smtp-Source: ACHHUZ6pPAYF0mv1cniwON0hpLsr/9uyTOVIyGdmAqIrCDWc4T1cJ6zndQIO8g7W4TGFWnaaQ6lJtZbSQ16vtFYMM2c=
X-Received: by 2002:a25:4f56:0:b0:b9d:689d:7430 with SMTP id
 d83-20020a254f56000000b00b9d689d7430mr18730703ybb.49.1683189085800; Thu, 04
 May 2023 01:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <aa493d62327f26e4c65d649a812346cdfb26771f.camel@siemens.com> <20230504053509.GN14287@atomide.com>
In-Reply-To: <20230504053509.GN14287@atomide.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 May 2023 10:31:14 +0200
Message-ID: <CACRpkdaQe61Jk6WoCr8vYkGKJPMiM7D+iF0w9fKjoOxBWtinhg@mail.gmail.com>
Subject: Re: Pinconf issues on AMxxx plattforms
To:     Tony Lindgren <tony@atomide.com>
Cc:     "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "haojian.zhuang@linaro.org" <haojian.zhuang@linaro.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 4, 2023 at 7:35=E2=80=AFAM Tony Lindgren <tony@atomide.com> wro=
te:
> * Niedermayr, BENEDIKT <benedikt.niedermayr@siemens.com> [230503 08:38]:

> > We encountered some issues when accessing the gpiochardev interface on =
an
> > AM65xx plaform.

Thank you for using contemporary APIs!

> > The pinctrl offers 3 different options for muxing:
> >
> > 1.  Using the generic kernel APIs:
> >      Call pinctrl_select_state() function as stated
> > in  Documentation/driver-api/pin-control.rst (section "Pin control requ=
ests
> > from drivers").
> >      This function will select a defined state which has been defined i=
n DTB
> > with "pinctrl-0", "pinctrl-1", "pinctrl-x"
> > 2.  Mux pins with debugfs:
> >      Write the desired pingroup and pinfunction into the "pinmux-select=
"
> > file of the related pin controller.
> > 3. Mux the GPIO function of a requested GPIO pin by calling the pinctrl
> > drivers pcs_request_gpio() function.
> >
> > The problem now is that only option 1. will store the current mux
> > information in the pinctrl subsystems core.
> > The pinctrl-single driver highly depends on that information, which is =
not
> > available at all wenn muxing with options 2&3.
> >
> > I was able to fix that for option 2 but not for option 3. The problem h=
ere
> > is that the pcs_request_gpio() function just does not provide enough
> > parameters with sufficient information for achieving that task.

The fact that 3) doesn't work has to do with how pinctrl-single has
been engineered I think, what the pinctrl_ops .gpio_request_enable/
.gpio_disable_free/.gpio_set_direction provide is a "shortcut"
for drivers that want to take it, in case they can provide the right
information.

The pinctrl-single driver only implements .gpio_request_enable()
but often that is enough.

Then it is the callbacks for generic config that you said you already
added to gpio-davinci.c, so that part should be fine, patches welcome!

Yours,
Linus Walleij
