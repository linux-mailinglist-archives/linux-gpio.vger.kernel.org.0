Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31BEE11E027
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2019 10:04:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbfLMJEv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Dec 2019 04:04:51 -0500
Received: from zimbra2.kalray.eu ([92.103.151.219]:37358 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfLMJEv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Dec 2019 04:04:51 -0500
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 7C26027E0FF8;
        Fri, 13 Dec 2019 10:04:49 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id oTghcug-zDYp; Fri, 13 Dec 2019 10:04:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 447DD27E1025;
        Fri, 13 Dec 2019 10:04:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 447DD27E1025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1576227888;
        bh=YbT6pQyDPlpE+GVVX0wl0vX9pyh+DxB2qE6TYF3nbGk=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=VwkjP4XaxfogLWOEwImB8DT5kHh6DTipWmZcNlg0zKKZN3Xtfo9xao5NO4RpQf4gi
         1N8525L8NtviJqpMAMp4JVC9drbVSjhJfp219lnVT117ybvaWeploErA9UjIQG/t7V
         KdLxNsnCmMAr16wsBwsR6nFV2dMb7yaJbNnVM7s8=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id QiA5EynfsNfZ; Fri, 13 Dec 2019 10:04:48 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 2AEE127E0FF8;
        Fri, 13 Dec 2019 10:04:48 +0100 (CET)
Date:   Fri, 13 Dec 2019 10:04:48 +0100 (CET)
From:   =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalray.eu>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        "open list, GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <695291639.96501294.1576227887986.JavaMail.zimbra@kalray.eu>
In-Reply-To: <CACRpkdbHGitYzwVEVYLUmaE+Qn0ix1O1bOSjoTJomf+h9b4+rg@mail.gmail.com>
References: <20191204101042.4275-1-cleger@kalray.eu> <CACRpkdbHGitYzwVEVYLUmaE+Qn0ix1O1bOSjoTJomf+h9b4+rg@mail.gmail.com>
Subject: Re: [PATCH 0/5] Add pinctrl support for dwapb gpio driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [192.168.40.202]
X-Mailer: Zimbra 8.8.12_GA_3794 (ZimbraWebClient - GC75 (Linux)/8.8.12_GA_3794)
Thread-Topic: Add pinctrl support for dwapb gpio driver
Thread-Index: SRXaXJiVFyFDIZi2qjVcUnwBi2wsHQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Ok thanks for your review, I will do that.

Regards,

Cl=C3=A9ment L=C3=A9ger

----- On 13 Dec, 2019, at 09:59, Linus Walleij linus.walleij@linaro.org wro=
te:

> On Wed, Dec 4, 2019 at 11:10 AM Clement Leger <cleger@kalray.eu> wrote:
>=20
>> Synopsys DWAPB IP includes support for pin control. This control is basi=
c
>> and allows to switch between a hardware and a software function.
>> Software function is when driving GPIOs from IP and hardware is controll=
ed
>> by external signals.
>> This serie export necessary interface to be able to move the driver to
>> pinctrl folder and then implement the pinctrl support which is based on =
the
>> digicolor driver. The idea is to avoid hardcoding pins in driver since
>> this IP is a generic one available on multiple SoC.
>=20
> The overall approach is correct, just tidy up the patch series the
> way indicated by Andy and we can probably proceed efficiently with
> this. I will review the patch adding the pinctrl interfaces separately.
>=20
> Yours,
> Linus Walleij
