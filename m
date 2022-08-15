Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07CBD592D79
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Aug 2022 12:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232856AbiHOIHm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Aug 2022 04:07:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232793AbiHOIHm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Aug 2022 04:07:42 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D1431E3E9
        for <linux-gpio@vger.kernel.org>; Mon, 15 Aug 2022 01:07:41 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id n125so245863vsc.5
        for <linux-gpio@vger.kernel.org>; Mon, 15 Aug 2022 01:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=0j2fNWlhqHDdR8vDkqVbAvzs/vaD31QYk8D65F418vw=;
        b=IH+bjnKLoIGwxrzbWto9f8hMWC2ogzh12LDwldBu4Zp/a4b3uwVAzjthn596wXA/Uv
         h9kL9pr24vKRPoGoEnQ9YWqZ+fccbrtH06UK084c9O+ISOZAxKP618fJnkYJmO9MY4EA
         2HVVVBArpKyo2zz3hpYNLQrbu5JYvsFS+bNj6UapYQqkwqAPK2PgeSqWDgasZ1TI40qR
         Tzta/54t5Bjjl2qAvm9jjJjmS0MEArUjT7xK8hPRHQtuKDp7UYfeRdzM9DqGCrC6IcGe
         pVBNLsLrku4gN6JE6bfMxHsY/NG6MdeCgAO+Tw7ZD8aBkpowdN3ce0nOai9iDksp19lC
         G70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=0j2fNWlhqHDdR8vDkqVbAvzs/vaD31QYk8D65F418vw=;
        b=QiiMiR1d/2cgVTG2xCTae2tYo2YbFXaNDFLbSMNxqUhCCz9vOXHyrcgdgsTrkFSLKQ
         z13H4lbUjdcAFMoWKk/Zg235Aung+8yHIiZRpYk4GhErn3NMbNjxhn83CKSl4uNS3GPo
         jHnZXKsqn0uZsTnLyO+L6cKU5QtpzHMS55aM/iC2T89JuoBWZiyOoiJdhe/22Vn0bupt
         /wkHvYwVI4/9hyq0Ys6R31PBcdNK37L1wm+TJsSlRZUazWHqkdb+G1eCaI/69fZ7IQRt
         RcprcooW7vR1pEhDrAbuA2H8CGV8iJwv5VqqqCqfTNv76h8rzXQcSrupOsEwpeWe4Ygm
         GOPw==
X-Gm-Message-State: ACgBeo0DZQWyL/ndqI1PaVXU/ZeZiqr1gw98VIxzwb9XolyIGFYMjLZm
        LBhiLAdZ1kWbPdYUDjOHax0VbDvF2eqcKpb26Ng=
X-Google-Smtp-Source: AA6agR7uhYPKSpurcf9CPZPx3Jdzobb9lV5A8QBl4IeDgD75oZ04VR0Igm75Tb53g0rO3i+Oe8tVGfK9AWE+sINiYRA=
X-Received: by 2002:a67:e9c2:0:b0:385:8f3:23c1 with SMTP id
 q2-20020a67e9c2000000b0038508f323c1mr5890535vso.63.1660550860100; Mon, 15 Aug
 2022 01:07:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:5c51:0:b0:2da:55bb:dbeb with HTTP; Mon, 15 Aug 2022
 01:07:39 -0700 (PDT)
Reply-To: ausmann@inbox.lt
From:   Abu Usman <shehuahmedutono05@gmail.com>
Date:   Mon, 15 Aug 2022 09:07:39 +0100
Message-ID: <CALChzRb6bp3nBSiMEFEuCbei2C=7iv0HRCH1-cJ49cGHDmJnuw@mail.gmail.com>
Subject: Hello Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.4 required=5.0 tests=ADVANCE_FEE_4_NEW,BAYES_50,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE,
        UNDISC_MONEY,URG_BIZ autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e44 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [shehuahmedutono05[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [shehuahmedutono05[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.6 URG_BIZ Contains urgent matter
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
        *      information
        *  2.2 ADVANCE_FEE_4_NEW Appears to be advance fee fraud (Nigerian
        *      419)
        *  1.8 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Greeting,

I am indeed glad to be in contact with you even though this medium of
communication (internet) has been grossly abused by criminal minded
people making it difficult for people with genuine intention to
correspond and exchange views without skepticism.

This is a private effort to introduce a partnership intention and
proposal to you, I decided to write to you. I have decided that I seek
your assistance in a matter that requires your urgent attention

I'm Abu Usman from Afghanistan, and I am contacting you due to the
ongoing takeover by the Taliban in my country.

I need your urgent response to help me receive some funds for me.If
this is something you can do, I will appreciate your early response,
so that I can provide more and appropriate details of the entire
proposal, given the fact that this is only a skeletal introduction.

I will appreciate if you could let me have the following information

1. Your Name
2. Address
3. Your cell Phone Number.
4. Occupation

Your positive response will be highly appreciated. As soon as I
receive your response I will get back to you Asap.

Sincerely,

Abu Usman
