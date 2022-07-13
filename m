Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60D655735B9
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Jul 2022 13:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235206AbiGMLoW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Jul 2022 07:44:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236062AbiGMLoV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Jul 2022 07:44:21 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E760BE6A4
        for <linux-gpio@vger.kernel.org>; Wed, 13 Jul 2022 04:44:19 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id o31-20020a17090a0a2200b001ef7bd037bbso3211990pjo.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 Jul 2022 04:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=oFPao6+FHTUKOYc11RmLF8YTaUlvFn2TAMXlqT2wmEQ=;
        b=JYP3d56dJ72OzPYX5DaWitD86h20bCOsjPAk09KLMrvRp98PMr1klPNcg89503orVP
         I5Mtb/T3w3SyAY0ZAnKZ3gIt2lDFjDq5ul3CBwV9FmhyI155YG125gK37WsGLwZkemU7
         y1PkYYWmT+Uxi3p7HNRQCJFPc3IRvPY1Pb3cjHiIbbAc2IPnkLCygERzb5C3r1o/W0/t
         LakJ718gQSlQVu20QNzkk64Kv+DvLt1K+NElL9LoCFbKikyXRY81xAwRhcSQI7nuKtfD
         sgQu7KVW14prlNfIMvchFmZfytKH7AF6SGSIEtpJSgyKv8cUZ8RsCARDKeRIHAyt1Tko
         l6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=oFPao6+FHTUKOYc11RmLF8YTaUlvFn2TAMXlqT2wmEQ=;
        b=UbiQCZ7AfQg+yItFFWoLvH38iIqstdLSgA8IztXVXONkW0QrvRzQGFMc2RT/UZd3wi
         TvqdPHBj9vRNs2o3zwCMTEx7AtyfsdFy6MLRqaGRV6vk9Ka6kgM/leRQtb5OeZPyabUu
         T8Ce7WbdVO0wvQPFEmYavO+D9qV5IEYJXKFiKZR6Np9FjIwFwYpvJLOeqjhQVR6PgpNH
         1EDLlmQ913XvbH8mSQfp8hxKK7wHVAMmUDmXd9erPz53Fb59Wew36cfQAQaXYZYAEx/c
         xvFirTycZbelACJ1Zw/R3s/G/CbesWEqvQNmLqoj19SlxBI0Uxrc7Djn0jDVrZQERV8E
         KDBw==
X-Gm-Message-State: AJIora9zWQV50urEPoJSbcAc2j/A3KnCQfjpVju4OW0Q/KR2DT9/lG41
        kNTTTc0xqN8oUISUGviqwUfOM5mdTC2FObGhZ7I=
X-Google-Smtp-Source: AGRyM1sL/M8XqFY59qvs3R3/TeSsn+Stl4Z7NceElFHShVhl0VwlDoMRX6yl8KOgwlMfPBkkn1vkxiDzeJiZ1M8ZIkk=
X-Received: by 2002:a17:90b:3b86:b0:1f0:3a65:a002 with SMTP id
 pc6-20020a17090b3b8600b001f03a65a002mr9414462pjb.226.1657712658432; Wed, 13
 Jul 2022 04:44:18 -0700 (PDT)
MIME-Version: 1.0
Sender: gudinamrassefa@gmail.com
Received: by 2002:a05:6a20:3c91:b0:8b:cab:6628 with HTTP; Wed, 13 Jul 2022
 04:44:17 -0700 (PDT)
From:   Ibrahim idewu <ibrahimidewu4@gmail.com>
Date:   Wed, 13 Jul 2022 12:44:17 +0100
X-Google-Sender-Auth: Ff06t0deb6f6vvxVL-3XLVeYtHc
Message-ID: <CALpdxiY+Vs1pOrAo6_kt+bYEfW134UFCfdBAi9RBBZNa59+UTQ@mail.gmail.com>
Subject: I NEED YOUR RESPOND PLEASE
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.8 required=5.0 tests=ADVANCE_FEE_5_NEW_FRM_MNY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FILL_THIS_FORM,FREEMAIL_FROM,HK_SCAM,LOTS_OF_MONEY,MONEY_FORM,
        MONEY_FRAUD_8,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_MONEY_PERCENT,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1036 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5009]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [gudinamrassefa[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  2.0 HK_SCAM No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 T_MONEY_PERCENT X% of a lot of money for you
        *  0.0 FILL_THIS_FORM Fill in a form with personal information
        *  0.0 MONEY_FORM Lots of money if you fill out a form
        *  0.0 MONEY_FRAUD_8 Lots of money and very many fraud phrases
        *  0.0 ADVANCE_FEE_5_NEW_FRM_MNY Advance Fee fraud form and lots of
        *      money
        *  2.7 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dear,
                       Can you trust a financial relationship that is
mutually beneficial to us both? I have received your name and contact
information from your country's banking data Information, hoping that
you are interested in what I am going to tell you.

I'm Mr. Ibrahim idewu from Ouagadougou, here in Burkina Faso. I work
for coris bank international. I am writing to you about a business
proposal that will be of great benefit to both of us. In my
department, as a banker, I discovered $19,300,000 in the account of
one of our deceased foreign clients.
The choice to contact you depends on the sensitivity of the
transaction and the confidentiality it contains. Now our bank has been
waiting for one of the family members to file the application, but
nobody has done so. Personally, I have not found family members for a
long time. I ask for permission to present you as the next of kin /
beneficiary of the deceased, so the proceeds of this account are worth
$19,300,000 to you.

This is paid or shared in these percentages, 60% for me and 40% for
you. I have secured legal documents that can be used to substantiate
this claim. The only thing I have to do is put your names in the
documents and legalize them here in court to prove you as the rightful
beneficiary. All I need now is your honest cooperation,
confidentiality and your trust, so that we can complete this
transaction. I guarantee that this transaction is 100% risk-free, as
the transfer is subject to international banking law

Please give me this as we have 5 days to work through this. This is very urgent.

1. Full Name:
2. Your direct mobile number:
3. Your contact address:
4. Your job:
5. Your nationality:
6. Your gender / age:

Please confirm your message and interest to provide further
information. Please do get back to me on time.

Best regards
Mr. Ibrahim idewu
