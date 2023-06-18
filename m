Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA7647344D1
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jun 2023 05:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbjFRDkB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 17 Jun 2023 23:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjFRDkA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 17 Jun 2023 23:40:00 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38A3F1987
        for <linux-gpio@vger.kernel.org>; Sat, 17 Jun 2023 20:39:58 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-341daf315b3so11516575ab.0
        for <linux-gpio@vger.kernel.org>; Sat, 17 Jun 2023 20:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687059597; x=1689651597;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wWTmMQSsiLodfdKu7C8lcuyX7WesZia949PML8BXbEI=;
        b=MS58pmUqBMhwOojW/rEqbOtsSErOz3ww0rXm+W+03miki0UYxV72yot6eJJOkhhcix
         mjIkdWmIMeadYoLrHCQKwASWodweWj5hATdc1lkBKejgY/n8v6NURv+aRvRMPOZeBIJ8
         fImxZcpiL/VdU1Yea5IiCmk1ablobFUYLsVZaMb19Jyqw3h5HnreQfKPjJ4AdDHc6Qgh
         wVMXlk0CEZyAeFPrsZY5J/yE63RvPYCCYqe5mpZPzZtkCHm3jlMXiVbalJZyA6fG5K5l
         5/D1prl3NHMSWE+eVucTsulchcMuPnGLFhfn7qvOJ4L4npS6QAxV5a+PfwHZz/ZZI3Zs
         Li+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687059597; x=1689651597;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wWTmMQSsiLodfdKu7C8lcuyX7WesZia949PML8BXbEI=;
        b=P9rE5vN/qjOsOslolKkXKk6vxn7v6TEw2NQOBVD0vCzAMsTWyW63WxUr07mbQCCu7t
         2OnYxjIF9aIjjZtHdx9/7CKc3AEQqHQZ2m5phZfkNBF7kF0vokU7ufGi23CBjT9r5K9F
         hMDmKUcm0kIT5xbnEpDMupq3FPveqxAezTwQjF1pesevEXnoKJxcq76/J0M5TQkSpJdp
         scJQLlWeJT54LLfxEt5TprRNs+arkNckL33RN64ZMD2l1UUCS3KLGWOIlSv2+y1wzSCp
         T8TAHeUK7R2+EQsXprnFAQfEgwFnuqV5vQkQpgDwThC3o5gZiNaoG8+oPcvVxz1Hm+PR
         zgKg==
X-Gm-Message-State: AC+VfDx/tO3Gy3dlyojm7IrOtzgaOS3pzhSTxzXmbM7VIqkWD2/xaVBe
        0fDvHxDw7f18tQ+0pYpyb5Djuq7eBuwx4OKg2+E=
X-Google-Smtp-Source: ACHHUZ6jOcev/JRjqxHPWavgQ13qYoAVjVXRmkIC5sxX9/SxZ6VH0dWznntc9svs1D7wNvmgHCv5piGRu8+DlUlUOWM=
X-Received: by 2002:a92:d309:0:b0:33d:3b69:2d23 with SMTP id
 x9-20020a92d309000000b0033d3b692d23mr2013988ila.19.1687059597619; Sat, 17 Jun
 2023 20:39:57 -0700 (PDT)
MIME-Version: 1.0
Sender: ciissouf34@gmail.com
Received: by 2002:ac0:d884:0:b0:2dc:5e5d:14a6 with HTTP; Sat, 17 Jun 2023
 20:39:57 -0700 (PDT)
From:   "Mrs. Ruth Roberto" <robertoruth48@gmail.com>
Date:   Sat, 17 Jun 2023 19:39:57 -0800
X-Google-Sender-Auth: W5Dt6JfxFofwIjj_K9UB4hDpmFo
Message-ID: <CAFA2CT=KTsZwxS+bcrxAaCxvQPXY4Hj1GuXDz5NpfsVD=JxSdw@mail.gmail.com>
Subject: I trust in God
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,MONEY_FRAUD_3,NA_DOLLARS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dear,
It is true we do not know each other before but please bear with me,
I=E2=80=99m writing you this mail from a Hospital bed. My name is Mrs.
Ruth Roberto. I am a widow and very sick now. I am suffering from
Endometrial Cancer which my doctor has confirmed that I will not
survive it because of some damages. Now because of the condition of my
health I have decided to donate out my late husband hard earn money
the sum of ($3, 500,000.00) Three Million, Five Hundred Thousand Us
Dollars on Charity Purpose through your help.if you are interested get
back for more details.
Mrs. Ruth Roberto
