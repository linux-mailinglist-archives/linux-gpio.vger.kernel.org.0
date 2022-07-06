Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87BA05687AF
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jul 2022 14:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbiGFMCK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jul 2022 08:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232099AbiGFMCI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2022 08:02:08 -0400
Received: from m1550.mail.126.com (m1550.mail.126.com [220.181.15.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C88132408D
        for <linux-gpio@vger.kernel.org>; Wed,  6 Jul 2022 05:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=UguFE
        fqkOBqPe7p4i03kFWYdWm1MKDWnqJDN5w91UUw=; b=cjzSZ+9axqoDDA8cJPmHp
        3yFSltjJl/kcAVzGXQK7nOgXm9StnyWX2KwnKMpSmggAOmtLiDvDjw8xm1UA98vo
        wQcM0oQnC8z9FZeNiAY+pjIrMLRRvzGXpVNzole178fuGQLkvXl1WgzF/V/QWpw+
        hzWfMTKCXltK7TrJTKsYiQ=
Received: from windhl$126.com ( [123.112.71.157] ) by ajax-webmail-wmsvr50
 (Coremail) ; Wed, 6 Jul 2022 20:01:56 +0800 (CST)
X-Originating-IP: [123.112.71.157]
Date:   Wed, 6 Jul 2022 20:01:56 +0800 (CST)
From:   "Liang He" <windhl@126.com>
To:     "Andy Shevchenko" <andy.shevchenko@gmail.com>
Cc:     "Bartosz Golaszewski" <brgl@bgdev.pl>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re:Re: Re: [PATCH] gpio: gpiolib-of: Fix refcount bugs in
 of_mm_gpiochip_add_data()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <CAHp75VdY=PD+kPOgXf-rjj2zMLF6uDrXk3-jVRB_MRiLdu=TKg@mail.gmail.com>
References: <20220704091313.277567-1-windhl@126.com>
 <CAMRc=MdGR4BdH4FfiRjzHY2uS7=13qRKzQZj9jcw5PnghYT2Gg@mail.gmail.com>
 <16c361ba.606.181d110bde1.Coremail.windhl@126.com>
 <CAHp75VdY=PD+kPOgXf-rjj2zMLF6uDrXk3-jVRB_MRiLdu=TKg@mail.gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <d6cb15d.7794.181d3636886.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: MsqowADnPPG1ecViLZJEAA--.49510W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3BQ2F1pED3w9rwACsU
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

CgpBdCAyMDIyLTA3LTA2IDE5OjUyOjQ0LCAiQW5keSBTaGV2Y2hlbmtvIiA8YW5keS5zaGV2Y2hl
bmtvQGdtYWlsLmNvbT4gd3JvdGU6Cj5PbiBXZWQsIEp1bCA2LCAyMDIyIGF0IDM6NDkgQU0gTGlh
bmcgSGUgPHdpbmRobEAxMjYuY29tPiB3cm90ZToKPj4gQXQgMjAyMi0wNy0wNSAyMzo0MDoxMiwg
IkJhcnRvc3ogR29sYXN6ZXdza2kiIDxicmdsQGJnZGV2LnBsPiB3cm90ZToKPj4gPk9uIE1vbiwg
SnVsIDQsIDIwMjIgYXQgMTE6MTMgQU0gTGlhbmcgSGUgPHdpbmRobEAxMjYuY29tPiB3cm90ZToK
Pgo+Li4uCj4KPj4gVGhpcyBwYXRjaCBpcyBiYXNlZCBvbiB0aGUgZmFjdCB0aGF0IHRoZXJlIGlz
IGEgY2FsbCBzaXRlIGluIGZ1bmN0aW9uICdxZV9hZGRfZ3Bpb2NoaXBzKCknCj4+IG9mIHNyYyBm
aWxlICdkcml2ZXJzXHNvY1xmc2xccWVcZ3Bpby5jJy4KPj4KPj4gSW4gdGhhdCBmdW5jdGlvbiwg
b2ZfbW1fZ3Bpb2NoaXBfYWRkX2RhdGEoKSBpcyBjb250YWluZWQgaW4gYSBpdGVyYXRpb24gb2Yg
Zm9yX2VhY2hfY29tcGF0aWJsZV9ub2RlKCksCj4+IHdoaWNoIHdpbGwgYXV0b21hdGljYWxseSBp
bmNyZWFzZSBhbmQgZGVjcmVhc2UgdGhlIHJlZmNvdW50Lgo+Cj4iYW5kIGRlY3JlYXNlIgo+Cj4K
Pj4gQXMgdGhlcmUgaXMgYSBuZXcgcmVmZXJlbmNlIGVzY2FwZWQgaW50byB0aGUgbW1fZ2MtPmdj
Lm9mX25vZGUsIHdlIHNob3VsZCBpbmNyZWFzZSB0aGUKPj4gcmVmY291bnQsIG90aGVyd2lzZSwg
dGhlcmUgbWF5IGJlIGEgcHJlbWF0dXJlIGZyZWUgYXMgd2UgZG8gbm90IGtub3cgdGhlIGV4aXN0
ZW5jZSBvZgo+PiB0aGUgcmVmZXJlbmNlIGluICdtbV9nYy0+Z2Mub2Zfbm9kZScuCj4+Cj4+IElm
IG15IHVuZGVyc3RhbmRpbmcgaXMgd3JvbmcsIHBsZWFzZSBjb3JyZWN0IG1lLgo+Cj5ZZXMsIHNl
ZSBhYm92ZS4KPgo+LS0gCj5XaXRoIEJlc3QgUmVnYXJkcywKPkFuZHkgU2hldmNoZW5rbwoKSGmj
rEFuZHksCgpJIHRoaW5rIHlvdSBkaWQgbm90IGdldCBteSBwb2ludC4KClRoZSBmb3JfZWFjaF94
eHggT0YgYXBpIGhhcyBkZWNyZWFzZWQgdGhlIHJlZmNvdW50LCBidXQgCnRoZXJlIGlzIGEgcmVm
ZXJlbmNlIHxFU0NBUEV8IG91dCBvZiB0aGUgbG9jYWwgYXJlYSwgc28gd2UKbmVlZCBhZGRpdGlv
bmFsIHJlZmNvdW50aW5nLCByaWdodD8KClRoYW5rcywKCkxpYW5nCg==
