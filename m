Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 924D1654999
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Dec 2022 01:13:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbiLWANd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Dec 2022 19:13:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbiLWANa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Dec 2022 19:13:30 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E62D2655D
        for <linux-gpio@vger.kernel.org>; Thu, 22 Dec 2022 16:13:29 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id n4so3514977plp.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Dec 2022 16:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7XukgsAlfYiKI+yuvdwyFpb/FGCy9p+ybfvm0wRi4Y=;
        b=e/Bwp6N92muADepp56V+RNlXT970K50Face0KXz2IiLQMXTZUdGowjilWh9zd4cD31
         On93W0YFkZlYQBLtBfK8lovu4mLXpdeEn0piIeBu32JFYGCTWNM1skvLztdF//AqL4sw
         RLV8YGfCyqns0KwMgrP9bx70x8j1LLDASTNetGLxL4iLbVS5lK7rGAs9JYU7TS87pp9A
         XENOi72vKt5MCa5GaDxMvS3bU0GaDM57fnFSmEPx5em6S1LZfwf8jhhUjH1X+u/qrihJ
         3NU+wekDkvgjfCROdNFlDBrR2wp4JLe0kF0116jVIayvw1bhsOUnqQz4HrA5DS4sMEbk
         1K+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y7XukgsAlfYiKI+yuvdwyFpb/FGCy9p+ybfvm0wRi4Y=;
        b=XdfsAEmtnAzfscV7YanF09mQ/CLS5BbyrbkafHUuWC3qSuDX/4sZt2aFIIRgAw2nt/
         conKvbM2aZsL/uD2MK7w+4D5/chDZ3coT+eaWZ7+ueRNFJe1g2OqqVxYoqhZZ+eLR5XQ
         hzpVK92fqdx0qew3TzOeFaXbqB4lFNBptfMsKfbm/8N20AelPy/uM+r91CITR1TiJrEr
         P9cAay998WLYB5Id3+BhlKLd0mBaIUz74lgvtJRAInBZabpfXqGL6+GFj9tI2pNToFSF
         oMOrq6VW4BiHDjW4KtyDqyss9Vm5X9GUgiVYp8j6yrDsZBNIljdzqaOHSoT5g3vJWwTS
         GhRA==
X-Gm-Message-State: AFqh2kpe0+Im8JSpeQrnNWhZtwr7KC7kVCCidOe7BVfAN5CYADvvXA3k
        J2AriUXZXltx7KcVgLW7Mjcha1u9tb31hBgP0IA=
X-Google-Smtp-Source: AMrXdXtFv69uLR7HzhSMSsUaaGsEGHbRlCVGvJemGuxaP/0gkaSLVQWJyMkgom9mxrXj0J47K7wNei0ogQrvGC5tAE0=
X-Received: by 2002:a17:90a:ebc6:b0:219:7c23:8a32 with SMTP id
 cf6-20020a17090aebc600b002197c238a32mr777716pjb.68.1671754398098; Thu, 22 Dec
 2022 16:13:18 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7300:788a:b0:80:c087:ed93 with HTTP; Thu, 22 Dec 2022
 16:13:17 -0800 (PST)
Reply-To: ab8111977@gmail.com
From:   MS NADAGE LASSOU <jkjgdjkdsfjf7662@gmail.com>
Date:   Fri, 23 Dec 2022 01:13:17 +0100
Message-ID: <CA+WZB7cZB9vD2Lff+9Qs_x-Ei8aD1x9DrSw+aojWCft_hx5PLQ@mail.gmail.com>
Subject: REPLY FOR DETAILS.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        FROM_LOCAL_NOVOWEL,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:635 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4996]
        *  1.0 HK_RANDOM_FROM From username looks random
        *  1.0 HK_RANDOM_ENVFROM Envelope sender username looks random
        *  0.5 FROM_LOCAL_NOVOWEL From: localpart has series of non-vowel
        *      letters
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [jkjgdjkdsfjf7662[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [ab8111977[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [jkjgdjkdsfjf7662[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Greetings.

I am Ms Nadage Lassou,I have important business discussIon with you
for our benefit.
Thanks for your time and =C2=A0Attention.
Regards.
Ms Nadage Lassou
