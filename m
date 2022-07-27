Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFE99582759
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 15:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233385AbiG0NEc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 09:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233645AbiG0NE2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 09:04:28 -0400
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76FD4275D3
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 06:04:27 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id k129so16540882vsk.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 06:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=pWru1kOrmOdDwj/NW5CsqDdi/shLqio0EDZEA18dZ7Q=;
        b=LQjyWY7bRMXDGlpXOxKZneuphyTdVJteh+N2f3Z6NNrSIvbB6u+PJ4gj77LupScyQ1
         lVALuPgMSZ8WAEiI63Epkgck+DvPdsEu6tndHjyD3AnY4Qs9w3SQN7MAnx9xOhE+8jrV
         C/Y1Z1AcAb8kktwed0c8F32vc8lHV2njl0j3CKCrffzQZrR5/sOi2lSAR11RdFS6oEBe
         yca1o2Ot3kA8UGc7GE48K62FAsttLdifrC2j3/AHxfYMlVpZtJ6d5YyNps81jr0KjqJQ
         ZG+53/ifwfAg2hgiUAPfS4f+idjdAOQQR1B36PZiLoY+LJAtUObS79Kjv1okNkJZOBMe
         fNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=pWru1kOrmOdDwj/NW5CsqDdi/shLqio0EDZEA18dZ7Q=;
        b=y3lXvEGaKddkVhU0Auj8a83vRI1ovmNUUvQCt7fe8whjifUwzpWvmzjPfPiwOeG1Zt
         Ov7wmilZLv3DXWFkFBkPPQVT/Uf0ljk3Eu7sdB+YR4wRR7Fjo59oM3IbZHoE9CCkYdhX
         CE+GgLHOewyjAGdfK78E2abX4SO9f/Bmwn+NUXvH9+ODcgUZWRR/YopuxJT5Hpv87hbQ
         QZ1jroGRAlBUSdixv6LrkYY9Gw2WkRgceVJZFQ5X5hYjFJZVRYnmOzpCc66woW63kpel
         Bn3tTF+p6MNmHm1KF0viYBcbq/4brG6nA9ZO/tzaNZgcO1hIoc5nzA3fGDo15G5OxeFA
         g1Gg==
X-Gm-Message-State: AJIora8ifQAi+mmrBsZyqofA+xy492fAdk4nyxz7yzJ1heNCBP8a0d5X
        FcEyUk2BiP2bcHIX+/pjZH6oFy2IwP9ogmG+pLE=
X-Google-Smtp-Source: AGRyM1unE0rJqem3GTU0RTOBq622WxIvvMjFTa57v4lZpm40mRx8CrL8r/8hawyu0IFdxJNxDB1GkuIDJrHTX6dhLCI=
X-Received: by 2002:a67:d318:0:b0:358:557f:74c2 with SMTP id
 a24-20020a67d318000000b00358557f74c2mr4754735vsj.55.1658927066592; Wed, 27
 Jul 2022 06:04:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:a726:0:b0:2d5:c8e7:a572 with HTTP; Wed, 27 Jul 2022
 06:04:26 -0700 (PDT)
Reply-To: kl145177@gmail.com
From:   Ken Lawson <lawyerokonesq@gmail.com>
Date:   Wed, 27 Jul 2022 13:04:26 +0000
Message-ID: <CAHuN8_Q-Gz2yLMgdyD3fcXCndPhfTbJ=-e-PWDauSR-4vVY=kg@mail.gmail.com>
Subject: Please response back to me.................
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM,YOU_INHERIT autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e2c listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5037]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [lawyerokonesq[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [kl145177[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.5 YOU_INHERIT Discussing your inheritance
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

My greetings, best wishes to you and your family. I am still surprised
why you decided to abandon your family inheritance fund I just want to
inform you that the bank authority is not happy about it.

Yours sincerely,
L. Ken
