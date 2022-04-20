Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23BFC508868
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Apr 2022 14:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353557AbiDTMrM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Apr 2022 08:47:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353617AbiDTMrK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2022 08:47:10 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AC8C20BD4
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2022 05:44:25 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id j8so1654138pll.11
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2022 05:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=sZJL5nrfj4uWDSfp8pFqWp/BCZ9/TcW4ZIqyYuNNsrk=;
        b=cNiSe6H7+QoirFkEt1S5NXgHSBvxrLEtl3ZCwLfVx+Zz4HlvM5dgE7hWp+Ed1Y/LY+
         gS0HsaBiea4I2WlMz2eyiQe7NQ4BPrchLILycjbMXmT+VozxuLndPzgBdOPNu0VWZpF+
         IiTNp74jRPz5hC/jqZdoApf4pasapRvMaL0e+O741RlKN3yoYonR8gRjEjvJW6DLAzOs
         /lZoejfUI5aeVzc7m6yWXgj92MGNjupQDQcLuhKGznLKMULvBvOaVK7mSnqa319vf57g
         FCgGKO6Mo7mNFB7ivcZAnFP1HHpF+37yRFlolU4zeFsMrzrynOljnSTzL8ZGRZEiiKbi
         bL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=sZJL5nrfj4uWDSfp8pFqWp/BCZ9/TcW4ZIqyYuNNsrk=;
        b=qR6KRXum8DCa7lbeZhX0gm4n1vJ7hXBf4kTVeb6JjWAPHIlEluPGV2Rq2Awgy7xXGo
         yAnE9O7IDIwTXXS4xEqmUWYU6huZWy5At5nYTy38jjzGkXQmab0bly4ztKloLmFB5CnQ
         tFrsG9rR2X7rXGxLTEoUdx0ThpXOLkUU9S8Rist4JfUn/axzok6h48Lf/ITQs+Ov7MhV
         grJCMTxDOgPuWNgxxDGzBXpvLDaG2aGN47gOqhPdU7a1JGsuQJ0HrIRWVk+1yh1GSRQV
         TuRL3ylHHhEuiZCuZhSE91Rm2zfsLUqpzDpJk7kf4e3pXayxgEL+t4BBiszjv5NneMB2
         BaFw==
X-Gm-Message-State: AOAM530ztxtAQzqZ2tdPPB1TDfa6kWQVGntC49+laVdyS75OyOAXOr7m
        SNjDzGygWKlV6aC4/3v+//oJEyfKF2GGEK1Q59M=
X-Google-Smtp-Source: ABdhPJyEkvJyZ9+yCOZVcZ43DjG/iz7miU09qHMy8/6Wf2OTOT9AUScD8B4Ns/RBODkqK/8XpM/vAvYuZffjz1S9J8s=
X-Received: by 2002:a17:90a:b396:b0:1cd:44cc:15a9 with SMTP id
 e22-20020a17090ab39600b001cd44cc15a9mr4166825pjr.77.1650458664458; Wed, 20
 Apr 2022 05:44:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a11:526:0:0:0:0 with HTTP; Wed, 20 Apr 2022 05:44:23
 -0700 (PDT)
Reply-To: wijh555@gmail.com
From:   "Mrs. Rose Godwin" <rosegodwin1999@gmail.com>
Date:   Wed, 20 Apr 2022 05:44:23 -0700
Message-ID: <CAL6LAtoaVQ5gWLPBdZT-si4rFfggDnOGVMhn-r_yuU=f+2w2hw@mail.gmail.com>
Subject: Greetings,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:62e listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4997]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [rosegodwin1999[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [wijh555[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [rosegodwin1999[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  3.6 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

-- 
I'm Mrs. Rose Godwin, how are you doing hope you are in good health,
the Board director try to reach you on phone several times Meanwhile,
your number was not connecting. before he ask me to send you an email
to hear from you if you are fine. hoping to hear from you soonest.

Thanks,
Mrs. Rose Godwin.
