Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DDC03B7AB3
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jun 2021 01:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234990AbhF2X3a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Jun 2021 19:29:30 -0400
Received: from ixit.cz ([94.230.151.217]:40952 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233329AbhF2X3a (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 29 Jun 2021 19:29:30 -0400
Received: from [192.168.1.138] (unknown [94.230.151.217])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id EAF5923B1D;
        Wed, 30 Jun 2021 01:26:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1625009220;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CwZJ/Zww3Gz8ZSTkzyqH1tP2M1zzvjIhw8ad1IKbRS8=;
        b=jFMMqAipS82XokxGHYORsn5/RAIDqyEscbedyHroFM1BS0KcrSAY+La2xpiWLzjcQn0Ca2
        UuGz4QUWb9pTqdYLAD2XEUF1eFQm4wX7js/2uvuAztsQKwJb8KRP/5i7rWUhPmMNDmsnyx
        GQql0/cRmUrNRQ/NV6V/3As0IOCo3Vo=
Date:   Wed, 30 Jun 2021 01:26:15 +0200
From:   David Heidelberg <david@ixit.cz>
Subject: Re: (probably) Qualcomm PM8xxx PMIC chips driver issue in 5.10+
 kernel
To:     Linus Walleij <linus.walleij@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        linux-gpio@vger.kernel.org, dianders@chromium.org,
        mkshah@codeaurora.org, swboyd@chromium.org,
        gregkh@linuxfoundation.org
Message-Id: <R3LHVQ.51D68IW9A14U3@ixit.cz>
In-Reply-To: <5B3HVQ.XR62REW2D4KQ1@ixit.cz>
References: <5B3HVQ.XR62REW2D4KQ1@ixit.cz>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I did bisection and it lead me to the commit

pinctrl: qcom: Don't clear pending interrupts when enabling
39afef8a282b8ce63edb8d2ceb8a71e5440de059 for 5.10 (equal to=20
cf9d052aa6005f1e8dfaf491d83bf37f368af69e for upstream)

adding people into CC, I assume it's possible it just uncovers=20
different issue, but reverting it makes 5.10.y usable.

Thank you
David


On Tue, Jun 29 2021 at 19:01:53 +0200, David Heidelberg <david@ixit.cz>=20
wrote:
> Hello,
>=20
> between kernel 5.9 and 5.10 got Linux on Nexus 7 2013 broken and it=20
> seems to be related to the Qualcomm PM8xxx PMIC chips driver.
> I=FFm using kernels based on stable series, enhanced with few small=20
> patches, to make Nexus 7 work (based on John Stultz patches and few=20
> reverts in GPU area).
>=20
> Originally I suspected workaround =B4HACK: irq: Request and release=20
> resources for chained IRQs=A1, but without that patch it crashes even=20
> sooner.
>=20
> With Brian Masney we checked IRQ chip hierarchy (against kernel 5.4)=20
> and it seems to be working properly.
>=20
> 5.9
> - dmesg [1]
> - source code [2]
> - /proc/interrupts/ [3]
> 5.10
> - dmesg [4]
> - source code [5]
>=20
> Thank you for any ideas!
> David
>=20
> [1]=20
> https://paste.sr.ht/~okias/c03c8612f10d7082ce4285f21f1a87860cfa7ddf
> [2] https://github.com/okias/linux/tree/qcom-apq8064-v5.9
> [3]=20
> https://paste.sr.ht/~okias/cc4569f73b06b21af7b8df927564e22245987ce2
> [4]=20
> https://paste.sr.ht/~okias/8cdbbdc7e4f476f1690b4a31093dbb4c19c9dc30
> [5] https://github.com/okias/linux/tree/qcom-apq8064-v5.10
> Best regards
> David Heidelberg
>=20


