Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 223E770A653
	for <lists+linux-gpio@lfdr.de>; Sat, 20 May 2023 10:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbjETIRH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 May 2023 04:17:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjETIRG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 May 2023 04:17:06 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F9EC1B0
        for <linux-gpio@vger.kernel.org>; Sat, 20 May 2023 01:17:01 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4efe8b3f3f7so4607290e87.2
        for <linux-gpio@vger.kernel.org>; Sat, 20 May 2023 01:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684570619; x=1687162619;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dBUzdWOxAaFg2ZMfsQEtUXSQUsrELWherQAFXLI3b6w=;
        b=Ph9K+Vpux4x0DDiBElpenfxB6QRTj6G48N/eYNB0dKDj+YnkNyEJ5Wh6tvJ2uLsjMf
         FsGmGFhYxiu35nnxEBkIySIbTwudrjniqjH3HlZ2b3fafnKjGy72xjZz5hkcduPlxW1k
         x+1NdqLDVZIskgTBkpq9MJzbxoz/h3Eo//OYwUxyGzfo/mZURcPx+7aSYARzb5JH8A3g
         outT7tCDx3Z8gWRNHEG5KL+YBKGhoOWhAf+fQzPl9r0HLRvZ6lArZ4O3836UkUrRrRWr
         N5vhwj0wo2if4shDp6p1tGwPGoVKRY8O+1iEzRQ8LjjEdeaN8yEicOIAQOU9/tblUF7Y
         YFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684570619; x=1687162619;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dBUzdWOxAaFg2ZMfsQEtUXSQUsrELWherQAFXLI3b6w=;
        b=f4QwHDscLhVklGY3UP8kCjPeWkFXV4+Cq8yflZWaVbPGUBXDusup3UbYDuyrm4zTQ4
         XBhxbLoIJi9sRoa+6bSCxV+Q7HumFi4Im0fJMzV2Km0HgJAYND+XCUvff9iZrBm4Rg53
         Y7qZAVnWDeBbWzOeETiP2ySzexZi66nl1I1Qpi+rTQh65mcveGBhofzul4ARYViXyWcD
         02g0qP5dxZk8sSy2X24GfOdoFi4o98LF8cJhxuaM0gnVujeZcHpS4t4dLG+aLcHoxmMH
         7sQbFC+rm/0iMnvDLUlYnTTCksFfCngxc2s01XPpAwdpj0cQdwT5QDhRejzRsJsdx3kQ
         x9Qw==
X-Gm-Message-State: AC+VfDy6aP/UFvrpkkXc27yHYlxxcFS87da6ITL/dho+z79FyDLy6QxE
        PQ6ZXWj0/SzGmnyp6xdDxbTvH64w036z80dEVng=
X-Google-Smtp-Source: ACHHUZ5cd516VD1P5M6X/AQ4hWzid2SSSLcSFdKFHkpGa1aHnrpxxIUuNc29ajfR96b7KoZTTbknnGoY47veOuvu82Q=
X-Received: by 2002:a05:6512:64:b0:4f3:963a:7007 with SMTP id
 i4-20020a056512006400b004f3963a7007mr1418991lfo.34.1684570619434; Sat, 20 May
 2023 01:16:59 -0700 (PDT)
MIME-Version: 1.0
Sender: romeolucca5@gmail.com
Received: by 2002:a05:6520:2e12:b0:25c:b091:2e7f with HTTP; Sat, 20 May 2023
 01:16:58 -0700 (PDT)
From:   United Nation <turkey.un.info@gmail.com>
Date:   Sat, 20 May 2023 01:16:58 -0700
X-Google-Sender-Auth: RMmwppAb_MaHZqqmInEm0btgO7s
Message-ID: <CAL7wM2qoJEYtbNEYHvdVFgqydUu20zk-wf8RBJmsXr6-nq5v0g@mail.gmail.com>
Subject: United Nation Compensation
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,HK_SCAM,LOTS_OF_MONEY,MONEY_FRAUD_3,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Congratulations,
I am a representative from the United Nation compensation program
headed on this day 01, MAY 2023. This is to officially notify you that
you have been selected as one of the lucky beneficiaries of 2023
United Nations Compensation Program. Your name is among the top 50
scammed victims listed by IMF/UNITED NATIONS FUND RECOVERY to be
compensated with the sum of $1.5 Million Unites States of American
Dollars ($1,500,000 USD). You are advised to send the following
details below for immediate release of your compensation ($1,500,000
USD) through Swift Transfer (T&T) or through ATM CREDIT CARD

Please kindly contact us with your below information for your immediate payment.
Mr. Kenny Frank
United Nation Compensation Commission
UN Office, Istanbul Turkey
EMAIL: ( turkey.un.info@gmail.com )
WHATSAPP NUMBER: +90 501 067 1429
