Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD75672A69D
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jun 2023 01:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231938AbjFIXMh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 19:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbjFIXMg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 19:12:36 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A75732D52
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 16:12:35 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b1a66e71f9so25446401fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2023 16:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686352354; x=1688944354;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQjQSjkrQHB8YEvYb7HNEzeDeLUIuyVyvTL/DW+V3ac=;
        b=lVSXJqDy66m5M7/4+FmDKj+zA5uEGy7KBLgXZEcPh4ldtiVJVAfyHEe0C2CavHG58Y
         oB918G1Mp453YPNy/4k1V5tEa5LOh9W/Ge0XAMfSqMp84TQBDMf0ZM+7S1cjKoIeGhI0
         wT0XPs91RQavoTzuoQZIL32T8wqcIawffj4DY5z5VObIKzuFJeaqkeZbzcTOm0cEkhED
         ErJsX/aBDTqTqxpVqgTcbuvwo5ZhwjwDNJVQ7I9S0gUqNnGuB/F77TWUg+pIos9McNDX
         x74oPk4FWASsUo1a1tCxp+QSl3K1bqNYf5XRn/h8VT2l4onELdyLMdK+u+NUjmuzA+0n
         rjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686352354; x=1688944354;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eQjQSjkrQHB8YEvYb7HNEzeDeLUIuyVyvTL/DW+V3ac=;
        b=GBD7HAIbr/Vp0p7si7Oa36JAAp+3AMpi4HJC9FCpcVfERfB8mWfN9bjbTdKm4+1hZ7
         qU+GM9VAdlrWavt8CKtKLBYum2++3jJWLlzqdDnUr9LK1vfNLcWTrBwgHGh9sgm/Zi5Q
         utDiAafz4Qvoro4nDUFlPH6IGaYBfzVc1hYrbV/LFisb6B9M3WqH9CL0H+WC/2en6mJM
         Xa2phs74qo8otgRrVraamaOaFe2572cFq3cUkXvNkcgvm5HXU+ec0a8VriCnFTHiOAFr
         198Mbfx0d6fPtkZ2qy5kIIA/YtuvPNreKHl3ZukUo75/PGTQoFDxJkVKs3ai4WHbBt8k
         Tc2w==
X-Gm-Message-State: AC+VfDzc07hwgLhj9S5ihuEcw9/nSDgkk4jkRck1HD6HWmAFBA2RTe2S
        bqQobwr0rBXfiqsnDkCuoHA3Jlx3fkR/0U/MuZE=
X-Google-Smtp-Source: ACHHUZ6Zf6loPawGgygTCMFmmJH0+BHv/EFiSTUjYrLk01PCUQHKn4vNdQFs9U8k4QrpqcsKZ+4T2y/xJwu/V36LeWE=
X-Received: by 2002:a19:2d01:0:b0:4ec:844e:7b85 with SMTP id
 k1-20020a192d01000000b004ec844e7b85mr1597422lfj.25.1686352353651; Fri, 09 Jun
 2023 16:12:33 -0700 (PDT)
MIME-Version: 1.0
Sender: pavlovivanov2@gmail.com
Received: by 2002:ab3:7545:0:b0:233:65ad:9827 with HTTP; Fri, 9 Jun 2023
 16:12:33 -0700 (PDT)
From:   United Nation <un.office.turkey@gmail.com>
Date:   Fri, 9 Jun 2023 16:12:33 -0700
X-Google-Sender-Auth: AQSP9qE0IyqG0SjEzk6-5nLbcnM
Message-ID: <CAJaMezeqRJ9Sc3jdB0yjXQ4nNvokdvYr=iqWsbouqq_S_4eANA@mail.gmail.com>
Subject: Congratulations
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DEAR_FRIEND,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dear friend congratulations there is a good news for you
 my name is Mr. Kenny Frank. from United Nations
 kindly get back to us as soon as possible
official Email:(un.office.turkey@gmail.com)
