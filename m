Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B46826B3C7C
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Mar 2023 11:40:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjCJKkq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Mar 2023 05:40:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjCJKko (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Mar 2023 05:40:44 -0500
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3D6322C9E
        for <linux-gpio@vger.kernel.org>; Fri, 10 Mar 2023 02:40:11 -0800 (PST)
Received: by mail-vs1-xe2e.google.com with SMTP id x14so4237638vso.9
        for <linux-gpio@vger.kernel.org>; Fri, 10 Mar 2023 02:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678444810;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Im/9DXVHhtOOXS3TLym7lsF/hK7jt3RhTjm4M7IjNeY=;
        b=AHBBQbhp+GRQtLyPkI7kfSYv6+dBih3zz/WbLYTZ31mOm9Z6zqzyvaMD35Lhk0uued
         V8QoGC/6tIr7CkNsW5uUQlDbCxO24GTQczoIQvIcTbgofg7czRSe8xAnmRhp/p5UyzQn
         M4pIIMO9USjmTwDyqeE3SLXWa8M+fpnK0EjRZGoytqqmJd8pEdXxGjV7ChUo70ycOH+l
         Co+7rw8h8pHiaVBXR38uX/8ATWR8uclRbEMlSnrIBOeuMwecVkHGeLBmcJkb4zBQE43+
         oCKRt92rNMqNZMQLFopgy+vGjDmwCOfUlsB3EdqJOEEX9TY7hTMlnK8VNC3oUC/0tGdQ
         6+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678444810;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Im/9DXVHhtOOXS3TLym7lsF/hK7jt3RhTjm4M7IjNeY=;
        b=oNc2C15L5WylN8ekb7QY06xAmurJA7j0c/E8DnU+vdjPQFY8bdIzYIpPSPGxZ8LNQS
         3wqpqPaVFQT3rcMHhUOqWQ6mPeGzRP/zne6Eraj8lw64aaO7MIFnq4bDYpFq8GSKctir
         WmKL59faTP2+bG6ZWI5Nm49FU0WTloWYMGwwKmCDkDvpng33n3zKSXnipTPJSZkJXFT5
         Y8ZTzOziL4EUC9ZUzAcIXe8ebwJr/VjoLdr5iEoonEwN4KIxCwp35DuADGwc7t0rLEei
         y6kRT8RWn7hZ8hjnylEaECLWAJeDhc4Kjk3GGg1HPXy+qyaH9WWNbpsErhLN4Auenf2v
         fyfg==
X-Gm-Message-State: AO0yUKUnyZX+gkFm4dyzR4Hor8pw7cU5VVf6IEjafsTmG1WEyeT0T24s
        Sz2SUxofA1iXoLJCJ4hGCvBSZOx0UheEef3Lvc4=
X-Google-Smtp-Source: AK7set96aS4Y9yUwb58h1gmFlkrvq6V7n0KE56lN2dQ5cWSoV/1WeY2tS/s1aAhKW0XudizkUNjITbmMp3A1MDfqNe8=
X-Received: by 2002:a67:db97:0:b0:412:2ed6:d79b with SMTP id
 f23-20020a67db97000000b004122ed6d79bmr16327429vsk.3.1678444809945; Fri, 10
 Mar 2023 02:40:09 -0800 (PST)
MIME-Version: 1.0
Sender: amadououedraogo226@gmail.com
Received: by 2002:a59:ba50:0:b0:3aa:6914:664c with HTTP; Fri, 10 Mar 2023
 02:40:09 -0800 (PST)
From:   Mrs Aisha Al-Qaddafi <aishaalqaddafi3@gmail.com>
Date:   Fri, 10 Mar 2023 11:40:09 +0100
X-Google-Sender-Auth: 6nUGau_a8PhdR9KfS42_CvIbwyo
Message-ID: <CACqzUH_ahHG5e+y2Q2=Du1rKjP4hBVkGb3an-z58vKH_Q0PSTA@mail.gmail.com>
Subject: My Dearest One,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.5 required=5.0 tests=BAYES_99,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,HK_RANDOM_ENVFROM,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 0.9917]
        *  1.0 HK_RANDOM_ENVFROM Envelope sender username looks random
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e2e listed in]
        [list.dnswl.org]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [amadououedraogo226[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [amadououedraogo226[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  2.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

My Dearest One,


I came across your e-mail contact prior to a private search while in
need of a trusted person. My name is Mrs. Aisha Gaddafi, a single
Mother and a Widow with three Children. I am the only biological
Daughter of the late Libyan President ( Late Colonel Muammar Gaddafi
). I have a business Proposal for you worth $27.5Million dollars and I
need mutual respect, trust, honesty, transparency, adequate support
and assistance, Hope to hear from you for more details.

Warmest regards
Mrs Aisha. Gaddafi.
