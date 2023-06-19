Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC07734BA8
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jun 2023 08:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjFSGSr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jun 2023 02:18:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbjFSGSo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jun 2023 02:18:44 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EBC18F
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jun 2023 23:18:43 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-3fde9739e20so10881751cf.2
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jun 2023 23:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687155522; x=1689747522;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=POzqMJPnZ8n/AxRgRpXufq5bH3zdXADjXwcrF1+uW7Q=;
        b=B4wRu9oWg9ZsAod4mFJMdM8EjlX0Jeus9fmy9apCZlh/HGMle9VQc81IslLIo0Z3GA
         fKpTWfW7e3s+Xpt70eODH7jguFp7wWn8rlGtz9ICVg500gzx6M8a981R23qP+gXpE/UH
         GvSGcc8ofclpyDrnpu/l36bzu702tq55IO/2+c567i5N541EkVAI6F56FRLCnO6wqXqa
         RmSEmnA1CaO+xmpaLDyfQzaiJAcQvtBtDmvYaIAQwtuj4HLYPqO+XpWmo59g7wQr/up9
         fBnrIRQZY3ybWrK3DrQxRxOGSkkz2tFtcyt60x9K9y5YBrTk8OmV/hccDQpMlTp7L34t
         HBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687155522; x=1689747522;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=POzqMJPnZ8n/AxRgRpXufq5bH3zdXADjXwcrF1+uW7Q=;
        b=eO1B6zE1eSJa5COWR1EwHxDEVUpC0CMImgHK5WUVwZgE0ufsvu/CAzYJNTvmUOhzjF
         PZM9jRbzI1POw8bUqjO4yrC+6lFiZivzdqn/9+r0+D9bPiKcqJzsVChcWKaf7RINAGHc
         6qcgQe4GYgDhz1Gn2xN2kJocUlo/yYOGHhdq0ltPeZl+vq+JzlF4r0arvQzQZicCOHeG
         DV2fJTF0NcLR3h+x6GZfeNQ8xC7RpxWUWG8rYryKCWheJAsZAeCMooa4a60PhzlqXbfd
         POpTUXnIooLWBfTBvN7OmReGXGpmfszTZt16MW6Mx/Z7lULWZAcZIGZg0k07LdsAt3F2
         dW8A==
X-Gm-Message-State: AC+VfDyEM/R7Mk+vyeMFT4asnJjgezE81mST1t14sBAd+oIpVatoVPVF
        LiOS5d16Hx/kGaQGdJhNFINU45Y2cj3AkptnTxk=
X-Google-Smtp-Source: ACHHUZ5i6LHxLamGLHL+3E2mkJBpRy9oFrn3h5pEnDVfeDn3nwDlhXyT+xOinCKg1lm30ELKhvTCMOYB3GiY0fCTHkI=
X-Received: by 2002:ac8:5846:0:b0:3f4:e615:dea3 with SMTP id
 h6-20020ac85846000000b003f4e615dea3mr11596450qth.44.1687155522654; Sun, 18
 Jun 2023 23:18:42 -0700 (PDT)
MIME-Version: 1.0
Sender: georgievak495@gmail.com
Received: by 2002:ac8:58d4:0:b0:3f6:925f:32b with HTTP; Sun, 18 Jun 2023
 23:18:42 -0700 (PDT)
From:   United Nation <turkey.un.info@gmail.com>
Date:   Sun, 18 Jun 2023 23:18:42 -0700
X-Google-Sender-Auth: SSBvHe-n1DyyXF-HFBTEH5t2arY
Message-ID: <CAMtQqt+YYYjkriysOavL9Z3eB-LkqTNTMJ+TMPufoWBV1NE8TA@mail.gmail.com>
Subject: United Nation Compensation
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.5 required=5.0 tests=BAYES_50,DEAR_FRIEND,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:82d listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [turkey.un.info[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [georgievak495[at]gmail.com]
        *  2.6 DEAR_FRIEND BODY: Dear Friend? That's not very dear!
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dear friend, my name is Mr. Kenny Frank. from United Nations
 kindly get back to us as soon as possible
official Email:(turkey.un.info@gmail.com)
