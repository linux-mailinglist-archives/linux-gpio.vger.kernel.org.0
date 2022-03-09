Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D0024D2D7F
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Mar 2022 11:55:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231665AbiCIKz2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Mar 2022 05:55:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231778AbiCIKz0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Mar 2022 05:55:26 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 953AA16DAEE
        for <linux-gpio@vger.kernel.org>; Wed,  9 Mar 2022 02:54:27 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id 195so2321347iou.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Mar 2022 02:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to;
        bh=KVhbYFHGqvjj7PkfcwFkYVqX+xBelABPf+oZxs3rLEk=;
        b=meworydtJjubfNvlUFr/b0gPcaWgvXJlR23+KgnIc8V7k9XQD9HhMhE8CMw2vYmo1v
         d8Y197tNDDJbOyP/NAIQS4YW7EVeFkfNxZMtLiL9d7cORDNziNdTUzx5cPPGf3tCa4xX
         LySsciqVBukgBhA0R9vV92ulQleu8G0cXQFa9zm18pu/m7O59adS9ok0P74HY78XQPxp
         5tStheIx0NZM08ta4KLAoIQ8PBRsCKbfMGMD1jpLdpXQTrYKQceNdnlZI+HUuSOiME7w
         az9kSjqPI+7VtC4d9xqgfDWxtGSlsfoPteLGzW3k3udDRm+kO9xDOKSZzy5ES98AFp2b
         9yAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to;
        bh=KVhbYFHGqvjj7PkfcwFkYVqX+xBelABPf+oZxs3rLEk=;
        b=SUEkTlB8z5NDUmx7wBAc+WXs+fFqHtqwq50HoQwzxGG8AmQb2lkCJW0kjY1Ud2js1G
         Fi0bCqj1PP495m6gv14JXtPY5DcGpKYy409NSDQsoAQ+/l/AzwOgSFLIo6PoGjMF1qlR
         ka2EV8vXo5JJV6y2Le+j4QFCzT4NjBgsIEt9Vjqn/pLwkZQKm78OghyrdFQx/oXkBVZt
         Mo1aZtAvRNarDIMBByd2HmQQMoCOQ0NOmlVZ4fYOAuv0Sbj0m4QeEdhKj14gLb95sMUL
         EbasTUxuUGT5BkwVCMfL3svp8lXIrWKe1fmLcINgzIYrvDcdgsUbXjWDW7+HJIEtG7Lh
         TASw==
X-Gm-Message-State: AOAM531Dq8ob0sxgyVbNoJs9ynUThmHGPiFneNAb86dNo5XuSo2wAeK/
        ty3s2O9J0stttevx7pQE7D0+zhz9wniDKi/hcZg=
X-Google-Smtp-Source: ABdhPJzdtJRbYQFiJbt053SX/8bn7QHr8S1ppLIHyRDeYb7cYZaekQn4I2oZN6X1XuzxaZNLCOqAAMa+tq1mCukSH4A=
X-Received: by 2002:a05:6638:3014:b0:317:9daf:c42c with SMTP id
 r20-20020a056638301400b003179dafc42cmr18636420jak.10.1646823266784; Wed, 09
 Mar 2022 02:54:26 -0800 (PST)
MIME-Version: 1.0
Reply-To: issayacouba2021@gmail.com
Sender: awa.bello66@gmail.com
Received: by 2002:a92:c701:0:0:0:0:0 with HTTP; Wed, 9 Mar 2022 02:54:26 -0800 (PST)
From:   issa <issayacouba2021@gmail.com>
Date:   Wed, 9 Mar 2022 11:54:26 +0100
X-Google-Sender-Auth: IXhLiK9_Gow6ujJb3ZsT48bI0L4
Message-ID: <CAD9-ZkUUEMfm4yHTVimTi-dGhErsjoR_MT_YDmC2sJVwaYGCHg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,HK_SCAM,LOTS_OF_MONEY,
        MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dear Old Friend
I'm happy to inform you about my success in getting those funds
transferred under the co operation of a new partner from Paraguay.
Presently I'm in Paraguay for investment projects with my own share of
the total sum. Meanwhile, I didn't forget your past efforts and
attempts to assist me in transferring those funds despite that you
failed to assist me financially.

Now contacts my secretary his name is Mr. Issa Yacouba; and ask him to
send you the total sum of $2, 000,000.00 U.S.D. which I kept for your
compensation for all the past efforts and attempts to assist me in
this matter.

With best regard
MR.RONNY ARMAND
