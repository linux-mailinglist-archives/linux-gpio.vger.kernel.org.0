Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA9255138C0
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Apr 2022 17:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbiD1Pot (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Apr 2022 11:44:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244376AbiD1Por (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Apr 2022 11:44:47 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29DD08D690
        for <linux-gpio@vger.kernel.org>; Thu, 28 Apr 2022 08:41:29 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id j8so4683892pll.11
        for <linux-gpio@vger.kernel.org>; Thu, 28 Apr 2022 08:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=PAoz7fLMQWBLCFW77Gt4mb4mt4paG6Gi3HmBwVnVv30=;
        b=Y6KoOd7xvYouQR6t4kaE47GkKCDd6DkZL/YRRcMosUYqSK1B1yVSf5lj1TnjaGKmen
         g+0GnZzm70PjZZNmnOWTgmECiVlJw6QBkL0l3jSPT0WkidQIVv/vq5g3CqA6+EgC19dh
         A0p0Oze0GTWgmb7vmbnDtY1rFaJ+nIwjWQCDWESFc6wGxLTw2puWA+iT8hcUedkaDBx9
         b//UEFZZkahTlx1EQGy6CoJkjyvHTiIMKFBNwl2zDI74N0lE9zidH13T/hDlyfmhkoqA
         uVeiPMNZJ4xOx4vyE8U5ZRIhpL2zFM6h6ikRQ2Xh6rlCTJY6+JOEPFmuEyI4gk0nT4Xw
         SXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=PAoz7fLMQWBLCFW77Gt4mb4mt4paG6Gi3HmBwVnVv30=;
        b=MYKOKdWcz70uN5z2ZP5hH63V4DUv2loegzArb8xpy6rfjKtvGhP0sWM3LFK64+5N/k
         qhlvPOkCzMyJKhnVyhOQ2kFlzMaXYHI7F0ucVkOpISz92rARvUsPsw3iFnOGg3NshjYu
         Fo05D5C/8QP6MHHZJuOycJ3jCuBB1SNTCqqEeJuq2KsYfXWT2QoDha9wodwURZ8KiWEI
         u4mPln/XQwid3qv5PAGFBunz2byPVvHjcm3DZWYdcvkp6eFamzTWJLoggdhHwq8vFbC2
         jjiOd97QTJi944lGibGjpHibEUCJxk9fioIhborRZeKfUWzG3aLRUFKL+xrhrohGBRjY
         tWqQ==
X-Gm-Message-State: AOAM533jA4jsrOZj7KiPcfrWtp2wOhD157CrklDOgjkRT/mDt9Z1PrWT
        9iAQZqEM4RtLfyUDe7PVBjCek5UPnC7nMkiAH3U=
X-Google-Smtp-Source: ABdhPJxMJSrutVe1Ca40K8lnMvUWCtMQAQiwu/vGrKXjRwL2MvAyfrnp3MxW7MTKFtt0CMXk3P0B2AOAQZ0VpBM85/c=
X-Received: by 2002:a17:90a:aa98:b0:1b8:5adb:e35f with SMTP id
 l24-20020a17090aaa9800b001b85adbe35fmr39687594pjq.192.1651160488641; Thu, 28
 Apr 2022 08:41:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7022:a89:b0:3e:cad:8b8b with HTTP; Thu, 28 Apr 2022
 08:41:27 -0700 (PDT)
Reply-To: attorneyjoel4ever2021@gmail.com
From:   Felix Joel <davidovaa15@gmail.com>
Date:   Thu, 28 Apr 2022 15:41:27 +0000
Message-ID: <CABVEX-pwGPb5JXYSkR7HNyZKKdt8vi8AkW_g=NVxgtrNR3zrSg@mail.gmail.com>
Subject: =?UTF-8?Q?jeg_venter_p=C3=A5_svaret_ditt?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:62f listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4999]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [attorneyjoel4ever2021[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [davidovaa15[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [davidovaa15[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  3.6 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--=20
Hallo,
V=C3=A6r s=C3=A5 snill, godta mine unnskyldninger. Jeg =C3=B8nsker ikke =C3=
=A5 invadere
personvernet ditt, jeg er Felix Joel, en advokat av yrke. Jeg har
skrevet en tidligere e-post til deg, men uten svar, og i min f=C3=B8rste
e-post nevnte jeg til deg om min avd=C3=B8de klient, som har samme
etternavn som deg. Siden hans d=C3=B8d har jeg mottatt flere brev fra
banken hans hvor han foretok et innskudd f=C3=B8r hans d=C3=B8d, banken har=
 bedt
meg om =C3=A5 gi hans p=C3=A5r=C3=B8rende eller noen av hans slektninger so=
m kan
gj=C3=B8re krav p=C3=A5 hans midler, ellers vil de bli konfiskert og siden =
Jeg
kunne ikke finne noen av hans slektninger. Jeg bestemte meg for =C3=A5
kontakte deg for denne p=C3=A5standen, derfor har du samme etternavn med
ham. kontakt meg snarest for mer informasjon.
Vennlig hilsen,
Barrister Felix Joel.
