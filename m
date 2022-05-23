Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 811B5530EFB
	for <lists+linux-gpio@lfdr.de>; Mon, 23 May 2022 15:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234534AbiEWLKp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 May 2022 07:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234522AbiEWLKn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 May 2022 07:10:43 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B0423FBD3
        for <linux-gpio@vger.kernel.org>; Mon, 23 May 2022 04:10:43 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-2ef5380669cso143491697b3.9
        for <linux-gpio@vger.kernel.org>; Mon, 23 May 2022 04:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=xsm74HFURP+a75T0tJdP3F9J+dr2fS6rGzX/2UxjMro=;
        b=DTlAiCW7OPR1wBHviTw1/OEzMMsIBxVR2AuuPhpwnUOfcVoCKkPbaXzdkkiyEeGp8a
         k9BVy4CIkru5aIaITek+YqZQpMBMCVnBYBK3i2fX1PamFoSmrXjKjSZITEA+jcnqNmjq
         lEi7bq+5EHkq2ygZOE6bpqbUgBC6laWrrqwAPvGbFcPfQ+IRq7VhJZ0lM63EfWiZ4ZVW
         BQ2l0T+n7trS2MFAk24udFh68c6c8fBfVmC7weorb+UHLafrdEBqfUdfjExwLz4sH78J
         m+8nOvTLrVm//dbZljdwy1EpyFXg4cMsxmV30/NE4548d61xbDyy2lIGEbCanw9/UwV4
         sgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=xsm74HFURP+a75T0tJdP3F9J+dr2fS6rGzX/2UxjMro=;
        b=77OFsWsWUyaL84s34p0hxTHxy2tOo+y0ii4MHa/6ISSDjcjwfTyWoe1NUtZ2tCws4q
         nuzA12IEdjxxH0CVPrg6cpaxTJmwN6QrmzKMhI4vpgu+uZoWuzqUwv70tt8/tbctiOjX
         miI7DbvCXLILy/Dj9vZ6fVOh4PseBsmJogCwruDD0J0NKkVJs+1vjmDxH66r34mFtwYk
         9R1bkpF6PjGC2//z3HEBaF5MpUIg6hPHohAWfQAdxMw7qaDau0tdDKYim1pxF7zE8jbK
         KxnoMxB47VPwVUQwTJI2UxIopbsfBzeXxruao5d7XlXkbYpdaffw+88Jotwt5BkQvOWJ
         oYXQ==
X-Gm-Message-State: AOAM5318laoi9fGfG5LhXQZDHuQqbW0Eey3/Ve+6urUNFlJt0K7Blhuh
        w9NGlHIgOU8wwTOxQ480mKhyOB1IBIDAH8O1aCA=
X-Google-Smtp-Source: ABdhPJyemd7j34MUw82v7bRM5ea5ldDubx5aUc1fLxjWxvi7Nsm+LxgaA8OT9QH2nWeDkkgXhxlcQHuBLljRqZvq1Wc=
X-Received: by 2002:a0d:df0b:0:b0:2ff:1ed2:fb48 with SMTP id
 i11-20020a0ddf0b000000b002ff1ed2fb48mr22726233ywe.216.1653304242629; Mon, 23
 May 2022 04:10:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:5491:b0:17b:3065:aa1e with HTTP; Mon, 23 May 2022
 04:10:42 -0700 (PDT)
Reply-To: fofoj6432@gmail.com
From:   john fofo <tracyadams043@gmail.com>
Date:   Mon, 23 May 2022 04:10:42 -0700
Message-ID: <CALA2XKnex+cyZ0_DssO8Q5XDQsmrndiYgVh360FrVJYqoF0uvg@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1130 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4988]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [fofoj6432[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [tracyadams043[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [tracyadams043[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.3 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

-- 
Good Afternoon,

How are you? I guess you're well, i sent you a message last week, did
you read my previous email? get back to me upon the receipt of this
mail.

Thank You,
Mr.John Fofo
