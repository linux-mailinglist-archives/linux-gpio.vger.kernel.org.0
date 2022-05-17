Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6200529999
	for <lists+linux-gpio@lfdr.de>; Tue, 17 May 2022 08:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237412AbiEQGb6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 May 2022 02:31:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231146AbiEQGb4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 May 2022 02:31:56 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8DA9C0B
        for <linux-gpio@vger.kernel.org>; Mon, 16 May 2022 23:31:55 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id i19so32658437eja.11
        for <linux-gpio@vger.kernel.org>; Mon, 16 May 2022 23:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=s/Vs2ZOYlY/JdkHXcuvqGHiQEb2zIrOSrE98Tywd5ew=;
        b=NUCmylfnr5nBSoboSmsYB4EiEGsezJLmtkrXLjs4eUHwJowXUoDy8y0UAEC1wA7Ic4
         RYTWdMC7mE9YKhs/IAivjv2LmkOQ6uwceCRHXL2qoLKbnxKWQ6FrCZs5b84wyRT21Sv3
         WUMGibC39eZ4J/1Udw/ZCqav/xDXbQUIRoaV6O5BHnUF5xUTmQRcTaJCKADFOLX977Vi
         +O7aE54PtyASpyxN7vrOnOJaFSxYF+4XX4k0ZiZTrEK4vspo/ZyiPCQlcVQQ0WMZrS2E
         7+c9R0MhFK9tKUKvpszUjgLo8IXo0gWcvl/IuZFtUkIbc5HhFgvb/dm44I2auzN2x22E
         qO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=s/Vs2ZOYlY/JdkHXcuvqGHiQEb2zIrOSrE98Tywd5ew=;
        b=8Fa4UjH3lskvkGfmnsz5dyoM+YYKYY2bbgDxpV5CzO4ZLdORUtmOObgq70J27zosdT
         PzuldWy87dSrLfBD6P1tT8m4W3XVFBx2SNiWC/vrX1ke4JhiX+yM9LkdOF6hE9OukvXP
         nHJuBBw2/Eyd8xStowFK7iMjR4mYRbqVA9aZQsgRGNa9nmqaYNrX52zlrzLIPI6urFMN
         zict27skWz7yJ8JNMlNiPz8ho6UrDU3LSZCkFWxrCBNMrX1ONMOFP+87MRhMvrVl+khz
         lLSjuEToD1f7NblRA6XC8j86tdkFSQTHpkhG5qXpdE8RXBLkOL/8t8uMLREHxOKYqZJB
         dNqQ==
X-Gm-Message-State: AOAM531ixURvS4TMebiOfs7tWuhXsfvXkRok8giQuG8efFW7RO8lbDxP
        TrsAspzfVr6f6XanwFLTEi64G/oXSc/qeS74YYE=
X-Google-Smtp-Source: ABdhPJx6k9qOA8aUFMoh7vmfwsjxbq4rL585yDLjj4SqD1UVfDPhd7ZCTgkevIS/0FHQqjsILCTRv9B39wDxvd4kl8o=
X-Received: by 2002:a17:907:97d5:b0:6f5:405:ef01 with SMTP id
 js21-20020a17090797d500b006f50405ef01mr18077481ejc.551.1652769114420; Mon, 16
 May 2022 23:31:54 -0700 (PDT)
MIME-Version: 1.0
Sender: barpeterkobby@gmail.com
Received: by 2002:a17:907:e92:0:0:0:0 with HTTP; Mon, 16 May 2022 23:31:53
 -0700 (PDT)
From:   "Mr. Jimmy Moore" <jimmymoore265@gmail.com>
Date:   Tue, 17 May 2022 07:31:53 +0100
X-Google-Sender-Auth: 4NPq6NT4HUgINpgTT4F-kQNitL8
Message-ID: <CADyxcKnhYp5jwAPO7qhci4E_9rT1jfO4Nw0O=-RDhdtYGceMaw@mail.gmail.com>
Subject: Dear Award Recipient Covid-19 Compensation Funds.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLY,
        HK_NAME_FM_MR_MRS,LOTS_OF_MONEY,LOTTO_DEPT,MILLION_USD,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:62b listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [barpeterkobby[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 MILLION_USD BODY: Talks about millions of dollars
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  1.5 HK_NAME_FM_MR_MRS No description available.
        *  1.0 FREEMAIL_REPLY From and body contain different freemails
        *  2.0 LOTTO_DEPT Claims Department
        *  1.3 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

UNITED NATIONS COVID-19 OVERDUE COMPENSATION UNIT.
REFERENCE PAYMENT CODE: 8525595
BAILOUT AMOUNT:$10.5 MILLION USD
ADDRESS: NEW YORK, NY 10017, UNITED STATES

Dear award recipient, Covid-19 Compensation Funds.

You are receiving this correspondence because we have finally reached
a consensus with the UN, IRS, and IMF that your total fund worth $10.5
Million Dollars of Covid-19 Compensation payment shall be delivered to
your nominated mode of receipt, and you are expected to pay the sum of
$12,000 for levies owed to authorities after receiving your funds.

You have a grace period of 2 weeks to pay the $12,000 levy after you
have received your Covid-19 Compensation total sum of $10.5 Million.
We shall proceed with the payment of your bailout grant only if you
agree to the terms and conditions stated.

Contact Dr. Mustafa Ali, for more information by email at:(
mustafaliali180@gmail.com ) Your consent in this regard would be
highly appreciated.

Best Regards,
Mr. Jimmy Moore.
Undersecretary-General United Nations
Office of Internal Oversight-UNIOS
