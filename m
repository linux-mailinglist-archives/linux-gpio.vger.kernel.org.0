Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6672559B6D1
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Aug 2022 01:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231322AbiHUXpf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Aug 2022 19:45:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231841AbiHUXpX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Aug 2022 19:45:23 -0400
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 655E01FCEB
        for <linux-gpio@vger.kernel.org>; Sun, 21 Aug 2022 16:45:22 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id m21so3721957uab.13
        for <linux-gpio@vger.kernel.org>; Sun, 21 Aug 2022 16:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=p6gJcrUcELHltuWyBaIieOc+0jaiE4THT4cA+0i1fDQ=;
        b=Ih/4KZn1B4AopmI23+7UwdBlyerpiWDZTxupRGjHjlclDJaeOaCYyUtUUqPzDY6ejq
         d2NdbbFRd4KwDraUczVBU0KAuicgECp7uSo9qMnYYXhZsLYlFulCRQVLGHENhd/WhsbQ
         LqpB+lVnb086vJCCOR5PjSnIo/V4/dm6SYVCaH0VR4nFQ8lIM084jXAI0MmqSWcn/0Lv
         7blEDWjmrAgQdX/Qg/epg7frKasghv3Gy0BUMIF6oLOIb9rTlPnjwSD0q9imG8/qKeMT
         QH7BIbIXmhiz5ErYW8Knu0DEugndPKQXujWZpbUSp5f1XyLYQf1sivqR4H3WhVOZT/tW
         xivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=p6gJcrUcELHltuWyBaIieOc+0jaiE4THT4cA+0i1fDQ=;
        b=aYHglaxcPRBgypgtv5WzPN8aqNIEMygiG0vauwrKyW7+EglipJKG+Do2Nnoy/dnK6d
         /ycNw6lQXN1l0od+5asYAovKdi5Kv6IBcpD2R5uWnWqYN37evy1lXADbyy+yoy/uDLR0
         BeR2o4W8Oxozsg5Fo7x9s4ZrPsoNayNQ6UqJIoyfmvJPaU/74dMmPOC/hRuDMXAiB1cM
         C9/sG7zyfXTjgnHv5GK3lw/tqHJvAhuCouWEGQULAgQpMwUPvYyX7Ze7hM7R0mvUr2zt
         QGfBFjN56iHr2S9w2Wz6fPXVPJY79t2zkoRjtO/hv2uf9xBUuwtkdLaw7UGXh2o/MQmv
         DYeA==
X-Gm-Message-State: ACgBeo0DqN/gDl7riXQGQLoLh/XKIr2B/hkLyajLBUyGj/fGpktASR81
        1m0fGyJl95hq1V4aFJFBqfY95qx4aEqRTvkBBK8=
X-Google-Smtp-Source: AA6agR4u903aCyijXQfq0EOGsmlYECYR20RtUeCzLdfvI3dvdb4k6D/KyA92Pc2sWcjkIOrvGoHSWoOpzXfj6/ggrL0=
X-Received: by 2002:ab0:6515:0:b0:39e:f8fd:a772 with SMTP id
 w21-20020ab06515000000b0039ef8fda772mr1078050uam.33.1661125520959; Sun, 21
 Aug 2022 16:45:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:612c:2122:b0:2c9:ae23:f433 with HTTP; Sun, 21 Aug 2022
 16:45:20 -0700 (PDT)
Reply-To: oksr1l19@gmail.com
From:   Richard <hassangilbert57@gmail.com>
Date:   Mon, 22 Aug 2022 00:45:20 +0100
Message-ID: <CAG3d5YvBTQvOXZmTmLwQaiW_RBTvCQO6A2-yuKMpCg=MNt3CHQ@mail.gmail.com>
Subject: Letter of intent! and Please Read!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:92a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5854]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [hassangilbert57[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [hassangilbert57[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [oksr1l19[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dear,

Are you in need of a business or personal loan? Or is your business
struggling due to covid 19 pandemic, we are offering easy loans to
meet your needs, our funding and loans have repayment plans of 10 to
25 years' time for new and existing businesses, housing projects, and
individual financing.

We are willing to finance your request no matter where you are
stationed or located, our financing is global once you're willing to
meet the process and conditions. Your request will be processed and
sent to your account within 24 hours after the process is completed.

Kindly contact us in order for us to direct you to our procurement
officer, If you are interested.

Thank you in advance as we hope to meet your demand irrespective of
the volume in need.


Thanks & Regards
Mr. Richard.
