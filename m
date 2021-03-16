Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3977633CA48
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Mar 2021 01:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232606AbhCPAOb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 20:14:31 -0400
Received: from regular1.263xmail.com ([211.150.70.204]:34934 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232008AbhCPAOC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 20:14:02 -0400
X-Greylist: delayed 370 seconds by postgrey-1.27 at vger.kernel.org; Mon, 15 Mar 2021 20:14:02 EDT
Received: from localhost (unknown [192.168.167.235])
        by regular1.263xmail.com (Postfix) with ESMTP id 90AB056D;
        Tue, 16 Mar 2021 08:07:05 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from desktop-sg5v5ea (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P24304T139684931950336S1615853224574034_;
        Tue, 16 Mar 2021 08:07:05 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <5836ca24d9499efce31c8d180d8af6d7>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: linus.walleij@linaro.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Date:   Tue, 16 Mar 2021 08:07:04 +0800
From:   "jay.xu@rock-chips.com" <jay.xu@rock-chips.com>
To:     "Linus Walleij" <linus.walleij@linaro.org>
Cc:     =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>,
        "Catalin Marinas" <catalin.marinas@arm.com>,
        "Will Deacon" <will@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Subject: Re: Re: [PATCH 0/2] make rockchip pinctrl module able
References: <20210305003907.1692515-1-jay.xu@rock-chips.com>, 
        <CACRpkdaAL4U_ymEJTnP9SFV4P0EVLkRGsyVNY9PPqNPFPVxf+A@mail.gmail.com>
X-Priority: 3
X-Has-Attach: no
X-Mailer: Foxmail 7.2.19.158[cn]
Mime-Version: 1.0
Message-ID: <202103160807044436670@rock-chips.com>
Content-Type: text/plain;
        charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

VGhhbmtzIHZlcnkgbXVjaAotLS0tLS0tLS0tLS0tLQpqYXkueHVAcm9jay1jaGlwcy5jb20KPk9u
IEZyaSwgTWFyIDUsIDIwMjEgYXQgMTozOSBBTSBKaWFucXVuIFh1IDxqYXkueHVAcm9jay1jaGlw
cy5jb20+IHdyb3RlOgo+Cj4+IE1ha2UgdGhlIHJvY2tjaGlwIHBpbmN0cmwgZHJpdmVyIGFibGUg
dG8gYmUgbW9kdWxlIGJ5IHVuc2VsZWN0Cj4+IFBJTkNUUkxfUk9DS0NISVAgZnJvbSBBUkNIX1JP
Q0tDSElQLCB0aGVuIG1vZGlmeSBkcml2ZXIgbW9kdWxlIGRlZmluZS4KPgo+QXBwbGllZCB0aGlz
IGFnYWluIHdpdGggdGhlIGlycWNoaXAgcGF0Y2ggdW5kZXIsIGxldCdzIHNlZSBob3cgdGhpcwo+
d29ya3MhCj4KPllvdXJzLAo+TGludXMgV2FsbGVpago+Cj4KPg==



