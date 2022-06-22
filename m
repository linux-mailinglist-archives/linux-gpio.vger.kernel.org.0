Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A664554C4E
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jun 2022 16:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357989AbiFVOMj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jun 2022 10:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357924AbiFVOMi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jun 2022 10:12:38 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49F2838DAB
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jun 2022 07:12:37 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id j22so12904515ljg.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jun 2022 07:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to;
        bh=6waykjR/9T7FXtMTe+chOz79m2C0wmaFrN+VMdV2rWQ=;
        b=Y9SKNYiHV7MdtEfhviS1KyzZqMPBhGmzluzYzY8Ar1qLnNqAR8c1mHBbNe+u/9WO8a
         v/xCaw1AjvehMVXoWWdS/wLRNIW9HJQ7aa20VLhbBQaTe1PMzRnJ6qxbfwPCfoHn263/
         vS19OLkhfwob9+1pamkNnjMI7vbXWVtZ2+h7DaWTpaMwk3tCODMk0T/kgKV68f4hvM5D
         9lx5DTr3GeTRhK5MtShTQ94xwPENlIl2wyCQepKN3EWy0nxl3/1Rx6czIfKbrmBY4qLI
         m/mg+HM2jPZ7bUZgkI7D8NI9TvRevPWv1mST4SXjPtuEV7j8+fEYkMoUvWADXuYVvgKd
         Cq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to;
        bh=6waykjR/9T7FXtMTe+chOz79m2C0wmaFrN+VMdV2rWQ=;
        b=iKRNJHc9/nfU22+eNMp9pqiW+8VTwSYwnmWl8xx52Rkmf+f1nkmP6ue2rbvntfMchY
         xa6bvOFVJJS0xO43ql4NRAhLD6PMpLau/KKnownBPlynoDTeEEKop9xqu6qvWEjfMeIJ
         u2+Q6GkrPM5euP/vlLKPFbuk3s4JsARWnGwsqaz2Wav47sPv/UhD+eC/AiiYxPj38zmv
         FU+g4CcjU5c17NatrNvMF2BQK7qfYc1/9u/TPNV/Ubu4ayAJjfra5gkHc3WzQbJ5wwcB
         zH7QQG/TGmfo2vo2207yxmk+ag7L7z9jUyX82i3Onv/nr6ruQqzXiDosz4+QRvELXhH1
         b58Q==
X-Gm-Message-State: AJIora9IFvwYyYsk3QoNSNdsaAaNmM6oD/hY5I+ik8g3yuI+Qbzyuh3y
        QRvS+znPfCa4vjtoe/XWubLcM0XeZwp/nR1M7xo=
X-Google-Smtp-Source: AGRyM1vwpq5qEIjnJUuK4Ib0yc6+zDhRL4BWVhjiuTvcsNhR9976jvxJhbcMgFmcMzBBu6e0IRXB17iIFYKYafnFj48=
X-Received: by 2002:a2e:5752:0:b0:25a:6cff:6b06 with SMTP id
 r18-20020a2e5752000000b0025a6cff6b06mr1955066ljd.435.1655907155525; Wed, 22
 Jun 2022 07:12:35 -0700 (PDT)
MIME-Version: 1.0
Reply-To: drjordanphillips132@gmail.com
Sender: kllystanley@gmail.com
Received: by 2002:aa6:d90f:0:b0:1f4:e62f:241f with HTTP; Wed, 22 Jun 2022
 07:12:34 -0700 (PDT)
From:   "Dr.Jordan Phillips" <drjordanphillips132@gmail.com>
Date:   Wed, 22 Jun 2022 15:12:34 +0100
X-Google-Sender-Auth: xr0OJ_ipEwRU8SEKrR4Y5OuCl_Q
Message-ID: <CAFdxDYd_JL_F50+A2WDUFCk1N50A1++7edym-d9D1c6ADmaSng@mail.gmail.com>
Subject: Dear Confident
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.7 required=5.0 tests=BAYES_99,BAYES_999,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,MILLION_HUNDRED,MILLION_USD,
        MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:234 listed in]
        [list.dnswl.org]
        *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 1.0000]
        *  0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
        *      [score: 1.0000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [drjordanphillips132[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [kllystanley[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        *  0.0 MILLION_USD BODY: Talks about millions of dollars
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  2.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I have come to you with good intentions. I am Dr.Jordan Phillips, The
Director of Logistics and Procurement in the department of Health
Republic of Burkina Faso West Africa. During the covid 19 Pandemic my
department and the Government of the Republic of Burkina Faso West
Africa Contacted foreign contractors for the Supply of the Personal Protective
Equipment (PPE) During the period under review, myself and few others
in the Department of Health and some officials of the
Government intentionally over-involved all (PPE) Contracts within the
seven Months  the national Lock down to the tune of US$25,800,000.00 (
Twenty Five Million Eight Hundred Thousand United States Dollars).

Let me remind that our Government voted about US$1.7billion to caution
the effect of the pandemic, it is on this promise we all have decided
those who have a little share of the fund, I want to equally inform
you that the real contractors has been paid fully and this fund is
currently floating in a special account with a commercial bank here in
Burkina Faso West Africa.

Therefore in view of my career and a senior Civil Servant, I cannot
claim this fund, I want to invite you to come and stand as the legal
remaining contractor beneficiary of the fund, you will be provided
with the documents to claim the fund through the legal  detects of the
Country, You will be guided on how to claim the fund.

Let me know if you are interested to partner with me, for your
participation, 30% of the fund is yours while 70% for me and my
colleagues. I look forward to hearing from you.

And if you eventually get this mail in your spam please kindly note
that it is the poor networking system that is here in Burkina Faso.

My Regards,
Dr.Jordan Phillips
Director,
Logistics& procurement
drjordanphillips132@gmail.com
Department of Health
Republic of Burkina Faso
West Africa.
