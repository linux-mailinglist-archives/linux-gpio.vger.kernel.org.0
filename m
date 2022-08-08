Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D86CA58C78C
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Aug 2022 13:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235999AbiHHLdM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Aug 2022 07:33:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230483AbiHHLdL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Aug 2022 07:33:11 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2E2AEE25;
        Mon,  8 Aug 2022 04:33:10 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 12so8331832pga.1;
        Mon, 08 Aug 2022 04:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=4n393S+wdyDCsdxiHVFNKM1A7ZRpcQ0/hD3Jek67Akw=;
        b=bpOkPN8yFzWKxiy7YTMTVfIRAi1t0UbUUQ4kXtHVL4ZJmsolx3Sp8bn/eUCsMfSXN/
         oadmnCy7SBWAVWWDr+kQc3lAmrRfV9FEBRV//596W2Q2HWNR4akL2x9airQAQiPa7JCF
         nvn++zctAM2ZtHPviIgw0wjSL9cwUrlU8MhPSXhaJEOaUZTQ9chh9770y/eoJK8dFauJ
         IHsJzI1cc3AKEiys/mpnI5WYp6Pnqo+vhZUH00hQkAWFXJwamy+kZ0QHrANkI8N0g6MF
         sRloLFUZAaY1yp51p9cXLS6OO0vkQYuoxfy63JY9tKjFUr70FicFeghLYxMDqA6/I8O5
         6Ymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=4n393S+wdyDCsdxiHVFNKM1A7ZRpcQ0/hD3Jek67Akw=;
        b=HWAaQxDy8ICohOMfUpnPpisgyXbMa5PHbTP++EfFlfUyGnOMjH8aVEXy/5aPhE7E7V
         KRuXWzwRK6wwdOuz01PhSSO9mE9FnW/P5fdHeFhHOimPlXZhF/BYzo3TnCyO+ZyhPM3k
         Kx+jvvfVzmP/KmUOULg8VYEKVvrYj2v3lGOEbcqBqsoArQgLbr0W6yrVtRIavH70UhH7
         VygJdaeFoNm2aFibgcSpj8UkOGSWLhDJ4RjMuv3uKxcmtz/ObivnLu+N4BWS1CXahXTD
         +OWmfYo+Bem65RH//c5XiTkeXPsXrNQwZeEuTtAJEdc5NLm7RFZuo4qlYALFH8h1Wcvd
         SS9g==
X-Gm-Message-State: ACgBeo1KxjK1tjowqW1CvJm98YI2FWo3c1su6L1a8FD/auHFkBqwNy3D
        0g0h2wfyK3mWdVoowYfdHnnwU0G8c0qPcaFkv7iur5cXoQ==
X-Google-Smtp-Source: AA6agR7Xlp4KRFbswm0HR1CrgrX4hSOc9IDPnZOb1vbXEAGm4zbSEPRxskJcKEWPrpZryQnYgyqiWcV7tOszg14/WGs=
X-Received: by 2002:a62:1c04:0:b0:52e:d2b4:c029 with SMTP id
 c4-20020a621c04000000b0052ed2b4c029mr12975122pfc.60.1659958389322; Mon, 08
 Aug 2022 04:33:09 -0700 (PDT)
MIME-Version: 1.0
From:   Johannes Pointner <h4nn35.work@gmail.com>
Date:   Mon, 8 Aug 2022 13:32:56 +0200
Message-ID: <CAHvQdo1KEM=Adp3Wd0ckokAs86mmemJbK14xzZuk=zVe0weTUA@mail.gmail.com>
Subject: am335x gpiochip numbering changed after 5.10
To:     linux-omap@vger.kernel.org,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Tony Lindgren <tony@atomide.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

I just tried to upgrade a am335x based board from 5.10 LTS to 5.15 LTS
and this broke an application for me because the gpiochip numbering
changed:
<= 5.10:
gpio0 == gpiochip0
gpio1 == gpiochip32
gpio2 == gpiochip64
gpio3 == gpiochip96

> 5.10
gpio0 == gpiochip96
gpio1 == gpiochip0
gpio2 == gpiochip32
gpio3 == gpiochip64

This is the same for /dev/gpiochipX

This is how it looks since 5.11(using 5.18.16):
dev:/sys/class/gpio# ls -la

lrwxrwxrwx    1 root     root             0 Apr 28 18:55 gpiochip0 ->
../../devices/platform/ocp/48000000.interconnect/48000000.interconnect:segment@0/48
04c000.target-module/4804c000.gpio/gpio/gpiochip0
lrwxrwxrwx    1 root     root             0 Apr 28 18:55 gpiochip32 ->
../../devices/platform/ocp/48000000.interconnect/48000000.interconnect:segment@100
000/481ac000.target-module/481ac000.gpio/gpio/gpiochip32
lrwxrwxrwx    1 root     root             0 Apr 28 18:55 gpiochip64 ->
../../devices/platform/ocp/48000000.interconnect/48000000.interconnect:segment@100
000/481ae000.target-module/481ae000.gpio/gpio/gpiochip64
lrwxrwxrwx    1 root     root             0 Apr 28 18:55 gpiochip96 ->
../../devices/platform/ocp/44c00000.interconnect/44c00000.interconnect:segment@200
000/44e07000.target-module/44e07000.gpio/gpio/gpiochip96

This is how it looks using kernel 5.10.135:
dev:/sys/class/gpio# ls -la
lrwxrwxrwx    1 root     root             0 Apr 28 17:43 gpiochip0 ->
../../devices/platform/ocp/44c00000.interconnect/44c00000.interconnect:segment@2000
00/44e07000.target-module/44e07000.gpio/gpio/gpiochip0
lrwxrwxrwx    1 root     root             0 Apr 28 17:43 gpiochip32 ->
../../devices/platform/ocp/48000000.interconnect/48000000.interconnect:segment@0/4
804c000.target-module/4804c000.gpio/gpio/gpiochip32
lrwxrwxrwx    1 root     root             0 Apr 28 17:43 gpiochip64 ->
../../devices/platform/ocp/48000000.interconnect/48000000.interconnect:segment@100
000/481ac000.target-module/481ac000.gpio/gpio/gpiochip64
lrwxrwxrwx    1 root     root             0 Apr 28 17:43 gpiochip96 ->
../../devices/platform/ocp/48000000.interconnect/48000000.interconnect:segment@100
000/481ae000.target-module/481ae000.gpio/gpio/gpiochip96

Did I configure something wrong or do I have to adjust the devicetree
for the board somehow?

Thx,
Hannes
