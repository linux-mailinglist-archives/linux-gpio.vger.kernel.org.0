Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E89C3B76F7
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jun 2021 19:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233710AbhF2ROR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Jun 2021 13:14:17 -0400
Received: from [94.230.151.217] ([94.230.151.217]:40562 "EHLO ixit.cz"
        rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
        id S233688AbhF2ROQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 29 Jun 2021 13:14:16 -0400
X-Greylist: delayed 549 seconds by postgrey-1.27 at vger.kernel.org; Tue, 29 Jun 2021 13:14:16 EDT
Received: from [192.168.1.138] (ixit.cz [94.230.151.217])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id E425623B1D;
        Tue, 29 Jun 2021 19:02:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1624986159;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=9nepNQgnYIeaGwCjLf//mALG04tS3kAHhxPzPGr1wYs=;
        b=WTW28FATE2GZpCnariOSOjcS6TpG3wpea7wA17wu9TtBizZfsXYSGW4jJARAaka4FbaqT2
        moTUanQdJvKfkpkIVSjlNaennxazV/dpgQxJVTlnw+Bd1z6C3kifcFDxWfjmvmS+y8iIZu
        NrtcFxl6ViiZ9byxa8z9VPcbI1Q6eIg=
Date:   Tue, 29 Jun 2021 19:01:53 +0200
From:   David Heidelberg <david@ixit.cz>
Subject: (probably) Qualcomm PM8xxx PMIC chips driver issue in 5.10+ kernel
To:     Linus Walleij <linus.walleij@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        linux-gpio@vger.kernel.org
Message-Id: <5B3HVQ.XR62REW2D4KQ1@ixit.cz>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

between kernel 5.9 and 5.10 got Linux on Nexus 7 2013 broken and it=20
seems to be related to the Qualcomm PM8xxx PMIC chips driver.
I=FFm using kernels based on stable series, enhanced with few small=20
patches, to make Nexus 7 work (based on John Stultz patches and few=20
reverts in GPU area).

Originally I suspected workaround =B4HACK: irq: Request and release=20
resources for chained IRQs=A1, but without that patch it crashes even=20
sooner.

With Brian Masney we checked IRQ chip hierarchy (against kernel 5.4)=20
and it seems to be working properly.

5.9
 - dmesg [1]
 - source code [2]
 - /proc/interrupts/ [3]
5.10
 - dmesg [4]
 - source code [5]

Thank you for any ideas!
David

[1] https://paste.sr.ht/~okias/c03c8612f10d7082ce4285f21f1a87860cfa7ddf
[2] https://github.com/okias/linux/tree/qcom-apq8064-v5.9
[3] https://paste.sr.ht/~okias/cc4569f73b06b21af7b8df927564e22245987ce2
[4] https://paste.sr.ht/~okias/8cdbbdc7e4f476f1690b4a31093dbb4c19c9dc30
[5] https://github.com/okias/linux/tree/qcom-apq8064-v5.10
Best regards
David Heidelberg


