Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF576BF888
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Mar 2023 08:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbjCRHu1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 18 Mar 2023 03:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjCRHu0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Mar 2023 03:50:26 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 346F5212A1
        for <linux-gpio@vger.kernel.org>; Sat, 18 Mar 2023 00:50:22 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so11471842pjg.4
        for <linux-gpio@vger.kernel.org>; Sat, 18 Mar 2023 00:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679125821;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crBvFPTTmOot3lcyYt4C5FmdGIzcS6MFUn4GTbWgHyc=;
        b=jhgj2cjHfo34f0J/TdtTftksdUh2HOEL0q6V2yMcfyIdPtgs90Lx7E9U778y/e+DYG
         mcF8HBPAIORi5cm6VjEtGPq0VtjdsskHz5drvBBV7PWxCiw4/4+tfzxOziQTwRahH9g4
         CjaqWTGw0m+4FpCsrJcfgpnBFCcSqGoiEX++7QB8ASovVQTxz+su6Wtn+q3YGF7Fqs1b
         8hxrN8CIwWC8SkOvTyLh6Si8puNHezxB2DL5dW+sEL+ue0Obcd8f+yBActRgRyf+e61D
         zdO3mfoMVj3I0ugNtRcs/pZwPIQu6Gw7M7jhBzm4Cc2OXsKYw71Ecjusm7xeBAnewDt7
         Wopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679125821;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=crBvFPTTmOot3lcyYt4C5FmdGIzcS6MFUn4GTbWgHyc=;
        b=375y+gbt58mRC0cWpiKLEF1pDNrOGAXHaiX2m9R+VnjnbdNwBodJZ0R8OzeIjzQrlQ
         /hUBUaxYMIFhhWokSJ7r2HX1fjYDhN0QGu/Xz1DZe6AXoMCZKQphgx/nYXO4G3xGpGZH
         ursHQHeJjR56sWciXoI6VTEPuUfRu0qvNhLDoEaOnr9P3xGhWUMN+XL4G9JTyc+msFTl
         jUPO4v9vTzd1ZRKse4UkJ1CYwLuSQDm81NRP/3fswhY1Vo65v03dF2Ors6vRveCCIBHr
         /6nPyudVXnzKyQZL7LjkXwqsao5t3K0VeMebdZnlgqRisoOowRQmSMxOtaVs3omo+gcr
         fk3w==
X-Gm-Message-State: AO0yUKVgSaKwZXRTAbpUOwex8Klqqq4cqj9lZpAvBnEOWbmJIsdwqgqF
        0keP81UjJD7uW+hizB+24XgfaY7Ux6N0HtPWrfs=
X-Google-Smtp-Source: AK7set/UauYHQI97tEDAbKyLnQCQ0Y3zK3Fn0h7+SJcjQUMExnXrLYg+YARnPHzlbcjYTeXmJ5b/ckp5U7SZw/+ZWqM=
X-Received: by 2002:a17:903:24d:b0:19f:2339:b2ef with SMTP id
 j13-20020a170903024d00b0019f2339b2efmr4007325plh.9.1679125821676; Sat, 18 Mar
 2023 00:50:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:f2d3:b0:418:f1e9:922c with HTTP; Sat, 18 Mar 2023
 00:50:21 -0700 (PDT)
Reply-To: enocvendor6777@gmail.com
From:   " Emirates National Oil Company (ENOC)" <jakubjakub871@gmail.com>
Date:   Sat, 18 Mar 2023 00:50:21 -0700
Message-ID: <CAMLysXoF2uErA7Nv5LTJxHEzVwghAbv-5wnAo9B=mVyX+j38bw@mail.gmail.com>
Subject: Emirates National Oil Company (ENOC)
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:102f listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [jakubjakub871[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [jakubjakub871[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [enocvendor6777[at]gmail.com]
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

We are inviting your esteemed company for vendor registration and
intending partners for Emirates National Oil Company (ENOC)
2023/2024 projects.
These projects are open for all companies around the world, if you
have intention to participate in the process,
please confirm your interest by contacting us through our official
email address  project-ae@enocvendor-ea.com
We appreciate your interest in this invitation, and look forward to
your early response.
MR. Nasir Khalid
Senior Project Manager
