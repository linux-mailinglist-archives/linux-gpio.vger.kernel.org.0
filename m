Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC236F91D
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 07:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727360AbfGVF4E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 01:56:04 -0400
Received: from mout.gmx.net ([212.227.17.20]:43361 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725811AbfGVF4E (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 01:56:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563774936;
        bh=dzdr53EkDfSZtFiMzw7a6OARSi94GiDFaqLyZtNfIl4=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Zoy6CrDzGb0Z257hg8xs0g4en5VEPmyESBYKfH+Cj+CsdxJYV1SqQsXjLJa0wxSaS
         KWIIcthQ96sN/IK/kUtssbyxRPfANK2ZQxlGtSK3QTuJOM5gRO89c/WF4mP5VcMOG0
         ootWrmBjktFZLjczcpg/AJTA78QFdckNAQ9k4fZM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.98]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MFz0E-1hbjeY0XRe-00Eqxb; Mon, 22
 Jul 2019 07:55:36 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Matthias Brugger <mbrugger@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org, Phil Elwell <phil@raspberrypi.org>,
        Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 02/18] ARM: bcm2835: DMA can only address 1GB
Date:   Mon, 22 Jul 2019 07:54:33 +0200
Message-Id: <1563774880-8061-3-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
References: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:3KYnU+KY93ySQbXoN6a7vr1jZuSLg8oR5n1EsXsNkt36rd20DMS
 VBwjTacicgyaL4favnKV7k4PUTLCz84tq75/L+aTV3VtqhtKZBCLf/tqnwY7FPBwUWhLzBa
 6eSsLC+RleLIhpzKaVqw1B/UE7GF8EVGriMPREiCsX69eLwypHAnQpaiIJsA6YsG44K3Yv+
 Pm4jcJw9o3l0kKerr3tqA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:P4wBPLw9+NM=:GFs+lWv7RZDpBlDQGOMwSf
 Hl30jJQScoNLQ6Ir/S88NdNWLIdXPDdkwQdv9dc2oFCKRJmet6i6ksHMc2S9dRbKniQF4bI1t
 yVcUfXwKZsNXTjPUMhEvj2eIoXUIO7IPRnOjuHflFhmRtiot04fdXW/9MzD9T3Cjnu8w/QyFf
 AvTNO8F4JVS8y46dtCYJGZGpAZno1kWv/Fz/9mfCioH3XvkxSKvhz2L0/CsMyVWcFTRyPwvBz
 1BFLG3YLUX6P8DiJHjMy66AyWSOjANq/ojzkF4LVdLGUNKxAOnGZn0941kYtkyF2V0bkIW0J3
 aSUpU79SbqN3KLczP7ceacUt5ZsmDH6WGWhHKvP4cM5HRgdRT5fn4gBtEbyq2wyK1uLi/EOyp
 7NC5ijRHALHKZwKR5Wq5Ao5+AK5CTPlkKeR7+JEEkCrwTrWxTnOW+VhY8jUNAtdlkZ3yZSuhK
 X1t8ZjrXVybxl907t1/GkBb5EjkC6Sj62kkPfx9nKq8Ra2TVAZo+0ww4XHNVFvDfWxxSW2j9z
 L9nbbMBrpN6WslJAtCf2aBX0ii4sT1629K5qbP6nfPbjKOJqW5pJdHGIGUpivkRfOmE/ft6Se
 EDZQDNGNBznpsIfat5aNE9EZi4J4ivGs4fspOf51lWBwLFLkCA0f+P5Qn1ZtFhR+sZNc8K80x
 CHmpq1jnxNDs/RzXga1OoqM5lb/Urn845rccq1D1WY6o9EiuywVa9nCTZUES8ETXkW45F3tCQ
 ZyKndUdnPXu254beD7lyVSBkQeO6DodhR1nbtmSR4d8HMbrsIHfN3pnD7uYRgu92Zwm5r2xnD
 HL3CLpqeHJtyH6v4gA67BErm9t/zhGg25IxsH03iT6l0/xUWwUE0LGtM3vPj03vLATI1naGrh
 pdNOcDPXgI6MtJ8brbApn61dNqNjluyy+Jlr8ICZEoGa2biKBS5Wp2jaElaPBdp2Jy6Pk9mKh
 ueBYlJnX7YwYwmAoFTQvDIgcn077DIejGFeTJzhYQrZfsO7TSDhgR2ayen/ofMuyd5fNc4Fln
 Htbmm6rfIHFIr8ZjvOuFoaVvgKXKT76vD1M667L6/zkcHHhTZwbOUm0l/h+h59zuJzF8ThEzN
 LOSgChzoqBan3c=
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Phil Elwell <phil@raspberrypi.org>

The legacy peripherals on BCM2711 & BCM2835 can only address the
first gigabyte of RAM, so ensure that DMA allocations are restricted to
that region.

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 arch/arm/mach-bcm/board_bcm2835.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-bcm/board_bcm2835.c b/arch/arm/mach-bcm/board_b=
cm2835.c
index bfc556f..d2b31a9 100644
=2D-- a/arch/arm/mach-bcm/board_bcm2835.c
+++ b/arch/arm/mach-bcm/board_bcm2835.c
@@ -24,6 +24,7 @@ static const char * const bcm2835_compat[] =3D {
 };

 DT_MACHINE_START(BCM2835, "BCM2835")
+	.dma_zone_size	=3D SZ_1G,
 	.dt_compat =3D bcm2835_compat,
 	.smp =3D smp_ops(bcm2836_smp_ops),
 MACHINE_END
=2D-
2.7.4

