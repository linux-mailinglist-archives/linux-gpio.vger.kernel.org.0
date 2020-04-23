Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 525F91B582A
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2020 11:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgDWJ2r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Apr 2020 05:28:47 -0400
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21351 "EHLO
        sender4-of-o53.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726849AbgDWJ2q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Apr 2020 05:28:46 -0400
X-Greylist: delayed 905 seconds by postgrey-1.27 at vger.kernel.org; Thu, 23 Apr 2020 05:28:46 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1587633210; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=VVSGFYuiacgtCVG/Cr0OwEZN2WfMMzrs7p6JD9uuNUPvMgZPRAeJuKIwa4W7sMgvC3Ijrikg4aXW7l82yE/SkMm+EvHwaHCchtmwvq4aNhCZ6JWqcO6QeGjaTEPxilx37RyKrr3HrgFMAv2bN+xgY0qtzYBEDIXNI0lMt1EB8X8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1587633210; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To; 
        bh=lVcquTCP4j4rjMQfIarQX/W9zv5y8Yc+42wtUUDGOBw=; 
        b=QshwM3Dv4laGOlm0nq3jZs3qxFFPiKuy87//LaZE4Cm8VsjOU4okI6Ms/WM75ST61jKwixbbQFr+Q4wxUdzfuUrIikrpAfyoY/1nudqcEENi0ZlpjfZ1zoDKXVOOWU4AV2SC2a829ZRelS62VMhpAAmIzG/+p9LHd0X9lcunxO0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        spf=pass  smtp.mailfrom=no-reply@patchew.org;
        dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
        with SMTPS id 1587633209047725.916656049011; Thu, 23 Apr 2020 02:13:29 -0700 (PDT)
In-Reply-To: <20200423090118.11199-1-geert+renesas@glider.be>
Subject: Re: [PATCH QEMU v2 0/5] Add a GPIO backend
Reply-To: <qemu-devel@nongnu.org>
Message-ID: <158763320718.4520.18138029284746846177@39012742ff91>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
From:   no-reply@patchew.org
To:     geert+renesas@glider.be
Cc:     peter.maydell@linaro.org, pbonzini@redhat.com, graf@amazon.com,
        linus.walleij@linaro.org, bartekgola@gmail.com,
        magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org, qemu-arm@nongnu.org,
        qemu-devel@nongnu.org, geert+renesas@glider.be
