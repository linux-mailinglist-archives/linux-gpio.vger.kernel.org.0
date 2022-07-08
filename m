Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E83AB56C00C
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 20:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238941AbiGHRhe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 13:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238790AbiGHRh3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 13:37:29 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FAD12A26A
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jul 2022 10:37:28 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id e15so6745425edj.2
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jul 2022 10:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=1jdblMpFBKUwk7zox+k3ZbwIYwyiF/LOyoPJdh00Exg=;
        b=ln24VUP5GAV5Z4iULl7OdMRuq0j47k+E8PYE+mtkHN4TPi1FelhTfsiCypz4sZrrJD
         FuK3RWtMeKoSLRr4j5pta78NPu/mKEkYUfto4N9YExHplgydojbgwbETrXYAm4/6Jqtj
         6iYCrGLX76z+ruDRzFx/dm1392e6f9mm/hNkOb27vZqERwQHq0/ZNUYtpsNwKU2oNliw
         FdbF8ln3il2nX0BKFQQ9DqLe4/Uonl0uls/9ED3DDFuk8EpNEFg4AeAq36etzpnWCFt+
         RRVIZAibi7Br1veiBueqnGMI3oAVq9126AsyKvFLtzqyxJ3rzmrGmw15DyWtEiAudQhQ
         HHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=1jdblMpFBKUwk7zox+k3ZbwIYwyiF/LOyoPJdh00Exg=;
        b=bylap/dcTyeAmTSwHNQZSr9Rbx8NCuedBpp5gAC2T6ajJ/VPlNEcUvfXmZxTWqutWG
         ml2bKA4KdjSqXyMzvlefLDbk8gAJrSCP8RYkWi55nhx26PfSRLa+PJLHvB+kxuGH0F7a
         3OsL+QlBGKH2q90PTb5t87ybNDXBsiu9JYWWw4LLr/Arg3XSKm+2vXnynv+VB8u7YMhI
         kGJ5gIh6IMkUk/mqC5iE7Ubm1kCljoXscl78DIt/N7RB4ZeIn0pftvmabBNhrolMFC9E
         I0YC4rKfSRVRpPvcFno14bD6bcZIMFOfU5SpgS2sBofIjrT0PDv8Cn3CAz9SORzo1z+g
         8InQ==
X-Gm-Message-State: AJIora89EvgiaZxvTU8WLHy/7oCfhjf5iq1F/zK2muG5t/QaYX+JmqRO
        XGJLJAJnBZJxNaOe3nqpV2zEqmZlu7DLURt9l0c=
X-Google-Smtp-Source: AGRyM1uyScB4xvfGL6LqfC8jURnCmjLcajLhDTFL6hacS0PnMLoOXVsEA2O0FbHzCS+CDgF7928dv/3Dbj8Fun0pWTU=
X-Received: by 2002:a05:6402:5309:b0:435:6431:f9dc with SMTP id
 eo9-20020a056402530900b004356431f9dcmr6286245edb.14.1657301846885; Fri, 08
 Jul 2022 10:37:26 -0700 (PDT)
MIME-Version: 1.0
Sender: anderson.thereza24@gmail.com
Received: by 2002:a50:33ce:0:0:0:0:0 with HTTP; Fri, 8 Jul 2022 10:37:26 -0700 (PDT)
From:   "Doris.David" <mrs.doris.david02@gmail.com>
Date:   Fri, 8 Jul 2022 10:37:26 -0700
X-Google-Sender-Auth: JUUgSneMHiULu39HehhSaQv5ayE
Message-ID: <CANzgL_yGrSm_FnkyHt15M+u5Lbf_VLHjs8aE0ij77-R1r9DsWw@mail.gmail.com>
Subject: Re: Greetings My Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.7 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,LOTS_OF_MONEY,MONEY_FRAUD_8,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:52a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5001]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [anderson.thereza24[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [anderson.thereza24[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
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
Mrs.doris david, a widow suffering from a long time illness. I have
some funds I  inherited from my late husband, the sum of
($11,000,000.00) my Doctor told me recently that I have serious
sickness which is a cancer problem. What disturbs me most is my stroke
sickness. Having known my condition, I decided to donate this fund to
a good person that will utilize it the way I am going to instruct
herein. I need a very honest God.

fearing a person who can claim this money and use it for Charity
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
Mrs.doris david,
