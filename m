Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6304A6B5984
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Mar 2023 09:41:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbjCKIlV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Mar 2023 03:41:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjCKIlU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Mar 2023 03:41:20 -0500
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE6AD12DC31
        for <linux-gpio@vger.kernel.org>; Sat, 11 Mar 2023 00:41:17 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id o32so6765687vsv.12
        for <linux-gpio@vger.kernel.org>; Sat, 11 Mar 2023 00:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678524077;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+CEZRZEOJVmAfb07UohKPHalX/8xKQCW3mCwVUhKXY=;
        b=nAg3aRYpKJ/hSn+VSxABMDRWPWo6y0rzV3xB6/sc+X4rRL05pskCAJzzNJ208lTKk7
         SQIZ3i8CgA3o7Qg/+Q1TRJcJ/L2IxaWGfx2SLPKmH13wfPWzKaVm2ZgXwBZWk0Mi6nbI
         MBKodwEgtI03EmYwCcR1n4sXPPYVSOYls/ihTA7pFpvwy6ZSDtMWtG6vmJxR6qvjcgNX
         IEeL++7g3f7WsQZmDoMyo3WjcIJxoELZTbUlgaRDkzHtUF08eREiTiZQe+AF3vmOCnhD
         oZGsbMgBqyHz79V9m/NM2xR/JdspjC+HIm8z3iLnWWGO2r8l9zomtTjPDgzOlZYHwm6/
         /V8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678524077;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8+CEZRZEOJVmAfb07UohKPHalX/8xKQCW3mCwVUhKXY=;
        b=zcKGwmRHe9TBegzgCfx92aMfeY6iT1b7OY9yGOAbo3cM9idmvIuum+3w35tfGRmEC+
         ASIjadafdnncu1sL8S0xYEay4xcIhXD4XRAC3F6YgSimIoHEM+S+PkxuR/IrcViyCsSm
         CbWefc2dOyVyfQOxgJcqtd/Hs7JgaBgcUO5Ln69U6jlsaidMJtBf5elxNg5iZPmREmpz
         D0FQFcDom9+roqW0jtYWJw0ATF88cmotUdo3D2mjkBLH3CINFYNKeYG0nGDqnE/S26Lt
         CwtACdBhEcAESnekcaMH3GwN/luoFtsQi/0pSlkHWEUdy4cx42/OZ2yTc5M1lWy8vWkf
         oklQ==
X-Gm-Message-State: AO0yUKUOzeruuSLHHNe3uflmBJi+YzyMrS49WTGVlctJy8aV9TAsHE4c
        fDi0mJGHYa0cvMPryolyaYJVeuSSB7NEyEUeHPg=
X-Google-Smtp-Source: AK7set/qyTDdlZmmHNBS8kaPfxi8HjbCGQztkWTWoK3AziyJ63Rg+SkSjIjEAJRb7PtIstZtpdoQImtqXTcugcpKEC0=
X-Received: by 2002:a67:e902:0:b0:416:2ad3:35ba with SMTP id
 c2-20020a67e902000000b004162ad335bamr18502895vso.1.1678524076711; Sat, 11 Mar
 2023 00:41:16 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a59:c90f:0:b0:3af:2d22:adb1 with HTTP; Sat, 11 Mar 2023
 00:41:16 -0800 (PST)
Reply-To: godwinrichard700@gmail.com
From:   Richard Godwin <wr9236251@gmail.com>
Date:   Sat, 11 Mar 2023 00:41:16 -0800
Message-ID: <CABx9BKDCK1aN0AZmuJbadU5BVQN7ynat=eTEBDbqvGiFVBuUzA@mail.gmail.com>
Subject: URGENT
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e2a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5041]
        *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: ear.so]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [wr9236251[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [wr9236251[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [godwinrichard700[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

-- 
Hello Dear Good Day,

I hope you are doing great,

I have something important to discuss with you

if you give me a listening ear.so that I can

write you in details thank you as i wait for

your reply.

Mr Richard Godwin
