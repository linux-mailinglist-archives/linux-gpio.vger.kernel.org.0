Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCF21567B9F
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jul 2022 03:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbiGFBn4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jul 2022 21:43:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbiGFBnu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jul 2022 21:43:50 -0400
X-Greylist: delayed 1870 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 05 Jul 2022 18:43:47 PDT
Received: from m151.mail.126.com (m151.mail.126.com [220.181.15.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EA208186CF
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jul 2022 18:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=jjw7N
        2vFm6SwE/qOzaIFAwRjk7pPyEAigyg0sNDENhQ=; b=EWYxLlM2FMxjHgOHXQW2u
        m/NstKPAdw5RZrLpqrAvp2vMHq1LWHv312ISEGmZoWeheTgr8fPy2NQONsjU8Q4p
        VmrdTIvKeJsnmwnEN25MZF0vw4q1zySp543IitmJanUiHO3ZjYc+aUcCfZG5pmsQ
        TupOyDBoV07SDhTfC5LfKM=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr1
 (Coremail) ; Wed, 6 Jul 2022 09:12:24 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date:   Wed, 6 Jul 2022 09:12:24 +0800 (CST)
From:   "Liang He" <windhl@126.com>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>
Cc:     "Linus Walleij" <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re:Re: [PATCH] gpio: gpiolib-of: Fix refcount bugs in
 of_mm_gpiochip_add_data()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <CAMRc=MdGR4BdH4FfiRjzHY2uS7=13qRKzQZj9jcw5PnghYT2Gg@mail.gmail.com>
References: <20220704091313.277567-1-windhl@126.com>
 <CAMRc=MdGR4BdH4FfiRjzHY2uS7=13qRKzQZj9jcw5PnghYT2Gg@mail.gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <16c361ba.606.181d110bde1.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AcqowADH2LB54cRi_mMfAA--.32451W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGgE2F1-HZchpLwAAsJ
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

CgpBdCAyMDIyLTA3LTA1IDIzOjQwOjEyLCAiQmFydG9zeiBHb2xhc3pld3NraSIgPGJyZ2xAYmdk
ZXYucGw+IHdyb3RlOgo+T24gTW9uLCBKdWwgNCwgMjAyMiBhdCAxMToxMyBBTSBMaWFuZyBIZSA8
d2luZGhsQDEyNi5jb20+IHdyb3RlOgo+Pgo+PiBXZSBzaG91bGQgdXNlIG9mX25vZGVfZ2V0KCkg
d2hlbiBhIG5ldyByZWZlcmVuY2Ugb2YgZGV2aWNlX25vZGUKPj4gaXMgY3JlYXRlZC4gSXQgaXMg
bm90ZWQgdGhhdCB0aGUgb2xkIHJlZmVyZW5jZSBzdG9yZWQgaW4KPj4gJ21tX2djLT5nYy5vZl9u
b2RlJyBzaG91bGQgYWxzbyBiZSBkZWNyZWFzZWQuCj4+Cj4+IEZpeGVzOiBmMTQxZWQ2NWYyNTYg
KCJncGlvOiBNb3ZlIERUIHN1cHBvcnQgY29kZSBpbnRvIGRyaXZlcnMvZ3BpbyIpCj4+IFNpZ25l
ZC1vZmYtYnk6IExpYW5nIEhlIDx3aW5kaGxAMTI2LmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL2dw
aW8vZ3Bpb2xpYi1vZi5jIHwgNCArKystCj4+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8vZ3Bpb2xp
Yi1vZi5jIGIvZHJpdmVycy9ncGlvL2dwaW9saWItb2YuYwo+PiBpbmRleCAzZDZjM2ZmZDU1NzYu
LmRlMTAwYjAyMTdkYSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncGlvL2dwaW9saWItb2YuYwo+
PiArKysgYi9kcml2ZXJzL2dwaW8vZ3Bpb2xpYi1vZi5jCj4+IEBAIC04NjAsNyArODYwLDggQEAg
aW50IG9mX21tX2dwaW9jaGlwX2FkZF9kYXRhKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCj4+ICAg
ICAgICAgaWYgKG1tX2djLT5zYXZlX3JlZ3MpCj4+ICAgICAgICAgICAgICAgICBtbV9nYy0+c2F2
ZV9yZWdzKG1tX2djKTsKPj4KPj4gLSAgICAgICBtbV9nYy0+Z2Mub2Zfbm9kZSA9IG5wOwo+PiAr
ICAgICAgIG9mX25vZGVfcHV0KG1tX2djLT5nYy5vZl9ub2RlKTsKPj4gKyAgICAgICBtbV9nYy0+
Z2Mub2Zfbm9kZSA9IG9mX25vZGVfZ2V0KG5wKTsKPj4KPj4gICAgICAgICByZXQgPSBncGlvY2hp
cF9hZGRfZGF0YShnYywgZGF0YSk7Cj4+ICAgICAgICAgaWYgKHJldCkKPj4gQEAgLTg2OCw2ICs4
NjksNyBAQCBpbnQgb2ZfbW1fZ3Bpb2NoaXBfYWRkX2RhdGEoc3RydWN0IGRldmljZV9ub2RlICpu
cCwKPj4KPj4gICAgICAgICByZXR1cm4gMDsKPj4gIGVycjI6Cj4+ICsgICAgICAgb2Zfbm9kZV9w
dXQobnApOwo+PiAgICAgICAgIGlvdW5tYXAobW1fZ2MtPnJlZ3MpOwo+PiAgZXJyMToKPj4gICAg
ICAgICBrZnJlZShnYy0+bGFiZWwpOwo+PiAtLQo+PiAyLjI1LjEKPj4KPgo+SGF2ZSB5b3Ugbm90
aWNlZCBhbnkgaXNzdWUgd2l0aCByZWZlcmVuY2UgY291bnRpbmcgdGhhdCBtYWRlIHlvdSBwb3N0
Cj50aGlzIHBhdGNoPyBXZSB0eXBpY2FsbHkgImJvcnJvdyIgdGhlIHJlZmVyZW5jZSB0byB0aGUg
cGxhdGZvcm0KPmRldmljZSdzIG9mX25vZGUgaW4gR1BJTyBkcml2ZXJzIChhbmQgZXZlcnl3aGVy
ZSBJIGNhbiB0aGluayBvZiB0b28pLgo+Cj5CYXJ0CgpIaSwgQmFydC4KClRoaXMgcGF0Y2ggaXMg
YmFzZWQgb24gdGhlIGZhY3QgdGhhdCB0aGVyZSBpcyBhIGNhbGwgc2l0ZSBpbiBmdW5jdGlvbiAn
cWVfYWRkX2dwaW9jaGlwcygpJwpvZiBzcmMgZmlsZSAnZHJpdmVyc1xzb2NcZnNsXHFlXGdwaW8u
YycuCgpJbiB0aGF0IGZ1bmN0aW9uLCBvZl9tbV9ncGlvY2hpcF9hZGRfZGF0YSgpIGlzIGNvbnRh
aW5lZCBpbiBhIGl0ZXJhdGlvbiBvZiBmb3JfZWFjaF9jb21wYXRpYmxlX25vZGUoKSwKd2hpY2gg
d2lsbCBhdXRvbWF0aWNhbGx5IGluY3JlYXNlIGFuZCBkZWNyZWFzZSB0aGUgcmVmY291bnQuCgpB
cyB0aGVyZSBpcyBhIG5ldyByZWZlcmVuY2UgZXNjYXBlZCBpbnRvIHRoZSBtbV9nYy0+Z2Mub2Zf
bm9kZSwgd2Ugc2hvdWxkIGluY3JlYXNlIHRoZSAKcmVmY291bnQsIG90aGVyd2lzZSwgdGhlcmUg
bWF5IGJlIGEgcHJlbWF0dXJlIGZyZWUgYXMgd2UgZG8gbm90IGtub3cgdGhlIGV4aXN0ZW5jZSBv
Zgp0aGUgcmVmZXJlbmNlIGluICdtbV9nYy0+Z2Mub2Zfbm9kZScuCgpJZiBteSB1bmRlcnN0YW5k
aW5nIGlzIHdyb25nLCBwbGVhc2UgY29ycmVjdCBtZS4KClRoYW5rcywKCkxpYW5nCgoKCg==
