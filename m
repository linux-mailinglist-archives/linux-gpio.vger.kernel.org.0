Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB718598A3C
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Aug 2022 19:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344529AbiHRRT7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Aug 2022 13:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344490AbiHRRTm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Aug 2022 13:19:42 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 412C55F22D
        for <linux-gpio@vger.kernel.org>; Thu, 18 Aug 2022 10:17:43 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-3376851fe13so25551477b3.6
        for <linux-gpio@vger.kernel.org>; Thu, 18 Aug 2022 10:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=K9aCivmd3pOhXO+7wSe24RMSLcWBP61HE/hhO1yg1yw=;
        b=JeS443bFeIB/dfnqs/dBKkKoyz6kZ6ySV0J0cpJqv5YH9w1POyGM5TR1Nwj57FqAT4
         SvWgKiEmAF97qI5W/8pcR/UktlKsk/TDdEVgcTCFj39vzacBKZSATWFDL0wvclXleZDl
         YFZiu7+rdKL4yYKsALFe7rkcyDlno/hkCqQFNkK0mILc3mNIcC+1c7spPES7nUrVbzPV
         yk9MG1tvJV/boCEpDtjDQUosbCKPMXPA/zahdJfJ5bVDbNXvnifDFOSLzMss2LtJQk4S
         yuvrtpTeupv6XmXtstzyqVy6rB1gh2gfkSaR/+zzUwO5b/+DjnTYrO1e37rbG2LCBdo6
         noQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=K9aCivmd3pOhXO+7wSe24RMSLcWBP61HE/hhO1yg1yw=;
        b=YhjjjrRwdhg/tF8TsOR0ywwQTeZmd+bLSYBa/EUAzlaWwyXgKE+DMdvhHnvGqgogm2
         P7hp3DqCJ+gX2RX/ZXM8jqc0cHbl9TUBgRlSIt5CtC/UNqk8PqfjJK5yj1X6XYZHrVeh
         tsnGjxWpSCq0IrJqYx7wxnEnu+HxOTmDQNEqt0HGkMErrAG2CZ+XKQf+8OqI3dQdeYgY
         p7g/ve1sfFWAFF37ZEYDgoF/tehbv34JbAL8J3+IsqE+wkJrw9t58hIG3pO4vxmqwdQu
         zf9QSX9L0zVtEMoqeapLJ6JNB0j9syXX5MMKZt50ebHz8c9MO7S4jssrXHfBmXv/6Bjg
         cYiw==
X-Gm-Message-State: ACgBeo0xPkxW51opvtHcTfaJjJWu7xGS1/Xm1h9csTS2rjDStNX3GOSJ
        m/9z0ST165KQtZ3wWNwd8l7PJ3tYIvWYEzzwm5o=
X-Google-Smtp-Source: AA6agR7im46eo3l3aHfyQhKJUFeDwjOqcJ3oGYxNbtIhldfTCYmuKB6fqLIl9VVT7yq3yFLAF1ra1xGXrI77xAv/+5c=
X-Received: by 2002:a25:7608:0:b0:694:220b:8bf6 with SMTP id
 r8-20020a257608000000b00694220b8bf6mr2320378ybc.210.1660843061655; Thu, 18
 Aug 2022 10:17:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:3629:b0:2e8:c487:5b9d with HTTP; Thu, 18 Aug 2022
 10:17:41 -0700 (PDT)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <kojofofone9@gmail.com>
Date:   Thu, 18 Aug 2022 17:17:41 +0000
Message-ID: <CAB2h49MoyUVQ1C_ZzPkbHWi4O=XyMCqErsSm=6FhjoHqD_kEaw@mail.gmail.com>
Subject: Hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1130 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [kojofofone9[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [kojofofone9[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mr.abraham022[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Best Regard,Mr.Abraham,
