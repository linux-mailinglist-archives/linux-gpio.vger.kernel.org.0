Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61AAC72E471
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jun 2023 15:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242612AbjFMNoR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jun 2023 09:44:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242584AbjFMNoN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jun 2023 09:44:13 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D95B19B7
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 06:43:53 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-55ab0f7778cso4064438eaf.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 06:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686663832; x=1689255832;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yDrvwaQgdFmBVJZsBTXqxF7u2xhBw6LQghRHQtjodbM=;
        b=h/gcx6qhYs5PgeZ4O49mfTn/Ts4gvVsy9crx01eaAuH5iC1vAApIwGdbLGrXqwlnRx
         Nt9VXvBLLLrMRb5cndzeIIWtvH9vx8SbtVdNVHNXuFwO5k9EaECHac3koTrxdbhtKlp7
         LYaKRdjT5k9KetRBHres50yXOFU8hV+CcUnnvkJJCgLG0s9mSIQOzDzn5yNhBTSTJYAp
         1Ff/k0ePGUR3odpidKKThrgizSvV9e2BCjbLCUvPg3XsoctaMjInUCX+izs61FMjqXc/
         eAsq1LWiiZyCQZIuK4nCky3JXmlx41k4RZxNIbl5/W5CZiedQeFIChY1ByBnLEP6xPpj
         yC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686663832; x=1689255832;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yDrvwaQgdFmBVJZsBTXqxF7u2xhBw6LQghRHQtjodbM=;
        b=f63J1iFY5Y8jRDxq0c0OstqyXpqxt/NqNDP9/dNCXRbKRNdyz3s5G7FskqKHRv8WW9
         cH78OFMdOU9811jPb/GxBOt2jUc0tp39BqZDWkODPebIKuYt5V0L0FcSuWmgNqjybC5c
         0ukhpzarcGZx6sMkeGDiRaT/GhahQFpoxOi85s9cemO0h2JOdRjYUYdl5MRdskjzz8mh
         vo4iJVl8fotEZAbeTH+5VT1PufmFbOGYkvFdYdrv0x3YeAork4HWTTUhlkTTm7E+sNfe
         YHI04yKXiRPyFdyt0trH7iHZwCtxkL50YoH0CNshKQgM3qLPSMuX0zTrbovVPYBmpPS3
         Bfgw==
X-Gm-Message-State: AC+VfDzLCAu/+kjfB+gkoi66jJW4s3Pa12aKl6fHwEROEMQXGVE/MlVS
        wsfvPURr8DbaoloCYUUwTqi+Orno4vOFUVhtybU=
X-Google-Smtp-Source: ACHHUZ7//AZNZpxu9A194nk8uA3FJBpd/49GXrVqqFg9V2uYXthePNxHA4nfnYb/fH48blPbdmC/SAiyr+RAbMdGdM4=
X-Received: by 2002:a4a:a746:0:b0:55a:f44b:43cd with SMTP id
 h6-20020a4aa746000000b0055af44b43cdmr7471461oom.7.1686663832544; Tue, 13 Jun
 2023 06:43:52 -0700 (PDT)
MIME-Version: 1.0
Sender: koussistella@gmail.com
Received: by 2002:a05:6850:39c6:b0:4a8:fa1:d600 with HTTP; Tue, 13 Jun 2023
 06:43:52 -0700 (PDT)
From:   United Nation <turkey.un.info@gmail.com>
Date:   Tue, 13 Jun 2023 06:43:52 -0700
X-Google-Sender-Auth: Smk7lY4oXKPUuEGMLSx9navVwKI
Message-ID: <CAEGKinK3D4op69BQ+j5WqPoHxFFDAtemfL+7S9yAZ+avFL6jgA@mail.gmail.com>
Subject: United Nation Compensation
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.1 required=5.0 tests=BAYES_50,DEAR_FRIEND,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:c33 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [koussistella[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  2.6 DEAR_FRIEND BODY: Dear Friend? That's not very dear!
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.9 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dear friend congratulations there is a good news for you
 my name is Mr. Kenny Frank. from United Nations
 kindly get back to us as soon as possible
official Email:(turkey.un.info@gmail.com)
