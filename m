Return-Path: <linux-gpio+bounces-7084-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E08CB8D8882
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 20:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A1921C21C12
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 18:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3E91384B3;
	Mon,  3 Jun 2024 18:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="OU1e1pZU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B458219E8
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 18:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717438824; cv=none; b=QungwICis6lrKEdJfZlHtFqBd6vS7eBFXzrn8JUBhix25g0MmyNgEs0oEsZpchz1wmVEB0ASoSGoJ6UcuOCjIQCGfmnyuxhmnS1u3p/9IAuqa846hUz+hkspDZBTdVJnYi0HBBtkc50fWPIbWCiw6mawRJgatV+RPqLEPUr6LoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717438824; c=relaxed/simple;
	bh=P4y1PcJNsD1asujoTElXfHs92xT6aaL4JMRc56G2aFw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AkkonG5puksIxYenr4DxDNCHb+bZN7zSpA+zd4wQ/m9U1X7Wpr6Fdph6Mk1aIUbksurQsELLgFJnbeGQjbYK+JRmLUAd7vdiBdDQ90ku/wxp/aQqfbS5aWrqo4kE6gruhPILb18xg8QS34VLodRVm788cQqp3NNiP5Ri/HSpZfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=OU1e1pZU; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1717438810; x=1718043610; i=wahrenst@gmx.net;
	bh=hhK6Is3cDAiDl4ndjZfZ42wPw5HnZ06D3SDVvba8LHQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OU1e1pZUVbXIIPXGwQsdMLDKc4z/1rEGlSVGt2cgJsdOOfyV/TDMhuMmKc7jGjy5
	 Xwi26iSV4tnJQZilbUy9BY7pOrJ5q4NEU2BpvGozIkubK6DjDlAioETesycX61BOO
	 SmsxZnQIQtNwX6r7wYqx/XW+PMvqT64Ux2T9nBK6Lc8c6FbJXc78+tMic9/Il4zqV
	 evfitpRZNCGUWBYqzpmAeQa+p4r7YI1MwSWrjhxoBuoCbNA3nL6n3QwIBQM+6pBNy
	 4GUKGcUiYQqnQMv4K/TvR0DacGLaI2RepFnGHVnYUDHEdsP8pENFYSv6t2d0jO8Qo
	 lxfPqgTNWApON76S5A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCsPy-1sN1zd3r5k-00CEDP; Mon, 03
 Jun 2024 20:20:10 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Phil Elwell <phil@raspberrypi.com>,
	Kent Gibson <warthog618@gmail.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 2/2] pinctrl: bcm2835: Use string_choices API instead of ternary operator
Date: Mon,  3 Jun 2024 20:19:38 +0200
Message-Id: <20240603181938.76047-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240603181938.76047-1-wahrenst@gmx.net>
References: <20240603181938.76047-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HDl2Ih3YeCwkBD/w1c8HQ/NTCcphaAxOv086EBo71k6RNdpDxns
 b//+NXHLxh85/NxzXu2i7+vooAf25IOVRIitJXx3hqwuoNYURPZad76lrlZlX1irt7xv2ux
 f0v1MUKrSZEU9v1oufpV3OmqoY9Gf+h8l1lQSPD2Yol4MFOEJCqLVPaBaDd/LhP2x8FWovQ
 Axc0tRTbkN8RWyeb3NpdQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SfMnocnIi48=;Xe6eCxEVPHu6wbf8r/kjTuWcNqK
 yZLs/iHFnEn/isxLFZ7HySmAhWY620ZWYF+bBwAE2WiMt4hw306Py11aMiq5awIeovx9Vm51S
 hSjWZM+g+LdV89bBIJJe1xMUGm5TB29OwsmYo2wY5mAAV8kP7p2MD5F068bsPIaZz0nt/xnev
 87QgfxyL5aF3TcfUWekwb1j6DvnoaMY1h8tN9hZsrgeIo43RBo4p+hENCzE3ieSY1sDtrxj0+
 LWT3ZqO88ZHSJqMtCmBvKb1qILN5kI6729KRzbdENBtmYgdM3QJewe4c2yk3cnvqj9A5JkxUT
 XtBfDOz/gxt9Gj1LA6QqEtCvt53VoQ3dHm/MOoX3DXah+GC4NGNeoCp/3Iu0mo9P0GgzW/Soy
 IyV2yZUaCY1KhIwicRiasZ6QTHL+k9Vqwr8fKcjN08zv2AzjARG4N8PqclFI75Wur9frYUJKC
 iZyYxSeuB4r/NxqwT/1k7WMxfCs838ifrDMmIRmWDRvUmCUg404k5Y62JFbqmggvmBXPbY9PS
 ob+0WweDYzOvWkEtDA7gd8xldc73a5LpeGL8AHxLcDPId4nNkQd8xMq9dR74qM/9a0vxDFiZh
 UWICf1DTQMCgm+iwVd8VnqknQ2hgLnLBpX8KqqodoOWur16o77DISNZpwCz2VGMSqXhHAX78q
 ZSwxlvuY7oLU9ww4vAtRYgev16qoNzW0l6ylg/nhIhtxHb89xfZwwGa9IuhpDHzBT+05CcJY3
 BZ6KGtFSPWlvGYOjHjPjJqi66Dos9AYeju8wX46VqhPcHRjdTAHC3d+wnOeJEWYyFKpmCKSZJ
 AM6NVxgnC3o9P+5ijQUA0ZuZeCY2UNVPtM4kRtarTZzwk=

Use modern string_choices API instead of manually determining the
output using ternary operator.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/p=
inctrl-bcm2835.c
index 27fd54795791..184641e221d4 100644
=2D-- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -34,6 +34,7 @@
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 #include <linux/types.h>
 #include <dt-bindings/pinctrl/bcm2835.h>

@@ -752,7 +753,7 @@ static void bcm2835_pctl_pin_dbg_show(struct pinctrl_d=
ev *pctldev,
 	int irq =3D irq_find_mapping(chip->irq.domain, offset);

 	seq_printf(s, "function %s in %s; irq %d (%s)",
-		fname, value ? "hi" : "lo",
+		fname, str_hi_lo(value),
 		irq, irq_type_names[pc->irq_type[offset]]);
 }

@@ -1428,7 +1429,7 @@ static int bcm2835_pinctrl_probe(struct platform_dev=
ice *pdev)
 	}

 	dev_info(dev, "GPIO_OUT persistence: %s\n",
-		 persist_gpio_outputs ? "yes" : "no");
+		 str_yes_no(persist_gpio_outputs));

 	return 0;

=2D-
2.34.1


