Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04D5528C8C8
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Oct 2020 08:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389693AbgJMGsE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Oct 2020 02:48:04 -0400
Received: from regular1.263xmail.com ([211.150.70.200]:48102 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389346AbgJMGsD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Oct 2020 02:48:03 -0400
X-Greylist: delayed 433 seconds by postgrey-1.27 at vger.kernel.org; Tue, 13 Oct 2020 02:48:02 EDT
Received: from localhost (unknown [192.168.167.16])
        by regular1.263xmail.com (Postfix) with ESMTP id 9CA4B11C6;
        Tue, 13 Oct 2020 14:40:48 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from jianqun-pc (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P30217T139798165583616S1602571248138252_;
        Tue, 13 Oct 2020 14:40:48 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <5ba8c1c7360008fb64b95412a085cae9>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: linus.walleij@linaro.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Date:   Tue, 13 Oct 2020 14:40:47 +0800
From:   "jay.xu@rock-chips.com" <jay.xu@rock-chips.com>
To:     "Linus Walleij" <linus.walleij@linaro.org>,
        =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Subject: Re: Re: [PATCH 2/2] pinctrl: rockchip: make driver be tristate module
References: <20200907025927.9713-3-jay.xu@rock-chips.com>, 
        <20200914003847.10341-1-jay.xu@rock-chips.com>, 
        <5373086.oXRXx9yCqB@diego>, 
        <7244527.mGzxE9Z0Hj@diego>, 
        <CACRpkdYAxpyB+y88eC4iuvHRqttPSFdaMHAZdr6y8jfTr0Qong@mail.gmail.com>
X-Priority: 3
X-Has-Attach: no
X-Mailer: Foxmail 7.2.18.95[cn]
Mime-Version: 1.0
Message-ID: <202010131440473168632@rock-chips.com>
Content-Type: text/plain;
        charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RGVhciBXYWxsZWlqIGFuZCBIZWlrbwoKVGhlIHBhdGNoICJbUEFUQ0hdIHBpbmN0cmw6IHJvY2tj
aGlwOiBwb3B1bGF0ZSBwbGF0Zm9ybSBkZXZpY2UgZm9yIHJvY2tjaGlwIGdwaW8iIGhhcyBiZWVu
IHJlbW92ZSBvdXRvZgp0aGUgcGF0Y2hlcywgc2luY2Ugd2UgaGF2ZSBhIG5ldyBwYXRjaCB0byBt
b3ZlIGdwaW8gcmVsYXRlZCBjb2RlcyB0byBhIHNlcGFyYXRlZCBkcml2ZXIuCgpTbyBwbGVhc2Ug
aWdub3JlIGl0IGZvciBub3cuIHRoYW5rcyB2ZXJ5IG11Y2guCgotLS0tLS0tLS0tLS0tLQpqYXku
eHVAcm9jay1jaGlwcy5jb20KPk9uIE1vbiwgU2VwIDIxLCAyMDIwIGF0IDEyOjE4IEFNIEhlaWtv
IFN0w7xibmVyIDxoZWlrb0BzbnRlY2guZGU+IHdyb3RlOgo+Cj4+IEl0IHNlZW1zIEkndmUgcmV2
aWV3ZWQgYWxsIHBhdGNoZXMgb2YgdGhpcyBzZXJpZXMgbm93LCBidXQgSSB0aGluawo+PiB5b3Ug
bWlnaHQgd2FudCB0byByZXNlbmQgdGhlIHNlcmllcyBhIGZpbmFsIHRpbWUgYXMgdjMgaW4gYSBj
bGVhbmVkIHVwCj4+IHN0YXRlIChkcm9wIHBhdGNoMSBhbmQganVzdCBwb3N0IHBhdGNoZXMgMi01
IGluIGEgZnVsbCBzZXJpZXMpIHNvIHRoYXQKPj4gd2UgZG9uJ3QgY29uZnVzZSBMaW51cyB0b28g
bXVjaCB3aXRoIHRoZSByZXBvc3RlZCBwYXRjaGVzIHdlIGN1cnJlbnRseQo+PiBoYXZlLgo+Cj5Z
ZXMgcGxlYXNlIHNlbmQgYSB2MyBsaWtlIHRoYXQgc28gSSBjYW4gYXBwbHkgaXQhCj4KPllvdXJz
LAo+TGludXMgV2FsbGVpago+Cj4KPg==



