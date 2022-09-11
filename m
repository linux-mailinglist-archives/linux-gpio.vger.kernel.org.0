Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68E1F5B4CF4
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Sep 2022 11:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbiIKJTP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Sep 2022 05:19:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbiIKJTO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Sep 2022 05:19:14 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 357A63C8E5
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 02:19:13 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id f9so9392293lfr.3
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 02:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date;
        bh=K7SOn56lpl3rQ4W5ApgRofuOiIiXGC1PeTTRy4o8CDc=;
        b=O1ZK29+wped5PqHbSlaM3sZKDCxoM15vD8it+9uD/87W093Eu05bO+w0hZgTwhnYv9
         755v63B49BsI+7lb8Ju79Y9Bua5AdOsTAq8fX0ljDPTTrTJcv4RSFucYPEg54dUZNh0y
         Tsdq372d567n7EsZva2+mxphdfURsxBWAdy6NTOohHGe/PZ9hTKNmj+PhJoKHUWyjnc9
         /tphsPPZrKKCRW8mjWqoLhK3cKMqa0RKabLJ+qGkWf9OEq5wR3LYvdxsm0oSlcyP5tBO
         7SLKUG3as6VtBvafQSlZ8AagBnFQ7VW34trFvoiP0uYiWt6NjeVzXvcAqc3JSxXnuLk9
         /6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=K7SOn56lpl3rQ4W5ApgRofuOiIiXGC1PeTTRy4o8CDc=;
        b=RuFt3E/ElecfHeMrRXQdaa7syA89A+Fxv0nE63s+JzPeuPMF1ghxd67o2qGyCfn/kX
         zyD0UmPF0FtfxZ3gmja/e+WhgZbwc37tiMCPk/HFkbD2v4/71fy3G7ES8BEHz5YZz7YU
         +8GCwjYC3e0hRMTHRMoDdEYy69GfeP8HP0Zzc5/QQWftvVA695CTOvLjSBvZC+7ShMBi
         7pt5k3gc83aJLHkzq9CUcyM1xj6el55STlaLBsQZxiKZ/sSc5uN6gdyBOW7P7xpyFK1D
         b/S6yVV7P0KtJ8cyIhEkzvoKVgEux3EhOoZ22TNZN2KFMDyEZE4JuOjwkGtpX7idZa9n
         UsYA==
X-Gm-Message-State: ACgBeo3FsjVZ3jqUPV1gYhpdBRv08oynL3bFraXtudftI9YmFhJrA2LW
        FuYI2VFkJBa0cTyeG0i8OHrEzpYsQYUqtWbeeBE=
X-Google-Smtp-Source: AA6agR5+ErzKWcbNOoOALhjqV2nCPZuhDtc+fgIkgWKdTFQURcTcNctvVsThUQtH9DdNxU5+gaMODxgg4TQ8GWDWrV0=
X-Received: by 2002:ac2:5d6e:0:b0:494:99aa:6548 with SMTP id
 h14-20020ac25d6e000000b0049499aa6548mr6874084lft.508.1662887951223; Sun, 11
 Sep 2022 02:19:11 -0700 (PDT)
MIME-Version: 1.0
Sender: michealkevin175@gmail.com
Received: by 2002:a05:6512:2216:0:0:0:0 with HTTP; Sun, 11 Sep 2022 02:19:10
 -0700 (PDT)
From:   Aisha Al-Qaddafi <aisha.gdaff21@gmail.com>
Date:   Sat, 10 Sep 2022 21:19:10 -1200
X-Google-Sender-Auth: 4eVJPsKzTTt2th9Zsxik2nh3Jm0
Message-ID: <CAFDyLcys_LJyNwaxytzexNs9y3N=hzOHqO6RUnr4daVZHOn_-g@mail.gmail.com>
Subject: please i need your assistance
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.6 required=5.0 tests=BAYES_99,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,MILLION_HUNDRED,MILLION_USD,MONEY_FRAUD_5,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I came across your e-mail contact prior to a private search while in need
of your assistance. I am Aisha Al-Qaddafi, the only biological
Daughter of Former President of Libya Col. Muammar Al-Qaddafi. Am a single
Mother and a Widow with three Children. I have investment funds worth
Twenty Seven Million Five Hundred Thousand  United State Dollar
($27.500.000.00 ) and i need a trusted investment Manager/Partner
because of my current refugee status, however, I
am interested in you for investment project assistance in your
country, may be from there, we can build business relationship in the
nearest future. I am willing to negotiate an investment/business
profit sharing ratio with you based on the future investment earning
profits. If you are willing to handle this project on my behalf kindly
reply urgently to enable me to provide you more information about the
investment
funds
