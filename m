Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE5236D3042
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Apr 2023 13:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbjDALut (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Apr 2023 07:50:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjDALus (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Apr 2023 07:50:48 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A761D864
        for <linux-gpio@vger.kernel.org>; Sat,  1 Apr 2023 04:50:47 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id a5so24123455qto.6
        for <linux-gpio@vger.kernel.org>; Sat, 01 Apr 2023 04:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680349846;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WqGpnxzWplzffE6Th9lsSK73X294LhiCIk+YQ6eCW7g=;
        b=IdaItY++KSAxKZE2GD7GhsNxkwQbc3fvdwXlQ+Sjtrc48U8WTU3hEPD5sqs6zdkhNX
         xGO8CSES2iZbIQIfV5q8HejzNhF8E/r+ofM8CfqVTVrljE+NxCMFunXeSlx/OE2uzId7
         GtMnDszaMXZwsQRnceuVPTkRhCADmo0VbY9A7rzQ9k4UZNuFdOCqbYufQRjJr2JCxoYD
         WemBqCfxxkPqVC9dfzVnm1R+x/QNMlV3IcrjCOWeXGT6bZ8axblx2JywtqEg1HaI1pmW
         y+rSDk7qke7iKxHL9AQGoJDbD6sJFEGrt2i3mlbQsfP72jrh9YP9s8nQCSj/Xkf78hgO
         +52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680349846;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WqGpnxzWplzffE6Th9lsSK73X294LhiCIk+YQ6eCW7g=;
        b=E4Jbp/Z0dYWG5xtO653A6wMvuHiaJX/WrCa7FEoBHcUsvIVDdhOyfmRFIue9pumTC3
         hsdP1si5xk/KSgrA7fzB4n1WUC2DHglsnAGYDtGuO2+0JQ0DWz/ql9jUZTYS4Nwlq8xI
         RHWs6YR0gxwYnrCjv5Hl3fPfz9rprIv7bXVOEtM2Ud2T1wGO4brIkfPkL0MxEoWR54cO
         ZhI5Ml5l8Cj6oi+MZVItNuHF0K/N1KFKlQJtpyVfF4La4H1xIWqQeV1ClMedxzbDpxuX
         YRBQvSt6AhT9IDneZwKr0HhA88fcXJeuuEsZh511IqRznoPqOAB52jLLcHgi+zt5F1u4
         LC+A==
X-Gm-Message-State: AO0yUKUwvzTWkkETf9EvlLGbN53D9XfqhdtyBGZHSkxKvJJvRzL7rslL
        BOVE7yzwMss8d3/fSE3zMBlu1UAwqSKRMXAVM8Y=
X-Google-Smtp-Source: AK7set+Dny1YsnqENzHhY58L7BiqyweUljQb8ebkmBz6OxDPgQHOV1UidTkmkSWv/lZK/1QRnSR1ptHaOUWbawlx7yQ=
X-Received: by 2002:a05:622a:b:b0:3df:58e7:4aa5 with SMTP id
 x11-20020a05622a000b00b003df58e74aa5mr11649376qtw.0.1680349845799; Sat, 01
 Apr 2023 04:50:45 -0700 (PDT)
MIME-Version: 1.0
Sender: hraymar912@gmail.com
Received: by 2002:a05:622a:58c:b0:3bf:da51:aaa with HTTP; Sat, 1 Apr 2023
 04:50:45 -0700 (PDT)
From:   Mrs Aisha Al-Qaddafi <mrsaishag16@gmail.com>
Date:   Sat, 1 Apr 2023 11:50:45 +0000
X-Google-Sender-Auth: QTiV8JK1yWJs26jwwPn5Wk8J3n4
Message-ID: <CAAm86_aCTZFxwuyVrOWjE91UUFXFRQTmpwCt+htH-Rs-cYR10Q@mail.gmail.com>
Subject: Can i trust you My beloved One, I need your assistance.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        LOTS_OF_MONEY,MILLION_HUNDRED,MILLION_USD,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In the name of Allah the Merciful,Peace be upon you and God's mercy
and blessings be upon you
Please bear with me. I am writing this letter to you with tears and
sorrow from my heart.
I am sending this message to you from where i am now, Aisha Ghaddafi
is my name, I am presently living here,i am a Widow and single Mother
with three Children, the only biological Daughter of late Libyan
President (Late Colonel Muammar Ghaddafi) and presently I am under
political asylum protection by the government of this country.

I have funds worth $27.500.000.00 US Dollars "Twenty Seven Million
Five Hundred Thousand United State Dollars" which I want to entrust to
you for investment project assistance in your country.

Kindly reply urgently for more details.
Yours Truly
Aisha
