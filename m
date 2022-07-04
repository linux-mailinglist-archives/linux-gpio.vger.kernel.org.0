Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0012D56572D
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 15:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233872AbiGDNbF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 09:31:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233859AbiGDNat (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 09:30:49 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A291FD6
        for <linux-gpio@vger.kernel.org>; Mon,  4 Jul 2022 06:24:44 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id y18so220634ljj.6
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jul 2022 06:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=RNT9aO9JuvdHPRG7M+oG+iA92P02fztEckYlKzdbtWk=;
        b=mZ5i+hsuL8fdkpWGrhFFiNutnU2jOl0UmVPXtZ316je0d4PjS8jpMDpfZAbSIN+jew
         2EqogvZbpseX3msTfcBxwKaPrOjvpn0+Xf0Q4UhWMy75YuzHPVfttpYrAMcfewOxc/Z5
         MPVEyzmFOBqY7X48hLWOaKHpakETSRTypNUAwxQGOEt2Xeqo6ODssG3ojwj7nUQgi079
         78QgkQGDSOpqCfIWHQMeeOnWcfS/ghN3FyGnAVE6jyVzLdscqPB3xDoEZiXuRvc62TXF
         +NUI+ZvGKh0bsqvGZCJTanRIt7e+95vyYzDygokoZjbmLZRPhcRGQ/8FyFdXvke0+NXD
         g6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=RNT9aO9JuvdHPRG7M+oG+iA92P02fztEckYlKzdbtWk=;
        b=AaH4r33te+2yNCd6vnj+qYdLRtNMHCAP/1KxkP00+k6kaI1pgq9u+nTmY/6O1iJhua
         1uqWyrkZ9ScfUJS8KXyzvqrg1hwJKZs6oreeU+ik5AVxdwBdj44F5X6Yx0nE+67M14bR
         YyOoE/EI1b9WvNbB9oCDnW+KeNCqD2QKJK/ZXIFkzTyu7FoXk6waEFUxHigwlTnUJ0MH
         CXm5o51CLSs2KREX/idX228Tjzz1nhMZQgpsTZJegxhGbIo9fOstPIuXBQfwCw64h5fe
         SMWm5sou9F1gg7qdOHxKqyK9CsWpTvRbS/zbekgry/Db+L4VZKa7fUPTE/iu++vZaCW1
         crlA==
X-Gm-Message-State: AJIora+UdtccAH4siMdU4uQ/VI4TpKtFarFXDRM/lX++HBwjHMawJYOU
        YUCb0ByjAZm1QdE12LMGFboJSrxpfFBKAxKWom/sLDb4oPs=
X-Google-Smtp-Source: AGRyM1u9pMqpI7Uten85WU6kNbx9jlAlcks9tY+yNzZSgrOVIslz03Fea6vCNdTydUTc7ylYUrBZ0Tx3k26sFq7OD7w=
X-Received: by 2002:a2e:87d1:0:b0:25c:42b:28c0 with SMTP id
 v17-20020a2e87d1000000b0025c042b28c0mr10310076ljj.191.1656941080377; Mon, 04
 Jul 2022 06:24:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6512:2829:0:0:0:0 with HTTP; Mon, 4 Jul 2022 06:24:39
 -0700 (PDT)
Reply-To: nadagelassou@gmail.com
From:   Ms Nadage Lassou <maxigbikpi5@gmail.com>
Date:   Mon, 4 Jul 2022 07:24:39 -0600
Message-ID: <CA+2vrypbVJOVZOd9LAHR+F9J8qpbeMYsRF9GC9sa3j81OOJ7VQ@mail.gmail.com>
Subject: REPLY FOR DETAILS.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,SUBJ_ALL_CAPS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:22d listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4999]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [maxigbikpi5[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [maxigbikpi5[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Greetings.

I have a something important to tell you for your benefit,Reply back
to my email to have the details,
Thanks for your time and  Attention,

Ms Nadage Lassou
