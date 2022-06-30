Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4721A561AC4
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jun 2022 14:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235061AbiF3MuG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 08:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233466AbiF3MuF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 08:50:05 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28672403C1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jun 2022 05:50:01 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id d5so33550276yba.5
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jun 2022 05:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=ZwzSWKe8aJcF2q7NRCCrMkrvQ9eS4Q9joDzntgIKPec=;
        b=S78S+TyPx36awhtCaE0Keub2LARo0kgsW0JHrCJWdX0xpob5uA1OD3kxQ27FLZzdVu
         gwssUm2TlTWZBStpsaJBIhgU2mRrRCZItsCetZIazJvYtw4efK65QYH0eBGC0FlLEpWA
         5D2gdN3UiFGgudUlS8lLoXseDFCoMygsnyTfp3a2OHaW9Q/Y1KuplrOQjGMn/g8heKpi
         DMYs3fQ0EbezO8gM1EUf+WRee7ymcRovhaaUSYjdhiZcIHvNWgzpkCV4BdLYzMzDdYap
         vyL1KzSltRQCt07dBslki+SLJQ+KGtqrdpG9gua5zDLUnVGln8nIfhIeelR+HN+ioNEc
         gyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=ZwzSWKe8aJcF2q7NRCCrMkrvQ9eS4Q9joDzntgIKPec=;
        b=2Wq31WI10T9G+PltXRn1Kn64zLzdCiYsCg0lhHEVad2mozZongxQmtdTMbnCbRvxEN
         FxZFuhAeBYekdrCycBuZJXvHlxnlzisxX3F/7X0fTeupSH4V7RWYADZkaFzeknVzKibP
         o3x9wip+0h9R5mQE6q0Kyi3dLGnjov0tZQTx3gTikJ2XZW2GEjlwhJ1+yS1xBV3gM5jl
         HPi8wGPlCHUZUQrihgmcPW+TNXDIZo874VAxwag+lHNVV6xgO0vsPkCSyqNxeS5Ev0Ym
         hIxVhzmwNTeQEOJIvSLwoxaY4cMv62dhm6QkXOdPmrVoFqHGGbWe97RaimTo8xsLDV51
         3b+g==
X-Gm-Message-State: AJIora/kcElkCH8lsxZWsBuyVqQAsRXVe5JhLYWXM19W6C98CAI0XIy8
        YdoGHcq1Q3df+QvrjH+R7y1wHgVDHzceG+aJ8TQ=
X-Google-Smtp-Source: AGRyM1sLu2rLMyHFb7kD6qvYQPvOsXS8rHTxgIWg2jtvdTkhIG2mpQ4PnUGmr7Tr1zbF6G8nay9QTf64nCfGcjznoz0=
X-Received: by 2002:a05:6902:102f:b0:66d:ff4:804b with SMTP id
 x15-20020a056902102f00b0066d0ff4804bmr9557491ybt.229.1656593400109; Thu, 30
 Jun 2022 05:50:00 -0700 (PDT)
MIME-Version: 1.0
Sender: ojongonwa24@gmail.com
Received: by 2002:a05:7108:658d:0:0:0:0 with HTTP; Thu, 30 Jun 2022 05:49:59
 -0700 (PDT)
From:   "Doris.David" <mrs.doris.david02@gmail.com>
Date:   Thu, 30 Jun 2022 05:49:59 -0700
X-Google-Sender-Auth: TEFI7V0_d8vZIbUyoaRp5OdHnTk
Message-ID: <CAFOfhhPKY2QPm5TxgGyxo7nDPXDF12Dop_BiXhSC-0wuy3Zcxw@mail.gmail.com>
Subject: Re: Greetings My Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.8 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_60,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,LOTS_OF_MONEY,MONEY_FRAUD_8,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b29 listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.7863]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ojongonwa24[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mrs.doris.david02[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 MONEY_FRAUD_8 Lots of money and very many fraud phrases
        *  3.0 ADVANCE_FEE_5_NEW_MONEY Advance Fee fraud and lots of money
        *  2.2 UNDISC_MONEY Undisclosed recipients + money/fraud signs
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
Mrs.Doris David,
