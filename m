Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E73C6522D5
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Dec 2022 15:38:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234107AbiLTOiV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Dec 2022 09:38:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233954AbiLTOiS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Dec 2022 09:38:18 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D60419293
        for <linux-gpio@vger.kernel.org>; Tue, 20 Dec 2022 06:38:17 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id gh17so29698033ejb.6
        for <linux-gpio@vger.kernel.org>; Tue, 20 Dec 2022 06:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T9f0Ku46RA66RnD1s7kuU6MfXVLxET4cBAuDiB4K0jo=;
        b=h/iejqaZ8fCjARIHEzeF0JYXDOwJb9HeuOd9ixvCP/gZXCSbe2xXEdT9blfLeD0rQP
         tEc8tk3UWjYZoJvRWqu4kbspckQXh+ViCBx6eULj0ZlNO+pwc2YsYgxcVf4cUwpdqU21
         sipTefG1aII1rTKS5YuCLUu4kUxzl4RBCrRZp2xj40yLb0KyaCPnx1snIn/t9nMCX8ZI
         sDBu11f7EiYst/xuUWjTfo6loHhy5jjFmIhW1+kad5ITpgcGM+iSikbFBOk4s3380Bjk
         l6ifuS7er3w6GSoux2V4U3lQFhOx1lpdYss2uxL+0EsPMr16a3SaqXEf9PxdjmRw9wzW
         AMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9f0Ku46RA66RnD1s7kuU6MfXVLxET4cBAuDiB4K0jo=;
        b=5novQ5zMmq3XchL64Wsueg3KjaQ1h7jNQv9YW9g2nL+eec0ycyETp5YR+8pz+dTPYS
         N67lRMJQZ3mxnfvQ5tgz94lgJRson99THG85PH7J8zoSjEhRevs9EYm7NRQ02+hQyHcG
         SJYnDX66PtXdMs4AGugjkZWJpRvpxzS90YPUjelClXqJUWelqjLri2Fwd8WZmxTgwI1U
         e8OXLgsXd+nPqxiqBWzkyWkYF068lI+iqNXBlvyROeGUVw08BFoVXmV0NxTm5Mtdcvx9
         ByTREkM2QPRcU9xF+DX4E3z9M5YP0FYLgj3jozylP/6nYV5oExgNTrjWViJ1TY58oy+f
         O50w==
X-Gm-Message-State: AFqh2kr1vLN7p/CqyutAFqrAtGEOVQUJISqmzuYu1X5A5x6kx3UnTfFQ
        vvja0J90FxuQV8KZDV6wLWzYDysBLgJBZN2m48Q=
X-Google-Smtp-Source: AMrXdXurkJra5fmZsTx+RyAWNZMPljDR/woAE+js5Z4nnpXeCRCzBLDBgHiT5lvr9ZfUOtZxgxd2G9hb8ffzWc67L9M=
X-Received: by 2002:a17:906:c0d9:b0:828:7581:f01b with SMTP id
 bn25-20020a170906c0d900b008287581f01bmr713267ejb.260.1671547096063; Tue, 20
 Dec 2022 06:38:16 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7208:10a8:b0:5d:5c7f:d8c5 with HTTP; Tue, 20 Dec 2022
 06:38:15 -0800 (PST)
Reply-To: ab8111977@gmail.com
From:   MS NADAGE LASSOU <info.kosianita@gmail.com>
Date:   Tue, 20 Dec 2022 15:38:15 +0100
Message-ID: <CAM0JKNf5g3CbQYhTtYjRUt-ExBnkcbYGdEGkpy+5=NhFX8gJPw@mail.gmail.com>
Subject: REPLY FOR DETAILS.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:62c listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4972]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [ab8111977[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [info.kosianita[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Greetings.

I am Ms Nadage Lassou,I have important discussIon with you for your benefit=
.
Thanks for your time and =C2=A0Attention.
Regards.
Ms Nadage Lassou
