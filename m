Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 918F51F83BE
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2020 16:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgFMOjS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Jun 2020 10:39:18 -0400
Received: from mout.web.de ([217.72.192.78]:46413 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726475AbgFMOjS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 13 Jun 2020 10:39:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1592059156;
        bh=kgUISOdMmKx80S+QsK7f1L5ztAZevv9Jr71ZumikE6I=;
        h=X-UI-Sender-Class:From:Subject:To:Cc:Date;
        b=sljE+VljuPG5krFC9B/TACFE/+z3Ecr/6GoyCxKfD/s9c/4jZ1Bp5MdRjHKvti6Fa
         u6oolWiU/dR8WS5XcXqz5qQ0omILdOj8Wo0TZCUvd4ha25i350WW9mFAoQ4kYEo4z+
         uRKlAZ7AOSLszu8OJdqWRG2g5eaIq7p6Ik2wPz78=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.53.180]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MEVlN-1jiBNV1Izp-00FkiM; Sat, 13
 Jun 2020 16:39:16 +0200
From:   Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] gpio: pca953x: Add support for the PCAL9535
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-ID: <53b5504b-dd06-c1d5-5334-d4c5525eca93@web.de>
Date:   Sat, 13 Jun 2020 16:39:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:d9OK0faWmrTbCao89AP45VVSNUvQ/hFJ4bgkLEx/Ype64hIF7e2
 0PZ66VftVkZzWXS/81kqmYnI3RFGJ9LHPzDn4E4n4PIXc5ex187Vzuf8ayT1oWmoSW6WysY
 5eBdKCqkCBlh40McJbO2SQh8RwGLL7OJKZ0VIIjF96ImjIromF/hLlkaQ3JakvdYH4vFKsu
 8GAq6Fwh15vEFxy8pkwlw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Grak4s5uaFU=:/HIgdIHfojvFVETLmKW3bW
 sN05GIJJ44vVeFtfb/Iq0GedwG9UDnAm8AkQbSr9t6zXvbnE+FuidfANwm937G3rVEey60otv
 91ZQ+v5kpd2vLCooA3lOp6rpb/FTPYeeQbLKuB+XNbmYhfXX++T7EUlUeEEMQgY3jYdcdot2S
 QmaCKfWm3PKa+o1fqx8ixFw2OPrSJv92PeYG5aw2bcFfSKTXbvE0iWWqD7N6R8FmvpUlHoni9
 Z/s+kiwQEYBb9rjscz+B8sj8K1PDTPK1RyuNjZIlDTbZzn+5VkVEi3ZEyN2IS3eY2phpIop2z
 YBdURmzn6tTT6Yx9OlcVUgIwBEHtASif8v0AZJbcaK7KaGgCdq2yonFIq8Clh7WsZuA2p0wrD
 JVXSV1Ju8GkEyzDWbITToBB32hW7QYpyG3RUcSbQ/EV9ev54LidixEjvjvXikkvgNrA69FfPa
 1GhaXtkNC078VYxjudBlnOgdi9l27vraNpL6yZUv/qeaJEv//RbEps8zI9Wzq4lTtPhhEeBeh
 wPXydSfNoA5OOOUXlLjzhlHjogpNPF0mlZtifdeBrKa9tA5UzZYuuD+6wfkn1BLJ1JWspWzRI
 W71ETUpwphxODtLynTgUD4hkv1qyvyY3S5zdQsvmsdUx4pM2SjRIAsJtbkTBOVZ+Z1/vgxNtl
 WwjUM70R8821M9apjOl5QMgIAMcYpeBm9Hw+PWB0u/dg5MIuJuoXfEYwPJwlcqwu5+YPmIJT4
 YlX/K/+fuYdvUvxyiTQYTWdabmW/bS4lSu1okzaHRsKOT4R8b4m06+AtmtizdEW9GDsm2UlOa
 M5mXfkB3AOm9yu+XITFgnYL2rFpchUIRaLiXBC0lAF4i13pYusand76434T9aelFUWd0zm0JY
 6BOfcfQgqIbv1tZN14CoG/7Hlf3QVY/dbs1OGgEhTbt1HVAuIMmvanS1Z1XbSHJj45fIkYw8R
 dVhCJqIQG0GASOVsV70RXX1tHZANB4m3hw/J0J5kDt4v9Xw6TE6xhorHnKSZ4ooN4npBoOuwl
 kfzOpsYccdSIeII985Sccy5D7ittgTpAw4CUQRuEVYLb3Wa5r0JnTvlUFVlgbVTvcVAkjm3fy
 Cn903AoW2YxO3YRBauuC+IwsQpIkUtYfgVtV0NvDQZ+qjuJ1B5mGqsl0FOZy0+aUeoDZ0tT7z
 1ndU/dzeQZsBZwY55vkRYQGiJF8d7qbxVaKyXbSyk5ri4fJBzR6soTavELcpTmINHTlnxtj24
 75XLwPJ4fMuCYgwpv
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Jan Kiszka <jan.kiszka@siemens.com>

The PCAL9535 [1] is compatible to the PCA9535. Additionally, it comes
with interrupt support and input latching. Other features are not
supported by the GPIO subsystem.

[1] https://www.nxp.com/docs/en/data-sheet/PCAL9535A.pdf

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
=2D--
 drivers/gpio/gpio-pca953x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 1fca8dd7824f..34d635e51dda 100644
=2D-- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1131,6 +1131,7 @@ static const struct of_device_id pca953x_dt_ids[] =
=3D {
 	{ .compatible =3D "nxp,pca9505", .data =3D OF_953X(40, PCA_INT), },
 	{ .compatible =3D "nxp,pca9534", .data =3D OF_953X( 8, PCA_INT), },
 	{ .compatible =3D "nxp,pca9535", .data =3D OF_953X(16, PCA_INT), },
+	{ .compatible =3D "nxp,pcal9535", .data =3D OF_953X(16, PCA_LATCH_INT), =
},
 	{ .compatible =3D "nxp,pca9536", .data =3D OF_953X( 4, 0), },
 	{ .compatible =3D "nxp,pca9537", .data =3D OF_953X( 4, PCA_INT), },
 	{ .compatible =3D "nxp,pca9538", .data =3D OF_953X( 8, PCA_INT), },
=2D-
2.26.2

