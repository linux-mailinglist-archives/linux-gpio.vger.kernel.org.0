Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED056390C1
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Nov 2022 21:36:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbiKYUgc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Nov 2022 15:36:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbiKYUgb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Nov 2022 15:36:31 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA2FE5216A
        for <linux-gpio@vger.kernel.org>; Fri, 25 Nov 2022 12:36:30 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id db10-20020a0568306b0a00b0066d43e80118so3335274otb.1
        for <linux-gpio@vger.kernel.org>; Fri, 25 Nov 2022 12:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TIhxpAqsxiwWwE4zx+/0K3DHs1igYNY8HnTilbOLRvQ=;
        b=g0OJBX/L46Fe16Lu8zEyu6xd6xSVHHfq97nQNKYrqummezPA2qp8gg/t8N8ArDaTO7
         Hwd4m3Vxq6TQMU2UwAnGx2P5nnedyCs6mjYmUbkRRLERZyLWiOU4mg8fbqxjPRan98tp
         NBo1+ZD3gOZ3OQ10sA5JlhQ37oKvPtuf9CbFCLp6711KxhITVWtlRgooXlIedFsSFDbm
         1IKn2t0f71/AQLNcDxX/bRK7+Ap6BrgRJcsDDpC8S9Owzy0TNB6IuCNxp8fWOoscfxst
         /VomOB9HJo5ReVT2k+enfrXlsFjif3BLzC0XRYRsX1/3tQEjAHr1qR1T/RVRz97MosDD
         YNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIhxpAqsxiwWwE4zx+/0K3DHs1igYNY8HnTilbOLRvQ=;
        b=GQjXCDKL6fIAFYt+VC3bb4y/e6fQTu5+0Eb5hLmL57Ml5sxVQGcoYJwpkh2UmmfspN
         Fs/fQK2Hz8OzwJXYP/hCTlooGqTh3Y9l6vh3U1YMhShF8OLLRC8NPhMejE+RrGK6J2bI
         6tYMi5rN7akv4jzdv840GL+pQ2d3fRdrJT6srUk7M7Gj2Xi+duqlzxht0b52iSudH+4e
         bRafJHdMevUWfvd4jVllcM8/gU6vgKEqyhaCBPN0grk6GbhqLkwHx9I0QMM3U0R8WqO8
         0HyTPiCjsnrjMpJqLC6OZ6DAPrk3VD0JgrPIKYilxzsz6igHX0qj1kkYl1ph2U1ja+Q+
         JtwA==
X-Gm-Message-State: ANoB5pk5f1TQLlAzxunkkhtg5luuXQhQ1K5f9cajYF+pSd0O4GW68vl+
        LkypwqUYDdJpwBKqs15QrYG/is1ZPpgzT31cltc=
X-Google-Smtp-Source: AA0mqf7ChN5JGkIbDRjjvhf/QWBnxvtlwy5i8FG4PXziqxNpBN3InPngiVtC0CDPairmZ/7G3eX1kLqe+tA1UehCZqw=
X-Received: by 2002:a05:6830:13c9:b0:66c:a3a8:3870 with SMTP id
 e9-20020a05683013c900b0066ca3a83870mr10819424otq.54.1669408590110; Fri, 25
 Nov 2022 12:36:30 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6840:6697:b0:faf:e552:8c5b with HTTP; Fri, 25 Nov 2022
 12:36:29 -0800 (PST)
Reply-To: privatemails254@gmail.com
From:   MS NADAGE LASSOU <hunhdd123@gmail.com>
Date:   Fri, 25 Nov 2022 21:36:29 +0100
Message-ID: <CA+9ouuqv2H=MoGCOvhsf_R2wTjr1sgutqb+QjhbyHF8SEMwLWg@mail.gmail.com>
Subject: REPLY IMMEDIATELLY
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,UNDISC_FREEM
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:342 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4999]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [privatemails254[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [hunhdd123[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [hunhdd123[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Greetings.

I am Ms Nadage Lassou, I have a important =C2=A0business =C2=A0to discuss w=
ith you,
Thanks for your time and =C2=A0Attention.i will send you the details once i
hear from you.

Regards.
Ms Nadage Lassou
