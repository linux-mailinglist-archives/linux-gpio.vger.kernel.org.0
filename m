Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47A554E64A2
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Mar 2022 15:04:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348557AbiCXOGT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Mar 2022 10:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231871AbiCXOGT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Mar 2022 10:06:19 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 384DE6C1D1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Mar 2022 07:04:47 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id t13so2679437pgn.8
        for <linux-gpio@vger.kernel.org>; Thu, 24 Mar 2022 07:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=hTxCgye7BS+8xhu8iC9h1EV20LT2IK2RAWcPZdTP0io=;
        b=FI7XE2BGWrpMJOyU/lfCWwTQTD1api9lFOrUZELWBlmGm8W8L6yv5dzjVjBxBHVWlp
         YICouvYizXXadySE0m+cEoOTP0Vt5xQsTSsjSEJXU288Hu2tPUoGvzWWtgiuqsVAD1SG
         FXEKRZ4uqcf20h3qSep1ZI+xcwMQTqzo/F/+TFMdNOaWpuhrYsCRANtj/LBWd+KHl+DA
         Xy3NVvrUW7uTWXWmC58YGC9iTB4QQ5VPySAf7P3VyW0NUyL3Id0rUsvdul37EBxc3Tmm
         9LDU9G1PEb8MwaI7Gyvu1gwP/QxyffYfSf4SzPVoYeoWheLTPafUT5UNp2gHu/+JdTgu
         r9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=hTxCgye7BS+8xhu8iC9h1EV20LT2IK2RAWcPZdTP0io=;
        b=DwMyCy/evUtxOJ7Pjgh6oja1WgsijfxUtx6gtrYgd0MzUoQwYXcP8++J4+vAhEVb2c
         0wiqMjLoBdFgVpsCXfJEHOVbciVEtxS5KMU5t6Tj6hQL/KhX42nmr70ioNAVnIGrY5H5
         qh/h0mfJRCaDsyVn9MR0cxihQj0dLy8NX5iP70qbg140CejalcJLLeThmNVdvAHxZv8M
         l9316opYMlOyDVdmuvAPmQSXQdzRtRdwwH1hPq97ccmqF5Fe/wdwLrSqt7RaBeT8gUMj
         bJuOkfXewTWfekDwyerSrhkS9DUJUp+ag3BE8yAurKcoGSW1uMRTLJgbQXca5gEH3T0S
         Kokw==
X-Gm-Message-State: AOAM53193odKVjDQixumKN0X6wROVisYM6pSjQA8MCD2qYdFKFuVIYEt
        62dz3/nbgewOxQplugqGo6P6fetrxVZU9e4rr1E=
X-Google-Smtp-Source: ABdhPJx5eiYbxHz/G+NSfbHWdEZcfPfReF9vQnSr/DwRkbfo42yJFpT4MrHjMevn2neT+Latsv7OmELRe2g6rJtPAOU=
X-Received: by 2002:a65:5882:0:b0:380:f8dc:912b with SMTP id
 d2-20020a655882000000b00380f8dc912bmr4200801pgu.217.1648130686336; Thu, 24
 Mar 2022 07:04:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:a850:0:0:0:0 with HTTP; Thu, 24 Mar 2022 07:04:45
 -0700 (PDT)
Reply-To: wijh555@gmail.com
From:   "Mrs. Rose Godwin" <rosegodwin1999@gmail.com>
Date:   Thu, 24 Mar 2022 07:04:45 -0700
Message-ID: <CAL6LAtqC0N30xj5acT_JveaO7swpwZwjSD_C-mu4vrkEnux_1A@mail.gmail.com>
Subject: Good Day,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:52a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4999]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [rosegodwin1999[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [wijh555[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [rosegodwin1999[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

-- 
Greetings,
I'm Mrs. Rose Godwin, how are you doing hope you are in good health,
the Board director try to reach you on phone several times Meanwhile,
your number was not connecting. before he ask me to send you an email
to hear from you if you are fine. hoping to hear from you soonest.

Thanks
Mrs. Rose Godwin,

Sincerely
Dr. Irene Lam.
