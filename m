Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13F261B5862
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2020 11:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgDWJku (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Apr 2020 05:40:50 -0400
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21324 "EHLO
        sender4-of-o53.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbgDWJku (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Apr 2020 05:40:50 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1587634839; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=eWCkClE+UWycU8ui2qSK4t2Ja0l9vndbx4dXw8Kp7jvixexkMmwSPXaS1vNI9uLMiGguz71mJB59cZS3sRoFyWAtyWDJqcIAW0aWmaYGU/zTIfjvBr0zAPbYYVI35mXELNhpba7+4gbkZ8zh2J43G8QPSFAF8LYL/tt+Bn224YY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1587634839; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To; 
        bh=czaH0LMiDY4URh9rV+Em2xM0FjdarAbGzjU6sN564y8=; 
        b=ke0nsyrSJdHaP1AL2oJez72iss65VjAM/WD9dCY0t8MoOgloqi8XglOId1ItlGyzpjs7AlRYUNVN0icFcu/1WiZxiQnj4guUF+cthBhYw7ItcU5SoGe5Hg3iFQ6shyOJV8OSLk6NFy7OEG77dU8J/tHORstvpTl8DH+LhoEr8r4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        spf=pass  smtp.mailfrom=no-reply@patchew.org;
        dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
        with SMTPS id 1587634836986923.1533065848702; Thu, 23 Apr 2020 02:40:36 -0700 (PDT)
In-Reply-To: <20200423090118.11199-1-geert+renesas@glider.be>
Subject: Re: [PATCH QEMU v2 0/5] Add a GPIO backend
Reply-To: <qemu-devel@nongnu.org>
Message-ID: <158763483525.4520.16083031382332426221@39012742ff91>
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
Date:   Thu, 23 Apr 2020 02:40:36 -0700 (PDT)
X-ZohoMailClient: External
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDQyMzA5MDExOC4xMTE5
OS0xLWdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0
aGUgZG9ja2VyLW1pbmd3QGZlZG9yYSBidWlsZCB0ZXN0LiBQbGVhc2UgZmluZCB0aGUgdGVzdGlu
ZyBjb21tYW5kcyBhbmQKdGhlaXIgb3V0cHV0IGJlbG93LiBJZiB5b3UgaGF2ZSBEb2NrZXIgaW5z
dGFsbGVkLCB5b3UgY2FuIHByb2JhYmx5IHJlcHJvZHVjZSBpdApsb2NhbGx5LgoKPT09IFRFU1Qg
U0NSSVBUIEJFR0lOID09PQojISAvYmluL2Jhc2gKZXhwb3J0IEFSQ0g9eDg2XzY0Cm1ha2UgZG9j
a2VyLWltYWdlLWZlZG9yYSBWPTEgTkVUV09SSz0xCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1taW5n
d0BmZWRvcmEgSj0xNCBORVRXT1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCiAgQ0MgICAg
ICBody9hY3BpL2dlbmVyaWNfZXZlbnRfZGV2aWNlLm8KICBDQyAgICAgIGh3L2FjcGkvaG1hdC5v
CgpXYXJuaW5nLCB0cmVhdGVkIGFzIGVycm9yOgovdG1wL3FlbXUtdGVzdC9zcmMvZG9jcy8uLi9x
ZW11LW9wdGlvbnMuaHg6ODgxOlVuZXhwZWN0ZWQgaW5kZW50YXRpb24uCiAgQ0MgICAgICBody9h
Y3BpL2FjcGlfaW50ZXJmYWNlLm8KICBDQyAgICAgIGh3L2FjcGkvYmlvcy1saW5rZXItbG9hZGVy
Lm8KLS0tCiAgQ0MgICAgICBody9hY3BpL3BjaS5vCiAgQ0MgICAgICBody9hY3BpL2lwbWkubwog
IENDICAgICAgaHcvYWNwaS9hY3BpLXN0dWIubwptYWtlOiAqKiogW01ha2VmaWxlOjExMTU6IC5k
b2NzX3N5c3RlbV9xZW11LjFfZG9jc19zeXN0ZW1fcWVtdS1ibG9jay1kcml2ZXJzLjdfZG9jc19z
eXN0ZW1fcWVtdS1jcHUtbW9kZWxzLjcuc2VudGluZWwuXSBFcnJvciAyCm1ha2U6ICoqKiBEZWxl
dGluZyBmaWxlICcuZG9jc19zeXN0ZW1fcWVtdS4xX2RvY3Nfc3lzdGVtX3FlbXUtYmxvY2stZHJp
dmVycy43X2RvY3Nfc3lzdGVtX3FlbXUtY3B1LW1vZGVscy43LnNlbnRpbmVsLicKbWFrZTogKioq
IFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KCldhcm5pbmcsIHRyZWF0ZWQgYXMgZXJy
b3I6Ci90bXAvcWVtdS10ZXN0L3NyYy9kb2NzLy4uL3FlbXUtb3B0aW9ucy5oeDo4ODE6VW5leHBl
Y3RlZCBpbmRlbnRhdGlvbi4KbWFrZTogKioqIFtNYWtlZmlsZToxMTA0OiBkb2NzL3N5c3RlbS9p
bmRleC5odG1sXSBFcnJvciAyClRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToKICBG
aWxlICIuL3Rlc3RzL2RvY2tlci9kb2NrZXIucHkiLCBsaW5lIDY2NCwgaW4gPG1vZHVsZT4KICAg
IHN5cy5leGl0KG1haW4oKSkKLS0tCiAgICByYWlzZSBDYWxsZWRQcm9jZXNzRXJyb3IocmV0Y29k
ZSwgY21kKQpzdWJwcm9jZXNzLkNhbGxlZFByb2Nlc3NFcnJvcjogQ29tbWFuZCAnWydzdWRvJywg
Jy1uJywgJ2RvY2tlcicsICdydW4nLCAnLS1sYWJlbCcsICdjb20ucWVtdS5pbnN0YW5jZS51dWlk
PWRiMDg1ZDVmZDBjNDRjMWZhNjAxNmJlNmUzMjM1MzBkJywgJy11JywgJzEwMDMnLCAnLS1zZWN1
cml0eS1vcHQnLCAnc2VjY29tcD11bmNvbmZpbmVkJywgJy0tcm0nLCAnLWUnLCAnVEFSR0VUX0xJ
U1Q9JywgJy1lJywgJ0VYVFJBX0NPTkZJR1VSRV9PUFRTPScsICctZScsICdWPScsICctZScsICdK
PTE0JywgJy1lJywgJ0RFQlVHPScsICctZScsICdTSE9XX0VOVj0nLCAnLWUnLCAnQ0NBQ0hFX0RJ
Uj0vdmFyL3RtcC9jY2FjaGUnLCAnLXYnLCAnL2hvbWUvcGF0Y2hldzIvLmNhY2hlL3FlbXUtZG9j
a2VyLWNjYWNoZTovdmFyL3RtcC9jY2FjaGU6eicsICctdicsICcvdmFyL3RtcC9wYXRjaGV3LXRl
c3Rlci10bXAtZHMwcm5yaGovc3JjL2RvY2tlci1zcmMuMjAyMC0wNC0yMy0wNS4zNy40NC4zMTU0
MzovdmFyL3RtcC9xZW11Onoscm8nLCAncWVtdTpmZWRvcmEnLCAnL3Zhci90bXAvcWVtdS9ydW4n
LCAndGVzdC1taW5ndyddJyByZXR1cm5lZCBub24temVybyBleGl0IHN0YXR1cyAyLgpmaWx0ZXI9
LS1maWx0ZXI9bGFiZWw9Y29tLnFlbXUuaW5zdGFuY2UudXVpZD1kYjA4NWQ1ZmQwYzQ0YzFmYTYw
MTZiZTZlMzIzNTMwZAptYWtlWzFdOiAqKiogW2RvY2tlci1ydW5dIEVycm9yIDEKbWFrZVsxXTog
TGVhdmluZyBkaXJlY3RvcnkgYC92YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC1kczBybnJoai9z
cmMnCm1ha2U6ICoqKiBbZG9ja2VyLXJ1bi10ZXN0LW1pbmd3QGZlZG9yYV0gRXJyb3IgMgoKcmVh
bCAgICAybTQ1LjY5OXMKdXNlciAgICAwbTcuNDc2cwoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFi
bGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMDA0MjMwOTAxMTguMTExOTktMS1nZWVy
dCtyZW5lc2FzQGdsaWRlci5iZS90ZXN0aW5nLmRvY2tlci1taW5nd0BmZWRvcmEvP3R5cGU9bWVz
c2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBz
Oi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRl
dmVsQHJlZGhhdC5jb20=
