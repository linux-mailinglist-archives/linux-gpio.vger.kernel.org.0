Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1914B52A9
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Feb 2022 15:03:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354855AbiBNODO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Feb 2022 09:03:14 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354852AbiBNODL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Feb 2022 09:03:11 -0500
X-Greylist: delayed 87 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 14 Feb 2022 06:03:03 PST
Received: from mx-relay86-hz1.antispameurope.com (mx-relay86-hz1.antispameurope.com [94.100.133.253])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CF63B66
        for <linux-gpio@vger.kernel.org>; Mon, 14 Feb 2022 06:03:02 -0800 (PST)
Received: from smtp.eckelmann.de ([217.19.183.80]) by mx-relay86-hz1.antispameurope.com;
 Mon, 14 Feb 2022 15:01:33 +0100
Received: from EX-SRV1.eckelmann.group (2a00:1f08:4007:e030:172:18:30:60) by
 EX-SRV1.eckelmann.group (2a00:1f08:4007:e030:172:18:30:60) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Mon, 14 Feb 2022 15:01:29 +0100
Received: from EX-SRV1.eckelmann.group ([fe80::250:56ff:fe8b:5e2f]) by
 EX-SRV1.eckelmann.group ([fe80::250:56ff:fe8b:5e2f%6]) with mapi id
 15.01.2375.018; Mon, 14 Feb 2022 15:01:29 +0100
From:   "Hummrich, Tobias" <T.Hummrich@eckelmann.de>
To:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: [libgpiod 1.6.3] Do different lines have to be in the same scope?
Thread-Topic: [libgpiod 1.6.3] Do different lines have to be in the same
 scope?
Thread-Index: AdghqA39NqUTG/NqRuudD2dz2dR7uA==
Date:   Mon, 14 Feb 2022 14:01:29 +0000
Message-ID: <17c74834c56e4345ac2611b92c301e2f@eckelmann.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a00:1f08:4007:e035:172:18:35:9]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-cloud-security-sender: t.hummrich@eckelmann.de
X-cloud-security-recipient: linux-gpio@vger.kernel.org
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay86-hz1.antispameurope.com with CDE4E652F29
X-cloud-security-connect: smtp.eckelmann.de[217.19.183.80], TLS=1, IP=217.19.183.80
X-cloud-security-Digest: b5a9f79019816c93e272f26ef677bf4f
X-cloud-security: scantime:1.871
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=eckelmann.de; h=from:to
        :subject:date:message-id:content-type:content-transfer-encoding
        :mime-version; s=hse1; bh=AiUDpK9W4J9TQ/LtTkFWSexufhQE7G7Q68dJH2
        +QAwA=; b=Ln8FQ5VNgAG9zRxQWV1oAhy4GDVyyEIWxMrTFTtAEEDegicRhiTf1I
        KgM4/C38+J+BV/6EOpxIX187uGFgj2YvazA+0tYG+xnp7xDbiTaotFCucOZkl7lc
        FAszXcpygkHoWj8L2eYh5vAYs9nCbZiLTQDx2s8ufOphtmm/Z0Z0F83hxgnMBOs9
        H4zi8ZzLoZPMqXT65U+Z5AWG0lDw0XNoSi3BCAQzyxiAhFEfKkDRxzuqyVutv815
        QS/IUy19lcSDC/dOYSSSAc0IEuDl7N/9/g9s7URUsCkuYt3hL/l8GhSpDGiHD6WS
        3GQxlVLqa+MoVJ+SVo/1+5CJljSgo3tw==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

last week I ported part of our gpio related code from sysfs to libgpiod. I =
use the C++ bindings. I had some problems polling two different lines on di=
fferent gpio chips and finally realized that all was OK if both lines were =
defined in the same scope. Out of curiosity I'm asking: Is that really the =
case in version 1.6.3 and was this intended?

The problem was this: When I declared lines locally in a method and called =
this method to get the file descriptor, the file descriptor was the same fo=
r both lines. Like:

int MyClass::getFiledescriptor(const std::string &linename)
{
    auto currentLine =3D gpiod::find_line(linename);
    return currentLine.event_get_fd();
}

... returned 23 for both parameters "in1" and "in2" while gpioinfo told me =
that these names where unique.

It is OK for me now, the two lines I'm polling are members of one class now=
, it works as intended, and I'm fine with that. But still I wonder if I mis=
understood something or just did it wrong.

Is a new version of libgpiod published soon? Then this whole text may be ob=
solete.

Kind regards
Tobias

