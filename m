Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5B9374488F
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Jul 2023 12:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjGAKyb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Jul 2023 06:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjGAKy3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Jul 2023 06:54:29 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00B753ABD
        for <linux-gpio@vger.kernel.org>; Sat,  1 Jul 2023 03:54:28 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-3fbd33a57dcso174665e9.0
        for <linux-gpio@vger.kernel.org>; Sat, 01 Jul 2023 03:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688208867; x=1690800867;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yDrvwaQgdFmBVJZsBTXqxF7u2xhBw6LQghRHQtjodbM=;
        b=NV4HsLxHgdLtDLRaGJebcaEmyq7ykpbHP+xqBfbwsLQ0UVC+DkEeRGYt1aNv3DX4O7
         tDxoKBf8M0ZPPEcxmIaAnLEKiGU6nf9ftJB2gIRr2X9gt8y6MQ2e1AxWqG2COoglwaWh
         NsD/se5eL5vQE7cVsQoCb7Fs1bzr3fsnmMNc53J9eLgRM0yt5ib/tv0cp6du4xlCZV5+
         Ip6mp/KQL5Fm9nP/RfLHLaLuawVErfSqaOGRG4duLxx399+/mLodbl90e6OEWEDFAXdQ
         EQIAu8iNnS2Czklm2oCLYPHrJP1hK6hLtFnrspIDrqUiYgAyeYqKfoeyzw6FU3+SRk/M
         3vng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688208867; x=1690800867;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yDrvwaQgdFmBVJZsBTXqxF7u2xhBw6LQghRHQtjodbM=;
        b=OuHGm0sB7+qpFOHKfvnPws+x39aJl9EmxwEFeWtM9DAyRFP/nCPTvp3Ow3qXK1mzd4
         +KhWYkBJeAo5hkf7OnwbItAQLbKMFRpV2wQbnvOf3SmgaIpVToaxXbYOIDOCbBQyat16
         99/XhFpcSNNrrTe1ObZWpb9YpJFppMCQxdasTf+zLnwE1sUrvb5aP/e/u37c5fJdVgOT
         HOq0HirShJxrUc52SFd9nPeCmiZk3hjCRcc01D/M+tyMHn42C2vICzjnqgJ5vjvEUkH8
         dTw86EcT4SnR0oA0DQsLn1QhWK6CGI0he3gZn2IqCGan2z9jHzsBTuURsWc/IQRiqDkv
         CmYw==
X-Gm-Message-State: AC+VfDzv9268fjyA7FyCa2QSk5u4iy6P+zhyCgKPDUpAoAT1L14bLIVM
        dEZRS1LbfdCHJMDkng8QAYzBW7/ND4SRtwTgop0=
X-Google-Smtp-Source: ACHHUZ4Pdnd0qcuGvAI4dDnID+1fdF2WsrlKF0JfrGnDPXLgrBCtjikKZpPi8sT+6v6fZs77IL6laGN7mKa9pDUX0cA=
X-Received: by 2002:a7b:c8c5:0:b0:3fa:99d6:4798 with SMTP id
 f5-20020a7bc8c5000000b003fa99d64798mr4123212wml.37.1688208867298; Sat, 01 Jul
 2023 03:54:27 -0700 (PDT)
MIME-Version: 1.0
Sender: kristalinageorgieva4909@gmail.com
Received: by 2002:a05:6000:c5:b0:314:1d8d:da3c with HTTP; Sat, 1 Jul 2023
 03:54:26 -0700 (PDT)
From:   United Nation <turkey.un.info@gmail.com>
Date:   Sat, 1 Jul 2023 03:54:26 -0700
X-Google-Sender-Auth: Hk5lKn90de9WDVhBMHnQTs2xcJI
Message-ID: <CAEyhVLAO+ds6iMoftVfDiFgoi9KP9OTeV+A2OouJLmSqEJoiFA@mail.gmail.com>
Subject: United Nation Compensation
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.6 required=5.0 tests=BAYES_50,DEAR_FRIEND,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:341 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [kristalinageorgieva4909[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [kristalinageorgieva4909[at]gmail.com]
        *  2.6 DEAR_FRIEND BODY: Dear Friend? That's not very dear!
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_MONEY Undisclosed recipients + money/fraud signs
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
