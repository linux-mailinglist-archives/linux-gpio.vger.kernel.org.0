Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0511F5D74
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 23:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbgFJVAd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 17:00:33 -0400
Received: from office2.cesnet.cz ([195.113.144.244]:53124 "EHLO
        office2.cesnet.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbgFJVAd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2020 17:00:33 -0400
Received: from localhost (ip-78-45-211-110.net.upcbroadband.cz [78.45.211.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by office2.cesnet.cz (Postfix) with ESMTPSA id 6D71B40005D;
        Wed, 10 Jun 2020 23:00:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cesnet.cz;
        s=office2-2020; t=1591822830;
        bh=ERMntWN9UjaiQJ8NvnJoh1eqeIpyJiezv108wUzGr/U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=OtYRpIQM/+7muIUCPX4JV/bJ9j3jxyGrJSUA3je7SRpFkRH73ZRi82MPYAMHV8s08
         3eUWUGCOU4Y7kfpUrv2MDGRKdShjKQDAdKzrEBLHzJOfrevi3OvnGdcGEHo4qvLK5z
         xPN82KN+Jd8VPkq12DhGFOy2YvuofCrq1HutpWCGw56Tw/zbQQl4CcY49z38Asop2y
         0b4m8GNI7Sx+n1BW4Uzva6LtB849h8v+QZ/0hKTYErM+J+M+Kul0TyE5y+Rn/z/f9g
         rPoy3HCIlTrW80/VPRHdwAdKUx0hcg/QQ1ZacX2oDr2ua6T1qoed8wf6PgLG4tjmXd
         FM6WcN2QSKb/w==
From:   =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
To:     Thierry Reding <treding@nvidia.com>
Cc:     <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vidya Sagar <vidyas@nvidia.com>
Subject: Re: GPIO regression on mvebu and/or max310x since 2ab73c6d8323
Date:   Wed, 10 Jun 2020 23:00:30 +0200
MIME-Version: 1.0
Message-ID: <04568d62-d6ad-45f6-a00f-0ace83b73132@cesnet.cz>
In-Reply-To: <20200610080327.GA1805015@ulmo>
References: <8cffce08-ed84-4242-8dcd-72de693f0f71@cesnet.cz>
 <20200610080327.GA1805015@ulmo>
Organization: CESNET
User-Agent: Trojita/v0.7-412-g2869c385e; Qt/5.13.0; xcb; Linux; Gentoo Base System release 2.4.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> I think a good first step would be to try that reverting the change
> would actually fix the issue for you. Something like the below should do
> the trick.

That's indeed the case, reverting that commit makes everything work again=20
on 5.7.1. We have five other unrelated patches as well, our tree is=20
available at=20
https://gerrit.cesnet.cz/plugins/gitiles/github/torvalds/linux/+log/aabb023ef=
197c4b365a4404bca2fd8cd0c227835=20
.

> Also, can you point out which exact DTS file it is that you
> see this problem with?

It's armada-388-clearfog-base.dts, and we have some small additions on top=20=

of that. The only modification which looks relevant that we ship is:

/ {
        gpio_i2c {
                compatible =3D "i2c-gpio";
                sda-gpios =3D <&gpio0 25 (GPIO_ACTIVE_HIGH |=20
GPIO_OPEN_DRAIN)>;
                scl-gpios =3D <&gpio0 24 (GPIO_ACTIVE_HIGH |=20
GPIO_OPEN_DRAIN)>;
                i2c-gpio.delay-us =3D <1>;
                #address-cells =3D <1>;
                #size-cells =3D <0>;
        };
};

&uart1_pins {
        status =3D "disabled";
};

&uart1 {
        status =3D "disabled";
};

With kind regards,
Jan
