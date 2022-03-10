Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1AA74D417A
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Mar 2022 08:01:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239981AbiCJHCW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Mar 2022 02:02:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239982AbiCJHCV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Mar 2022 02:02:21 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D89B13018F
        for <linux-gpio@vger.kernel.org>; Wed,  9 Mar 2022 23:01:21 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id u10so9072931ybd.9
        for <linux-gpio@vger.kernel.org>; Wed, 09 Mar 2022 23:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=A7SqxPeuATRIawRLPRXdbXUmc+x9RhbBGbJAJobYDWo=;
        b=cZWwtL/Z3fiRqM+K1AnJ6fiYZFZBBXKbMAle/ghJEf8DG8C6PVO7ahaxkOXJpjiRDz
         v4j1Jehf4h3sim4tiL1jaIWFYrgNegbU+o874FLjXqJ8EHs3Q78WmlXhR92Labq+7bVC
         kBs1aji0zbtmJuXLC3oOJsL4jYZ2bczFWrQ8jviSKPNUnpKWtyv+UEa7JBwxLH1SEMRz
         Dl+zMkOCAfn2yoZw+L071baUAzQ3S6PwELlvsdR40GYYKbgXhypES9YB3lCS+U3vhxPG
         PHp8cLTC6co28z1DhPQ3Azw2gRqYD4mLtJSik8EABXHYGo7qGpojPavrH/XfiZgLCi5m
         JlYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=A7SqxPeuATRIawRLPRXdbXUmc+x9RhbBGbJAJobYDWo=;
        b=UC5lg+gdO4rbPR5QCX3TJcsYeWxQG//aQja3jRTloS0c/UwJPwPyG3sBUXXaCX4PLj
         nE6vJvJkZNlyL6kmxWFvjddKj2/9Vo+rNoM6iA2o385HcBdDvL61sq21nTb2V98IK+id
         aInPGpRj+T/ldznDBb9eYRTYm578z24CSTkuCf3xWU2M160fevl91BJEX0gRUfGaw8PV
         rqVpA6NTVzdPJvhTkE33VzPWT52rp2M0SHcCGXgAS+iw8XanyqV6VLYn89K3IqywpaVk
         exkTByMvD7y6BoqNqYBqbnL2sSnda+/v0oc2d4CJNDMnWzdiLOLFY/acy1mJl9ie1Dt4
         EX/w==
X-Gm-Message-State: AOAM533YANsqEBrLU6pLMOkw6kYUc92905pcQkVKFBFk2zcsj149Sl5B
        6b2TqqHW4BIS0ohuVXvrTaux+I2GP81Is9Bml/0=
X-Google-Smtp-Source: ABdhPJyOXKl7olUvQSMl3FVOG4UHYD67GsUnSFeonyMiKjNSayTjO8NTIXBVCfSUWDW3B50i0ndQbZSBB5ekb5RNqG8=
X-Received: by 2002:a25:6910:0:b0:628:ddbb:4b98 with SMTP id
 e16-20020a256910000000b00628ddbb4b98mr2903591ybc.12.1646895680285; Wed, 09
 Mar 2022 23:01:20 -0800 (PST)
MIME-Version: 1.0
Sender: ibrahimabdul2006@gmail.com
Received: by 2002:a05:7010:a625:b0:211:5028:ea29 with HTTP; Wed, 9 Mar 2022
 23:01:19 -0800 (PST)
From:   Miss Qing Yu <qing9560yu@gmail.com>
Date:   Thu, 10 Mar 2022 07:01:19 +0000
X-Google-Sender-Auth: WD5NgRObVeJMXBrayIG9tFM2jWA
Message-ID: <CAN-tx0yjxrHt3CTK9qR4EwxsH-QfFEwwAohpZhA3iBpK6QLMeA@mail.gmail.com>
Subject: Hello!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,HK_NAME_FM_MR_MRS,HK_SCAM,LOTS_OF_MONEY,MILLION_USD,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I am Mrs Yu. Ging Yunnan, and i have Covid-19 and the doctor said I
will not survive it with the critical condition am in because all
vaccines has been given to me but to no avian, am a China woman but I
base here in France because am married here and I have no child for my
late husband and now am a widow.

My reason of communicating you is that i have $9.2million USD which
was deposited in BNP Paribas Bank here in France by my late husband
which am the next of kin to and I want you to stand as the replacement
beneficiary beneficiary and use the fund to build an orphanage home
there in your country.

Can you handle the project?

Mrs Yu. Ging Yunnan.
