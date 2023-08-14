Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDC077B3B5
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Aug 2023 10:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233281AbjHNIQg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Aug 2023 04:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233944AbjHNIQN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Aug 2023 04:16:13 -0400
Received: from mail.schrack-seconet.com (mail.schrack-seconet.com [81.223.165.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF44810D
        for <linux-gpio@vger.kernel.org>; Mon, 14 Aug 2023 01:16:11 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.schrack-seconet.com (Postfix) with ESMTP id 5B3B1213CA4;
        Mon, 14 Aug 2023 10:16:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=schrack-seconet.com;
        s=mail; t=1692000970;
        bh=n0gCHVQHmSgY9LUbsKZj2DDLJNaDk3t/4xMrL+ReK1k=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=Nqatq7nVqVbZbszK8vH6gbbZMQAI/JnapVSBKA3x/Om2HY3TQmNpsU9faC7iMC9bs
         DGQ+Q6Z3anY+Wv6F/fr7WjbcsqTZ90hakcwsWqvQoh5eqQJa4ZCgS4F5rXAzTWEYTD
         69/rie1RCJ3MTiapcJuEpij/QYL7gK7GQaREsT5A=
X-Virus-Scanned: Debian amavisd-new at schrack-seconet.com
Received: from mail.schrack-seconet.com ([127.0.0.1])
        by localhost (mail.schrack-seconet.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id elbZQfA4Ki1Y; Mon, 14 Aug 2023 10:16:03 +0200 (CEST)
Received: from outlook.schrack-seconet.com (unknown [10.20.201.33])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.schrack-seconet.com (Postfix) with ESMTPS id D2147213CA3;
        Mon, 14 Aug 2023 10:16:03 +0200 (CEST)
Received: from EXCH-W1.schrack-seconet.works (10.20.201.33) by
 EXCH-W1.schrack-seconet.works (10.20.201.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.16; Mon, 14 Aug 2023 10:16:03 +0200
Received: from EXCH-W1.schrack-seconet.works ([10.20.201.33]) by
 EXCH-W1.schrack-seconet.works ([10.20.201.33]) with mapi id 15.02.1258.016;
 Mon, 14 Aug 2023 10:16:03 +0200
From:   "Hollerer Franz, Schrack Seconet AG, Entwicklung" 
        <f.hollerer@schrack-seconet.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "Ullrich Lucas, Schrack Seconet AG, Entwicklung" 
        <l.ullrich@schrack-seconet.com>
Subject: RE: [libgpiod]: feature request: API functions, const correctness
Thread-Topic: [libgpiod]: feature request: API functions, const correctness
Thread-Index: AdnFSksl/z46payhSI6AJ2k+kdDPzgH8bGGAAFIPTbA=
Date:   Mon, 14 Aug 2023 08:16:03 +0000
Message-ID: <5e106aba54904302bef2bc743ea6959b@schrack-seconet.com>
References: <a6ce12acff7b4ed9bae1df0115bba1f3@schrack-seconet.com>
 <CAMRc=Mcc7M3wbGX+77pUkQFTiPtDx3vYkWp=8eJWMh6k4eqhhw@mail.gmail.com>
In-Reply-To: <CAMRc=Mcc7M3wbGX+77pUkQFTiPtDx3vYkWp=8eJWMh6k4eqhhw@mail.gmail.com>
Accept-Language: de-AT, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.20.190.21]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgQmFydG9zeiENCg0KSSBoZXNpdGF0ZSB0byBmb2xsb3cgeW91ciByZWFzb25pbmcuIEkgcGVy
c29uYWxseSBoaWdobHkgYXBwcmVjaWF0ZSBjb25zdCBjb3JyZWN0bmVzcyBhcyBpdCBJTUhPIG1h
a2VzIHRoZSBpbnRlbmQgb2YgdGhlIGNvZGUgY2xlYXJlciwgcHJldmVudHMgbWlzdXNlLCBhbmQg
Z2l2ZXMgdGhlIGNvbXBpbGVyIG1vcmUgb3B0aW9ucyBmb3Igd2FybmluZ3MgYW5kIG9wdGltaXph
dGlvbi4NCg0KQW55d2F5LCBpdCdzIHlvdXIgY2hvaWNlIGFuZCBJIHJlc3BlY3QgdGhpcy4NCg0K
RnJhbnoNCg0K
