Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB7956893D
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jul 2022 15:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbiGFNSi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jul 2022 09:18:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233776AbiGFNS0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2022 09:18:26 -0400
Received: from m1564.mail.126.com (m1564.mail.126.com [220.181.15.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6361FE9C
        for <linux-gpio@vger.kernel.org>; Wed,  6 Jul 2022 06:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=sv/Pq
        U8DHNspcIzyWVC9mkzPlhaQLDL7VyUYDkKmCu8=; b=INFGvBnpOD9t0ds4Lij8i
        rfOnBa9wMOP9B3Ifq4V9I/N6cq7blQ4Q2MeoJfajVYv4kyqktF1I9IxxgFSERzKD
        M+EZKeo0gLzvWzzN7LVh6VbGfuubjpLuMf5lP7E2/sM9y6EPHCwYr8FUnRtV4Q/Z
        OSOkGPlXYWdN1dB9j2sizg=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr64
 (Coremail) ; Wed, 6 Jul 2022 21:18:15 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date:   Wed, 6 Jul 2022 21:18:15 +0800 (CST)
From:   "Liang He" <windhl@126.com>
To:     "Andy Shevchenko" <andy.shevchenko@gmail.com>
Cc:     "Linus Walleij" <linus.walleij@linaro.org>,
        "Bartosz Golaszewski" <brgl@bgdev.pl>,
        =?GBK?Q?Heiko_St=A8=B9bner?= <heiko@sntech.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re:Re: Re: [PATCH] gpio: rockchip: Fix missing of_node_put() in
 rockchip_gpio_probe() and rockchip_gpiolib_register()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <CAHp75VdXkbkqMje6B+Q7DvWsapTbRtASGuW4SwFhBN_85_OxfA@mail.gmail.com>
References: <20220706060222.302051-1-windhl@126.com>
 <CAHp75VdWBx2hMyu6902exeist24cm5NnO3z9aKjhV=H5tb8y9g@mail.gmail.com>
 <10b8f377.75ee.181d390dfe0.Coremail.windhl@126.com>
 <CAHp75VdXkbkqMje6B+Q7DvWsapTbRtASGuW4SwFhBN_85_OxfA@mail.gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <7758f11e.7745.181d3a94717.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: QMqowAC3v3OYi8ViDctGAA--.59234W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3Bo2F1pED3yYHgABsN
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

CgoKQXQgMjAyMi0wNy0wNiAyMTowMzoyNywgIkFuZHkgU2hldmNoZW5rbyIgPGFuZHkuc2hldmNo
ZW5rb0BnbWFpbC5jb20+IHdyb3RlOgo+T24gV2VkLCBKdWwgNiwgMjAyMiBhdCAyOjUxIFBNIExp
YW5nIEhlIDx3aW5kaGxAMTI2LmNvbT4gd3JvdGU6Cj4+IEF0IDIwMjItMDctMDYgMjA6Mjc6NDEs
ICJBbmR5IFNoZXZjaGVua28iIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPiB3cm90ZToKPj4g
Pk9uIFdlZCwgSnVsIDYsIDIwMjIgYXQgODoyOSBBTSBMaWFuZyBIZSA8d2luZGhsQDEyNi5jb20+
IHdyb3RlOgo+PiA+Pgo+PiA+PiBXZSBzaG91bGQgY2FsbCBvZl9ub2RlX3B1dCgpIGZvciB0aGUg
cmVmZXJlbmNlIHJldHVybmVkIGJ5Cj4+ID4+IG9mX2dldF9wYXJlbnQoKSB3aGljaCB3aWxsIGlu
Y3JlYXNlIHRoZSByZWZjb3VudC4KPj4gPgo+PiA+SXMgaXQgc3VnZ2VzdGVkIGJ5IHRoZSBzby1j
YWxsZWQgSHVsayBSb2JvdD8gSWYgc28sIGl0J3Mgbm90IHRoZSBmaXJzdAo+PiA+dGltZSBJIHNl
ZSB0aGF0IHBlb3BsZSBkb24ndCB0aGluayBhYm91dCwgYW5kIGp1c3QgcmVwZWF0IGFzIHJvYm90
cwo+PiA+ZG8uIEhhdmUgeW91IHJlYWQgdGhlIGNvZGU/IEhhdmUgeW91IHRyaWVkIHRvIHVuZGVy
c3RhbmQgd2hhdCBtYXkKPj4gPmhhcHBlbiB3aGVuIHlvdSBwdXQgYW4gT0Ygbm9kZT8gV2hhdCB3
b3VsZCBiZSBwb3NzaWJsZSBjb25zZXF1ZW5jZXMgdG8KPj4gPnRoZSByZXN0IG9mIHRoZSBjb2Rl
Pwo+PiA+Cj4+ID5UaGUgYWJvdmUgc2VudGVuY2UgaXMgY29ycmVjdCwgaW1wbGVtZW50YXRpb24g
aXMgbm90IHRob3VnaHQgdGhyb3VnaC4KPj4gPkl0IG1pZ2h0IGJlIGEgY29ycmVjdCBmaXgsIGJ1
dCB0aGUgY29tbWl0IG1lc3NhZ2UgZG9lc24ndCBzaG93IHRoYXQKPj4gPnlvdSByZWFsbHkgc3Bl
bnQgdGltZSBvbiB0aGUgY2hhbmdlLgo+PiA+Cj4+ID5QLlM+IEkgd291bGQgcGVyc29uYWxseSBw
dXQgYWxsIHRob3NlIEh1bGsgUm9ib3QgYmxhLWJsYS1ibGEgd2l0aAo+PiA+bG93ZXN0IHByaW9y
aXR5IHRvIGNvbnNpZGVyLCB0b28gbWFueSBicm9rZW4gc3VibWlzc2lvbnMuLi4KPgo+PiBUaGFu
a3MgdmVyeSBtdWNoIGZvciB5b3UgdG8gcmV2aWV3IG15IGFub3RoZXIgcGF0Y2ggY29kZS4KPgo+
WW91J3JlIHdlbGNvbWUhCj4KPj4gRmlyc3Qgb2YgYWxsLCBhbGwgb2YgbXkgY29tbWl0cyBhcmUg
bm90IGZyb20gSHVsayBSb2JvdCBhbmQgSSBhbSBzb3JyeSB0aGF0IHlvdSBoYXZlIHNwZW50IGxv
dHMgb2YgdGltZQo+PiBmb3IgdGhvc2UgYnJva2VuIHN1Ym1pc3Npb25zLgo+Pgo+PiBTZWNvbmQs
IGZvciB0aGlzIGJ1Zywgd2hpbGUgdGhlIG9mX2dldF9wYXJlbnQoKSBpcyBvbmx5IDMtNCBsaW5l
cyBhYm92ZSB0aGUgYWRkaW5nIG9mX25vZGVfcHV0KCksCj4+IGl0IGlzIG15IGZhdWx0IHRvIHdy
aXRlIHNvIHNob3J0IGNvbW1pdCBsb2cuCj4KPlRoZSBwcm9ibGVtIGlzIG5vdCBpbiB0aGUgbGVu
Z3RoIG9mIHRoZSBjb21taXQgbWVzc2FnZSwgYnV0IGluIHRoZQo+c2VtYW50aWNzIG9mIGl0Lgo+
Cj5UaGUgKnB1dCgpIG1ldGhvZHMgdGhhdCBkcm9wIHJlZmVyZW5jZSBjb3VudGluZyBhcmUgcGFy
dCBvZiB0aGUKPmdhcmJhZ2UgY29sbGVjdG9yLiBJZiByZWZlcmVuY2UgZ29lcyB0byAwIChvciBv
dGhlciBkZWZpbmVkIHRocmVzaG9sZAo+Zm9yIHRoYXQgcHVycG9zZSkgdGhlIHJlc291cmNlIG1h
eSBiZSB2ZXJ5IHdlbGwgZ29uZS4gTm93LCB5b3Ugc2hvdWxkCj5jaGVjayB3aG8gYW5kIGhvdyBp
cyB1c2luZyB0aGF0IHJlc291cmNlIGluIHRoZSBjb2RlLiBEZXBlbmRpbmcgb24KPnRoYXQgdGhl
IHBhdGNoIG1heSBiZSBnb29kIGluIGl0cyBjdXJyZW50IGZvcm0sIG9yIHNob3VsZCBiZQo+Y29t
cGxldGVseSByZXdyaXR0ZW4uCj4KPi0tIAo+V2l0aCBCZXN0IFJlZ2FyZHMsCj5BbmR5IFNoZXZj
aGVua28KClRoYW5rcywgQW5keSwgCgpGb3IgcmVmY291bnRpbmcsIHBsZWFzZSB0cnVzdCBtZSwg
SSBoYXZlIHNwZW50IHllYXJzIG9uIGl0LgoKQnV0IGNvbnNpZGVyaW5nIG90aGVyIHBhcnRzIG9m
IHRoZXNlIGtlcm5lbCBmaWxlcyBhbmQgdGhlaXIgcmVsYXRpb25zaGlwLCBpLmUuLCAid2hvIGFu
ZCBob3cgaXMgdXNpbmcgdGhhdCByZXNvdXJjZSIsCnlvdXIgc3VnZ2VzdGlvbiBpcyByaWdodCBh
bmQgcHJvZmVzc2lvbmFsLiAKCkkgd2lsbCB0cmVhdCB0aGVzZSBwb3NzaWJsZSBidWdzIG1vcmUg
Y2FyZWZ1bGx5IGFuZCBiZWdpbiB0byBjb25zaWRlciBpZiBpdCBpcyBiZXR0ZXIgdG8gY29tcGxl
dGVseSByZXdyaXR0ZW4uCgpUaGFua3MgYWdhaW4sCgpMaWFuZwoK
