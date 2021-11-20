Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6F59457C7A
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Nov 2021 09:04:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234391AbhKTIHs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Nov 2021 03:07:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbhKTIHs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Nov 2021 03:07:48 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90B62C06173E
        for <linux-gpio@vger.kernel.org>; Sat, 20 Nov 2021 00:04:45 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id 77-20020a1c0450000000b0033123de3425so12286164wme.0
        for <linux-gpio@vger.kernel.org>; Sat, 20 Nov 2021 00:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=vvC9ByVJGlgvAhABkby6MG4yPbU617Js94fp2P4ooak=;
        b=keMg5kuloDIUEtDs9NHEPmPPVeC5WSjhHYy9BI4j9cYGwu55P7VezS29ebXmQMyPPZ
         o6KRqGac6nP0iNJwcRc8Yqrueb54dL+X9Ooy51bWuc3WgzR/D+WMfbfwYrfoF6qzzSto
         vVpcZCoWWyM3T7fByWf+gIfCLDPRzsDYk4ginluTq3KPee+rb5i4bsglhEYSRI53cu8a
         5fbQWyOaLmkpZShvxyfXFeureHpRGKyw22mRBWE6s3HGCUY89+KzI3IzMQE8g5GRo5zN
         z4jzzvRhjt+IdFxz1EzO8aUkgBK4Et/pXVuhH3udVBRSFhjQig6NNI+5LJvueAsGxFdZ
         ZBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=vvC9ByVJGlgvAhABkby6MG4yPbU617Js94fp2P4ooak=;
        b=Q2+9i/tHuYhA7Qng+dRuFcMsWKgwXshWpxbCkSNT/+8GoT6uwrVwgNSRA+K9NbnYDb
         EZc0MoUoX4oqjhwE85VggIEtswKGQb03oy68Jtv+Wh8WqUBF/iixjAy2aTBHiv46B6pU
         wesk6qvlzYn/VJhEOpyI1SoGgDCPrmak8Lwn4REI/EPtT10dahLVoZd3V/JSttQyvdpT
         vTrkFNRA0OfjsGOTb23WArPekSKVWieYKsmrTTn/aL7azdrsPuvXq6UdsV4cAOYQW9Tb
         kf6w0qMQfZcTQlBZlspEnUqYqWYdd0V6cNWKlet3M7AHkmOnOZoJ47DHVasRC6tH89+u
         oPnw==
X-Gm-Message-State: AOAM530LUJmNqt9H6iVxWEkFWWMFQ/OQKgPA4q6ZPYf2hduOI/SV24Fx
        lzDlQofSyQor9WkDDSvEmrcp7ZPrANyf4eg1h70=
X-Google-Smtp-Source: ABdhPJzUd6hb7pVe2g2D1hKMLK2pDCWLY3ehIDXvE5wRzBpZPQaBtSfpobynTNnCiTc0eMOcXRfSrZ0iMdY55EYA5KA=
X-Received: by 2002:a7b:ce01:: with SMTP id m1mr8034657wmc.187.1637395483520;
 Sat, 20 Nov 2021 00:04:43 -0800 (PST)
MIME-Version: 1.0
Sender: mcinnesdonna05@gmail.com
Received: by 2002:a7b:cd17:0:0:0:0:0 with HTTP; Sat, 20 Nov 2021 00:04:43
 -0800 (PST)
From:   Jackie Fowler <jackiefowler597@gmail.com>
Date:   Sat, 20 Nov 2021 08:04:43 +0000
X-Google-Sender-Auth: _dWbDp5rc5-WrqpKxutNHT1HI9k
Message-ID: <CAK+X-7XNXQuoJ3WO=iLOPH0fJ3vEXhDKFZwVp+xzmGmdS11Hgg@mail.gmail.com>
Subject: Good Day My beloved,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Gooday my beloved,

 I sent this mail praying it will get to you in a good condition of
health, since I myself are in a very critical health condition in
which I sleep every night without knowing if I may be alive to see the
next day. I bring peace and love to you. It is by the grace of God, I
had no choice than to do what is lawful and right in the sight of God
for eternal life and in the sight of man, for witness of God=E2=80=99s merc=
y
and glory upon my life. I am Mrs.Jackie.Fowler.a widow and citizen of
Canada. I am suffering from a long time brain tumor, It has defiled
all forms of medical treatment, and right now I have about a few
months to leave, according to medical experts.

 The situation has gotten complicated recently with my inability to
hear proper, am communicating with you with the help of the chief
nurse herein the hospital, from all indication my conditions is really
deteriorating and it is quite obvious that, according to my doctors
they have advised me that I may not live too long, Because this
illness has gotten to a very bad stage. I plead that you will not
expose or betray this trust and confidence that I am about to repose
on you for the mutual benefit of the orphans and the less privilege. I
have some funds I inherited from my late husband, the sum of ($
12,500,000.00 Dollars).Having known my condition, I decided to donate
this fund to you believing that you will utilize it the way i am going
to instruct herein.

 I need you to assist me and reclaim this money and use it for Charity
works, for orphanages and gives justice and help to the poor, needy
and widows says The Lord." Jeremiah 22:15-16.=E2=80=9C and also build schoo=
ls
for less privilege that will be named after my late husband if
possible and to promote the word of God and the effort that the house
of God is maintained. I do not want a situation where this money will
be used in an ungodly manner. That's why I'm taking this decision. I'm
not afraid of death, so I know where I'm going.

 I accept this decision because I do not have any child who will
inherit this money after I die. Please I want your sincerely and
urgent answer to know if you will be able to execute this project for
the glory of God, and I will give you more information on how the fund
will be transferred to your bank account. May the grace, peace, love
and the truth in the Word of God be with you and all those that you
love and care for.
I'm waiting for your immediate reply.
May God Bless you,
Respectfully.
Mrs.Jackie.Fowler
