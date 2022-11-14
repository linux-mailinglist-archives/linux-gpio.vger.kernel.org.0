Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73E0E62786B
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 10:02:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236688AbiKNJC3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 04:02:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236694AbiKNJCW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 04:02:22 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84EAD1CB0E
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 01:02:21 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id e13so7293972edj.7
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 01:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ddKdS4x8c4ZSI9PbKdla4xMHlbecpUYnHnf7KqPY/v4=;
        b=mLIRFP3nM1QPmTsxF0MUAS8PnpFLkBGp6MxsW/etpFY+bdhGl1O+WXwSnoqFKwHFoA
         D8UT+1YOlbrkQbcNxXMnngoGD7CoF8+Jz0+fQERyhWckzxx8cXDjX6FCj4rVAPDNkxsY
         iz6/9A7mdHzChv1GYyKT1gJ0/8zIcKroq/pX2Z1NLrnX+UewPEufYFBeTPNEhIFjdvkF
         0aBg+WAdOC4UUuZLpPFeVkp22K313Anql2qz1+fgal59K4vUt/PsRVMJiJ4lcAJNoyJR
         5urACXpZGxabXf4/qG3M3K0sR0U7gegYcDwFbSipxwg59YrM6nOMK+ETUynKuQhB1r+s
         xgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ddKdS4x8c4ZSI9PbKdla4xMHlbecpUYnHnf7KqPY/v4=;
        b=dMkgVCGe+gtpbhvVsikbKwbEVKoUwc6BbqH06RfwgC+2sXao5ICqSKe+AFOS9ZOwwx
         Tub7NcX9NhkQ2chPaWSZMM//IIdZI0b8McH0bWk1+L3T9eddSBbBtTxUJYu2DJtF9FPl
         F6yVTm5nCSECrNqcyiu283GcYJ8y/gEz2dIGIYYTuaVEsIKsuqhBmtj+jKNB7JV4EvQ4
         S8JuHo2P5jgG3ZM09o/8M/7o5c5FEEg8lE2ktnHW/85i8vpJg9uyZpZIkONTN/u/Tiyg
         Mz1YbN+ZCQgTiF6Da5pCRTmpai+rgQeGlANm7yPEU/u/zcTbXE3mb9+QOCFchiuLL2Hj
         FcIw==
X-Gm-Message-State: ANoB5pnigU129DTMgwetLVsYTDnjajRQqdZeLse+g0FVkYstBDbEq656
        J5CSMRXWQE4VH0ZqHaPjaU9e+4+fvFTWOfcDhZ4=
X-Google-Smtp-Source: AA0mqf4tziZketbScIv0ehLOvhK948K49mMVNAq6wnIsY5FeYdrNcf5dSfw2Aq4v6byLa125lp3rkFnV7ZnsGafQ2sc=
X-Received: by 2002:aa7:c543:0:b0:458:dbc5:67c5 with SMTP id
 s3-20020aa7c543000000b00458dbc567c5mr10553027edr.214.1668416539946; Mon, 14
 Nov 2022 01:02:19 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:906:9c90:b0:7ae:8e84:1093 with HTTP; Mon, 14 Nov 2022
 01:02:19 -0800 (PST)
Reply-To: subik7633@gmail.com
From:   Susan Bikram <jeannemorgan479@gmail.com>
Date:   Mon, 14 Nov 2022 01:02:19 -0800
Message-ID: <CABXDZ2Ky0fqQ8xC69D-E94eEnDqOA=+4LJcmiH5vfFYj1-N9xg@mail.gmail.com>
Subject: Please can i have your attention
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:52f listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [subik7633[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [jeannemorgan479[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [jeannemorgan479[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dear ,

Please can I have your attention and possibly help me for humanity's
sake please. I am writing this message with a heavy heart filled with
sorrows and sadness.
Please if you can respond, i have an issue that i will be most
grateful if you could help me deal with it please.

Susan