Date:   Thu, 23 Apr 2020 02:13:29 -0700 (PDT)
X-ZohoMailClient: External
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDQyMzA5MDExOC4xMTE5
OS0xLWdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0
aGUgYXNhbiBidWlsZCB0ZXN0LiBQbGVhc2UgZmluZCB0aGUgdGVzdGluZyBjb21tYW5kcyBhbmQK
dGhlaXIgb3V0cHV0IGJlbG93LiBJZiB5b3UgaGF2ZSBEb2NrZXIgaW5zdGFsbGVkLCB5b3UgY2Fu
IHByb2JhYmx5IHJlcHJvZHVjZSBpdApsb2NhbGx5LgoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09
PQojIS9iaW4vYmFzaApleHBvcnQgQVJDSD14ODZfNjQKbWFrZSBkb2NrZXItaW1hZ2UtZmVkb3Jh
IFY9MSBORVRXT1JLPTEKdGltZSBtYWtlIGRvY2tlci10ZXN0LWRlYnVnQGZlZG9yYSBUQVJHRVRf
TElTVD14ODZfNjQtc29mdG1tdSBKPTE0IE5FVFdPUks9MQo9PT0gVEVTVCBTQ1JJUFQgRU5EID09
PQoKICBDQyAgICAgIGNoYXJkZXYvY2hhci1waXBlLm8KICBDQyAgICAgIGNoYXJkZXYvY2hhci1w
dHkubwoKV2FybmluZywgdHJlYXRlZCBhcyBlcnJvcjoKL3RtcC9xZW11LXRlc3Qvc3JjL2RvY3Mv
Li4vcWVtdS1vcHRpb25zLmh4Ojg4MTpVbmV4cGVjdGVkIGluZGVudGF0aW9uLgogIENDICAgICAg
Y2hhcmRldi9jaGFyLXJpbmdidWYubwogIENDICAgICAgY2hhcmRldi9jaGFyLXNlcmlhbC5vCgpX
YXJuaW5nLCB0cmVhdGVkIGFzIGVycm9yOgovdG1wL3FlbXUtdGVzdC9zcmMvZG9jcy8uLi9xZW11
LW9wdGlvbnMuaHg6ODgxOlVuZXhwZWN0ZWQgaW5kZW50YXRpb24uCiAgQ0MgICAgICBjaGFyZGV2
L2NoYXItc29ja2V0Lm8KICBDQyAgICAgIGNoYXJkZXYvY2hhci1zdGRpby5vCi0tLQogIENDICAg
ICAgYmxvY2tkZXYtbmJkLm8KICBDQyAgICAgIGlvdGhyZWFkLm8KICBDQyAgICAgIGpvYi1xbXAu
bwptYWtlOiAqKiogW01ha2VmaWxlOjExMTU6IC5kb2NzX3N5c3RlbV9xZW11LjFfZG9jc19zeXN0
ZW1fcWVtdS1ibG9jay1kcml2ZXJzLjdfZG9jc19zeXN0ZW1fcWVtdS1jcHUtbW9kZWxzLjcuc2Vu
dGluZWwuXSBFcnJvciAyCm1ha2U6ICoqKiBEZWxldGluZyBmaWxlICcuZG9jc19zeXN0ZW1fcWVt
dS4xX2RvY3Nfc3lzdGVtX3FlbXUtYmxvY2stZHJpdmVycy43X2RvY3Nfc3lzdGVtX3FlbXUtY3B1
LW1vZGVscy43LnNlbnRpbmVsLicKbWFrZTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9i
cy4uLi4KbWFrZTogKioqIFtNYWtlZmlsZToxMTA0OiBkb2NzL3N5c3RlbS9pbmRleC5odG1sXSBF
cnJvciAyClRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToKICBGaWxlICIuL3Rlc3Rz
L2RvY2tlci9kb2NrZXIucHkiLCBsaW5lIDY2NCwgaW4gPG1vZHVsZT4KICAgIHN5cy5leGl0KG1h
aW4oKSkKLS0tCiAgICByYWlzZSBDYWxsZWRQcm9jZXNzRXJyb3IocmV0Y29kZSwgY21kKQpzdWJw
cm9jZXNzLkNhbGxlZFByb2Nlc3NFcnJvcjogQ29tbWFuZCAnWydzdWRvJywgJy1uJywgJ2RvY2tl
cicsICdydW4nLCAnLS1sYWJlbCcsICdjb20ucWVtdS5pbnN0YW5jZS51dWlkPTU4M2IxMGUxOTJk
ODQxZWE5ODVmZTk0NzRlOWNjZTViJywgJy11JywgJzEwMDMnLCAnLS1zZWN1cml0eS1vcHQnLCAn
c2VjY29tcD11bmNvbmZpbmVkJywgJy0tcm0nLCAnLWUnLCAnVEFSR0VUX0xJU1Q9eDg2XzY0LXNv
ZnRtbXUnLCAnLWUnLCAnRVhUUkFfQ09ORklHVVJFX09QVFM9JywgJy1lJywgJ1Y9JywgJy1lJywg
J0o9MTQnLCAnLWUnLCAnREVCVUc9JywgJy1lJywgJ1NIT1dfRU5WPScsICctZScsICdDQ0FDSEVf
RElSPS92YXIvdG1wL2NjYWNoZScsICctdicsICcvaG9tZS9wYXRjaGV3Mi8uY2FjaGUvcWVtdS1k
b2NrZXItY2NhY2hlOi92YXIvdG1wL2NjYWNoZTp6JywgJy12JywgJy92YXIvdG1wL3BhdGNoZXct
dGVzdGVyLXRtcC00MXhiN2JlXy9zcmMvZG9ja2VyLXNyYy4yMDIwLTA0LTIzLTA1LjA5LjU2LjEw
MjQ4Oi92YXIvdG1wL3FlbXU6eixybycsICdxZW11OmZlZG9yYScsICcvdmFyL3RtcC9xZW11L3J1
bicsICd0ZXN0LWRlYnVnJ10nIHJldHVybmVkIG5vbi16ZXJvIGV4aXQgc3RhdHVzIDIuCmZpbHRl
cj0tLWZpbHRlcj1sYWJlbD1jb20ucWVtdS5pbnN0YW5jZS51dWlkPTU4M2IxMGUxOTJkODQxZWE5
ODVmZTk0NzRlOWNjZTViCm1ha2VbMV06ICoqKiBbZG9ja2VyLXJ1bl0gRXJyb3IgMQptYWtlWzFd
OiBMZWF2aW5nIGRpcmVjdG9yeSBgL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLTQxeGI3YmVf
L3NyYycKbWFrZTogKioqIFtkb2NrZXItcnVuLXRlc3QtZGVidWdAZmVkb3JhXSBFcnJvciAyCgpy
ZWFsICAgIDNtMzAuMjMycwp1c2VyICAgIDBtOC40NTdzCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWls
YWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIwMDQyMzA5MDExOC4xMTE5OS0xLWdl
ZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlL3Rlc3RpbmcuYXNhbi8/dHlwZT1tZXNzYWdlLgotLS0KRW1h
aWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9y
Zy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNv
bQ==
