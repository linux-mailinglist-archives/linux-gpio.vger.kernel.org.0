Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CA766EFBC1
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Apr 2023 22:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239458AbjDZUgu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Apr 2023 16:36:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236396AbjDZUgt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Apr 2023 16:36:49 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E62E2D49
        for <linux-gpio@vger.kernel.org>; Wed, 26 Apr 2023 13:36:21 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-54fb9b1a421so59404697b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 26 Apr 2023 13:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682541380; x=1685133380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ND4i9CsrCBXdRAVmgI0G9BPv1mTmq6IezGxu6oq5fk=;
        b=GYRtUZ2X0+sgkY0tysSr3w6IJvTmUJ1MN6YPm5DJraG10KMjRyh3tqlR3JjEVlYn1Q
         SL2fkX7bf2xm9QprImxVK4qjjzggCxLIVLMetn8Tk99l5gr1/LulPXlF4xBHixJu59Wv
         trck/rYSpBn0FNVY5Ji1CeWHH5ukonD+feuVsY4CyWLAiy33RmHosp6I8pEQcQjcREKr
         9NoecWMkuXjSwnwehAItPbKyBL19z0W51iGadwGQ4mqGNNSCAVNtOOuNWWsvdCvdIQ/3
         TJ4aK4GSrAw6GlFQUrXtVQGRnGTR1z3bJMRXOsMX3G/Fkxec6lA7stx3I9JfSiRYCpi0
         3/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682541380; x=1685133380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ND4i9CsrCBXdRAVmgI0G9BPv1mTmq6IezGxu6oq5fk=;
        b=L4fdtqAOB6BD63izq6JbDumfAKRxe05iQ4GlJqQe8SXP3E3GhUYPx2jbpzh2NPE3GT
         D0/iT261RvbWkdWC2KMmdNGypP3KnEXHkyWoEsItm5GdUbhe7uJhm1xJMOMOsepJyCGV
         hJQKxPUmG3BfM6lFbizg2TcWBr9YJ6UYwIRP7aJlQ4tIS7QJd8Zdzu8IwQ4fSXi3Zdql
         64SwCXFaimRHsAGe/qepWZaJY1Y1a41wqvmeR2Zts1qoCb9yloSPh/A2EFzI4IteAURV
         K4qwsYQdcOJ5kSH+/31x6HrKSD2NmWqlM9lokrBklpir4BYf7HL79zMzrUy6edmV30GD
         54uA==
X-Gm-Message-State: AAQBX9dWRzJWMf5ICPcvp0wHfKXABLrjwmb17e7POLru9YV3+ODk9M5O
        BeQ4yuWdZgbOT5+wAvTXCFqgJ26lIDVRYYk3RxbheWwPpFR4b650
X-Google-Smtp-Source: AKy350a5ebuIuVeixNEnCvX6AAsiDqY35PAXz3jZaAHmZyyyGo2Z8licCoQ6qJwJVV9tfvCKHjha4EaY3hPH2pJM3Xw=
X-Received: by 2002:a81:6606:0:b0:541:7e07:ed65 with SMTP id
 a6-20020a816606000000b005417e07ed65mr13655350ywc.5.1682541379900; Wed, 26 Apr
 2023 13:36:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230425173241.GF444508@darkstar.musicnaut.iki.fi>
 <20230425201117.457f224c@aktux> <20230425183857.GG444508@darkstar.musicnaut.iki.fi>
 <20230425212040.5a4d5b09@aktux> <20230425193637.GH444508@darkstar.musicnaut.iki.fi>
 <20230425215848.247a936a@aktux> <20230426071910.GE14287@atomide.com>
In-Reply-To: <20230426071910.GE14287@atomide.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 26 Apr 2023 22:36:07 +0200
Message-ID: <CACRpkdb7a32Ny=JR7=pAW_QRMj-S5QuhcSN8U6_f4PhAXj5pRA@mail.gmail.com>
Subject: Re: [BISECTED REGRESSION] OMAP1 GPIO breakage
To:     Tony Lindgren <tony@atomide.com>
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 26, 2023 at 9:19=E2=80=AFAM Tony Lindgren <tony@atomide.com> wr=
ote:

> Not sure what the best way to fix this might be, adding Linus W to Cc too=
.
> Maybe using gpio line names in the legacy platform data instead of number=
s?

I sent a fat invasive fix which, if it works, will fix the problem once and
for all on OSK1.

If it works, I can write the same fix for Nokia 770 or whatever.

I think it is best to just get rid of the static GPIO numbers from these
boards so I took a stab at that.

Yours,
Linus Walleij
