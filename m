Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2BF53710F
	for <lists+linux-gpio@lfdr.de>; Sun, 29 May 2022 15:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbiE2NMV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 29 May 2022 09:12:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbiE2NMU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 29 May 2022 09:12:20 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A98C556C06
        for <linux-gpio@vger.kernel.org>; Sun, 29 May 2022 06:12:19 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id f21so16283257ejh.11
        for <linux-gpio@vger.kernel.org>; Sun, 29 May 2022 06:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=Cr4jqiwCZqgvtQ1mPAG6hA/aEXX0FhXJr8HGvR+MOF4=;
        b=Nt/mJnuBUQbVpYLEEcS8otgx+Y6B8DKZrFDbQOxKREC+NxFxhYnjNOCyG9P1ThZC5j
         dRdosrZPxn8CBggfVYZrDVQGOuwYvg2f1bVYyV1ABUKNPqapJRAOKY27FfYNwVhsKems
         kBL1U5aqQucKblCqHOg2MiR8h0OyZjPOYEadeYbNmdSTq5ET3WTkA+dxXloM7z048TPk
         2E4GYQj9mHqmwOYJ7R1bOljpAU7mdwgKRiZceqOGCyxgAa0rc63usjkUe1r7AjhQebxh
         kwBfE+343C5/kDVGvC3KLDjn53nWmOykR6WztIRH21rP6wRwRNqkv1W3/NI1Dz+NRvtf
         tLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=Cr4jqiwCZqgvtQ1mPAG6hA/aEXX0FhXJr8HGvR+MOF4=;
        b=PdKhicvP6jc9jWu2U+GnFPZiUA0saQP4ESAhXHuLsFha4Upgd1zJzFS4OURRcHAY43
         R3jejsDRw1SEqceY+XDjXDjVfkjUgue20S+EtnxPlAHpcrM0mie9UyMYr2egE+pC2gaP
         7kiEUYxg/WhK4aDW0Se6xgXDBSCRNUweFxkxIxSutOYm1G4HG+2G3c/qtrnBTpZwa4m0
         YWLxxWiPP8odJyMq2b9AjRev0gZM5F320PBcaFwS6g8e8kwKvBirHev9eJGLEKnXbrVH
         Vj31W193fIlx/KH4Z4m+Gp4E0h2ANtzwZNq8St58lQgotKG7W/NvMGmZGvDHeV+vap85
         ajMg==
X-Gm-Message-State: AOAM5302eaxXGqRg/8/L2Nj8dV2rlDLSoBMV8XmgG6Uj4CGBW3MALDKZ
        qSaJd/la5Bzkb/owtIBadthvR5EvCCTA+w7ez0g=
X-Google-Smtp-Source: ABdhPJyRKi6iTQJpd2Fj1KOfeu+hCzkIoM3Qic3Pw8122XBumQ5LbFOoN/birEIsSd+xhoERiWPbAHB2hTxwzFaXhCs=
X-Received: by 2002:a17:906:7952:b0:6fe:1e0b:6343 with SMTP id
 l18-20020a170906795200b006fe1e0b6343mr46150509ejo.337.1653829938115; Sun, 29
 May 2022 06:12:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6400:789:0:0:0:0 with HTTP; Sun, 29 May 2022 06:12:17
 -0700 (PDT)
Reply-To: wijh555@gmail.com
From:   "Mr. David Kabore" <dkabore16@gmail.com>
Date:   Sun, 29 May 2022 06:12:17 -0700
Message-ID: <CANLKR0ux+1e3gPWaeruutBfyR4A2Dhj=7So=Grxb82uS2e8Mow@mail.gmail.com>
Subject: Greetings,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

-- 
Hello,
I'm Mr. David Kabore, how are you doing hope you are in good health,
the Board irector try to reach you on phone several times Meanwhile,
your number was not connecting. before he ask me to send you an email
to hear from you if you are fine. hope to hear you are in good Health.

Thanks,
Mr. David Kabore.
