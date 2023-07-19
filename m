Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06772759411
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jul 2023 13:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjGSLV1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jul 2023 07:21:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbjGSLV1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jul 2023 07:21:27 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC04DE52
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 04:21:25 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5768a7e3adbso10500557b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 04:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689765685; x=1692357685;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kli8iJFOOLyKnRsPkSXylIDYC+vLWpxeABayx6rNSxg=;
        b=g90UteJhZeFzS6NGQXxIenKs3DOtOf9KRk4ibMI5Xl2fW+ZuWp6W74k5KAd8f2s3RB
         Cmyn3xQD1Y69kD01R3KJZdbvPc3KNsUUIyS/QoN9z+FqOU5bMhtgQQZzFvfeHvmzVedV
         65mUntQhbHC2nfbppNBGL4cCpz3Cahb6pR2fQ+V8qoPbGJnsAU3FnEZyePLOOfaUH/5Y
         Hpvpxivs0rG063jJ0eyLSyFMGWRzYVEz/p2ABsYDTmsgAU6P97nwBSQYGX7On+hVtvb2
         AzwrdsJIlmaKe07FBuWxkrYLQ1w7umG2sgz+zw/Yi1fuGpX/2IUA9mnf4kZvP4a6KZLb
         Gqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689765685; x=1692357685;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kli8iJFOOLyKnRsPkSXylIDYC+vLWpxeABayx6rNSxg=;
        b=DHBHN/Z4QfcrBsQUGZGWgbdcGDg5/2mPNQQiBV2gFfMpME8/a4LaqU462oA0lz5eMv
         GE7yxO9HRf2Z29qEEPt2+8CmZCUv2e34EVS87N7svtJ0YwMBXAtOJiBUg2PVxb5Zlz7q
         ktxz8voKU4HqcM2h3CPl1FSavP3NESTTSUfzUlPXiKSDK17ytvFcmzZMIzP1i6Wu8+Xa
         U580u65uzB7BCEJxzn6wKUlQXJXhV6cH9yK5cdaPajbaUNGURWSNoayykvExPvtrpqQC
         QkInslpcLmdmltQTJErAkgvw3MdzqBthCZZboGMT6Xr2T4w6ZZ7mZcckfbRMhv+/4clV
         jGQA==
X-Gm-Message-State: ABy/qLalMenkP4Lao4XVGVOujo3TluG95ZRm+mmZtbj3bD39RNCWCXp3
        3q1JTNGxTlNIZkzdjQyXZ7JU6N5PWB98Oo/2UJs=
X-Google-Smtp-Source: APBJJlF5eXitEU/pWgn0MzWII3OnujuKOQSz97yqyYIsrYxpxt/ksWa//gSCsAYnDc1jTPs5uuTH/F9H3lZeW1abSBs=
X-Received: by 2002:a25:b10d:0:b0:bca:1d11:c02e with SMTP id
 g13-20020a25b10d000000b00bca1d11c02emr2271690ybj.13.1689765685140; Wed, 19
 Jul 2023 04:21:25 -0700 (PDT)
MIME-Version: 1.0
Reply-To: aishagaddafi1011976@gmail.com
Sender: ameliaalzira5658@gmail.com
Received: by 2002:a05:7010:751c:b0:36e:7710:6406 with HTTP; Wed, 19 Jul 2023
 04:21:24 -0700 (PDT)
From:   Aisha Al-Qaddafi <aishagaddafi1011976@gmail.com>
Date:   Wed, 19 Jul 2023 04:21:24 -0700
X-Google-Sender-Auth: 2uneGYiqAEX3frnp65Y1oLMYpN0
Message-ID: <CAFpd-8a27+H3s68txZoydTRnzwOUsxg4wRnELNty+6RjsXdLLQ@mail.gmail.com>
Subject: Peace be upon you
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.8 required=5.0 tests=BAYES_95,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,MILLION_HUNDRED,
        MONEY_FRAUD_5,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [2607:f8b0:4864:20:0:0:0:112d listed in]
        [list.dnswl.org]
        *  3.0 BAYES_95 BODY: Bayes spam probability is 95 to 99%
        *      [score: 0.9702]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ameliaalzira5658[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [aishagaddafi1011976[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ameliaalzira5658[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  1.4 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  3.1 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  0.0 MONEY_FRAUD_5 Lots of money and many fraud phrases
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I am by name Aisha Al-Qaddafi the only biological Daughter of Former
President of Libya Col. Muammar Al-Qaddafi. I came across your-mail
contact doing my private search while in need of your assistance to
help me receive my $27.5 million.

I have investment funds worth Twenty Seven Million Five Hundred
Thousand Dollar and i need a trusted Partner to help me receive the
funds because my current refugee status, however, I am interested in
you for investment project assistance in your country.

 I am willing to negotiate a business profit sharing ratio with you
based on the future earning profits. If you are willing to handle this
project on my behalf kindly reply urgently to enable me to provide you
more information about how to receive the funds.
Thanks and Allah bless you for your understanding.
 Best Regards
 Mrs Aisha Al-Qaddafi
