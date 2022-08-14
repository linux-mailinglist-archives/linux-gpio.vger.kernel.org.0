Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81672591FBE
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Aug 2022 14:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235695AbiHNMaL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 14 Aug 2022 08:30:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233367AbiHNMaK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 14 Aug 2022 08:30:10 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86CC21CFF8
        for <linux-gpio@vger.kernel.org>; Sun, 14 Aug 2022 05:30:08 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id 38so1990618uau.4
        for <linux-gpio@vger.kernel.org>; Sun, 14 Aug 2022 05:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=h0ZslgqQ94UM3iGDYCZGEx8ZwvbYHY5ZrQARiO/Kpbc=;
        b=fSRXR4YbG2axxAJZbn0K7cCdiNWLnoF7h1uis7VyTt/hE6MtShMFS+sq4BclgsyGPm
         nYlaKohRak9aHOsgM4dZH/l70djqxWRtrNFwARwggPRd3kvV66LRt6II2U9wh5YhdP4g
         4WYsHuhOnG9b/bdr6WvC2yTswzczOfbwCa/OyYB/ZTv74DqA2JFt/tfuATJ5wp9TfuMw
         VSFTYIEoC0n0e+8pc6pj4ewdrjcqgivmB9y3ForbjOSbKLzvnnCZQT3QeAU0hGICjqok
         rW5bs02LI87ApKYDV+Oqk1uZEpmO5BH5Gm+v5gMwAPhCj71nL3APmi+BzIXyr8UuGrwA
         1pVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=h0ZslgqQ94UM3iGDYCZGEx8ZwvbYHY5ZrQARiO/Kpbc=;
        b=8FiYN0ngrkhv0TolctrcstEND47fqiUqluPyWdxgH7avMNwmaVkR9AItDOwbV/xM6T
         9v9aft8uF5daRzxROmxEk9XgBSRB4MEYyH/kVnHYiaVsZIr1PhwYws4qGLFCthWc0/KG
         oN6P+y2el+FBWkm5Gm8ft1EjiG05PjM6X/B5GSHgrjmIS9Teh7ca4rnp1cdkatqx1jyw
         Zd1THBMSfnsiLXntU0Wqej9jrtGcHFr1GMLrRTHts4ar1UQBPO3hB0U+9uTO1swU1wDB
         SH7RHTqfHGUESj1TbgOBUf9Gt09GaeNcoAW8AnwDCEeegxGbJcsqZRNRjWtKp77RlAw4
         2LTA==
X-Gm-Message-State: ACgBeo2DABVsuoqxLBG14zP1AK2NnWjEYmv4CcZj/Skmi67ihnwix6oe
        5gXBFii82cAinQaZJH0DX8kbzwzvbkE8umpJG3Y=
X-Google-Smtp-Source: AA6agR6WifmR2QNyOk2Xet2zC2jgXp9R9hmNgNzAoqmx9PDYVh32g/0WjIV8RxL95eVGV0XsKl4ImBuuxDfFf1Cu+98=
X-Received: by 2002:ab0:2242:0:b0:38c:7f0d:623e with SMTP id
 z2-20020ab02242000000b0038c7f0d623emr4809600uan.59.1660480207346; Sun, 14 Aug
 2022 05:30:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:612c:708:b0:2de:ed04:8dc7 with HTTP; Sun, 14 Aug 2022
 05:30:06 -0700 (PDT)
Reply-To: lilywilliam989@gmail.com
From:   Lily William <moussapare92@gmail.com>
Date:   Sun, 14 Aug 2022 04:30:06 -0800
Message-ID: <CAA0Xjhrhu_vYS_qWErZ3E4ppLhJMYSOq-EQqiZw3rgXkyWhTzg@mail.gmail.com>
Subject: Hi,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:942 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [moussapare92[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [moussapare92[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [lilywilliam989[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
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

Hi Dear,

My name is Dr Lily William from the United States.I am a French and
American nationality (dual) living in the U.S and sometimes in France
for Work Purpose.

I hope you consider my friend request. I will share some of my pics
and more details about myself when I get your response.

Thanks

With love
Lily
