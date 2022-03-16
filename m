Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 403504DB32F
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Mar 2022 15:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356719AbiCPO0w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Mar 2022 10:26:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356491AbiCPO0r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Mar 2022 10:26:47 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 702C339174
        for <linux-gpio@vger.kernel.org>; Wed, 16 Mar 2022 07:25:33 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id d10so4512073eje.10
        for <linux-gpio@vger.kernel.org>; Wed, 16 Mar 2022 07:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=6d5jMCrauedgyT6F3RzrXl4yXsf77OwIiAgFmSDNs60=;
        b=CsGkFQ0J4otmtCHwqo+mJsMZt0x40cAzKWJPEn87LTbImi32s3JP3NsfYhqSN121rn
         JRu/NTRZAJD496zOJkT24o3CwMrYuMQrC29yQ3RFCj1Y8A6iNXhQqQWHME8YaFLL+7kh
         BloIuBAjM1KGFWqlfGDoKiK8vWNU6F8HV+dvaHmxARur5aiu7Pag1nI9MWiOkb9NulDV
         iUTeqDWAoasUFGQbw8c1vffbg2AP6tjL4cgMumA7k8yy1s+UH8JjN97mz8+XQkgO7c40
         pcVahO+/6jQ37btPo4YVmYmqmgRXuvypc0ig495/YO5ydtLce1lHrzWYvwH7rIn52e1o
         obpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=6d5jMCrauedgyT6F3RzrXl4yXsf77OwIiAgFmSDNs60=;
        b=obVkvZnxFckPI4onP9ecPhTRC0w01SXM6DQFeguca0tEgdan/Bxuu2R7iYMXM/6n4u
         ywZGy8B/YvJwBKvqi9vpHec4LEfR5nYr44ZNsueK/q3J7uciOWknS+InxjdOndJkFHth
         +KTQC18BOQ6hqZuVxlkhm4qVQIzsWLZGtcbtghrMj4HqBFMsXApI4MPwK8AgCAjwdKsr
         X0OcmUDdlVduPc9j+iWC1IaCXGvrCAiR264h9WiBl3TbbHxRaGA9K+OJMXAWeTSM50LR
         cq9WyonEKxKWIDyW1CtfjMsSgZQaTmYtSyFmIBReCP1mp86ujph1Zv0+3j00Won4L5DQ
         EXFg==
X-Gm-Message-State: AOAM532tPkujBscowxcD9RdRs06BExlQ9aWNzNrAm5r1C/452SI5r3jG
        WZbyDFOpJLnSYneJJe83QUdNEmSyVTe2XdcNG00=
X-Google-Smtp-Source: ABdhPJwTfMdCRmpx6ywHPL0hH4uHLB17RqgA3ifKJRud2q1umfS8etvEgYuBt0II8KsZlrddCnAD1Xjw82KUXSppFjg=
X-Received: by 2002:a17:906:b6c7:b0:6db:2e14:875 with SMTP id
 ec7-20020a170906b6c700b006db2e140875mr146095ejb.737.1647440731457; Wed, 16
 Mar 2022 07:25:31 -0700 (PDT)
MIME-Version: 1.0
Sender: izedfrank333@gmail.com
Received: by 2002:a17:907:9116:0:0:0:0 with HTTP; Wed, 16 Mar 2022 07:25:28
 -0700 (PDT)
From:   Aisha Al-Qaddafi <aisha.gdaff21@gmail.com>
Date:   Wed, 16 Mar 2022 07:25:28 -0700
X-Google-Sender-Auth: fdSqIH4B2I7tyDfYjOIutWXZRr8
Message-ID: <CAFNE3FgZowPhrBsqTY1gRcCTkH5NuF7=4wNWZLqo335o7gGE=Q@mail.gmail.com>
Subject: Your Urgent Reply Will Be Appreciated
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,MILLION_HUNDRED,MILLION_USD,MONEY_FRAUD_5,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_MONEY,URG_BIZ autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:62a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5017]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [izedfrank333[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [izedfrank333[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        *  0.0 MILLION_USD BODY: Talks about millions of dollars
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.6 URG_BIZ Contains urgent matter
        *  2.4 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  3.1 MONEY_FRAUD_5 Lots of money and many fraud phrases
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I came across your e-mail contact prior a private search while in need
of your assistance. I am Aisha Al-Qaddafi, the only biological
Daughter of Former President of Libya Col. Muammar Al-Qaddafi. Am a
single Mother and a Widow with three Children.
I have investment funds worth Twenty Seven Million Five Hundred
Thousand United State Dollar ($27.500.000.00 ) and i need a trusted
investment Manager/Partner because of my current refugee status,
however, I am interested in you for investment project assistance in
your country, may be from there, we can build business relationship in
the nearest future.
I am willing to negotiate investment/business profit sharing ratio
with you base on the future investment earning profits.
If you are willing to handle this project on my behalf kindly reply
urgent to enable me provide you more information about the investment
funds
