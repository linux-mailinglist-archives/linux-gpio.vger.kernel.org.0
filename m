Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E0FB570866
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jul 2022 18:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbiGKQbO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jul 2022 12:31:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230270AbiGKQbO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2022 12:31:14 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84444248C8
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 09:31:13 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-10c0119dd16so7314996fac.6
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 09:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=5cJHSClaSNSC6CADWeDtciJpzEgHDP3Cx3FDxh15jpg=;
        b=gMap4293NnkyzeEJdw1xtVfjTgyg4UP9P5fhkFF/009vW7e8LXn+x6g62Awgw4a7Wc
         o8KiNhfq9HmnYTEmmb50DBbOJu/VdW4WaAaE9PH/Ust6ZIbQ8WWihdd0HPYh6Ejx4KXi
         xy9J81POiX0/u4VbyA6YUXKTe3qIDpONLcJMawW8LBXqsLXbr6koBqDZMooAtHqXop3K
         BfZPobimbZjQFjQJFRONDO6kqzxGhOfzRE59za3CS1kPsbMBWI9e26VB+sdVtpuVk/fL
         nYyNjyYKjPNzrknzFTVDzmEUWU6HRf6MPpZ0W7Yh8JylqX4bUvoSEZjL/AW/+r1tLDHS
         RI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=5cJHSClaSNSC6CADWeDtciJpzEgHDP3Cx3FDxh15jpg=;
        b=vlqzS+qVTgdK3KxPqYIEEc/q43OYq7nZT3R07R2P5LRFtn/r998aqw0XbKmmzhzwnp
         Ht6jwAlAHh7fAHgvuKJCBBTc0Ym3du5wIKJyBAFKvD2EZLKjMr2c6WOFf7OGUpgG1Acp
         9mYWSGrqrb/tMkvzXndaLeXu1tYjsEYMgigYyjTb1FTFbhsY83idOwI1B341l5q7TYDg
         BZGaz5KjW6IokyUbpFofIkFicYuIU9HLobBjRJzSSXPw7J2uJu4xzzW8NJGmHAr4upPZ
         sUhFW+Yb9+GLpaC8ZsbWD09AoeCJZ8ei3+x1syUT7yg7Eo+e1w/ecKRxWwlXH06eI47i
         mtPw==
X-Gm-Message-State: AJIora/9Y0c57nPyLRCrT8sw4+HuQpqmMqDiTKUv5ucRnUgvg/0qTtTL
        loecKH1t9z5ey0QihoAjpfqlc/vKRkv0OWbEDM3J/wjclhs=
X-Google-Smtp-Source: AGRyM1u1TdsZO7ATYtI7endtqz85HYUOC5RJhgYLkNPCH33tNd4pYIJsS6RV5/gXv0dZBcks2LahnJtfn5vLmxwbZ1o=
X-Received: by 2002:a05:6870:6019:b0:10c:a59f:e1ca with SMTP id
 t25-20020a056870601900b0010ca59fe1camr2816638oaa.200.1657556576909; Mon, 11
 Jul 2022 09:22:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6840:f00b:b0:c18:b11d:467e with HTTP; Mon, 11 Jul 2022
 09:22:56 -0700 (PDT)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <davidkekeli001@gmail.com>
Date:   Mon, 11 Jul 2022 16:22:56 +0000
Message-ID: <CAD7994fm0WgmRRdMMv4QS4U1k14D+b7HZvoe+OWE=4WWJ0fsJQ@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2001:4860:4864:20:0:0:0:30 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4613]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [davidkekeli001[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [davidkekeli001[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mr.abraham022[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Best Regard,Mr.Abraham.
