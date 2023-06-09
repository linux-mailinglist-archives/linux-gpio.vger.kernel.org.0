Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 574647293F0
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 10:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241140AbjFII4h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 04:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241195AbjFIIz4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 04:55:56 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B215146A5
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 01:54:48 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-565c7399afaso14325447b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2023 01:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686300874; x=1688892874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=isGRI57abFTSmMxuS25eHokD96Z3GdYwa9dpc4Kssx4=;
        b=Iu1GCCLOrif/BHp9FDKqfy9yiMqyfzHGVY+jsx9g8ssylaQyUT8og48R7HciG34z7r
         PaYLhyDBGSAD6oF5C6fWSOi4e1QWO+XqObftQy5+o+D1tJ1buQtL7LkjD7WM5s72VQUc
         lwcZJgKVghfOWNQlGbHjDkKmjsyGkUTyNlupTwh+DpYm8rBdFKkaHs02bwB3j/PNMEEx
         zOzUaQzshFup6aqoj1SuOxsvWP46GSWVy0ezaqNy1eHBKSBy5yZcjEocuvg7DM2NAfV9
         7o86rQ6zx7rFyo2y8rL2HuHIJsZtFV/sVGfCYYtAg58/11KkJkENmhlWpVgSHtRQMBtM
         XcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686300874; x=1688892874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=isGRI57abFTSmMxuS25eHokD96Z3GdYwa9dpc4Kssx4=;
        b=al9rN75iNOO9ISOmujcPonaHBUFpH5XyP1X0gAzDi2DjFvREp3N+9YwhMnth5diYVO
         E381VLtwfJjK59WdgyEgJQaAXeFTh+Nj79Xz9N134/nqFtGPo6tjTznwun40CxghPNm8
         lw1mToDw/90xhBQrMaHeh02VIlsh8kJ6cQvv7tIxoVwiz5RYrCx1zG7kjDGJGGoWdxzP
         zEwTAgeOMhRHx+m9W6eHLigfj4kPka1uk18t1c7IcvzK7j+d0vRjJRoaYfopOi0Re7bp
         mdHJEhjahkpYr4gUhJiH/HcjeRre6xm/9sWwYjiaGc4yhRADtf+boQGn/CbKqDwxP3dK
         juVQ==
X-Gm-Message-State: AC+VfDxOypVrGsHVrWyC3uDeTT9+CwBgamsnwu0HHtyIdMIxmA5HIEV7
        3O5OT9+F6Dqm82Thw6AbRPf/UAQvE7Xu1bp46G92uDbm+kjnABhWAzo=
X-Google-Smtp-Source: ACHHUZ5zDWfO6N1U5NQqvAMibPOX2lX0OgH4TMaLHfMbiizukKMFPoR9Dqb9TNr7WchihMaBZlXa98pcYB02NUrAMiU=
X-Received: by 2002:a25:20d4:0:b0:bb3:912d:60bc with SMTP id
 g203-20020a2520d4000000b00bb3912d60bcmr478687ybg.64.1686300874447; Fri, 09
 Jun 2023 01:54:34 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 9 Jun 2023 10:54:23 +0200
Message-ID: <CACRpkdbUZ=V+C+kyu40hCtgtzDRVfKwdwaZ4uJhDPSuhwRrgEA@mail.gmail.com>
Subject: [GIT PULL] pin control fix for v6.4
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
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

Hi Linus,

just a single patch for a driver so far this cycle.
Not much to say about it.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b=
:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.4-2

for you to fetch changes up to 5b10ff013e8a57f8845615ac2cc37edf7f6eef05:

  pinctrl: meson-axg: add missing GPIOA_18 gpio group (2023-05-16
15:02:01 +0200)

----------------------------------------------------------------
A single fix for the Meson driver, nothing else has surfaced
so far this cycle.

----------------------------------------------------------------
Martin Hundeb=C3=B8ll (1):
      pinctrl: meson-axg: add missing GPIOA_18 gpio group

 drivers/pinctrl/meson/pinctrl-meson-axg.c | 1 +
 1 file changed, 1 insertion(+)
