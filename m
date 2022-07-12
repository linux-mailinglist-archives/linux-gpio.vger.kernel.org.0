Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B99CF5716E3
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Jul 2022 12:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232880AbiGLKMr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jul 2022 06:12:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232982AbiGLKM3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jul 2022 06:12:29 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB9BAC065
        for <linux-gpio@vger.kernel.org>; Tue, 12 Jul 2022 03:12:27 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id n18so11414684lfq.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Jul 2022 03:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=eWssZ8ZNk3gocz18m8mxnb0jwQqX8IeZqZTs5Fk7aHM=;
        b=JseBNvXaGcHl37bXbzLEObqqScnvnojABWCUOoOp6tN4QPBvtfsps5OHtPnAtGrGRz
         w8cYqdyjgTYXVlVF8Gcddz8rLWscdKFUzG2pntSRnGRtekgFF9FcU+lhcR41v3Luc0FV
         4reiTerDsu2I5SbQB9VyFjwQeLFDxZDkLRhx5RmiY3sA1X5U4AprmiekgqMRgq9m2ilQ
         fSiu/OoYjqp9If1/DkwgkuuHkRAmdd449t6Yt4tiB7smB68phEFad+nFZcKl6zUGUTzR
         S1gonwcm1vY/t6GimCj+6ucqQp0SyC2P4wY52JUEoiB1eEZu2qxLVAhLOGNqPdvq1hYq
         TK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=eWssZ8ZNk3gocz18m8mxnb0jwQqX8IeZqZTs5Fk7aHM=;
        b=Sk8HdMop5VC/c6Fn4wbxUnHtTwSmEgKQI/NbiJ94vafkGpVUul7RQrAsSnhAeZEcgx
         lO0OqP6XQ3p31htqkE980+pCMWEGVC1ONr7NKPpUUG6mfOiiFdSqchxmJ5FUBMMg+6An
         P/v6QqVLaHonMqvshUG/7wdFbmlegH4BWcQfr4tcT8vAx/mSn1ZWfbF/rH1YUNzJjdgt
         wvtMQIGqPd9XFCJtTsTRgq99gIT/9ZxMi7Z7ldQmH5gXqy8VisYHZ56elE9EjwO4tzwt
         w3wLDzuFDHkdr86incOzAmLBNVdepWHHsSm/E8VBwfsP5g1MUa6ckFwdC2zwcb0Eg3PW
         mmRw==
X-Gm-Message-State: AJIora+pkEVAYogpuEAv67p344O3k2Kt5hNyUi8fnbd3rkSN2/JWM4PA
        t8bYfHKn/zstSjx/YUJV+GIvhrPCw25DdraXcp4=
X-Google-Smtp-Source: AGRyM1sG6VzvnaTxkGL8fDk+g1rwMUXUsQv1InU1jIwO46txUs+f7AM/SOF14RZuWgmXwA+FnLnf3czzPHejLk8AoGk=
X-Received: by 2002:a05:6512:3083:b0:489:e0e1:6a3f with SMTP id
 z3-20020a056512308300b00489e0e16a3fmr5515449lfd.73.1657620745824; Tue, 12 Jul
 2022 03:12:25 -0700 (PDT)
MIME-Version: 1.0
Sender: ojongonwa@gmail.com
Received: by 2002:a2e:a4b5:0:0:0:0:0 with HTTP; Tue, 12 Jul 2022 03:12:24
 -0700 (PDT)
From:   "Doris.David" <mrs.doris.david02@gmail.com>
Date:   Tue, 12 Jul 2022 03:12:24 -0700
X-Google-Sender-Auth: ExkhDOylQkuHjErENeUflnizXHA
Message-ID: <CAA-P_sPpeMSpQW+Mz9wDGqRWMq+qxns4i3BGf64yOa761_Kaqg@mail.gmail.com>
Subject: Re: Greetings My Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.4 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_FROM,LOTS_OF_MONEY,MONEY_FRAUD_8,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:129 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5001]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ojongonwa[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 MONEY_FRAUD_8 Lots of money and very many fraud phrases
        *  3.0 ADVANCE_FEE_5_NEW_MONEY Advance Fee fraud and lots of money
        *  2.8 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Greetings,

I sent this mail praying it will find you in a good condition, since I
myself am in a very critical health condition in which I sleep every
night  without knowing if I may be alive to see the next day. I am
Mrs.Doris David, a widow suffering from a long time illness. I have
some funds I  inherited from my late husband, the sum of
($11,000,000.00) my Doctor told me recently that I have serious
sickness which is a cancer problem. What disturbs me most is my stroke
sickness. Having known my condition, I decided to donate this fund to
a good person that will utilize it the way I am going to instruct
herein. I need a very honest God.

fearing a person who can claim this money and use it for charity
works, for orphanages, widows and also build schools for less
privileges that will be named after my late husband if possible and to
promote the word of God and the effort that the house of God is
maintained. I do not want a situation where this money will be used in
an ungodly manner. That's why I' making this decision. I'm not afraid
of death so I know where I'm going. I accept this decision because I
do not have any child who will inherit this money after I die. Please
I want your sincere and urgent answer to know if you will be able to
execute this project, and I will give you more information on how
thunder will be transferred to your bank account. I am waiting for
your reply.

May God Bless you,
Mrs.Doris David,
