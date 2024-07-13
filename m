Return-Path: <linux-gpio+bounces-8202-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AF99305D9
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jul 2024 16:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA727B219C3
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jul 2024 14:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7FD13A24A;
	Sat, 13 Jul 2024 14:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="qcI3imhd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588DB130486;
	Sat, 13 Jul 2024 14:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720880135; cv=none; b=W8aT56wHHVonujWXQtED1iMQV4aAFbkkfw4a3f7llBlCJGiCyZGxaWBo+C5WWmkN+e62BUwios9RA7ppeUPzHV+/OTAvtrTtNbhbQpozmdOnZ04e/3xVXoA60qUcOSvsjhML4ZUv0VZ2YvTw7hEx8i7cN5b3i1pdUqvN9N9suSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720880135; c=relaxed/simple;
	bh=0sImha/N/FjIHW7HwE6mq+4I+YE1wV6jEPOuW++u+5c=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=t5t3Q+c7bed5yOtgG3rE9/rZRoqPuOof4Nwsby3PARCqStI0SuOBeclWKG6V+flyGU7wIOKJCwL3aMcNp3bKctNiCmk90gzBzsSsBqEpqaC/pbtN1JplobBM456UQ+RGs78esxsaGXeVL0ZvO/ODUE33KDFVyObyRws/kErh+wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=qcI3imhd; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1720880129; x=1721484929; i=markus.elfring@web.de;
	bh=i29h15iOs2DJLJvtpOSvAjE7y04Zre3BMYJI6oJamFY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=qcI3imhdJykTIHiWZu0ssEfdZ1/mw/PUoaBJ9elI6Be6kx0s8LCLQ5IAlGLvy7lX
	 9QDJjBnziEVDo84m73oCNE0gXfiRUal/1M3fBBIZDrjwku5GAgDb/rKTMxfZtuqCh
	 ANi75Pp9gsGXOby65rqzju9vSvaq9MGnOrWmINnu8BGRn72lITgNwDYAiKZweXb9L
	 oddnoFzVjqas2DuOIEiY/r8etWyMMOfNmiBFKBX8atxC3pKiCj1hE4X2YT6BBKC/h
	 4qxds/pBJFlfSPdHPISotjJoyAdeDSghhSV622WatWma3h/2zFBDOr6hzTmpMSGSB
	 P6Hz02zo4kBEAwzwaw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MtPrY-1sDi1934ik-00zRPT; Sat, 13
 Jul 2024 16:15:29 +0200
Message-ID: <3a52f0c5-85c5-4077-b6cd-504cc5383817@web.de>
Date: Sat, 13 Jul 2024 16:15:28 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] pinctrl: core: Use seq_putc() in three functions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FHsifFfV8fdhGzisDa9WcUVEOifIRIqKuxaDTVIeakwyofgPKn5
 weSW3384DZSLadx7B9H3CyTkodrPOW6s0T+/DF9PzZryG0kxw5Zyl+B3bYBuwDbcjxdib8+
 3JwLgL5SCowBv+q/boaj5o0FdG5rP78d4byfgzo2Rkx5hVo3yTn57v7tA2ulBoLpNhsyosk
 EwUHi1mR/ZCEfJvJzUhpw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mtI6PBGZhgY=;ZqXwS5/Omeym0uvpspkbO2My4rp
 HPCwn4GBg95rleyvoxsRRDUU7jhs/+39Vp00AR1qUmbPUVkfi2yzEeNqshm2K6QeUJxwiL207
 q3VdtNPvuvrmWv3WIz68WvPF8z5j1C8gxOeQn0p70xYNOzHyJyv/g5f+SjU71Uqglpy5OCDZ2
 739SRs3Ncg0SXTP9perMF86zwXHKvNdLPmhJIRG5lwZuex2k9zJumXdJaR3enuOMJ1MV1LFMF
 PCSzize4EUYBpGXodoTsQvwSWWkJX6aNJTevDMgsOVK0e+fPLZ0DnC8B10VlsF/lqhHc8mPf+
 ggeupk3x+ivRAy3xOtH66t6PYJzuz2HSO7VaW7DOPJSw09OhOq2AlpimG3pI4W8jR6FDTXJhZ
 msu76hT/KDs2oNHPtmxu5PMeW9RvJuZSKuqdDayEheqINvbsa/VYjEcEH3jBq7VH5529JSU60
 6KcS40B3Yfd9+hT2qaJ3tifnSzW6bxAIFOu9rPUcRVmg60hg//WQdsFX5lkdyikVT9A4Kcx4o
 PV78ZAVJeDWv21ioHrx39XvZle5Ypvtwe1K2g2OEI5PtmPjJ7V+Gdhb4vYbG5H4dC+utRBGwI
 mAQ5uSU9oHvybizyI8E1tkBWyEae/oJN76irwP7wBUU41FYslx5lu1ErxeExnwqK05k/nJ3WP
 ZpHIqvE1gE1yWjA+z1LeT4nlFH3ht6AIXyg25ER6agT7B7AUKq4SloeKkRmt+qhAhHjVIeS4Z
 GSEkur24MD6vzG69A+GiOssh04DaOGjN+d9FK0NiPCN+N75nBYxb0YnPGzXfIPiDXSeEJxhhx
 dB7kba3klrpmTl2joIuHKsqw==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 Jul 2024 16:10:31 +0200

Single characters (line breaks) should be put into a sequence.
Thus use the corresponding function =E2=80=9Cseq_putc=E2=80=9D.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/pinctrl/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 314ab93d7691..6d61101f488a 100644
=2D-- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1707,7 +1707,7 @@ static int pinctrl_pins_show(struct seq_file *s, voi=
d *what)
 		if (ops->pin_dbg_show)
 			ops->pin_dbg_show(pctldev, s, pin);

-		seq_puts(s, "\n");
+		seq_putc(s, '\n');
 	}

 	mutex_unlock(&pctldev->mutex);
@@ -1751,7 +1751,7 @@ static int pinctrl_groups_show(struct seq_file *s, v=
oid *what)
 				}
 				seq_printf(s, "pin %d (%s)\n", pins[i], pname);
 			}
-			seq_puts(s, "\n");
+			seq_putc(s, '\n');
 		}
 		selector++;
 	}
@@ -1814,7 +1814,7 @@ static int pinctrl_devices_show(struct seq_file *s, =
void *what)
 			seq_puts(s, "yes");
 		else
 			seq_puts(s, "no");
-		seq_puts(s, "\n");
+		seq_putc(s, '\n');
 	}

 	mutex_unlock(&pinctrldev_list_mutex);
=2D-
2.45.2


