Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67C996E15A7
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Apr 2023 22:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbjDMUKN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Apr 2023 16:10:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbjDMUKM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Apr 2023 16:10:12 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA2408A7A
        for <linux-gpio@vger.kernel.org>; Thu, 13 Apr 2023 13:10:10 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id n203so4957583ybg.6
        for <linux-gpio@vger.kernel.org>; Thu, 13 Apr 2023 13:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681416610; x=1684008610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EkC2Mphr7WSKoRI817+8hoMUL0XXQwcfaALAhlpY5E0=;
        b=y79qfZ7OAUGX+b2vNSwSgw4yfmShhsMLB471IQMXZkC/nWb2Dmu+TmE263zS/WnBX9
         o4iO1S1+theTZzFh/oeiXtTBKo2V+bx/Y8R6fxOOjyySOrBEQ3CCWtkBB4w+D7rJ0fgw
         +6WPLJSFobc/KKzUTJYiEhSOJFQKf8acTCm4vPDNjaoWYq5RIsVLLOw4q+2FImLGPJFv
         8RzShu8n6Vmg4PZpBzQkLN6PBZqgc/cGAM+KBeumdMFft+C8VCjMI7dCJYbcUceY/hoS
         +XeLYJS7iNCmWOmPE3kC3v8Ez8DUyy+QRMvMTe8FiBPrvRfMQu5pm98+qI6/eKFfpRmS
         0csA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681416610; x=1684008610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EkC2Mphr7WSKoRI817+8hoMUL0XXQwcfaALAhlpY5E0=;
        b=DFjf5oK8QRQLAIfkBt7tLwVK676f0lvc42HkqSB883z/+yklQHZNvHYO2Zlr5DxtmV
         jUAE6vYFr+xYHcVEP0nsBKpCo6vA6gqVr4I0SAioxZ6VYiINq6E5CUgh5l+ImcK7Gu2G
         45wQwtFVr+7SuDTAQSqYN6tKdTfk2XDEvtNqENKhLgrwmFiO7Bbl0qzYrUbjeArh/+DT
         r0IAjf2J0nZOP7rdAzW6f9ipFavA/uRpNwysOXSTH+qyc0CIhvsRliMmdw8dp1oD7Adg
         p6kt0gGG8+/wD35kUsCVt6Orb5zVyKI+KUwjERlS8qAhDqf93FHIo/9ERYlkdXs867h1
         wzHg==
X-Gm-Message-State: AAQBX9dCt0pPOICsQI4cFUC5J7LZGymlFqeMMzH+QVxE+nd6n+zSlpJr
        jJhdtVbHo84AHQg60ymNQZl9yjBBGDKgY+BWFort3g==
X-Google-Smtp-Source: AKy350b25b/Uqh3DLW/iycwdW+5m41ABVoTqYSS/5BDpv+5p1Yz9XfE9Itgw6Wjl/nG2dU2Xz+hUZDlsDykUJ6X1FgE=
X-Received: by 2002:a25:76c4:0:b0:b75:8ac3:d5d2 with SMTP id
 r187-20020a2576c4000000b00b758ac3d5d2mr2324207ybc.4.1681416610066; Thu, 13
 Apr 2023 13:10:10 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 13 Apr 2023 22:09:58 +0200
Message-ID: <CACRpkdZsoGihp-cVVKTMPFBPBj_7_ScaYJZFU6jZNugucyx3qg@mail.gmail.com>
Subject: [GIT PULL] Pin control fix for AMD laptops
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Thorsten Leemhuis <regressions@leemhuis.info>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Kornel_Dul=C4=99ba?= <korneld@chromium.org>
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

Hi Linus,

please pull the following single fix which is a revert of a previous
fix that has issues.

Yours,
Linus Walleij

The following changes since commit 7e364e56293bb98cae1b55fd835f5991c4e96e7d=
:

  Linux 6.3-rc5 (2023-04-02 14:29:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.3-3

for you to fetch changes up to 534e465845ebfb4a97eb5459d3931a0b35e3b9a5:

  Revert "pinctrl: amd: Disable and mask interrupts on resume"
(2023-04-11 22:45:42 +0200)

----------------------------------------------------------------
This is just a revert of the AMD fix, because the fix fixed
broken some laptops. We are working on a proper solution.

----------------------------------------------------------------
Kornel Dul=C4=99ba (1):
      Revert "pinctrl: amd: Disable and mask interrupts on resume"

 drivers/pinctrl/pinctrl-amd.c | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)
