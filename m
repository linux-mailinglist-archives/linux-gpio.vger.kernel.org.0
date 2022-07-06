Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC560568942
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jul 2022 15:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231715AbiGFNTe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jul 2022 09:19:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232155AbiGFNTc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2022 09:19:32 -0400
Received: from m1564.mail.126.com (m1564.mail.126.com [220.181.15.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F01782DD8
        for <linux-gpio@vger.kernel.org>; Wed,  6 Jul 2022 06:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=odKRX
        AoNg3hmggy3V6htr5eVwh3BDCnoM+RoxZAi1jU=; b=JjRvGYl1Ui3PvrOg4lj/W
        yJJG04h3rgnazv6VuYl64j5S9cDnWNzIF1sVgv7uTOBFpYUPJdFAkFPHmukwSXNU
        /pxlmIZsCuEJpHGx5MGYdHucZeY+vTChC9GXirnttyakEMXmRsuwAEi1iB1mcC1X
        v1wTZxOgtChZ/B0Xn1rKm0=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr64
 (Coremail) ; Wed, 6 Jul 2022 21:19:25 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date:   Wed, 6 Jul 2022 21:19:25 +0800 (CST)
From:   "Liang He" <windhl@126.com>
To:     "Linus Walleij" <linus.walleij@linaro.org>
Cc:     brgl@bgdev.pl, linux-gpio@vger.kernel.org
Subject: Re:Re: [PATCH] gpio: gpiolib-of: Fix refcount bugs in
 of_mm_gpiochip_add_data()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <CACRpkdZWEC2jtCk0Xjcq9HOWAbSQvqU7EQiwhbg2bJCVjy+WbQ@mail.gmail.com>
References: <20220704091313.277567-1-windhl@126.com>
 <CACRpkdZWEC2jtCk0Xjcq9HOWAbSQvqU7EQiwhbg2bJCVjy+WbQ@mail.gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <7f16a40d.774f.181d3aa58e5.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: QMqowAD3BnPdi8ViH8tGAA--.42453W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3B02F1pED3yZqQAAs9
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

CgoKQXQgMjAyMi0wNy0wNiAyMDo0NzowOCwgIkxpbnVzIFdhbGxlaWoiIDxsaW51cy53YWxsZWlq
QGxpbmFyby5vcmc+IHdyb3RlOgo+SGkgTGlhbmcsCj4KPnRoYW5rcyBmb3IgeW91ciBwYXRjaCEK
Cj4KCgpUaGFua3MhIAoKPk9uIE1vbiwgSnVsIDQsIDIwMjIgYXQgMTE6MTMgQU0gTGlhbmcgSGUg
PHdpbmRobEAxMjYuY29tPiB3cm90ZToKPgo+PiBXZSBzaG91bGQgdXNlIG9mX25vZGVfZ2V0KCkg
d2hlbiBhIG5ldyByZWZlcmVuY2Ugb2YgZGV2aWNlX25vZGUKPj4gaXMgY3JlYXRlZC4gSXQgaXMg
bm90ZWQgdGhhdCB0aGUgb2xkIHJlZmVyZW5jZSBzdG9yZWQgaW4KPj4gJ21tX2djLT5nYy5vZl9u
b2RlJyBzaG91bGQgYWxzbyBiZSBkZWNyZWFzZWQuCj4+Cj4+IEZpeGVzOiBmMTQxZWQ2NWYyNTYg
KCJncGlvOiBNb3ZlIERUIHN1cHBvcnQgY29kZSBpbnRvIGRyaXZlcnMvZ3BpbyIpCj4KPkkgZG91
YnQgdGhpcyBpcyBmaXhpbmcgdGhhdCBjb21taXQgc2luY2UgaXQgaXMgb25seSBtb3ZpbmcgY29k
ZT8KPgo+PiAtICAgICAgIG1tX2djLT5nYy5vZl9ub2RlID0gbnA7Cj4+ICsgICAgICAgb2Zfbm9k
ZV9wdXQobW1fZ2MtPmdjLm9mX25vZGUpOwo+PiArICAgICAgIG1tX2djLT5nYy5vZl9ub2RlID0g
b2Zfbm9kZV9nZXQobnApOwo+Cj5BaGEKPgo+Cj4+IFRoaXMgcGF0Y2ggaXMgYmFzZWQgb24gdGhl
IGZhY3QgdGhhdCB0aGVyZSBpcyBhIGNhbGwgc2l0ZSBpbiBmdW5jdGlvbiAncWVfYWRkX2dwaW9j
aGlwcygpJwo+PiBvZiBzcmMgZmlsZSAnZHJpdmVyc1xzb2NcZnNsXHFlXGdwaW8uYycuCj4+Cj4+
IEluIHRoYXQgZnVuY3Rpb24sIG9mX21tX2dwaW9jaGlwX2FkZF9kYXRhKCkgaXMgY29udGFpbmVk
IGluIGEgaXRlcmF0aW9uIG9mIGZvcl9lYWNoX2NvbXBhdGlibGVfbm9kZSgpLAo+PiB3aGljaCB3
aWxsIGF1dG9tYXRpY2FsbHkgaW5jcmVhc2UgYW5kIGRlY3JlYXNlIHRoZSByZWZjb3VudC4KPgo+
UHV0IHRoaXMgaW50byB0aGUgY29tbWl0IGxvZyBtZXNzYWdlIQoKPgoKCkkgd2lsbCBwdXQgaXQg
aW4gbmV3IHZlcnNpb24gcGF0Y2guCgo+SSBndWVzcyBpdCBzb2x2ZXMgdGhlIGltbWVkaWF0ZSBw
cm9ibGVtLCBidXQgdGhlIHJlYWwgc29sdXRpb24gaXMgdG8KPmdldCByaWQgb2Ygb2ZfbW1fZ3Bp
b2NoaXBfYWRkX2RhdGEoKSBhbmQgc3RydWN0IG9mX21tX2dwaW9fY2hpcAo+YW5kIHJlcGxhY2Ug
YWxsIGNhbGxzIHdpdGggaW5zdGFuY2VzIG9mIHByb3BlciBncGlvY2hpcHMgdXNpbmcKPltkZXZt
X11ncGlvY2hpcF9hZGRfZGF0YSgpLgo+Cj5XaGljaCBpcyBpbiBvdXIgVE9ETyBmaWxlLgo+Cj5J
dCdzIG5vdCB2ZXJ5IG11Y2ggdXNpbmcgdGhpcyBvbGQgaGVscGVyOgo+Cj4kIGdpdCBncmVwIG9m
X21tX2dwaW9jaGlwX2FkZF9kYXRhCj5hcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzR4eC9ncGlvLmM6
ICAgICAgICAgICAgICByZXQgPQo+b2ZfbW1fZ3Bpb2NoaXBfYWRkX2RhdGEobnAsIG1tX2djLCBw
cGM0eHhfZ2MpOwo+YXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84eHgvY3BtMS5jOiAgICAgIHJldHVy
bgo+b2ZfbW1fZ3Bpb2NoaXBfYWRkX2RhdGEobnAsIG1tX2djLCBjcG0xX2djKTsKPmFyY2gvcG93
ZXJwYy9wbGF0Zm9ybXMvOHh4L2NwbTEuYzogICAgICByZXR1cm4KPm9mX21tX2dwaW9jaGlwX2Fk
ZF9kYXRhKG5wLCBtbV9nYywgY3BtMV9nYyk7Cj5hcmNoL3Bvd2VycGMvc3lzZGV2L2NwbV9jb21t
b24uYzogICAgICAgcmV0dXJuCj5vZl9tbV9ncGlvY2hpcF9hZGRfZGF0YShucCwgbW1fZ2MsIGNw
bTJfZ2MpOwo+ZHJpdmVycy9ncGlvL2dwaW8tYWx0ZXJhLmM6ICAgICByZXQgPSBvZl9tbV9ncGlv
Y2hpcF9hZGRfZGF0YShub2RlLAo+JmFsdGVyYV9nYy0+bW1jaGlwLCBhbHRlcmFfZ2MpOwo+ZHJp
dmVycy9ncGlvL2dwaW8tbW0tbGFudGlxLmM6ICByZXR1cm4KPm9mX21tX2dwaW9jaGlwX2FkZF9k
YXRhKHBkZXYtPmRldi5vZl9ub2RlLCAmY2hpcC0+bW1jaGlwLCBjaGlwKTsKPmRyaXZlcnMvZ3Bp
by9ncGlvLW1wYzUyMDAuYzogICAgcmV0ID0KPm9mX21tX2dwaW9jaGlwX2FkZF9kYXRhKG9mZGV2
LT5kZXYub2Zfbm9kZSwgJmNoaXAtPm1tY2hpcCwgY2hpcCk7Cj5kcml2ZXJzL2dwaW8vZ3Bpby1t
cGM1MjAwLmM6ICAgIHJldCA9Cj5vZl9tbV9ncGlvY2hpcF9hZGRfZGF0YShvZmRldi0+ZGV2Lm9m
X25vZGUsICZjaGlwLT5tbWNoaXAsIGNoaXApOwo+ZHJpdmVycy9zb2MvZnNsL3FlL2dwaW8uYzog
ICAgICAgICAgICAgIHJldCA9Cj5vZl9tbV9ncGlvY2hpcF9hZGRfZGF0YShucCwgbW1fZ2MsIHFl
X2djKTsKPgo+VGhvc2UgYXJlIGFsbC4KPgo+VGhleSBhbGwgc2VlbSBsaWtlIHRoZXkgY2FuIGJl
IHNpbXBsaWZpZWQgYSBsb3QgYnkgdXNpbmcgc2VsZWN0IEdQSU9fR0VORVJJQwo+YW5kIGJncGlv
X2luaXQoKSBpbiB0aGUgbWFubmVyIG9mIGVnIGRyaXZlcnMvZ3Bpby9ncGlvLWZ0Z3BpbzAxMC5j
IHJlcGxhY2luZwo+YSBsb3Qgb2YgYm9pbGVycGxhdGUgY29kZS4KPgo+SWYgeW91IGhhdmUgYWNj
ZXNzIHRvIHRoZSBGU0wgYm9hcmQgYW5kIGNhbiB0ZXN0IHRoaXMsIHBsZWFzZSBjb25zaWRlciBk
b2luZwo+dGhpcyBiaWdnZXIgY2hhbmdlIGluc3RlYWQsIGF0IGxlYXN0IGZvciB0aGF0IGJvYXJk
LiBJdCBpcyBjZXJ0YWlubHkgbWFraW5nCj50aGUgd29ybGQgYSBtdWNoIGJldHRlciBwbGFjZSB0
aGFuIHJlcGFyaW5nIHRoZSBtaXN0YWtlcyBpbiBjb2RlCj51c2luZyBvZl9tbV9ncGlvX2NoaXAu
Cgo+PllvdXJzLAoKPkxpbnVzIFdhbGxlaWoKCgpIaSwgTGludXMsCgpGaXJzdCBvZiBhbGwsIHRo
YW5rcyBmb3IgeW91ciBlZmZvcnQgdG8gcmV2aWV3IGFuZCBjb25maXJtIG15IGN1cnJlbnQgcGF0
Y2guCgpTZWNvbmQsIHdoaWxlIEkgd291bGQgbGlrZSB2ZXJ5IG11Y2ggdG8gbWFrZSBhIGJpZ2dl
ciBjaGFuZ2UsIGl0IHdpbGwgbmVlZCAKZGF5cyBmb3IgbWUgdG8gbGVhcm4gdGhlIHdob2xlIHNl
bWFudGljIG9mIHRoZSBzb3VyY2UgY29kZSBhcyBub3cgSSBvbmx5IGhhdmUgbGVhcm5lZAp0aGUg
c2VtYW50aWMgb2YgT0YgQVBJcyBhbmQgY2FuIG9ubHkgbWFrZSBhIHNtYWxsIHN0ZXAgdG8gZGVj
aWRlIGlmIHRoZXJlIGlzIGEgcmVmY291bnQgYnVnLgoKQnV0IG5vdywgc2hvdWxkIEkgcmUtcG9z
dCB0aGlzIHBhdGNoIHdpdGggdGhlIGFib3ZlIGNvbW1pdCBsb2cgeW91IHN1Z2dlc3RlZCBvciBk
byBtb3JlCnRoaW5ncyBhZnRlciBJIGNhbj8KClRoYW5rcyBhZ2FpbiwgCgpMaWFuZwoKCgoKCgoK
CgoK
