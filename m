Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA5E4DE7B7
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Mar 2022 12:43:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232717AbiCSLpM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 19 Mar 2022 07:45:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231180AbiCSLpL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 19 Mar 2022 07:45:11 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EBC519ABC7
        for <linux-gpio@vger.kernel.org>; Sat, 19 Mar 2022 04:43:50 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id bx44so7760816ljb.13
        for <linux-gpio@vger.kernel.org>; Sat, 19 Mar 2022 04:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=6d5jMCrauedgyT6F3RzrXl4yXsf77OwIiAgFmSDNs60=;
        b=eXkeff/6OdBjThX8Fcz1P128sV6vm7YeydbjJB/Tn1SPquh8ef9UCPvp2tJF2CXxcC
         i/sJY0LADOqDJdgGMvp4UhTU3C+aQJN45/9b8/SZmkSJ33DYbScGpqdbBlG68J0o11zT
         wt57BRcLc5jEZaD4D8r2RI5ez2vZjAH/dSZwSoMKD3ItYsr+qGpLyKQrN42JRaIf2j2i
         7i2zk32MZUisnrOW+H+embP95kfHCHZ76qU/dmC+8QQMTCUpXzMvVYWZQD34GJLjHlv4
         A5MOBj7BUkLcZXQUAAvgsRhqDoe4nToH5Vu3O8cnv1J820/W4dRmaZ5ixL6hUNdoBiPE
         4wIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=6d5jMCrauedgyT6F3RzrXl4yXsf77OwIiAgFmSDNs60=;
        b=XsWhU4bNSXtp5JArNfwdBGmMCWDpRtpqWll/zUiVd/FMDHH2ADTS1vScHQ6VSjxavb
         qIZ6JHDLA0bSM1YSXn7Fy51CkrEVrWrBEIyexMuKLghYKC9JpE3+/iDqqy824TsZ2mG6
         Ylo6QjvELa9rxBL/ALSRWymhJtjnSxHP03xSlQaQce+jBp+BYtapo5cI/oNTEw/zTZTw
         ktNRK+n7DSxsFPM6bG0Cwpwfn0gQX5mYJS4D+3vQWtuNasirkFFs2Oj4yAE8TOomM8gT
         Sp/UWk6NxHOUaCizh9aQQlJ1GOtIxFVIL9i0X2wo1yHioJjP8MQCigYAWn8I5YJnJLy8
         hPaA==
X-Gm-Message-State: AOAM533xwC3eDYzDgh0yWUq+lyVJQApJ2DkMQj7i6uxAm+moftB/07cW
        yJGQeFqNr0EeVsaLsjH8SXaeIJlpVDrqHAQxMFs=
X-Google-Smtp-Source: ABdhPJzQZHHvM/G2AWoEtFOdzDr2vRoS/sTeANqVHKjUU5IoPOtHnqgGusKRUUYZQUyZCZgZSj88NSgSkLhPHtQC614=
X-Received: by 2002:a05:651c:11ca:b0:247:f32e:10ba with SMTP id
 z10-20020a05651c11ca00b00247f32e10bamr9277550ljo.208.1647690228458; Sat, 19
 Mar 2022 04:43:48 -0700 (PDT)
MIME-Version: 1.0
Sender: izedfrank333@gmail.com
Received: by 2002:a05:6512:108f:0:0:0:0 with HTTP; Sat, 19 Mar 2022 04:43:47
 -0700 (PDT)
From:   Aisha Al-Qaddafi <aisha.gdaff21@gmail.com>
Date:   Sat, 19 Mar 2022 04:43:47 -0700
X-Google-Sender-Auth: MPDokt2zr0PoH63rywdpg01Z6Gs
Message-ID: <CAFNE3FhXyv9PQd5UHVSRSC8zoYua+7ALDcVYB+dxAuEwppTzgw@mail.gmail.com>
Subject: Your Urgent Reply Will Be Appreciated
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,MILLION_HUNDRED,MILLION_USD,MONEY_FRAUD_5,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_MONEY,URG_BIZ autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:232 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5818]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [izedfrank333[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [izedfrank333[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        *  0.0 MILLION_USD BODY: Talks about millions of dollars
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.6 URG_BIZ Contains urgent matter
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  2.8 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  3.0 MONEY_FRAUD_5 Lots of money and many fraud phrases
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I came across your e-mail contact prior a private search while in need
of your assistance. I am Aisha Al-Qaddafi, the only biological
Daughter of Former President of Libya Col. Muammar Al-Qaddafi. Am a
single Mother and a Widow with three Children.
I have investment funds worth Twenty Seven Million Five Hundred
Thousand United State Dollar ($27.500.000.00 ) and i need a trusted
investment Manager/Partner because of my current refugee status,
however, I am interested in you for investment project assistance in
your country, may be from there, we can build business relationship in
the nearest future.
I am willing to negotiate investment/business profit sharing ratio
with you base on the future investment earning profits.
If you are willing to handle this project on my behalf kindly reply
urgent to enable me provide you more information about the investment
funds
