Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9E53703808
	for <lists+linux-gpio@lfdr.de>; Mon, 15 May 2023 19:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244154AbjEOR0v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 May 2023 13:26:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244163AbjEOR00 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 May 2023 13:26:26 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E17211D9F
        for <linux-gpio@vger.kernel.org>; Mon, 15 May 2023 10:25:14 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id 3f1490d57ef6-ba6fffc5524so5954772276.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 May 2023 10:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684171511; x=1686763511;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uP9gY2ig7661BNo9d6NrRtc/h1Kpn5dWShHq/4pbz/4=;
        b=ZwKfCDLz37vVHoxXCOg2cAS7VkDlVwB1ntCciUh74xcIUfsPyOm6mX6Oi3uVOudpO7
         WNXE+tNXgG3NCFn0vDweN1Iv2n/aWiBGZmQJEXrqHopajr2y8oBxzWh90louAdZnVjKz
         He2Ml0ef623hEJC/Zd+8LZldi4FOBx1PlgU5VZOYuv8VzRDmuhCXe2seia9+bLK76T3H
         ys99q1TsPZLXr88TG8c11gdBGQ+hf61/yulm8ySbSpoyizP+igyBmw5NMX50eC9JeSSp
         yTA+83G6DDrPYZju9eNAz2FLflCqm8IE4B35dZUkGWUnOGrbf4s17L0IZyLbZ+gEvs4F
         7eAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684171511; x=1686763511;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uP9gY2ig7661BNo9d6NrRtc/h1Kpn5dWShHq/4pbz/4=;
        b=FBfzYfgXpy7zO13YHwYSARCY6o0ZRmQQAoua/HVxCBIrMfYt1dZj81Uumb3YchTTyk
         BEG3oJnH8ua6okGNtcq0vW65coa6pUz4igVUXnSoNzUDXwqbxn7RdQ7/jbycCSpneeIZ
         bM3c7cceHGPpXItZEPmd4gf5XDRTnh7KY7eB4twZWz6P1anCvrIDdx8D9x1GfCICHUsv
         AMbLVwvTdLW/y6uyhGPDtox4a2btnK8W0T9P7wZ3PiqDl6wxWU+Y/1Z9n91l3KFaYtiE
         JIjcptHWFNyXEHGbIhEKhJX9M9/OTqyPVvK8lzErD1nZiAu+Uta3OANz6CXxfHuLGSCR
         CTIQ==
X-Gm-Message-State: AC+VfDzFVzUgiT/tE8j1Etwjcx8NdSrnKWqgJbmSltySTIgVmXS4GEih
        9WaK7MHHDdmRJrgB9nxmidZ0/7RKticpEShGsjQ=
X-Google-Smtp-Source: ACHHUZ5/N0jxtBQwF+3uQ40iPw7VbQBNAO/DJjDQgFpNdhXDSCf1fOwxBcJxpb+cxICTqOTuc9tRfRCHpsWVnFjr0XA=
X-Received: by 2002:a25:fd6:0:b0:b9d:b22e:6082 with SMTP id
 205-20020a250fd6000000b00b9db22e6082mr30017325ybp.3.1684171511195; Mon, 15
 May 2023 10:25:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6902:1145:b0:b9d:83d8:6fd3 with HTTP; Mon, 15 May 2023
 10:25:10 -0700 (PDT)
Reply-To: mrsubhashmejia30@aol.com
From:   "Mr. Subhash Mejia." <bigboychimaobi88@gmail.com>
Date:   Mon, 15 May 2023 17:25:10 +0000
Message-ID: <CACGx+g18kM5p-dnysciLSz6SSqm75ZTOrjgtCnxt28FtO+2-RA@mail.gmail.com>
Subject: Hello Greetings,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b44 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4824]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [bigboychimaobi88[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mrsubhashmejia30[at]aol.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [bigboychimaobi88[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.7 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Greetings,

My name is Mr.Subhash Mejia,a Native of Sanso Community in
Morila-Sikasso region of Republic Of Mali, a French speaking West
African Country. I am a member of the said Community and the Head of
sales, marketing, advertising, communication and sourcing agent for
the Gold Bars.

My community  have kilos of Gold bars for immediate delivery to any
buyer refinery.

Specifications of our gold dore bars are 22,23 Carats and Purity of
96% Minimum. Origin is Republic of Mali.

Our best prices will be made available on the offer based on the options.
I will be hoping to hearing from you again.Then you can contact me with my email
addres;[mrsubhashmejia30@aol.com]


Thanks and Have a nice day

Mr. Subhash Mejia.
